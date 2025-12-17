-- Key mappings

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Semicolon to colon
keymap("n", ";", ":", { noremap = true })

-- Ctrl+j to ESC
keymap({ "i", "c", "v" }, "<C-j>", "<Esc>", opts)
keymap("n", "<C-j>", ":noh<CR>", opts)

-- Increment number (Ctrl+c instead of Ctrl+a)
keymap("n", "<C-c>", "<C-a>", opts)

-- Movement on display line instead of actual line
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- Change cursor shape when insert mode
vim.cmd([[
  let &t_ti.="\e[1 q"
  let &t_SI.="\e[5 q"
  let &t_EI.="\e[1 q"
  let &t_te.="\e[0 q"
]])

-- Ctrl+l to Right arrow in insert mode
keymap("i", "<C-l>", "<Right>", opts)

-- Move cursor to end of line by Ctrl+e
keymap("i", "<C-e>", "<Esc><S-a>", opts)
keymap("n", "<C-e>", "$", { noremap = true })
keymap("v", "<C-e>", "$", { noremap = true })

-- Move cursor to begin of line by Ctrl+a
keymap("i", "<C-a>", "<Esc><S-i>", opts)
keymap("n", "<C-a>", "^", { noremap = true })

-- Disable default commands
keymap("n", "ZZ", "<Nop>", opts)
keymap("n", "ZQ", "<Nop>", opts)
keymap("n", "Q", "<Nop>", opts)
keymap("n", "<MiddleMouse>", "<Nop>", opts)

-- Splitting screen
keymap("n", "ss", ":split<CR>", opts)
keymap("n", "sv", ":vsplit<CR>", opts)
keymap("n", "sh", "<C-w>h", opts)
keymap("n", "sj", "<C-w>j", opts)
keymap("n", "sk", "<C-w>k", opts)
keymap("n", "sl", "<C-w>l", opts)

-- Moving screen
keymap("n", "sH", "<C-w>H", opts)
keymap("n", "sJ", "<C-w>J", opts)
keymap("n", "sK", "<C-w>K", opts)
keymap("n", "sL", "<C-w>L", opts)

-- Copy to clipboard
keymap({ "n", "v" }, "<Space>y", '"+y', { noremap = true })
keymap({ "n", "v" }, "<Space>p", '"+p', { noremap = true })

-- Tab
keymap("n", "st", ":tabnew<CR>", opts)
keymap("n", "sn", "gt", opts)
keymap("n", "su", "gT", opts)

-- Buffer
keymap("n", "<C-n>", ":bnext<CR>", opts)
keymap("n", "<C-p>", ":bprev<CR>", opts)

-- s<N> jump to N tab
for n = 1, 9 do
  keymap("n", "s" .. n, ":<C-u>tabnext " .. n .. "<CR>", opts)
end

-- sw<N> jump to N window
for n = 1, 9 do
  keymap("n", "sw" .. n, function()
    local win_id = vim.fn.win_getid(n)
    vim.fn.win_gotoid(win_id)
  end, opts)
end

-- Tag jump
keymap("n", "go", "%", opts)
