local nnoremap = require("../common").nnoremap
local actions = require("telescope.actions")
local telescopeConfig = require("telescope.config")
local previewers = require("telescope.previewers")

-- ignore large file
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

require("telescope").setup({
	defaults = require("telescope.themes").get_ivy({
		file_ignore_patterns = {
			".git/",
			"kitex_gen/",
			"thrift_gen/",
			"clients/",
			"output/",
			"mock/",
			"mocks/",
			"%_test.go",
			"go.sum",
			"%.o",
			"%.so",
		},
		buffer_previewer_maker = new_maker,
		mappings = {
			i = {
				--['<esc>'] = actions.close,
			},
		},
	}),
	pickers = {},
	extensions = {},
})

require("telescope").load_extension("fzf")
