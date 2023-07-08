local try_require = require("common").try_require

-- option
try_require("option")

-- plugin
try_require("plugin")
require("impatient").enable_profile()

-- plugin config
try_require("config.theme")
try_require("config.tabline")
try_require("config.gitsigns")
try_require("config.conflict_marker")
try_require("config.toggleterm")
try_require("config.nvim_tree")
-- try_require("config.treesitter")
try_require("config.telescope")
try_require("config.cmp")
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

-- mapping
try_require("mapping")

-- command
try_require("command")
