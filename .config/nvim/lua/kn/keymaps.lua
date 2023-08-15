local keymap = vim.keymap
local api = vim.api.nvim_set_keymap

-- General Keymap --
--- delete char dont copy to cliboard
keymap.set("n", "x", '"_x')
keymap.set("n", "<Esc>", ":noh<CR>")
--- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
--- https://neovim.discourse.group/t/how-do-i-jump-to-relative-line-number-with-gj-gk/2203/4
api("n", "j", "v:count ? 'j' : 'gj'", { noremap = true, expr = true })
api("n", "k", "v:count ? 'k' : 'gk'", { noremap = true, expr = true })
api("n", "<Down>", "v:count ? 'j' : 'gj'", { noremap = true, expr = true })
api("n", "<Up>", "v:count ? 'k' : 'gk'", { noremap = true, expr = true })

api("x", "j", "v:count ? 'j' : 'gj'", { noremap = true, expr = true })
api("x", "k", "v:count ? 'k' : 'gk'", { noremap = true, expr = true })
api("v", "<Down>", "v:count ? 'j' : 'gj'", { noremap = true, expr = true })
api("v", "<Up>", "v:count ? 'k' : 'gk'", { noremap = true, expr = true })
--- Vim toggle diagnostics ---
function _G.toggle_diagnostics()
	if vim.diagnostic.config().virtual_text then
		vim.diagnostic.config({ virtual_text = false })
	else
		vim.diagnostic.config({ virtual_text = true })
	end
end
api("n", "<leader>tt", ":call v:lua.toggle_diagnostics()<CR>", { noremap = true, silent = true })

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
api("n", "<leader>dpr", ":call v:lua.debug_python()<CR>", { noremap = true, silent = true })

-- Undotree
keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
