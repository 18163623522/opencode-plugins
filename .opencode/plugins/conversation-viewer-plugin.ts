import type { Plugin } from "@opencode-ai/plugin"
import { existsSync, readFileSync, readdirSync, statSync } from "fs"
import { join, basename } from "path"
import { homedir } from "os"

// Database path detection
function getDatabasePath(): string {
  const xdgData = process.env.XDG_DATA_HOME || join(homedir(), ".local", "share")
  const dbPath = join(xdgData, "opencode", "opencode.db")
  
  if (existsSync(dbPath)) {
    return dbPath
  }
  
  // Try Windows AppData
  const appData = process.env.APPDATA || join(homedir(), "AppData", "Roaming")
  const winDbPath = join(appData, "opencode", "opencode.db")
  
  if (existsSync(winDbPath)) {
    return winDbPath
  }
  
  // Try direct .config path
  const configPath = join(homedir(), ".config", "opencode", "opencode.db")
  if (existsSync(configPath)) {
    return configPath
  }
  
  return dbPath // Return default even if not exists
}

// Alternative: Read session files from data directory
function getDataDir(): string {
  const xdgData = process.env.XDG_DATA_HOME || join(homedir(), ".local", "share")
  const dataDir = join(xdgData, "opencode")
  
  if (existsSync(dataDir)) {
    return dataDir
  }
  
  // Try Windows AppData
  const appData = process.env.APPDATA || join(homedir(), "AppData", "Roaming")
  const winDataDir = join(appData, "opencode")
  
  if (existsSync(winDataDir)) {
    return winDataDir
  }
  
  // Try direct .config path
  const configPath = join(homedir(), ".config", "opencode")
  if (existsSync(configPath)) {
    return configPath
  }
  
  return dataDir
}

// Find all session files
function findSessionFiles(): string[] {
  const dataDir = getDataDir()
  const sessionFiles: string[] = []
  
  // Look for .jsonl files (session transcripts)
  const searchDirs = [
    join(dataDir, "sessions"),
    join(dataDir, "projects"),
    dataDir
  ]
  
  for (const dir of searchDirs) {
    if (!existsSync(dir)) continue
    
    try {
      const files = readdirSync(dir)
      for (const file of files) {
        const fullPath = join(dir, file)
        const stat = statSync(fullPath)
        
        if (stat.isFile() && (file.endsWith('.jsonl') || file.endsWith('.json'))) {
          sessionFiles.push(fullPath)
        } else if (stat.isDirectory()) {
          // Search subdirectories
          try {
            const subFiles = readdirSync(fullPath)
            for (const subFile of subFiles) {
              const subPath = join(fullPath, subFile)
              const subStat = statSync(subPath)
              if (subStat.isFile() && (subFile.endsWith('.jsonl') || subFile.endsWith('.json'))) {
                sessionFiles.push(subPath)
              }
            }
          } catch {}
        }
      }
    } catch {}
  }
  
  return sessionFiles
}

// Parse a JSONL session file
function parseSessionFile(filePath: string): any {
  try {
    const content = readFileSync(filePath, 'utf-8')
    const lines = content.split('\n').filter(line => line.trim())
    
    const session: any = {
      id: basename(filePath, '.jsonl'),
      messages: [],
      metadata: {}
    }
    
    for (const line of lines) {
      try {
        const entry = JSON.parse(line)
        
        if (entry.type === 'session' || entry.type === 'metadata') {
          session.metadata = { ...session.metadata, ...entry }
        } else if (entry.type === 'user' || entry.type === 'assistant') {
          session.messages.push({
            role: entry.type,
            content: entry.content || entry.message || '',
            timestamp: entry.timestamp
          })
        }
      } catch {}
    }
    
    return session
  } catch {
    return null
  }
}

// Get recent sessions
function getRecentSessions(limit: number = 10): any[] {
  const sessionFiles = findSessionFiles()
  const sessions: any[] = []
  
  for (const file of sessionFiles.slice(0, limit * 2)) { // Read more files to get enough valid sessions
    const session = parseSessionFile(file)
    if (session && session.messages.length > 0) {
      sessions.push({
        ...session,
        file: basename(file),
        messageCount: session.messages.length,
        lastMessage: session.messages[session.messages.length - 1]?.content?.slice(0, 100) || ''
      })
    }
    
    if (sessions.length >= limit) break
  }
  
  return sessions
}

// Search sessions by keyword
function searchSessions(keyword: string, limit: number = 10): any[] {
  const sessionFiles = findSessionFiles()
  const results: any[] = []
  const lowerKeyword = keyword.toLowerCase()
  
  for (const file of sessionFiles) {
    const session = parseSessionFile(file)
    if (!session) continue
    
    // Search in messages
    const matchingMessages = session.messages.filter((msg: any) => 
      msg.content && msg.content.toLowerCase().includes(lowerKeyword)
    )
    
    if (matchingMessages.length > 0) {
      results.push({
        ...session,
        file: basename(file),
        messageCount: session.messages.length,
        matchCount: matchingMessages.length,
        firstMatch: matchingMessages[0]?.content?.slice(0, 200) || ''
      })
    }
    
    if (results.length >= limit) break
  }
  
  return results
}

