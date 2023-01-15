set shada="NONE"

au FileType cpp,c,Makefile nnoremap <silent> ;r  :VimuxRunCommand "make && $exe"<cr>
au FileType cpp,c,Makefile nnoremap <silent> ;R  :VimuxRunCommand "make run"<cr>
au FileType cpp,c,Makefile nnoremap <silent> ;d  :VimuxRunCommand "make && lldb $exe"<CR>
au FileType cpp,c,Makefile nnoremap <silent> ;D  :VimuxRunCommand "make debug"<CR>

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
set ruler laststatus=2 showcmd showmode
set list listchars=tab:>-,trail:⋅
set backspace=indent,eol,start
set cursorline "cursorcolumn
set number "relativenumber
set wrap breakindent
set encoding=utf-8
set textwidth=0
set mouse=a
set hidden
set title

set cinoptions=m1

set updatetime=300
set signcolumn=yes

set nobackup
set nowritebackup

" Automatically read on change
set autoread

let g:rainbow_active = 1

""" Custom Functions

command Fmt :Neoformat

function ToggleRelativeLineNumber()
    if (&relativenumber == 1)
        setlocal norelativenumber
    else
        setlocal relativenumber
    endif
endfunc

command Rln call ToggleRelativeLineNumber()

function ToggleLineNumber()
    if (&number == 1)
        setlocal nonumber
    else
        setlocal number
    endif
endfunc

command Ln call ToggleLineNumber()

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
    " set expandtab
    " set autoindent
    " set smartindent
    " set smarttab
endfunction

command -nargs=1 SetTab call SetTab(<f-args>)

" Normal mode and save
map <C-c> <esc>
nnoremap <C-s> :w<cr>
nnoremap <C-S-s> :wa<cr>

inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

nnoremap <C-h> <left>
nnoremap <C-j> <down>
nnoremap <C-k> <up>
nnoremap <C-l> <right>

nnoremap <C-w>v :split<Return><C-w>w
nnoremap <C-w>g :vsplit<Return><C-w>w

nnoremap mk :m-2<cr>
nnoremap mj :m+1<cr>
xnoremap mk :m'<-2<cr>gv
xnoremap mj :m'>+1<cr>gv

nnoremap <silent> <S-x> :Commentary<cr>
xnoremap <silent> <S-x> :'<,'>Commentary<cr>gv

" Enable FZF history
let g:fzf_history_dir = '~/.local/share/nvim/fzf-history'

let g:EasyMotion_smartcase = 1

" runtimepath

" Get syntax files from config folder
set runtimepath+=~/.config/nvim/syntax/


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
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
let g:airline_section_z = airline#section#create(['%p%% %l%\:%v'])

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nmap <silent> <F8> :TagbarToggle<cr>

" Code folding
set foldmethod=manual
set nofoldenable
set foldexpr=nvim_treesitter#foldexpr()

" Color scheme
let g:gruvbox_contrast_dark="medium"
colorscheme gruvbox

" Enable True Color Support (ensure you're using a 256-color enabled $TERM, e.g. xterm-256color)
set termguicolors

" File types

au BufEnter,BufNew *.vs,*.fs,*.vsh,*.fsh,*.glsl     setlocal ft=glsl
au BufEnter,BufNew *.asm,*.s,*.S                    setlocal ft=nasm
au BufEnter,BufNew Makefile,makefile,*.makefile     setlocal noexpandtab ft=make

" vimtex, add cmp-omni
autocmd FileType tex lua require('cmp').setup.buffer { sources = { { name = 'omni' } }  }

"autocmd FileType html setlocal tabstop=2
"autocmd FileType css setlocal tabstop=2
"autocmd FileType xml setlocal tabstop=2
"autocmd FileType markdown setlocal tabstop=2
"autocmd FileType journal setlocal tabstop=2

call SetTab(4)
