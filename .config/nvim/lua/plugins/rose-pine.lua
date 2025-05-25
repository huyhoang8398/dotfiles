local Plugin = { "rose-pine/neovim" }

Plugin.lazy = false
Plugin.opts = {
    variant = "auto",      -- auto, main, moon, or dawn
    dark_variant = "main", -- main, moon, or dawn
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    enable = {
        terminal = true,
        legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
        migrations = true,        -- Handle deprecated options automatically
    },

    styles = {
        bold = true,
        italic = true,
        transparency = true,
    },
}

function Plugin.config(_, opts)
    local RosePines = require("rose-pine")
    RosePines.setup(opts)
end

return Plugin
