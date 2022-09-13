local try_require = require('common').try_require

-- options
try_require('options')

-- packages
try_require('pack')

-- plugin config
try_require('plugins.impatient')
try_require('plugins.gruvbox')
try_require('plugins.airline')
try_require('plugins.tabline')
try_require('plugins.colorizer')
try_require('plugins.gitsigns')
try_require('plugins.conflict_marker')
try_require('plugins.toggleterm')
try_require('plugins.vimwiki')
try_require('plugins.treesitter')
try_require('plugins.nvim_tree')
try_require('plugins.telescope')
try_require('plugins.lspconfig')
try_require('plugins.cmp')
-- try_require('plugins.rust')

-- mappings
try_require('mappings')

-- autocmds
try_require('autocmds')
