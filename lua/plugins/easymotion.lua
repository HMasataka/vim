-- vim-easymotion configuration

return {
  "easymotion/vim-easymotion",
  config = function()
    vim.g.EasyMotion_do_mapping = 0

    local keymap = vim.keymap.set
    keymap({ "n", "v" }, "f", "<Plug>(easymotion-fl)", {})
    keymap({ "n", "v" }, "t", "<Plug>(easymotion-tl)", {})
    keymap({ "n", "v" }, "F", "<Plug>(easymotion-Fl)", {})
    keymap({ "n", "v" }, "T", "<Plug>(easymotion-Tl)", {})
    keymap({ "n", "v" }, "<space>f", "<Plug>(easymotion-s2)", {})
  end,
}
