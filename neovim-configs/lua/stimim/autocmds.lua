local M = {}

function declare_template_loader()
  local group_name = 'LoadTemplate'
  vim.api.nvim_create_augroup(group_name, { clear = true })

  local templates = {
    ['cpp.tpl'] = { '*.cpp' },
    ['c.tpl'] = { '*.c' },
    ['tex.tpl'] = { '*.tex' },
    ['py.tpl'] = { '*.py' },
    ['rb.tpl'] = { '*.rb' },
  }
  for template, pattern in pairs(templates) do
    vim.api.nvim_create_autocmd(
      'BufNewFile',
      {
        pattern = pattern,
        command = string.format('0r ~/.vim/stimim/templates/%s', template)
      }
    )
  end
end

function M.setup()
  declare_template_loader()
end

return M
