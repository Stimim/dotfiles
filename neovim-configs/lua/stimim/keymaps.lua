local M = {}

function M.bind_fzf()
  vim.keymap.set('n', '<leader>ff', ':Files<CR>', { noremap = true })
  vim.keymap.set('n', '<leader>fg', ':GFiles<CR>', { noremap = true })
  vim.keymap.set('n', '<leader>fr', ':Ag<CR>', { noremap = true })
  vim.keymap.set('n', '<leader>fb', ':Buffers<CR>', { noremap = true })
  vim.keymap.set('n', '<leader>fm', ':Marks<CR>', { noremap = true })
  vim.keymap.set('n', '<leader>fw', ':Windows<CR>', { noremap = true })
end

function M.bind_nerdtree()
  vim.keymap.set('n', '<leader>o', ':NERDTreeToggle<CR>')
end

return M
