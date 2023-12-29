-- Bootstrap and install lazy.nvim as the Neovim plugin manager.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local opts = {
	install = {
		missing = true,
		colorscheme = { "moonfly", "habamax" },
	},

	ui = {
		border = "single",
		icons = {
			ft = "",
			lazy = "󰂠 ",
			loaded = "",
			not_loaded = "",
		},
	},

	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"netrwPlugin",
				"rplugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
}
local plugins = {
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
		config = function()
			require("config.moonfly")
		end,
	},
	-- lualine (status line) --
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("config.lualine")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		dependencies = { "HiPhish/rainbow-delimiters.nvim" },
		main = "ibl",
		event = "BufReadPre",
		config = function()
			require("config.indent-blankline")
		end,
	},

	-- Tree sitter --
	{
		"nvim-treesitter/nvim-treesitter",
		tag = "v0.9.1",
		build = ":TSUpdate",
		event = "BufReadPost",
		config = function()
			require("config.treesitter")
		end,
	},

	-- Telescope --
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require("config.telescope")
		end,
	},
	-- Nvim-tree --
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("config.nvim-tree")
		end,
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{
				"williamboman/mason.nvim",
				opts = {
					ui = {
						border = "single",
					},
				},
			},
			{
				"williamboman/mason-lspconfig.nvim",
				config = function()
					require("config.mason-lspconfig")
				end,
			},
			{
				"jay-babu/mason-null-ls.nvim",
				event = { "BufReadPre", "BufNewFile" },
				dependencies = {
					"williamboman/mason.nvim",
					"nvimtools/none-ls.nvim",
				},
				config = function()
					require("config.mason-null-ls")
				end,
			},

			-- Autocompletion
			{
				"hrsh7th/nvim-cmp",
				dependencies = {
					"hrsh7th/cmp-nvim-lua",
					"hrsh7th/cmp-buffer",
					"hrsh7th/cmp-path",
					"hrsh7th/cmp-nvim-lsp",
					"saadparwaiz1/cmp_luasnip",
					"hrsh7th/cmp-nvim-lsp-signature-help",
				},
				event = "InsertEnter",
			},
			{
				"L3MON4D3/LuaSnip",
				build = "make install_jsregexp",
				dependencies = {
					"rafamadriz/friendly-snippets",
				},
			},
		},
		config = function()
			require("config.lsp")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		config = function()
			require("config.gitsigns")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			require("config.nvim-dap-ui")
		end,
	},
	{ "mfussenegger/nvim-dap" },
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			require("config.nvim-dap-python")
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("config.autopairs")
		end,
	},
	{ "mbbill/undotree" },
}
require("lazy").setup(plugins, opts)
