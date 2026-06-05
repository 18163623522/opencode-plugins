import type { TuiPlugin, TuiPluginApi } from "@opencode-ai/plugin/tui"
import { createSignal, createMemo, Show, For, onMount } from "solid-js"
import { readFileSync, writeFileSync, existsSync, copyFileSync } from "fs"
import { join } from "path"

const CONFIG_PATH = join(process.cwd(), ".opencode", "opencode.json")
const BACKUP_PATH = join(process.cwd(), ".opencode", "opencode.json.bak")

const REQUIRED_FIELDS = ["$schema", "plugin"]

function deepMerge(target: any, source: any): any {
  if (typeof target !== "object" || typeof source !== "object" || !target || !source) {
    return source ?? target
  }
  const result: any = Array.isArray(target) ? [...target] : { ...target }
  for (const key of Object.keys(source)) {
    if (key in result && typeof result[key] === "object" && typeof source[key] === "object" && !Array.isArray(result[key])) {
      result[key] = deepMerge(result[key], source[key])
    } else {
      result[key] = source[key]
    }
  }
  return result
}

function readConfig(): { config: any; valid: boolean; error?: string } {
  if (!existsSync(CONFIG_PATH)) {
    return { config: null, valid: false, error: "配置文件不存在" }
  }
  try {
    const raw = readFileSync(CONFIG_PATH, "utf-8")
    const config = JSON.parse(raw)
    for (const field of REQUIRED_FIELDS) {
      if (!(field in config)) {
        return { config, valid: false, error: `缺少必要字段: ${field}` }
      }
    }
    return { config, valid: true }
  } catch (e) {
    return { config: null, valid: false, error: `JSON 解析失败: ${e}` }
  }
}

function writeConfigSafe(newConfig: any): { ok: boolean; error?: string } {
  const { config: existing, valid, error } = readConfig()
  if (!valid) {
    return { ok: false, error: `无法读取现有配置: ${error}` }
  }

  const merged = deepMerge(existing, newConfig)

  for (const field of REQUIRED_FIELDS) {
    if (!(field in merged)) {
      return { ok: false, error: `合并后缺少必要字段: ${field}` }
    }
  }

  try {
    copyFileSync(CONFIG_PATH, BACKUP_PATH)
  } catch {}

  try {
    const content = JSON.stringify(merged, null, 2) + "\n"
    writeFileSync(CONFIG_PATH, content, "utf-8")

    const verify = readConfig()
    if (!verify.valid) {
      if (existsSync(BACKUP_PATH)) {
        copyFileSync(BACKUP_PATH, CONFIG_PATH)
      }
      return { ok: false, error: `写入后验证失败，已恢复备份: ${verify.error}` }
    }

    return { ok: true }
  } catch (e) {
    if (existsSync(BACKUP_PATH)) {
      try { copyFileSync(BACKUP_PATH, CONFIG_PATH) } catch {}
    }
    return { ok: false, error: `写入失败: ${e}` }
  }
}

function setNestedValue(obj: any, path: string, value: any): any {
  const keys = path.split(".")
  const result = JSON.parse(JSON.stringify(obj))
  let current = result
  for (let i = 0; i < keys.length - 1; i++) {
    const key = keys[i]
    if (current[key] == null || typeof current[key] !== "object") {
      current[key] = {}
    }
    current = current[key]
  }
  current[keys[keys.length - 1]] = value
  return result
}

function getNestedValue(obj: any, path: string): any {
  const keys = path.split(".")
  let current = obj
  for (const key of keys) {
    if (current == null || typeof current !== "object") return undefined
    current = current[key]
  }
  return current
}

interface SettingField {
  key: string
  label: string
  type: "text" | "password" | "toggle" | "info"
  value: string | boolean
  description?: string
  placeholder?: string
}

interface SettingCategory {
  name: string
  icon: string
  fields: SettingField[]
}

