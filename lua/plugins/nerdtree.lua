-- NERDTree configuration

return {
  "preservim/nerdtree",
  config = function()
    -- Toggle NERDTree
    vim.keymap.set("n", "<C-f>", ":NERDTreeToggle<CR>", { silent = true, noremap = true })

    -- Show hidden files
    vim.g.NERDTreeShowHidden = 1

    -- Ignore patterns
    vim.g.NERDTreeIgnore = {
      "\\.pyc$",
      "\\.egg-info$",
      "^__pycache__$[[dir]]",
      "^.git$[[dir]]",
    }

    -- Close Vim if NERDTree is the only window remaining
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*",
      callback = function()
        if vim.fn.winnr("$") == 1 and vim.fn.exists("b:NERDTree") == 1 and vim.b.NERDTree.isTabTree() then
          vim.cmd("quit")
        end
      end,
    })

    -- Open NERDTree automatically when vim is started without file arguments
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        if vim.fn.argc() == 0 then
          vim.cmd("NERDTree")
        end
      end,
    })
  end,
}
