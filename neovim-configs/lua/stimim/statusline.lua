local M = {}

function M.setup()
  local lualine = require('lualine')
  local lualine_config = lualine.get_config()

  --lualine_config.options.theme = 'powerline_dark'
  lualine_config.options.theme = 'catppuccin'
  lualine_config.tabline.lualine_a = {'buffers'}
  lualine_config.tabline.lualine_z = {'tabs'}
  lualine_config.sections.lualine_c = {'%f'}
  lualine.setup(lualine_config)
end

return M
