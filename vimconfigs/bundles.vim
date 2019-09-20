set nocompatible
filetype off  " required by vundle

" set rtp+=~/.vim/bundle/vundle
set rtp+=~/.vim/stimim

" call vundle#begin()
call plug#begin('~/.vim/bundle/')

" Plug 'gmarik/vundle'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'

Plug 'plasticboy/vim-markdown'

" language supports
Plug 'tmux-plugins/vim-tmux'
Plug 'pangloss/vim-javascript'
Plug 'vim-scripts/STL-Syntax'
Plug 'leafgarland/typescript-vim'

Plug 'vim-scripts/haskell.vim'

Plug 'scrooloose/nerdtree'
map <leader>o :NERDTreeToggle<CR>

Plug 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1
" I also map <C-[> to GoToDeclaration for C and python
nnoremap <leader>g :YcmCompleter GoToDeclaration<CR>

Plug 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1

Plug 'scrooloose/nerdcommenter'

Plug 'vim-scripts/gtags.vim'

Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<c-]>"
let g:UltiSnipsListSnippets="<F3>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Plug 'Shougo/unite.vim'

Plug 'LnL7/vim-nix'

" lint python files
Plug 'scrooloose/syntastic'
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ["pylint"]

Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --vimgrep'
Plug 'benmills/vimux'

Plug 'christoomey/vim-tmux-navigator'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
let g:indentLine_fileTypeExclude = ['json', 'markdown']

Plug 'ctrlpvim/ctrlp.vim'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
nnoremap <leader>f :CtrlPMixed<CR>

call plug#end()

filetype plugin indent on
