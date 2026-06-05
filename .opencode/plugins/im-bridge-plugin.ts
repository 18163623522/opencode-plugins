import type { Plugin } from "@opencode-ai/plugin"

interface IMMessage {
  platform: string
  chatId: string
  userId: string
  userName: string
  text: string
  timestamp: number
}

interface ApprovalRequest {
  id: string
  tool: string
  params: Record<string, unknown>
  risk: "low" | "medium" | "high"
  status: "pending" | "approved" | "denied"
  imMessageId?: string
}

const pendingApprovals = new Map<string, ApprovalRequest>()

// IM config — read from opencode.json or env vars
let imConfig: Record<string, any> = {}
let webhookEnabled = false

function getImEnv(platform: string, key: string): string {
  // Priority: opencode.json im config > environment variable
  return imConfig?.[platform]?.[key] || process.env[`${platform.toUpperCase()}_${key.toUpperCase()}`] || ""
}

async function sendToIM(platform: string, chatId: string, message: string): Promise<boolean> {
  switch (platform) {
    case "telegram":
      return sendTelegram(chatId, message)
    case "feishu":
      return sendFeishu(chatId, message)
    case "dingtalk":
      return sendDingTalk(chatId, message)
    default:
      console.warn(`[IMBridge] Unsupported platform: ${platform}`)
      return false
  }
}

async function sendTelegram(chatId: string, message: string): Promise<boolean> {
  const token = getImEnv("telegram", "bot_token")
  if (!token) return false

  try {
    const resp = await fetch(`https://api.telegram.org/bot${token}/sendMessage`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        chat_id: chatId,
        text: message,
        parse_mode: "Markdown",
      }),
    })
    return resp.ok
  } catch {
    return false
  }
}

async function sendFeishu(chatId: string, message: string): Promise<boolean> {
  const appId = getImEnv("feishu", "app_id")
  const appSecret = getImEnv("feishu", "app_secret")
  if (!appId || !appSecret) return false

  try {
    // Get tenant access token
    const tokenResp = await fetch("https://open.feishu.cn/open-apis/auth/v3/tenant_access_token/internal", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ app_id: appId, app_secret: appSecret }),
    })
    const tokenData = await tokenResp.json() as any
    const accessToken = tokenData.tenant_access_token

    // Send message
    const resp = await fetch(`https://open.feishu.cn/open-apis/im/v1/messages?receive_id_type=chat_id`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${accessToken}`,
      },
      body: JSON.stringify({
        receive_id: chatId,
        msg_type: "text",
        content: JSON.stringify({ text: message }),
      }),
    })
    return resp.ok
  } catch {
    return false
  }
}

async function sendDingTalk(chatId: string, message: string): Promise<boolean> {
  const webhook = getImEnv("dingtalk", "webhook")
  if (!webhook) return false

  try {
    const resp = await fetch(webhook, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        msgtype: "text",
        text: { content: message },
        at: { isAtAll: false },
      }),
    })
    return resp.ok
  } catch {
    return false
  }
}

function formatApprovalRequest(req: ApprovalRequest): string {
  const riskEmoji = { low: "🟢", medium: "🟡", high: "🔴" }[req.risk]
  return [
    `${riskEmoji} **Approval Required**`,
    ``,
    `**Tool:** ${req.tool}`,
    `**Risk:** ${req.risk}`,
    `**Params:** \`\`\`${JSON.stringify(req.params, null, 2).slice(0, 500)}\`\`\``,
    ``,
    `Reply with: approve ${req.id.slice(0, 8)} / deny ${req.id.slice(0, 8)}`,
  ].join("\n")
}

