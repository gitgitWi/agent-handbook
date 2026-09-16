---
name: settle-spec
description: >-
  Lock requirements and acceptance criteria with the user before planning. Rewrites
  the ask into an executor-shaped draft, looks up facts itself, grills the user in
  rounds (each question with a recommended answer), settles scope in Korean brief-ko.md,
  then writes English brief.md as the agent-facing canon. Use when the user says
  settle spec, brief me, grill, 의도 확인해줘, or starts a non-trivial change without a settled brief.
when_to_read: before planner; when scope or Done-when is fuzzy
summary:
  - Facts are the agent's job; decisions are the user's — design-tree grilling rounds
  - brief-ko.md first (human); after confirm, brief.md canon (English) for planner
  - Done when must be deterministic; optional size hint S|M|L by shape
---

# settle-spec — lock requirements before planning

**Who runs this.** The interactive agent that received the user's ask. Not the planner — the planner reads `brief.md` this produces.

**What it does not contain.** Implementation plans, slice trees, or workflow orchestration. Those are `planner` (and later workflow skills).

English to agents, Korean to the user — [guides/writing-style.md](../../guides/writing-style.md). Prompt shape — [guides/prompting.md](../../guides/prompting.md).

## 0. Task directory

Use `$TASK_DIR` if the caller already set one. Otherwise ask once for where to write artifacts, then use that path for all files in this skill.

```text
$TASK_DIR/
  brief-ko.md    # human intake (first)
  brief.md       # agent canon (after confirm)
```

## 1. Rewrite the ask as the executor prompt — draft, keep private until §4

Apply the prompting checklist for the tier that will run the work. Fixed shape:

```text
GOAL        one sentence, the observable outcome
CONTEXT     paths, issue/PR numbers, base ref — pointers, never pasted content
CONSTRAINTS what must not change; language rules; no hard wrapping; write plainly
OUTPUT      exact shape and length of what comes back
DONE WHEN   deterministic checks only
```

A gap you can fill from the environment → §2. A gap only the user can fill → §3. Do not show this rewrite to the user yet; discuss `brief-ko.md` first.

## 2. Facts are yours, decisions are the user's

Never ask the user something you can look up. Fan out cheap fact-finders (explore/subagents), one per area — code the task touches, issue/PR if any, recent commits, external API shape only when it matters. Each returns a short digest. Finding facts is your job; putting decisions to the user is theirs.

## 3. `brief-ko.md` first — settle scope and spec with the user in Korean

Before any agent-facing document exists, write `$TASK_DIR/brief-ko.md` and discuss it. Shape: decision request ([write-for-human](../write-for-human/SKILL.md) / [templates/decision.md](../write-for-human/templates/decision.md)), adapted to intake:

```markdown
# <한 줄 제목> — 착수 전 확인

## 결론
**<한 문장: 무엇을 만들 것인가.>** <그 결론이 서는 사실 한두 문장.>

## 범위
| 포함 | 제외 |
| --- | --- |

## 완료 조건
- <사용자가 확인할 수 있는 검사. 결정 전엔 초안이라고 표시>

## 결정해 주셔야 하는 것
❓ **Q1 — <제목>**: <질문. 선택지가 있으면 나열>
➡️ 추천: <답과 한 줄 이유>
(프런티어 전체, 번호 순)

## 크기 (선택)
size: S | M | L · 이유 한 줄  (shape — see planner; not a binding lane)

## 하지 않는 것
- …
```

Grill in **rounds over a design tree**: the frontier is every decision whose prerequisites are settled; ask the whole frontier, numbered, each with your recommended answer; a question that depends on an open one waits for the next round; a question about a fact is a §2 defect. Round 1 always settles task type · rough size · out of scope · Done-when draft. After each answer, rewrite `brief-ko.md` in place. Silence is not agreement. For a task the user calls trivial: one round, ≤3 questions.

Stop when the frontier is empty and the user has said the brief-ko is right. **Nothing is written for agents before that sentence.**

## 4. Then `brief.md` — agent-facing canon

Only after confirmation, write `$TASK_DIR/brief.md` in English. The whole file is the executor prompt, built against [guides/prompting.md](../../guides/prompting.md).

```markdown
# <title>

## Goal
## Done when
## Out of scope
## Constraints
## Size hint (optional)
size: S | M | L · why: <one line>
## Decisions taken
| Q | answer | recommended? |
| --- | --- | --- |
## Executor prompt
GOAL · CONTEXT · CONSTRAINTS · OUTPUT · DONE WHEN
```

Then flip: `brief.md` is canonical; `brief-ko.md` is derived. Add as the first line of `brief-ko.md`: that it is derived from `brief.md`, English wins on disagreement. No fact may exist only in the Korean file.

## 5. Hand off

Name the next step — usually `planner` — and point at `$TASK_DIR/brief.md` (path, not pasted content).

```text
ask ──► §1 rewrite (draft) ──► §2 facts ──► §3 brief-ko.md, rounds, confirm ──► §4 brief.md ──► planner
                                                       ▲ nothing for agents left of this line
```

## References

- Design-tree grilling adapted from [mattpocock/skills grilling](https://raw.githubusercontent.com/mattpocock/skills/refs/heads/main/skills/productivity/grilling/SKILL.md).
- Durable spec artifact after settlement — nod to [mattpocock to-spec](https://github.com/mattpocock/skills) (synthesize settled conversation; do not invent unanswered decisions).
- Design-before-code validation in digestible chunks — nod to [obra/superpowers brainstorming](https://github.com/obra/superpowers).
- Procedure adapted from a personal `wf-brief-me` intake skill (est-work), decoupled from board/fleet patterns.
