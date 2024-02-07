local M = {}

local function declare_template_loader()
  local group_name = 'LoadTemplate'
  vim.api.nvim_create_augroup(group_name, { clear = true })

  local templates = {
    ['cpp.tpl'] = { '*.cpp' },
    ['c.tpl'] = { '*.c' },
    ['py.tpl'] = { '*.py' },
  }
  for template, pattern in pairs(templates) do
    vim.api.nvim_create_autocmd(
      'BufNewFile',
      {
        pattern = pattern,
        command = '0r ~/.config/nvim/templates/' .. template
      }
    )
  end
end

function M.setup()
  declare_template_loader()
end

return M
