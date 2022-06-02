local nnoremap = require('../common').nnoremap

local actions = require('telescope.actions')
require('telescope').setup({
    defaults = require('telescope.themes').get_ivy({
        mappings = {
            i = {
                ['<esc>'] = actions.close,
            },
        },
    }),
    extensions = {
    },
})

require('telescope').load_extension('fzf')
-- require('telescope').load_extension('session-lens')

nnoremap('<leader>ff', '<cmd>Telescope find_files<cr>')
nnoremap('<leader>fd', '<cmd>Telescope git_files<cr>')
nnoremap('<leader>fg', '<cmd>Telescope live_grep<cr>')
nnoremap('<leader>fb', '<cmd>Telescope buffers<cr>')
nnoremap('<leader>fh', '<cmd>Telescope help_tags<cr>')
nnoremap('<leader>fl', '<cmd>Telescope lsp_document_symbols<cr>')
nnoremap('<leader>fk', '<cmd>Telescope keymaps<cr>')
