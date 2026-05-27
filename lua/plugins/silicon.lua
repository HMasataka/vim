-- vim-silicon configuration

return {
    "segeljakt/vim-silicon",
    config = function()
        -- silicon は fontconfig 経由でフォントを引くが、Homebrew 配下の
        -- fonts.conf を明示しないと Hiragino 等の macOS フォントが見えない
        vim.env.FONTCONFIG_FILE = vim.env.FONTCONFIG_FILE
            or "/opt/homebrew/etc/fonts/fonts.conf"

        vim.g.silicon = {
            ["window-controls"] = false,
            -- "; " で連結すると先頭が無いグリフのときに後続フォントへフォールバックする
            ["font"] = "Hack; Hiragino Sans",
            ["theme"] = "Dracula",
            ["background"] = "#1e1e2e",
        }
    end,
}
