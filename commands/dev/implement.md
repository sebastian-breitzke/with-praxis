---
description: Development orchestrator - coordinates implementation with quality gates
argument-hint: <description> [--main|--worktree]
---

# Development Orchestrator

**Purpose:** Coordinate implementation with testing and review phases.

---

## Overview

This orchestrator runs development in 5 distinct phases with validation between each:

**Phase 0:** Context & Planning → Understand requirements, create todo-list, setup branch
**Phase 1:** Implementation → Write code following patterns
**Phase 2:** Testing → Behavioral tests (implementation-blind)
**Phase 3:** Review → Code review (context-blind)
**Phase 4:** Finalize → Docs, PR, summary

**Validation gates:** After each phase, verify outputs before proceeding.

---

## Philosophy

### Quality Over Speed

Agents are cheap labor. Use them:
- **P2 Testing:** Spawn agent that ONLY sees interfaces + spec, NOT implementation
- **P3 Review:** Spawn agent that ONLY sees code + spec, NOT chat history

Why? Prevents confirmation bias. Fresh eyes catch what context-polluted eyes miss.

### Pragmatism

- Good craftsmanship: readable, tested, maintainable
- Simple solutions for simple problems
- Patterns when justified, not for complexity's sake
- No over-engineering

---

## Branch Strategy

| Flag | Behavior |
|------|----------|
| (default) | Create new branch `feature/<name>` |
| `--main` | Work directly on main (show warning) |
| `--worktree` | Create git worktree for parallel work |

---

## Phase Details

### Phase 0: Context & Planning

1. Understand requirements (spec or inline description)
2. Identify related code and patterns
3. Create implementation plan with TodoWrite
4. Setup branch

**Validation:** Requirements clear? Plan created? Branch ready?

### Phase 1: Implementation

1. Work through todos systematically
2. Follow existing patterns
3. Self-review as you go

**Validation:** All P1 todos done? Code compiles? Follows patterns?

### Phase 2: Testing (Implementation-Blind)

**Critical:** Testing agent must NOT see implementation code.

Agent receives:
- Interface/function signatures (what to call)
- Requirements (what it should do)
- Expected behaviors (inputs → outputs)

Agent does NOT receive:
- Implementation code
- Chat context about how it was built

**Validation:** Tests written? Tests pass? Critical paths covered?

### Phase 3: Review (Context-Blind)

**Critical:** Review agent must NOT have implementation context.

Agent receives:
- Changed files (the code)
- Requirements (what it should do)
- Test results (from P2)

Agent does NOT receive:
- Chat history
- Why decisions were made

**Validation:** Review passed? Issues fixed? Tests still pass?

### Phase 4: Finalize

1. Update documentation (if needed)
2. Run full test suite
3. Run build
4. Create PR
5. Generate summary

**Validation:** All tests pass? Build succeeds? PR created?

---

## Loop Conditions

Phases can loop back when issues found:

- **P2 → P1:** Testability needs abstraction
- **P3 → P1:** Refactoring needed
- **P3 → P2:** More tests needed

---

## Output

On completion, generate summary:

```
✅ Implementation Complete

📋 Phase 0: Context & Planning
   Requirements: [source]
   Branch: feature/xxx
   Todos: X items planned

⚡ Phase 1: Implementation
   Files changed: X
   Patterns followed: [what patterns]

🧪 Phase 2: Testing
   Tests written: X
   All passing: ✓

🔍 Phase 3: Review
   Review verdict: ✓ Clean
   Issues found: X

📦 Phase 4: Finalize
   Build: ✓ Passing
   Tests: ✓ X/X passing
   PR: #123 (URL)

📝 Summary:
   - [What was built]
```

---

## Anti-Patterns

❌ **Skip phases** — Each phase has a purpose
❌ **Show code to testing agent** — Defeats implementation-blind testing
❌ **Include chat history in review** — Defeats context-blind review
❌ **Skip validation gates** — Fix issues before proceeding
❌ **Over-engineer** — Simple solutions, not clever ones
