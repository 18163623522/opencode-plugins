import { type Plugin, tool } from "@opencode-ai/plugin"
import { readFileSync, writeFileSync, mkdirSync, existsSync } from "fs"
import { join } from "path"
import { homedir } from "os"

const STATS_DIR = join(homedir(), ".config", "opencode", "stats")
const USAGE_FILE = join(STATS_DIR, "usage.json")

interface UsageState {
  totalInputTokens: number
  totalOutputTokens: number
  totalCost: number
  history: Array<{
    time: string
    model: string
    input: number
    output: number
    cost: number
  }>
  daily: Record<string, number>
  models: Record<string, { input: number; output: number; cost: number }>
}

function ensureDir() {
  if (!existsSync(STATS_DIR)) mkdirSync(STATS_DIR, { recursive: true })
}

function loadState(): UsageState {
  try {
    if (existsSync(USAGE_FILE)) return JSON.parse(readFileSync(USAGE_FILE, "utf-8"))
  } catch {}
  return { totalInputTokens: 0, totalOutputTokens: 0, totalCost: 0, history: [], daily: {}, models: {} }
}

function saveState(state: UsageState) {
  ensureDir()
  writeFileSync(USAGE_FILE, JSON.stringify(state, null, 2), "utf-8")
}

export const TokenStatsPlugin: Plugin = async () => {
  ensureDir()

  return {
    "message.complete": async (input) => {
      if (input.type !== "message.complete") return
      const msg = input.properties
      if (!msg?.model) return

      const inputTokens = msg.usage?.inputTokens ?? 0
      const outputTokens = msg.usage?.outputTokens ?? 0
      const cost = (inputTokens / 1_000_000) * 3 + (outputTokens / 1_000_000) * 15
      const day = new Date().toISOString().slice(0, 10)
      const time = new Date().toLocaleString("zh-CN")
      const model = msg.model

      const state = loadState()
      state.totalInputTokens += inputTokens
      state.totalOutputTokens += outputTokens
      state.totalCost += cost
      state.daily[day] = (state.daily[day] || 0) + inputTokens + outputTokens
      if (!state.models[model]) state.models[model] = { input: 0, output: 0, cost: 0 }
      state.models[model].input += inputTokens
      state.models[model].output += outputTokens
      state.models[model].cost += cost
      state.history.push({ time, model, input: inputTokens, output: outputTokens, cost })
      if (state.history.length > 500) state.history = state.history.slice(-500)
      saveState(state)
    },

    tool: {
      token_usage: tool({
        description: "查看 Token 用量和费用统计",
        args: {
          format: tool.schema.optional(tool.schema.enum(["summary", "detail", "models", "daily"])),
        },
        async execute(args) {
          const state = loadState()
          const format = args.format ?? "summary"

          if (format === "detail") {
            const lines = ["## 会话记录 (最近 20 条)", ""]
            state.history.slice(-20).reverse().forEach(h => {
              lines.push(`- ${h.time} | ${h.model} | 输入:${h.input} 输出:${h.output} | $${h.cost.toFixed(4)}`)
            })
            return lines.join("\n")
          }

          if (format === "models") {
            const lines = ["## 按模型统计", "", "| 模型 | 输入 | 输出 | 费用 |", "|------|------|------|------|"]
            for (const [m, v] of Object.entries(state.models)) {
              lines.push(`| ${m} | ${v.input.toLocaleString()} | ${v.output.toLocaleString()} | $${v.cost.toFixed(4)} |`)
            }
            return lines.join("\n")
          }

          if (format === "daily") {
            const lines = ["## 每日用量", "", "| 日期 | Token 总量 |", "|------|-----------|"]
            Object.entries(state.daily).sort().slice(-7).forEach(([d, v]) => {
              lines.push(`| ${d} | ${v.toLocaleString()} |`)
            })
            return lines.join("\n")
          }

          return [
            "## Token 统计概览",
            `- 总输入: ${state.totalInputTokens.toLocaleString()}`,
            `- 总输出: ${state.totalOutputTokens.toLocaleString()}`,
            `- 总费用: $${state.totalCost.toFixed(4)}`,
            `- 会话数: ${state.history.length}`,
          ].join("\n")
        },
      }),

      token_reset: tool({
        description: "重置 Token 统计数据",
        args: { confirm: tool.schema.boolean() },
        async execute(args) {
          if (!args.confirm) return "请设置 confirm: true 来确认重置"
          saveState({ totalInputTokens: 0, totalOutputTokens: 0, totalCost: 0, history: [], daily: {}, models: {} })
          return "Token 统计已重置"
        },
      }),
    },
  }
}
