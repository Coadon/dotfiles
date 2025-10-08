return {
  {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    init = function()
      vim.g.vimtex_compiler_method = "latexmk"
    end,
    dependencies = {
      {"micangl/cmp-vimtex", lazy = false}
    }
  },
}
