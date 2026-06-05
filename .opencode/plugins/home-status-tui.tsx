/** @jsxImportSource @opentui/solid */
import type { TuiPlugin, TuiPluginModule } from "@opencode-ai/plugin/tui"
import { readFileSync, existsSync } from "fs"
import { join } from "path"
import { homedir } from "os"

const USAGE_FILE = join(homedir(), ".config", "opencode", "stats", "usage.json")
const TASKS_FILE = join(homedir(), ".config", "opencode", "scheduled-tasks", "tasks.json")

function loadJSON(file: string, fallback: any) {
  try { if (existsSync(file)) return JSON.parse(readFileSync(file, "utf-8")) } catch {}
  return fallback
}

const tui: TuiPlugin = async (api) => {
  api.slots.register({
    slots: {
      home_bottom() {
        const stats = loadJSON(USAGE_FILE, { totalInputTokens: 0, totalOutputTokens: 0, totalCost: 0 })
        const tasks = loadJSON(TASKS_FILE, [])
        const tokens = ((stats.totalInputTokens ?? 0) + (stats.totalOutputTokens ?? 0)).toLocaleString()
        const cost = (stats.totalCost ?? 0).toFixed(4)
        const count = tasks.length

        return (
          <box flexDirection="column" gap={0} padding={0}>
            <text dim>───────── ⚡ 插件状态 ─────────</text>
            <text>
              <text dim>Token: </text>
              <text bold>{tokens}</text>
              <text dim> | 费用: </text>
              <text bold>${cost}</text>
              <text dim> | 任务: </text>
              <text bold>{count}</text>
            </text>
            <text dim>/usage 查看统计 | /cron 管理任务 | /doctor 诊断</text>
          </box>
        )
      },
    },
  })
}

const plugin: TuiPluginModule & { id: string } = {
  id: "plugin-status",
  tui,
}

export default plugin
