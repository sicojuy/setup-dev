local nnoremap = require("../common").nnoremap

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	open_on_tab = false,
	view = {
		adaptive_size = false,
		width = "20%",
		mappings = {
			list = {
				{ key = "t", action = "tabnew" },
				{ key = "s", action = "split" },
				{ key = "v", action = "vsplit" },
				{ key = "u", action = "dir_up" },
				{ key = "x", action = "close_node" },
				{ key = "m", action = "cut" },
				{ key = "i", action = "toggle_file_info" },
				{ key = "<c-]>", action = "cd" },
			},
		},
	},
	renderer = {
		group_empty = true,
		indent_width = 2,
		icons = {
			webdev_colors = true,
			git_placement = "after",
			padding = " ",
			symlink_arrow = " => ",
			show = {
				file = false,
				folder = false,
				folder_arrow = false,
				git = true,
			},
		},
		special_files = {},
	},
	filters = {
		dotfiles = true,
	},
})

local function open_nvim_tree(data)
	-- buffer is a [No Name]
	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

	-- buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	if not no_name and not directory then
		return
	end

	-- change to the directory
	if directory then
		vim.cmd.cd(data.file)
	end

	-- open the tree
	require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
