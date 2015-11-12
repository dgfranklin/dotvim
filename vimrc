set shell=/bin/zsh

" Setting up Vundle - the vim plugin bundler
" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    let install_bundles=0
endif

set nocompatible

"Bundle 'lervag/vim-latex'
"Plugin 'DoxygenToolkit.vim'
"Plugin 'LaTeX-Box-Team/LaTeX-Box'
"Plugin 'majutsushi/tagbar'
call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'bronson/vim-trailing-whitespace'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'nelstrom/vim-visual-star-search'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()


syntax enable
set background=dark
set spell
colorscheme solarized

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

" Indent automatically depending on filetype
filetype plugin on
filetype indent on

" Turn on line numbering. Turn it off with "set nonu"
set relativenumber
set number

"" Search
"set incsearch
set ignorecase
set smartcase

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
set wrap "Wrap lines


""""""""""""""""""""""""
" => Key Bindings
"""""""""""""""""""""""
nmap <F2> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>S
let mapleader = ","

"" Easy Motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-s2)
omap s <Plug>(easymotion-t2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade Comment
hi link EasyMotionTarget2First ErrorMsg
hi link EasyMotionTarget2Second ErrorMsg
hi link EasyMotionMoveHL Search
hi link EasyMotionIncSearch Search


""
" Tab completion of filenames
""

set wildmode=longest,list,full
set wildmenu

"""
" => Ycm
"""

let g:ycm_always_populate_loc_list = 1
let g:ycm_open_loclist_on_ycm_diags = 1


"""
" => FZF
"""
nnoremap <C-P> :FZF<CR>
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

" """
" => Environment
" """
let env_specific_source=expand('~/.vim/env-specific/env.vim')
if filereadable(env_specific_source)
    execute 'source '.fnameescape(env_specific_source)
endif

" Mouse
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif
"

"" Termninal
"
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
  nnoremap <A-h> <C-w>h
  nnoremap <A-j> <C-w>j
  nnoremap <A-k> <C-w>k
  nnoremap <A-l> <C-w>l
endif
