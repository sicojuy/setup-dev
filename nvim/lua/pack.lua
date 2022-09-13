vim.cmd('packadd packer.nvim')

return require('packer').startup(function()
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        -- Speed up loading Lua modules in Neovim to improve startup time.
        use 'lewis6991/impatient.nvim'

        -- Theme
        use 'ellisonleao/gruvbox.nvim'

        -- Status line
        use 'vim-airline/vim-airline'
        use 'vim-airline/vim-airline-themes'

        -- Tab line
        use 'crispgm/nvim-tabline'

        -- Show how many search matchs
        use 'google/vim-searchindex'

        -- Indent line
        use 'Yggdroot/indentLine'

        -- Intelligently reopen files at your last edit position.
        use 'farmergreg/vim-lastplace'

        -- Vim notify toast
        use 'rcarriga/nvim-notify'

        -- Color codes rendering
        use 'norcalli/nvim-colorizer.lua'

        -- Git decorations
        use 'lewis6991/gitsigns.nvim'

        -- Git conflict marker
        use 'rhysd/conflict-marker.vim'

        -- align
        use 'junegunn/vim-easy-align'

        -- smoothy scroll
        -- use 'psliwka/vim-smoothie'

        -- Terminal
        use 'akinsho/toggleterm.nvim'

        -- vimwiki
        use 'vimwiki/vimwiki'

        -- vim plugin testing
        use 'junegunn/vader.vim'

        -- thrift
        use 'solarnz/thrift.vim'

        -- hop anywhere
        use 'phaazon/hop.nvim'

        -- markdown
        use {
            "iamcco/markdown-preview.nvim",
            run = function()
                vim.fn["mkdp#util#install"]()
            end,
        }

        -- nvim-tree
        use 'kyazdani42/nvim-tree.lua'

        -- treesitter
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
        }

        -- Fuzzy picker
        use {
            'nvim-telescope/telescope.nvim',
            requires = { {'nvim-lua/plenary.nvim'} }
        }
        use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

        -- lsp client config
        use 'neovim/nvim-lspconfig'
        use {
            'hrsh7th/nvim-cmp', -- completion
            requires = {
                'hrsh7th/cmp-nvim-lsp', -- cmp lsp
                'hrsh7th/cmp-buffer', -- cmp buffer
                'hrsh7th/cmp-path', -- cmp path
                'hrsh7th/cmp-cmdline', -- cmp cmdline
				'hrsh7th/cmp-vsnip',
				'hrsh7th/vim-vsnip',
            },
        }

        -- rust lang support
        -- use 'rust-lang/rust.vim'

        -- lua repl
        -- use 'rafcamlet/nvim-luapad'

end)
