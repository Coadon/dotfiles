return {
  {
    "lervag/vimtex",
    lazy = true,
    init = function()
      vim.g.vimtex_compiler_method = "latexmk"
    end,
    dependencies = {
      { "micangl/cmp-vimtex", lazy = true },
    }
  },

  {
    "00msjr/nvim-fountain",
    lazy = true,
    ft = "fountain",  -- Lazy-load only for fountain files
    config = function()
      require("nvim-fountain").setup({
        -- Optional configuration
        keymaps = {
          next_scene = "]]",
          prev_scene = "[[",
          uppercase_line = "<S-CR>",
        },
        -- Export configuration
        export = {
          -- pdf = { options = "--overwrite --fonts Courier" },
        },
      })
    end,
  },

  {
    "gruvw/strudel.nvim",
    lazy = true,
    build = "npm install",
    keys = {
      { "<leader>sl", ":StrudelLaunch<CR>", { desc = "Launch Strudel" } },
      { "<leader>sq", ":StrudelQuit<CR>", { desc = "Quit Strudel" } },
      { "<leader>st", ":StrudelToggle<CR>", { desc = "Strudel Toggle Play/Stop" } },
      { "<leader>su", ":StrudelUpdate<CR>", { desc = "Strudel Update" } },
      { "<leader>ss", ":StrudelStop<CR>", { desc = "Strudel Stop Playback" } },
      { "<leader>sb", ":StrudelSetBuffer<CR>", { desc = "Strudel set current buffer" } },
      { "<leader>sx", ":StrudelExecute<CR>", { desc = "Strudel set current buffer and update" } },
    },
    config = function()
      require("strudel").setup()
    end
  }
}
