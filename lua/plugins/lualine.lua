-- lualine.nvim configuration

return {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    opts = {
        options = {
            theme = "auto",
            globalstatus = true,
            icons_enabled = false,
        },
        tabline = {
            lualine_a = {
                {
                    "tabs",
                    mode = 2,
                    use_mode_colors = true,
                    tabs_color = {
                        active = "lualine_a_normal",
                        inactive = "lualine_c_inactive",
                    },
                },
            },
        },
    },
}
