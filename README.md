# agent-handbook

Personal handbook for how I work with coding agents: **skills** (invokable workflows) and **guides** (standing rules). Not a mirror of popular skill packs — practices abstracted from real use, adapted to fit how I work, and published so others can see the method.

Companion (non-public): [agent-handbook-private](https://github.com/gitgitWi/agent-handbook-private).

## Pipeline (partial)

```text
settle-spec  →  planner  →  (plan-review → re-plan)*  →  develop …
                 ▲ shipped here          ▲ follow-up (workflows TBD)
```

## Install

Clone, then point your agent at the skills (and optionally the guides):

```bash
git clone https://github.com/gitgitWi/agent-handbook.git ~/Codes/agent-handbook
```

Examples:

- Cursor: symlink or copy `skills/*` into `~/.cursor/skills/` or a project's `.cursor/skills/` / `.agents/skills/`
- Claude Code / Codex: add the repo or individual skill paths per that harness's skill/plugin docs

Guides are ordinary markdown — link them from `AGENTS.md` / `CLAUDE.md` in a consumer project, or read by path.

## Skills

| Skill | When |
| --- | --- |
| [write-for-human](./skills/write-for-human/SKILL.md) | Document a person will read and act on |
| [settle-spec](./skills/settle-spec/SKILL.md) | Lock requirements / Done-when before planning |
| [planner](./skills/planner/SKILL.md) | `plan.md` + `tasks.md` from a settled brief |

## Guides

| Guide | When |
| --- | --- |
| [prompting](./guides/prompting.md) | Dispatch prompts / executor shape |
| [writing-style](./guides/writing-style.md) | Tone, language split, show-don't-narrate |
| [react-code-style](./guides/react-code-style.md) | Portable React/TS style rules |
| [commit-conventions](./guides/commit-conventions.md) | Atomic Conventional Commits + delivery |

Router for agents in this repo: [AGENTS.md](./AGENTS.md).

## Maintainers

This repository: push freely after commits ([commit-conventions](./guides/commit-conventions.md)). Prefer atomic Conventional Commits with Korean subjects.

## License

[MIT](./LICENSE)

## References (high level)

- [humanlayer show-me](https://raw.githubusercontent.com/humanlayer/skills/refs/heads/main/plugins/show-me/skills/show-me/SKILL.md) → `write-for-human` views
- [mattpocock grilling](https://raw.githubusercontent.com/mattpocock/skills/refs/heads/main/skills/productivity/grilling/SKILL.md) / [to-spec](https://github.com/mattpocock/skills) → `settle-spec`
- [obra/superpowers](https://github.com/obra/superpowers) brainstorming → nod in `settle-spec`
- Personal est-work playbook planner + orchestrator §1 → `planner`
- Anthropic Claude prompting docs → `guides/prompting.md`

Each skill/guide lists what was taken in its own References section.