export default (async ({ $ }) => {
  return {
    config: (cfg) => {
      // No special config needed
    },

    event: async (input) => {
      // No special event handling needed
    },

    // Custom tools
    tool: {
      list_conversations: {
        description: "List recent conversation sessions. Use when user asks to see conversation history or past sessions.",
        parameters: {
          type: "object",
          properties: {
            limit: { 
              type: "number", 
              description: "Maximum number of sessions to return (default: 10)" 
            },
          },
        },
        execute: async (args) => {
          const limit = (args.limit as number) || 10
          const sessions = getRecentSessions(limit)
          
          if (sessions.length === 0) {
            return "No conversation sessions found. The database may be empty or in a different location."
          }
          
          const output = sessions.map((s, i) => {
            const date = s.metadata?.timestamp 
              ? new Date(s.metadata.timestamp).toLocaleString()
              : 'Unknown date'
            const title = s.metadata?.title || `Session ${s.id?.slice(0, 8) || i + 1}`
            
            return `## ${i + 1}. ${title}
- **ID:** ${s.id?.slice(0, 8) || 'N/A'}
- **Date:** ${date}
- **Messages:** ${s.messageCount}
- **Preview:** ${s.lastMessage}
`
          })
          
          return `Found ${sessions.length} conversation sessions:\n\n${output.join('\n')}`
        },
      },

      view_conversation: {
        description: "View the content of a specific conversation session.",
        parameters: {
          type: "object",
          properties: {
            session_id: { 
              type: "string", 
              description: "Session ID or file name to view" 
            },
            limit: { 
              type: "number", 
              description: "Maximum number of messages to show (default: 20)" 
            },
          },
          required: ["session_id"],
        },
        execute: async (args) => {
          const sessionId = args.session_id as string
          const limit = (args.limit as number) || 20
          
          const sessionFiles = findSessionFiles()
          const targetFile = sessionFiles.find(f => 
            basename(f).includes(sessionId) || basename(f, '.jsonl') === sessionId
          )
          
          if (!targetFile) {
            return `Session "${sessionId}" not found. Use list_conversations to see available sessions.`
          }
          
          const session = parseSessionFile(targetFile)
          if (!session) {
            return `Failed to parse session file: ${targetFile}`
          }
          
          const title = session.metadata?.title || `Session ${sessionId}`
          const messages = session.messages.slice(-limit) // Show last N messages
          
          const output = messages.map((msg: any) => {
            const role = msg.role === 'user' ? '👤 User' : '🤖 Assistant'
            const content = msg.content || '(empty)'
            return `### ${role}\n${content}\n`
          })
          
          return `# ${title}
**File:** ${basename(targetFile)}
**Total Messages:** ${session.messages.length}
**Showing:** Last ${messages.length} messages

---

${output.join('\n---\n')}`
        },
      },

      search_conversations: {
        description: "Search conversations by keyword or topic.",
        parameters: {
          type: "object",
          properties: {
            query: { 
              type: "string", 
              description: "Search keyword or phrase" 
            },
            limit: { 
              type: "number", 
              description: "Maximum number of results (default: 5)" 
            },
          },
          required: ["query"],
        },
        execute: async (args) => {
          const query = args.query as string
          const limit = (args.limit as number) || 5
          
          const results = searchSessions(query, limit)
          
          if (results.length === 0) {
            return `No conversations found matching "${query}".`
          }
          
          const output = results.map((s, i) => {
            const title = s.metadata?.title || `Session ${s.id?.slice(0, 8) || i + 1}`
            
            return `## ${i + 1}. ${title}
- **File:** ${s.file}
- **Messages:** ${s.messageCount}
- **Matches:** ${s.matchCount} messages containing "${query}"
- **First Match:** ${s.firstMatch}
`
          })
          
          return `Found ${results.length} conversations matching "${query}":\n\n${output.join('\n')}`
        },
      },

      get_database_info: {
        description: "Get information about the opencode database location and status.",
        parameters: { type: "object", properties: {} },
        execute: async () => {
          const dbPath = getDatabasePath()
          const dataDir = getDataDir()
          const sessionFiles = findSessionFiles()
          
          const dbExists = existsSync(dbPath)
          const dataDirExists = existsSync(dataDir)
          
          let status = `## Database Information

**Database Path:** ${dbPath}
**Database Exists:** ${dbExists ? '✅ Yes' : '❌ No'}

**Data Directory:** ${dataDir}
**Data Directory Exists:** ${dataDirExists ? '✅ Yes' : '❌ No'}

**Session Files Found:** ${sessionFiles.length}
`
          
          if (!dbExists && sessionFiles.length === 0) {
            status += `
**⚠️ Note:** No database or session files found. This could mean:
1. opencode hasn't been used yet
2. The database is in a non-standard location
3. Session data is stored differently in your version

**Tip:** Try using opencode first to create some sessions, then run this tool again.`
          }
          
          if (sessionFiles.length > 0) {
            status += `
**Sample Session Files:**
${sessionFiles.slice(0, 5).map(f => `- ${basename(f)}`).join('\n')}
${sessionFiles.length > 5 ? `- ... and ${sessionFiles.length - 5} more` : ''}`
          }
          
          return status
        },
      },
    },
  }
}) satisfies Plugin