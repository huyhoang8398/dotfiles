local opts = {
	highlight = { enable = true },
	indent = { enable = true },
	autotag = { enable = true },
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

require("nvim-treesitter.configs").setup(opts)
