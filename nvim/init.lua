require('plugins')

require('nvimlsp')
require('nvimcmp')
require('nvimLuaSnip')
-- require('nvimdap')

vim.cmd([[so ~/.config/nvim/startup.vim]])

vim.diagnostic.config {
    float = { border = "rounded" },
}

require('nvim-treesitter.install').compilers = {"gcc"}

require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
    },
}

require("lsp_signature").setup()

require('gitsigns').setup()

-- Autopairs setup
local Rule = require('nvim-autopairs.rule')
local pairs = require('nvim-autopairs')
pairs.setup()

pairs.add_rule(Rule("/*", "*/", {"c", "cpp"}))

-- Hop.nvim
local function addHopKey(key, command)
    vim.keymap.set('n', '<leader><leader>' .. key, command .. '<cr>')
end

-- Honor to vim easymotion
addHopKey('f', ':HopChar1AC')
addHopKey('F', ':HopChar1BC')
addHopKey('s', ':HopChar1')
addHopKey('w', ':HopWord')
require('hop').setup()
