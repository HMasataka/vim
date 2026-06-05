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
        keymaps = {
            ["<CR>"] = {
                desc = "Open file in new tab (close oil)",
                callback = function()
                    local oil = require("oil")
                    local entry = oil.get_cursor_entry()
                    if not entry then return end

                    if entry.type == "directory" then
                        oil.select()
                        return
                    end

                    local dir = oil.get_current_dir()
                    if not dir then return end
                    local path = dir .. entry.name

                    require("oil.actions").close.callback()
                    vim.cmd("tabnew " .. vim.fn.fnameescape(path))
                end,
            },
        },
    },
}
