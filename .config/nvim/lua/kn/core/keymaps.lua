local keymap = vim.keymap

-- General Keymap --
--- delete char dont copy to cliboard
keymap.set("n", "x", '"_x')
keymap.set("n", "<Esc>", ":noh<CR>")
--- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
--- https://neovim.discourse.group/t/how-do-i-jump-to-relative-line-number-with-gj-gk/2203/4
vim.api.nvim_set_keymap("n", "j", "v:count ? 'j' : 'gj'", { noremap = true, expr = true })
vim.api.nvim_set_keymap("n", "k", "v:count ? 'k' : 'gk'", { noremap = true, expr = true })
vim.api.nvim_set_keymap("n", "<Down>", "v:count ? 'j' : 'gj'", { noremap = true, expr = true })
vim.api.nvim_set_keymap("n", "<Up>", "v:count ? 'k' : 'gk'", { noremap = true, expr = true })

vim.api.nvim_set_keymap("x", "j", "v:count ? 'j' : 'gj'", { noremap = true, expr = true })
vim.api.nvim_set_keymap("x", "k", "v:count ? 'k' : 'gk'", { noremap = true, expr = true })
vim.api.nvim_set_keymap("v", "<Down>", "v:count ? 'j' : 'gj'", { noremap = true, expr = true })
vim.api.nvim_set_keymap("v", "<Up>", "v:count ? 'k' : 'gk'", { noremap = true, expr = true })

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

-- Nvimtree--
keymap.set("n", "<C-n>", "<cmd> NvimTreeToggle <CR>")

-- Buffers --
keymap.set("n", "<leader>x", ":enew<bar>bd #<CR>")
keymap.set("n", "<leader>t", ":tabnew<CR>")
