return {
  "tpope/vim-fugitive",
  "tpope/vim-sensible",
  "tpope/vim-surround",
  "tpope/vim-commentary",

  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require('nvim-treesitter.install').compilers = {"gcc"}
      require('nvim-treesitter.configs').setup {
        highlight = { enable = true }
      }
    end
  },

  -- {
  --     "vim-airline/vim-airline",
  --     config = function()
  --         vim.cmd([[let g:airline_section_z = airline#section#create(['%p%% %l%\:%v'])]])
  --     end
  -- },

  {
    "smoka7/hop.nvim", -- maintained fork
    keys = {
      { '<leader><leader>f', ':HopChar1AC<cr>'    },
      { '<leader><leader>F', ':HopChar1BC<cr>'    },
      { '<leader><leader>s', ':HopChar1<cr>'      },
      { '<leader><leader>w', ':HopWord<cr>'       },
      { '<leader><leader>l', ':HopLine<cr>'       },
      { '<leader><leader>a', ':HopAnywhere<cr>'   },
    },
    config = function()
      require("hop").setup()
    end
  },
}
