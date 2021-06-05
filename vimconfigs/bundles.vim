set rtp+=~/.vim/stimim

call plug#begin('~/.vim/bundle')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'

Plug 'plasticboy/vim-markdown'
let g:vim_markdown_conceal = 0

" language supports
Plug 'sheerun/vim-polyglot'

Plug 'scrooloose/nerdtree'
map <leader>o :NERDTreeToggle<CR>

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
source ~/.vim/stimim/coc.vim

Plug 'honza/vim-snippets'

Plug 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1

Plug 'scrooloose/nerdcommenter'

" Plug 'vim-scripts/gtags.vim'

Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<c-]>"
let g:UltiSnipsListSnippets="<F3>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Plug 'Shougo/unite.vim'

" lint python files
"Plug 'scrooloose/syntastic'
"" let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_python_checkers = ["pylint"]

Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --vimgrep'

" for tmux integration
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" Plug 'majutsushi/tagbar'

Plug 'Yggdroot/indentLine'
let g:indentLine_fileTypeExclude = ['json', 'markdown']

if filereadable('/usr/share/doc/fzf/examples/plugin/fzf.vim')
  source /usr/share/doc/fzf/examples/plugin/fzf.vim
elseif filereadable('/usr/local/opt/fzf/plugin/fzf.vim')
  source /usr/local/opt/fzf/plugin/fzf.vim
else
  echoerr "Cannot find fzf.vim, have you installed fzf?"
endif
Plug 'junegunn/fzf.vim'

" Both options are optional. You don't have to install fzf in ~/.fzf
" and you don't have to run the install script if you use fzf only in Vim.
nmap <leader>ff :Files<CR>
nmap <leader>fg :GFiles<CR>
nmap <leader>fr :Ag<CR>
nmap <leader>fb :Buffers<CR>
nmap <leader>fm :Marks<CR>
nmap <leader>fw :Windows<CR>

call plug#end()
