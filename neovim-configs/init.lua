function setup_mason()
  local status, mason = pcall(require, 'mason')

  if not status then
    -- failed to load
    return
  end

  mason.setup()
  require('mason-lspconfig').setup()
end

function main()
  vim.opt.compatible = false
  vim.g.mapleader = ','

  require('stimim.plugin').setup()

  vim.opt.wrap = false
  vim.opt.cursorline = true
  vim.opt.title = true
  vim.opt.smartcase = true
  vim.opt.ignorecase = true
  vim.opt.winwidth = 85

  vim.opt.clipboard = 'unnamedplus'

  -- setup colorscheme
  vim.opt.background = 'dark'
  if vim.env.COLORTERM == 'truecolor' or vim.env.COLORTERM == '24bit' then
    vim.opt.termguicolors = true
    vim.g.ayucolor = 'dark'
    vim.cmd [[colorscheme ayu]]
  else
    vim.notify('truecolor is not supported', vim.log.levels.ERROR)
  end

  require('stimim.autocmds').setup()
  require('stimim.line_number').setup()

  setup_mason()
end

main()
