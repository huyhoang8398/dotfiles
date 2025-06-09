local Plugin = { "stevearc/conform.nvim" }
Plugin.opts = {
	formatters_by_ft = {
		lua = { "stylua" },
		bash = { "shfmt" },
		-- Conform will run the first available formatter
		json = { "prettierd", "prettier", stop_after_first = true },
		jsonc = { "prettierd", "prettier", stop_after_first = true },
		css = { "prettierd", "prettier", stop_after_first = true },
		yaml = { "prettierd", "prettier", stop_after_first = true },
		python = function(bufnr)
			if require("conform").get_formatter_info("ruff_format", bufnr).available then
				return { "ruff_format" }
			else
				return { "isort", "black" }
			end
		end,
	},
}
function Plugin.config(_, opts)
	local Conform = require("conform")
	Conform.setup(opts)
	vim.keymap.set({ "n", "v" }, "gq", function()
		Conform.format({
			timeout_ms = 5000,
			lsp_format = "fallback",
		})
	end, { desc = "Formatting buffer" })
end

return Plugin
