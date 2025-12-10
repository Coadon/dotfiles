return {
  {
    "tpope/vim-rsi"
  },

  {
    "smoka7/hop.nvim",
    keys = {
      { '<leader><leader>f', ':HopChar1AC<cr>', silent = true    },
      { '<leader><leader>F', ':HopChar1BC<cr>', silent = true    },
      { '<leader><leader>s', ':HopChar1<cr>',   silent = true    },
      { '<leader><leader>w', ':HopWord<cr>',    silent = true    },
      { '<leader><leader>l', ':HopLine<cr>',    silent = true    },
      { '<leader><leader>a', ':HopAnywhere<cr>', silent = true   },
    },
    config = function()
      require("hop").setup()
    end
  },

  {
    "bkad/CamelCaseMotion",
    keys = {
      { "<leader>w", "<Plug>CamelCaseMotion_w", mode = { "n", "x" } },
      { "<leader>b", "<Plug>CamelCaseMotion_b", mode = { "n", "x" } },
      { "<leader>e", "<Plug>CamelCaseMotion_e", mode = { "n", "x" } },
    }
  },

  {
    "mg979/vim-visual-multi",
    init = function()
      vim.g.VM_add_cursor_at_pos_no_mappings = 1
    end
  },
}
