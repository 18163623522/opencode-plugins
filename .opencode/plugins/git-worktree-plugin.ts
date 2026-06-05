import { type Plugin, tool } from "@opencode-ai/plugin"

export const GitWorktreePlugin: Plugin = async ({ $, directory }) => {
  return {
    tool: {
      worktree_list: tool({
        description: "列出所有 Git Worktree",
        args: {},
        async execute() {
          try {
            const result = await $`git worktree list`
            return result.stdout || "暂无 Worktree"
          } catch {
            return "无法获取 Worktree 列表（可能不在 Git 仓库中）"
          }
        },
      }),

      worktree_create: tool({
        description: "创建新的 Git Worktree",
        args: {
          branch: tool.schema.string(),
          path: tool.schema.optional(tool.schema.string()),
        },
        async execute(args) {
          const path = args.path ?? `../${args.branch.replace("/", "-")}`
          try {
            await $`git worktree add ${path} -b ${args.branch}`
            return `Worktree 已创建: ${path} (分支: ${args.branch})`
          } catch (e: any) {
            return `创建失败: ${e.message}`
          }
        },
      }),

      worktree_remove: tool({
        description: "移除 Git Worktree",
        args: { path: tool.schema.string() },
        async execute(args) {
          try {
            await $`git worktree remove ${args.path}`
            return `Worktree 已移除: ${args.path}`
          } catch (e: any) {
            return `移除失败: ${e.message}`
          }
        },
      }),

      worktree_prune: tool({
        description: "清理失效的 Worktree",
        args: {},
        async execute() {
          try {
            const result = await $`git worktree prune`
            return result.stdout || "已清理"
          } catch (e: any) {
            return `清理失败: ${e.message}`
          }
        },
      }),
    },
  }
}
