import { type Plugin, tool } from "@opencode-ai/plugin"
import { existsSync, readFileSync } from "fs"
import { join } from "path"

export const DoctorPlugin: Plugin = async ({ project, directory }) => {
  return {
    tool: {
      doctor_run: tool({
        description: "运行系统诊断检查",
        args: {},
        async execute() {
          const checks: Array<{ name: string; ok: boolean; detail: string }> = []

          // 检查 opencode.json
          const configPath = join(directory, ".opencode", "opencode.json")
          checks.push({
            name: "opencode.json",
            ok: existsSync(configPath),
            detail: existsSync(configPath) ? "存在" : "不存在",
          })

          // 检查 plugins 目录
          const pluginsDir = join(directory, ".opencode", "plugins")
          checks.push({
            name: "插件目录",
            ok: existsSync(pluginsDir),
            detail: existsSync(pluginsDir) ? "存在" : "不存在",
          })

          // 检查 AGENTS.md
          const agentsPath = join(directory, "AGENTS.md")
          checks.push({
            name: "AGENTS.md",
            ok: existsSync(agentsPath),
            detail: existsSync(agentsPath) ? "存在" : "不存在",
          })

          // 检查 package.json
          const pkgPath = join(directory, "package.json")
          checks.push({
            name: "package.json",
            ok: existsSync(pkgPath),
            detail: existsSync(pkgPath) ? "存在" : "不存在",
          })

          // 检查 .git
          const gitDir = join(directory, ".git")
          checks.push({
            name: "Git 仓库",
            ok: existsSync(gitDir),
            detail: existsSync(gitDir) ? "是" : "否",
          })

          const passed = checks.filter(c => c.ok).length
          const lines = [
            `## 诊断结果: ${passed}/${checks.length} 通过`,
            "",
            "| 检查项 | 状态 | 详情 |",
            "|--------|------|------|",
          ]
          checks.forEach(c => {
            lines.push(`| ${c.name} | ${c.ok ? "通过" : "失败"} | ${c.detail} |`)
          })
          return lines.join("\n")
        },
      }),

      doctor_env: tool({
        description: "查看环境信息",
        args: {},
        async execute() {
          return [
            "## 环境信息",
            `- 项目: ${project?.name ?? "未知"}`,
            `- 目录: ${directory}`,
            `- 平台: ${process.platform}`,
            `- Node: ${process.version}`,
            `- 时间: ${new Date().toLocaleString("zh-CN")}`,
          ].join("\n")
        },
      }),
    },
  }
}
