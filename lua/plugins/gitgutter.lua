-- vim-gitgutter configuration

return {
  "airblade/vim-gitgutter",
  config = function()
    vim.keymap.set({ "n", "v" }, "gn", ":GitGutterNextHunk<CR>", { noremap = true })
    vim.keymap.set({ "n", "v" }, "gN", ":GitGutterPrevHunk<CR>", { noremap = true })

    vim.opt.signcolumn = "yes"
    vim.opt.updatetime = 250
  end,
}
