local M = {}

M.enable_state = true

function toggle_state()
  set_state(not M.enable_state, true)
end

function set_state(enable, verbose)
  if verbose then
    print(string.format('line_number: %s', enable and 'enabled' or 'disabled'))
  end

  M.enable_state = enable

  vim.opt.number = enable
  vim.opt.relativenumber = enable
  vim.opt.list = enable

  if enable then
    vim.opt.colorcolumn = '+1'
    vim.opt.listchars = [[tab:»·,trail:·]]
  else
    vim.opt.colorcolumn = ''
    vim.opt.listchars = ''
  end

  -- indentLine plugin is loaded *after* the buffer is loaded
  if vim.g.indentLine_loaded then
    if enable then
      vim.cmd [[IndentLinesEnable]]
    else
      vim.cmd [[IndentLinesDisable]]
    end
  end
end

function M.setup(enable)
  if enable == nil then
    enable = true
  end
  set_state(enable)

  vim.keymap.set('n', '<c-n>', toggle_state, { noremap = true })
end

return M
