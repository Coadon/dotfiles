-- TODO MERGER AND CLEAN WITH scripts/lsp.lua:

return {
    "neovim/nvim-lspconfig",
    -- opts = {
    --     virtual_text = {
    --         spacing = 4,
    --         source = "if_many",
    --         prefix = "●",
    --     },
    --     severity_sort = true,
    --     inlay_hints = {
    --         enabled = true,
    --     },
    -- },
    dependencies = {
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
                        "honza/vim-snippets",
                    },
                },
            },
        },
    },

}
