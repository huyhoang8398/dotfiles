local telescope = require("telescope")
local actions = require("telescope.actions")
local opts = {
	defaults = {
		hl_result_eol = false,
		layout_config = {
			height = 0.8,
			prompt_position = "top",
			preview_width = 0.5,
			width = 0.9,
		},
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<C-f>"] = actions.results_scrolling_down,
				["<C-b>"] = actions.results_scrolling_up,
			},
		},
		multi_icon = "✚",
		prompt_prefix = "❯ ",
		selection_caret = "▶ ",
		sorting_strategy = "ascending",
	},
	pickers = {
		buffers = {
			show_all_buffers = true,
		},
	},
}
telescope.setup(opts)
telescope.load_extension("fzf")

-- Mappings.
local map = vim.keymap.set
map("n", "<leader>\\", "<cmd>Telescope find_files<CR>")
map("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>")
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>")
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>")
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>")
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>")
map("n", "<leader>ma", "<cmd>Telescope marks<CR>")
map("n", "<leader>dg", "<cmd>Telescope diagnostics<CR>")
