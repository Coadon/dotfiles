set shada="NONE"

" Stop working in vimscript.
" Begin migrating to lua all

au FileType cpp,c,make nnoremap <silent> ;r  :VimuxRunCommand "make && $exe $exeargs"<cr>
au FileType cpp,c,make nnoremap <silent> ;R  :VimuxRunCommand "make run"<cr>
au FileType cpp,c,make nnoremap <silent> ;e  :VimuxRunCommand "make $exe"<cr>
au FileType cpp,c,make nnoremap <silent> ;E  :VimuxRunCommand "make $exe && $exe $exeargs"<cr>
au FileType cpp,c,make nnoremap <silent> ;d  :VimuxRunCommand "make && lldb $exe"<CR>
au FileType cpp,c,make nnoremap <silent> ;D  :VimuxRunCommand "make debug"<CR>
au FileType cpp,c,make nnoremap <silent> ;b  :VimuxRunCommand "make"<cr>
au FileType cpp,c,make nnoremap <silent> ;c  :VimuxRunCommand "make clean"<cr>
au FileType cpp,c,make nnoremap <silent> ;k  :VimuxScrollUpInspect<cr>
au FileType cpp,c,make nnoremap <silent> ;j  :VimuxScrollDownInspect<cr>

" C Helpers
au BufEnter,BufNew *.cpp nnoremap <silent> ;p :e %<.hpp<CR>
au BufEnter,BufNew *.hpp nnoremap <silent> ;p :e %<.cpp<CR>
au BufEnter,BufNew *.c nnoremap <silent> ;p :e %<.h<CR>
au BufEnter,BufNew *.h nnoremap <silent> ;p :e %<.c<CR>

au BufEnter,BufNew *.vs nnoremap <silent> ;p :e %<.fs<CR>
au BufEnter,BufNew *.fs nnoremap <silent> ;p :e %<.vs<CR>
au BufEnter,BufNew *.vsh nnoremap <silent> ;p :e %<.fsh<CR>
au BufEnter,BufNew *.fsh nnoremap <silent> ;p :e %<.vsh<CR>
au BufEnter,BufNew *.vert nnoremap <silent> ;p :e %<.frag<CR>
au BufEnter,BufNew *.frag nnoremap <silent> ;p :e %<.vert<CR>

" Settings
filetype plugin indent on
syntax enable
set expandtab autoindent smartindent smarttab
set incsearch hlsearch ignorecase smartcase
set ruler showcmd showmode
set list listchars=tab:>-,trail:⋅
set backspace=indent,eol,start
set cursorline "cursorcolumn
set number relativenumber
set wrap breakindent
set encoding=utf-8
set textwidth=0
set mouse=a
set hidden
set title

set laststatus=2
" set laststatus=3

set cinoptions=m1

set updatetime=300
set signcolumn=yes

set nobackup
set nowritebackup

" Automatically read on change
set autoread

let g:rainbow_active = 1
let g:cursorword_delay = 800

""" Custom Functions

command Fmt :Neoformat

autocmd InsertEnter * set norelativenumber
autocmd InsertLeave * set relativenumber

" Function to trim extra whitespace in whole file
function Trim()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command Trim call Trim()

function SetTab(n)
    let &tabstop=a:n
    let &shiftwidth=a:n
    let &softtabstop=a:n
endfunction
command -nargs=1 SetTab call SetTab(<f-args>)

" Normal mode and save
map <C-c> <esc>

" Do we really need those?

inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

" nnoremap <C-h> <left>
" nnoremap <C-j> <down>
" nnoremap <C-k> <up>
" nnoremap <C-l> <right>

nnoremap <C-w>v :split<Return><C-w>w
nnoremap <C-w>g :vsplit<Return><C-w>w

" Iterm: use left options for +Esc
nnoremap <M-S-j> :m .+1<CR>==
nnoremap <M-S-k> :m .-2<CR>==
inoremap <M-S-j> <Esc>:m .+1<CR>==gi
inoremap <M-S-k> <Esc>:m .-2<CR>==gi
vnoremap <M-S-j> :m '>+1<CR>gv=gv
vnoremap <M-S-k> :m '<-2<CR>gv=gv

nnoremap <silent> mm :Commentary<cr>
xnoremap <silent> mm :'<,'>Commentary<cr>gv
nnoremap <silent> <C-_> :Commentary<cr>
xnoremap <silent> <C-_> :'<,'>Commentary<cr>gv

" Enable FZF history
let g:fzf_history_dir = '~/.local/share/nvim/fzf-history'


if has('nvim')
    set inccommand=split
endif

" FZF
let g:fzf_layout = { 'down': '~60%' }
let g:rg_derive_root='true'
set grepprg="rg --smart-case --hidden --follow"
nnoremap ff :Files<cr>
nnoremap fg :Rg<cr>
nnoremap fl :BLines<cr>
command W :w

" AirLine
let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
let g:airline_section_z = airline#section#create(['%p%% %l%\:%v'])

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nmap <silent> <F8> :TagbarToggle<cr>

" Code folding
set foldlevelstart=29
set foldcolumn=1
set foldmethod=indent
set foldexpr="nvim_treesitter#foldexpr()"

" Enable True Color Support (ensure you're using a 256-color enabled $TERM, e.g. xterm-256color)
set termguicolors

" Color scheme
" let g:gruvbox_contrast_dark="medium"
colorscheme everforest

" File types

autocmd BufEnter,BufNew *.vs,*.fs,*.vsh,*.fsh,*.glsl     setlocal ft=glsl
autocmd BufEnter,BufNew *.asm,*.s,*.S                    setlocal ft=nasm
" autocmd BufEnter,BufNew Makefile,makefile,*.makefile     setlocal noexpandtab ft=make

set tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType nasm setlocal tabstop=8 shiftwidth=8 softtabstop=8
autocmd FileType tex setlocal tabstop=2 shiftwidth=2 softtabstop=2
