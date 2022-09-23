local nnoremap = require('../common').nnoremap
local actions = require('telescope.actions')
local telescopeConfig = require('telescope.config')
local previewers = require('telescope.previewers')

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
-- table.insert(vimgrep_arguments, "--hidden")

-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, '--glob=!.git/*')
table.insert(vimgrep_arguments, '--glob=!*/mock/*')
table.insert(vimgrep_arguments, '--glob=!kitex_gen/*')
table.insert(vimgrep_arguments, '--glob=!output/*')
table.insert(vimgrep_arguments, '--glob=!*.o')
table.insert(vimgrep_arguments, '--glob=!*.so')
table.insert(vimgrep_arguments, '--glob=!*.py[co]')
table.insert(vimgrep_arguments, '--glob=!*_test.go')

local new_maker = function(filepath, bufnr, opts)
    opts = opts or {}

    filepath = vim.fn.expand(filepath)
    vim.loop.fs_stat(filepath, function(_, stat)
        if not stat then
            return
        end
        if stat.size > 100000 then
            return
        else
            previewers.buffer_previewer_maker(filepath, bufnr, opts)
        end
    end)
end

require('telescope').setup({
    defaults = require('telescope.themes').get_ivy({
        vimgrep_arguments = vimgrep_arguments,
        buffer_previewer_maker = new_maker,
        mappings = {
            i = {
                --['<esc>'] = actions.close,
            },
        },
    }),
    pickers = {
        find_files = {
            find_command = {
                'rg',
                '--files',
                '--glob=!.git/*',
                '--glob=!*/mock/*',
                '--glob=!kitex_gen/*',
                '--glob=!output/*',
                '--glob=!*.o',
                '--glob=!*.so',
                '--glob=!*.py[co]',
                '--glob=!*_test.go',
            },
        },
    },
    extensions = {},
})

require('telescope').load_extension('fzf')
