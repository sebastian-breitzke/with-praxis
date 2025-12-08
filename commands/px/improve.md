---
description: Self-improvement analysis - aggregate retros, show trends, suggest adaptations
---

# /px:improve - Self-Improvement Analysis

**Purpose:** Aggregate retro data. Show trends. Suggest system adaptations.

**Usage:** `/px:improve [--days=30]`

---

## What This Does

Analyzes retro history and produces:
1. **Satisfaction trends** - Are sessions getting better?
2. **Pattern frequency** - What keeps showing up?
3. **Command health** - What works, what doesn't?
4. **Improvement backlog** - Signals not yet acted on
5. **Suggested adaptations** - What should change?

---

## Analysis Flow

### 1. GATHER DATA

```bash
# Check if DB exists
if [[ ! -f ~/.praxis/praxis.db ]]; then
    echo "No retro data yet. Run /px:retro after a few sessions first."
    exit 0
fi

DAYS=${1:-30}
```

### 2. SATISFACTION ANALYSIS

```bash
sqlite3 ~/.praxis/praxis.db "
SELECT
    satisfaction,
    COUNT(*) as count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM retros WHERE timestamp > datetime('now', '-$DAYS days')), 1) as pct
FROM retros
WHERE timestamp > datetime('now', '-$DAYS days')
AND satisfaction IS NOT NULL
GROUP BY satisfaction
ORDER BY
    CASE satisfaction
        WHEN 'great' THEN 1
        WHEN 'good' THEN 2
        WHEN 'neutral' THEN 3
        WHEN 'poor' THEN 4
        WHEN 'bad' THEN 5
    END;
"
```

### 3. MOOD TRENDS

```bash
sqlite3 ~/.praxis/praxis.db "
SELECT
    mood_end,
    COUNT(*) as sessions
FROM retros
WHERE timestamp > datetime('now', '-$DAYS days')
AND mood_end IS NOT NULL
GROUP BY mood_end
ORDER BY sessions DESC;
"
```

### 4. PATTERN FREQUENCY

```bash
sqlite3 ~/.praxis/praxis.db "
SELECT patterns_detected
FROM retros
WHERE timestamp > datetime('now', '-$DAYS days')
AND patterns_detected IS NOT NULL
AND patterns_detected != '[]';
"
```

Parse JSON and count:
- Which patterns appear most?
- Positive vs problematic ratio
- Trending up or down?

### 5. COMMAND SATISFACTION

```bash
sqlite3 ~/.praxis/praxis.db "
SELECT commands_used
FROM retros
WHERE timestamp > datetime('now', '-$DAYS days')
AND commands_used IS NOT NULL
AND commands_used != '[]';
"
```

Aggregate by command:
- Which commands get used most?
- What's the satisfaction per command?
- Any commands consistently poor?

### 6. IMPROVEMENT SIGNALS

```bash
sqlite3 ~/.praxis/praxis.db "
SELECT improvement_signals
FROM retros
WHERE timestamp > datetime('now', '-$DAYS days')
AND improvement_signals IS NOT NULL
AND improvement_signals != '[]';
"
```

Group by target:
- Praxis improvements
- User pattern interventions
- System capability gaps

---

## Output Format

```markdown
# Praxis Self-Improvement Report

**Period:** Last [X] days
**Sessions:** [N] retros analyzed

---

## Overall Health

**Satisfaction Distribution:**
| Rating | Count | % |
|--------|-------|---|
| great | X | X% |
| good | X | X% |
| neutral | X | X% |
| poor | X | X% |
| bad | X | X% |

**Positive Rate:** X% (great + good)

**Trend:** [improving / stable / declining]

---

## Mood Patterns

**Most common ending moods:**
1. [mood] - X sessions
2. [mood] - X sessions

**Mood improvement rate:** X% of sessions ended better than they started

---

## Behavioral Patterns

**Recurring Patterns:**
| Pattern | Type | Frequency | Trend |
|---------|------|-----------|-------|
| [name] | problematic | X times | ↑ |
| [name] | positive | X times | → |

**Pattern Insights:**
- [Observation about patterns]

---

## Command Health

**Most Used:**
| Command | Uses | Avg Satisfaction |
|---------|------|------------------|
| [cmd] | X | good |

**Needs Attention:**
| Command | Issue | Evidence |
|---------|-------|----------|
| [cmd] | Often corrected | X poor ratings |

---

## Improvement Backlog

**Signals collected but not acted on:**

| Target | Signal | Frequency | Suggested Action |
|--------|--------|-----------|------------------|
| [target] | [signal] | X times | [action] |

---

## Suggested Adaptations

Based on the data:

1. **[Suggestion]**
   - Evidence: [data that supports this]
   - Action: [what to do]

2. **[Suggestion]**
   - Evidence: [data]
   - Action: [action]

---

## Raw Data

**Recent Highlights:**
- [highlight from recent retro]
- [highlight from recent retro]

**Recent Lowlights:**
- [lowlight]
- [lowlight]

**Quotes (evidence):**
> "[quote from session]"
> "[quote from session]"
```

---

## When to Run

- **Weekly:** Quick health check
- **Monthly:** Deeper analysis, act on suggestions
- **After rough sessions:** Understand what went wrong

---

## Acting on Suggestions

When `/px:improve` suggests changes:

1. **Update context files** - Edit `context/patterns.md`, `context/support-areas.md`
2. **Update system files** - Edit `system/identity/praxis.md` if behavior should change
3. **Log the change** - So future improves know what was done

---

## The Loop

```
Work Sessions
     ↓
/px:retro (capture signal)
     ↓
Database (accumulate)
     ↓
/px:improve (analyze)
     ↓
Suggestions
     ↓
Update System
     ↓
Better Sessions
     ↓
[repeat]
```

**This is how Praxis gets better at helping you.**
