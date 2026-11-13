#!/usr/bin/env bash
set -euo pipefail

readonly documentation_repository=axonivy/doc
readonly validation_catalog=target/validation-issue-catalog/validation-issue-catalog.json
readonly validation_directory=source/reference/validation
readonly pull_request_body='Generated validation overviews and code pages from the core validation catalog.'

validation_reference_branch() {
  local base_branch=$1
  local safe_base=${base_branch//[^A-Za-z0-9._-]/-}
  printf 'validation-reference-%s\n' "$safe_base"
}

configure_github_remote() {
  if ! git remote add github git@github.com:axonivy/doc.git; then
    git remote set-url github git@github.com:axonivy/doc.git
  fi
}

fetch_base_branch() {
  local base_branch=$1
  git fetch github "+refs/heads/${base_branch}:refs/remotes/github/${base_branch}"
}

prepare_update_branch() {
  local base_branch=$1
  local update_branch=$2

  if git ls-remote --exit-code --heads github "$update_branch" >/dev/null 2>&1; then
    git fetch github "+refs/heads/${update_branch}:refs/remotes/github/${update_branch}"
    git checkout -B "$update_branch" "refs/remotes/github/$update_branch"
    git merge --no-edit "refs/remotes/github/$base_branch"
  else
    local remote_status=$?
    if [[ $remote_status -ne 2 ]]; then
      return "$remote_status"
    fi
    git checkout -B "$update_branch" "refs/remotes/github/$base_branch"
  fi
}

update_validation_docs() {
  bash tools/update-validation-reference.sh "$validation_catalog" "$validation_directory"
  git add "$validation_directory"
}

apply_pull_request_change() {
  local pull_request=$1
  local base_branch=$2
  local update_branch=$3
  local title=$4

  if [[ -n $pull_request ]]; then
    gh pr edit "$pull_request" --repo "$documentation_repository" --title "$title" --body "$pull_request_body"
  else
    gh pr create --repo "$documentation_repository" --base "$base_branch" --head "$update_branch" --title "$title" --body "$pull_request_body"
  fi
}

update_or_create_pull_request() {
  local base_branch=$1
  local update_branch=$2
  local title=$3
  local pull_request

  pull_request=$(gh pr list --repo "$documentation_repository" --base "$base_branch" --head "axonivy:$update_branch" --state open --json number --jq '.[0].number // empty')
  apply_pull_request_change "$pull_request" "$base_branch" "$update_branch" "$title"
}

main() {
  if [[ $# -ne 2 ]]; then
    printf 'Usage: %s <base-branch> <github-token-file>\n' "$0" >&2
    return 2
  fi

  local base_branch=$1
  local token_file=$2
  local update_branch
  local title="Update validation reference for ${base_branch}"
  local staged_status
  update_branch=$(validation_reference_branch "$base_branch")

  git config user.name 'ivy-team'
  git config user.email 'info@ivyteam.ch'
  configure_github_remote
  fetch_base_branch "$base_branch"
  prepare_update_branch "$base_branch" "$update_branch"
  update_validation_docs

  if git diff --cached --quiet; then
    printf 'Validation reference is already up to date\n'
    return 0
  else
    staged_status=$?
    if [[ $staged_status -ne 1 ]]; then
      printf 'git diff --cached failed with status %s\n' "$staged_status" >&2
      return "$staged_status"
    fi
  fi

  git commit -m "$title"
  git push -u github "$update_branch"
  gh auth login --with-token < "$token_file"
  update_or_create_pull_request "$base_branch" "$update_branch" "$title"
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
  main "$@"
fi