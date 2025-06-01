local Plugin = { 'mason-org/mason-lspconfig.nvim' }

Plugin.lazy = true

-- See :help mason-lspconfig-settings
Plugin.opts = {
    -- language servers will be enabled in
    -- lua/plugins/lspconfig.lua
    automatic_enable = false,
}

return Plugin
