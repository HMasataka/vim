-- Basic Vim options

local opt = vim.opt

-- Enable syntax highlighting
vim.cmd("syntax on")

-- Encoding
opt.encoding = "utf8"
opt.fileencodings = "utf-8"

-- Help language
opt.helplang = { "ja", "en" }

-- Sign column
opt.signcolumn = "yes"

-- Backup
opt.backup = true
opt.backupdir = vim.fn.expand("~/.local/share/nvim/backup")

-- Swap file
opt.swapfile = false
opt.directory = vim.fn.expand("~/.local/share/nvim")

-- Undo file
opt.undofile = true
opt.undodir = vim.fn.expand("~/.local/share/nvim/undo")

-- Bell
opt.belloff = "all"

-- Status line
opt.laststatus = 2

-- Scroll margin
opt.scrolloff = 999

-- Line numbers
opt.number = true

-- Indentation
opt.autoindent = true
opt.smartindent = true

-- Command line
opt.showcmd = true
opt.wildmenu = true

-- Backspace
opt.backspace = { "indent", "eol", "start" }

-- Search
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Cursor line
opt.cursorline = true

-- Replace options
opt.gdefault = true

-- Virtual edit
opt.virtualedit = "onemore"

-- Project-local config (.nvim.lua)
opt.exrc = true
