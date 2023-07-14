local keymap = vim.keymap

-- General Keymap --
--- delete char dont copy to cliboard
keymap.set("n", "x", '"_x')

-- Telescope --
keymap.set("n", "<leader>\\", "<cmd>Telescope find_files<CR>")
keymap.set("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>")
keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<CR>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>")
keymap.set("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>")
keymap.set("n", "<leader>cm", "<cmd>Telescope git_commits<CR>")
keymap.set("n", "<leader>gt", "<cmd>Telescope git_status<CR>")
keymap.set("n", "<leader>ma", "<cmd>Telescope marks<CR>")
