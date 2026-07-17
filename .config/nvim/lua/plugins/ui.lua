
return {
  -- Color
  "deparr/tairiki.nvim",
  "neanias/everforest-nvim",

  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
    end,
    opts = function()
      local function wordcount()
        return tostring(vim.fn.wordcount().words)
      end

      require('lualine').setup {
        options = {
          theme = "auto",
          icons_enabled = false,
          component_separators = "",
          section_separators = "",
          globalstatus = true,
        },
        sections = {
          lualine_a = {"mode"},
          lualine_b = {"filename"},
          lualine_c = {"location", "progress", { wordcount }},
          lualine_x = {"filetype", "diff", "diagnostics"},
          lualine_y = {"branch"},
          lualine_z = {},
        },
        extensions = {}
      }
    end
  },

  {
    "goolord/alpha-nvim",
    config = function ()
      local startify = require("alpha.themes.startify")
      startify.file_icons.enabled = false
      require("alpha").setup(startify.config)
    end
  }
}
