require('plugins')

require('nvimlsp')
require('nvimcmp')
require('nvimLuaSnip')
-- require('nvimdap')

vim.cmd([[so ~/.config/nvim/startup.vim]])

require('nvim-treesitter.install').compilers = {"gcc"}

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
}

require("lsp_signature").setup()

-- Autopairs setup
local Rule = require('nvim-autopairs.rule')
local pairs = require('nvim-autopairs')
pairs.setup()
pairs.add_rule(Rule("/*", "*/", {"c", "cpp"}))
