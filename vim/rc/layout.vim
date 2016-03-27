"autocmd vimenter * NERDTree
"autocmd vimenter * if !argc() | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"autocmd vimenter :TagbarToggle

" Folding
set foldmethod=indent
set foldlevel=1
set foldnestmax=10
set nofoldenable

" Faster scrolling speed
set ttyfast
set ttyscroll=3
set lazyredraw
