require("mason").setup()
local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		-- Replace these with the tools you want to install
		-- make sure the source name is supported by null-ls
		-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.diagnostics.hadolint.with({
			diagnostic_config = {
				underline = false,
			},
		}),
		null_ls.builtins.diagnostics.selene,
		null_ls.builtins.diagnostics.shellcheck.with({
			diagnostic_config = {
				underline = false,
			},
		}),
	},
})
-- See mason-null-ls.nvim's documentation for more details:
-- https://github.com/jay-babu/mason-null-ls.nvim#setup
require("mason-null-ls").setup({
	ensure_installed = {
		"shellcheck",
		"selene",
		"pylint",
		"hadolint",
		"black",
		"shfmt",
		"stylua",
	},
	automatic_installation = true,
})
