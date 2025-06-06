local load = function(mod)
    package.loaded[mod] = nil
    require(mod)
end

load('kn.settings')
load('kn.diagnostics')
load('kn.commands')
load('kn.keymaps')
require('kn.plugins')

pcall(vim.cmd.colorscheme, 'rose-pine')
-- pcall(vim.cmd.colorscheme, 'moonfly')
