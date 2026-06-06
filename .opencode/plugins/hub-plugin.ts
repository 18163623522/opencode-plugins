import { type Plugin, tool } from "@opencode-ai/plugin"
import { readFileSync, writeFileSync, existsSync, readdirSync } from "fs"
import { join } from "path"
import { homedir } from "os"

const DATA_DIR = join(homedir(), ".config", "opencode", "plugin-data")
const MEMORY_FILE = join(DATA_DIR, "memory.json")
const TASKS_FILE = join(DATA_DIR, "tasks.json")
const USAGE_FILE = join(DATA_DIR, "usage.json")
const IM_FILE = join(DATA_DIR, "im-config.json")
const SETTINGS_FILE = join(DATA_DIR, "settings.json")

function ensureDir() { if (!existsSync(DATA_DIR)) { const { mkdirSync } = require("fs"); mkdirSync(DATA_DIR, { recursive: true }) } }
function load(file: string, def: any) { try { if (existsSync(file)) return JSON.parse(readFileSync(file, "utf-8")) } catch {} return def }
function save(file: string, data: any) { ensureDir(); writeFileSync(file, JSON.stringify(data, null, 2), "utf-8") }

export const OpencodeHubPlugin: Plugin = async ({ directory }) => {
  ensureDir()

  return {
    tool: {
      // ========== 插件管理 ==========
      plugin_list: tool({
        description: "列出所有插件及启用状态",
        args: {},
        async execute() {
          const settings = load(SETTINGS_FILE, {})
          const pluginsDir = join(directory, ".opencode", "plugins")
          const files: string[] = []
          try { files.push(...readdirSync(pluginsDir).filter(f => f.endsWith(".ts") || f.endsWith(".tsx"))) } catch {}
          const lines = ["## 插件列表", ""]
          for (const f of files) {
            const id = f.replace(/\.(ts|tsx)$/, "")
            const enabled = settings[id] !== false
            lines.push(`- ${enabled ? "✅" : "❌"} ${id}`)
          }
          return lines.join("\n")
        },
      }),

      plugin_toggle: tool({
        description: "启用/禁用指定插件",
        args: { id: tool.schema.string() },
        async execute(args) {
          const settings = load(SETTINGS_FILE, {})
          settings[args.id] = !(settings[args.id] !== false)
          save(SETTINGS_FILE, settings)
          return `${settings[args.id] ? "✅ 已启用" : "❌ 已禁用"}: ${args.id}`
        },
      }),

      // ========== Token 统计 ==========
      token_usage: tool({
        description: "查看 Token 用量统计",
        args: {},
        async execute() {
          const data = load(USAGE_FILE, { total: 0, input: 0, output: 0, cost: 0, sessions: [] })
          return [
            "## Token 用量",
            `- 总计: ${data.total.toLocaleString()}`,
            `- 输入: ${data.input.toLocaleString()}`,
            `- 输出: ${data.output.toLocaleString()}`,
            `- 费用: $${data.cost.toFixed(4)}`,
            `- 会话: ${data.sessions?.length ?? 0}`,
          ].join("\n")
        },
      }),

      token_reset: tool({
        description: "重置 Token 统计",
        args: {},
        async execute() {
          save(USAGE_FILE, { total: 0, input: 0, output: 0, cost: 0, sessions: [] })
          return "✅ Token 统计已重置"
        },
      }),

      // ========== 定时任务 ==========
      task_list: tool({
        description: "列出所有定时任务",
        args: {},
        async execute() {
          const tasks = load(TASKS_FILE, [])
          if (!tasks.length) return "暂无定时任务"
          const lines = ["## 定时任务", ""]
          tasks.forEach((t: any, i: number) => lines.push(`${i + 1}. ${t.enabled ? "✅" : "❌"} ${t.name} (${t.cron})`))
          return lines.join("\n")
        },
      }),

      task_create: tool({
        description: "创建定时任务",
        args: { name: tool.schema.string(), cron: tool.schema.string(), prompt: tool.schema.string() },
        async execute(args) {
          const tasks = load(TASKS_FILE, [])
          tasks.push({ name: args.name, cron: args.cron, prompt: args.prompt, enabled: true })
          save(TASKS_FILE, tasks)
          return `✅ 已创建: ${args.name}`
        },
      }),

      task_delete: tool({
        description: "删除定时任务",
        args: { name: tool.schema.string() },
        async execute(args) {
          const tasks = load(TASKS_FILE, [])
          const idx = tasks.findIndex((t: any) => t.name === args.name)
          if (idx === -1) return `❌ 未找到: ${args.name}`
          tasks.splice(idx, 1); save(TASKS_FILE, tasks)
          return `✅ 已删除: ${args.name}`
        },
      }),

      // ========== 记忆系统 ==========
      memory_list: tool({
        description: "列出所有记忆",
        args: {},
        async execute() {
          const memories = load(MEMORY_FILE, [])
          if (!memories.length) return "暂无记忆"
          const lines = ["## 记忆列表", ""]
          memories.forEach((m: any, i: number) => lines.push(`${i + 1}. [${m.type}] ${m.key}: ${m.content}`))
          return lines.join("\n")
        },
      }),

      memory_save: tool({
        description: "保存记忆",
        args: { key: tool.schema.string(), content: tool.schema.string(), type: tool.schema.optional(tool.schema.enum(["user", "project", "feedback", "reference"])) },
        async execute(args) {
          const memories = load(MEMORY_FILE, [])
          memories.push({ key: args.key, content: args.content, type: args.type ?? "user", created: new Date().toLocaleString("zh-CN") })
          save(MEMORY_FILE, memories)
          return `✅ 已保存: ${args.key}`
        },
      }),

      memory_delete: tool({
        description: "删除记忆",
        args: { key: tool.schema.string() },
        async execute(args) {
          const memories = load(MEMORY_FILE, [])
          const idx = memories.findIndex((m: any) => m.key === args.key)
          if (idx === -1) return `❌ 未找到: ${args.key}`
          memories.splice(idx, 1); save(MEMORY_FILE, memories)
          return `✅ 已删除: ${args.key}`
        },
      }),

      // ========== IM 配置 ==========
      im_config: tool({
        description: "查看/配置 IM 接入",
        args: { platform: tool.schema.optional(tool.schema.enum(["telegram", "feishu", "wechat", "dingtalk"])), key: tool.schema.optional(tool.schema.string()), value: tool.schema.optional(tool.schema.string()) },
        async execute(args) {
          const config = load(IM_FILE, { telegram: {}, feishu: {}, wechat: {}, dingtalk: {} })
          if (!args.platform) {
            const lines = ["## IM 配置", ""]
            for (const [p, c] of Object.entries(config)) lines.push(`- ${p}: ${JSON.stringify(c)}`)
            return lines.join("\n")
          }
          if (args.key && args.value) {
            if (!config[args.platform]) config[args.platform] = {}
            config[args.platform][args.key] = args.value
            save(IM_FILE, config)
            return `✅ ${args.platform}.${args.key} = ${args.value}`
          }
          return `## ${args.platform}\n${JSON.stringify(config[args.platform], null, 2)}`
        },
      }),
    },
  }
}
