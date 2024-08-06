local function noremap(mode, key, command)
    vim.keymap.set(mode, key, command, {noremap=true,silent=true})
end

local function map(mode, key, command)
    vim.keymap.set(mode, key, command)
end

vim.o.shada = null

vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "a"

vim.o.smarttab = true
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.completeopt = "menu,menuone,noselect"

vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")

vim.o.ruler = true
vim.o.showcmd = true
vim.o.showmode = true

vim.o.list = true
vim.o.cursorline = true
vim.o.listchars = "tab:>-,trail:⋅,eol:¶"
vim.o.backspace = "indent,eol,start"

vim.o.wrap = true
vim.o.breakindent = true
vim.o.encoding = "utf-8"
vim.o.hidden = true
vim.o.title = true

vim.o.laststatus = 2
vim.o.cinoptions = "m1"
vim.o.updatetime = 300
vim.o.signcolumn = "yes"

vim.o.autoread = true

vim.o.termguicolors = true

vim.o.inccommand = "split"

-- Code Folding
vim.o.foldlevelstart=5
vim.o.foldcolumn="1"
vim.o.foldmethod="indent"

vim.g.rainbow_active = 1
vim.g.cursorword_delay = 800

-- Smart Rel Numbers
vim.cmd("autocmd InsertEnter * set norelativenumber")
vim.cmd("autocmd InsertLeave * set relativenumber")

-- UTILITIES
vim.cmd([[
function Trim()
    let l:save = winsaveview()
    keeppatterns %s/\\s\\+$//e
    call winrestview(l:save)
endfun

command Trim call Trim()
command Fmt :Neoformat
command CurCol :set cursorcolumn
]])


-- KEYS
--

map("n", "<C-c>", "<esc>")
map("n", "<C-s>", ":w<cr>")
map("n", ";s", ":w<cr>")

noremap("i", "<C-h>", "<left>")
noremap("i", "<C-j>", "<down>")
noremap("i", "<C-k>", "<up>")
noremap("i", "<C-l>", "<right>")

noremap("n", "<C-w>v", ":split<cr><C-w>w")
noremap("n", "<C-w>g", ":vsplit<cr><C-w>w")

-- Iterm: use left options for +Esc
noremap("n", "<M-S-j>", ":m .+1<CR>==")
noremap("n", "<M-S-k>", ":m .-2<CR>==")
noremap("i", "<M-S-j>", "<Esc>:m .+1<CR>==gi")
noremap("i", "<M-S-k>", "<Esc>:m .-2<CR>==gi")
noremap("v", "<M-S-j>", ":m '>+1<CR>gv=gv")
noremap("v", "<M-S-k>", ":m '<-2<CR>gv=gv")

noremap("n", "gc", ":Commentary<cr>")
noremap("x", "gc", ":'<,'>Commentary<cr>gv")
noremap("n", "<C-_>", ":Commentary<cr>")
noremap("x", "<C-_>", ":'<,'>Commentary<cr>gv")
