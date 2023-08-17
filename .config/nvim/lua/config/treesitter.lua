local treesitter = require("nvim-treesitter.configs")
local opts = {
	highlight = { enable = true },
	indent = { enable = true },
	ensure_installed = {
		"dockerfile",
		"go",
		"bash",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"python",
		"yaml",
	},
}

treesitter.setup(opts)
