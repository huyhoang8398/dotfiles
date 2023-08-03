local opts = {
	-- Enable/disable animations
	animation = true,

	-- Enable/disable auto-hiding the tab bar when there is a single buffer
	auto_hide = false,

	-- Enable/disable current/total tabpages indicator (top right corner)
	tabpages = true,

	-- Enable highlighting visible buffers
	highlight_visible = true,
	sidebar_filetypes = {
		NvimTree = true,
	},
}

return opts
