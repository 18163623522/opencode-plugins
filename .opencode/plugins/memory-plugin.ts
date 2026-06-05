import type { Plugin } from "@opencode-ai/plugin"
import { readFileSync, writeFileSync, mkdirSync, existsSync, readdirSync } from "fs"
import { join, dirname } from "path"
import { homedir } from "os"

const MEMORY_DIR = join(homedir(), ".config", "opencode", "memory")
const MEMORY_INDEX = join(MEMORY_DIR, "MEMORY.md")
const CONVERSATION_BUFFER_FILE = join(MEMORY_DIR, ".conversation-buffer.json")

interface MemoryEntry {
  name: string
  type: "user" | "feedback" | "project" | "reference"
  description: string
  content: string
  filePath: string
}

interface ConversationMessage {
  role: "user" | "assistant"
  content: string
  timestamp: number
}

interface ConversationBuffer {
  messages: ConversationMessage[]
  lastExtraction: number
  sessionId: string
}

function ensureMemoryDir() {
  if (!existsSync(MEMORY_DIR)) {
    mkdirSync(MEMORY_DIR, { recursive: true })
  }
}

function parseMemoryFile(filePath: string): MemoryEntry | null {
  try {
    const raw = readFileSync(filePath, "utf-8")
    const fmMatch = raw.match(/^---\n([\s\S]*?)\n---\n([\s\S]*)$/)
    if (!fmMatch) return null

    const fm = fmMatch[1]
    const content = fmMatch[2].trim()
    const name = fm.match(/name:\s*(.+)/)?.[1]?.trim() ?? ""
    const type = (fm.match(/type:\s*(\w+)/)?.[1]?.trim() ?? "project") as MemoryEntry["type"]
    const description = fm.match(/description:\s*(.+)/)?.[1]?.trim() ?? ""

    return { name, type, description, content, filePath }
  } catch {
    return null
  }
}

function loadAllMemories(): MemoryEntry[] {
  ensureMemoryDir()
  if (!existsSync(MEMORY_DIR)) return []

  const files = readdirSync(MEMORY_DIR).filter(
    (f) => f.endsWith(".md") && f !== "MEMORY.md"
  )
  return files
    .map((f) => parseMemoryFile(join(MEMORY_DIR, f)))
    .filter((m): m is MemoryEntry => m !== null)
}

function saveMemory(entry: Omit<MemoryEntry, "filePath">) {
  ensureMemoryDir()
  const fileName = `${entry.type}_${entry.name}.md`
  const filePath = join(MEMORY_DIR, fileName)
  const frontmatter = `---\nname: ${entry.name}\ndescription: ${entry.description}\ntype: ${entry.type}\n---\n`
  writeFileSync(filePath, frontmatter + entry.content + "\n", "utf-8")
  rebuildIndex()
}

function rebuildIndex() {
  const memories = loadAllMemories()
  const lines = memories.map((m) => {
    const icon = { user: "👤", feedback: "💬", project: "📁", reference: "🔗" }[m.type]
    return `- ${icon} [${m.name}](${m.type}_${m.name}.md) — ${m.description}`
  })

  const index = `# Memory Index\n\n${lines.join("\n")}\n`
  writeFileSync(MEMORY_INDEX, index, "utf-8")
}

function deleteMemory(namePattern: string): boolean {
  ensureMemoryDir()
  const files = readdirSync(MEMORY_DIR).filter(
    (f) => f.endsWith(".md") && f !== "MEMORY.md" && f.includes(namePattern)
  )
  if (files.length === 0) return false

  for (const f of files) {
    const { unlinkSync } = require("fs")
    unlinkSync(join(MEMORY_DIR, f))
  }
  rebuildIndex()
  return true
}

// Conversation buffer management
function loadConversationBuffer(): ConversationBuffer {
  try {
    if (existsSync(CONVERSATION_BUFFER_FILE)) {
      return JSON.parse(readFileSync(CONVERSATION_BUFFER_FILE, "utf-8"))
    }
  } catch {}
  return { messages: [], lastExtraction: Date.now(), sessionId: "" }
}

function saveConversationBuffer(buffer: ConversationBuffer) {
  ensureMemoryDir()
  writeFileSync(CONVERSATION_BUFFER_FILE, JSON.stringify(buffer, null, 2), "utf-8")
}

