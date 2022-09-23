require('colorizer').setup()
require('hop').setup()
require('symbols-outline').setup()

-- python provider
vim.g.python3_host_prog = '/usr/local/bin/python3'

-- Chrome provider
if vim.fn.has('macos') then
    vim.g.mkdp_path_to_chrome = 'open -a Google\\ Chrome'
end

-- theme
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
vim.g.airline_theme = "base16_gruvbox_dark_hard"
vim.cmd([[highlight NvimTreeFolderName guifg=#8ec07c]])
vim.cmd([[highlight NvimTreeOpenedFolderName guifg=#8ec07c]])
vim.cmd([[highlight NvimTreeEmptyFolderName guifg=#8ec07c]])

-- indentline
vim.g.indentLine_char = '┆'

