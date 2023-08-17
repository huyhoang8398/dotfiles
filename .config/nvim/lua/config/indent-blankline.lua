local indent_blankline = require("indent_blankline")

local opts = {
	space_char_blankline = " ",
	show_current_context = true,
	show_end_of_line = true,
	use_treesitter = true,
}

indent_blankline.setup(opts)
