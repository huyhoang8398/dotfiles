local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
require("dap-python").setup(path)

function _G.debug_python()
	require("dap-python").test_method()
end

local api = vim.api.nvim_set_keymap
api("n", "<leader>dpr", ":call v:lua.debug_python()<CR>", { noremap = true, silent = true })
