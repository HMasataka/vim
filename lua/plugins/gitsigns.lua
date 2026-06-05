-- gitsigns.nvim configuration

return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        on_attach = function(bufnr)
            local gs = require("gitsigns")
            local function map(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true, desc = desc })
            end

            map({ "n", "v" }, "gn", function() gs.nav_hunk("next") end, "Next git hunk")
            map({ "n", "v" }, "gN", function() gs.nav_hunk("prev") end, "Prev git hunk")

            map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
            map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
            map("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage selection")
            map("v", "<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset selection")
            map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
            map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame line")
        end,
    },
    init = function()
        vim.opt.signcolumn = "yes"
        vim.opt.updatetime = 250
    end,
}
