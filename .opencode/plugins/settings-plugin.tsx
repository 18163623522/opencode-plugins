import type { TuiPlugin, TuiPluginApi } from "@opencode-ai/plugin/tui"
import { createSignal, createMemo, Show, For, onMount } from "solid-js"
import { readFileSync, writeFileSync, existsSync } from "fs"
import { join } from "path"

// Read opencode.json
function readConfig(): any {
  const configPath = join(process.cwd(), ".opencode", "opencode.json")
  if (!existsSync(configPath)) return {}
  try {
    return JSON.parse(readFileSync(configPath, "utf-8"))
  } catch {
    return {}
  }
}

// Write opencode.json
function writeConfig(config: any): void {
  const configPath = join(process.cwd(), ".opencode", "opencode.json")
  writeFileSync(configPath, JSON.stringify(config, null, 2) + "\n", "utf-8")
}

// Settings categories
interface SettingField {
  key: string
  label: string
  type: "text" | "password" | "toggle"
  value: string | boolean
  description?: string
}

interface SettingCategory {
  name: string
  icon: string
  fields: SettingField[]
}

// Settings Panel Component
function SettingsPanel({ api }: { api: TuiPluginApi }) {
  const [selectedCategory, setSelectedCategory] = createSignal<number>(0)
  const [editingField, setEditingField] = createSignal<string | null>(null)
  const [editValue, setEditValue] = createSignal<string>("")
  const [config, setConfig] = createSignal<any>(readConfig())
  const [saveStatus, setSaveStatus] = createSignal<string>("")

  const categories = createMemo((): SettingCategory[] => {
    const cfg = config()
    return [
      {
        name: "IM Bridge",
        icon: "💬",
        fields: [
          {
            key: "im.telegram.bot_token",
            label: "Telegram Bot Token",
            type: "password" as const,
            value: cfg?.im?.telegram?.bot_token || "",
            description: "从 @BotFather 获取的 Bot Token",
          },
          {
            key: "im.telegram.chat_id",
            label: "Telegram Chat ID",
            type: "text" as const,
            value: cfg?.im?.telegram?.chat_id || "",
            description: "你的 Telegram 用户或群组 ID",
          },
          {
            key: "im.feishu.app_id",
            label: "飞书 App ID",
            type: "text" as const,
            value: cfg?.im?.feishu?.app_id || "",
            description: "飞书开放平台应用的 App ID",
          },
          {
            key: "im.feishu.app_secret",
            label: "飞书 App Secret",
            type: "password" as const,
            value: cfg?.im?.feishu?.app_secret || "",
            description: "飞书开放平台应用的 App Secret",
          },
          {
            key: "im.feishu.chat_id",
            label: "飞书 Chat ID",
            type: "text" as const,
            value: cfg?.im?.feishu?.chat_id || "",
            description: "飞书群聊或用户 Chat ID",
          },
          {
            key: "im.dingtalk.webhook",
            label: "钉钉 Webhook",
            type: "text" as const,
            value: cfg?.im?.dingtalk?.webhook || "",
            description: "钉钉机器人 Webhook URL",
          },
        ],
      },
      {
        name: "Computer Use",
        icon: "🖥️",
        fields: [
          {
            key: "computer_use.enabled",
            label: "启用 Computer Use",
            type: "toggle" as const,
            value: cfg?.computer_use?.enabled ?? true,
            description: "启用桌面控制功能",
          },
        ],
      },
      {
        name: "Memory",
        icon: "🧠",
        fields: [
          {
            key: "memory.auto_save",
            label: "自动保存记忆",
            type: "toggle" as const,
            value: cfg?.memory?.auto_save ?? true,
            description: "自动从对话中提取并保存记忆",
          },
        ],
      },
      {
        name: "Plugins",
        icon: "🔌",
        fields: [
          {
            key: "plugins.list",
            label: "已加载插件",
            type: "text" as const,
            value: (cfg?.plugin || []).length + " 个插件",
            description: (cfg?.plugin || []).join("\n"),
          },
        ],
      },
    ]
  })

  function setNestedValue(obj: any, path: string, value: any): any {
    const keys = path.split(".")
    const result = { ...obj }
    let current = result
    for (let i = 0; i < keys.length - 1; i++) {
      const key = keys[i]
      if (!current[key] || typeof current[key] !== "object") {
        current[key] = {}
      } else {
        current[key] = { ...current[key] }
      }
      current = current[key]
    }
    current[keys[keys.length - 1]] = value
    return result
  }

  function handleSave(key: string, value: any) {
    const newConfig = setNestedValue(config(), key, value)
    setConfig(newConfig)
    writeConfig(newConfig)
    setSaveStatus("✓ 已保存")
    setTimeout(() => setSaveStatus(""), 2000)
    setEditingField(null)
  }

  function handleToggle(key: string, current: boolean) {
    handleSave(key, !current)
  }

  return (
    <box flexDirection="column" width="100%" height="100%">
      {/* Header */}
      <box flexDirection="column" padding={1} borderBottom>
        <text bold>⚙️ 设置</text>
        <text dimColor>配置插件和功能</text>
      </box>

      <box flexDirection="row" flexGrow={1}>
        {/* Left sidebar - categories */}
        <box flexDirection="column" width={20} borderRight padding={1}>
          <For each={categories()}>
            {(cat, i) => (
              <text
                onClick={() => setSelectedCategory(i())}
                bold={selectedCategory() === i()}
                backgroundColor={selectedCategory() === i() ? "blue" : undefined}
                padding={0.5}
              >
                {cat.icon} {cat.name}
              </text>
            )}
          </For>
        </box>

        {/* Right content - fields */}
        <box flexDirection="column" flexGrow={1} padding={1}>
          <Show when={categories()[selectedCategory()]}>
            {(cat) => (
              <>
                <text bold marginBottom={1}>
                  {cat().icon} {cat().name}
                </text>
                <For each={cat().fields}>
                  {(field) => (
                    <box flexDirection="column" marginBottom={1} paddingLeft={1}>
                      <box flexDirection="row">
                        <text bold>{field.label}</text>
                        <text dimColor marginLeft={2}>
                          [{field.type === "toggle" ? (field.value ? "✓ 开启" : "✗ 关闭") : "编辑"}]
                        </text>
                      </box>
                      <Show when={field.description}>
                        <text dimColor paddingLeft={2}>
                          {field.description}
                        </text>
                      </Show>
                      <Show when={field.type !== "toggle"}>
                        <box paddingLeft={2} marginTop={0.5}>
                          <Show
                            when={editingField() === field.key}
                            fallback={
                              <text
                                underline
                                onClick={() => {
                                  setEditingField(field.key)
                                  setEditValue(String(field.value))
                                }}
                              >
                                {field.value ? String(field.value).substring(0, 40) + (String(field.value).length > 40 ? "..." : "") : "(未设置)"}
                              </text>
                            }
                          >
                            <box flexDirection="row">
                              <text>▶ </text>
                              <text>{editValue()}</text>
                              <text dimColor> (按 Enter 保存)</text>
                            </box>
                          </Show>
                        </box>
                      </Show>
                      <Show when={field.type === "toggle"}>
                        <box paddingLeft={2} marginTop={0.5}>
                          <text
                            onClick={() => handleToggle(field.key, field.value as boolean)}
                            cursor="pointer"
                          >
                            {field.value ? "🟢 已启用 (点击关闭)" : "🔴 已禁用 (点击开启)"}
                          </text>
                        </box>
                      </Show>
                    </box>
                  )}
                </For>
              </>
            )}
          </Show>

          {/* Save status */}
          <Show when={saveStatus()}>
            <text color="green" marginTop={1}>
              {saveStatus()}
            </text>
          </Show>
        </box>
      </box>

      {/* Footer */}
      <box flexDirection="row" justifyContent="space-between" padding={1} borderTop>
        <text dimColor>↑↓ 选择类别 | Enter 编辑 | Esc 返回</text>
        <text dimColor>配置文件: .opencode/opencode.json</text>
      </box>
    </box>
  )
}

// TUI Plugin
const tui: TuiPlugin = async (api) => {
  // Register route
  api.route.register([
    {
      name: "settings",
      render: () => <SettingsPanel api={api} />,
    },
  ])

  // Register command
  api.keymap.registerLayer({
    commands: [
      {
        name: "settings.show",
        title: "Show Settings",
        description: "打开设置面板",
        category: "Navigation",
        run: () => {
          api.route.navigate("settings")
        },
      },
    ],
    bindings: [
      {
        command: "settings.show",
        key: "ctrl+shift+s",
      },
    ],
  })

  // Add to home screen
  api.slots.register({
    slots: {
      home_bottom() {
        return (
          <box flexDirection="column" padding={1}>
            <text
              onClick={() => api.route.navigate("settings")}
              cursor="pointer"
              underline
            >
              ⚙️ 设置 (Ctrl+Shift+S)
            </text>
          </box>
        )
      },
    },
  })
}

export default tui
