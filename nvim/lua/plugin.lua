vim.cmd("packadd packer.nvim")

return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Speed up loading Lua modules in Neovim to improve startup time.
	use("lewis6991/impatient.nvim")

	-- Theme
	use({
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	})
	use({
		"catppuccin/nvim",
		as = "catppuccin",
	})

	-- Status line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	-- Show how many search matchs
	use("google/vim-searchindex")

	-- Intelligently reopen files at your last edit position.
	use("farmergreg/vim-lastplace")

	-- Color codes rendering
	use("norcalli/nvim-colorizer.lua")

	-- align
	use("junegunn/vim-easy-align")

	-- hop anywhere
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
	})

	-- thrift
	use("solarnz/thrift.vim")

	-- vimwiki
	use("vimwiki/vimwiki")

	-- Git decorations
	use("lewis6991/gitsigns.nvim")

	-- Git conflict marker
	use("rhysd/conflict-marker.vim")

	-- Git premier
	use("tpope/vim-fugitive")

	-- Terminal
	use("akinsho/toggleterm.nvim")

	-- markdown
	use({
		"iamcco/markdown-preview.nvim",
		requires = {
			"iamcco/mathjax-support-for-mkdp",
		},
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- nvim-tree
	use("kyazdani42/nvim-tree.lua")

	-- window size
	use({
		"anuvyklack/windows.nvim",
		requires = "anuvyklack/middleclass",
	})

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- Symbols outline
	use("simrat39/symbols-outline.nvim")

	-- Fuzzy picker
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Improve sorting performance
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})

	-- lsp client config
	use("neovim/nvim-lspconfig")
	use({
		"hrsh7th/nvim-cmp", -- completion
		requires = {
			"hrsh7th/cmp-nvim-lsp", -- cmp lsp
			"hrsh7th/cmp-buffer", -- cmp buffer
			"hrsh7th/cmp-path", -- cmp path
			"hrsh7th/cmp-cmdline", -- cmp cmdline
		},
	})

	-- vsnip
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")

	-- nvim-lsp progress
	use({
		"j-hui/fidget.nvim",
		tag = "legacy",
	})

	-- show function signature
	use("ray-x/lsp_signature.nvim")

	-- go
	use("fatih/vim-go")

	-- rust
	use("rust-lang/rust.vim")
end)
