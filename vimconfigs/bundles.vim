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

" Plug 'mileszs/ack.vim'
" let g:ackprg = 'ag --vimgrep'

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

Plug 'bazelbuild/vim-ft-bzl'
Plug 'numkil/ag.nvim'
Plug 'lervag/wiki.vim'
let g:wiki_root = '~/pkm/wiki.vim/'
let g:wiki_journal = {
      \ 'name': 'journal',
      \ 'frequency': 'daily',
      \ 'date_format': {
        \   'daily' : '%Y/%m/%d',
        \   'weekly' : '%Y/%m/week_%m_%d',
        \   'monthly' : '%Y/%m/m%m',
        \ },
        \}
nmap <leader>ft :WikiFzfTags<CR>
nmap <leader>fp :WikiFzfPages<CR>
let g:wiki_mappings_local_journal = {
      \ '<plug>(wiki-journal-prev)' : ',p',
      \ '<plug>(wiki-journal-next)' : ',n',
      \}
let g:wiki_filetypes = ['md', 'wiki']

Plug 'lervag/wiki-ft.vim'

Plug 'dhruvasagar/vim-table-mode'
" `<leader>tm` to enter table mode

call plug#end()
