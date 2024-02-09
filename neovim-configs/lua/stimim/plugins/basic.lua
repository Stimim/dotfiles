return {
  'tpope/vim-sensible',

  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- :help oil
      require('oil').setup {
        columns = {
          'icon',
          'permissions',
        }
      }

      require('stimim.keymaps').bind_oil()
    end,
  },

  --{
    --'scrooloose/nerdtree',
    --config = function(plugin)
      --require('stimim.keymaps').bind_nerdtree()
    --end
  --},

  {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function(plugin)
      require('stimim.statusline').setup()
    end
  },

  'preservim/nerdcommenter',

  {
    'machakann/vim-sandwich'
  },

  -- for tmux integration
  'benmills/vimux',
  'christoomey/vim-tmux-navigator',

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
    config = function()
      require('ibl').setup()
    end
  },
  --{
    --'Yggdroot/indentLine',
    --config = function(plugin)
      --vim.g.indentLine_fileTypeExclude = {'json', 'markdown', 'norg'}
    --end,
  --},

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function(plugin)
      require('stimim.keymaps').bind_telescope()
    end
  },

  {
    -- `<leader>tm` to enter table mode
    'dhruvasagar/vim-table-mode'
  },

  {
    'folke/which-key.nvim',
    config = function(plugin)
      --vim.o.timeout = true
      --vim.o.timeoutlen = 300
      require('which-key').setup()
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'lua', 'vim', 'vimdoc', 'c', 'cpp', 'python' }
      }
    end
  }
}
