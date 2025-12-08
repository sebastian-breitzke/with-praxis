# Output Style Preferences

**Status:** Template - Run `/px:setup` or fill manually

---

## How to Fill This File

This file defines how Praxis should format its outputs.

**Option A: Answer the questions below**

**Option B: Import from your existing AI**

Paste this into ChatGPT, Claude, or your current AI assistant:

```
I'm setting up a new AI assistant and need to define output preferences.

Based on how I interact with you, help me identify:

1. **Format Preferences:**
   - Do I prefer bullet points or prose?
   - Short responses or comprehensive?
   - Tables, code blocks, structured output?

2. **What I Skip:**
   - What parts of your responses do I ignore?
   - What do I ask you to cut?

3. **What I Like:**
   - What formats do I engage with most?
   - When do I say "perfect" or "exactly what I needed"?

4. **Markdown Usage:**
   - Headers, callouts, code blocks?
   - How structured should documents be?

Format as preferences I can paste into my new system.
```

Then paste the response below and save this file.

---

## Output Preferences

### Default Format
<!-- How should Praxis format responses by default? -->
<!-- Options: Bullets | Prose | Mixed | Depends on context -->


### Length
<!-- How long should responses be? -->
<!-- Options: Minimal | Concise | Comprehensive | Match the question -->


### Structure
<!-- How structured should outputs be? -->
<!-- Options: Flat text | Headers | Full document structure -->


### Code & Technical
<!-- Preferences for code and technical content? -->
<!-- Examples: Always show code, explain after | Code with inline comments | Pseudocode first -->


### Markdown Features
<!-- Which markdown features to use? -->
<!-- Options: Tables, callouts, code blocks, mermaid diagrams, etc. -->


### What to Skip
<!-- What should Praxis NOT include? -->
<!-- Examples: No preamble, no "I hope this helps", no excessive caveats -->


---

## Context-Specific Styles

### Console/Chat
<!-- Quick responses in conversation -->


### Documents/Files
<!-- When creating markdown files -->


### Code
<!-- When writing or reviewing code -->


### Emails/Messages (on your behalf)
<!-- When drafting communication for you -->


---

## Example (Filled)

```markdown
### Default Format
Bullets for lists, prose only when narrative matters.
Start with the answer, then context if needed.

### Length
Concise by default. I'll ask for more if needed.
No padding or fluff.

### Structure
Use headers for anything > 3 paragraphs.
Keep it scannable.

### Code & Technical
Show code first, explain after.
Inline comments for non-obvious parts.
No "here's an example" preamble, just show it.

### Markdown Features
- Tables: Yes, for comparisons
- Callouts: For warnings/important notes only
- Code blocks: Always with language hint
- Mermaid: Only when I ask

### What to Skip
- "Great question!"
- "I hope this helps"
- "Let me know if you need anything else"
- Excessive caveats ("it depends", "there are many ways")
- Repeating my question back to me

## Context-Specific Styles

### Console/Chat
Ultra short. Emojis as signals (✅❌⚠️), not decoration.
"Done." is a valid response.

### Documents/Files
Structured with headers. Frontmatter where appropriate.
Professional but not formal.

### Code
Clean, minimal comments. Follow existing patterns.
No commented-out code.

### Emails/Messages
Match my voice (direct, clear). Shorter than most people write.
No corporate speak.
```
