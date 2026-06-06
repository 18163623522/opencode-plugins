import type { TuiPlugin, TuiPluginApi } from "@opencode-ai/plugin/tui"
import { createSignal, Show, For, onMount } from "solid-js"
import { existsSync, readFileSync, writeFileSync, readdirSync } from "fs"
import { join, basename } from "path"
import { homedir } from "os"

const STATS_DIR = join(homedir(), ".config", "opencode", "stats")
const USAGE_FILE = join(STATS_DIR, "usage.json")

interface UsageData {
  totalInput: number
  totalOutput: number
  totalCost: number
  sessions: Array<{ time: string; model: string; input: number; output: number; cost: number }>
  models: Record<string, { input: number; output: number; cost: number }>
}

function loadUsage(): UsageData {
  try { if (existsSync(USAGE_FILE)) return JSON.parse(readFileSync(USAGE_FILE, "utf-8")) } catch {}
  return { totalInput: 0, totalOutput: 0, totalCost: 0, sessions: [], models: {} }
}

function saveUsage(data: UsageData) {
  if (!existsSync(STATS_DIR)) { const { mkdirSync } = require("fs"); mkdirSync(STATS_DIR, { recursive: true }) }
  writeFileSync(USAGE_FILE, JSON.stringify(data, null, 2), "utf-8")
}

function TokenUsagePanel(props: { api: TuiPluginApi }) {
  const [data, setData] = createSignal<UsageData>(loadUsage())
  const [view, setView] = createSignal<"summary" | "models" | "history">("summary")

  const refresh = () => setData(loadUsage())

  const addTestData = () => {
    const d = { ...data() }
    const models = ["claude-sonnet-4-5", "gpt-4o", "deepseek-v3"]
    const model = models[Math.floor(Math.random() * models.length)]
    const inp = Math.floor(Math.random() * 5000) + 500
    const out = Math.floor(Math.random() * 2000) + 200
    const cost = +(inp * 0.000003 + out * 0.000015).toFixed(6)
    d.totalInput += inp; d.totalOutput += out; d.totalCost += cost
    if (!d.models[model]) d.models[model] = { input: 0, output: 0, cost: 0 }
    d.models[model].input += inp; d.models[model].output += out; d.models[model].cost += cost
    d.sessions.push({ time: new Date().toLocaleString("zh-CN"), model, input: inp, output: out, cost })
    saveUsage(d); setData(d)
  }

  const reset = () => {
    saveUsage({ totalInput: 0, totalOutput: 0, totalCost: 0, sessions: [], models: {} })
    setData(loadUsage())
  }

  return (
    <box flexDirection="column" width="100%" height="100%">
      <box flexDirection="column" padding={1} borderBottom>
        <box justifyContent="space-between">
          <text bold>Token Usage</text>
          <box gap={1}>
            <text onClick={refresh} cursor="pointer" underline>Refresh</text>
            <text onClick={addTestData} cursor="pointer" underline>Test</text>
            <text onClick={reset} cursor="pointer" underline>Reset</text>
          </box>
        </box>
        <box gap={2}>
          <text onClick={() => setView("summary")} cursor="pointer" underline={view() === "summary"}>Summary</text>
          <text onClick={() => setView("models")} cursor="pointer" underline={view() === "models"}>Models</text>
          <text onClick={() => setView("history")} cursor="pointer" underline={view() === "history"}>History</text>
        </box>
      </box>

      <Show when={view() === "summary"}>
        <box flexDirection="column" padding={1}>
          <text>Total Input:  {data().totalInput.toLocaleString()}</text>
          <text>Total Output: {data().totalOutput.toLocaleString()}</text>
          <text>Total Cost:   ${data().totalCost.toFixed(4)}</text>
          <text>Sessions:     {data().sessions.length}</text>
        </box>
      </Show>

      <Show when={view() === "models"}>
        <box flexDirection="column" flexGrow={1} overflow="auto" padding={1}>
          <box borderBottom><text bold>{"Model".padEnd(25)}{"Input".padStart(12)}{"Output".padStart(12)}{"Cost".padStart(12)}</text></box>
          <For each={Object.entries(data().models)}>
            {([model, stats]) => (
              <box borderBottom>
                <text>{model.padEnd(25)}{stats.input.toLocaleString().padStart(12)}{stats.output.toLocaleString().padStart(12)}{"$" + stats.cost.toFixed(4).padStart(11)}</text>
              </box>
            )}
          </For>
        </box>
      </Show>

      <Show when={view() === "history"}>
        <box flexDirection="column" flexGrow={1} overflow="auto" padding={1}>
          <For each={data().sessions.slice(-20).reverse()}>
            {(s) => (
              <box borderBottom>
                <text dim>{s.time} </text>
                <text>{s.model} </text>
                <text>in:{s.input} out:{s.output} </text>
                <text>${s.cost.toFixed(4)}</text>
              </box>
            )}
          </For>
        </box>
      </Show>
    </box>
  )
}

const tui: TuiPlugin = async (api) => {
  api.route.register([{ name: "token-usage", render: () => <TokenUsagePanel api={api} /> }])

  api.keymap.registerLayer({
    commands: [{ name: "token-usage.show", title: "Token Usage", category: "Navigation", run: () => api.route.navigate("token-usage") }],
    bindings: [{ command: "token-usage.show", key: "ctrl+shift+t" }],
  })

  api.slots.register({
    slots: {
      home_bottom() {
        return (
          <text onClick={() => api.route.navigate("token-usage")} cursor="pointer" underline>
            📊 Token Usage (Ctrl+Shift+T)
          </text>
        )
      },
    },
  })
}

export default tui
