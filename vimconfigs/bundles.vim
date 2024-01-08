set rtp+=~/.vim/stimim

call plug#begin('~/.vim/bundle')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'

Plug 'ixru/nvim-markdown'

" language supports
Plug 'sheerun/vim-polyglot'

Plug 'scrooloose/nerdtree'
map <leader>o :NERDTreeToggle<CR>

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
source ~/.vim/stimim/coc.vim

Plug 'honza/vim-snippets'

"Plug 'bling/vim-airline'
"let g:airline#extensions#tabline#enabled = 1
Plug 'nvim-lualine/lualine.nvim'

Plug 'scrooloose/nerdcommenter'

" for tmux integration
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

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
"Plug 'numkil/ag.nvim'

Plug 'dhruvasagar/vim-table-mode'
" `<leader>tm` to enter table mode

Plug 'folke/which-key.nvim'

" Colorschemes
Plug 'ayu-theme/ayu-vim'
Plug 'folke/tokyonight.nvim'

call plug#end()

" loading lua plugins
lua << EOF
  require("which-key").setup()
  require("lualine").setup {
    options = {
      theme = 'powerline_dark',
    },
    tabline = {
      lualine_a = {'buffers'},
      lualine_z = {'tabs'},
    }
  }
EOF

let g:ayucolor="dark"
colorscheme ayu
