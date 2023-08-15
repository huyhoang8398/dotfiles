local opt = vim.opt
local wo = vim.wo
-- Colorscheme requirement --
opt.termguicolors = true

-- Indentation --
opt.list = true
--opt.listchars:append("space:⋅")
opt.listchars:append("eol:↴")

-- disable showing modes in command line
opt.showmode = false

-- global statusline

opt.laststatus = 3
-- Enable mouse
opt.mouse = "a"

-- Highlight cursor line
opt.cursorline = true

-- Character limit indicator
opt.colorcolumn = "88"

-- Show line numbers
opt.number = true
opt.relativenumber = true

-- Defaults (does not override w/ guess-indent I think)
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Word wrap / line wrap --
wo.wrap = true
wo.linebreak = true

-- Hide diagnostics --
--vim.diagnostic.config({ virtual_text = false })

-- Copy to system clipboard --
opt.clipboard = "unnamedplus"

-- Highlight on yank --
vim.cmd("au TextYankPost * lua vim.highlight.on_yank {timeout = 250, on_visual = true}")

-- Backspace --
opt.backspace = "indent,eol,start"

-- Searching --
opt.ignorecase = true
opt.smartcase = true

-- Moonfly --
opt.fillchars = {
	horiz = "━",
	horizup = "┻",
	horizdown = "┳",
	vert = "┃",
	vertleft = "┫",
	vertright = "┣",
	verthoriz = "╋",
}

-- Nvimtree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