export default (async ({ $ }) => {
  return {
    config: (cfg) => {
      // Load IM config from opencode.json
      imConfig = (cfg as any).im ?? {}

      // Check if any IM platform is configured
      const hasTelegram = !!(getImEnv("telegram", "bot_token"))
      const hasFeishu = !!(getImEnv("feishu", "app_id") && getImEnv("feishu", "app_secret"))
      const hasDingTalk = !!(getImEnv("dingtalk", "webhook"))

      webhookEnabled = hasTelegram || hasFeishu || hasDingTalk
      if (webhookEnabled) {
        console.log("[IMBridge] IM integration active")
      }
    },

    "permission.ask": async (input, output) => {
      if (!webhookEnabled) return

      const toolName = (input as any)?.tool ?? ""
      const params = (input as any)?.params ?? {}

      // Determine risk level
      const riskLevel = assessRisk(toolName, params)
      if (riskLevel === "low") return // Don't bother with low-risk approvals

      // Create approval request
      const reqId = crypto.randomUUID()
      const approval: ApprovalRequest = {
        id: reqId,
        tool: toolName,
        params: params as Record<string, unknown>,
        risk: riskLevel,
        status: "pending",
      }
      pendingApprovals.set(reqId, approval)

      // Send to configured IM platforms
      const message = formatApprovalRequest(approval)
      const chatId = getImEnv("telegram", "chat_id") || getImEnv("feishu", "chat_id") || ""
      const platform = getImEnv("telegram", "bot_token") ? "telegram" :
                       getImEnv("feishu", "app_id") ? "feishu" : "dingtalk"

      if (chatId) {
        await sendToIM(platform, chatId, message)
      }

      // For now, auto-approve after timeout (in production, wait for IM response)
      // This is a placeholder - real implementation would poll for IM response
    },

    event: async (input) => {
      // Handle incoming IM messages via webhook events
      if ((input as any)?.type === "im.message") {
        const msg = (input as any).data as IMMessage
        const text = msg.text.toLowerCase().trim()

        // Check for approval/denial commands
        const approveMatch = text.match(/^approve\s+(\w{8})/)
        const denyMatch = text.match(/^deny\s+(\w{8})/)

        if (approveMatch) {
          const prefix = approveMatch[1]
          const req = [...pendingApprovals.values()].find((r) => r.id.startsWith(prefix))
          if (req) {
            req.status = "approved"
            pendingApprovals.delete(req.id)
            await sendToIM(msg.platform, msg.chatId, `Approved: ${req.tool}`)
          }
        } else if (denyMatch) {
          const prefix = denyMatch[1]
          const req = [...pendingApprovals.values()].find((r) => r.id.startsWith(prefix))
          if (req) {
            req.status = "denied"
            pendingApprovals.delete(req.id)
            await sendToIM(msg.platform, msg.chatId, `Denied: ${req.tool}`)
          }
        } else {
          // Forward as conversation message (handled by opencode's server)
        }
      }
    },

    tool: {
      im_send: {
        description: "Send a message to an IM platform (Telegram, Feishu, DingTalk).",
        parameters: {
          type: "object",
          properties: {
            platform: { type: "string", enum: ["telegram", "feishu", "dingtalk"] },
            message: { type: "string", description: "Message to send" },
          },
          required: ["platform", "message"],
        },
        execute: async (args) => {
          const chatId = getImEnv(args.platform as string, "chat_id")
          const sent = await sendToIM(args.platform as string, chatId, args.message as string)
          return sent ? `Message sent to ${args.platform}` : `Failed to send to ${args.platform}`
        },
      },

      im_status: {
        description: "Check IM bridge connection status.",
        parameters: { type: "object", properties: {} },
        execute: async () => {
          const status = {
            telegram: !!(getImEnv("telegram", "bot_token")),
            feishu: !!(getImEnv("feishu", "app_id") && getImEnv("feishu", "app_secret")),
            dingtalk: !!(getImEnv("dingtalk", "webhook")),
            pendingApprovals: pendingApprovals.size,
          }
          return JSON.stringify(status, null, 2)
        },
      },
    },
  }
}) satisfies Plugin

function assessRisk(tool: string, params: Record<string, unknown>): "low" | "medium" | "high" {
  // High risk: destructive operations
  if (tool === "bash" || tool === "Bash") {
    const cmd = (params.command as string) || ""
    if (/rm\s+-rf|sudo|chmod|chown|mkfs|dd\s+if=/.test(cmd)) return "high"
    if (/git\s+push|git\s+reset|git\s+checkout/.test(cmd)) return "medium"
    return "low"
  }

  // Medium risk: file operations
  if (tool === "edit" || tool === "write") return "medium"

  // Low risk: read operations
  if (tool === "read" || tool === "glob" || tool === "grep") return "low"

  return "medium"
}
