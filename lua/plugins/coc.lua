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

        -- Function text objects
        keymap("x", "if", "<Plug>(coc-funcobj-i)", { silent = true })
        keymap("x", "af", "<Plug>(coc-funcobj-a)", { silent = true })
        keymap("o", "if", "<Plug>(coc-funcobj-i)", { silent = true })
        keymap("o", "af", "<Plug>(coc-funcobj-a)", { silent = true })

        -- Format command
        vim.api.nvim_create_user_command("Format", function()
            vim.fn.CocAction("format")
        end, { nargs = 0 })

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
            "coc-fzf-preview",
            "coc-clangd",
            "coc-prettier",
            "coc-lua"
        }

        -- Code actions
        keymap({ "v", "n" }, "<leader>a", "<Plug>(coc-codeaction-selected)", { silent = true })

        -- Shell settings for coc-fzf-preview
        vim.opt.shell = "/bin/zsh"
        vim.env.SHELL = "/bin/zsh"

        -- FZF Preview keymaps
        keymap("n", "<Leader>f", "[fzf-p]", { noremap = true })
        keymap("x", "<Leader>f", "[fzf-p]", { noremap = true })
        keymap("n", "[fzf-p]f", ":<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>", opts)
        keymap("n", "[fzf-p]s", ":<C-u>CocCommand fzf-preview.GitStatus<CR>", opts)
        keymap("n", "[fzf-p]a", ":<C-u>CocCommand fzf-preview.GitActions<CR>", opts)
        keymap("n", "[fzf-p]b", ":<C-u>CocCommand fzf-preview.Buffers<CR>", opts)
        keymap("n", "[fzf-p]/",
            ":<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query='\"<CR>", opts)

        -- OmniSharp settings
        vim.g.OmniSharp_server_use_mono = 1
    end,
}
