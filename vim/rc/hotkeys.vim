" Tagbar Awesomeness
nmap <F8> :TagbarToggle<CR>
" Leader tag
let mapleader = "\<Space>"
let g:rspec_command = "Dispatch rspec {spec}"

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

" Rails Support
map <Leader>rr :e config/routes.rb<CR>
map <Leader>rb :e Gemfile<CR>
nmap <Leader>sc :Scontroller<CR>
nmap <Leader>sv :Sview<CR>
nmap <Leader>sm :Smodel<CR>
nmap <Leader>sj :Sjavascript<CR>
nmap <Leader>ss :Sstylesheet<CR>
nmap <Leader>st :AS<CR>
nmap <Leader>vc :Vcontroller<CR>
nmap <Leader>vv :Vview<CR>
nmap <Leader>vm :Vmodel<CR>
nmap <Leader>vj :Vjavascript<CR>
nmap <Leader>vs :Vstylesheet<CR>
nmap <Leader>vt :AV<CR>
nmap <Leader>rc :Rcontroller<CR>
nmap <Leader>rv :Rview<CR>
nmap <Leader>rm :Rmodel<CR>
nmap <Leader>rj :Rjavascript<CR>
nmap <Leader>rs :Rstylesheet<CR>
nmap <Leader>rt :A<CR>
nmap <Leader>en :e config/locales/en.yml<CR>

" Tabs
map <Leader>tn :tabnext<CR>
map <Leader>tp :tabprev<CR>
map <Leader>tc :tabnew<CR>
map <Leader>tf :tabfirst<CR>
map <Leader>tl :tablast<CR>

" CtrlP.Vim - Make default Mixed Mode
nmap <c-P> :CtrlPBufTag<CR>

" Encouragement to add more leader commands
map <Leader>hk :tabnew<CR>:e ~/.vim/rc/hotkeys.vim<CR>

" RSpec.vim integration
map <Leader>ts :call RunCurrentSpecFile()<CR>


" Support for YCM + Ultisnips/Snipmate
" Source: https://github.com/Valloric/YouCompleteMe/issues/36
function! g:UltiSnips_Complete()
  call UltiSnips#JumpForwards()
  if g:ulti_jump_forwards_res == 0
    call UltiSnips#ExpandSnippet()
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
noremap <Leader><Leader>t <Esc>:CtrlPBufTag<CR>
" Save/Quit
map <C-s> :w<CR>
map <C-q> :q<CR>
map <C-S-q> :q!<CR>
