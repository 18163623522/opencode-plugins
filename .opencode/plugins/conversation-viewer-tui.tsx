import type { TuiPlugin, TuiPluginApi } from "@opencode-ai/plugin/tui"
import { createSignal, createMemo, Show, For, onMount } from "solid-js"
import { existsSync, readFileSync, readdirSync, statSync } from "fs"
import { join, basename } from "path"
import { homedir } from "os"

function getDataDir(): string {
  const xdgData = process.env.XDG_DATA_HOME || join(homedir(), ".local", "share")
  const dataDir = join(xdgData, "opencode")
  if (existsSync(dataDir)) return dataDir

  const appData = process.env.APPDATA || join(homedir(), "AppData", "Roaming")
  const winDataDir = join(appData, "opencode")
  if (existsSync(winDataDir)) return winDataDir

  const configPath = join(homedir(), ".config", "opencode")
  if (existsSync(configPath)) return configPath

  return dataDir
}

function findSessionFiles(): string[] {
  const dataDir = getDataDir()
  const sessionFiles: string[] = []

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

function parseSessionFile(filePath: string): any {
  try {
    const content = readFileSync(filePath, 'utf-8')
    const lines = content.split('\n').filter(line => line.trim())
    const session: any = { id: basename(filePath, '.jsonl'), messages: [], metadata: {} }

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
  } catch { return null }
}

function getRecentSessions(limit: number = 10): any[] {
  const sessionFiles = findSessionFiles()
  const sessions: any[] = []

  for (const file of sessionFiles.slice(0, limit * 2)) {
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

function searchSessions(keyword: string, limit: number = 10): any[] {
  const sessionFiles = findSessionFiles()
  const results: any[] = []
  const lowerKeyword = keyword.toLowerCase()

  for (const file of sessionFiles) {
    const session = parseSessionFile(file)
    if (!session) continue
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

function formatDate(timestamp: number): string {
  const date = new Date(timestamp)
  const now = new Date()
  const diff = now.getTime() - date.getTime()

  if (diff < 60000) return "Just now"
  if (diff < 3600000) return `${Math.floor(diff / 60000)}m ago`
  if (diff < 86400000) return `${Math.floor(diff / 3600000)}h ago`
  if (diff < 604800000) return `${Math.floor(diff / 86400000)}d ago`
  return date.toLocaleDateString()
}

function ConversationList(props: { api: TuiPluginApi; onSelect: (session: any) => void }) {
  const [sessions, setSessions] = createSignal<any[]>([])
  const [loading, setLoading] = createSignal(true)
  const [searchQuery, setSearchQuery] = createSignal("")
  const [searchResults, setSearchResults] = createSignal<any[]>([])

  onMount(() => {
    setSessions(getRecentSessions(20))
    setLoading(false)
  })

  const handleSearch = (query: string) => {
    setSearchQuery(query)
    if (query.trim()) setSearchResults(searchSessions(query, 10))
    else setSearchResults([])
  }

  const displaySessions = createMemo(() => searchQuery().trim() ? searchResults() : sessions())

  return (
    <box flexDirection="column" width="100%" height="100%">
      <box flexDirection="column" padding={1} borderBottom>
        <text bold>Conversation History</text>
        <text dim>{displaySessions().length} sessions found</text>
      </box>

      <box padding={1} borderBottom>
        <text>Search: </text>
        <input value={searchQuery()} onChange={handleSearch} placeholder="Search conversations..." />
      </box>

      <box flexDirection="column" flexGrow={1} overflow="auto">
        <Show when={!loading()} fallback={<text>Loading...</text>}>
          <For each={displaySessions()}>
            {(session) => (
              <box flexDirection="column" padding={1} borderBottom onClick={() => props.onSelect(session)} cursor="pointer">
                <box justifyContent="space-between">
                  <text bold>{session.metadata?.title || `Session ${session.id?.slice(0, 8)}`}</text>
                  <text dim>{formatDate(session.metadata?.timestamp || Date.now())}</text>
                </box>
                <text dim>{session.messageCount} messages</text>
                <text truncate>{session.lastMessage}</text>
              </box>
            )}
          </For>
        </Show>
      </box>
    </box>
  )
}

function ConversationDetail(props: { api: TuiPluginApi; session: any; onBack: () => void }) {
  const [messages, setMessages] = createSignal<any[]>([])

  onMount(() => {
    const sessionFiles = findSessionFiles()
    const targetFile = sessionFiles.find(f =>
      basename(f).includes(props.session.id) || basename(f, '.jsonl') === props.session.id
    )
    if (targetFile) {
      const session = parseSessionFile(targetFile)
      if (session) setMessages(session.messages)
    }
  })

  return (
    <box flexDirection="column" width="100%" height="100%">
      <box flexDirection="column" padding={1} borderBottom>
        <box justifyContent="space-between">
          <text bold>{props.session.metadata?.title || `Session ${props.session.id?.slice(0, 8)}`}</text>
          <text onClick={props.onBack} cursor="pointer" underline>Back</text>
        </box>
        <text dim>{messages().length} messages</text>
      </box>

      <box flexDirection="column" flexGrow={1} overflow="auto" padding={1}>
        <For each={messages()}>
          {(message) => (
            <box flexDirection="column" marginBottom={1}>
              <box>
                <text bold color={message.role === 'user' ? 'blue' : 'green'}>
                  {message.role === 'user' ? '👤 User' : '🤖 Assistant'}
                </text>
              </box>
              <text wrap>{message.content}</text>
            </box>
          )}
        </For>
      </box>
    </box>
  )
}

function ConversationViewer(props: { api: TuiPluginApi }) {
  const [selectedSession, setSelectedSession] = createSignal<any>(null)

  return (
    <box flexDirection="column" width="100%" height="100%">
      <Show when={selectedSession()} fallback={<ConversationList api={props.api} onSelect={setSelectedSession} />}>
        <ConversationDetail api={props.api} session={selectedSession()!} onBack={() => setSelectedSession(null)} />
      </Show>
    </box>
  )
}

const tui: TuiPlugin = async (api) => {
  api.route.register([{
    name: "conversations",
    render: () => <ConversationViewer api={api} />,
  }])

  api.keymap.registerLayer({
    commands: [{
      name: "conversations.show",
      title: "Show Conversations",
      description: "View conversation history",
      category: "Navigation",
      run: () => api.route.navigate("conversations"),
    }],
    bindings: [{
      command: "conversations.show",
      key: "ctrl+h",
    }],
  })

  api.slots.register({
    slots: {
      home_bottom() {
        return (
          <box flexDirection="column" padding={1}>
            <text onClick={() => api.route.navigate("conversations")} cursor="pointer" underline>
              📝 View Conversation History (Ctrl+H)
            </text>
          </box>
        )
      },
    },
  })
}

export default tui
