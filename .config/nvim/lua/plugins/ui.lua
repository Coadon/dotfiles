
return {
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
    end,
    opts = function()
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
          lualine_b = {"filename", "branch"},
          lualine_c = {"location", "progress"},
          lualine_x = {"diff", "diagnostics"},
          lualine_y = {"filetype"},
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
