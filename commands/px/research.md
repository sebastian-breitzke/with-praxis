---
description: Research - web + local sources, structured methodology with challenge points
argument-hint: "<question>"
---

# /px:research - Structured Research

**Purpose:** Research anything - from quick lookups to deep dives. Web + local sources.

**Usage:** `/px:research "<question>"`

---

## Research Modes

| Signal | Mode | Output |
|--------|------|--------|
| Quick question during work | **Quick** | Chat + Sources-Block |
| New topic, deep question, URL to analyze | **Deep** | Research document |

No explicit classification needed - infer from conversation context.

---

## Quick Research Flow

```
1. Search (1-3 queries)
2. Synthesize
3. Output: Chat + Sources-Block at end
```

Done. No overhead.

**Output Format:**
```markdown
[Synthesis]

---
**Sources:**
- [Title](url) - Key point
- [Title](url) - Key point
```

---

## Deep Research Flow

> **CRITICAL:** Follow phases IN ORDER. Do NOT skip to deep dives.

### Phase 1: Decomposition (NO TOOLS YET)

**Output in chat, no searches:**

```
1. DECOMPOSE
   └─ Break query into sub-topics (3-7 topics)
   └─ Basis: Common Knowledge (training data)

2. EXTRACT COMMON KNOWLEDGE
   └─ "What do we already know about this?"
   └─ Be transparent: "From training data, may be outdated"

3. IDENTIFY CHALLENGE POINTS
   ├─ Temporal: What might have changed recently?
   ├─ Common Wisdom: What's repeated but never verified?
   └─ Gegenposition: What alternative view exists?
```

**Output format:**
```markdown
## Common Knowledge (pre-search)
[What I already know from training - transparent baseline]

## Proposed Sub-Topics
1. **[Topic A]** — Why relevant
2. **[Topic B]** — Why relevant
...

## Challenge Points
- **Temporal:** [What might be outdated]
- **Common Wisdom:** [Assumption to verify]
- **Gegenposition:** [Alternative view to check]
```

---

### Phase 2: Quick Sweeps (MAX 3 SEARCHES)

**Now you may search, but ONLY for validation:**

```
4. TEMPORAL CHECK (1-2 searches max)
   └─ Query: "recent developments [topic] 2024 2025"
   └─ Signals found? → Note for plan
   └─ No signals? → Common knowledge confirmed

5. CHALLENGE SWEEP (1 search max)
   └─ One targeted query on biggest challenge point
   └─ Deviations found? → Adjust sub-topics
```

**Constraint:** Maximum 3 WebSearch calls in Phase 2. No deep dives yet.

---

### Phase 3: Plan & Confirm

> **MANDATORY STOP. Do NOT proceed without user approval.**

```
6. SHOW RESEARCH PLAN
   └─ List sub-topics with 1 sentence each
   └─ Show estimated scope (searches, output type)
   └─ ASK for confirmation
```

**Required format:**
```markdown
## Research Plan

Based on quick sweeps, I propose:

1. **[Sub-Topic A]** — [Why, what we'll learn]
2. **[Sub-Topic B]** — [Why, what we'll learn]
3. **[Sub-Topic C]** — [Why, what we'll learn]

**Scope:** ~X searches, output as [single file / folder with deep-dives]

---

Adjust focus? Add/remove topics? Or proceed?
```

**WAIT for user response.** Do not continue until user says "proceed", "go", "yes", or similar.

---

### Phase 4: Deep Dives (ONLY AFTER APPROVAL)

```
7. EXECUTE PLAN
   └─ Per sub-topic: Thorough research
   └─ Parallel searches where independent
   └─ Include local sources when helpful

8. SYNTHESIZE
   └─ Combine findings
   └─ Name contradictions explicitly
   └─ Don't hide uncertainty
```

---

### Phase 5: Documentation

```
9. WRITE OUTPUT
   └─ Create research document
   └─ Include all sections from template
   └─ Sources with relevance notes

10. CITATION CHECK
    └─ Hard numbers/claims → Citation at the claim
    └─ Context → Sources-Block at end
```

---

## Research Output Format

**Main File Format:**
```markdown
# Research: [Question restated]

## Question

[Original question + context]

## Key Findings

### 1. [Finding A]
[Summary]

### 2. [Finding B]
...

## Recommendations

[Primary recommendation with reasoning]

## Confidence & Gaps

- **High confidence:** [What we know well]
- **Gaps:** [What needs more research]

## Sources

- [Title](url) — Relevant for: X
```

---

## Anti-Patterns (DO NOT)

❌ **Skip to searches** — Phase 1 is thinking, not searching
❌ **Fire 10 parallel searches** — Max 3 in Phase 2, more only after approval
❌ **Skip plan confirmation** — ALWAYS show plan and wait for Deep research
❌ **Assume "proceed"** — User must explicitly approve
❌ **Hide uncertainty** — Name what you don't know

---

## Success Criteria

After `/px:research`, you should have:
- [ ] Clear answer (synthesis)
- [ ] Challenge points addressed (temporal, common wisdom, alternative views)
- [ ] Sources traceable (inline for claims, block for context)
- [ ] Contradictions named (not hidden)
- [ ] Actionable (what to do with this)
- [ ] User had chance to adjust scope before deep dives
