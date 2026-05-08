-- markdown-preview.nvim configuration
-- Replaces previm. Renders Mermaid, math, flowchart, etc.
-- NOTE: lazy load との相性が悪いため eager 読み込みに固定

return {
    "iamcco/markdown-preview.nvim",
    lazy = false,
    build = "cd app && npx --yes yarn install",
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
        vim.g.mkdp_command_for_global = 1

        -- 起動時に URL を表示 (サーバ起動の成否を目視確認できる)
        vim.g.mkdp_echo_preview_url = 1
        -- バッファを切り替えてもプレビューを保持
        vim.g.mkdp_auto_close = 0
        -- ポートを固定 (競合検知しやすい)
        vim.g.mkdp_port = "8765"

        vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", {
            silent = true,
            desc = "Markdown preview toggle",
        })
    end,
}
