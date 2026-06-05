-- indent-blankline.nvim v3 configuration

return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        local hl = "IblIndentChar"
        vim.api.nvim_set_hl(0, hl, { fg = "#708090" })

        require("ibl").setup({
            indent = {
                char = "|",
                highlight = hl,
            },
        })
    end,
}
