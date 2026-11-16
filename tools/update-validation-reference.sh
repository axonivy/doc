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

declare -A written_pages=([index.rst]=1)

update_validator_documentation() {
  local validator_id
  validator_id=$(jq -r '.id' <<< "$1")

  [[ $validator_id =~ ^[a-z][a-z0-9-]*$ ]] || {
    printf 'Invalid validator id in catalog: %s\n' "$validator_id" >&2
    exit 1
  }
  local page=$validator_id.rst
  if [[ -v written_pages["$page"] ]]; then
    printf 'Duplicate validation page in catalog: %s\n' "$page" >&2
    exit 1
  fi

  local code_record validation_code
  while IFS= read -r code_record; do
    validation_code=$(jq -r '.id' <<< "$code_record")
    [[ $validation_code == "ivy.$validator_id."* ]] || {
      printf 'Invalid validation code in catalog: %s (does not belong to validator %s)\n' "$validation_code" "$validator_id" >&2
      return 1
    }
    create_or_update_code_page "$code_record"
  done < <(jq -c '.codes[]' <<< "$1")

  write_validator_overview "$1"
  printf '   %s\n' "$validator_id" >> "$validation_root/index.rst"
  written_pages["$page"]=1
}

write_validator_overview() {
  local validator_id
  validator_id=$(jq -r '.id' <<< "$1")
  local title=${validator_id^}
  # Overviews are fully generated; handwritten additions belong in individual code pages.
  {
    printf ':orphan:\n\n%s\n%s\n\n' "$title" "$(printf '%s' "$title" | sed 's/./=/g')"
    jq -r '.codes[] | "* :doc:`\(.id) <\(.id | ltrimstr("ivy.") | split(".") | join("/"))>`"' <<< "$1"
  } > "$validation_root/$validator_id.rst"
}

create_or_update_code_page() {
  local -a fields
  mapfile -t fields < <(jq -r '.id, (.template | gsub("[\\r\\n\\t]"; " "))' <<< "$1")
  local validation_code=${fields[0]}
  local message_template=${fields[1]}

  [[ $validation_code =~ ^ivy\.[a-z][a-z0-9-]*(\.[a-z][a-z0-9-]*)+$ ]] || {
    printf 'Invalid validation code in catalog: %s\n' "$validation_code" >&2
    exit 1
  }

  local relative=${validation_code#ivy.}
  local page=${relative//./\/}.rst
  if [[ -v written_pages["$page"] ]]; then
    printf 'Duplicate validation page in catalog: %s\n' "$page" >&2
    exit 1
  fi

  local destination=$validation_root/$page
  if [[ ! -e $destination ]]; then
    local anchor=${validation_code//./--}
    mkdir -p "$(dirname "$destination")"
    printf ':orphan:\n\n.. _validation-code-%s:\n\n%s\n%s\n\n**Message:** %s\n' \
      "$anchor" "$validation_code" "$(printf '%s' "$validation_code" | sed 's/./-/g')" "$message_template" > "$destination"
  else
    # Replace only the Message line, preserving handwritten content around it.
    local temporary
    temporary=$(mktemp "${destination}.XXXXXX")
    # An environment variable keeps backslashes in the template literal.
    if ! MESSAGE=$message_template awk '
      /^\*\*Message:\*\*/ {
        count++
        print "**Message:** " ENVIRON["MESSAGE"]
        next
      }
      { print }
      END {
        if (count != 1) {
          printf "Expected exactly one **Message:** line in %s, found %d\n", FILENAME, count > "/dev/stderr"
          exit 1
        }
      }
    ' "$destination" > "$temporary"; then
      rm -f -- "$temporary"
      return 1
    fi
    chmod --reference="$destination" "$temporary"
    if cmp -s "$destination" "$temporary"; then
      rm -f -- "$temporary"
    else
      mv -- "$temporary" "$destination"
    fi
  fi
  written_pages["$page"]=1
}

remove_stale_generated_pages() {
  local existing_page relative_page
  while IFS= read -r -d '' existing_page; do
    relative_page=${existing_page#"$validation_root"}
    relative_page=${relative_page#/}
    if [[ -v written_pages["$relative_page"] || $relative_page == java-index.rst || $relative_page == java-index/* ]]; then
      continue
    fi
    if [[ $relative_page == */* ]]; then
      # Only generated sub-pages carry this anchor; leave handwritten pages alone.
      grep -q '^\.\. _validation-code-ivy--' "$existing_page" || continue
    fi
    rm -- "$existing_page"
  done < <(find "$validation_root" -type f -name '*.rst' -print0)
}

printf ':orphan:\n\nValidation\n==========\n\n.. toctree::\n   :maxdepth: 1\n   :includehidden:\n\n' > "$validation_root/index.rst"

while IFS= read -r validator_record; do
  update_validator_documentation "$validator_record"
done < <(jq -c '.validators | sort_by(.id != "java-index")[]' "$catalog")

remove_stale_generated_pages