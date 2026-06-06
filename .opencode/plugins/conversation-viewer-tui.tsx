import type { TuiPlugin, TuiPluginApi } from "@opencode-ai/plugin/tui"
import { createSignal, createMemo, Show, For, onMount } from "solid-js"

function formatDate(ts: number): string {
  const diff = Date.now() - ts
  if (diff < 60000) return "Just now"
  if (diff < 3600000) return `${Math.floor(diff / 60000)}m ago`
  if (diff < 86400000) return `${Math.floor(diff / 3600000)}h ago`
  if (diff < 604800000) return `${Math.floor(diff / 86400000)}d ago`
  return new Date(ts).toLocaleDateString()
}

function ConversationList(props: { api: TuiPluginApi; onSelect: (id: string) => void }) {
  const [sessions, setSessions] = createSignal<Array<{ id: string; title: string; status: string; time: number }>>([])
  const [search, setSearch] = createSignal("")

  const refresh = () => {
    const state = props.api.state
    const list: Array<{ id: string; title: string; status: string; time: number }> = []
    const count = state.session.count()
    for (let i = 0; i < count; i++) {
      const s = state.session.get(String(i))
      if (s) {
        const msgs = state.session.messages(s.id)
        const lastMsg = msgs.length > 0 ? msgs[msgs.length - 1] : null
        const title = s.title || (lastMsg?.content?.slice(0, 60) ?? `Session ${s.id.slice(0, 8)}`)
        list.push({ id: s.id, title, status: state.session.status(s.id) ?? "unknown", time: lastMsg?.createdAt ?? s.createdAt })
      }
    }
    setSessions(list.sort((a, b) => b.time - a.time))
  }

  onMount(refresh)

  const filtered = createMemo(() => {
    const q = search().toLowerCase()
    if (!q) return sessions()
    return sessions().filter(s => s.title.toLowerCase().includes(q))
  })

  return (
    <box flexDirection="column" width="100%" height="100%">
      <box flexDirection="column" padding={1} borderBottom>
        <box justifyContent="space-between">
          <text bold>Conversation History</text>
          <text onClick={refresh} cursor="pointer" underline>Refresh</text>
        </box>
        <text dim>{filtered().length} sessions</text>
        <text>Search: <input value={search()} onChange={setSearch} placeholder="..." /></text>
      </box>

      <box flexDirection="column" flexGrow={1} overflow="auto">
        <For each={filtered()}>
          {(session) => (
            <box flexDirection="column" padding={1} borderBottom onClick={() => props.onSelect(session.id)} cursor="pointer">
              <box justifyContent="space-between">
                <text bold>{session.title}</text>
                <text dim>{formatDate(session.time)}</text>
              </box>
              <text dim>{session.status}</text>
            </box>
          )}
        </For>
      </box>
    </box>
  )
}

function ConversationDetail(props: { api: TuiPluginApi; sessionId: string; onBack: () => void }) {
  const [messages, setMessages] = createSignal<Array<{ role: string; content: string; time: number }>>([])

  onMount(() => {
    const msgs = props.api.state.session.messages(props.sessionId)
    setMessages(msgs.map(m => ({
      role: m.role,
      content: m.content?.slice(0, 500) ?? "",
      time: m.createdAt,
    })))
  })

  const session = props.api.state.session.get(props.sessionId)

  return (
    <box flexDirection="column" width="100%" height="100%">
      <box flexDirection="column" padding={1} borderBottom>
        <box justifyContent="space-between">
          <text bold>{session?.title ?? props.sessionId.slice(0, 8)}</text>
          <text onClick={props.onBack} cursor="pointer" underline>Back</text>
        </box>
        <text dim>{messages().length} messages</text>
      </box>

      <box flexDirection="column" flexGrow={1} overflow="auto" padding={1}>
        <For each={messages()}>
          {(msg) => (
            <box flexDirection="column" marginBottom={1}>
              <text bold color={msg.role === "user" ? "blue" : "green"}>
                {msg.role === "user" ? "User" : "Assistant"}
              </text>
              <text wrap>{msg.content}</text>
            </box>
          )}
        </For>
      </box>
    </box>
  )
}

function ConversationViewer(props: { api: TuiPluginApi }) {
  const [selectedId, setSelectedId] = createSignal<string | null>(null)

  return (
    <box flexDirection="column" width="100%" height="100%">
      <Show when={selectedId()} fallback={<ConversationList api={props.api} onSelect={setSelectedId} />}>
        <ConversationDetail api={props.api} sessionId={selectedId()!} onBack={() => setSelectedId(null)} />
      </Show>
    </box>
  )
}

const tui: TuiPlugin = async (api) => {
  api.route.register([{ name: "conversations", render: () => <ConversationViewer api={api} /> }])

  api.keymap.registerLayer({
    commands: [{ name: "conversations.show", title: "Show Conversations", category: "Navigation", run: () => api.route.navigate("conversations") }],
    bindings: [{ command: "conversations.show", key: "ctrl+h" }],
  })

  api.slots.register({
    slots: {
      home_bottom() {
        return (
          <text onClick={() => api.route.navigate("conversations")} cursor="pointer" underline>
            Conversations (Ctrl+H)
          </text>
        )
      },
    },
  })
}

export default tui
