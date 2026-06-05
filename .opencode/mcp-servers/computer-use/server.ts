/**
 * Computer Use MCP Server for opencode
 *
 * Exposes desktop control tools via MCP protocol.
 * Uses Python helper for actual system interaction.
 */

import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js"
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js"
import { z } from "zod"
import { spawn } from "child_process"
import { join } from "path"

const HELPER_SCRIPT = join(__dirname, "helper.py")

function getPythonPath(): string {
  return "python"
}

function ensureVenv(): void {
  // Dependencies are globally installed, no venv needed
  return
}

async function callPython(command: string, payload: Record<string, unknown> = {}): Promise<any> {
  ensureVenv()

  return new Promise((resolve, reject) => {
    const python = getPythonPath()
    const args = [HELPER_SCRIPT, command, "--payload", JSON.stringify(payload)]

    const proc = spawn(python, args, { stdio: ["pipe", "pipe", "pipe"] })
    let stdout = ""
    let stderr = ""

    proc.stdout.on("data", (data: Buffer) => { stdout += data.toString() })
    proc.stderr.on("data", (data: Buffer) => { stderr += data.toString() })

    proc.on("close", (code: number | null) => {
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
        reject(new Error(`Failed to parse Python output: ${stdout.slice(0, 200)}`))
      }
    })

    proc.on("error", reject)
  })
}

// Create MCP server
const server = new McpServer({
  name: "computer-use",
  version: "1.0.0",
})

// Register tools
server.tool(
  "screenshot",
  "Take a screenshot of the desktop or a specific region",
  {
    region: z.object({
      x: z.number(),
      y: z.number(),
      width: z.number(),
      height: z.number(),
    }).optional().describe("Optional region to capture"),
  },
  async ({ region }) => {
    try {
      const result = await callPython("screenshot", region ? { region } : {})
      return {
        content: [{
          type: "text" as const,
          text: `Screenshot captured: ${result.width}x${result.height}`,
        }],
      }
    } catch (e: any) {
      return { content: [{ type: "text" as const, text: `Error: ${e.message}` }], isError: true }
    }
  }
)

server.tool(
  "left_click",
  "Click at a specific position on screen",
  {
    x: z.number().describe("X coordinate"),
    y: z.number().describe("Y coordinate"),
    button: z.enum(["left", "right", "middle"]).optional().default("left"),
    clicks: z.number().optional().default(1).describe("Number of clicks"),
  },
  async ({ x, y, button, clicks }) => {
    try {
      await callPython("click", { x, y, button, clicks })
      return { content: [{ type: "text" as const, text: `Clicked at (${x}, ${y})` }] }
    } catch (e: any) {
      return { content: [{ type: "text" as const, text: `Error: ${e.message}` }], isError: true }
    }
  }
)

server.tool(
  "type",
  "Type text at the current cursor position",
  {
    text: z.string().describe("Text to type"),
    interval: z.number().optional().default(0.008).describe("Delay between keystrokes"),
  },
  async ({ text, interval }) => {
    try {
      await callPython("type", { text, interval })
      return { content: [{ type: "text" as const, text: `Typed ${text.length} characters` }] }
    } catch (e: any) {
      return { content: [{ type: "text" as const, text: `Error: ${e.message}` }], isError: true }
    }
  }
)

server.tool(
  "key",
  "Press a keyboard key or shortcut (e.g., 'enter', 'ctrl+c')",
  {
    key: z.string().describe("Key name or combination"),
  },
  async ({ key }) => {
    try {
      await callPython("key", { key })
      return { content: [{ type: "text" as const, text: `Pressed: ${key}` }] }
    } catch (e: any) {
      return { content: [{ type: "text" as const, text: `Error: ${e.message}` }], isError: true }
    }
  }
)

server.tool(
  "scroll",
  "Scroll the mouse wheel",
  {
    dx: z.number().optional().default(0).describe("Horizontal scroll"),
    dy: z.number().describe("Vertical scroll (positive=down)"),
    x: z.number().optional().describe("X position"),
    y: z.number().optional().describe("Y position"),
  },
  async ({ dx, dy, x, y }) => {
    try {
      await callPython("scroll", { dx, dy, x, y })
      return { content: [{ type: "text" as const, text: `Scrolled by (${dx}, ${dy})` }] }
    } catch (e: any) {
      return { content: [{ type: "text" as const, text: `Error: ${e.message}` }], isError: true }
    }
  }
)

server.tool(
  "mouse_move",
  "Move the mouse cursor to a position",
  {
    x: z.number().describe("X coordinate"),
    y: z.number().describe("Y coordinate"),
    duration: z.number().optional().default(0.1),
  },
  async ({ x, y, duration }) => {
    try {
      await callPython("mouse_move", { x, y, duration })
      return { content: [{ type: "text" as const, text: `Moved to (${x}, ${y})` }] }
    } catch (e: any) {
      return { content: [{ type: "text" as const, text: `Error: ${e.message}` }], isError: true }
    }
  }
)

server.tool(
  "list_running_apps",
  "List currently running applications",
  {},
  async () => {
    try {
      const apps = await callPython("list_running_apps", {})
      return { content: [{ type: "text" as const, text: JSON.stringify(apps, null, 2) }] }
    } catch (e: any) {
      return { content: [{ type: "text" as const, text: `Error: ${e.message}` }], isError: true }
    }
  }
)

server.tool(
  "frontmost_app",
  "Get the currently focused application",
  {},
  async () => {
    try {
      const app = await callPython("frontmost_app", {})
      return { content: [{ type: "text" as const, text: JSON.stringify(app, null, 2) }] }
    } catch (e: any) {
      return { content: [{ type: "text" as const, text: `Error: ${e.message}` }], isError: true }
    }
  }
)

server.tool(
  "check_permissions",
  "Check system permissions for Computer Use",
  {},
  async () => {
    try {
      const perms = await callPython("check_permissions", {})
      return { content: [{ type: "text" as const, text: JSON.stringify(perms, null, 2) }] }
    } catch (e: any) {
      return { content: [{ type: "text" as const, text: `Error: ${e.message}` }], isError: true }
    }
  }
)

// Start server
async function main() {
  const transport = new StdioServerTransport()
  await server.connect(transport)
  console.error("[ComputerUse MCP] Server started")
}

main().catch(console.error)
