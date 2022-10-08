local nnoremap = require("../common").nnoremap

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	open_on_setup = true,
	open_on_setup_file = false,
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
				{ key = "<C-i>", action = "toggle_file_info" },
				{ key = "<C-]>", action = "cd" },
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
