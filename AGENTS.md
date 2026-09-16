# AGENTS.md

Router for agents working in or with this handbook. Prefer the linked file over expanding rules here.

## Standing guides

| Guide                                                          | One line                                                                                |
| -------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| [guides/writing-style.md](./guides/writing-style.md)           | Tone, agent EN / human KO, show-don't-narrate, no hard wrap                             |
| [guides/prompting.md](./guides/prompting.md)                   | Claude + OpenAI GPT-5.6 Sol / GPT-6 Astra checklist; mirrors in `references/prompting/` |
| [guides/react-code-style.md](./guides/react-code-style.md)     | Seven portable React/TS rules                                                           |
| [guides/commit-conventions.md](./guides/commit-conventions.md) | Atomic Conventional Commits; delivery; push policy                                      |
| [guides/formatting.md](./guides/formatting.md)                 | prek + oxfmt pre-commit; Cursor afterFileEdit hook                                      |

## Skills

| Skill                                                                | One line                                               |
| -------------------------------------------------------------------- | ------------------------------------------------------ |
| [skills/write-for-human/SKILL.md](./skills/write-for-human/SKILL.md) | Human-facing docs — conclusion first, smallest view    |
| [skills/settle-spec/SKILL.md](./skills/settle-spec/SKILL.md)         | Lock spec with user → `brief.md`                       |
| [skills/planner/SKILL.md](./skills/planner/SKILL.md)                 | `plan.md` + `tasks.md`; one purpose/PR; ≤5 files/slice |

## Imperatives (duplicate on purpose)

1. No hard wrapping for column width.
2. Write plainly — no mannered prose.
3. Show structure; do not narrate it.
4. Korean for human decision docs; English for agent canons; derived files carry no new facts.
5. Before commit: run prek/oxfmt on in-scope paths — [guides/formatting.md](./guides/formatting.md).
