return {
  "tpope/vim-fugitive",
  "tpope/vim-sensible",
  "tpope/vim-surround",
  "tpope/vim-commentary",

  -- Git
  {
    "sindrets/diffview.nvim",
    Lazy = true,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require('nvim-treesitter.install').compilers = {"gcc"}
      require('nvim-treesitter.configs').setup {
        highlight = { enable = true }
      }
    end
  },

  {
    "stevearc/conform.nvim",
    opts = {},
    config = {
      vim.api.nvim_create_user_command("Format", function(args)
        local range = nil
        if args.count ~= -1 then
          local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
          range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
          }
        end
        require("conform").format({ async = true, lsp_format = "fallback", range = range })
      end, { range = true })
    },
    lazy = false,
  },
}
