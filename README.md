# withPraxis

**Transform Claude Code into your AI Operational Partner.**

Not an assistant. Not a tool. A partner who knows your context, challenges your patterns, and helps you build without breaking.

> *"Praxis"* — Greek: practical action, as opposed to theory. This is AI in practice.

---

## What is this?

Praxis is a context engineering framework for Claude Code that turns generic AI into a personalized operational partner:

- **Knows who you are** — Your role, working style, priorities
- **Knows your team** — Key people, relationships, how to communicate
- **Challenges your patterns** — Recognizes when you're falling into unsustainable habits
- **Maintains itself** — Self-updating context, validation, review cycles

### The Problem

Claude Code is powerful, but it starts fresh every conversation. You repeat context. It doesn't know your preferences. It can't challenge you on patterns it doesn't know about.

### The Solution

Praxis structures your context so Claude:
- Loads what it needs, when it needs it (not everything upfront)
- Knows how to communicate with you (direct? supportive? challenging?)
- Recognizes your anti-patterns and intervenes
- Maintains and updates its own knowledge

---

## Quick Start

```bash
# Clone the repo
git clone https://github.com/sebastian-breitzke/with-praxis.git
cd with-praxis

# Run the installer
./install.sh

# Start Claude Code and run the guided setup
claude
/px:setup
```

The setup wizard will ask you 5 questions and generate your personalized system.

---

## What You Get

```
~/.claude/
├── CLAUDE.md              # Praxis identity + knowledge map
└── commands/              # Slash commands for workflows
    ├── px/                # Praxis commands
    │   ├── setup.md       # /px:setup - Initial configuration
    │   ├── sync.md        # /px:sync - Update your context
    │   ├── review.md      # /px:review - System health check
    │   ├── research.md    # /px:research - Structured research
    │   ├── sanitize.md    # /px:sanitize - Clean up dictations
    │   └── meeting/
    │       └── analyze.md # /px:meeting:analyze - Meeting analysis
    ├── doc/               # Documentation commands
    │   ├── write.md       # /doc:write - Create docs from code
    │   ├── polish.md      # /doc:polish - Polish docs
    │   └── validate/      # Validation tools
    │       ├── links.md
    │       ├── code-references.md
    │       └── performance-claims.md
    └── dev/               # Development commands
        └── implement.md   # /dev:implement - 5-phase dev pipeline

~/praxis/                  # Your knowledge base
├── context/               # Who you are, your team, priorities
└── patterns/              # Anti-patterns to watch for
```

---

## Commands

### Praxis Commands

| Command | Purpose |
|---------|---------|
| `/px:setup` | Initial configuration wizard |
| `/px:sync` | Update context files |
| `/px:review` | System health check |
| `/px:research` | Structured research (web + local) |
| `/px:sanitize` | Clean up speech-to-text transcriptions |
| `/px:meeting:analyze` | Analyze meeting transcripts |

### Documentation Commands

| Command | Purpose |
|---------|---------|
| `/doc:write` | Create documentation from code |
| `/doc:polish` | Polish docs (--readable or --compact) |
| `/doc:validate:links` | Validate all links |
| `/doc:validate:code-references` | Validate code refs |
| `/doc:validate:performance-claims` | Catch unverified metrics |

### Development Commands

| Command | Purpose |
|---------|---------|
| `/dev:implement` | 5-phase development pipeline |

---

## Core Concepts

### Context Engineering

The key innovation is **just-in-time context loading**:

```
❌ Old way: Load everything into CLAUDE.md upfront
   → Context pollution, token waste, unfocused responses

✅ Praxis way: Minimal identity + knowledge map + load on-demand
   → Focused context, efficient tokens, relevant responses
```

Your CLAUDE.md stays small (~10KB). When Praxis needs your team dynamics for a meeting, it loads that. When doing code review, it loads the relevant patterns. Nothing wasted.

### Pattern Recognition

Define anti-patterns you want to avoid:

```markdown
# firefighter-mode.md

**Pattern:** Solving problems instead of teaching others to solve them
**Signal:** "Let me just fix this real quick"
**Challenge:** "Who could learn to handle this?"
```

Praxis will recognize when you're falling into these patterns and challenge you.

### Quality Gates (Development)

The `/dev:implement` command uses a 5-phase pipeline:

1. **P0: Context & Planning** — Understand requirements, create plan
2. **P1: Implementation** — Write code following patterns
3. **P2: Testing** — Implementation-blind (agent doesn't see code)
4. **P3: Review** — Context-blind (agent doesn't see chat history)
5. **P4: Finalize** — Docs, tests, PR

Why blind testing/review? Prevents confirmation bias. Fresh eyes catch what context-polluted eyes miss.

### DSGVO-Compliant Meeting Analysis

Meeting analysis follows strict privacy rules:

| ✅ Allowed | ❌ Not Allowed |
|-----------|----------------|
| What was decided | Who said what |
| Format assessment | Behavior assessment |
| Anonymized insights | Personal profiles |

---

## Customization

After setup, customize by editing:

- `~/praxis/context/person.md` — Your profile
- `~/praxis/context/team.md` — Your team
- `~/praxis/context/priorities.md` — Current focus
- `~/praxis/patterns/` — Anti-patterns to watch

See [docs/customization.md](docs/customization.md) for details.

---

## Documentation

- [Getting Started](docs/getting-started.md)
- [Customization Guide](docs/customization.md)
- [Context Engineering](docs/context-engineering.md)
- [FAQ](docs/faq.md)

---

## Philosophy

**Praxis is not:**
- A prompt template
- A collection of tricks
- An assistant that does what you say

**Praxis is:**
- An operational partner
- A context engineering framework
- A system that challenges you when needed

The goal isn't to make Claude do more for you. It's to make Claude work *with* you, knowing your context, your patterns, and when to push back.

---

## License

MIT — Use it, fork it, make it yours.

---

## Credits

Created by [Sebastian Breitzke](https://s16e.com)

Built with Claude Code. Powered by context engineering.
