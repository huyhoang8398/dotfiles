local lualine_sections = {
	lualine_a = { "mode" },
	lualine_b = { "branch", "b:gitsigns_status" },
	lualine_c = {
		"filename",
		{
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" },
		},
		"g:metals_status",
	},
	lualine_x = { "filetype" },
	lualine_y = { { "fileformat", icons_enabled = false }, "encoding" },
	lualine_z = { "progress", "location" },
}

local opts = {
	options = {
		icons_enabled = true,
		globalstatus = true,
		theme = "moonfly",
		-- component_separators = "|",
		-- section_separators = "",
		disabled_filetypes = {},
	},
	sections = lualine_sections,
	inactive_sections = vim.deepcopy(lualine_sections),
	tabline = {},
	extensions = { "nvim-tree" },
}

return opts
