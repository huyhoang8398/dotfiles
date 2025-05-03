Neovim
======

My Neovim configuration.

Structure
---------

```
.
├── init.lua    | Neovim initialization file
├── after/      | Standard auto-loading 'after' base directory
│   └── plugin/ | Auto-loading 'plugin' configs
├── ftdetect/   | Detect filetype
└── lua/        | Lua base directory
    ├── config/ | Plugin configs that ARE lazy-loaded via explicit 'require'
    └── custom/ | plugin-manager, mappings and options configs
```

Components
----------

- [lazy.nvim](https://github.com/folke/lazy.nvim) plugin management
- [Tree-sitter](https://github.com/nvim-treesitter/nvim-treesitter) syntax highlighting
- [LSP](https://github.com/neovim/nvim-lspconfig) configuration: Python, Bash, Lua
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) auto-completion
- [Telescope](https://github.com/nvim-telescope/telescope.nvim) fuzzy finding
- [moonfly](https://github.com/bluz71/vim-moonfly-colors) colorschemes
