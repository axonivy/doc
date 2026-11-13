#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
  printf 'Usage: %s <catalog.json> <validation-docs-directory>\n' "$0" >&2
  exit 2
fi

catalog=$1
validation_root=$2

if ! command -v jq >/dev/null 2>&1; then
  printf 'jq is required to update the validation reference\n' >&2
  exit 1
fi

jq -e '
  (.validators | type == "array") and
  all(.validators[]; (.id | type == "string") and (.codes | type == "array") and
    all(.codes[]; (.id | type == "string") and (.template | type == "string")))
' "$catalog" >/dev/null

mkdir -p "$validation_root"

declare -A desired_codes=()
declare -A desired_pages=()
declare -A templates_by_page=()

register_catalog_code() {
  local validator_id=$1
  local validation_code=$2
  local message_template=$3

  [[ $validator_id =~ ^[a-z][a-z0-9-]*$ ]] || {
    printf 'Invalid validator id in catalog: %s\n' "$validator_id" >&2
    exit 1
  }
  [[ $validation_code == "ivy.$validator_id."* && $validation_code =~ ^ivy\.[a-z][a-z0-9-]*(\.[a-z][a-z0-9-]*)+$ ]] || {
    printf 'Invalid validation code in catalog: %s\n' "$validation_code" >&2
    exit 1
  }

  local relative=${validation_code#ivy.}
  local page=${relative//./\/}.rst
  if [[ -v desired_pages["$page"] ]]; then
    printf 'Duplicate validation page in catalog: %s\n' "$page" >&2
    exit 1
  fi
  desired_codes["$validation_code"]=1
  desired_pages["$page"]=1
  templates_by_page["$page"]=$message_template
}

while IFS= read -r -d '' validator_id && IFS= read -r -d '' validation_code && IFS= read -r -d '' message_template; do
  register_catalog_code "$validator_id" "$validation_code" "$message_template"
done < <(jq -j '.validators[] as $validator | $validator.codes[] | "\($validator.id)\u0000\(.id)\u0000\(.template | gsub("[\\r\\n\\t]"; " "))\u0000"' "$catalog")

create_missing_pages() {
  for page in "${!desired_pages[@]}"; do
    destination=$validation_root/$page
    [[ -e $destination ]] && continue

    code=ivy.${page%.rst}
    code=${code//\//.}
    anchor=${code//./--}
    mkdir -p "$(dirname "$destination")"
    printf ':orphan:\n\n.. _validation-code-%s:\n\n%s\n%s\n\n**Message:** %s\n' \
      "$anchor" "$code" "$(printf '%s' "$code" | sed 's/./-/g')" "${templates_by_page["$page"]}" > "$destination"
  done
}

remove_stale_pages() {
  while IFS= read -r -d '' page; do
    relative=${page#"$validation_root"/}
    [[ $relative == java-index/* ]] && continue

    code=ivy.${relative%.rst}
    code=${code//\//.}
    grep -q '^\.\. _validation-code-ivy--' "$page" || continue
    if [[ ! -v desired_codes["$code"] ]]; then
      rm -- "$page"
    fi
  done < <(find "$validation_root" -mindepth 2 -type f -name '*.rst' -print0)
}

update_templates() {
  for page in "${!desired_pages[@]}"; do
    destination=$validation_root/$page
    message_count=$(grep -c '^\*\*Message:\*\*' "$destination" || true)
    if [[ $message_count -ne 1 ]]; then
      printf 'Expected exactly one **Message:** line in %s, found %s\n' "$destination" "$message_count" >&2
      return 1
    fi

    temporary=$(mktemp "${destination}.XXXXXX")
    if ! MESSAGE=${templates_by_page["$page"]} awk '
      /^\*\*Message:\*\*/ {
        count++
        print "**Message:** " ENVIRON["MESSAGE"]
        next
      }
      { print }
      END { if (count != 1) exit 1 }
    ' "$destination" > "$temporary"; then
      rm -f -- "$temporary"
      printf 'Could not update **Message:** line in %s\n' "$destination" >&2
      return 1
    fi
    chmod --reference="$destination" "$temporary"
    if cmp -s "$destination" "$temporary"; then
      rm -f -- "$temporary"
    else
      mv -- "$temporary" "$destination"
    fi
  done
}

generate_overviews() {
  while IFS= read -r validator_id; do
    title=${validator_id^}
    overview=$validation_root/$validator_id.rst
    {
      printf ':orphan:\n\n%s\n%s\n\n' "$title" "$(printf '%s' "$title" | sed 's/./=/g')"
      jq -r --arg id "$validator_id" '.validators[] | select(.id == $id) | .codes[].id' "$catalog" |
        while IFS= read -r code; do
          relative=${code#ivy.}
          printf '* :doc:`%s <%s>`\n' "$code" "${relative//./\/}"
        done
    } > "$overview"
  done < <(jq -r '.validators[].id' "$catalog")

  for overview in "$validation_root"/*.rst; do
    [[ -e $overview ]] || continue
    name=${overview##*/}
    [[ $name == index.rst || $name == java-index.rst ]] && continue
    validator_id=${name%.rst}
    if ! jq -e --arg id "$validator_id" '.validators | any(.id == $id)' "$catalog" >/dev/null; then
      rm -- "$overview"
    fi
  done

  {
    printf ':orphan:\n\nValidation\n==========\n\n.. toctree::\n   :maxdepth: 1\n   :includehidden:\n\n'
    if jq -e '.validators | any(.id == "java-index")' "$catalog" >/dev/null; then
      printf '   java-index\n'
    fi
    jq -r '.validators[].id | select(. != "java-index") | "   " + .' "$catalog"
  } > "$validation_root/index.rst"
}

create_missing_pages
remove_stale_pages
update_templates
generate_overviews