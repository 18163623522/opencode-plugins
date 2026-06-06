import type { TuiPlugin, TuiPluginApi } from "@opencode-ai/plugin/tui"
import { createSignal, Show, For, onMount } from "solid-js"
import { existsSync, readFileSync, writeFileSync } from "fs"
import { join } from "path"

const MEMORY_FILE = join(process.cwd(), ".opencode", "memory.json")

interface Memory {
  id: string
  type: "user" | "project" | "feedback" | "reference"
  key: string
  content: string
  created: string
}

function loadMemory(): Memory[] {
  try { if (existsSync(MEMORY_FILE)) return JSON.parse(readFileSync(MEMORY_FILE, "utf-8")) } catch {}
  return []
}

function saveMemory(memories: Memory[]) {
  writeFileSync(MEMORY_FILE, JSON.stringify(memories, null, 2), "utf-8")
}

function MemoryPanel(props: { api: TuiPluginApi }) {
  const [memories, setMemories] = createSignal<Memory[]>(loadMemory())
  const [filter, setFilter] = createSignal<string>("all")
  const [adding, setAdding] = createSignal(false)
  const [type, setType] = createSignal<Memory["type"]>("user")
  const [key, setKey] = createSignal("")
  const [content, setContent] = createSignal("")
  const [search, setSearch] = createSignal("")

  const refresh = () => setMemories(loadMemory())

  const filtered = () => {
    let list = memories()
    if (filter() !== "all") list = list.filter(m => m.type === filter())
    if (search()) list = list.filter(m => m.key.includes(search()) || m.content.includes(search()))
    return list
  }

  const addMemory = () => {
    if (!key() || !content()) { props.api.ui.toast({ variant: "error", message: "请填写 key 和 content" }); return }
    const list = [...memories(), { id: Date.now().toString(36), type: type(), key: key(), content: content(), created: new Date().toLocaleString("zh-CN") }]
    saveMemory(list); setMemories(list); setAdding(false); setKey(""); setContent("")
    props.api.ui.toast({ variant: "success", title: "已保存", message: key() })
  }

  const deleteMemory = (index: number) => {
    const list = [...memories()]; list.splice(index, 1)
    saveMemory(list); setMemories(list)
  }

  const types = ["all", "user", "project", "feedback", "reference"]

  return (
    <box flexDirection="column" width="100%" height="100%">
      <box flexDirection="column" padding={1} borderBottom>
        <box justifyContent="space-between">
          <text bold>Memory</text>
          <box gap={1}>
            <text onClick={() => setAdding(!adding())} cursor="pointer" underline>{adding() ? "Cancel" : "+ Add"}</text>
            <text onClick={refresh} cursor="pointer" underline>Refresh</text>
          </box>
        </box>
        <box gap={1}>
          <For each={types}>
            {(t) => (
              <text onClick={() => setFilter(t)} cursor="pointer" underline={filter() === t}>{t}</text>
            )}
          </For>
        </box>
        <text>Search: <input value={search()} onChange={setSearch} placeholder="..." /></text>
      </box>

      <Show when={adding()}>
        <box flexDirection="column" padding={1} borderBottom>
          <box gap={1}>
            <For each={(["user", "project", "feedback", "reference"] as Memory["type"][])}>
              {(t) => (
                <text onClick={() => setType(t)} cursor="pointer" underline={type() === t}>{t}</text>
              )}
            </For>
          </box>
          <text>Key: <input value={key()} onChange={setKey} placeholder="my-setting" /></text>
          <text>Content: <input value={content()} onChange={setContent} placeholder="..." /></text>
          <text onClick={addMemory} cursor="pointer" underline>Save</text>
        </box>
      </Show>

      <box flexDirection="column" flexGrow={1} overflow="auto">
        <Show when={filtered().length > 0} fallback={<text padding={1}>No memories</text>}>
          <For each={filtered()}>
            {(mem, i) => (
              <box flexDirection="column" padding={1} borderBottom>
                <box justifyContent="space-between">
                  <text bold>[{mem.type}] {mem.key}</text>
                  <text onClick={() => deleteMemory(i())} cursor="pointer" underline>Delete</text>
                </box>
                <text>{mem.content}</text>
                <text dim>{mem.created}</text>
              </box>
            )}
          </For>
        </Show>
      </box>
    </box>
  )
}

const tui: TuiPlugin = async (api) => {
  api.route.register([{ name: "memory", render: () => <MemoryPanel api={api} /> }])

  api.keymap.registerLayer({
    commands: [{ name: "memory.show", title: "Memory", category: "Navigation", run: () => api.route.navigate("memory") }],
    bindings: [{ command: "memory.show", key: "ctrl+shift+e" }],
  })

  api.slots.register({
    slots: {
      home_bottom() {
        return (
          <text onClick={() => api.route.navigate("memory")} cursor="pointer" underline>
            🧠 Memory (Ctrl+Shift+E)
          </text>
        )
      },
    },
  })
}

export default tui
