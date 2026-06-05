-- oil.nvim configuration

return {
    "stevearc/oil.nvim",
    lazy = false,
    keys = {
        { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
        {
            "<C-f>",
            function()
                if vim.bo.filetype == "oil" then
                    require("oil.actions").close.callback()
                else
                    require("oil").open()
                end
            end,
            desc = "Toggle oil",
        },
    },
    opts = {
        columns = {},
        view_options = { show_hidden = true },
    },
}
