return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
  },

  {
    "olimorris/codecompanion.nvim",
    opts = {
      --Refer to: https://github.com/olimorris/codecompanion.nvim/blob/main/lua/codecompanion/config.lua
      interactions = {
        --NOTE: Change the adapter as required
        chat = { adapter = "cline" },
        inline = { adapter = "cline" },
      },
      opts = {
        log_level = "DEBUG",
      },
    },
  },

  {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim"
  },

  {
    -- used by avante.
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      file_types = {
        "markdown",
      },
    },
    ft = {
      "markdown",
    }
  }
}
