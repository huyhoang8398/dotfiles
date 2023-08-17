local map = vim.keymap.set
local api = vim.api.nvim_set_keymap

-- General Keymap --
--- delete char dont copy to cliboard
map("n", "x", '"_x')

--- Stop highlighting
map("n", "<Esc>", ":noh<CR>")

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

-- Buffers --
--map("n", "<leader>x", ":enew<bar>bd #<CR>")
--map("n", "<leader>t", ":tabnew<CR>")
