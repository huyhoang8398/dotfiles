local levels = vim.diagnostic.severity
local opts = {
  virtual_text = true,
  float = {
    border = 'rounded',
  },
  signs = {
    text = {
      [levels.ERROR] = '✘', [levels.WARN] = '▲', [levels.HINT] = '⚑',
      [levels.INFO] = '»',
    },
  },
}

local function sign_define(name, text)
  local hl = 'DiagnosticSign' .. name
  vim.fn.sign_define(hl, {
    texthl = hl,
    text = text,
    numhl = ''
  })
end
sign_define('Error', opts.signs.text[levels.ERROR])
sign_define('Warn', opts.signs.text[levels.WARN])
sign_define('Hint', opts.signs.text[levels.HINT])
sign_define('Info', opts.signs.text[levels.INFO])

vim.keymap.set('n', '<C-w>d', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '<C-w><C-d>', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

-- Vim toggle diagnostic but this one also clear the ruler so we dont know which line has issue
-- vim.keymap.set('n', '<leader>td', function()
--   vim.diagnostic.enable(not vim.diagnostic.is_enabled())
-- end, { silent = true, noremap = true })

--- Vim toggle diagnostics ---
function _G.toggle_diagnostics()
    if vim.diagnostic.config().virtual_text then
        vim.diagnostic.config({ virtual_text = false })
    else
        vim.diagnostic.config({ virtual_text = true })
    end
end
vim.api.nvim_set_keymap("n", "<leader>tt", ":call v:lua.toggle_diagnostics()<CR>", { noremap = true, silent = true, desc = "Toggle dignostic" })

vim.diagnostic.config(opts)
