-- nvim-treesitter configuration (main branch / Neovim 0.12+)
-- Replaces vim-polyglot for syntax highlighting / indent / fold.
--
-- NOTE: The `main` branch dropped the old `require("nvim-treesitter.configs").setup`
-- API. Parsers are installed via `install()`, and highlight/indent are enabled
-- per-buffer via an autocmd using Neovim core treesitter.

local ensure_installed = {
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
}

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	priority = 1000,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")
		ts.setup()

		-- Install missing parsers asynchronously on startup.
		ts.install(ensure_installed)

		-- Enable highlight + indent for any buffer whose filetype has a parser.
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("nvim_treesitter_start", { clear = true }),
			callback = function(args)
				local buf = args.buf
				local ft = vim.bo[buf].filetype
				local lang = vim.treesitter.language.get_lang(ft)
				if not lang then
					return
				end
				-- Only start if the parser is actually available.
				if not pcall(vim.treesitter.start, buf, lang) then
					return
				end
				-- treesitter-based indentation (experimental).
				vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})

		-- ------------------------------------------------------------------
		-- Incremental selection (re-implemented; removed from main branch).
		-- + : init / expand to parent node
		-- _ : shrink to previous node
		-- ------------------------------------------------------------------
		local sel_stack = {}

		local function select_range(range)
			local sr, sc, er, ec = range[1], range[2], range[3], range[4]
			vim.api.nvim_win_set_cursor(0, { sr + 1, sc })
			vim.cmd("normal! v")
			-- end-exclusive -> inclusive
			if ec == 0 then
				er = er - 1
				ec = math.huge
			else
				ec = ec - 1
			end
			vim.api.nvim_win_set_cursor(0, { er + 1, math.min(ec, vim.fn.col({ er + 1, "$" }) - 1) })
		end

		local function node_range(node)
			local sr, sc, er, ec = node:range()
			return { sr, sc, er, ec }
		end

		local function init_selection()
			local node = vim.treesitter.get_node()
			if not node then
				return
			end
			sel_stack = { node }
			select_range(node_range(node))
		end

		local function node_incremental()
			local top = sel_stack[#sel_stack]
			if not top then
				return init_selection()
			end
			local parent = top:parent()
			while parent and parent:range() == top:range() do
				parent = parent:parent()
			end
			if parent then
				table.insert(sel_stack, parent)
				select_range(node_range(parent))
			else
				select_range(node_range(top))
			end
		end

		local function node_decremental()
			if #sel_stack > 1 then
				table.remove(sel_stack)
			end
			local top = sel_stack[#sel_stack]
			if top then
				select_range(node_range(top))
			end
		end

		vim.keymap.set("n", "+", init_selection, { desc = "TS: init selection" })
		vim.keymap.set("x", "+", node_incremental, { desc = "TS: expand selection" })
		vim.keymap.set("x", "_", node_decremental, { desc = "TS: shrink selection" })
	end,
}
