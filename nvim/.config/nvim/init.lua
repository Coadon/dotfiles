require("lazyload")

vim.cmd[[
let g:VM_default_mappings = 0
let g:VM_maps = {}
let g:VM_maps["Add Cursor Down"]             = "<C-S-j>"
let g:VM_maps["Add Cursor Up"]               = "<C-S-k>"
]]

require("qol")
require("lsp")
require("setup")
