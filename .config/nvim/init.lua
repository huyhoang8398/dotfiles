local colorscheme = vim.cmd.colorscheme
local fn = vim.fn

-- Enable the Lua loader byte-compilation cache.
if fn.has("nvim-0.9") == 1 then
	vim.loader.enable()
end

require("custom.options")
require("custom.keymaps")
require("custom.lazy") -- Plugin Manager

colorscheme("moonfly")
