# withPraxis — AI Operational Partner Framework

**Version:** 2.0

**Part of the Empire:** PX (`~/personal/praxis/`) • Keeper (`~/personal/keeper/`) • s16e (`~/projects/s16e/`)

---

## Empire Navigation

| What | Where |
|------|-------|
| **This Repo** | `~/projects/with-praxis/` |
| **Brain (Specs, Ideas)** | `~/personal/keeper/projects/with-praxis/` |
| **Praxis Lab** | `~/personal/praxis/` (features get productized here) |
| **Website** | `~/projects/with-praxis-website/` |

---

## What This Is

A context engineering framework that transforms Claude Code into a personalized operational partner.

---

## Structure

```
with-praxis/
├── commands/           # Slash commands
│   ├── px/             # Praxis commands (setup, sync, review, research, sanitize, meeting/)
│   ├── doc/            # Documentation commands (write, polish, validate/)
│   └── dev/            # Development commands (implement)
├── system/             # Identity, knowledge-map
├── context/            # User context templates
├── docs/               # User documentation
└── install.sh          # Installation script
```

---

## Commands Overview

### Praxis Commands (`/px:*`)
- `/px:setup` - Initial configuration wizard
- `/px:sync` - Update context files
- `/px:review` - System health check
- `/px:research` - Structured research (web + local)
- `/px:sanitize` - Clean up speech-to-text transcriptions
- `/px:meeting:analyze` - Meeting transcript analysis (DSGVO-compliant)

### Documentation Commands (`/doc:*`)
- `/doc:write` - Create documentation from code
- `/doc:polish` - Polish docs (--readable or --compact mode)
- `/doc:validate:links` - Validate links
- `/doc:validate:code-references` - Validate code refs
- `/doc:validate:performance-claims` - Catch unverified metrics

### Development Commands (`/dev:*`)
- `/dev:implement` - 5-phase development pipeline with quality gates

---

## Core Concepts

### Context Engineering
- Minimal deployed context (~10KB)
- Just-in-time loading via knowledge map
- Commands specify what context they need
- No context pollution

### Quality Gates
- Implementation-blind testing (agent doesn't see code)
- Context-blind review (agent doesn't see chat history)
- Validation between phases

### DSGVO Compliance
Meeting analysis follows strict rules:
- Analyze the meeting, not the people
- No "who said what" attribution
- No behavior assessments
- No personal profiles

---

**Philosophy:** AI as operational partner, not assistant. Knows your context, challenges your patterns, helps you build without breaking.
