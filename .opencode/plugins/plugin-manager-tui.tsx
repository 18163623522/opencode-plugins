/** @jsxImportSource @opentui/solid */
import type { TuiPlugin, TuiPluginModule } from "@opencode-ai/plugin/tui"
import { createSignal } from "solid-js"
import { readFileSync, writeFileSync, existsSync, readdirSync } from "fs"
import { join } from "path"

function getConfigPath(directory: string) {
  return join(directory, ".opencode", "opencode.json")
}

function loadConfig(directory: string): any {
  const p = getConfigPath(directory)
  try { if (existsSync(p)) return JSON.parse(readFileSync(p, "utf-8")) } catch {}
  return {}
}

function saveConfig(directory: string, config: any) {
  writeFileSync(getConfigPath(directory), JSON.stringify(config, null, 2), "utf-8")
}

function listPlugins(directory: string): Array<{ id: string; source: "local" | "npm"; enabled: boolean }> {
  const config = loadConfig(directory)
  const state = config?.plugin_enabled ?? {}
  const plugins: Array<{ id: string; source: "local" | "npm"; enabled: boolean }> = []

  const dir = join(directory, ".opencode", "plugins")
  try {
    readdirSync(dir)
      .filter((f: string) => f.endsWith(".ts") || f.endsWith(".tsx") || f.endsWith(".js"))
      .forEach((f: string) => {
        const id = f.replace(/\.(ts|tsx|js)$/, "")
        plugins.push({ id, source: "local", enabled: state[id] !== false })
      })
  } catch {}

  ;(config.plugin ?? []).filter((p: any) => typeof p === "string" && !p.startsWith("./")).forEach((p: string) => {
    plugins.push({ id: p, source: "npm", enabled: state[p] !== false })
  })

  return plugins
}

const PluginPanel = (props: { api: any; directory: string }) => {
  const [selected, setSelected] = createSignal(0)
  const [plugins, setPlugins] = createSignal(listPlugins(props.directory))

  const toggle = (index: number) => {
    const list = [...plugins()]
    const item = list[index]
    item.enabled = !item.enabled
    setPlugins(list)

    const config = loadConfig(props.directory)
    if (!config.plugin_enabled) config.plugin_enabled = {}
    config.plugin_enabled[item.id] = item.enabled
    saveConfig(props.directory, config)

    props.api.ui.toast({
      variant: item.enabled ? "success" : "info",
      title: item.enabled ? "已启用" : "已禁用",
      message: item.id,
    })
  }

  return (
    <box flexDirection="column" width="100%" height="100%" padding={1}>
      <text bold>🧩 插件管理器</text>
      <text dim>──────────────────────────────────</text>
      <text dim>↑↓ 导航 | Enter 切换 | q 返回</text>
      <text>──────────────────────────────────</text>
      {plugins().map((p: any, i: number) => (
        <box
          key={i}
          flexDirection="row"
          gap={1}
          onClick={() => { setSelected(i); toggle(i) }}
        >
          <text>
            {selected() === i ? "▸ " : "  "}
          </text>
          <text bold={selected() === i}>
            {p.enabled ? "●" : "○"}
          </text>
          <text>
            {p.id}
          </text>
          <text dim>
            ({p.source})
          </text>
        </box>
      ))}
      <text>──────────────────────────────────</text>
      <text dim>共 {plugins().length} 个插件</text>
    </box>
  )
}

const tui: TuiPlugin = async (api, options, meta) => {
  const directory = process.cwd()

  api.route.register([{
    name: "plugins",
    render: () => <PluginPanel api={api} directory={directory} />,
  }])

  api.command.register(() => [{
    title: "插件管理器",
    value: "plugins.open",
    category: "Plugin",
    onSelect: () => api.route.navigate("plugins"),
  }])

  api.keymap.registerLayer({
    commands: [{
      name: "plugins.show",
      title: "Plugin Manager",
      category: "Plugin",
      run: () => api.route.navigate("plugins"),
    }],
    bindings: [{
      command: "plugins.show",
      key: "ctrl+shift+m",
    }],
  })
}

const plugin: TuiPluginModule & { id: string } = {
  id: "plugin-manager",
  tui,
}

export default plugin
