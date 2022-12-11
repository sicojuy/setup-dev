local try_require = require("common").try_require

-- option
try_require("option")

-- plugin
try_require("plugin")
require("impatient").enable_profile()

-- plugin config
try_require("config.mix")
try_require("config.theme")
try_require("config.tabline")
try_require("config.gitsigns")
try_require("config.conflict_marker")
try_require("config.toggleterm")
try_require("config.nvim_tree")
-- try_require("config.treesitter")
try_require("config.telescope")
try_require("config.vim_go")
try_require("config.cmp")
try_require("config.rust")

-- mapping
try_require("mapping")

-- command
try_require("command")
