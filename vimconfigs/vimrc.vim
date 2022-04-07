if has('nvim')
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath = &runtimepath
endif

set nocompatible

let mapleader = ","

source ~/.vim/stimim/bundles.vim

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set nowrap

set clipboard=unnamedplus

augroup LoadTemplate
  autocmd!
  autocmd BufNewFile *.cpp 0r ~/.vim/stimim/templates/cpp.tpl
  autocmd BufNewFile *.c 0r ~/.vim/stimim/templates/c.tpl
  autocmd BufNewFile *.tex 0r ~/.vim/stimim/templates/tex.tpl
  autocmd BufNewFile *.py 0r ~/.vim/stimim/templates/py.tpl
  autocmd BufNewFile *.rb 0r ~/.vim/stimim/templates/rb.tpl
augroup END

set t_Co=256
set t_RV=     " https://github.com/vim-airline/vim-airline/issues/1025
set bg=dark
"colorscheme distinguished

" detect if we are in a tmux session
let g:in_tmux = !empty($TMUX)
if g:in_tmux && !has('nvim')
  set term=xterm-256color
endif

if $TERM == 'linux'  " console only supports 8 bit colors.
  set t_Co=8
endif

" highlight search
set hls

map <C-W>\| <C-W>v
map <C-W>- <C-W>s

nmap <A-RIGHT> :bn!<CR>
nmap <A-LEFT> :bN!<CR>

set ignorecase
set smartcase
set foldmethod=syntax
set foldlevel=99
set title
set cursorline

set list
set listchars=tab:»·,trail:·
set winwidth=85

set number
set relativenumber
highlight LineNr ctermfg=grey
nnoremap <C-N> :call StimimToggleNumber()<CR>

set colorcolumn=+1

call localrc#load()

let g:stimim_enable_number = 1
function StimimToggleNumber()
  if g:stimim_enable_number == 1
    set number!
    set relativenumber!
    set list!
    set colorcolumn=
    set listchars=
    IndentLinesToggle
  else
    set number!
    set relativenumber!
    set list!
    set colorcolumn=+1
    set listchars=tab:»·,trail:·
    IndentLinesToggle
  endif

  let g:stimim_enable_number = 1 - g:stimim_enable_number
endfunction
