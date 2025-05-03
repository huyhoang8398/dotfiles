local treesitter = require("nvim-treesitter.configs")
local opts = {
    ensure_installed = {
        "vimdoc",
        "luadoc",
        "vim",
        "dockerfile",
        "go",
        "bash",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "yaml",
    },
    highlight = { enable = true },
    indent = { enable = true },
    sync_install = false,
}

treesitter.setup(opts)
