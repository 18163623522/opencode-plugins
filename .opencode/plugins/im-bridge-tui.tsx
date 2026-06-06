import type { TuiPlugin, TuiPluginApi } from "@opencode-ai/plugin/tui"
import { createSignal, Show, For, onMount } from "solid-js"
import { existsSync, readFileSync, writeFileSync } from "fs"
import { join } from "path"

const IM_CONFIG_FILE = join(process.cwd(), ".opencode", "im-config.json")

interface IMConfig {
  telegram: { enabled: boolean; bot_token: string; chat_id: string }
  feishu: { enabled: boolean; app_id: string; app_secret: string; chat_id: string }
  wechat: { enabled: boolean; webhook: string }
  dingtalk: { enabled: boolean; webhook: string }
}

function loadIM(): IMConfig {
  try { if (existsSync(IM_CONFIG_FILE)) return JSON.parse(readFileSync(IM_CONFIG_FILE, "utf-8")) } catch {}
  return {
    telegram: { enabled: false, bot_token: "", chat_id: "" },
    feishu: { enabled: false, app_id: "", app_secret: "", chat_id: "" },
    wechat: { enabled: false, webhook: "" },
    dingtalk: { enabled: false, webhook: "" },
  }
}

function saveIM(config: IMConfig) {
  writeFileSync(IM_CONFIG_FILE, JSON.stringify(config, null, 2), "utf-8")
}

function IMBridgePanel(props: { api: TuiPluginApi }) {
  const [config, setConfig] = createSignal<IMConfig>(loadIM())
  const [platform, setPlatform] = createSignal<keyof IMConfig>("telegram")

  const platforms: Array<{ key: keyof IMConfig; label: string; icon: string }> = [
    { key: "telegram", label: "Telegram", icon: "✈️" },
    { key: "feishu", label: "Feishu", icon: "🐦" },
    { key: "wechat", label: "WeChat", icon: "💬" },
    { key: "dingtalk", label: "DingTalk", icon: "🔔" },
  ]

  const toggle = (key: keyof IMConfig) => {
    const c = { ...config() }
    c[key].enabled = !c[key].enabled
    setConfig(c); saveIM(c)
    props.api.ui.toast({ variant: "info", title: c[key].enabled ? "已启用" : "已禁用", message: key })
  }

  const updateField = (key: keyof IMConfig, field: string, value: string) => {
    const c = { ...config() }
    ;(c[key] as any)[field] = value
    setConfig(c); saveIM(c)
  }

  const current = () => config()[platform()]

  return (
    <box flexDirection="column" width="100%" height="100%">
      <box flexDirection="column" padding={1} borderBottom>
        <text bold>IM Bridge Settings</text>
        <text dim>Configure remote access via messaging platforms</text>
      </box>

      <box flexDirection="row" gap={1} padding={1} borderBottom>
        <For each={platforms}>
          {(p) => (
            <text
              onClick={() => setPlatform(p.key)}
              cursor="pointer"
              underline={platform() === p.key}
              color={config()[p.key].enabled ? "green" : undefined}
            >
              {p.icon} {p.label}
            </text>
          )}
        </For>
      </box>

      <box flexDirection="column" padding={1}>
        <box marginBottom={1}>
          <text bold>{platforms.find(p => p.key === platform())?.label} </text>
          <text
            onClick={() => toggle(platform())}
            cursor="pointer"
            color={current().enabled ? "green" : "red"}
          >
            [{current().enabled ? "ENABLED" : "DISABLED"}]
          </text>
        </box>

        <Show when={platform() === "telegram"}>
          <box flexDirection="column" gap={1}>
            <text>Bot Token:</text>
            <input value={current().bot_token} onChange={(v: string) => updateField("telegram", "bot_token", v)} placeholder="123456:ABC-DEF..." />
            <text>Chat ID:</text>
            <input value={current().chat_id} onChange={(v: string) => updateField("telegram", "chat_id", v)} placeholder="-100..." />
          </box>
        </Show>

        <Show when={platform() === "feishu"}>
          <box flexDirection="column" gap={1}>
            <text>App ID:</text>
            <input value={current().app_id} onChange={(v: string) => updateField("feishu", "app_id", v)} placeholder="cli_xxx" />
            <text>App Secret:</text>
            <input value={current().app_secret} onChange={(v: string) => updateField("feishu", "app_secret", v)} placeholder="..." />
            <text>Chat ID:</text>
            <input value={current().chat_id} onChange={(v: string) => updateField("feishu", "chat_id", v)} placeholder="oc_xxx" />
          </box>
        </Show>

        <Show when={platform() === "wechat"}>
          <box flexDirection="column" gap={1}>
            <text>Webhook URL:</text>
            <input value={current().webhook} onChange={(v: string) => updateField("wechat", "webhook", v)} placeholder="https://qyapi.weixin.qq.com/..." />
          </box>
        </Show>

        <Show when={platform() === "dingtalk"}>
          <box flexDirection="column" gap={1}>
            <text>Webhook URL:</text>
            <input value={current().webhook} onChange={(v: string) => updateField("dingtalk", "webhook", v)} placeholder="https://oapi.dingtalk.com/..." />
          </box>
        </Show>
      </box>

      <box padding={1} borderTop>
        <text dim>Changes save automatically</text>
      </box>
    </box>
  )
}

const tui: TuiPlugin = async (api) => {
  api.route.register([{ name: "im-bridge", render: () => <IMBridgePanel api={api} /> }])

  api.keymap.registerLayer({
    commands: [{ name: "im-bridge.show", title: "IM Bridge", category: "Navigation", run: () => api.route.navigate("im-bridge") }],
    bindings: [{ command: "im-bridge.show", key: "ctrl+shift+i" }],
  })

  api.slots.register({
    slots: {
      home_bottom() {
        return (
          <text onClick={() => api.route.navigate("im-bridge")} cursor="pointer" underline>
            💬 IM Bridge (Ctrl+Shift+I)
          </text>
        )
      },
    },
  })
}

export default tui
