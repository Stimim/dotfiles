local function config_telescope()
  local actions = require('telescope.actions')

  require('telescope').setup {
    defaults = {
      mappings = {
        i = {
          ['<esc>'] = actions.close,
        }
      }
    }
  }
  -- To use: `:Telescope noice`
  require('telescope').load_extension('noice')

  require('stimim.keymaps').bind_telescope()
end

return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
      'folke/noice.nvim',
      'nvim-lua/plenary.nvim',
    },
    config = config_telescope,
  },
}
