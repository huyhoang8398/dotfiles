vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.gitlab-ci*.{yml,yaml}",
	callback = function()
		vim.bo.filetype = "yaml.gitlab"
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "yaml.gitlab",
	callback = function()
		vim.lsp.start({
			name = "gitlab_ci_ls",
			cmd = { "node", "/home/kn/dev/gitlab-lsp/dist/server.js", "--stdio" },
			root_dir = vim.fs.dirname(
				vim.fs.find(
					{ ".gitlab-ci.yml", ".gitlab-ci.yaml", "*.gitlab-ci*.yml", "*.gitlab-ci*.yaml" },
					{ upward = true }
				)[1]
			),
		})
	end,
})
