-- vim-textobj-multiblock configuration

return {
    "osyo-manga/vim-textobj-multiblock",
    dependencies = { "kana/vim-textobj-user" },
    config = function()
        local keymap = vim.keymap.set
        keymap("o", "ab", "<Plug>(textobj-multiblock-a)", { silent = true })
        keymap("o", "ib", "<Plug>(textobj-multiblock-i)", { silent = true })
        keymap("x", "ab", "<Plug>(textobj-multiblock-a)", { silent = true })
        keymap("x", "ib", "<Plug>(textobj-multiblock-i)", { silent = true })

        vim.g.textobj_multiblock_blocks = {
            { "(", ")" },
            { "[", "]" },
            { "{", "}" },
            { "<", ">" },
            { '"', '"', 1 },
            { "'", "'", 1 },
        }
    end,
}
