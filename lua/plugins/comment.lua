-- Comment.nvim configuration

return {
    "numToStr/Comment.nvim",
    keys = {
        {
            "<C-_>",
            function() require("Comment.api").toggle.linewise.current() end,
            mode = "n",
            desc = "Toggle comment",
        },
        {
            "<C-_>",
            "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
            mode = "x",
            desc = "Toggle comment selection",
        },
        {
            "<C-_>",
            "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
            mode = "i",
            desc = "Toggle comment",
        },
        { "gcc", mode = "n", desc = "Toggle line comment" },
        { "gbc", mode = "n", desc = "Toggle block comment" },
        { "gc", mode = { "n", "x" }, desc = "Toggle line comment" },
        { "gb", mode = { "n", "x" }, desc = "Toggle block comment" },
    },
    opts = {},
}
