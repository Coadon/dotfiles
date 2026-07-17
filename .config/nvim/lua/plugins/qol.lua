local function noremap(mode, key, command)
  vim.keymap.set(mode, key, command, {noremap=true,silent=true})
end

local function map(mode, key, command)
  vim.keymap.set(mode, key, command)
end

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

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false, -- neo-tree will lazily load itself
    keys = {
      { "<space>t", "<cmd>Neotree<cr>", desc = "Open Tree." },
    }
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
    "windwp/nvim-autopairs",
    config = function()
      local Rule = require('nvim-autopairs.rule')
      local pairs = require('nvim-autopairs')
      pairs.setup()
      pairs.add_rule(Rule("//", "", {"c", "cpp"}))
    end
  },

  {
    "ibhagwan/fzf-lua",
    dependencies = {{ dir = "/opt/homebrew/opt/fzf" }},
    config = function()
      noremap("n", "ff", ":FzfLua files<cr>")
      noremap("n", "<space>g", ":FzfLua grep<cr>")
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
