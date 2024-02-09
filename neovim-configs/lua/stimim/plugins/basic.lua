return {
  'tpope/vim-sensible',

  {
    'stevearc/oil.nvim',
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

  {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
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
  },

  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      ---- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module='...'` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    }
  },

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
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- https://github.com/folke/which-key.nvim
    },
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
