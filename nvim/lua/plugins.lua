return require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- Packer itself

    -- Language server: LSP
    use 'neovim/nvim-lspconfig'

    -- Cmp
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-omni'
    use 'saadparwaiz1/cmp_luasnip'

    -- Syntax stuff: Treesitter
    use 'nvim-treesitter/nvim-treesitter'

    -- Status bar: Airline
    use 'vim-airline/vim-airline'

    -- Finding files: FZF
    -- TODO: Consider telescope?
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    -- Method signature
    -- use 'ray-x/lsp_signature.nvim'
    use 'folke/neodev.nvim'

    -- Formatting
    use 'sbdchd/neoformat'

    -- Themings
    use 'morhetz/gruvbox'
    use 'sainnhe/everforest'
    use '~/.config/nvim/myStuffs/onehalf'

    -- LaTex
    use 'lervag/vimtex'

    -- Rainbow blocks
    use 'luochen1990/rainbow'

    --
    use 'tpope/vim-fugitive'
    use 'tpope/vim-sensible'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'tpope/vim-dispatch'

    -- Snippets
    use{'L3MON4D3/LuaSnip', tag = 'v<CurrentMajor>.*'}
    use 'honza/vim-snippets'

    -- Utilities and functionalities
    use 'junegunn/vim-easy-align'
    use 'easymotion/vim-easymotion'
    use 'chrisbra/Colorizer'
    use 'ntpeters/vim-better-whitespace'
    use 'windwp/nvim-autopairs'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'itchyny/vim-cursorword'
    use 'preservim/tagbar'
    use 'preservim/vimux'
    -- use 'dkarter/bullets.vim'

    -- use{'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'} }


    -- use 'Shirk/vim-gas'
    -- use 'p00f/clangd_extensions.nvim'
end)
