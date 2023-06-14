-- Terminologies:
-- Syntax highlighting, linting, autocompletion, error detection, formatting

return require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- Packer itself
    -- use 'nvim-lua/plenary.nvim' -- Plenary for deps

    -- Language server: LSP
    use 'neovim/nvim-lspconfig'

    -- Completiong
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'

    -- Syntax stuff: Treesitter
    use 'nvim-treesitter/nvim-treesitter'

    -- Status bar: Lualine
    use 'vim-airline/vim-airline'
    -- use 'nvim-lualine/lualine.nvim'
    -- GitSigns
    use 'lewis6991/gitsigns.nvim'

    -- Finding files: FZF
    use '/usr/local/opt/fzf/'
    use 'junegunn/fzf.vim'

    -- Method signature
    use 'ray-x/lsp_signature.nvim'

    -- Formatting
    use 'sbdchd/neoformat'

    -- Themings
    use 'morhetz/gruvbox'
    use 'sainnhe/everforest'
    use '~/.config/nvim/myStuffs/onehalf'

    -- LaTex
    use 'lervag/vimtex'

    -- Utilities
    use 'tpope/vim-fugitive'
    use 'tpope/vim-sensible'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'

    -- Snippets
    use{'L3MON4D3/LuaSnip', tag = 'v<CurrentMajor>.*'}
    use 'honza/vim-snippets'

    -- functionalities: Move
    use 'junegunn/vim-easy-align'
    -- use 'easymotion/vim-easymotion'
    use 'phaazon/hop.nvim' -- recently trying alts
    use 'haya14busa/is.vim'

    -- Color tweak
    use 'chrisbra/Colorizer'

    -- Autopairs
    use 'windwp/nvim-autopairs'

    -- Integration with Tmux: saving time
    use 'preservim/vimux'

    -- Visual feed help
    use 'itchyny/vim-cursorword'
    use 'ntpeters/vim-better-whitespace'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'luochen1990/rainbow'
    -- use 'dkarter/bullets.vim'

    -- Misc
    use 'preservim/tagbar'

    -- use{'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'} }

    -- Languages
    -- use 'Shirk/vim-gas'
    -- use 'p00f/clangd_extensions.nvim'

    -- Trying out IDE stuff, pretty nice!
    -- use 'ldelossa/nvim-ide'

    -- Arduino
    use 'sudar/vim-arduino-syntax'
end)
