return {
    -- Syntax stuff: Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require('nvim-treesitter.install').compilers = {"gcc"}

            require('nvim-treesitter.configs').setup {
                highlight = { enable = true }
            }
        end
    },

    -- GitSigns
    -- "lewis6991/gitsigns.nvim",
    --

    "airblade/vim-gitgutter",


    -- "chrisbra/Colorizer"
    "preservim/vimux",

    -- Formatting
    "sbdchd/neoformat",

    -- Themings
    {
        "sainnhe/everforest",
        config = function()
            -- vim.cmd("colorscheme everforest")
        end
    },

    -- Misc (tagbar require ctags)
    "preservim/tagbar",

    -- Status bar: Lualine
    {
        "vim-airline/vim-airline",
        config = function()
            vim.cmd([[let g:airline_section_z = airline#section#create(['%p%% %l%\:%v'])]])
        end
    },

    -- Don't ask why, I just like it.
    {
        "xiyaowong/transparent.nvim",
        lazy = false,
    },

}
