local M = {}

function M.setup()
  require('lualine').setup {
    options = {
      theme = 'catppuccin-nvim',
    },
    tabline = {
      lualine_a = {'buffers'},
      lualine_z = {'tabs'},
    },
    sections = {
      lualine_c = {'%f'},
    }
  }
end

return M
