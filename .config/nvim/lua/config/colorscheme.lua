local g = vim.g

g.moonflyWinSeparator = 2
g.moonflyVirtualTextColor = true
g.moonflyUnderlineMatchParen = true
g.moonflyCursorColor = true
g.moonflyTransparent = true
g.moonflyNormalFloat = true

-- Overwrite folder color in nvimtree
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "moonfly",
	callback = function()
		vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { link = "MoonflyBlue" })
	end,
	group = vim.api.nvim_create_augroup("CustomHighlight", {}),
})

vim.cmd([[colorscheme moonfly]])
