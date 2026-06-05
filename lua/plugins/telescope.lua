-- telescope.nvim configuration

return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope: find files" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Telescope: live grep" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Telescope: buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "Telescope: help tags" },
    },
}
