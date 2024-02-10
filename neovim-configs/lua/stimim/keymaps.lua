local M = {}

function M.bind_fzf()
  vim.keymap.set('n', '<leader>ff', ':Files<CR>', { noremap = true })
  vim.keymap.set('n', '<leader>fg', ':GFiles<CR>', { noremap = true })
  vim.keymap.set('n', '<leader>fr', ':Ag<CR>', { noremap = true })
  vim.keymap.set('n', '<leader>fb', ':Buffers<CR>', { noremap = true })
  vim.keymap.set('n', '<leader>fm', ':Marks<CR>', { noremap = true })
  vim.keymap.set('n', '<leader>fw', ':Windows<CR>', { noremap = true })
end

function M.bind_telescope()
  -- maybe we can check: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/editor.lua#L135
  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
  vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
end

return M
