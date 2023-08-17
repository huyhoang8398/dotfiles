local g = vim.g
local map = vim.keymap.set

g.undotree_HighlightChangedWithSign = 0
g.undotree_WindowLayout = 2
g.undotree_SetFocusWhenToggle = 1

local opts = { silent = true }
map("n", "<leader>u", ":UndotreeToggle<CR>", opts)
