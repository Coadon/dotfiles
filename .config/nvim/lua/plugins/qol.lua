local function noremap(mode, key, command)
  vim.keymap.set(mode, key, command, {noremap=true,silent=true})
end

local function map(mode, key, command)
  vim.keymap.set(mode, key, command)
end

return {

  "preservim/tagbar",
  "haya14busa/is.vim",
  "ntpeters/vim-better-whitespace",
  "itchyny/vim-cursorword",

  {
    "HiPhish/rainbow-delimiters.nvim",
    submodules = false,
  },

  "sbdchd/neoformat",
  "sindrets/diffview.nvim",

  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      require("nvim-tree").setup()
    end,
    keys = {
      { "tt", "<cmd>NvimTreeToggle<cr>", desc = "Open Tree." },
    }
  },

  {
    "mg979/vim-visual-multi",
  },

  {
    "ray-x/lsp_signature.nvim",
    submodules = false,
    config = function()
      require("lsp_signature").setup()
    end
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      local Rule = require('nvim-autopairs.rule')
      local pairs = require('nvim-autopairs')
      pairs.setup()
      pairs.add_rule(Rule("//", "", {"c", "cpp"}))
    end
  },

  {
    "junegunn/fzf.vim",
    dependencies = {{ dir = "/opt/homebrew/opt/fzf" }},
    config = function()
      vim.g.rg_derive_root = "true"
      vim.o.grepprg = "rg --smart-case --follow"
      noremap("n", "ff", ":Files<cr>")
      noremap("n", "fg", ":Rg<cr>")
      vim.cmd("command W :w") -- Very annoying
    end
  },

  {
    "junegunn/vim-easy-align",
    config = function()
      map("x", "ga", "<Plug>(EasyAlign)")
      map("n", "ga", "<Plug>(EasyAlign)")
    end
  },
}
