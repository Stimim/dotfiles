local M = {}

local function bindkeys(defs, default_opts, prefix)
  default_opts = default_opts or {}
  prefix = prefix or ''

  for mode, mappings in pairs(defs) do
    for _, args in ipairs(mappings) do
      local lhs = prefix .. args[1]
      local rhs = args[2]
      local opts = vim.tbl_deep_extend('force', default_opts, args[3])
      vim.keymap.set(mode, lhs, rhs, opts)
    end
  end
end

function M.bind_telescope()
  -- maybe we can check: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/editor.lua#L135
  -- or this: https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#pickers
  local builtin = require('telescope.builtin')

  local prefix = '<leader>'
  local default_opts = { noremap = true }
  local defs = {
    n = {
      -- find something
      { 'ff', builtin.find_files, { desc = 'Find Files' } },
      { 'f/', builtin.live_grep, { desc = 'Live grep (/)' } },
      { 'fb', builtin.buffers, { desc = 'Find Buffer' } },
      { 'fh', builtin.help_tags, { desc = 'Find Help tags' } },
      { 'fr', builtin.oldfiles, { desc = 'Find Recent files' } },
      { 'fs', builtin.lsp_document_symbols, { desc = 'Find document Symbols' } },
      { 'fS', builtin.lsp_workspace_symbols, { desc = 'Find workspace Symbols' } },
      -- git ?
      { 'gf', builtin.git_files, { desc = 'Find Git files' } },
      { 'gc', builtin.git_commits, { desc = 'Find Git files' } },
      -- search ?
    }
  }

  bindkeys(defs, default_opts, prefix)
end

return M
