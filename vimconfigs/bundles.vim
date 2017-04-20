set nocompatible
filetype off  " required by vundle

set rtp+=~/.vim/bundle/vundle
set rtp+=~/.vim/stimim

call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'

Plugin 'plasticboy/vim-markdown'

" language supports
Plugin 'tmux-plugins/vim-tmux'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-scripts/STL-Syntax'

Plugin 'vim-scripts/haskell.vim'

Plugin 'scrooloose/nerdtree'
map <leader>o :NERDTreeToggle<CR>

Plugin 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1
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

Plugin 'Shougo/unite.vim'

Plugin 'LnL7/vim-nix'

" lint python files
Plugin 'scrooloose/syntastic'
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ["pylint"]

Plugin 'mileszs/ack.vim'
let g:ackprg = 'ag --vimgrep'
Plugin 'benmills/vimux'

call vundle#end()

filetype plugin indent on
