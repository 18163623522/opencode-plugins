---
name: memory
description: Manage persistent cross-session memory with automatic extraction. Use when the user says "remember", "forget", "memory", or asks to recall previous context.
---

# Memory System

You have access to a persistent memory system that remembers context across sessions with **automatic extraction**.

## Key Features

- **Automatic Extraction**: Memories are automatically extracted from conversations at session end
- **Manual Control**: Users can also manually save, search, and manage memories
- **Smart Categorization**: Memories are categorized into 4 types for easy retrieval
- **Conversation Buffer**: Recent messages are buffered for extraction analysis

## Memory Types

| Type | What to store | Example |
|------|---------------|---------|
| **user** | User role, preferences, skill level | "10 years Go experience, React beginner" |
| **feedback** | Corrections and affirmations to your behavior | "Don't add summaries at end of replies" |
| **project** | Project context not derivable from code | "Merge freeze after Thursday" |
| **reference** | Pointers to external systems | "Bug tracking at Linear INGEST project" |

## How Memory Works

- Memory files are stored in `~/.config/opencode/memory/`
- Each memory is a Markdown file with YAML frontmatter
- `MEMORY.md` is the index file, always loaded into context
- Only store things that **cannot be inferred from code**
- Conversation buffer stores recent messages for automatic extraction

## Commands

- **"Remember: [info]"** — Save a new memory manually
- **"Forget about [topic]"** — Delete a memory
- **"List memories"** — Show all stored memories
- **"Search memories about [topic]"** — Search memories by keyword
- **"Extract memories"** — Manually trigger extraction from recent conversation
- **"Clear buffer"** — Clear conversation buffer without extracting

## Automatic Extraction

The system automatically extracts memories when:
1. A session ends
2. At least 4 messages are in the buffer
3. At least 5 minutes have passed since last extraction

Extraction analyzes recent conversation and saves:
- User preferences and corrections
- Project context not in code
- External system references
- Important decisions or constraints

## Memory File Format

```markdown
---
name: memory-name
description: Brief description
type: user|feedback|project|reference
---

Content of the memory in markdown.
```

## Rules

1. Always use `type` to categorize memories
2. Convert relative dates to absolute dates ("Thursday" → "2026-06-05")
3. Before using stale memories (>1 day), verify the info is still current
4. Don't store things easily found in code (file structure, git history)
5. Keep MEMORY.md index under 200 lines
6. Use kebab-case for memory names (e.g., "user-go-experience")
7. Be concise but actionable in memory content

## Best Practices

### For Users
- Correct the AI when it makes mistakes - these become feedback memories
- Share your role and preferences - these become user memories
- Mention external systems and tools - these become reference memories
- State project constraints and deadlines - these become project memories

### For AI
- Check memories at session start for context
- Reference memories when making decisions
- Update memories when information changes
- Don't duplicate information already in code