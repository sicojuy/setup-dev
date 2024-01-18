-- theme
vim.cmd([[colorscheme catppuccin]])
-- vim.cmd([[colorscheme tokyonight]])

-- conflict marker
-- disable the default highlight group
vim.g.conflict_marker_highlight_group = ""

-- Include text after begin and end markers
vim.g.conflict_marker_begin = "^<<<<<<< .*$"
vim.g.conflict_marker_end = "^>>>>>>> .*$"

vim.cmd([[
    highlight ConflictMarkerBegin guibg=#2f7366
    highlight ConflictMarkerOurs guibg=#2e5049
    highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81
    highlight ConflictMarkerTheirs guibg=#344f69
    highlight ConflictMarkerEnd guibg=#2f628e
]])

-- gotests
vim.g.gotests_template_dir = vim.fn.expand("$HOME/.config/nvim/gotests-template")
vim.g.gotests_template = ""

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

require("symbols-outline").setup()

require("fidget").setup()

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
