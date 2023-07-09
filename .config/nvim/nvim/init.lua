-- lazy.nvim --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)
-- Indentation -- 
vim.opt.list = true
vim.opt.listchars:append "space:⋅" vim.opt.listchars:append "eol:↴"
-- Enable mouse
vim.opt.mouse = 'a'
-- Highlight cursor line
vim.opt.cursorline = true
-- Character limit indicator
vim.opt.colorcolumn = '88'
-- Show line numbers
vim.opt.number = true
vim.opt.relativenumber=true
-- Defaults (does not override w/ guess-indent I think)
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- Word wrap / line wrap --
vim.wo.wrap = true
vim.wo.linebreak = true

require("lazy").setup(
    {
        -- colorscheme --
        {
            "loctvl842/monokai-pro.nvim",
            lazy = false,
            priority = 1000,
            config = function()
                local monokai = require("monokai-pro")
                monokai.setup(
                    {
                        transparent_background = false,
                        devicons = true,
                        filter = "classic", -- pro | octagon | classic | machine | ristretto | spectrum
                        day_night = {
                            enable = false,
                            day_filter = "pro",
                            night_filter = "spectrum"
                        },
                        inc_search = "background", -- underline | background
                        background_clear = {"nvim-tree", "neo-tree", "bufferline"},
                        plugins = {
                            bufferline = {
                                underline_selected = true,
                                underline_visible = false,
                                underline_fill = true,
                                bold = false
                            },
                            indent_blankline = {
                                context_highlight = "pro", -- default | pro
                                context_start_underline = true
                            }
                        },
                        override = function(c)
                            return {
                                ColorColumn = {bg = c.editor.background},
                                -- Mine
                                DashboardRecent = {fg = c.base.magenta},
                                DashboardProject = {fg = c.base.blue},
                                DashboardConfiguration = {fg = c.base.white},
                                DashboardSession = {fg = c.base.green},
                                DashboardLazy = {fg = c.base.cyan},
                                DashboardServer = {fg = c.base.yellow},
                                DashboardQuit = {fg = c.base.red}
                            }
                        end
                    }
                )
                monokai.load()
            end
        },
        -- lualine (status line) --
        {
            "nvim-lualine/lualine.nvim",
            dependencies = {"nvim-tree/nvim-web-devicons"},
            config = function()
                -- Lualine
                local lualine_sections = {
                    lualine_a = {"mode"},
                    lualine_b = {"branch", "b:gitsigns_status"},
                    lualine_c = {
                        "filename",
                        {
                            "diagnostics",
                            sources = {"nvim_diagnostic"},
                            symbols = {error = "E:", warn = "W:", info = "I:", hint = "H:"}
                        },
                        "g:metals_status"
                    },
                    lualine_x = {"filetype"},
                    lualine_y = {{"fileformat", icons_enabled = false}, "encoding"},
                    lualine_z = {"progress", "location"}
                }
                require "lualine".setup {
                    options = {
                        icons_enabled = true,
                        theme = "monokai-pro",
                        component_separators = "|",
                        section_separators = "",
                        disabled_filetypes = {}
                    },
                    sections = lualine_sections,
                    inactive_sections = vim.deepcopy(lualine_sections),
                    tabline = {},
                    extensions = {}
                }
            end,
        },
        -- Indent blank line --
        { 
            "lukas-reineke/indent-blankline.nvim",
            config = function ()
                require "indent_blankline".setup {
                    space_char_blankline = " ",
                    show_current_context = true,
                    show_current_context_start = true,
                    show_end_of_line = true,

                }
            end,
        },
        -- Tree sitter --
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            opts = {
                highlight = { enable = true },
                indent = { enable = true },
                ensure_installed = {
                    "bash",
                    "json",
                    "lua",
                    "markdown",
                    "python",
                    "yaml",
                },
            },
            config = function (_, opts) 
                if type(opts.ensure_installed) == "table" then
                    ---@type table<string, boolean>
                    local added = {}
                    opts.ensure_installed = vim.tbl_filter(function(lang)
                        if added[lang] then
                            return false
                        end
                        added[lang] = true
                        return true
                    end, opts.ensure_installed)
                end
                require("nvim-treesitter.configs").setup(opts)
            end,
        },
        -- Telescope --
        {
            'nvim-telescope/telescope.nvim', branch = '0.1.x',
            dependencies = {
                { 'nvim-lua/plenary.nvim' },
                { 'nvim-telescope/telescope-fzf-native.nvim',
                    build = 'make',
                }
            },
            config = function ()
                require('telescope').setup{
                    extensions = {
                        fzf = {
                            fuzzy = true,                    -- false will only do exact matching
                            override_generic_sorter = true,  -- override the generic sorter
                            override_file_sorter = true,     -- override the file sorter
                            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                            -- the default case_mode is "smart_case"
                        }
                    },
                    defaults = {
                        entry_prefix = "  ",
                        initial_mode = "insert",
                        selection_strategy = "reset",
                        sorting_strategy = "ascending",
                        layout_strategy = "horizontal",
                        layout_config = {
                            horizontal = {
                                prompt_position = "top",
                                preview_width = 0.55,
                                results_width = 0.8,
                            },
                            vertical = {
                                mirror = false,
                            },
                            width = 0.87,
                            height = 0.80,
                            preview_cutoff = 120,
                        },
                    },
                }
                local builtin = require('telescope.builtin')
                vim.keymap.set('n', '<leader>\\', builtin.find_files, {})
                vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
                vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
                vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
            end,
        },
    }
)

