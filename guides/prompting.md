---
title: Prompting checklist
when_to_read: writing or tuning a dispatch prompt, settling a brief.md executor section, or choosing effort and output shape for Claude or OpenAI (GPT-5.6) agent roles
summary:
  - Applied checklist for Claude (Opus / Sonnet / Fable) and OpenAI GPT-5.6 Sol
  - Full upstream text lives in references/prompting/ — re-fetch there; do not edit mirrors by hand
  - settle-spec and planner consumers apply this when shaping agent-facing prompts
---

# Prompting checklist

Applied checklist only. Full upstream mirrors: [references/prompting/](../references/prompting/README.md).

## Claude — Opus (orchestrator)

- Drop explicit verification instructions — the model self-verifies; extra checks cause over-verification.
- Scope constraints only for narrow tasks.
- Delegate to subagents only for genuinely independent, parallelizable, large work.
- No "double-check" instructions.
- Specify response length explicitly (effort is not a length control).

Full: [references/prompting/claude/prompting-claude-opus-5.md](../references/prompting/claude/prompting-claude-opus-5.md).

## Claude — Sonnet (developer)

- Prefer effort high / xhigh for complex tasks (not a prompting workaround).
- Review harnesses should report every finding instead of filtering by severity; pair each finding with confidence/severity so filtering happens in a later step.
- Never pass temperature / top_p / top_k (400 error on current APIs).

Full: [references/prompting/claude/prompting-claude-sonnet-5.md](../references/prompting/claude/prompting-claude-sonnet-5.md).

## Claude — Fable (quality reviewer when preferred)

- Instruct removal of mannered prose (see [writing-style.md](./writing-style.md) §Tone).
- Agentic verification and output-shape guidance in the upstream guide apply to review reports.

Full: [references/prompting/claude/prompting-claude-fable-5-1.md](../references/prompting/claude/prompting-claude-fable-5-1.md).

## Claude — common

- Positive examples outperform negative instructions.
- Specify the exact format of progress updates explicitly.

Full: [references/prompting/claude/claude-prompting-best-practices.md](../references/prompting/claude/claude-prompting-best-practices.md).

## OpenAI — GPT-5.6 Sol (primary)

Baseline model for OpenAI work in this handbook: **GPT-5.6 Sol** (`gpt-5.6` / `gpt-5.6-sol`). Prefer outcome-first, lean prompts.

- **Simplify first.** Remove repeated rules, unused examples, and tools that do not change behavior. Keep outcome, success criteria, stopping conditions, real constraints, required output shape.
- **Outcome over process.** State what good looks like and the completion bar; leave the search/tool path to the model unless the route is a true invariant.
- Reserve ALWAYS / NEVER / must for safety, required fields, and hard bans — not for every judgment call.
- **Stopping conditions.** Fewest useful tool loops, but correctness and required evidence outrank loop minimization.
- Use `text.verbosity` for default length; put task-specific length/structure in the prompt. Broad “be concise” can over-shorten on 5.6 — keep only when evals need it.
- Keep personality and collaboration style short; neither replaces goals, tool rules, or stopping conditions.
- Define autonomy and approval boundaries explicitly when the agent can take actions.
- Prefer clear tool names/descriptions and routing rules; simplify tool schemas the same way you simplify prompts.
- Check work against success criteria before finishing.

Full: [references/prompting/openai/prompt-guidance-gpt-5p6.md](../references/prompting/openai/prompt-guidance-gpt-5p6.md).

API / migration context: [references/prompting/openai/using-gpt-5.6.md](../references/prompting/openai/using-gpt-5.6.md). Model card: [references/prompting/openai/gpt-5.6.md](../references/prompting/openai/gpt-5.6.md).

## OpenAI — general API prompting

- Durable instructions in system/developer roles; user turn for the task.
- Structured sections (identity, instructions, examples, context) with Markdown or XML delimiters.
- Version prompts in code when they ship with a product.

Full: [references/prompting/openai/prompt-engineering.md](../references/prompting/openai/prompt-engineering.md).

## OpenAI — Codex / agentic coding harness

- Start from the upstream Codex starter prompt; add only tactical deltas.
- Stress autonomy and persistence; avoid mid-rollout status preambles that stop the model early.
- Prefer medium reasoning for interactive coding; high / xhigh for hard long-running tasks.
- Use the harness apply_patch (or equivalent) and parallel tool calling as the guide describes.

Full: [references/prompting/openai/codex-prompting-guide.md](../references/prompting/openai/codex-prompting-guide.md).

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

- Local mirrors: [references/prompting/](../references/prompting/README.md) (Anthropic + OpenAI GPT-5.6; collected 2026-09-16).
- Adapted checklist shape from a personal prompting README (est-work `wiki/prompting/README.md`).
