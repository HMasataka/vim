-- coc.nvim configuration

return {
    "neoclide/coc.nvim",
    branch = "release",
    config = function()
        -- Key mappings
        local keymap = vim.keymap.set
        local opts = { silent = true, noremap = true }

        keymap("n", "gd", "<Plug>(coc-definition)", { silent = true })
        keymap("n", "gi", "<Plug>(coc-implementation)", { silent = true })
        keymap("n", "<space>rf", "<Plug>(coc-references)", { silent = true })
        keymap("n", "<space>rn", "<Plug>(coc-rename)", { silent = true })
        keymap("n", "<space>l", "<Plug>(coc-format)", { silent = true })
        keymap("n", "<space>n", "<Plug>(coc-diagnostic-next-error)", { silent = true })
        keymap("n", "<space>N", "<Plug>(coc-diagnostic-prev-error)", { silent = true })
        keymap("n", "<space>j", "<Plug>(coc-diagnostic-next)", { silent = true })
        keymap("n", "<space>k", "<Plug>(coc-diagnostic-prev)", { silent = true })

        -- Format command
        vim.api.nvim_create_user_command("Format", function()
            vim.fn.CocAction("format")
        end, { nargs = 0 })

        -- Import organization command
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = { "*.go" },
            command = "call CocAction('runCommand', 'editor.action.organizeImport')"
        })

        -- Show documentation with K
        keymap("n", "K", function()
            local filetype = vim.bo.filetype
            if filetype == "vim" or filetype == "help" then
                vim.cmd("help " .. vim.fn.expand("<cword>"))
            else
                vim.fn.CocActionAsync("doHover")
            end
        end, opts)

        -- Tab completion
        local function check_back_space()
            local col = vim.fn.col(".") - 1
            return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
        end

        keymap("i", "<TAB>", function()
            if vim.fn["coc#pum#visible"]() ~= 0 then
                return vim.fn["coc#_select_confirm"]()
            elseif vim.fn["coc#expandableOrJumpable"]() ~= 0 then
                return vim.fn["coc#rpc#request"]("doKeymap", { "snippets-expand-jump", "" })
            elseif check_back_space() then
                return "<TAB>"
            else
                return vim.fn["coc#refresh"]()
            end
        end, { silent = true, expr = true })

        vim.g.coc_snippet_prev = "<TAB>"

        -- Global extensions
        vim.g.coc_global_extensions = {
            "coc-flutter",
            "coc-pyright",
            "coc-diagnostic",
            "coc-go",
            "coc-rust-analyzer",
            "coc-svelte",
            "coc-tsserver",
            "coc-deno",
            "coc-vetur",
            "coc-vimlsp",
            "coc-docker",
            "coc-markdownlint",
            "coc-json",
            "coc-xml",
            "coc-yaml",
            "coc-toml",
            "coc-css",
            "coc-snippets",
            "coc-cssmodules",
            "coc-spell-checker",
            "coc-gitignore",
            "coc-word",
            "coc-sql",
            "coc-clangd",
            "coc-prettier",
            "coc-lua"
        }

        -- Code actions
        keymap({ "v", "n" }, "<leader>a", "<Plug>(coc-codeaction-selected)", { silent = true })

        -- OmniSharp settings
        vim.g.OmniSharp_server_use_mono = 1
    end,
}
