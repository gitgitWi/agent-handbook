---
title: Commit conventions
when_to_read: ending a work unit, writing a commit message, or deciding whether to push
summary:
  - End each logical work unit with a commit; messages describe the change directly
  - Conventional Commits — type(scope): Korean subject; portable type table for code repos
  - Agent hygiene — check gh auth; leave a clean tree; push per the project delivery rule
---

# Commit conventions

## Delivery

- End each logical work unit with a `commit`.
- Commit messages describe the change directly — what changed and why, not a diary of steps.
- Do not leave work that must reach the remote as local-only when the project expects a push.
- **This handbook repo** (`agent-handbook`): maintainers push freely once `origin` is set. **Other projects**: follow that repo's delivery rule; if unclear, ask once.

## Conventional Commits

Format: [`Conventional Commits`](https://www.conventionalcommits.org/) — `<type>(optional scope): short subject` plus a body when needed.

| type | when |
| --- | --- |
| **feat** | new user-facing capability or skill/guide the handbook did not have |
| **fix** | bug fix or correction of wrong fact / broken link |
| **docs** | documentation, guides, README, agent-facing skill text |
| **chore** | tooling, meta, mechanical repo maintenance unrelated to doc meaning |
| **refactor** | structure change with the same meaning (rare for docs) |
| **test** | tests only |
| **ci** | CI config only |

Scope is optional. Prefer a short path or area (`guides`, `skills`, `readme`) when it helps history filters.

### Language

- **type** and **scope**: English Conventional Commits tokens.
- **subject** and **body**: Korean for human-facing delivery text (align with [writing-style.md](./writing-style.md)).
- One subject line; no hard wrap in the body for column width.

### Atomic commits

One logical unit per commit. Prefer splitting a mixed change into several commits over one fat commit that mixes unrelated concerns.

## Agent hygiene

- Before `gh` calls, check which account is active (`gh auth status`).
- After work: clean working tree intent — commit finished units; push when the project's delivery rule says so.
- Do not skip hooks (`--no-verify`) or force-push to `main` / `master` unless the user explicitly requests it.
- Do not amend a commit that was already pushed unless the user explicitly requests it and the branch is safe to rewrite.

## References

- [Conventional Commits](https://www.conventionalcommits.org/).
- Adapted from personal GitHub workflow rules (est-work `rules/github-workflow.md`, Delivery Rule through Agent Rule) — account-switching and always-push-without-asking stripped for portable use.
