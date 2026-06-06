import type { TuiPlugin, TuiPluginApi } from "@opencode-ai/plugin/tui"
import { createSignal, Show, For, onMount } from "solid-js"
import { existsSync, readFileSync, writeFileSync } from "fs"
import { join } from "path"

const TASKS_FILE = join(process.cwd(), ".opencode", "scheduled-tasks.json")

interface Task {
  id: string
  name: string
  cron: string
  prompt: string
  enabled: boolean
  created: string
}

function loadTasks(): Task[] {
  try { if (existsSync(TASKS_FILE)) return JSON.parse(readFileSync(TASKS_FILE, "utf-8")) } catch {}
  return []
}

function saveTasks(tasks: Task[]) {
  writeFileSync(TASKS_FILE, JSON.stringify(tasks, null, 2), "utf-8")
}

function ScheduledTasksPanel(props: { api: TuiPluginApi }) {
  const [tasks, setTasks] = createSignal<Task[]>(loadTasks())
  const [adding, setAdding] = createSignal(false)
  const [name, setName] = createSignal("")
  const [cron, setCron] = createSignal("")
  const [prompt, setPrompt] = createSignal("")

  const refresh = () => setTasks(loadTasks())

  const addTask = () => {
    if (!name() || !cron() || !prompt()) { props.api.ui.toast({ variant: "error", message: "请填写所有字段" }); return }
    const list = [...tasks(), { id: Date.now().toString(36), name: name(), cron: cron(), prompt: prompt(), enabled: true, created: new Date().toLocaleString("zh-CN") }]
    saveTasks(list); setTasks(list); setAdding(false); setName(""); setCron(""); setPrompt("")
    props.api.ui.toast({ variant: "success", title: "已创建", message: name() })
  }

  const toggleTask = (index: number) => {
    const list = [...tasks()]; list[index].enabled = !list[index].enabled
    saveTasks(list); setTasks(list)
  }

  const deleteTask = (index: number) => {
    const list = [...tasks()]; list.splice(index, 1)
    saveTasks(list); setTasks(list)
    props.api.ui.toast({ variant: "info", message: "已删除" })
  }

  return (
    <box flexDirection="column" width="100%" height="100%">
      <box flexDirection="column" padding={1} borderBottom>
        <box justifyContent="space-between">
          <text bold>Scheduled Tasks</text>
          <box gap={1}>
            <text onClick={() => setAdding(!adding())} cursor="pointer" underline>{adding() ? "Cancel" : "+ Add"}</text>
            <text onClick={refresh} cursor="pointer" underline>Refresh</text>
          </box>
        </box>
        <text dim>{tasks().filter(t => t.enabled).length} / {tasks().length} active</text>
      </box>

      <Show when={adding()}>
        <box flexDirection="column" padding={1} borderBottom>
          <text>Name: <input value={name()} onChange={setName} placeholder="Daily summary" /></text>
          <text>Cron:  <input value={cron()} onChange={setCron} placeholder="0 9 * * *" /></text>
          <text>Prompt: <input value={prompt()} onChange={setPrompt} placeholder="..." /></text>
          <text dim>Format: 分 时 日 月 周 (e.g. "0 9 * * *" = daily 9am)</text>
          <text onClick={addTask} cursor="pointer" underline>Create</text>
        </box>
      </Show>

      <box flexDirection="column" flexGrow={1} overflow="auto">
        <Show when={tasks().length > 0} fallback={<text padding={1}>No tasks</text>}>
          <For each={tasks()}>
            {(task, i) => (
              <box flexDirection="column" padding={1} borderBottom>
                <box justifyContent="space-between">
                  <box gap={1}>
                    <text onClick={() => toggleTask(i())} cursor="pointer" color={task.enabled ? "green" : "red"}>
                      {task.enabled ? "●" : "○"}
                    </text>
                    <text bold>{task.name}</text>
                  </box>
                  <text onClick={() => deleteTask(i())} cursor="pointer" underline>Delete</text>
                </box>
                <text dim>cron: {task.cron}</text>
                <text truncate>{task.prompt}</text>
              </box>
            )}
          </For>
        </Show>
      </box>
    </box>
  )
}

const tui: TuiPlugin = async (api) => {
  api.route.register([{ name: "scheduled-tasks", render: () => <ScheduledTasksPanel api={api} /> }])

  api.keymap.registerLayer({
    commands: [{ name: "scheduled-tasks.show", title: "Scheduled Tasks", category: "Navigation", run: () => api.route.navigate("scheduled-tasks") }],
    bindings: [{ command: "scheduled-tasks.show", key: "ctrl+shift+c" }],
  })

  api.slots.register({
    slots: {
      home_bottom() {
        return (
          <text onClick={() => api.route.navigate("scheduled-tasks")} cursor="pointer" underline>
            ⏰ Scheduled Tasks (Ctrl+Shift+C)
          </text>
        )
      },
    },
  })
}

export default tui
