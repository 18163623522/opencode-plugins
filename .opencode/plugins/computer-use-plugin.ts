import type { Plugin } from "@opencode-ai/plugin"
import { execSync, spawn } from "child_process"
import { existsSync, mkdirSync } from "fs"
import { join } from "path"
import { homedir } from "os"
import { tmpdir } from "os"

const VENV_DIR = join(homedir(), ".config", "opencode", "mcp-servers", "computer-use", ".venv")
const HELPER_SCRIPT = join(homedir(), ".config", "opencode", "mcp-servers", "computer-use", "helper.py")
const LOCK_FILE = join(tmpdir(), "opencode-computer-use.lock")

interface ComputerUseState {
  enabled: boolean
  allowedApps: string[]
  permissionTier: "read" | "click" | "full"
  lastScreenshot: string | null
}

const state: ComputerUseState = {
  enabled: false,
  allowedApps: [],
  permissionTier: "read",
  lastScreenshot: null,
}

function getPythonPath(): string {
  if (process.platform === "win32") {
    return join(VENV_DIR, "Scripts", "python.exe")
  }
  return join(VENV_DIR, "bin", "python3")
}

function ensureVenv() {
  if (existsSync(getPythonPath())) return

  console.log("[ComputerUse] Creating Python virtual environment...")
  const python = process.platform === "win32" ? "python" : "python3"
  execSync(`${python} -m venv "${VENV_DIR}"`, { stdio: "pipe" })

  const pip = process.platform === "win32"
    ? join(VENV_DIR, "Scripts", "pip.exe")
    : join(VENV_DIR, "bin", "pip")

  console.log("[ComputerUse] Installing dependencies...")
  execSync(`"${pip}" install pyautogui mss Pillow pyobjc-core`, { stdio: "pipe" })
}

async function callPythonHelper(command: string, payload: Record<string, unknown> = {}): Promise<any> {
  ensureVenv()

  return new Promise((resolve, reject) => {
    const python = getPythonPath()
    const args = [HELPER_SCRIPT, command, "--payload", JSON.stringify(payload)]

    const proc = spawn(python, args, { stdio: ["pipe", "pipe", "pipe"] })
    let stdout = ""
    let stderr = ""

    proc.stdout.on("data", (data) => { stdout += data.toString() })
    proc.stderr.on("data", (data) => { stderr += data.toString() })

    proc.on("close", (code) => {
      if (code !== 0) {
        reject(new Error(`Python helper failed (code ${code}): ${stderr}`))
        return
      }
      try {
        const result = JSON.parse(stdout)
        if (!result.ok) {
          reject(new Error(result.error?.message || "Unknown error"))
          return
        }
        resolve(result.result)
      } catch {
        reject(new Error(`Failed to parse Python output: ${stdout}`))
      }
    })

    proc.on("error", reject)
  })
}

function checkSecurityGates(action: string, params: Record<string, unknown>): { allowed: boolean; reason?: string } {
  // Gate 1: Kill switch
  if (!state.enabled) {
    return { allowed: false, reason: "Computer Use is disabled" }
  }

  // Gate 2: Permission tier check
  const tierOrder = { read: 0, click: 1, full: 2 }
  const requiredTier = (
    action === "screenshot" || action === "zoom" ? "read" :
    action === "left_click" || action === "scroll" || action === "mouse_move" ? "click" :
    "full"
  )

  if (tierOrder[state.permissionTier] < tierOrder[requiredTier]) {
    return { allowed: false, reason: `Permission tier '${state.permissionTier}' insufficient for '${action}' (requires '${requiredTier}')` }
  }

  // Gate 3: Dangerous key combinations blocklist
  if (action === "key" || action === "hold_key") {
    const key = (params.key as string) || ""
    const blocked = [
      "command+q", "ctrl+q", "command+tab", "alt+tab",
      "command+space", "ctrl+alt+delete", "command+shift+q",
    ]
    if (blocked.some((bk) => key.toLowerCase().includes(bk))) {
      return { allowed: false, reason: `Blocked dangerous shortcut: ${key}` }
    }
  }

  return { allowed: true }
}

