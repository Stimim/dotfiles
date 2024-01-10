-- Load plugin manager and plugins

local M = {}

function ensure_packer()
  -- by default, vim.fn.stdpath('data') is '.local/share/nvim'
  local plugin_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

  if vim.loop.fs_stat(plugin_path) then
    return false
  end

  print(string.format([[packer.nvim is not installed, checking out...]]))
  vim.fn.system({
      'git',
      'clone',
      '--depth=1',
      'https://github.com/wbthomason/packer.nvim',
      plugin_path,
    })
  vim.cmd [[packadd packer.nvim]]
  return true
end

function M.setup()
  local just_installed = ensure_packer()
  local plugin = require('packer')

  return plugin.startup(function (use)
    use 'wbthomason/packer.nvim'  -- packer itself

    use 'tpope/vim-sensible'  -- basic settings

    use 'tpope/vim-fugitive'  -- git support

    use 'ixru/nvim-markdown'
    use 'sheerun/vim-polyglot'  -- language supports

    use {
      'scrooloose/nerdtree',
      config = function()
        require('stimim/keymaps').bind_nerdtree()
      end
    }

    use {
      'neoclide/coc.nvim', branch = 'release'
    }
    use 'honza/vim-snippets'

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true },
      config = function()
        require('stimim/statusline').setup()
      end
    }

    use 'preservim/nerdcommenter'

    -- for tmux integration
    use 'benmills/vimux'
    use 'christoomey/vim-tmux-navigator'

    use {
      'Yggdroot/indentLine',
      config = function()
        vim.g.indentLine_fileTypeExclude = {'json', 'markdown'}
      end,
    }

    use {
      'junegunn/fzf.vim',
      config = function()
        require('stimim.keymaps').bind_fzf()
      end,
      requires = { 'junegunn/fzf' },
    }

    use {
      -- `<leader>tm` to enter table mode
      'dhruvasagar/vim-table-mode'
    }

    use {
      'folke/which-key.nvim',
      config = function()
        --vim.o.timeout = true
        --vim.o.timeoutlen = 300
        require('which-key').setup()
      end,
    }

    -- colorschemes
    use 'ayu-theme/ayu-vim'
    use 'folke/tokyonight.nvim'

    if just_installed then
      plugin.sync()
    end
  end)
end

return M
