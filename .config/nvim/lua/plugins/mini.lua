-- Note: mini.nvim is a collection of lua modules.
-- each module is basically a standalone plugin.
-- you can read their documentation on github:
-- https://github.com/echasnovski/mini.nvim

local Plugin = { "echasnovski/mini.nvim" }
local user = {}

Plugin.lazy = false

Plugin.dependencies = {
	{ "rafamadriz/friendly-snippets" },
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		opts = {
			enable_autocmd = false,
		},
		init = function()
			vim.g.skip_ts_context_commentstring_module = true
		end,
	},
}

function Plugin.init()
	-- Enable "global" statusline
	vim.o.laststatus = 3

	-- Don't show current mode below statusline
	-- mini.statusline will handle this
	vim.o.showmode = false
end

function Plugin.config()
	-- See :help MiniSurround.config
	require("mini.surround").setup({})

	-- See :help MiniAi-textobject-builtin
	require("mini.ai").setup({ n_lines = 500 })

	-- See :help MiniIcons.config
	-- Change style to 'ascii' if you want to disable the fancy icons
	require("mini.icons").setup({ style = "glyph" })

	-- See :help MiniStatusline.config
	require("mini.statusline").setup({
		content = { active = user.statusline },
	})

	-- See :help MiniComment.config
	require("mini.comment").setup({
		options = {
			custom_commentstring = function()
				local cs = require("ts_context_commentstring").calculate_commentstring()
				return cs or vim.bo.commentstring
			end,
		},
	})

	-- See :help MiniNotify.config
	-- require("mini.notify").setup({
	-- 	lsp_progress = {
	-- 		enable = false,
	-- 	},
	-- })
	--
	-- vim.notify = require("mini.notify").make_notify()
	--
	-- See :help MiniSnippets.config
	local mini_snippets = require("mini.snippets")
	mini_snippets.setup({
		snippets = {
			mini_snippets.gen_loader.from_lang(),
		},
		mappings = {
			-- Expand snippet at cursor position. Created globally in Insert mode.
			expand = "<C-j>",

			-- Interact with default `expand.insert` session.
			-- Created for the duration of active session(s)
			jump_next = "<C-l>",
			jump_prev = "<C-h>",
			stop = "<C-c>",
		},
	})

	-- See :help MiniClue.config
	local clue = user.clues()
	require("mini.clue").setup({
		window = {
			delay = 600,
			config = {
				width = 50,
			},
		},
		triggers = clue.triggers({
			{ mode = "n", keys = "<leader>" },
			{ mode = "x", keys = "<leader>" },
			{ mode = "n", keys = "s" },
			{ mode = "x", keys = "s" },
			{ mode = "n", keys = "[" },
			{ mode = "n", keys = "]" },
		}),
		clues = clue.gen({
			{ mode = "n", keys = "[" },
			{ mode = "n", keys = "]" },
			{ mode = "n", keys = "<leader>f", desc = "+Find in files" },
			{ mode = "n", keys = "<leader>b", desc = "+Buffers" },
		}),
	})
end

-- See :help MiniStatusline-example-content
function user.statusline()
	local mini = require("mini.statusline")
	local mode, mode_hl = mini.section_mode({ trunc_width = 120 })
	local diagnostics = mini.section_diagnostics({ trunc_width = 75 })
	local lsp = mini.section_lsp({ icon = "LSP", trunc_width = 75 })
	local git = mini.section_git({ trunc_width = 40 })
	local filename = mini.section_filename({ trunc_width = 140 })
	local percent = "%2p%%"
	local location = "%3l:%-2c"

	return mini.combine_groups({
		{ hl = mode_hl, strings = { mode } },
		{ hl = "MiniStatuslineDevinfo", strings = { diagnostics, lsp, git } },
		"%<", -- Mark general truncate point
		{ hl = "MiniStatuslineFilename", strings = { filename } },
		"%=", -- End left alignment
		{ hl = "MiniStatuslineFilename", strings = { "%{&filetype}" } },
		{ hl = "MiniStatuslineFileinfo", strings = { percent } },
		{ hl = mode_hl, strings = { location } },
	})
end

function user.clues()
	local gen = require("mini.clue").gen_clues
	local triggers = {
		-- Built-in completion
		{ mode = "i", keys = "<C-x>" },

		-- `g` key
		{ mode = "n", keys = "g" },
		{ mode = "x", keys = "g" },

		-- Marks
		{ mode = "n", keys = "'" },
		{ mode = "n", keys = "`" },
		{ mode = "x", keys = "'" },
		{ mode = "x", keys = "`" },

		-- Registers
		{ mode = "n", keys = '"' },
		{ mode = "x", keys = '"' },
		{ mode = "i", keys = "<C-r>" },
		{ mode = "c", keys = "<C-r>" },

		-- Window commands
		{ mode = "n", keys = "<C-w>" },

		-- `z` key
		{ mode = "n", keys = "z" },
		{ mode = "x", keys = "z" },

		-- `h` key
		{ mode = "n", keys = "h" },
		{ mode = "x", keys = "h" },
	}

	local clues = {
		gen.builtin_completion(),
		gen.g(),
		gen.marks(),
		gen.registers(),
		gen.windows(),
		gen.z(),
	}

	local extend = function(list)
		return function(opts)
			if type(opts) ~= "table" then
				return list
			end

			for _, t in ipairs(opts) do
				table.insert(list, t)
			end

			return list
		end
	end

	return {
		triggers = extend(triggers),
		gen = extend(clues),
	}
end

return Plugin
