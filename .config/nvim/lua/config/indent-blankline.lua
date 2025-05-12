local ibl = require("ibl")

ibl.setup({
	exclude = {
		filetypes = { "text", "txt", "undotree", "yaml" },
	},
	indent = {
		char = { "▏" },
		tab_char = { "▏" },
	},
	scope = {
		enabled = false,
	},
})
