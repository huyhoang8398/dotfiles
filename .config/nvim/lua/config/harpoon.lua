local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "ha", function()
	harpoon:list():append()
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
