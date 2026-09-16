---
name: write-for-human
description: >-
  Write a document a person will read and act on — a decision request, proposal,
  technical overview, report or retrospective. Conclusion first, then the smallest
  view that carries each point. Korean by default for human readers; derived from
  an English canon when one exists. Use whenever the reader is a human, not an agent —
  even for a two-paragraph note.
when_to_read: producing plan-ko, proposals, reports, or any doc a person must decide from
summary:
  - Conclusion first; one question per heading; show structure, do not narrate it
  - View catalogue — table, tree, pseudocode, diff, one Mermaid, focused HTML
  - Templates under templates/; tone and language from guides/writing-style.md
---

# write-for-human — documents a person reads once and acts on

The reader was not in the room. They will read top to bottom once, stop at the first heading that answers their question, and decide. Every rule below follows from that.

Tone, language split, show-don't-narrate, and no hard wrap: [guides/writing-style.md](../../guides/writing-style.md).

## 0. Which document, which shape

| document                     | reader wants to know                                        | shape                                                                   | template                                                   |
| ---------------------------- | ----------------------------------------------------------- | ----------------------------------------------------------------------- | ---------------------------------------------------------- |
| decision request             | what happened, what must I choose, what do you recommend    | 결론 → 무슨 일 → 결정표 → 선택 이유 → 하지 않은 것                      | [templates/decision.md](./templates/decision.md)           |
| proposal                     | what you propose, cost, what changes, what is out           | 한 줄 요약 → 배경 → 구조 → 범위 → 효과 → 일정·비용 → 리스크 → 결정 요청 | [templates/proposal.md](./templates/proposal.md)           |
| technical overview           | how it is built, how a request flows, where boundaries are  | 아키텍처 → 흐름 → 경계 표 → 용어 표                                     | [templates/tech-overview.md](./templates/tech-overview.md) |
| report, retrospective, audit | what changed, evidence, what was not done, what waits on me | 결론 → 변경 표 → 측정 → 하지 않은 것 → 결정 대기                        | [templates/report.md](./templates/report.md)               |

If the document is none of these, still start from the decision-request shape: conclusion, evidence, choice, omissions.

## 1. Non-negotiables

1. **Conclusion in the first sentence.** Recommendation, verdict, or state. Background only if it changes what the reader does.
2. **Every heading answers one question, in reading order.** A reader who stops at any heading has a complete answer to everything above it.
3. **Show structure, do not narrate it.** Order, hierarchy, branch, or comparison → a view (§2), not a paragraph. A paragraph is at most three sentences and exists only for _why this option_.
4. **The smallest view that carries the point.** One table beats one diagram beats three diagrams.
5. **A decision keeps its options.** Table with 추천안 · 대안 · 비용·위험 · 선택 이유. Dropping an alternative turns a summary into a nudge.
6. **Reader decides the language.** A human reads Korean. If an English canon exists, the Korean file is derived: first line links the canon; no fact only in Korean; on disagreement English wins.
7. **Plain tone, no hard wrap.** See writing-style. One paragraph or list item per line.
8. **Numbers carry their source.** Measured value has a date and a place. A number without one is a preference and is labelled as one.

## 2. View catalogue

| the point is                                    | view                                                      | fence         |
| ----------------------------------------------- | --------------------------------------------------------- | ------------- |
| policy, algorithm, step order                   | pseudocode                                                | `text`        |
| what calls what at runtime                      | call tree, indented                                       | `text`        |
| file/module ownership; scope of a change        | shallow file tree; `[ADD]`·`[MODIFY]`·`[DELETE]` + reason | `text`        |
| UI hierarchy and who holds state                | component tree                                            | `tsx`         |
| branch, hand-off, data flow                     | **one** Mermaid `flowchart` or `sequenceDiagram`          | `mermaid`     |
| what changes in a shape that already exists     | same tree or list as `diff`                               | `diff`        |
| parallel cases with the same fields             | table, short cells, one fact per cell                     | —             |
| comparison too dense for Mermaid; layout; slide | one focused HTML file, real labels, desktop and mobile    | open the file |

- **Table cells hold one fact and no line break.** If a cell wants a second line, use a heading + bullets.
- **Checklists are `- [ ]` bullets, never a table.**
- **Show the whole block** when most of it is new, when omitted context would hide ownership or order, or when the reader needs a copyable shape. Otherwise show the delta as `diff`.
- **Render Mermaid before hand-off** — syntax can pass and still not draw.
- **Place each view next to the two sentences it supports.**

## 3. Procedure

```text
write(doc)
  reader   = who reads this, and what will they do after
  canon    = English source file if agents also read this; else none
  outline  = headings, each phrased as the reader's question
  for each heading
    pick the smallest view from §2 that answers it
    write ≤3 sentences of why, only where the view cannot say it
  decisions → table: 추천안 · 대안 · 비용/위험 · 선택 이유; recommendation first, marked (추천)
  omissions → "하지 않은 것" with one reason each
  self-check (§4); render Mermaid; link the canon in line 1 if canon exists
```

## 4. Self-check before handing over

- [ ] First sentence is the conclusion; a reader who reads nothing else knows what to do.
- [ ] No paragraph over three sentences; every list of parallel things is a table or a tree.
- [ ] Every table cell is one line; every checklist is `- [ ]` bullets.
- [ ] Each diagram carries something no sentence above it already said.
- [ ] Every decision shows the alternative and the reason, not just the pick.
- [ ] Every number has a date and a source, or is labelled a preference.
- [ ] "하지 않은 것" exists, even if it says `없음`.
- [ ] Korean has no honorific endings; no metaphor stands in for a literal phrase; no line is wrapped for width.
- [ ] If a canon exists: line 1 links it; nothing here is absent from it.
- [ ] Mermaid rendered, not just parsed.

## 5. Anti-patterns

| seen                                                               | do instead                                              |
| ------------------------------------------------------------------ | ------------------------------------------------------- |
| multi-line rationale stuffed into one table cell                   | heading + `**결정**` / `**근거**` bullets               |
| many diagrams for claims a bullet already carries                  | smallest view per claim                                 |
| incident history inside an operating contract                      | the rule + one dated measurement; history behind a link |
| a count cited in several files against a drifting source           | no count outside the source                             |
| English technical plan handed to a human to decide from            | Korean derived decision doc with alternatives           |
| "summary" that kept the recommendation and dropped the alternative | every option travels, with its cost                     |

## References

- View patterns adapted from [humanlayer/skills show-me](https://raw.githubusercontent.com/humanlayer/skills/refs/heads/main/plugins/show-me/skills/show-me/SKILL.md).
- Procedure and templates adapted from a personal `docs-for-human` skill (est-work).
