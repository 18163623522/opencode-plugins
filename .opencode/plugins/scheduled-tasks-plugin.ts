import { type Plugin, tool } from "@opencode-ai/plugin"
import { readFileSync, writeFileSync, mkdirSync, existsSync } from "fs"
import { join } from "path"
import { homedir } from "os"

const TASKS_DIR = join(homedir(), ".config", "opencode", "scheduled-tasks")
const TASKS_FILE = join(TASKS_DIR, "tasks.json")

interface CronTask {
  id: string
  name: string
  cron: string
  prompt: string
  enabled: boolean
  createdAt: string
  lastRun?: string
}

function ensureDir() {
  if (!existsSync(TASKS_DIR)) mkdirSync(TASKS_DIR, { recursive: true })
}

function loadTasks(): CronTask[] {
  try {
    if (existsSync(TASKS_FILE)) return JSON.parse(readFileSync(TASKS_FILE, "utf-8"))
  } catch {}
  return []
}

function saveTasks(tasks: CronTask[]) {
  ensureDir()
  writeFileSync(TASKS_FILE, JSON.stringify(tasks, null, 2), "utf-8")
}

export const ScheduledTasksPlugin: Plugin = async () => {
  ensureDir()

  return {
    tool: {
      cron_list: tool({
        description: "列出所有定时任务",
        args: {},
        async execute() {
          const tasks = loadTasks()
          if (!tasks.length) return "暂无定时任务"
          const lines = ["## 定时任务列表", "", "| 名称 | 表达式 | 状态 | 创建时间 |", "|------|--------|------|----------|"]
          tasks.forEach(t => {
            lines.push(`| ${t.name} | \`${t.cron}\` | ${t.enabled ? "启用" : "禁用"} | ${t.createdAt} |`)
          })
          return lines.join("\n")
        },
      }),

      cron_create: tool({
        description: "创建定时任务",
        args: {
          name: tool.schema.string(),
          cron: tool.schema.string(),
          prompt: tool.schema.string(),
        },
        async execute(args) {
          const tasks = loadTasks()
          tasks.push({
            id: Date.now().toString(36),
            name: args.name,
            cron: args.cron,
            prompt: args.prompt,
            enabled: true,
            createdAt: new Date().toLocaleString("zh-CN"),
          })
          saveTasks(tasks)
          return `任务 "${args.name}" 已创建`
        },
      }),

      cron_delete: tool({
        description: "删除定时任务",
        args: { name: tool.schema.string() },
        async execute(args) {
          const tasks = loadTasks()
          const idx = tasks.findIndex(t => t.name === args.name)
          if (idx === -1) return `未找到任务: ${args.name}`
          tasks.splice(idx, 1)
          saveTasks(tasks)
          return `任务 "${args.name}" 已删除`
        },
      }),

      cron_toggle: tool({
        description: "启用/禁用定时任务",
        args: { name: tool.schema.string() },
        async execute(args) {
          const tasks = loadTasks()
          const task = tasks.find(t => t.name === args.name)
          if (!task) return `未找到任务: ${args.name}`
          task.enabled = !task.enabled
          saveTasks(tasks)
          return `任务 "${args.name}" 已${task.enabled ? "启用" : "禁用"}`
        },
      }),

      cron_examples: tool({
        description: "显示 Cron 表达式示例",
        args: {},
        async execute() {
          return [
            "## Cron 表达式示例",
            "",
            "格式: `分 时 日 月 周`",
            "",
            "| 表达式 | 说明 |",
            "|--------|------|",
            "| `* * * * *` | 每分钟 |",
            "| `0 * * * *` | 每小时 |",
            "| `0 9 * * *` | 每天 9:00 |",
            "| `0 9 * * 1-5` | 工作日 9:00 |",
            "| `0 0 1 * *` | 每月 1 号 |",
          ].join("\n")
        },
      }),
    },
  }
}
