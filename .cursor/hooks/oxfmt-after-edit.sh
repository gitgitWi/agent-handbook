#!/usr/bin/env bash
# Cursor afterFileEdit: format supported files with repo oxfmt (best-effort).
set -euo pipefail
ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$ROOT"
INPUT=$(cat)
FILE=$(echo "$INPUT" | python3 -c "
import json, sys
d = json.load(sys.stdin)
for k in ('file_path', 'filePath', 'path'):
    v = d.get(k) or (d.get('payload') or {}).get(k)
    if v:
        print(v)
        break
" 2>/dev/null || true)
if [[ -z "$FILE" ]]; then
  exit 0
fi
case "$FILE" in
  */node_modules/* | references/* | */skills/write-for-human/templates/*) exit 0 ;;
esac
case "$FILE" in
  *.ts | *.tsx | *.js | *.jsx | *.json | *.jsonc | *.md | *.yaml | *.yml | *.toml | *.css | *.html) ;;
  *) exit 0 ;;
esac
if [[ ! -d node_modules/oxfmt ]]; then
  exit 0
fi
ABS="$ROOT/${FILE#./}"
if [[ -f "$ABS" ]]; then
  pnpm exec oxfmt --no-error-on-unmatched-pattern "$ABS" 2>/dev/null || true
fi
exit 0
