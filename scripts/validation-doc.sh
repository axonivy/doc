#!/usr/bin/env bash
set -euo pipefail

catalog=target/validation-issue-catalog/validation-issue-catalog.json
validationRst=source/reference/validation
detail_template=$(< "$validationRst/_detail.rst")
codeIds=()
mkdir -p "$validationRst/codes"

overview() {
  jq -r '
    .validators[] |
    ((.id[0:1] | ascii_upcase) + .id[1:]) as $title |
    $title,
    ("-" * ([6, ($title | length)] | max)),
    (.codes[] | "- :doc:`\(.id) <codes/\(.id)>`"),
    ""
  ' "$catalog"
}

details() {
  while IFS= read -r code; do
    detail \
      "$(jq -r '.id' <<< "$code")" \
      "$(jq -r '.template | gsub("[\\r\\n\\t]"; " ")' <<< "$code")"
  done < <(jq -c '.validators[].codes[]' "$catalog")
}

detail() {
  local code_id=$1
  local code_template=$2
  local detail_file="$validationRst/codes/$code_id.rst"
  local heading_underline

  printf -v heading_underline '%*s' "${#code_id}" ''
  heading_underline=${heading_underline// /-}
  codeIds+=("$code_id")
  manual_doc=$(manualContent "$detail_file")
  detail=${detail_template//__CODE_ID__/"$code_id"}
  detail=${detail//__CODE_ID_UNDERLINE__/"$heading_underline"}
  detail=${detail//__CODE_TEMPLATE__/"$code_template"}
  printf '%s\n%s\n' "$detail" "$manual_doc" > "$detail_file"
}

manualContent() {
  local detail_file="$1"
  if [[ -f $detail_file ]]; then
    awk '/.. start: manual doc/ {flag=1; next} flag' "$detail_file"
  else
    echo ""
  fi
}

remove() {
  local file file_name file_id

  for file in "$validationRst"/codes/*; do
    file_name=${file##*/}
    file_id=${file_name%.rst}

    if [[ " ${codeIds[*]} " != *" $file_id "* ]]; then
      echo "removing orphan $file"
      rm -- "$file"
    fi
  done
}

overview | tee "$validationRst/_overview.rst"
details
remove
