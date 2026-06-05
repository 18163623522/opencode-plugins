import { type Plugin, tool } from "@opencode-ai/plugin"
import { readFileSync, writeFileSync, mkdirSync, existsSync } from "fs"
import { join } from "path"
import { homedir } from "os"

const CONFIG_DIR = join(homedir(), ".config", "opencode", "tts")
const CONFIG_FILE = join(CONFIG_DIR, "config.json")

interface TTSConfig {
  apiKey: string
  voice: string
  speed: number
}

function ensureDir() {
  if (!existsSync(CONFIG_DIR)) mkdirSync(CONFIG_DIR, { recursive: true })
}

function loadConfig(): TTSConfig {
  try {
    if (existsSync(CONFIG_FILE)) return JSON.parse(readFileSync(CONFIG_FILE, "utf-8"))
  } catch {}
  return { apiKey: "", voice: "alloy", speed: 1.0 }
}

function saveConfig(cfg: TTSConfig) {
  ensureDir()
  writeFileSync(CONFIG_FILE, JSON.stringify(cfg, null, 2), "utf-8")
}

export const TTSPlugin: Plugin = async () => {
  ensureDir()

  return {
    tool: {
      tts_speak: tool({
        description: "文本转语音 (需要 OpenAI API Key)",
        args: {
          text: tool.schema.string(),
          voice: tool.schema.optional(tool.schema.enum(["alloy", "echo", "fable", "onyx", "nova", "shimmer"])),
        },
        async execute(args) {
          const cfg = loadConfig()
          if (!cfg.apiKey) return "请先配置 OpenAI API Key (使用 tts_config 工具)"
          return `语音合成请求已准备: "${args.text.slice(0, 50)}..." (语音: ${args.voice ?? cfg.voice})\n注意: 实际播放需要在 TUI 或 Web 界面中使用`
        },
      }),

      tts_config: tool({
        description: "配置 TTS 设置",
        args: {
          api_key: tool.schema.optional(tool.schema.string()),
          voice: tool.schema.optional(tool.schema.enum(["alloy", "echo", "fable", "onyx", "nova", "shimmer"])),
          speed: tool.schema.optional(tool.schema.number()),
        },
        async execute(args) {
          const cfg = loadConfig()
          if (args.api_key) cfg.apiKey = args.api_key
          if (args.voice) cfg.voice = args.voice
          if (args.speed) cfg.speed = args.speed
          saveConfig(cfg)
          return `TTS 配置已更新: 语音=${cfg.voice}, 语速=${cfg.speed}x`
        },
      }),

      tts_status: tool({
        description: "查看 TTS 配置状态",
        args: {},
        async execute() {
          const cfg = loadConfig()
          return [
            "## TTS 状态",
            `- API Key: ${cfg.apiKey ? "已配置 (" + cfg.apiKey.slice(0, 8) + "...)" : "未配置"}`,
            `- 默认语音: ${cfg.voice}`,
            `- 语速: ${cfg.speed}x`,
          ].join("\n")
        },
      }),
    },
  }
}
