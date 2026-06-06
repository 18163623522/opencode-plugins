import type { TuiPlugin, TuiPluginModule } from "@opencode-ai/plugin/tui"
import { createSignal, Show, onMount } from "solid-js"

async function fetchPage(url: string): Promise<{ title: string; content: string }> {
  try {
    const resp = await fetch(url, { headers: { "User-Agent": "Mozilla/5.0" } })
    const html = await resp.text()
    const titleMatch = html.match(/<title[^>]*>([^<]+)<\/title>/i)
    const title = titleMatch ? titleMatch[1].trim() : url
    const text = html
      .replace(/<script[^>]*>[\s\S]*?<\/script>/gi, "")
      .replace(/<style[^>]*>[\s\S]*?<\/style>/gi, "")
      .replace(/<[^>]+>/g, " ")
      .replace(/&nbsp;/g, " ")
      .replace(/&lt;/g, "<")
      .replace(/&gt;/g, ">")
      .replace(/&amp;/g, "&")
      .replace(/\s+/g, " ")
      .trim()
      .slice(0, 8000)
    return { title, content: text }
  } catch (e: any) {
    return { title: "Error", content: `Failed to fetch: ${e.message}` }
  }
}

function BrowserPanel(props: { api: any }) {
  const [url, setUrl] = createSignal("https://")
  const [content, setContent] = createSignal("")
  const [title, setTitle] = createSignal("")
  const [loading, setLoading] = createSignal(false)
  const [history, setHistory] = createSignal<string[]>([])

  const navigate = async (target?: string) => {
    const u = target ?? url()
    if (!u || u === "https://") return
    setUrl(u)
    setLoading(true)
    setContent("")
    setTitle("Loading...")
    const result = await fetchPage(u)
    setTitle(result.title)
    setContent(result.content)
    setLoading(false)
    setHistory(prev => [u, ...prev.filter(h => h !== u).slice(0, 19)])
  }

  const quickLinks = [
    { label: "GitHub", url: "https://github.com" },
    { label: "StackOverflow", url: "https://stackoverflow.com" },
    { label: "MDN", url: "https://developer.mozilla.org" },
    { label: "NPM", url: "https://www.npmjs.com" },
  ]

  return (
    <box flexDirection="column" width="100%" height="100%">
      <box flexDirection="column" padding={1} borderBottom>
        <text bold>Browser</text>
        <box>
          <text>URL: </text>
          <input value={url()} onChange={setUrl} placeholder="https://..." />
          <text onClick={() => navigate()} cursor="pointer" underline> Go</text>
        </box>
        <box gap={1}>
          <For each={quickLinks}>
            {(link) => (
              <text onClick={() => navigate(link.url)} cursor="pointer" underline>{link.label}</text>
            )}
          </For>
        </box>
      </box>

      <Show when={loading()}>
        <text padding={1}>Loading...</text>
      </Show>

      <Show when={!loading() && content()}>
        <box flexDirection="column" padding={1}>
          <text bold>{title()}</text>
          <text dim>{url()}</text>
        </box>
        <box flexDirection="column" flexGrow={1} overflow="auto" padding={1}>
          <text wrap>{content()}</text>
        </box>
      </Show>

      <Show when={history().length > 0}>
        <box flexDirection="column" padding={1} borderTop>
          <text dim>History:</text>
          <box gap={1}>
            <For each={history().slice(0, 5)}>
              {(h) => (
                <text onClick={() => navigate(h)} cursor="pointer" underline dim>
                  {h.replace("https://", "").slice(0, 20)}
                </text>
              )}
            </For>
          </box>
        </box>
      </Show>
    </box>
  )
}

const tui: TuiPlugin = async (api) => {
  api.route.register([{ name: "browser", render: () => <BrowserPanel api={api} /> }])

  api.keymap.registerLayer({
    commands: [{ name: "browser.show", title: "Browser", category: "Navigation", run: () => api.route.navigate("browser") }],
    bindings: [{ command: "browser.show", key: "ctrl+shift+b" }],
  })

  api.slots.register({
    slots: {
      home_bottom() {
        return (
          <text onClick={() => api.route.navigate("browser")} cursor="pointer" underline>
            Browser (Ctrl+Shift+B)
          </text>
        )
      },
    },
  })
}

export default tui
