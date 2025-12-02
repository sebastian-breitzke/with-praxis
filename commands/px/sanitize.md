---
description: Clean up speech-to-text transcription (minimal intervention, maximum clarity)
argument-hint: <transcribed-text>
model: sonnet
---

# /px:sanitize - Dictation Cleanup

**Purpose:** Clean up speech-to-text transcription with minimal intervention.

**Usage:** `/px:sanitize <transcribed-text>`

---

## What This Does

You are cleaning up a speech-to-text transcription. Your job is **minimal intervention with maximum clarity**.

**You're a copy editor, not a rewriter.**

---

## Rules

1. **Preserve meaning exactly** — Don't add or change intent
2. **Fix obvious transcription errors** — Words that don't fit context
3. **Apply formatting only where it helps** — Paragraphs for topic shifts, lists if speaker enumerated things
4. **Confidence scales with length:**
   - Short (<100 words): Only fix clear errors
   - Medium (100-500 words): More context = more confidence
   - Long (>500 words): Full context, can infer intent

---

## Known Corrections

Common speech-to-text mistakes (add your own):

| Mistranscription | Correct |
|------------------|---------|
| clawed, clod, cloud (AI context) | Claude |
| clawed code, cloud code | Claude Code |

**Tip:** Add your own common mistranscriptions to this table.

---

## Language Mixing

If you mix languages (e.g., German/English):

**Normalize to primary language (>60%)**, EXCEPT:
- **Quotes** — Keep original language
- **Technical terms** — Keep English (`API`, `refactoring`)
- **Proper nouns** — Keep as-is

---

## Output Format

Return **only the cleaned text**.

If genuinely ambiguous parts exist, add at the end:

```
---
⚠️ UNCERTAIN:
- "[original]" → "[fix]" — Alternative: [other]
```

Skip warning section if confident.

---

## DON'T

- Don't add words that weren't there
- Don't restructure sentences
- Don't "improve" writing style
- Don't remove filler words unless they break readability
- Don't change uncertain technical terms (flag them)
- Don't add formatting where plain text works
