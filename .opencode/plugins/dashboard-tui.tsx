/** @jsxImportSource @opentui/solid */
import type { TuiPlugin, TuiPluginModule } from "@opencode-ai/plugin/tui"
import { readFileSync, writeFileSync, mkdirSync, existsSync } from "fs"
import { join } from "path"
import { homedir } from "os"

const STATS_DIR = join(homedir(), ".config", "opencode", "stats")
const USAGE_FILE = join(STATS_DIR, "usage.json")
const TASKS_DIR = join(homedir(), ".config", "opencode", "scheduled-tasks")
const TASKS_FILE = join(TASKS_DIR, "tasks.json")

function ensureDir(dir: string) {
  if (!existsSync(dir)) mkdirSync(dir, { recursive: true })
}

function loadJSON(file: string, fallback: any) {
  try { if (existsSync(file)) return JSON.parse(readFileSync(file, "utf-8")) } catch {}
  return fallback
}

function saveJSON(file: string, data: any, dir: string) {
  ensureDir(dir)
  writeFileSync(file, JSON.stringify(data, null, 2), "utf-8")
}

const Dashboard = (props: { api: any }) => {
  const api = props.api
  const stats = loadJSON(USAGE_FILE, { totalInputTokens: 0, totalOutputTokens: 0, totalCost: 0, history: [], daily: {}, models: {} })
  const tasks = loadJSON(TASKS_FILE, [])

  return (
    <box flexDirection="column" padding={1} width="100%" height="100%">
      <text bold fg="cyan">⚡ OpenCode 插件中心</text>
      <text>─────────────────────────────────</text>

      <text bold>📊 Token 统计</text>
      <text>  输入: {stats.totalInputTokens?.toLocaleString() ?? 0}</text>
      <text>  输出: {stats.totalOutputTokens?.toLocaleString() ?? 0}</text>
      <text>  费用: ${(stats.totalCost ?? 0).toFixed(4)}</text>
      <text>  会话: {stats.history?.length ?? 0}</text>
      <text>─────────────────────────────────</text>

      <text bold>⏰ 定时任务 ({tasks.length})</text>
      {tasks.length === 0 ? (
        <text>  暂无任务</text>
      ) : (
        tasks.slice(0, 5).map((t: any) => (
          <text>  {t.enabled ? "✓" : "✗"} {t.name} ({t.cron})</text>
        ))
      )}
      <text>─────────────────────────────────</text>

      <text bold>🛠️ 可用工具</text>
      <text>  /usage   — Token 统计</text>
      <text>  /cron    — 定时任务</text>
      <text>  /doctor  — 系统诊断</text>
      <text>  /worktree — Git 工作区</text>
      <text>─────────────────────────────────</text>
      <text dim>按 Q 返回 | 方向键导航</text>
    </box>
  )
}

const tui: TuiPlugin = async (api) => {
  api.route.register([{
    name: "dashboard",
    render: () => <Dashboard api={api} />,
  }])

  api.command.register(() => [{
    title: "插件中心",
    value: "dashboard.open",
    category: "Plugin",
    onSelect: () => api.route.navigate("dashboard"),
  }])

  api.keymap.registerLayer({
    commands: [{
      name: "dashboard.show",
      title: "Open Dashboard",
      category: "Plugin",
      run: () => api.route.navigate("dashboard"),
    }],
    bindings: [{
      command: "dashboard.show",
      key: "ctrl+shift+p",
    }],
  })

  api.slots.register({
    slots: {
      home_bottom() {
        return (
          <text onClick={() => api.route.navigate("dashboard")} underline cursor="pointer">
            ⚡ 插件中心 (Ctrl+Shift+P)
          </text>
        )
      },
    },
  })
}

const plugin: TuiPluginModule & { id: string } = {
  id: "dashboard",
  tui,
}

export default plugin
