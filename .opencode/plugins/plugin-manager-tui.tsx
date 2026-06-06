import type { TuiPlugin, TuiPluginApi } from "@opencode-ai/plugin/tui"
import { createSignal, Show, For, onMount } from "solid-js"
import { existsSync, readFileSync, writeFileSync, readdirSync } from "fs"
import { join } from "path"

const SETTINGS_FILE = join(process.cwd(), ".opencode", "plugins", "settings.json")

function loadSettings(): Record<string, boolean> {
  try { if (existsSync(SETTINGS_FILE)) return JSON.parse(readFileSync(SETTINGS_FILE, "utf-8")) } catch {}
  return {}
}

function saveSettings(settings: Record<string, boolean>) {
  const dir = join(process.cwd(), ".opencode", "plugins")
  if (!existsSync(dir)) return
  writeFileSync(SETTINGS_FILE, JSON.stringify(settings, null, 2), "utf-8")
}

function listLocalPlugins(): string[] {
  const dir = join(process.cwd(), ".opencode", "plugins")
  try { return readdirSync(dir).filter(f => f.endsWith(".ts") || f.endsWith(".tsx")).map(f => f.replace(/\.(ts|tsx)$/, "")) } catch { return [] }
}

function PluginManagerPanel(props: { api: TuiPluginApi }) {
  const [plugins, setPlugins] = createSignal<Array<{ id: string; enabled: boolean }>>([])
  const [selected, setSelected] = createSignal(0)

  onMount(() => {
    const settings = loadSettings()
    const ids = listLocalPlugins()
    setPlugins(ids.map(id => ({ id, enabled: settings[id] !== false })))
  })

  const toggle = (index: number) => {
    const list = [...plugins()]
    list[index].enabled = !list[index].enabled
    setPlugins(list)
    const settings: Record<string, boolean> = {}
    list.forEach(p => settings[p.id] = p.enabled)
    saveSettings(settings)
    props.api.ui.toast({ variant: "info", title: list[index].enabled ? "已启用" : "已禁用", message: list[index].id })
  }

  return (
    <box flexDirection="column" width="100%" height="100%">
      <box flexDirection="column" padding={1} borderBottom>
        <text bold>Plugin Manager</text>
        <text dim>{plugins().filter(p => p.enabled).length} / {plugins().length} enabled</text>
        <text dim>↑↓ navigate | Enter toggle | q back</text>
      </box>

      <box flexDirection="column" flexGrow={1} overflow="auto">
        <For each={plugins()}>
          {(plugin, i) => (
            <box
              flexDirection="row"
              padding={1}
              borderBottom
              onClick={() => { setSelected(i()); toggle(i()) }}
              cursor="pointer"
            >
              <text>{selected() === i() ? "▸ " : "  "}</text>
              <text color={plugin.enabled ? "green" : "red"}>{plugin.enabled ? "●" : "○"}</text>
              <text> {plugin.id}</text>
            </box>
          )}
        </For>
      </box>
    </box>
  )
}

const tui: TuiPlugin = async (api) => {
  api.route.register([{ name: "plugins", render: () => <PluginManagerPanel api={api} /> }])

  api.keymap.registerLayer({
    commands: [{ name: "plugins.show", title: "Plugin Manager", category: "Navigation", run: () => api.route.navigate("plugins") }],
    bindings: [{ command: "plugins.show", key: "ctrl+shift+m" }],
  })

  api.slots.register({
    slots: {
      home_bottom() {
        return (
          <text onClick={() => api.route.navigate("plugins")} cursor="pointer" underline>
            ⚙️ Plugin Manager (Ctrl+Shift+M)
          </text>
        )
      },
    },
  })
}

export default tui
