local colorscheme = vim.cmd.colorscheme
local fn = vim.fn

-- Enable the Lua loader byte-compilation cache.
vim.loader.enable()

require("custom.options")
require("custom.keymaps")
require("custom.lazy") -- Plugin Manager
