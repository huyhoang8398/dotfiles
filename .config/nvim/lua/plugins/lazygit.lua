local Plugin = { "kdheepak/lazygit.nvim" }
Plugin.lazy = true
Plugin.cmd = {
	"LazyGit",
	"LazyGitConfig",
	"LazyGitCurrentFile",
	"LazyGitFilter",
	"LazyGitFilterCurrentFile",
}
-- optional for floating window border decoration
Plugin.dependencies = {
	"nvim-lua/plenary.nvim",
}
-- setting the keybinding for LazyGit with 'keys' is recommended in
-- order to load the plugin when the command is run for the first time
Plugin.keys = {
	{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
}

return Plugin
