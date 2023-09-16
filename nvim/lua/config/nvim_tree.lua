local nnoremap = require("../common").nnoremap

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set("n", "t", api.node.open.tab, opts("Open: New Tab"))
	vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open: Horizontal Split"))
	vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
	vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "x", api.node.navigate.parent_close, opts("Close Directory"))
	vim.keymap.set("n", "m", api.fs.cut, opts("Cut"))
	vim.keymap.set("n", "i", api.node.show_info_popup, opts("Info"))
	vim.keymap.set("n", "<c-]>", api.tree.change_root_to_node, opts("CD"))
end

require("nvim-tree").setup({
	on_attach = on_attach,
	sort_by = "case_sensitive",
	open_on_tab = false,
	view = {
		adaptive_size = false,
		width = "20%",
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
