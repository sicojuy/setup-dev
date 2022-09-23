local nnoremap = require('../common').nnoremap
local actions = require('telescope.actions')
local telescopeConfig = require("telescope.config")
local previewers = require("telescope.previewers")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
-- table.insert(vimgrep_arguments, "--hidden")

-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!.git/*")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!*_test.go")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!*/mock/*")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!kitex_gen/*")

local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}

  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then return end
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
			find_command = { "rg", "--files", "--glob", "!.git/*", "--glob", "!*_test.go", "--glob", "!*/mock/*", "--glob", "!kitex_gen/*" },
		},
	},
    extensions = {
    },
})

require('telescope').load_extension('fzf')

