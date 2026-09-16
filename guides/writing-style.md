---
title: Writing style
when_to_read: writing any agent-facing or human-facing document, PR/issue body, commit message, or skill/guide in this handbook
summary:
  - Tone — no mannered prose, no verbosity, no over-clipping
  - Language — agents English, humans Korean; derived canon rule when both exist
  - Show structure instead of narrating it; prefer heading/list over wide tables; no hard wrap
---

# Writing style

## Tone — three failure modes

Applies to session messages, documents, PR/issue bodies, review comments, commit messages, and code comments.

### 1. Mannered prose

Metaphor instead of the literal statement. Prefer the literal phrase when one exists. Mannered prose showcases the writer, makes the reader decode, and drags in uncontrolled connotations.

Upstream nod: [Prompting Claude Fable 5.1 — Writing density](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-fable-5-1.md). Short form: "remove all mannered prose".

### 2. Verbosity

Restating the same point, burying the conclusion, background that does not change the reader's next action. Test: if removing it would not change what the reader does next, remove it.

### 3. Over-clipping

Overcorrecting into telegraphese — dropping connecting words until someone who was not in the room cannot follow on one read. Short is not the same as plain; precise is not the same as concise.

### Korean surface form

- No honorific speech level (경어체) in Korean work docs.
- Prefer noun-form endings (명사형 어미) where natural for notes and operating docs.
- Plain tone; no padding.

## Language — the reader decides

- **Agents → English.** `AGENTS.md`, skills, guides, `brief.md`, `plan.md`, `tasks.md`.
- **Humans → Korean.** Decision docs, PR/issue/commit text, `brief-ko.md`, `plan-ko.md`.

Who must read and act decides the language — directory is only a proxy.

### When one piece needs two audiences, split the file

Do not mix a Korean decision section into an English technical document. Write a derived document (`plan-ko.md` next to `plan.md`).

Exception for intake: `brief-ko.md` is written **first** with the user; after confirmation, `brief.md` becomes canon and `brief-ko.md` is re-derived (see `settle-spec`).

Rules once an English canon exists:

1. Canonical version is English. Derived first line links the canon and states it is derived. On disagreement, English wins — regenerate the derived file.
2. Trim explanation, not options. A decision carries recommendation, alternatives, and reasoning.
3. Derived file carries no new facts.
4. If there is nothing to decide, do not write a Korean copy.

## Show, do not narrate

Where structure already exists — algorithm, call order, file layout, component hierarchy, branch — show it in that structure.

- **policy, algorithm, step order** → pseudocode (`text`)
- **runtime control flow** → indented call tree (`text`)
- **file/module ownership or change scope** → shallow file tree; `[ADD]` · `[MODIFY]` · `[DELETE]` + reason (`text`)
- **UI hierarchy and state owners** → component tree (`tsx`)
- **branch, hand-off, data flow** → one Mermaid `flowchart` or `sequenceDiagram` (`mermaid`)
- **what changed in an existing shape** → same tree/list as `diff` (`diff`)
- **parallel cases with the same fields** → see Tables below
- **comparison too dense for Mermaid; layout; slide** → one focused HTML file

- Pick the single smallest view that carries the point.
- A diagram is body text, not decoration. Prose holds only what the view cannot — _why this option_.
- Verify Mermaid by rendering, not by parse alone. Use `<br/>` inside nodes; quote labels with punctuation.
- Place each view next to the short prose it supports.

### Tables

Markdown tables render poorly on many platforms once they grow wide. Prefer a **heading + list** (or a numbered list of sections) when any of these hold:

- The table would have **three or more columns**.
- One column is only a row index / sequence number (`#`, `1`, `2` …) — put the number in the heading or list marker instead.
- A cell needs more than one short fact, or would need a line break.

Two-column tables (label → value, or type → when) are fine when cells stay one line.

**Exception:** a short option-comparison matrix where columns are alternatives (추천안 · 대안) and rows are the same fields — keep that as a table so choices stay side by side.

For documents a human reads and acts on, also follow [`write-for-human`](../skills/write-for-human/SKILL.md).

## Line breaks — no hard wrapping

Do not insert line breaks to hit a column width. One paragraph, list item, or PR/issue line = one line; leave wrapping to the reader's editor.

Exception: inside code fences, follow that language's formatter.

A line break is punctuation. Spending it on visual width loses the signal, makes one-word fixes reflow whole paragraphs in diffs, and cuts readers mid-sentence.

A table cell cannot hold a line break. If content needs multiple lines, use a heading + list instead of a table.

## References

- Adapted from personal document-convention rules (est-work `rules/document-conventions.md`).
- View catalogue patterns also informed by [humanlayer show-me](https://raw.githubusercontent.com/humanlayer/skills/refs/heads/main/plugins/show-me/skills/show-me/SKILL.md) (see `write-for-human`).
