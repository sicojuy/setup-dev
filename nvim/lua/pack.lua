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
        use {
            'crispgm/nvim-tabline',
            config = function()
                require('tabline').setup({})
            end,
        }

        -- Show how many search matchs
        use 'google/vim-searchindex'

        -- Indent line
        use 'Yggdroot/indentLine'

        -- Auto highlight hover word
        use 'RRethy/vim-illuminate'

        -- Intelligently reopen files at your last edit position.
        use 'farmergreg/vim-lastplace'

        -- Vim notify toast
        use 'rcarriga/nvim-notify'

        -- Fuzzy picker
        use {
            'nvim-telescope/telescope.nvim',
            requires = { {'nvim-lua/plenary.nvim'} }
        }
        use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

        -- Terminal
        use 'akinsho/toggleterm.nvim'

        -- Git decorations
        use 'lewis6991/gitsigns.nvim'

        -- Git conflict marker
        use 'rhysd/conflict-marker.vim'

        -- Color codes rendering
        use {
            'norcalli/nvim-colorizer.lua',
            config = function()
                require('colorizer').setup()
            end,
        }
end)
