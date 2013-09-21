set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
Bundle 'majutsushi/tagbar'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/syntastic'

syntax enable
set background=dark
colorscheme solarized

" Indent automatically depending on filetype
filetype plugin on
filetype indent on

" Turn on line numbering. Turn it off with "set nonu" 
set nu 

" Higlhight search
set hls
" Case insensitive search
set ic

set backspace=indent,eol,start

set ruler

"""  Folding
set foldmethod=syntax
set foldlevel=99

""" Tab Completion
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set lbr
set ai "Auto indent
set si "Smart indent
set wrap "Wrap linest


""""""""""""""""""""""""
" => Key Bindings
"""""""""""""""""""""""
map <F2> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Language specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.c0 setf c
au BufNewFile,BufRead *.sig set filetype=sml
autocmd FileType make set noexpandtab

"Latex"
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf = 'Skim'
let g:Tex_UseMakefile = 0
