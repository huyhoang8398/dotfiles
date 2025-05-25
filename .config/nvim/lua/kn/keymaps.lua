-- Shortcuts
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>', {desc = 'Select all text'})

-- delete char dont copy to cliboard

vim.keymap.set("n", "x", '"_x')

--- Stop highlighting
vim.keymap.set("n", "<Esc>", ":noh<CR>")

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

-- Combine 0 and ^
vim.keymap.set('n', '0', "getline('.')[0 : col('.') - 2] =~# '^\\s\\+$' ? '0' : '^'", { silent = true, expr = true })

-- Commands
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', {desc = 'Save buffer'})
vim.keymap.set('n', '<leader>qq', '<cmd>quitall<cr>', {desc = 'Exit Neovim'})
vim.keymap.set('n', '<leader>bq', '<cmd>bdelete<cr>', {desc = 'Close buffer and window'})

-- navigate between open buffers
vim.keymap.set('n', '[b', '<cmd>bprevious<cr>', {desc = ':bprevious'})
vim.keymap.set('n', ']b', '<cmd>bnext<cr>', {desc = ':bnext'})
vim.keymap.set('n', '[B', '<cmd>brewind<cr>', {desc = ':brewind'})
vim.keymap.set('n', ']B', '<cmd>blast<cr>', {desc = ':blast'})

-- navigate the quickfix list
vim.keymap.set('n', '[q', '<cmd>cprevious<cr>', {desc = ':cprevious'})
vim.keymap.set('n', ']q', '<cmd>cnext<cr>', {desc = ':cnext'})
vim.keymap.set('n', '[Q', '<cmd>crewind<cr>', {desc = ':crewind'})
vim.keymap.set('n', ']Q', '<cmd>clast<cr>', {desc = ':clast'})

