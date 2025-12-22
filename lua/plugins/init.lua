-- Plugin specifications for lazy.nvim

return {
    -- Japanese help
    { "vim-jp/vimdoc-ja" },

    -- Denops
    { "vim-denops/denops.vim" },

    -- Text object plugins
    { "kana/vim-operator-user" },
    { "kana/vim-textobj-user" },
    { "terryma/vim-expand-region" },

    -- Repeat support
    { "tpope/vim-repeat" },
    { "tpope/vim-surround" },

    -- EditorConfig
    { "editorconfig/editorconfig-vim" },

    -- Session management
    { "tpope/vim-obsession" },

    -- Syntax highlighting
    {
        "sheerun/vim-polyglot",
        init = function()
            vim.g.polyglot_disabled = { "markdown" }
            vim.g.vim_json_syntax_conceal = 0
            vim.g.svelte_indent_script = 0
            vim.g.svelte_indent_style = 0
        end,
    },

    -- Comment plugin
    { "tomtom/tcomment_vim" },

    -- GitHub Copilot
    { "github/copilot.vim" },

    -- Auto-pairs
    { "cohama/lexima.vim" },

    -- Language-specific plugins
    { "jjo/vim-cue" },
    { "jsborjesson/vim-uppercase-sql" },

    -- Go plugins
    { "cappyzawa/go-playground.nvim" },
    { "mattn/vim-goimports" },

    -- Table plugins
    { "mattn/vim-maketable" },

    -- Browser integration
    { "tyru/open-browser.vim" },
}
