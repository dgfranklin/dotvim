set shell=/bin/bash

" Setting up Vundle - the vim plugin bundler
let install_vundle_bundles=0
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let install_vundle_bundles=1
endif

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Bundle 'lervag/vim-latex'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'DoxygenToolkit.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-obsession'
Plugin 'Valloric/YouCompleteMe'

if install_vundle_bundles == 1
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :PluginInstall
endif

syntax enable
set background=dark
colorscheme solarized
set spell

if exists('+breakindent')
    set breakindent
    set linebreak
    set showbreak=..
endif
if exists('+cc')
    set cc=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
set wildmode=longest,list

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
nmap <F2> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

""
" Disable YouCompleteMe by default
" ""
let g:ycm_filetype_whitelist = {}
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_extra_conf_globlist = ['~/Dropbox/cmu/15/*', '~/Dropbox/cmu/33/*']
