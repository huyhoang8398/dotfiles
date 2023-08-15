local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
	ensure_installed = {
		"pyright",
		"lua_ls",
		"bashls",
		"docker_compose_language_service",
		"dockerls",
		"marksman",
	},
})
