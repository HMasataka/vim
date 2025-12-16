-- denops-skkeleton configuration

return {
  {
    "vim-skk/denops-skkeleton.vim",
    dependencies = { "vim-denops/denops.vim" },
    config = function()
      -- Key mapping
      vim.keymap.set({ "i", "c" }, "<C-k>", "<Plug>(skkeleton-toggle)", {})

      -- Initialize skkeleton
      vim.api.nvim_create_autocmd("User", {
        pattern = "skkeleton-initialize-pre",
        callback = function()
          vim.fn["skkeleton#config"]({
            eggLikeNewline = true,
            globalDictionaries = { { "~/.vim/skk/SKK-JISYO.L", "" } },
            userDictionary = "~/.vim/skk/skk-jisyo.utf8",
          })
          vim.fn["skkeleton#register_keymap"]("input", "<C-q>", "katakana")
          vim.fn["skkeleton#register_keymap"]("henkan", "<C-q>", "katakana")
          vim.fn["skkeleton#register_keymap"]("input", "<S-q>", "hankatakana")
          vim.fn["skkeleton#register_keymap"]("henkan", "<S-q>", "hankatakana")
          vim.fn["skkeleton#register_keymap"]("input", "<S-g>", "")
          vim.fn["skkeleton#register_keymap"]("henkan", "<S-g>", "")
        end,
      })
    end,
  },
  {
    "shg-eo/skkeleton-azik",
    dependencies = { "vim-skk/denops-skkeleton.vim" },
  },
}