function addToBuffer(role: "user" | "assistant", content: string) {
  const buffer = loadConversationBuffer()
  buffer.messages.push({ role, content, timestamp: Date.now() })
  
  // Keep only last 50 messages to avoid buffer growing too large
  if (buffer.messages.length > 50) {
    buffer.messages = buffer.messages.slice(-50)
  }
  
  saveConversationBuffer(buffer)
}

// Memory extraction prompt
function buildExtractionPrompt(messages: ConversationMessage[], existingMemories: MemoryEntry[]): string {
  const conversationText = messages
    .map((m) => `${m.role}: ${m.content.slice(0, 500)}`)
    .join("\n")

  const existingMemoryNames = existingMemories.map((m) => `${m.type}:${m.name}`).join(", ")

  return `You are a memory extraction system. Analyze the following conversation and extract information worth remembering for future sessions.

## Rules:
1. Only store things that CANNOT be inferred from code
2. Convert relative dates to absolute dates ("Thursday" → "2026-06-05")
3. Categorize each memory into one of these types:
   - **user**: User role, preferences, skill level (e.g., "10 years Go experience, React beginner")
   - **feedback**: Corrections and affirmations to AI behavior (e.g., "Don't add summaries at end of replies")
   - **project**: Project context not derivable from code (e.g., "Merge freeze after Thursday")
   - **reference**: Pointers to external systems (e.g., "Bug tracking at Linear INGEST project")

4. Do NOT store:
   - Code structure, file locations, or git history
   - Debugging solutions that are already fixed in code
   - Information easily found in the codebase

5. Keep memories concise and actionable
6. Use kebab-case for memory names
7. If no new information worth remembering is found, return "NO_NEW_MEMORIES"

## Existing memories (do not duplicate):
${existingMemoryNames || "None"}

## Conversation to analyze:
${conversationText}

## Output format:
Return a JSON array of memories to save. Each memory should have:
- name: short kebab-case identifier
- type: user|feedback|project|reference
- description: one-line summary
- content: detailed markdown content

Example:
[
  {
    "name": "user-go-experience",
    "type": "user",
    "description": "User has 10 years Go experience but is new to React",
    "content": "Experienced Go developer, React beginner. Prefers backend analogies when explaining frontend concepts."
  }
]

If no memories to extract, return: []
`
}

// Extract memories from conversation buffer
async function extractMemoriesFromBuffer(client: any): Promise<number> {
  const buffer = loadConversationBuffer()
  
  // Need at least 4 messages to extract meaningful memories
  if (buffer.messages.length < 4) {
    return 0
  }

  // Check if enough time has passed since last extraction (at least 5 minutes)
  const timeSinceLastExtraction = Date.now() - buffer.lastExtraction
  if (timeSinceLastExtraction < 5 * 60 * 1000) {
    return 0
  }

  const existingMemories = loadAllMemories()
  const prompt = buildExtractionPrompt(buffer.messages, existingMemories)

  try {
    // Use the client to call the LLM for memory extraction
    const response = await client.chat({
      messages: [
        { role: "system", content: "You are a memory extraction assistant. Extract only meaningful, non-obvious information from conversations." },
        { role: "user", content: prompt }
      ],
      model: "anthropic/claude-sonnet-4-5",
      max_tokens: 2000
    })

    const content = response.choices?.[0]?.message?.content
    if (!content || content.includes("NO_NEW_MEMORIES") || content.includes("[]")) {
      // Update last extraction time even if no memories found
      buffer.lastExtraction = Date.now()
      saveConversationBuffer(buffer)
      return 0
    }

    // Parse the JSON response
    const jsonMatch = content.match(/\[[\s\S]*\]/)
    if (!jsonMatch) {
      return 0
    }

    const memories = JSON.parse(jsonMatch[0])
    let savedCount = 0

    for (const memory of memories) {
      if (memory.name && memory.type && memory.description && memory.content) {
        saveMemory({
          name: memory.name,
          type: memory.type,
          description: memory.description,
          content: memory.content
        })
        savedCount++
      }
    }

    // Update buffer with extraction timestamp
    buffer.lastExtraction = Date.now()
    buffer.messages = [] // Clear buffer after successful extraction
    saveConversationBuffer(buffer)

    return savedCount
  } catch (error) {
    console.error("Memory extraction failed:", error)
    return 0
  }
}

