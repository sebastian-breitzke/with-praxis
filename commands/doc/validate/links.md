---
description: Validate all links in documentation - internal, external, anchors
argument-hint: <file-or-pattern>
---

# /doc:validate:links - Link Validation

**Purpose:** Check all links in documentation resolve correctly.

**Usage:** `/doc:validate:links <file-or-pattern>`

---

## What It Checks

- **Internal links:** `[text](./other-file.md)` - file exists?
- **Anchors:** `[text](#section)` - heading exists?
- **External links:** `[text](https://...)` - resolvable?
- **Relative paths:** Correct path resolution

---

## Output

```
✅ 15 links validated
❌ 2 broken links found:

Line 23: [Setup](docs/setup.md) - file not found
  → Suggestion: docs/guides/setup.md

Line 67: [API](#api-reference) - anchor not found
  → Available anchors: #api, #reference, #api-docs
```

---

## When to Use

- After restructuring documentation
- After file renames/moves
- Before publishing
- After polish/compress (links can break)
