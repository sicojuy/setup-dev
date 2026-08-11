-- theme
--vim.cmd([[colorscheme catppuccin]])
vim.cmd([[colorscheme tokyonight]])

require("lualine").setup({
	options = {
		icons_enabled = false,
	},
	sections = {
		lualine_c = { { "filename", path = 1 } },
	},
})

require("hop").setup()

require("colorizer").setup()

require("fidget").setup({
	notification = {
		window = {
			avoid = { "NvimTree" },
		},
	},
})

require("windows").setup({
	autowidth = {
		enable = false,
	},
	ignore = {
		buftype = { "quickfix" },
		filetype = { "NvimTree", "neo-tree", "undotree", "gundo" },
	},
	animation = {
		enable = false,
	},
})

require("toggleterm").setup({
	size = 12,
	open_mapping = [[<c-\>]],
	shade_filetypes = {},
	shade_terminals = true,
	start_in_insert = true,
	persist_size = true,
	direction = "horizontal",
})
