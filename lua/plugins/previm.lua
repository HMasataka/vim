-- previm configuration

return {
    "kannokanno/previm",
    dependencies = { "tyru/open-browser.vim" },
    config = function()
        vim.keymap.set("n", "<C-m>", ":PrevimOpen<CR>", { silent = true, noremap = true })
    end,
}
