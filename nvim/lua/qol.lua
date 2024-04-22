--
--
-- FUZZY FINDER
--

-- AUTOPAIRS
--

-- HOP
--
local function addHopKey(key, command)
    vim.keymap.set('n', '<leader><leader>' .. key, command .. '<cr>')
end


-- MISC
--

-- Highlight entire line for errors
-- Highlight the line number for warnings
vim.diagnostic.config({
    float = { border = "rounded" },
})

-- AMENDMENTS
--
vim.cmd([[
highlight Comment gui=none
highlight DiagnosticError guifg=BrightRed

colorscheme habamax

autocmd FileType glsl setlocal commentstring=/*\ %s\ */
]])

-- SEMICOLON SHORTCUTS
vim.cmd([[
au FileType cpp,c,make nnoremap <silent> ;r  :VimuxRunCommand "make && a"<cr>
au FileType cpp,c,make nnoremap <silent> ;R  :VimuxRunCommand "make run"<cr>
au FileType cpp,c,make nnoremap <silent> ;e  :VimuxRunCommand "make $exe"<cr>
au FileType cpp,c,make nnoremap <silent> ;E  :VimuxRunCommand "make $exe && $exe $exeargs"<cr>
au FileType cpp,c,make nnoremap <silent> ;d  :VimuxRunCommand "make && lldb $exe"<CR>
au FileType cpp,c,make nnoremap <silent> ;D  :VimuxRunCommand "make debug"<CR>
au FileType cpp,c,make nnoremap <silent> ;b  :VimuxRunCommand "make"<cr>
au FileType cpp,c,make nnoremap <silent> ;c  :VimuxRunCommand "make clean"<cr>
au FileType cpp,c,make nnoremap <silent> ;f  :VimuxRunCommand "g++ A.cpp && ./a.out"<cr>
au FileType cpp,c,make nnoremap <silent> ;k  :VimuxRunCommand "!!"<cr>
au FileType cpp,c,make nnoremap <silent> ;k  :VimuxScrollUpInspect<cr>
au FileType cpp,c,make nnoremap <silent> ;j  :VimuxScrollDownInspect<cr>

au BufEnter,BufNew *.cpp nnoremap <silent> ;p :e %<.hpp<CR>
au BufEnter,BufNew *.hpp nnoremap <silent> ;p :e %<.cpp<CR>
au BufEnter,BufNew *.c nnoremap <silent> ;p :e %<.h<CR>
au BufEnter,BufNew *.h nnoremap <silent> ;p :e %<.c<CR>

au BufEnter,BufNew *.vs,*.fs,*.vsh,*.fsh,*.vert,*.frag setlocal ft=glsl

au BufEnter,BufNew *.vs nnoremap <silent> ;p :e %<.fs<CR>
au BufEnter,BufNew *.fs nnoremap <silent> ;p :e %<.vs<CR>
au BufEnter,BufNew *.vsh nnoremap <silent> ;p :e %<.fsh<CR>
au BufEnter,BufNew *.fsh nnoremap <silent> ;p :e %<.vsh<CR>
au BufEnter,BufNew *.vert nnoremap <silent> ;p :e %<.frag<CR>
au BufEnter,BufNew *.frag nnoremap <silent> ;p :e %<.vert<CR>


]])

