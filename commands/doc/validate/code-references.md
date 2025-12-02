---
description: Validate code references - function names, line numbers, paths
argument-hint: <file-or-pattern>
---

# /doc:validate:code-references - Code Reference Validation

**Purpose:** Verify that code references in documentation actually exist in the codebase.

**Usage:** `/doc:validate:code-references <file-or-pattern>`

---

## What It Checks

- **Method names:** `userService.create()` - method exists?
- **File paths:** `src/services/auth.ts` - file exists?
- **Line numbers:** `auth.ts:45` - line exists and matches context?
- **Signatures:** `getUser(id: string)` - params correct?

---

## Output

```
✅ 8 code references validated
❌ 2 invalid references:

Line 34: shipmentService.getById(id, options)
  → Found: getById(id) - signature mismatch (extra param)

Line 89: src/utils/helpers.ts
  → File not found (was it renamed?)
```

---

## When to Use

- After code refactoring
- Before publishing technical docs
- When docs feel "stale"
- After major codebase changes
