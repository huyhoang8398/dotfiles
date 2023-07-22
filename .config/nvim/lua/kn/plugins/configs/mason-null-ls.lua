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
		null_ls.builtins.diagnostics.hadolint,
		null_ls.builtins.diagnostics.selene,
		null_ls.builtins.diagnostics.shellcheck,
		null_ls.builtins.diagnostics.ruff,
		null_ls.builtins.diagnostics.mypy,
	},
})
-- See mason-null-ls.nvim's documentation for more details:
-- https://github.com/jay-babu/mason-null-ls.nvim#setup
require("mason-null-ls").setup({
	ensure_installed = {
		"shellcheck",
		"selene",
		"hadolint",
		"black",
		"shfmt",
		"stylua",
		"ruff",
		"mypy",
		"debugpy",
	},
	automatic_installation = true,
})
