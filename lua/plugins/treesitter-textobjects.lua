-- nvim-treesitter-textobjects (main branch) configuration

return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("nvim-treesitter-textobjects").setup({
            select = {
                lookahead = true,
            },
        })

        local select = require("nvim-treesitter-textobjects.select")
        local function map(lhs, query)
            vim.keymap.set({ "x", "o" }, lhs, function()
                select.select_textobject(query, "textobjects")
            end, { desc = "Select " .. query })
        end

        map("af", "@function.outer")
        map("if", "@function.inner")
        map("ac", "@class.outer")
        map("ic", "@class.inner")
    end,
}
