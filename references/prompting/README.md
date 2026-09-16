---
title: Prompting reference mirrors
when_to_read: refreshing local copies of upstream Claude or OpenAI prompting guides, or finding the path for a full guide linked from guides/prompting.md
summary:
  - Verbatim upstream mirrors under claude/ and openai/ — do not edit by hand; re-fetch instead
  - OpenAI set is GPT-5.6 Sol–centered (prompt guidance + using guide + model card)
  - Applied checklist lives in guides/prompting.md; this folder is the full text
---

# Prompting reference mirrors

Local copies of official prompting guides for offline reading and stable paths. **Do not edit these files by hand.** Notes and applied checklists go in [guides/prompting.md](../../guides/prompting.md).

Mirrors collected **2026-09-16**. Upstream copyright remains with Anthropic / OpenAI.

## Claude (Anthropic)

- [claude/claude-prompting-best-practices.md](./claude/claude-prompting-best-practices.md) — https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices.md
- [claude/prompting-claude-opus-5.md](./claude/prompting-claude-opus-5.md) — https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-opus-5.md
- [claude/prompting-claude-sonnet-5.md](./claude/prompting-claude-sonnet-5.md) — https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-sonnet-5.md
- [claude/prompting-claude-fable-5-1.md](./claude/prompting-claude-fable-5-1.md) — https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-fable-5-1.md

Index: https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/

## OpenAI (GPT-5.6 Sol baseline)

- [openai/prompt-guidance-gpt-5p6.md](./openai/prompt-guidance-gpt-5p6.md) — https://developers.openai.com/api/docs/guides/prompt-guidance-gpt-5p6.md (primary prompting guidance for GPT-5.6 Sol / family)
- [openai/using-gpt-5.6.md](./openai/using-gpt-5.6.md) — https://developers.openai.com/api/docs/guides/latest-model/gpt-5.6.md
- [openai/gpt-5.6.md](./openai/gpt-5.6.md) — https://developers.openai.com/api/docs/models/gpt-5.6.md (model card)
- [openai/prompt-engineering.md](./openai/prompt-engineering.md) — https://developers.openai.com/api/docs/guides/prompt-engineering.md (general API prompting)
- [openai/codex-prompting-guide.md](./openai/codex-prompting-guide.md) — https://developers.openai.com/cookbook/examples/gpt-5/codex_prompting_guide.md (Codex / agentic coding harness)

## Re-fetch

```bash
ROOT="$(git rev-parse --show-toplevel)/references/prompting"
cd "$ROOT/claude"
for u in claude-prompting-best-practices prompting-claude-fable-5-1 prompting-claude-opus-5 prompting-claude-sonnet-5; do
  curl -sL -o "$u.md" "https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/$u.md"
done
cd "$ROOT/openai"
curl -sL -o prompt-guidance-gpt-5p6.md "https://developers.openai.com/api/docs/guides/prompt-guidance-gpt-5p6.md"
curl -sL -o using-gpt-5.6.md "https://developers.openai.com/api/docs/guides/latest-model/gpt-5.6.md"
curl -sL -o gpt-5.6.md "https://developers.openai.com/api/docs/models/gpt-5.6.md"
curl -sL -o prompt-engineering.md "https://developers.openai.com/api/docs/guides/prompt-engineering.md"
curl -sL -o codex-prompting-guide.md "https://developers.openai.com/cookbook/examples/gpt-5/codex_prompting_guide.md"
```
