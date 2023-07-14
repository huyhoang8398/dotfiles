return {
	defaults = { lazy = false },
	install = {
		missing = true,
		colorscheme = { "sonokai", "habamax" },
	},

	ui = {
		icons = {
			ft = "",
			lazy = "󰂠 ",
			loaded = "",
			not_loaded = "",
		},
	},

	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true, -- reset the package path to improve startup time
	},
}
