---
title: Prompting checklist
when_to_read: writing or tuning a dispatch prompt, settling a brief.md executor section, or choosing effort and output shape for Opus / Sonnet / Fable roles
summary:
  - Applied checklist for Opus (orchestrator), Sonnet (developer), Fable (reviewer), and common guidance
  - Distilled for harness-agnostic use — link upstream Anthropic guides; do not vendor full mirrors here
  - settle-spec and planner consumers apply this when shaping agent-facing prompts
---

# Prompting checklist

Upstream: [Claude prompt engineering](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/). This file is an applied checklist only.

## Opus (orchestrator)

- Drop explicit verification instructions — the model self-verifies; extra checks cause over-verification.
- Scope constraints only for narrow tasks.
- Delegate to subagents only for genuinely independent, parallelizable, large work.
- No "double-check" instructions.
- Specify response length explicitly (effort is not a length control).

Full guide: [Prompting Claude Opus 5](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-opus-5.md).

## Sonnet (developer)

- Prefer effort high / xhigh for complex tasks (not a prompting workaround).
- Review harnesses should report every finding instead of filtering by severity; pair each finding with confidence/severity so filtering happens in a later step.
- Never pass temperature / top_p / top_k (400 error on current APIs).

Full guide: [Prompting Claude Sonnet 5](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-sonnet-5.md).

## Fable (quality reviewer when preferred)

- Instruct removal of mannered prose (see [writing-style.md](./writing-style.md) §Tone).
- Agentic verification and output-shape guidance in the upstream guide apply to review reports.

Full guide: [Prompting Claude Fable 5.1](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-fable-5-1.md).

## Common

- Positive examples outperform negative instructions.
- Specify the exact format of progress updates explicitly.

Full guide: [Prompting best practices](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices.md).

## Executor prompt shape

When rewriting an ask into an agent-facing prompt (see `settle-spec`):

```text
GOAL        one sentence, the observable outcome
CONTEXT     paths, issue/PR numbers, base ref — pointers, never pasted content
CONSTRAINTS what must not change; language rules; no hard wrapping; write plainly
OUTPUT      exact shape and length of what comes back (files, report block, PR)
DONE WHEN   deterministic checks only: file::test, command + expected exit, browser check + expected observed value
```

## References

- Anthropic Claude prompt-engineering docs (linked above).
- Adapted from a personal prompting README used with board/orchestrator workflows (est-work `wiki/prompting/README.md`).
