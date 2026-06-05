-- flash.nvim configuration

return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
        {
            "<space>f",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump()
            end,
            desc = "Flash jump",
        },
    },
}
