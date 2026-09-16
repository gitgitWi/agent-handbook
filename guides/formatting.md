---
title: Formatting — oxfmt + prek
when_to_read: before first commit in this repo; when hooks fail or oxfmt is missing
summary:
  - prek (Rust) installs pre-commit; oxfmt formats staged files — not Husky
  - Scope — skills/, guides/, AGENTS.md, README.md, .cursor/; excludes references/ and Korean templates
  - Cursor afterFileEdit hook mirrors scope (best-effort)
---

# Formatting — oxfmt + prek

Pre-commit formatting uses **oxfmt** (Oxc). Git hooks use **prek** ([j178/prek](https://github.com/j178/prek)) — a Rust binary, compatible with [pre-commit.com](https://pre-commit.com/) configs, not Husky.

Same pattern as [gitgitWi/career](https://github.com/gitgitWi/career) `agents/guides/formatting.md` (paths adjusted for this repo).

## Why prek (not lefthook / Husky)

| Tool     | Notes                                                                     |
| -------- | ------------------------------------------------------------------------- |
| **prek** | Rust, single binary, `.pre-commit-config.yaml`, fast vs Python pre-commit |
| lefthook | Go, `lefthook.yml` — fine, but not Rust; different config                 |
| Husky    | Node lifecycle — avoided here                                             |

## Scope

| Path                                                                    | Formatted on commit                             |
| ----------------------------------------------------------------------- | ----------------------------------------------- |
| `skills/**` (except `write-for-human/templates/`)                       | yes                                             |
| `guides/**`, `AGENTS.md`, `README.md`, `.cursor/**`, `scripts/hooks/**` | yes                                             |
| `references/prompting/**`                                               | no — upstream verbatim mirrors                  |
| `skills/write-for-human/templates/**`                                   | no — Korean human templates; avoid table reflow |

No application code in this repo yet; add paths to `.pre-commit-config.yaml` and `pnpm fmt` when TS/JS lands outside `skills/`.

## One-time setup

```bash
cd ~/Codes/agent-handbook   # or your clone path

# prek — pick one
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/j178/prek/releases/latest/download/prek-installer.sh | sh
# brew install prek
# uv tool install prek

pnpm install
prek install --install-hooks
```

Put `~/.local/bin` on `PATH` before `pnpm install` if you rely on the `prepare` script in `package.json`.

## Daily use

```bash
pnpm fmt
pnpm fmt:check
prek run oxfmt --all-files
git commit    # pre-commit runs oxfmt on staged in-scope files
```

Skip once: `git commit --no-verify` (avoid unless intentional).

## Cursor

Project [`.cursor/hooks.json`](../.cursor/hooks.json) runs [oxfmt-after-edit.sh](../.cursor/hooks/oxfmt-after-edit.sh) on `afterFileEdit` (`Write` / `TabWrite`). Best-effort; does not replace pre-commit.

Reload Cursor or reopen the workspace after pulling hook changes.

## Config files

| File                                                                | Role                       |
| ------------------------------------------------------------------- | -------------------------- |
| [`.oxfmtrc.jsonc`](../.oxfmtrc.jsonc)                               | ignorePatterns, printWidth |
| [`.pre-commit-config.yaml`](../.pre-commit-config.yaml)             | prek hook definition       |
| [`scripts/hooks/oxfmt-staged.sh`](../scripts/hooks/oxfmt-staged.sh) | pre-commit entry           |

## Consumer repos (e.g. career)

Copy the pattern: root `package.json`, `.oxfmtrc.jsonc`, `.pre-commit-config.yaml`, `scripts/hooks/`, `.cursor/hooks*`. Tune `ignorePatterns` and `files:` regex for human-language trees (`base/`, `applications/`, etc.).
