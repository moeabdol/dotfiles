local opt = vim.opt

-- Line number
opt.relativenumber = true
opt.number = true

-- Tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = false
opt.autoindent = true

-- Line wrapping
opt.wrap = false

-- Width and color column
opt.textwidth = 80
opt.winwidth = 80
opt.colorcolumn = "+1"

-- Search settings
opt.ignorecase = true
opt.smartcase = true

-- Cursor line
opt.cursorline = true

-- Colors
opt.termguicolors = true
opt.background = "dark"

-- Sign column
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Cursor always block
opt.guicursor = "n-i-v-c:block"

-- List options
opt.list = true
opt.listchars:append({
	tab = "· ",
	trail = "·",
	nbsp = "␣",
	extends = "▶",
	precedes = "◀",
	-- eol = "↲",
})

-- Folds
-- enable Tree-sitter folds globally
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- optional quality-of-life defaults
vim.opt.foldenable = true -- enable folding
vim.opt.foldlevel = 99 -- keep most folds open
vim.opt.foldlevelstart = 99 -- don't start fully closed
