-- TODO MERGER AND CLEAN WITH scripts/lsp.lua:

return {
  {
    "neovim/nvim-lspconfig",
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
  },

  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup()
    end
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function ()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },

  {
    "j-hui/fidget.nvim",
    lazy = false,
    opts = {},
  }
}
