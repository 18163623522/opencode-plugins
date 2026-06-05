---
name: conversation-viewer
description: View and search past conversation sessions. Use when user asks to see conversation history, find past discussions, or review previous work.
---

# Conversation Viewer

View, search, and browse past opencode conversation sessions with an **opencode-style UI**.

## Features

- **List Sessions**: See recent conversation sessions with previews
- **View Details**: Read full conversation content
- **Search**: Find conversations by keyword or topic
- **Database Info**: Check database location and status
- **TUI Interface**: Native opencode-style terminal UI

## Commands

- **"Show my recent conversations"** — List recent sessions
- **"Find conversation about [topic]"** — Search by keyword
- **"View conversation [id]"** — See full conversation
- **"Where is my database?"** — Get database location info

## TUI Interface

The conversation viewer has a native opencode-style terminal UI:

### Keyboard Shortcuts
- `Ctrl+H` — Open conversation history
- `Enter` — Select/view conversation
- `Esc` — Go back to list
- `Arrow keys` — Navigate list

### Features
- **Search Bar**: Filter conversations by keyword
- **Session List**: Shows session title, date, and message count
- **Message View**: Displays full conversation with role indicators
- **Relative Timestamps**: Shows "5m ago", "2h ago", etc.

## How It Works

The plugin reads opencode's session storage:
1. Looks for JSONL session files in data directories
2. Parses conversation messages and metadata
3. Provides search and viewing capabilities
4. Renders with opencode's native TUI components

## Storage Locations

opencode stores sessions in:
- **Linux/macOS**: `~/.local/share/opencode/`
- **Windows**: `%APPDATA%\opencode\`
- **XDG**: `$XDG_DATA_HOME/opencode/`

Session files are typically:
- `.jsonl` files (JSON Lines format)
- Organized by project or session ID

## Troubleshooting

If no conversations are found:
1. Make sure you've used opencode before
2. Check if the database exists at the expected location
3. Use `get_database_info` to verify the storage path
4. Try creating a new session first, then check again

## Tips

- Use specific keywords for better search results
- Session IDs are usually the first 8 characters of the full ID
- Conversations are sorted by date (most recent first)
- Large conversations may take a moment to load
- Use `Ctrl+H` for quick access from anywhere