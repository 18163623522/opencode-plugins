---
name: computer-use
description: Control desktop applications via screenshots, mouse clicks, and keyboard input. Use when the user asks to interact with GUI applications, take screenshots, or automate desktop tasks.
---

# Computer Use

You can control the desktop through screenshot analysis and input simulation.

## Available Tools (via MCP)

| Category | Tools | Description |
|----------|-------|-------------|
| Screenshot | `screenshot`, `zoom` | Capture screen or region |
| Mouse | `left_click`, `double_click`, `right_click`, `scroll`, `mouse_move` | Mouse operations |
| Keyboard | `type`, `key`, `hold_key` | Keyboard input |
| Application | `open_application`, `list_running_apps` | App management |
| Clipboard | `read_clipboard`, `write_clipboard` | Clipboard access |

## Workflow

1. Take a screenshot to see current state
2. Analyze the screenshot visually
3. Decide on action (click, type, etc.)
4. Execute the action
5. Take another screenshot to verify result

## Security Rules

- Only interact with explicitly authorized applications
- Never execute dangerous system shortcuts (Cmd+Q, Cmd+Tab, etc.)
- Ask for user confirmation before sensitive operations
- Respect permission tiers: read < click < full

## Platform Support

- **macOS**: Requires Accessibility and Screen Recording permissions
- **Windows**: May require administrator privileges
