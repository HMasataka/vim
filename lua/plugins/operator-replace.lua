-- vim-operator-replace configuration

return {
    "kana/vim-operator-replace",
    dependencies = { "kana/vim-operator-user" },
    config = function()
        vim.keymap.set({ "n", "v" }, "R", "<Plug>(operator-replace)", {})
    end,
}
