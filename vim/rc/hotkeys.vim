" Tagbar Awesomeness
nmap <F8> :TagbarToggle<CR>
" Leader tag
let mapleader = ","

" Remap a bunch of standardized items
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>e :e
nnoremap <Leader>8 :set tw=80<CR>
nnoremap <Leader>0 :set tw=0<CR>

" Window navigation
nnoremap <Leader>H <C-w>H
nnoremap <Leader>J <C-w>J
nnoremap <Leader>K <C-w>K
nnoremap <Leader>L <C-w>L
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

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

let g:UltiSnipsExpandTrigger="<Leader><cr>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Vimux -- Run rake
nmap <F12> :call VimuxRunCommand("rake")<CR>
" Go to tag in current file
inoremap <Leader><Leader>t <Esc>:CtrlPBufTag<CR>
" Save/Quit
map <C-s> :w<CR>
map <C-q> :q<CR>
map <C-S-q> :q!<CR>
