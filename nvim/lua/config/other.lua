-- theme
--vim.cmd([[colorscheme catppuccin]])
vim.cmd([[colorscheme tokyonight]])

require("lualine").setup({
	options = {
		icons_enabled = false,
	},
	sections = {
		lualine_c = { { "filename", path = 1 } },
	},
})

require("hop").setup()

require("colorizer").setup()

require("fidget").setup({
	notification = {
		window = {
			avoid = { "NvimTree" },
		},
	},
})

require("windows").setup({
	autowidth = {
		enable = false,
	},
	ignore = {
		buftype = { "quickfix" },
		filetype = { "NvimTree", "neo-tree", "undotree", "gundo" },
	},
	animation = {
		enable = false,
	},
})

require("toggleterm").setup({
	size = 12,
	open_mapping = [[<c-\>]],
	shade_filetypes = {},
	shade_terminals = true,
	start_in_insert = true,
	persist_size = true,
	direction = "horizontal",
})

-- markdown
vim.g.mkdp_port = "8421"
if vim.fn.has("macunix") == 1 then
	vim.g.foo = 2
	vim.g.mkdp_path_to_chrome = "open -a Google\\ Chrome"
else
	vim.g.foo = 1
	vim.g.mkdp_echo_preview_url = 1
	vim.g.mkdp_open_to_the_world = 1
	vim.g.mkdp_open_ip = "devbox"
end
