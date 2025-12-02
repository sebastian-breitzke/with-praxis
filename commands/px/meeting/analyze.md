---
description: Analyze meeting transcript - decisions, action items, insights (DSGVO-compliant)
argument-hint: <transcript-file> [--mode=auto|simple|deep]
---

# /px:meeting:analyze - Meeting Analysis

**Purpose:** Extract value from meeting transcripts while staying DSGVO-compliant.

**Usage:** `/px:meeting:analyze <transcript-file>`

---

## DSGVO Compliance

> **Core Rule:** Analyze the meeting, not the people.

| ✅ Allowed | ❌ Not Allowed |
|-----------|----------------|
| Meeting structure | People analysis |
| What was decided | Who said what |
| Format assessment | Behavior assessment |
| Anonymized insights | Personal profiles |

---

## Modes

| Mode | When | Output |
|------|------|--------|
| `auto` | Default - detects from content | Appropriate depth |
| `simple` | Routine meetings | Quick notes |
| `deep` | Strategic meetings | Full analysis |

---

## What You Get

### 1. Meeting Summary
- Duration, participants (names only for attendance)
- Primary topics discussed
- Meeting type assessment

### 2. Decisions
```
✅ DECISION: [What was decided]
   Context: [Brief context]
   Status: Final / Tentative / Needs follow-up
```

### 3. Action Items
```
📋 ACTION: [What needs to be done]
   Owner: [Name] (only for accountability)
   Due: [Date if mentioned]
```

### 4. Insights (Anonymized)
```
💡 INSIGHT: [Pattern or learning extracted]
   Why it matters: [Brief explanation]
```

### 5. Format Assessment
- Was the meeting format appropriate?
- Could this have been async?
- Suggested improvements for future

---

## What You DON'T Get

❌ "Person X said..." (no attribution)
❌ "Person Y was impatient" (no behavior assessment)
❌ "Dynamic between A and B" (no relationship analysis)
❌ Participant profiles or characterizations
❌ Political analysis or subtext

---

## Output Format

```markdown
# Meeting Notes: [Topic]

**Date:** YYYY-MM-DD
**Duration:** X minutes
**Participants:** [Names - attendance only]

---

## Summary

[2-3 sentences: What was this meeting about?]

---

## Decisions

1. ✅ **[Decision]**
   - Context: [Why this was decided]
   - Status: Final

2. ✅ **[Decision]**
   ...

---

## Action Items

| Action | Owner | Due |
|--------|-------|-----|
| [Task] | [Name] | [Date] |

---

## Insights

> 💡 **[Insight title]**
> [Description - anonymized, no attribution]

---

## Meeting Assessment

- **Format:** [Was it appropriate?]
- **Efficiency:** [Could parts be async?]
- **Follow-up:** [What's needed next?]
```

---

## Examples

**Good (DSGVO-compliant):**
- "A decision was made to use GraphQL"
- "The team agreed on weekly syncs"
- "It was noted that testing coverage needs improvement"

**Bad (NOT compliant):**
- "Max said we should use GraphQL"
- "Sarah dominated the discussion"
- "There was tension between the frontend and backend teams"

---

## Technical Notes

**Transcript formats supported:**
- JSON (from transcription tools)
- Plain text
- Markdown

**Tip:** Use `/px:sanitize` first if transcript has transcription errors.

---

## Legal Reminder

When using in professional context:
- Inform participants that transcription is happening
- Don't create individual profiles
- Keep meeting notes focused on outcomes, not people
- Consider works council requirements (Germany)

See: DSGVO Art. 6, BetrVG §87
