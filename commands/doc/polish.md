---
description: Polish documentation - readable (default) or compact mode
argument-hint: <file> [--compact|-c] [--readable|-r] [--preview]
---

# /doc:polish - Documentation Polish

**Purpose:** Make documentation better. Two modes: readable (default) or compact.

---

## Usage

```bash
/doc:polish <file>                 # Default: readable mode
/doc:polish <file> --compact       # Compress: minimal tokens
/doc:polish <file> --readable      # Explicit: optimize for humans
/doc:polish <file> --preview       # Dry run: show changes without applying
```

**Aliases:** `-c` = `--compact`, `-r` = `--readable`

---

## Modes

### `--readable` (Default)

**Goal:** Easy to understand, quick to scan.

**What it does:**
- Structure: Add headings, chunk lists (3-7 items)
- Scannable: F-pattern optimization, inverted pyramid
- Flow: Logical order, progressive disclosure
- Clarity: Break dense paragraphs, specific headings

**Use for:**
- User-facing docs, READMEs, guides
- Onboarding documentation
- Anything humans need to read and understand

**Metrics:**
- Flesch-Kincaid target: ≤ 12 (high school level)
- Scannability: 60-second comprehension
- Lists: 3-7 items (or chunked)
- Paragraphs: ≤ 5 sentences

---

### `--compact`

**Goal:** Minimal tokens, maximum signal.

**What it does:**
- Remove: Filler words, redundancy, verbose phrases
- Tighten: "in order to" → "to", passive → active
- Consolidate: Multiple examples → 1-2 best
- Eliminate: Duplication, over-explanation

**Use for:**
- Context files (CLAUDE.md, prompts)
- System prompts where tokens cost
- Internal reference docs
- Anywhere brevity = value

**Target reduction:** 30-50% without losing meaning

**Compression rules:**
```
"in order to" → "to"
"we need to ensure that" → "ensure"
"it is important to note that" → [remove]
"as mentioned above" → [remove]
Passive → Active: "should be performed" → "perform"
```

---

## What's Preserved (Both Modes)

- ✅ Technical accuracy (content unchanged)
- ✅ Code examples (exact syntax)
- ✅ Links (all preserved)
- ✅ Meaning (structure/format changes only)

---

## Flags

| Flag | Alias | Effect |
|------|-------|--------|
| `--readable` | `-r` | Optimize for human comprehension (default) |
| `--compact` | `-c` | Minimize size, remove redundancy |
| `--preview` | - | Show changes without applying |

---

## When to Use

| Scenario | Mode |
|----------|------|
| User docs, READMEs | `--readable` (default) |
| CLAUDE.md, prompts | `--compact` |
| Context files | `--compact` |
| Onboarding guides | `--readable` |
| Internal reference | `--compact` |
| Published docs | `--readable` |

---

## Skip When

- ❌ Document already polished
- ❌ Code files (markdown/docs only)
- ❌ Legal/compliance text (exact wording required)
- ❌ Templates (intentionally structured)

---

**Philosophy:**
- **Readable:** Scannable in 60 seconds, depth on demand
- **Compact:** Every word earns its place, no fluff
