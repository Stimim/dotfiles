set nocompatible

source ~/.vim/stimim/bundles.vim

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set clipboard=unnamed

" change the color of ycm list
highlight Pmenu ctermfg=0 ctermbg=3

autocmd BufNewFile *.cpp 0r ~/.vim/stimim/templates/cpp.tpl
autocmd BufNewFile *.c 0r ~/.vim/stimim/templates/c.tpl
autocmd BufNewFile *.tex 0r ~/.vim/stimim/templates/tex.tpl
autocmd BufNewFile *.py 0r ~/.vim/stimim/templates/py.tpl
autocmd BufNewFile *.rb 0r ~/.vim/stimim/templates/rb.tpl

autocmd FileType make setlocal noexpandtab
autocmd BufNewFile,BufRead *.sage setlocal filetype=python

set colorcolumn=80

set t_Co=256
set bg=dark
"colorscheme distinguished

if $TERM == 'screen'
  set term=xterm
  " Fix keycodes
  map [1~ <Home>
  map [4~ <End>
  imap [1~ <Home>
  imap [4~ <End>
endif

if $TERM == 'linux'
  set t_Co=8
endif

" highlight search
set hls

map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h

let mapleader = ","

set ignorecase
set smartcase
"set foldmethod=syntax
"set foldlevel=99
set title

let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='xelatex -interaction=nonstopmode $*'

let g:ycm_global_ycm_extra_conf='~/.vim/stimim/ycm/ycm_extra_conf.py'
