set nocompatible
filetype off  " required by vundle

set rtp+=~/.vim/bundle/vundle
set rtp+=~/.vim/stimim

call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'

" language supports
Plugin 'tmux-plugins/vim-tmux'
Plugin 'hallison/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-scripts/STL-Syntax'
"Plugin 'vim-scripts/LaTeX-Suite-aka-Vim-LaTeX'
"let g:Tex_DefaultTargetFormat='pdf'
"let g:Tex_CompileRule_pdf='xelatex -interaction=nonstopmode $*'

Plugin 'vim-scripts/haskell.vim'

Plugin 'scrooloose/nerdtree'
map <leader>o :NERDTreeToggle<CR>

Plugin 'Valloric/YouCompleteMe'
let g:ycm_key_list_previous_completion=['<Up>']
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_global_ycm_extra_conf='~/.vim/stimim/ycm/ycm_extra_conf.py'
" I also map <C-[> to GoToDeclaration for C and python
nnoremap <leader>g :YcmCompleter GoToDeclaration<CR>

Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1

Plugin 'scrooloose/nerdcommenter'

Plugin 'vim-scripts/gtags.vim'

Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<c-]>"
let g:UltiSnipsListSnippets="<F3>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" color schemes
" Plugin 'Lokaltog/vim-distinguished'

call vundle#end()

filetype plugin indent on
