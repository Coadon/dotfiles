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

vim.cmd([[
filetype plugin indent on
syntax enable
]])

vim.o.ruler = true

vim.o.list = true
vim.o.cursorline = true
vim.o.backspace = "indent,eol,start"

-- Show chars (the spaces is important)
vim.o.listchars = "tab:+ ,trail:⋅,nbsp:+"

-- wrapping
vim.o.wrap = true
vim.o.breakindent = true

-- Buffer
vim.o.encoding = "utf-8"

-- Abandon buffer once unloaded
vim.o.hidden = false

-- Signs
vim.o.signcolumn = "yes"

-- Identation in C,C++,Java
vim.o.cinoptions = "m1"
vim.opt.cinoptions = "j1,L0,:0,l1,g0,t0,(0"
vim.o.cindent = true

-- Update buffer on change
vim.o.updatetime = 300
vim.o.autoread = true

-- Terminal
vim.o.termguicolors = true
vim.o.inccommand = "nosplit"
vim.o.laststatus = 3

-- Code Folding
vim.o.foldlevelstart=8
vim.o.foldmethod="indent"

-- Width
vim.o.textwidth=80
vim.o.colorcolumn="+1"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.rainbow_active = 1

--
-- KEYS
--

local function noremap(mode, key, command)
    vim.keymap.set(mode, key, command, {noremap=true,silent=true})
end

local function map(mode, key, command)
    vim.keymap.set(mode, key, command)
end

-- Save and paste
noremap("n", "<D-s>", ":w<cr>")
noremap("v", "<D-c>", '"+y')
noremap("n", "<D-v>", '"+p')
noremap("i", "<D-v>", '<esc>"+pi')

-- Insert mode movement
noremap("i", "<C-h>", "<left>")
noremap("i", "<C-j>", "<down>")
noremap("i", "<C-k>", "<up>")
noremap("i", "<C-l>", "<right>")
noremap("i", "<C-c>", "<esc>")

-- Stuff
noremap("n", "<space>il", ":InlayOn<cr>")
noremap("n", "<space>li", ":InlayOff<cr>")
noremap("n", "<space>F", ":Format<cr>")

-- Panes
noremap("n", "<C-w>-", ":split<cr><C-w>w")
noremap("n", "<C-w>|", ":vsplit<cr><C-w>w")

-- Meta Shift for line move
noremap("n", "<M-S-j>", ":m .+1<CR>==")
noremap("n", "<M-S-k>", ":m .-2<CR>==")

noremap("v", "<M-S-j>", ":m '>+1<CR>gv=gv")
noremap("v", "<M-S-k>", ":m '<-2<CR>gv=gv")

noremap("i", "<M-S-j>", "<Esc>:m .+1<CR>==gi")
noremap("i", "<M-S-k>", "<Esc>:m .-2<CR>==gi")

-- Commentary
noremap("n", "<D-/>", ":Commentary<cr>")
noremap("x", "<D-/>", ":'<,'>Commentary<cr>gv")

--
-- UTILITIES
--

vim.cmd([[

function! Trim()
    let l:save = winsaveview()
    keeppatterns %s/\\s\\+$//e
    call winrestview(l:save)
endfun

command! Trim call Trim()

function! SetTab(n)
    execute "set tabstop=" . a:n . " shiftwidth=" . a:n . " softtabstop=" . a:n
endfun

command! -nargs=1 SetTab call SetTab(<args>)

command! InlayOff lua vim.lsp.inlay_hint.enable(false)
command! InlayOn lua vim.lsp.inlay_hint.enable(true)
command! YankAll %y+

autocmd InsertEnter *   set norelativenumber
autocmd InsertLeave *   set relativenumber

au FileType glsl        setlocal commentstring=//\ %s
au FileType cpp,c       setlocal commentstring=//\ %s

au BufEnter,BufNew *.cpp    map <silent> ;p :e %<.hpp<CR>
au BufEnter,BufNew *.hpp    map <silent> ;p :e %<.cpp<CR>
au BufEnter,BufNew *.c      map <silent> ;p :e %<.h<CR>
au BufEnter,BufNew *.h      map <silent> ;p :e %<.c<CR>

au BufNewFile,BufRead *.vs,*.fs,*.vert,*.tesc,*.tese,*.glsl,*.geom,*.frag,*.comp,*.rgen,*.rmiss,*.rchit,*.rahit,*.rint,*.rcall set filetype=glsl

au BufEnter,BufNew *.org SetTab 2

]])