export default (async ({ $, client }) => {
  ensureMemoryDir()

  return {
    config: (cfg) => {
      // Inject memory context into instructions
      const memories = loadAllMemories()
      if (memories.length > 0) {
        const memoryContext = memories
          .map((m) => `[${m.type}:${m.name}] ${m.description}: ${m.content.slice(0, 200)}`)
          .join("\n")

        if (!cfg.instructions) cfg.instructions = []
        cfg.instructions.push("memory-context.md")
      }
    },

    event: async (input) => {
      // Listen for session end events to trigger memory extraction
      if (input.type === "session.end") {
        // Extract memories when session ends
        const count = await extractMemoriesFromBuffer(client)
        if (count > 0) {
          console.log(`[Memory] Extracted ${count} new memories from conversation`)
        }
      }
    },

    "message.complete": async (input, output) => {
      // Add messages to conversation buffer for later extraction
      if (input.type === "message.complete") {
        const message = input.message
        if (message.role === "user") {
          addToBuffer("user", message.content)
        } else if (message.role === "assistant") {
          addToBuffer("assistant", message.content)
        }
      }
    },

    // Custom tool: save_memory
    tool: {
      save_memory: {
        description: "Save a persistent memory across sessions. Use when user says 'remember' or provides information worth keeping.",
        parameters: {
          type: "object",
          properties: {
            name: { type: "string", description: "Short kebab-case name for the memory" },
            type: { type: "string", enum: ["user", "feedback", "project", "reference"], description: "Memory category" },
            description: { type: "string", description: "One-line description" },
            content: { type: "string", description: "Full memory content in markdown" },
          },
          required: ["name", "type", "description", "content"],
        },
        execute: async (args) => {
          saveMemory({
            name: args.name as string,
            type: args.type as MemoryEntry["type"],
            description: args.description as string,
            content: args.content as string,
          })
          return `Memory saved: ${args.name} (type: ${args.type})`
        },
      },

      list_memories: {
        description: "List all stored memories. Use when user asks to see memories.",
        parameters: { type: "object", properties: {} },
        execute: async () => {
          const memories = loadAllMemories()
          if (memories.length === 0) return "No memories stored."
          return memories
            .map((m) => `[${m.type}] ${m.name}: ${m.description}`)
            .join("\n")
        },
      },

      delete_memory: {
        description: "Delete a memory by name pattern. Use when user says 'forget about...'",
        parameters: {
          type: "object",
          properties: {
            pattern: { type: "string", description: "Name pattern to match and delete" },
          },
          required: ["pattern"],
        },
        execute: async (args) => {
          const deleted = deleteMemory(args.pattern as string)
          return deleted
            ? `Deleted memories matching: ${args.pattern}`
            : `No memories found matching: ${args.pattern}`
        },
      },

      search_memories: {
        description: "Search memories by keyword. Use when user asks to recall something specific.",
        parameters: {
          type: "object",
          properties: {
            query: { type: "string", description: "Search keyword" },
          },
          required: ["query"],
        },
        execute: async (args) => {
          const memories = loadAllMemories()
          const query = (args.query as string).toLowerCase()
          const results = memories.filter(
            (m) =>
              m.name.toLowerCase().includes(query) ||
              m.description.toLowerCase().includes(query) ||
              m.content.toLowerCase().includes(query)
          )
          if (results.length === 0) return `No memories found for: ${args.query}`
          return results
            .map((m) => `[${m.type}] ${m.name}: ${m.description}\n${m.content.slice(0, 300)}`)
            .join("\n---\n")
        },
      },

      extract_memories: {
        description: "Manually trigger memory extraction from recent conversation. Use when user says 'extract memories' or 'save what we discussed'.",
        parameters: { type: "object", properties: {} },
        execute: async () => {
          const count = await extractMemoriesFromBuffer(client)
          if (count === 0) return "No new memories to extract from recent conversation."
          return `Extracted and saved ${count} memories from conversation.`
        },
      },

      clear_conversation_buffer: {
        description: "Clear the conversation buffer without extracting memories. Use when user says 'clear buffer' or 'start fresh'.",
        parameters: { type: "object", properties: {} },
        execute: async () => {
          const buffer = loadConversationBuffer()
          buffer.messages = []
          buffer.lastExtraction = Date.now()
          saveConversationBuffer(buffer)
          return "Conversation buffer cleared."
        },
      },
    },
  }
}) satisfies Plugin