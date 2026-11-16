#!/usr/bin/env bats

setup() {
  script="$BATS_TEST_DIRNAME/update-validation-reference.sh"
  catalog="$BATS_TEST_TMPDIR/catalog.json"
  docs="$BATS_TEST_TMPDIR/validation docs"
  mkdir -p "$docs"
  jq -n '{
    validators: [{
      id: "database",
      codes: [{id: "ivy.database.key.invalid", template: "Invalid ${key}."}]
    }]
  }' > "$catalog"
}

rewrite_catalog() {
  jq "$1" "$catalog" > "$BATS_TEST_TMPDIR/catalog.next"
  mv "$BATS_TEST_TMPDIR/catalog.next" "$catalog"
}

write_page() {
  mkdir -p "$(dirname "$docs/$1")"
  cat > "$docs/$1"
}

@test "creates code pages and rebuilds overviews and navigation" {
  rewrite_catalog '.validators[0].codes += [
    {id: "ivy.database.missing", template: "Missing connection."}
  ] | .validators += [
    {id: "java-index", codes: []},
    {id: "form", codes: [{id: "ivy.form.invalid", template: "Invalid form."}]},
    {id: "empty", codes: []}
  ]'
  write_page database.rst <<< "Outdated overview"

  run bash "$script" "$catalog" "$docs"

  [ "$status" -eq 0 ]
  diff -u - "$docs/database/key/invalid.rst" <<'RST'
:orphan:

.. _validation-code-ivy--database--key--invalid:

ivy.database.key.invalid
------------------------

**Message:** Invalid ${key}.
RST
  diff -u - "$docs/database.rst" <<'RST'
:orphan:

Database
========

* :doc:`ivy.database.key.invalid <database/key/invalid>`
* :doc:`ivy.database.missing <database/missing>`
RST
  grep -Fx '**Message:** Missing connection.' "$docs/database/missing.rst"
  grep -Fx '**Message:** Invalid form.' "$docs/form/invalid.rst"
  diff -u - "$docs/empty.rst" <<'RST'
:orphan:

Empty
=====

RST
  diff -u - "$docs/index.rst" <<'RST'
:orphan:

Validation
==========

.. toctree::
   :maxdepth: 1
   :includehidden:

   java-index
   database
   form
   empty
RST
}

@test "replaces only the Message line and preserves literal template text and permissions" {
  rewrite_catalog '.validators[0].codes[0].template = "Updated ${key}\nwith\ttabs\r& literal \\path."'
  write_page database/key/invalid.rst <<'RST'
Custom title
============

**Message:** Old message

Handwritten explanation.
RST
  chmod 640 "$docs/database/key/invalid.rst"

  run bash "$script" "$catalog" "$docs"

  [ "$status" -eq 0 ]
  diff -u - "$docs/database/key/invalid.rst" <<'RST'
Custom title
============

**Message:** Updated ${key} with tabs & literal \path.

Handwritten explanation.
RST
  [ "$(stat -c '%a' "$docs/database/key/invalid.rst")" = 640 ]
}

@test "removes stale generated pages but preserves current pages and handwritten documentation" {
  write_page removed/nested/old.rst <<< '.. _validation-code-ivy--removed--nested--old:'
  write_page removed.rst <<< 'Outdated overview'
  write_page database/guide.rst <<< 'Handwritten guide'
  write_page java-index/manual.rst <<< '.. _validation-code-ivy--java-index--manual:'
  write_page java-index.rst <<< 'Java index overview'
  write_page database/notes.txt <<< 'Notes'

  run bash "$script" "$catalog" "$docs/"

  [ "$status" -eq 0 ]
  [ ! -e "$docs/removed/nested/old.rst" ]
  [ ! -e "$docs/removed.rst" ]
  [ -f "$docs/database/key/invalid.rst" ]
  grep -Fx 'Handwritten guide' "$docs/database/guide.rst"
  grep -Fx '.. _validation-code-ivy--java-index--manual:' "$docs/java-index/manual.rst"
  grep -Fx 'Java index overview' "$docs/java-index.rst"
  grep -Fx 'Notes' "$docs/database/notes.txt"
}

@test "a second run leaves unchanged code pages untouched" {
  run bash "$script" "$catalog" "$docs"
  [ "$status" -eq 0 ]
  local page="$docs/database/key/invalid.rst"
  local before
  before=$(stat -c '%a:%i:%y' "$page")
  cp "$page" "$BATS_TEST_TMPDIR/original.rst"

  run bash "$script" "$catalog" "$docs"

  [ "$status" -eq 0 ]
  cmp "$BATS_TEST_TMPDIR/original.rst" "$page"
  [ "$(stat -c '%a:%i:%y' "$page")" = "$before" ]
}

@test "an empty catalog clears stale pages and rebuilds an empty index" {
  rewrite_catalog '.validators = []'
  write_page database/old.rst <<< '.. _validation-code-ivy--database--old:'
  write_page database.rst <<< 'Old overview'

  run bash "$script" "$catalog" "$docs"

  [ "$status" -eq 0 ]
  [ ! -e "$docs/database/old.rst" ]
  [ ! -e "$docs/database.rst" ]
  diff -u - "$docs/index.rst" <<'RST'
:orphan:

Validation
==========

.. toctree::
   :maxdepth: 1
   :includehidden:

RST
}

@test "missing or duplicate Message lines fail without modifying the page or leaving temporary files" {
  local content
  for content in 'Handwritten content' $'**Message:** One\n**Message:** Two'; do
    write_page database/key/invalid.rst <<< "$content"
    cp "$docs/database/key/invalid.rst" "$BATS_TEST_TMPDIR/original.rst"

    run bash "$script" "$catalog" "$docs"

    [ "$status" -ne 0 ]
    [[ "$output" == *'Expected exactly one **Message:** line'* ]]
    cmp "$BATS_TEST_TMPDIR/original.rst" "$docs/database/key/invalid.rst"
    [ -z "$(find "$docs" -type f -name '*.rst.*' -print)" ]
  done
}

@test "invalid IDs and duplicate records fail before stale-page cleanup" {
  write_page old/stale.rst <<< '.. _validation-code-ivy--old--stale:'
  cp "$catalog" "$BATS_TEST_TMPDIR/original.json"
  local change
  for change in \
    '.validators[0].id = "../escape"' \
    '.validators[0].codes[0].id = "ivy.role.invalid"' \
    '.validators[0].codes[0].id = "ivy.database../invalid"' \
    '.validators[0].codes += .validators[0].codes' \
    '.validators += .validators'; do
    jq "$change" "$BATS_TEST_TMPDIR/original.json" > "$catalog"

    run bash "$script" "$catalog" "$docs"

    [ "$status" -ne 0 ]
    [[ "$output" == *Invalid* || "$output" == *Duplicate* ]]
    [ -f "$docs/old/stale.rst" ]
  done
}
