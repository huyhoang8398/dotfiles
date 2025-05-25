local Plugin = { 'ThePrimeagen/harpoon' }
Plugin.branch = "harpoon2"
Plugin.dependencies = { "nvim-lua/plenary.nvim" }

function Plugin.config(_, opts)
    local harpoon = require("harpoon")
    harpoon:setup(opts)
    vim.keymap.set("n", "ha", function()
        harpoon:list():add()
    end)
    vim.keymap.set("n", "hm", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "hp", function()
        harpoon:list():prev()
    end)
    vim.keymap.set("n", "hn", function()
        harpoon:list():next()
    end)
end

return Plugin
