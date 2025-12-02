---
description: Create/update documentation after implementation, extract patterns from code
argument-hint: <what-to-document>
---

# /doc:write - Create/Update Documentation

**Purpose:** Keep documentation current after implementation, extract patterns from code into standards.

**Usage:** `/doc:write "<what-to-document>"`

---

## What This Does

**Documentation Types:**
1. **API Docs:** Auto-generate from code, keep in sync with implementation
2. **Architecture Docs:** System diagrams, decision records
3. **Runbooks:** Operational guides, troubleshooting steps
4. **Onboarding Docs:** Getting started, how-tos
5. **Pattern Extraction:** Code → Standards (reusable patterns)

**Philosophy:**
- Docs should be useful (not decorative)
- Extract patterns from working code (not theoretical)
- Keep docs close to code (markdown in repo)
- Auto-generate where possible (less manual work)

---

## How to Use

**After Feature Implementation:**

```bash
# 1. Implement feature
# 2. Document it
/doc:write "dark mode feature (toggle, persistence, theme system)"

# Documenter does:
# - API docs: ThemeService methods
# - Pattern extraction: "UI Feature Toggle Pattern"
# - User guide: How to use dark mode
```

**Pattern Extraction:**

```bash
# After implementing similar feature 3rd time
/doc:write "notification service pattern"

# Analyzes:
# - EmailNotificationService
# - SMSNotificationService
# - PushNotificationService
# - Extracts: INotificationProvider pattern
# - Documents: When to use, how to implement
```

---

## Output

Documentation written to appropriate location with:
- Clear structure (headers, sections)
- Code examples (copy-paste ready)
- Links to related docs
- Extracted patterns (if applicable)

---

## When to Use

**Use `/doc:write` for:**
- ✅ After implementing features
- ✅ API documentation
- ✅ Architecture decisions
- ✅ Pattern extraction from code
- ✅ Runbooks and how-tos

**Skip when:**
- ❌ Trivial changes (no docs needed)
- ❌ Already documented (use `/doc:polish` instead)
