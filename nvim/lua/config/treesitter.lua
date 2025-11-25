require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"c",
		"cpp",
		"lua",
		"go",
		"rust",
		"python",
		"vim",
		"vimdoc",
		"markdown",
		"markdown_inline",
		"css",
		"javascript",
		"html",
		"json",
		"toml",
		"yaml",
		"dockerfile",
	},
	highlight = {
		enable = true,
	},
	indent = {
		enable = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
})
