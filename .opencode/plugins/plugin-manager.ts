import { type Plugin, tool } from "@opencode-ai/plugin"
import { readFileSync, writeFileSync, existsSync } from "fs"
import { join } from "path"

function getPluginsDir(directory: string): string {
  return join(directory, ".opencode", "plugins")
}

function getConfigPath(directory: string): string {
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

function getPluginState(config: any): Record<string, boolean> {
  return config?.plugin_enabled ?? {}
}

function listPluginFiles(directory: string): string[] {
  const { readdirSync } = require("fs") as typeof import("fs")
  const dir = getPluginsDir(directory)
  try {
    return readdirSync(dir)
      .filter((f: string) => f.endsWith(".ts") || f.endsWith(".tsx") || f.endsWith(".js"))
      .map((f: string) => f)
  } catch { return [] }
}

export const PluginManagerPlugin: Plugin = async ({ directory }) => {
  return {
    tool: {
      plugin_list: tool({
        description: "列出所有已安装的插件及其启用状态",
        args: {},
        async execute() {
          const config = loadConfig(directory)
          const state = getPluginState(config)
          const files = listPluginFiles(directory)
          const npmPlugins = (config.plugin ?? []).filter((p: any) => typeof p === "string" && !p.startsWith("./"))

          const lines = ["## 已安装插件", "", "### 本地插件 (.opencode/plugins/)", ""]

          if (files.length) {
            lines.push("| 文件 | 状态 |", "|------|------|")
            files.forEach(f => {
              const id = f.replace(/\.(ts|tsx|js)$/, "")
              const enabled = state[id] !== false
              lines.push(`| ${f} | ${enabled ? "✅ 启用" : "❌ 禁用"} |`)
            })
          } else {
            lines.push("暂无本地插件")
          }

          lines.push("", "### npm 插件", "")
          if (npmPlugins.length) {
            lines.push("| 包名 | 状态 |", "|------|------|")
            npmPlugins.forEach((p: string) => {
              const enabled = state[p] !== false
              lines.push(`| ${p} | ${enabled ? "✅ 启用" : "❌ 禁用"} |`)
            })
          } else {
            lines.push("暂无 npm 插件")
          }

          const total = files.length + npmPlugins.length
          const enabled = [...files.map((f: string) => f.replace(/\.(ts|tsx|js)$/, "")), ...npmPlugins]
            .filter((id: string) => state[id] !== false).length
          lines.push("", `共 ${total} 个插件，${enabled} 个启用，${total - enabled} 个禁用`)

          return lines.join("\n")
        },
      }),

      plugin_enable: tool({
        description: "启用指定插件",
        args: { id: tool.schema.string() },
        async execute(args) {
          const config = loadConfig(directory)
          if (!config.plugin_enabled) config.plugin_enabled = {}
          config.plugin_enabled[args.id] = true
          saveConfig(directory, config)
          return `✅ 插件 "${args.id}" 已启用`
        },
      }),

      plugin_disable: tool({
        description: "禁用指定插件",
        args: { id: tool.schema.string() },
        async execute(args) {
          const config = loadConfig(directory)
          if (!config.plugin_enabled) config.plugin_enabled = {}
          config.plugin_enabled[args.id] = false
          saveConfig(directory, config)
          return `❌ 插件 "${args.id}" 已禁用`
        },
      }),
    },
  }
}
