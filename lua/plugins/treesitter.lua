-- nvim-treesitter configuration
-- Replaces vim-polyglot for syntax highlighting / indent / fold.

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	priority = 1000,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				-- core
				"lua",
				"vim",
				"vimdoc",
				"query",
				"regex",

				-- backend
				"go",
				"gomod",
				"gosum",
				"gowork",
				"python",
				"rust",

				-- frontend
				"javascript",
				"typescript",
				"tsx",
				"html",
				"css",
				"scss",

				-- config / data
				"json",
				"jsonc",
				"yaml",
				"toml",
				"ini",

				-- markup
				"markdown",
				"markdown_inline",
				"mermaid",

				-- shell / infra
				"bash",
				"dockerfile",
				"hcl",
				"terraform",
				"make",

				-- query
				"sql",
				"graphql",

				-- misc
				"diff",
				"git_config",
				"git_rebase",
				"gitcommit",
				"gitignore",
				"gitattributes",
				"cue",
				"proto",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "+",
					node_incremental = "+",
					node_decremental = "_",
					scope_incremental = false,
				},
			},
		})
	end,
}
