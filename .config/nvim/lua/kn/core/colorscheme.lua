vim.g.moonflyWinSeparator = 2
vim.g.moonflyVirtualTextColor = true
vim.g.moonflyUnderlineMatchParen = true
vim.g.moonflyCursorColor = true
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "moonfly",
	callback = function()
		vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { link = "MoonflyBlue" })
	end,
	group = vim.api.nvim_create_augroup("CustomHighlight", {}),
})

vim.cmd([[colorscheme moonfly]])
