local opts = require("kn.plugins.configs.lazy-nvim")
local default_plugins = {
	{
		"sainnhe/sonokai",
		lazy = false,
		priority = 1000,
		config = function()
			-- load the colorscheme here
			require("kn.core.colorscheme")
		end,
	},
	-- lualine (status line) --
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = function()
			return require("kn.plugins.configs.lualine")
		end,
		config = function(_, opts)
			require("lualine").setup(opts)
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = function()
			return require("kn.plugins.configs.indent_blankline")
		end,
		config = function(_, opts)
			require("indent_blankline").setup(opts)
		end,
	},

	-- Tree sitter --
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",

		opts = function()
			return require("kn.plugins.configs.treesitter")
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
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
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{
				"L3MON4D3/LuaSnip", -- Required
				dependencies = { "rafamadriz/friendly-snippets" },
			},
		},
		config = function()
			require("kn.plugins.configs.lsp-zero")
			require("kn.plugins.configs.cmp")
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			require("kn.plugins.configs.mason-null-ls")
		end,
	},
}
require("lazy").setup(default_plugins, opts)
