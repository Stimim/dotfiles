local M = {}

local function declare_template_loader()
  local group_name = 'LoadTemplate'
  local group_id = vim.api.nvim_create_augroup(group_name, { clear = true })

  local templates = {
    ['cpp.tpl'] = { '*.cpp' },
    ['c.tpl'] = { '*.c' },
    ['py.tpl'] = { '*.py' },
  }
  for template, pattern in pairs(templates) do
    vim.api.nvim_create_autocmd(
      'BufNewFile',
      {
        group = group_id,
        pattern = pattern,
        command = '0r ~/.config/nvim/templates/' .. template
      }
    )
  end
end

local function detect_filetype()
  local group_name = 'StimimFileType'
  local group_id = vim.api.nvim_create_augroup(group_name, { clear = true })

  vim.api.nvim_create_autocmd(
    {'BufNewFile', 'BufRead'},
    {
      group = group_id,
      pattern = '*.bp',
      command = 'set filetype=blueprint',
    }
  )
end

local function remove_trailing_space()
  local cursor = vim.api.nvim_win_get_cursor(0)
  vim.cmd [[silent! %s/\s\+$//]]
  vim.api.nvim_win_set_cursor(0, cursor)
end

local function remove_trailing_space_on_save()
  local group_name = 'RemoveTrailingSpaceOnSave'
  local group_id = vim.api.nvim_create_augroup(group_name, { clear = true })

  local patterns = {
    '*.[ch]pp', '*.[ch]', '*.py',
  };

  for _, pattern in ipairs(patterns) do
    vim.api.nvim_create_autocmd(
      {'BufWrite'},
      {
        group = group_id,
        pattern = pattern,
        callback = remove_trailing_space,
      }
    )
  end
end

function M.setup()
  declare_template_loader()
  detect_filetype()
  remove_trailing_space_on_save()
end

return M
