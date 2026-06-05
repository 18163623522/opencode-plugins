# Conversation Viewer Plugin Test

This file tests the conversation viewer plugin functionality.

## Test Commands

After installing the plugin, try these commands:

1. **List conversations**: "Show my recent conversations"
2. **Get database info**: "Where is my opencode database?"
3. **Search conversations**: "Find conversations about memory"
4. **View conversation**: "View conversation [session-id]"

## Expected Behavior

The plugin should:
- Find the opencode database at `~/.local/share/opencode/opencode.db`
- List recent sessions with previews
- Allow searching by keyword
- Show full conversation content

## Troubleshooting

If no conversations are found:
1. Check if the database exists
2. Verify the plugin is loaded
3. Try creating a new session first