function SettingsPanel({ api }: { api: TuiPluginApi }) {
  const [selectedCategory, setSelectedCategory] = createSignal<number>(0)
  const [saveStatus, setSaveStatus] = createSignal<string>("")
  const [loadError, setLoadError] = createSignal<string>("")
  const [searchQuery, setSearchQuery] = createSignal<string>("")
  const [pluginList, setPluginList] = createSignal<any[]>([])

  const { config: initialConfig, valid, error } = readConfig()
  const [config, setConfig] = createSignal<any>(valid ? initialConfig : {})

  if (!valid) {
    setLoadError(error || "配置加载失败")
  }

  onMount(async () => {
    try {
      const plugins = await api.plugins.list()
      setPluginList(plugins || [])
    } catch {}
  })

  const categories = createMemo((): SettingCategory[] => {
    const cfg = config()
    const pluginCount = (cfg?.plugin || []).length
    const pluginNames = (cfg?.plugin || []).map((p: any) => typeof p === "string" ? p : p[0] || "unknown")

    return [
      {
        name: "IM Bridge",
        icon: "💬",
        fields: [
          { key: "im.telegram.bot_token", label: "Telegram Bot Token", type: "password", value: cfg?.im?.telegram?.bot_token || "", description: "从 @BotFather 获取" },
          { key: "im.telegram.chat_id", label: "Telegram Chat ID", type: "text", value: cfg?.im?.telegram?.chat_id || "", description: "用户或群组 ID" },
          { key: "im.feishu.app_id", label: "飞书 App ID", type: "text", value: cfg?.im?.feishu?.app_id || "", description: "飞书开放平台 App ID" },
          { key: "im.feishu.app_secret", label: "飞书 App Secret", type: "password", value: cfg?.im?.feishu?.app_secret || "", description: "飞书开放平台 App Secret" },
          { key: "im.feishu.chat_id", label: "飞书 Chat ID", type: "text", value: cfg?.im?.feishu?.chat_id || "", description: "飞书群聊或用户 Chat ID" },
          { key: "im.dingtalk.webhook", label: "钉钉 Webhook", type: "text", value: cfg?.im?.dingtalk?.webhook || "", description: "钉钉机器人 Webhook URL" },
        ],
      },
      {
        name: "Computer Use",
        icon: "🖥️",
        fields: [
          { key: "computer_use.enabled", label: "启用桌面控制", type: "toggle", value: cfg?.computer_use?.enabled ?? true, description: "启用/禁用桌面控制功能" },
          { key: "mcp.computer-use.enabled", label: "MCP Server", type: "toggle", value: cfg?.mcp?.["computer-use"]?.enabled ?? true, description: "启用 Computer Use MCP 服务器" },
        ],
      },
      {
        name: "Memory",
        icon: "🧠",
        fields: [
          { key: "memory.auto_save", label: "自动保存记忆", type: "toggle", value: cfg?.memory?.auto_save ?? true, description: "自动从对话中提取记忆" },
        ],
      },
      {
        name: "环境变量",
        icon: "🔑",
        fields: [
          { key: "env.OPENAI_API_KEY", label: "OpenAI API Key", type: "password", value: cfg?.env?.OPENAI_API_KEY || process.env.OPENAI_API_KEY || "", description: "OpenAI API 密钥" },
          { key: "env.ANTHROPIC_API_KEY", label: "Anthropic API Key", type: "password", value: cfg?.env?.ANTHROPIC_API_KEY || process.env.ANTHROPIC_API_KEY || "", description: "Anthropic API 密钥" },
          { key: "env.GOOGLE_API_KEY", label: "Google API Key", type: "password", value: cfg?.env?.GOOGLE_API_KEY || process.env.GOOGLE_API_KEY || "", description: "Google API 密钥" },
          { key: "env.GITHUB_TOKEN", label: "GitHub Token", type: "password", value: cfg?.env?.GITHUB_TOKEN || process.env.GITHUB_TOKEN || "", description: "GitHub Personal Access Token" },
        ],
      },
      {
        name: "Agent",
        icon: "🤖",
        fields: [
          { key: "agent.default", label: "默认 Agent", type: "text", value: cfg?.agent?.default || "sisyphus", description: "默认使用的 Agent 类型" },
          { key: "agent.hephaestus.model", label: "Hephaestus 模型", type: "text", value: cfg?.agent?.hephaestus?.model || "", description: "Hephaestus 使用的模型 (留空使用默认)" },
          { key: "agent.oracle.model", label: "Oracle 模型", type: "text", value: cfg?.agent?.oracle?.model || "", description: "Oracle 使用的模型 (留空使用默认)" },
        ],
      },
      {
        name: "MCP 服务器",
        icon: "🔌",
        fields: [
          { key: "mcp_info", label: "已配置服务器", type: "info", value: Object.keys(cfg?.mcp || {}).join(", ") || "无", description: "MCP 服务器列表" },
          ...(Object.entries(cfg?.mcp || {}).map(([name, srv]: [string, any]) => ({
            key: `mcp.${name}.enabled`,
            label: `${name}`,
            type: "toggle" as const,
            value: srv?.enabled ?? true,
            description: `命令: ${(srv?.command || []).join(" ")}`,
          }))),
        ],
      },
      {
        name: "插件",
        icon: "📦",
        fields: [
          { key: "plugin_count", label: "已加载插件", type: "info", value: `${pluginCount} 个`, description: pluginNames.join("\n") },
          ...pluginNames.map((name: string, i: number) => ({
            key: `plugin_status_${i}`,
            label: name.split("/").pop() || name,
            type: "info" as const,
            value: "✓ 已加载",
            description: name,
          })),
        ],
      },
    ]
  })

  const filteredCategories = createMemo(() => {
    const query = searchQuery().toLowerCase()
    if (!query) return categories()
    return categories()
      .map((cat) => ({
        ...cat,
        fields: cat.fields.filter(
          (f) => f.label.toLowerCase().includes(query) || (f.description || "").toLowerCase().includes(query) || f.key.toLowerCase().includes(query)
        ),
      }))
      .filter((cat) => cat.fields.length > 0)
  })

  function handleSave(key: string, value: any) {
    const partial = setNestedValue({}, key, value)
    const newConfig = deepMerge(config(), partial)
    const result = writeConfigSafe(newConfig)
    if (result.ok) {
      setConfig(newConfig)
      setSaveStatus("✓ 已保存")
      setTimeout(() => setSaveStatus(""), 2000)
    } else {
      setSaveStatus(`✗ 保存失败: ${result.error}`)
      setTimeout(() => setSaveStatus(""), 5000)
    }
  }

  function handleToggle(key: string, current: boolean) {
    handleSave(key, !current)
  }

  function openEditDialog(field: SettingField) {
    api.dialog.push("dialog-prompt", {
      title: `编辑 ${field.label}`,
      description: field.description || "",
      defaultValue: String(field.value || ""),
      onSubmit: (value: string) => {
        handleSave(field.key, value)
        api.dialog.pop()
      },
      onCancel: () => {
        api.dialog.pop()
      },
    })
  }

  function exportConfig() {
    const { config: cfg, valid } = readConfig()
    if (valid && cfg) {
      const text = JSON.stringify(cfg, null, 2)
      try {
        api.clipboard.writeText(text)
        setSaveStatus("✓ 配置已复制到剪贴板")
      } catch {
        setSaveStatus("✗ 导出失败")
      }
      setTimeout(() => setSaveStatus(""), 3000)
    }
  }

  async function importConfig() {
    try {
      const text = await api.clipboard.readText()
      const imported = JSON.parse(text)
      if (typeof imported !== "object" || !imported) {
        setSaveStatus("✗ 剪贴板内容不是有效的 JSON")
        setTimeout(() => setSaveStatus(""), 3000)
        return
      }
      const result = writeConfigSafe(imported)
      if (result.ok) {
        const { config: newCfg } = readConfig()
        setConfig(newCfg)
        setSaveStatus("✓ 配置已导入")
      } else {
        setSaveStatus(`✗ 导入失败: ${result.error}`)
      }
      setTimeout(() => setSaveStatus(""), 3000)
    } catch {
      setSaveStatus("✗ 读取剪贴板失败")
      setTimeout(() => setSaveStatus(""), 3000)
    }
  }

  return (
    <box flexDirection="column" width="100%" height="100%">
      <box flexDirection="column" padding={1} borderBottom>
        <text bold>⚙️ 设置</text>
        <text dimColor>配置插件和功能</text>
        <Show when={loadError()}>
          <text color="red">⚠️ {loadError()}</text>
        </Show>
      </box>

      <box flexDirection="row" padding={1}>
        <text>🔍 </text>
        <text>{searchQuery() || "搜索设置..."}</text>
      </box>

      <box flexDirection="row" flexGrow={1}>
        <box flexDirection="column" width={20} borderRight padding={1}>
          <For each={filteredCategories()}>
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

        <box flexDirection="column" flexGrow={1} padding={1}>
          <Show when={filteredCategories()[selectedCategory()]}>
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
                        <Show when={field.type === "toggle"}>
                          <text dimColor marginLeft={2}>
                            [{field.value ? "✓ 开启" : "✗ 关闭"}]
                          </text>
                        </Show>
                        <Show when={field.type === "info"}>
                          <text dimColor marginLeft={2}>[只读]</text>
                        </Show>
                      </box>
                      <Show when={field.description}>
                        <text dimColor paddingLeft={2}>
                          {field.description}
                        </text>
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
                      <Show when={field.type === "text" || field.type === "password"}>
                        <box paddingLeft={2} marginTop={0.5}>
                          <text
                            underline
                            onClick={() => openEditDialog(field)}
                            cursor="pointer"
                          >
                            {field.type === "password"
                              ? (field.value ? "••••••••" : "(未设置)")
                              : (field.value ? String(field.value).substring(0, 50) + (String(field.value).length > 50 ? "..." : "") : "(未设置)")
                            }
                            <text dimColor> [点击编辑]</text>
                          </text>
                        </box>
                      </Show>
                      <Show when={field.type === "info"}>
                        <box paddingLeft={2} marginTop={0.5}>
                          <text dimColor>{String(field.value)}</text>
                        </box>
                      </Show>
                    </box>
                  )}
                </For>
              </>
            )}
          </Show>

          <Show when={saveStatus()}>
            <text color={saveStatus().startsWith("✓") ? "green" : "red"} marginTop={1}>
              {saveStatus()}
            </text>
          </Show>
        </box>
      </box>

      <box flexDirection="row" justifyContent="space-between" padding={1} borderTop>
        <box flexDirection="row" gap={2}>
          <text dimColor>↑↓ 选择类别</text>
          <text dimColor>|</text>
          <text dimColor>点击字段编辑</text>
          <text dimColor>|</text>
          <text dimColor>Esc 返回</text>
        </box>
        <box flexDirection="row" gap={1}>
          <text
            onClick={exportConfig}
            cursor="pointer"
            underline
          >
            📤 导出
          </text>
          <text dimColor>|</text>
          <text
            onClick={importConfig}
            cursor="pointer"
            underline
          >
            📥 导入
          </text>
        </box>
      </box>
    </box>
  )
}

const tui: TuiPlugin = async (api) => {
  api.route.register([
    {
      name: "settings",
      render: () => <SettingsPanel api={api} />,
    },
  ])

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
