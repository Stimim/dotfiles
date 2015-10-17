set nocompatible
filetype off  " required by vundle

set rtp+=~/.vim/bundle/vundle
set rtp+=~/.vim/stimim

call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'

Plugin 'tmux-plugins/vim-tmux'

" Plugin 'Lokaltog/vim-easymotion'

Plugin 'hallison/vim-markdown'

Plugin 'scrooloose/nerdtree'
map <C-o> :NERDTreeToggle<CR>

Plugin 'Valloric/YouCompleteMe'
let g:ycm_key_list_previous_completion=['<Up>']
let g:ycm_autoclose_preview_window_after_completion=1

Plugin 'vim-scripts/STL-Syntax'

Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1

Plugin 'scrooloose/nerdcommenter'

Plugin 'vim-scripts/gtags.vim'
"Plugin 'vim-scripts/LaTeX-Suite-aka-Vim-LaTeX'
Plugin 'vim-scripts/haskell.vim'

Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<c-]>"
let g:UltiSnipsListSnippets="<F3>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
"au FileType javascript call JavaScriptFold()

" color schemes
" Plugin 'Lokaltog/vim-distinguished'

call vundle#end()

filetype plugin indent on

