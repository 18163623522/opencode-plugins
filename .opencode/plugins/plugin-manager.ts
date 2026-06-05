import { type Plugin, tool } from "@opencode-ai/plugin"
import { readFileSync, writeFileSync, existsSync, readdirSync } from "fs"
import { join } from "path"
import { homedir } from "os"

const CONFIG_FILENAME = "opencode.json"

function getConfigPath(directory: string) {
  return join(directory, ".opencode", CONFIG_FILENAME)
}

function getPluginsDir(directory: string) {
  return join(directory, ".opencode", "plugins")
}

function loadConfig(directory: string): any {
  const p = getConfigPath(directory)
  try { if (existsSync(p)) return JSON.parse(readFileSync(p, "utf-8")) } catch {}
  return {}
}

function saveConfig(directory: string, config: any) {
  writeFileSync(getConfigPath(directory), JSON.stringify(config, null, 2), "utf-8")
}

interface PluginInfo {
  id: string
  source: "local" | "npm" | "superpowers"
  enabled: boolean
  filename?: string
}

function getPlugins(directory: string): PluginInfo[] {
  const config = loadConfig(directory)
  const state = config?.plugin_enabled ?? {}
  const result: PluginInfo[] = []

  // 本地插件
  const dir = getPluginsDir(directory)
  try {
    for (const f of readdirSync(dir)) {
      if (f.endsWith(".ts") && !f.endsWith(".tsx")) {
        const id = f.replace(/\.ts$/, "")
        result.push({ id, source: "local", enabled: state[id] !== false, filename: f })
      }
    }
  } catch {}

  // npm 插件（从 opencode.json 读取）
  for (const p of config.plugin ?? []) {
    if (typeof p === "string" && !p.startsWith("./")) {
      result.push({ id: p, source: "npm", enabled: state[p] !== false })
    }
  }

  // superpowers 目录
  const spDir = join(dir, "superpowers", ".opencode", "plugins")
  try {
    if (existsSync(spDir)) {
      result.push({ id: "superpowers", source: "superpowers", enabled: state["superpowers"] !== false })
    }
  } catch {}

  return result
}

export const PluginManagerPlugin: Plugin = async ({ directory }) => {
  return {
    tool: {
      plugin_list: tool({
        description: "列出所有已安装的插件及启用状态",
        args: {
          format: tool.schema.optional(tool.schema.enum(["summary", "detail"])),
        },
        async execute(args) {
          const plugins = getPlugins(directory)
          const format = args.format ?? "summary"
          const enabled = plugins.filter(p => p.enabled).length
          const total = plugins.length

          if (format === "detail") {
            const lines = ["## 已安装插件", ""]
            for (const p of plugins) {
              const marker = p.enabled ? "✅" : "❌"
              const tag = p.source === "npm" ? "📦" : p.source === "superpowers" ? "🦸" : "📄"
              lines.push(`- ${marker} ${tag} **${p.id}** (${p.source}${p.filename ? ` — ${p.filename}` : ""})`)
            }
            lines.push("", `**${enabled}** 个启用 / **${total - enabled}** 个禁用 / 共 **${total}** 个`)
            return lines.join("\n")
          }

          const lines = [
            "## 插件状态",
            `**${enabled}** 个启用 / **${total - enabled}** 个禁用 / 共 **${total}** 个`,
            "",
          ]
          for (const p of plugins) {
            const s = p.enabled ? "✅ 启用" : "❌ 禁用"
            lines.push(`- ${s}  ${p.id}`)
          }
          return lines.join("\n")
        },
      }),

      plugin_enable: tool({
        description: "启用指定插件",
        args: {
          id: tool.schema.string(),
        },
        async execute(args) {
          const config = loadConfig(directory)
          if (!config.plugin_enabled) config.plugin_enabled = {}
          config.plugin_enabled[args.id] = true
          saveConfig(directory, config)
          return `✅ 已启用插件: **${args.id}**`
        },
      }),

      plugin_disable: tool({
        description: "禁用指定插件",
        args: {
          id: tool.schema.string(),
        },
        async execute(args) {
          const config = loadConfig(directory)
          if (!config.plugin_enabled) config.plugin_enabled = {}
          config.plugin_enabled[args.id] = false
          saveConfig(directory, config)
          return `❌ 已禁用插件: **${args.id}**`
        },
      }),
    },
  }
}
