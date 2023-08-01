local lazy_opts = require("kn.plugins.configs.lazy-nvim")
local default_plugins = {
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
		config = function()
			require("kn.core.colorscheme")
		end,
	},
	-- Bufferline --
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					diagnostics = "nvim_lsp",
					--separator_style = "slope",
					diagnostics_update_in_insert = false,
					diagnostics_indicator = function(count, level, diagnostics_dict, context)
						local icon = level:match("error") and " " or " "
						return " " .. icon .. count
					end,
					offsets = {
						{
							filetype = "NvimTree",
							text = "Explorer",
							separator = true,
						},
					},
				},
			})
		end,
	},

	-- lualine (status line) --
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = function()
			return require("kn.plugins.configs.lualine")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = function()
			return require("kn.plugins.configs.indent_blankline")
		end,
	},

	-- Tree sitter --
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",

		opts = function()
			return require("kn.plugins.configs.treesitter")
		end,
	},

	-- Telescope --
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		cmd = "Telescope",

		opts = function()
			return require("kn.plugins.configs.telescope")
		end,
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("fzf")
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

		opts = function()
			return require("kn.plugins.configs.nvimtree")
		end,
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{
				"neovim/nvim-lspconfig", -- required
			},
			{ -- Optional
				"williamboman/mason.nvim",
				build = ":MasonUpdate", -- :MasonUpdate updates registry contents
				config = function()
					require("mason").setup()
				end,
			},
			{
				"williamboman/mason-lspconfig.nvim",
			}, -- Optional
			{
				"jay-babu/mason-null-ls.nvim",
				event = { "BufReadPre", "BufNewFile" },
				dependencies = {
					"williamboman/mason.nvim",
					"jose-elias-alvarez/null-ls.nvim",
				},
			},

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{
				"L3MON4D3/LuaSnip", -- Required
				build = "make install_jsregexp",
				dependencies = { "rafamadriz/friendly-snippets" },
			},
		},
		config = function()
			require("kn.plugins.configs.lsp-zero")
			require("kn.plugins.configs.mason-lspconfig")
			require("kn.plugins.configs.cmp")
			require("kn.plugins.configs.mason-null-ls")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = function()
			return require("kn.plugins.configs.gitsigns")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			require("kn.plugins.configs.nvim-dap-ui")
		end,
	},
	{
		"mfussenegger/nvim-dap",
	},
	{
		"mfussenegger/nvim-dap-python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function(_, opts)
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("kn.plugins.configs.autopairs")
		end,
	},
}
require("lazy").setup(default_plugins, lazy_opts)
