-- vim-goaddtags configuration

return {
  "mattn/vim-goaddtags",
  config = function()
    vim.keymap.set("n", "<leader>gt", ":<C-u>GoAddTags ", { noremap = true })
  end,
}
