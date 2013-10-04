" Tagbar Awesomeness
nmap <F8> :TagbarToggle<CR>
" Leader tag
:let mapleader = ","

" Remap Ctrl+W to Ctrl+O
:map <C-O> <C-W>

" Numbers.vim
nnoremap <F3> :NumbersToggle<CR>

" Support for YCM + Ultisnips/Snipmate
" Source: https://github.com/Valloric/YouCompleteMe/issues/36
function! g:UltiSnips_Complete()
  call UltiSnips_JumpForwards()
  if g:ulti_jump_forwards_res == 0
    call UltiSnips_ExpandSnippet()
    if g:ulti_expand_res == 0
      if pumvisible()
        return "\<C-n>"
      else
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

let g:UltiSnipsExpandTrigger="<Leader><CR>"
let g:UltiSnipsJumpForwardTrigger="<tab>"

" Vimux -- Run rake
nmap <F12> :call VimuxRunCommand("rake")<CR>
" Go to tag in current file
inoremap <Leader>t <Esc>:CtrlPBufTag<CR>
" Save/Quit
map <C-s> :w<CR>
map <C-q> :q<CR>
map <C-S-q> :q!<CR>
