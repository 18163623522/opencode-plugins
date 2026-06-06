import type { TuiPlugin, TuiPluginModule } from "@opencode-ai/plugin/tui"

const tui: TuiPlugin = async (api) => {
  api.slots.register({
    slots: {
      home_logo() {
        return (
          <box flexDirection="column">
            <text bold>OpenCode - AI 编程助手</text>
            <text dim>输入消息开始对话，Tab 切换模式</text>
          </box>
        )
      },

      home_footer() {
        return (
          <box flexDirection="column" padding={0}>
            <text dim>────────────────────────────────────────</text>
            <text dim>快捷键: Tab 切换模式 | Ctrl+H 对话记录 | Ctrl+K 命令面板</text>
            <text dim>Ctrl+Shift+M 插件管理 | Ctrl+Shift+T Token统计 | /help 帮助</text>
          </box>
        )
      },

      sidebar_title() {
        return (
          <text bold>会话信息</text>
        )
      },

      sidebar_footer() {
        return (
          <box flexDirection="column">
            <text dim>──────────</text>
            <text dim>Ctrl+H 对话记录</text>
            <text dim>Ctrl+K 命令面板</text>
          </box>
        )
      },
    },
  })
}

export default tui
