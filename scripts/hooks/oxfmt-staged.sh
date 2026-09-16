#!/usr/bin/env bash
# prek local hook entry: format staged paths with repo-root oxfmt.
set -euo pipefail
ROOT="$(git rev-parse --show-toplevel)"
cd "$ROOT"
if [[ ! -d node_modules/oxfmt ]]; then
  echo "oxfmt: run 'pnpm install' at repo root first" >&2
  exit 1
fi
if [[ "$#" -eq 0 ]]; then
  exit 0
fi
pnpm exec oxfmt --no-error-on-unmatched-pattern "$@"
