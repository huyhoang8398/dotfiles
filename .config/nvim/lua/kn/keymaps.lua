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

--- Vim toggle diagnostics ---
function _G.toggle_diagnostics()
	if vim.diagnostic.config().virtual_text then
		vim.diagnostic.config({ virtual_text = false })
	else
		vim.diagnostic.config({ virtual_text = true })
	end
end
vim.api.nvim_set_keymap("n", "<leader>tt", ":call v:lua.toggle_diagnostics()<CR>", { noremap = true, silent = true })

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
keymap.set("n", "<leader>dg", "<cmd>Telescope diagnostics<CR>")

-- Nvimtree--
keymap.set("n", "<C-n>", "<cmd> NvimTreeToggle <CR>")

-- Buffers --
--keymap.set("n", "<leader>x", ":enew<bar>bd #<CR>")
--keymap.set("n", "<leader>t", ":tabnew<CR>")

-- nvim-dap --
function _G.debug_python()
	require("dap-python").test_method()
end

keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
keymap.set("n", "<leader>db", ":lua require'dapui'.toggle()<CR>")
vim.api.nvim_set_keymap("n", "<leader>dpr", ":call v:lua.debug_python()<CR>", { noremap = true, silent = true })

-- Barbar --
-- Move to previous/next
vim.api.nvim_set_keymap("n", "<A-,>", "<Cmd>BufferPrevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-.>", "<Cmd>BufferNext<CR>", { noremap = true, silent = true })
-- Re-order to previous/next
vim.api.nvim_set_keymap("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A->>", "<Cmd>BufferMoveNext<CR>", { noremap = true, silent = true })
-- Goto buffer in position...
vim.api.nvim_set_keymap("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-0>", "<Cmd>BufferLast<CR>", { noremap = true, silent = true })
-- Pin/unpin buffer
vim.api.nvim_set_keymap("n", "<A-p>", "<Cmd>BufferPin<CR>", { noremap = true, silent = true })
-- Close buffer
vim.api.nvim_set_keymap("n", "<A-c>", "<Cmd>BufferClose<CR>", { noremap = true, silent = true })
