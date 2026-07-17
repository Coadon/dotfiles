require("lazyload")
require("setup")
require("lspconf")
require("cmpconf")

vim.cmd([[
colorscheme tairiki-dark
highlight DiagnosticError   guifg=BrightRed
highlight ColorColumn       guibg=#2A2A2A
highlight EndOfBuffer       guifg=#363636
highlight LineNr            guifg=DarkGrey
highlight Comment           gui=none
]])
