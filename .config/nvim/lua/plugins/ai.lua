return {
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
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    opts = {
      -- this file can contain specific instructions for your project
      instructions_file = "avante.md",

      provider = "copilot",

      providers = {
        claude = {
          endpoint = "https://api.anthropic.com",
          model = "claude-sonnet-4-20250514",
          timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 20480,
          },
        },
      },
    },

    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim"
    }
  },

  {
    "ravitemer/mcphub.nvim",
  },

  {
    -- used by avante.
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      file_types = {
        -- "markdown",
        "Avante"
      },
    },
    ft = {
      -- "markdown",
      "Avante"
    },
  }
}
