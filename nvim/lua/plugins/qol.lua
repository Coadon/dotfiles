return {
    -- Which key
    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup()
        end
    },

    -- Scroll bar
    {
        "dstein64/nvim-scrollview",
        config = function()
            require("scrollview").setup()
        end
    },

    -- Autopairs
    {
        "windwp/nvim-autopairs",
        config = function()
            local Rule = require('nvim-autopairs.rule')
            local pairs = require('nvim-autopairs')
            pairs.setup()
            pairs.add_rule(Rule("//", "", {"c", "cpp"}))
        end
    },

    -- Syntax stuff: Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ':TSUpdate',
        main = "nvim-treesitter.config",
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
        }
    },

    -- Surround is in TOOLS

    -- Starting screen
    {
        "goolord/alpha-nvim",
        config = function ()
            local startify = require("alpha.themes.startify")
            startify.file_icons.enabled = false
            require("alpha").setup(startify.config)
        end
    },
}