export default (async ({ $ }) => {
  return {
    config: (cfg) => {
      // Check if computer-use MCP is configured
      const mcps = cfg.mcp as Record<string, any> | undefined
      if (mcps?.["computer-use"]) {
        state.enabled = true
      }
    },

    "permission.ask": async (input, output) => {
      // Intercept computer-use related permission requests
      const toolName = (input as any)?.tool ?? ""
      if (typeof toolName === "string" && toolName.startsWith("computer_use__")) {
        const action = toolName.replace("computer_use__", "")
        const params = (input as any)?.params ?? {}
        const gate = checkSecurityGates(action, params)

        if (!gate.allowed) {
          output.action = "deny"
          output.reason = gate.reason
          return
        }
      }
    },

    // Custom tools for direct desktop control (fallback when MCP is not configured)
    tool: {
      desktop_screenshot: {
        description: "Take a screenshot of the desktop or a specific region. Returns base64 encoded image.",
        parameters: {
          type: "object",
          properties: {
            region: {
              type: "object",
              properties: {
                x: { type: "number" },
                y: { type: "number" },
                width: { type: "number" },
                height: { type: "number" },
              },
              description: "Optional region to capture (null for full screen)",
            },
          },
        },
        execute: async (args) => {
          const gate = checkSecurityGates("screenshot", {})
          if (!gate.allowed) return `Error: ${gate.reason}`

          try {
            const result = await callPythonHelper("screenshot", args as Record<string, unknown>)
            state.lastScreenshot = result.base64
            return `Screenshot captured: ${result.width}x${result.height} (${Math.round(result.base64.length / 1024)}KB)`
          } catch (e: any) {
            return `Error taking screenshot: ${e.message}`
          }
        },
      },

      desktop_click: {
        description: "Click at a specific position on screen.",
        parameters: {
          type: "object",
          properties: {
            x: { type: "number", description: "X coordinate" },
            y: { type: "number", description: "Y coordinate" },
            button: { type: "string", enum: ["left", "right", "middle"], description: "Mouse button" },
            clicks: { type: "number", description: "Number of clicks (1=single, 2=double)" },
          },
          required: ["x", "y"],
        },
        execute: async (args) => {
          const gate = checkSecurityGates("left_click", args as Record<string, unknown>)
          if (!gate.allowed) return `Error: ${gate.reason}`

          try {
            await callPythonHelper("click", args as Record<string, unknown>)
            return `Clicked at (${args.x}, ${args.y})`
          } catch (e: any) {
            return `Error clicking: ${e.message}`
          }
        },
      },

      desktop_type: {
        description: "Type text at the current cursor position.",
        parameters: {
          type: "object",
          properties: {
            text: { type: "string", description: "Text to type" },
            interval: { type: "number", description: "Delay between keystrokes in seconds" },
          },
          required: ["text"],
        },
        execute: async (args) => {
          const gate = checkSecurityGates("type", args as Record<string, unknown>)
          if (!gate.allowed) return `Error: ${gate.reason}`

          try {
            await callPythonHelper("type", args as Record<string, unknown>)
            return `Typed: "${(args.text as string).slice(0, 50)}${(args.text as string).length > 50 ? "..." : ""}"`
          } catch (e: any) {
            return `Error typing: ${e.message}`
          }
        },
      },

      desktop_key: {
        description: "Press a keyboard key or shortcut.",
        parameters: {
          type: "object",
          properties: {
            key: { type: "string", description: "Key name (e.g., 'enter', 'tab', 'ctrl+c')" },
          },
          required: ["key"],
        },
        execute: async (args) => {
          const gate = checkSecurityGates("key", args as Record<string, unknown>)
          if (!gate.allowed) return `Error: ${gate.reason}`

          try {
            await callPythonHelper("key", args as Record<string, unknown>)
            return `Pressed: ${args.key}`
          } catch (e: any) {
            return `Error pressing key: ${e.message}`
          }
        },
      },

      desktop_scroll: {
        description: "Scroll the mouse wheel.",
        parameters: {
          type: "object",
          properties: {
            x: { type: "number", description: "X position" },
            y: { type: "number", description: "Y position" },
            dx: { type: "number", description: "Horizontal scroll amount" },
            dy: { type: "number", description: "Vertical scroll amount (positive=down)" },
          },
          required: ["dy"],
        },
        execute: async (args) => {
          const gate = checkSecurityGates("scroll", args as Record<string, unknown>)
          if (!gate.allowed) return `Error: ${gate.reason}`

          try {
            await callPythonHelper("scroll", args as Record<string, unknown>)
            return `Scrolled by (${args.dx ?? 0}, ${args.dy})`
          } catch (e: any) {
            return `Error scrolling: ${e.message}`
          }
        },
      },

      desktop_list_apps: {
        description: "List currently running applications.",
        parameters: { type: "object", properties: {} },
        execute: async () => {
          try {
            const result = await callPythonHelper("list_running_apps", {})
            return JSON.stringify(result, null, 2)
          } catch (e: any) {
            return `Error listing apps: ${e.message}`
          }
        },
      },

      desktop_enable: {
        description: "Enable Computer Use functionality.",
        parameters: { type: "object", properties: {} },
        execute: async () => {
          state.enabled = true
          return "Computer Use enabled. You can now control the desktop."
        },
      },

      desktop_disable: {
        description: "Disable Computer Use functionality.",
        parameters: { type: "object", properties: {} },
        execute: async () => {
          state.enabled = false
          return "Computer Use disabled."
        },
      },

      desktop_set_permissions: {
        description: "Set the permission tier for Computer Use operations.",
        parameters: {
          type: "object",
          properties: {
            tier: { type: "string", enum: ["read", "click", "full"], description: "Permission tier" },
          },
          required: ["tier"],
        },
        execute: async (args) => {
          state.permissionTier = args.tier as "read" | "click" | "full"
          return `Permission tier set to: ${args.tier}`
        },
      },
    },
  }
}) satisfies Plugin
