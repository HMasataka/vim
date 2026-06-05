-- oil.nvim configuration

return {
    "stevearc/oil.nvim",
    lazy = false,
    keys = {
        { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
        { "<C-f>", "<cmd>Oil<cr>", desc = "Open parent directory" },
    },
    opts = {
        columns = {},
        view_options = { show_hidden = true },
    },
}
