local Plugin = { "bluz71/vim-moonfly-colors" }

Plugin.lazy = false
function Plugin.config()
    vim.g.moonflyWinSeparator = 2
    vim.g.moonflyVirtualTextColor = false
    vim.g.moonflyUnderlineMatchParen = true
    vim.g.moonflyCursorColor = true
    vim.g.moonflyTransparent = true
    vim.g.moonflyNormalFloat = true
end

return Plugin
