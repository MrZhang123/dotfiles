vim.cmd('packadd packer.nvim')

return require('packer').startup({
    function(use)
        use('wbthomason/packer.nvim')
        use('lewis6991/impatient.nvim')
        -- lib
        use('nvim-lua/plenary.nvim')
        use('nvim-lua/popup.nvim')

        -- view 
        -- use {'vim-airline/vim-airline'}
        -- use {'vim-airline/vim-airline-themes'}
        use('wincent/ferret') -- find and replace
        use('editorconfig/editorconfig-vim') -- editorconfig support
        use('tpope/vim-fugitive') -- git signs
        -- use 'folke/tokyonight.nvim' -- themes

        -- file
        use('nvim-telescope/telescope.nvim') -- fuzzy picker
        use('crispgm/telescope-heading.nvim') -- markdown heading

        use('akinsho/toggleterm.nvim') -- terminal
        -- use('farmergreg/vim-lastplace') -- reopen files at your last edit position
        -- use('AndrewRadev/undoquit.vim') -- restore closed tabs
        use {'kyazdani42/nvim-tree.lua' -- A File Explorer For Neovim Written In Lua
        -- requires = {
        --   'kyazdani42/nvim-web-devicons', -- optional, for file icon
        -- },
        }

        -- edit
        use('psliwka/vim-smoothie') -- smoothy scroll
        -- use('phaazon/hop.nvim') -- jump to anywhere within 2 strokes
        use('tpope/vim-surround') -- toggle surround
        use('tpope/vim-abolish')
        use {
            'numToStr/Comment.nvim',
            config = function()
                require('Comment').setup()
            end
        }
        -- use({
        --   'prettier/vim-prettier', -- prettier formatter
        --   run = 'yarn install',
        --   branch = 'release/0.x',
        -- })
        -- use('AndrewRadev/splitjoin.vim') -- split and join in vim
        use {
            'steelsojka/pears.nvim', -- auto symbol pairs
            config = function()
                require('pears').setup()
            end
        }

        -- language
        use {
            'nvim-treesitter/nvim-treesitter', -- treesitter
            run = ':TSUpdate'
        }
        use('neovim/nvim-lspconfig') -- lsp client config

        use {
            'hrsh7th/nvim-cmp', -- completion
            requires = {'hrsh7th/cmp-nvim-lsp', -- cmp lsp
            'hrsh7th/cmp-nvim-lua', -- cmp lua vim api
            'hrsh7th/cmp-buffer', -- cmp buffer
            'hrsh7th/cmp-path', -- cmp path
            'hrsh7th/cmp-vsnip' -- cmp vsnip integration
            }
        }
        use {
            "hrsh7th/vim-vsnip",
            requires = { -- { "hrsh7th/vim-vsnip-integ", after = "vim-vsnip" },
            {
                "rafamadriz/friendly-snippets",
                after = "vim-vsnip"
            }}
        }
        use('solarnz/thrift.vim') -- thrift highlight
        use('ray-x/go.nvim') -- golang support
        use('mattn/emmet-vim') -- html/css 

    end,
    config = {
        display = {
            open_fn = require('packer.util').float
        }
    }
})
