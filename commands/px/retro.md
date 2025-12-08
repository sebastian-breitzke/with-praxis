---
description: Session retrospective - analyze what worked, what didn't, track patterns
---

# /px:retro - Session Retrospective

**Purpose:** Review the current session. Track satisfaction, patterns, and improvement signals.

**Usage:** `/px:retro` (no arguments - analyzes current conversation)

---

## What This Does

Analyzes the current session and collects:
1. **What we did** - Tasks, outputs, commands used
2. **How it went** - Satisfaction, mood arc, energy
3. **Patterns detected** - Both positive and problematic
4. **Improvement signals** - What should be better

**Output:** Summary in console + structured data in `~/.praxis/praxis.db`

---

## Analysis Flow

### 1. SCAN THE SESSION

**Read the entire conversation.** Extract:

**Tasks & Outcomes:**
- What was accomplished?
- What commands/tools were used?
- What worked well?
- What didn't work or needed retry?

**Satisfaction Signals:**

| Positive | Negative |
|----------|----------|
| "perfect", "exactly", "great" | "no", "wrong", "not what I meant" |
| Fast acceptance | Multiple corrections needed |
| Building momentum | Losing focus, frustration |
| Smooth execution | Errors, retries, workarounds |

**Collect actual quotes** - real evidence, not paraphrased.

---

### 2. DETECT PATTERNS

Look for behavioral patterns (from `context/patterns.md`):

**Check:** Did any of the user's known patterns show up?
- Firefighter mode (doing instead of delegating)?
- Over-commitment (too much on plate)?
- Perfectionism (polishing instead of shipping)?
- Scope creep (expanding mid-task)?

**Also look for:**
- Positive patterns (deep focus, good delegation, clear decisions)
- New patterns not yet documented

For each pattern detected:
- Name it
- Quote the evidence
- Note if positive or problematic

---

### 3. IDENTIFY IMPROVEMENTS

What could be better?

| Target | What | Evidence |
|--------|------|----------|
| Praxis | Command X could be clearer | User asked 3 clarifying questions |
| User | Pattern Y showed up again | "let me just do it myself" |
| System | Missing capability | Had to work around X |

---

### 4. GENERATE SUMMARY

```markdown
## Session Retro

**Duration:** ~[X] messages
**Overall:** [emoji] [great/good/neutral/poor/bad]
**Mood:** [start] → [end]
**Energy:** [low/medium/high]

### What We Did
- [Task 1 - outcome]
- [Task 2 - outcome]

### What Worked
- [Highlight with evidence]

### What Didn't
- [Challenge with evidence]

### Patterns Detected
- **[Pattern]** (positive/problematic): "[evidence]"

### Improvement Signals
| Target | Signal |
|--------|--------|
| [target] | [what should improve] |

### Commands Used
| Command | Satisfaction | Notes |
|---------|--------------|-------|
| [cmd] | [rating] | [notes] |
```

---

### 5. ASK IF UNCLEAR

If satisfaction is unclear from the conversation:

> How was this session overall?
> - Great (productive, smooth)
> - Good (solid work)
> - Neutral (okay)
> - Poor (frustrating)
> - Bad (waste of time)

**Prefer inference.** Only ask if truly ambiguous.

---

### 6. WRITE TO DATABASE

**First run? Initialize DB:**

```bash
sqlite3 ~/.praxis/praxis.db <<'EOF'
CREATE TABLE IF NOT EXISTS retros (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    timestamp TEXT DEFAULT (datetime('now', 'localtime')),
    session_id TEXT,
    tasks_summary TEXT,
    commands_used TEXT,  -- JSON array
    mood_start TEXT,
    mood_end TEXT,
    energy TEXT,
    highlights TEXT,
    lowlights TEXT,
    satisfaction TEXT,
    patterns_detected TEXT,  -- JSON array
    improvement_signals TEXT,  -- JSON array
    quotes TEXT  -- JSON array
);

CREATE TABLE IF NOT EXISTS _meta (
    key TEXT PRIMARY KEY,
    value TEXT
);
INSERT OR IGNORE INTO _meta (key, value) VALUES ('schema_version', '1');
EOF
```

**Then insert:**

```bash
sqlite3 ~/.praxis/praxis.db "INSERT INTO retros (
    session_id,
    tasks_summary,
    commands_used,
    mood_start,
    mood_end,
    energy,
    highlights,
    lowlights,
    satisfaction,
    patterns_detected,
    improvement_signals,
    quotes
) VALUES (
    'session-$(date +%Y%m%d)',
    '[tasks summary]',
    '[{\"command\":\"...\",\"satisfaction\":\"good\"}]',
    'neutral',
    'focused',
    'medium',
    '[highlights]',
    '[lowlights]',
    'good',
    '[{\"name\":\"...\",\"type\":\"positive\",\"evidence\":\"...\"}]',
    '[{\"target\":\"...\",\"signal\":\"...\"}]',
    '[\"quote1\",\"quote2\"]'
);"
```

---

## Satisfaction Scale

| Level | Meaning | Signals |
|-------|---------|---------|
| **great** | Exceeded expectations | Explicit praise, used as-is |
| **good** | Worked well | Smooth flow, minor tweaks |
| **neutral** | Okay | Got the job done |
| **poor** | Frustrating | Multiple corrections, slow |
| **bad** | Failed | Abandoned, explicit frustration |

---

## Mood Values

`frustrated`, `stressed`, `tired`, `neutral`, `focused`, `accomplished`, `flow`, `euphoric`

---

## Why This Matters

Retros feed into `/px:improve`:
- Aggregated patterns show trends
- Satisfaction distribution shows health
- Improvement signals guide development

**The self-improvement loop:**
```
Session → Retro → Database → Improve → System adapts
```

---

## Tips

- **Run at session end** - Best signal when fresh
- **Be honest** - Poor sessions have valuable data
- **Quote evidence** - Makes patterns actionable
- **Track commands** - Shows what works

---

## Next

After retro, periodically run:
- `/px:improve` - See trends and suggested adaptations
