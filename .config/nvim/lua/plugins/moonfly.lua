local Plugin = { "bluz71/vim-moonfly-colors" }

Plugin.lazy = false
function Plugin.config(_, opts)
    local RosePines = require("rose-pine")
    RosePines.setup(opts)
    vim.g.moonflyWinSeparator = 2
    vim.g.moonflyVirtualTextColor = true
    vim.g.moonflyUnderlineMatchParen = true
    vim.g.moonflyCursorColor = true
    vim.g.moonflyTransparent = true
    vim.g.moonflyNormalFloat = true
end

return Plugin
