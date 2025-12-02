---
description: Validate performance claims have evidence and benchmarks
argument-hint: <file-or-pattern>
---

# /doc:validate:performance-claims - Performance Claim Validation

**Purpose:** Catch unverified performance claims (LLM hallucinations).

**Usage:** `/doc:validate:performance-claims <file-or-pattern>`

---

## What It Catches

- **Unverified metrics:** "10x faster" - where's the benchmark?
- **Vague improvements:** "significantly reduces" - by how much?
- **Speed claims:** "executes in 2ms" - prove it
- **Percentage claims:** "reduces by 40%" - show the data

---

## Output

```
⚠️ 3 unverified claims found:

Line 45: "10x faster than previous version"
  → No benchmark found. Add evidence or remove claim.

Line 89: "processes in under 100ms"
  → Found: benchmarks/perf.md shows 95ms avg ✅

Line 112: "reduces memory usage by 40%"
  → No evidence. Add benchmark or change to qualitative.
```

---

## Why This Matters

LLMs (including the one writing docs) can hallucinate performance numbers. This command catches claims before they become misinformation.

---

## When to Use

- Before publishing technical docs
- After AI-generated documentation
- When reviewing PRs with performance claims
- Anytime you see specific numbers
