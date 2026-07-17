return {
    {
        "neovim/nvim-lspconfig",
    },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            {
                "L3MON4D3/LuaSnip",
                version = "v2.*",
                dependencies = {
                    "saadparwaiz1/cmp_luasnip",
                },
            },
        },
    },

    {
        "ray-x/lsp_signature.nvim",
        event = "InsertEnter",
        submodules = false,
        config = function()
            require("lsp_signature").setup()
        end
    },


    {
        "j-hui/fidget.nvim",
        lazy = false,
        opts = {},
    }
}
