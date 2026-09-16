# agent-handbook

Personal handbook for how I work with coding agents: **skills** (invokable workflows) and **guides** (standing rules). Not a mirror of popular skill packs — practices abstracted from real use, adapted to fit how I work, and published so others can see the method.

Companion (non-public): [agent-handbook-private](https://github.com/gitgitWi/agent-handbook-private).

## Pipeline (partial)

```text
settle-spec  →  planner  →  (plan-review → re-plan)*  →  develop …
                 ▲ shipped here          ▲ follow-up (workflows TBD)
```

## Install

Clone, then use the skills already wired for this repo:

```bash
git clone https://github.com/gitgitWi/agent-handbook.git ~/Codes/agent-handbook
```

In this repository:

- Canonical skill bodies: `skills/<name>/`
- Codex / agents path: `.agents/skills/<name>` → symlink to `skills/<name>`
- Claude Code path: `.claude/skills/<name>` → symlink to `.agents/skills/<name>`

For other projects: symlink or copy `skills/*` into that project's `.agents/skills/` / `.claude/skills/` / `~/.cursor/skills/` as the harness expects.

Guides are ordinary markdown — link them from `AGENTS.md` / `CLAUDE.md`, or read by path. Upstream prompting guides (verbatim): [references/prompting/](./references/prompting/README.md).

## Skills


| Skill                                                | When                                          |
| ---------------------------------------------------- | --------------------------------------------- |
| [write-for-human](./skills/write-for-human/SKILL.md) | Document a person will read and act on        |
| [settle-spec](./skills/settle-spec/SKILL.md)         | Lock requirements / Done-when before planning |
| [planner](./skills/planner/SKILL.md)                 | `plan.md` + `tasks.md` from a settled brief   |




## Guides


| Guide                                                | When                                     |
| ---------------------------------------------------- | ---------------------------------------- |
| [prompting](./guides/prompting.md)                   | Claude + OpenAI GPT-5.6 checklist        |
| [writing-style](./guides/writing-style.md)           | Tone, language split, show-don't-narrate |
| [react-code-style](./guides/react-code-style.md)     | Portable React/TS style rules            |
| [commit-conventions](./guides/commit-conventions.md) | Atomic Conventional Commits + delivery   |


Router for agents in this repo: [AGENTS.md](./AGENTS.md).

## License

[MIT](./LICENSE)

## References (high level)

- [humanlayer show-me](https://raw.githubusercontent.com/humanlayer/skills/refs/heads/main/plugins/show-me/skills/show-me/SKILL.md) → `write-for-human` views
- [mattpocock grilling](https://raw.githubusercontent.com/mattpocock/skills/refs/heads/main/skills/productivity/grilling/SKILL.md) / [to-spec](https://github.com/mattpocock/skills) → `settle-spec`
- [obra/superpowers](https://github.com/obra/superpowers) brainstorming → nod in `settle-spec`
- Personal est-work playbook planner + orchestrator §1 → `planner`
- Anthropic Claude prompting docs → `guides/prompting.md`

Each skill/guide lists what was taken in its own References section.