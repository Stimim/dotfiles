local function setup_lspconfig()
  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local function make_opts(desc)
        return { buffer = ev.buf, desc = desc }
      end
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, make_opts('goto declaration'))
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, make_opts('goto definition'))
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, make_opts('show definition'))
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, make_opts('goto implementation'))
      vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, make_opts('signature help'))
      vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, make_opts('add workspace folder'))
      vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, make_opts('remove workspace folder'))
      vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, make_opts('list workspace folders'))
      vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, make_opts('type definition'))
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, make_opts('rename'))
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, make_opts('code action'))
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, make_opts('references'))
    end,
  })

  -- Inject blink.cmp capabilities into lspconfig defaults
  local lspconfig = require('lspconfig')
  lspconfig.util.default_config.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig.util.default_config.capabilities,
    require('blink.cmp').get_lsp_capabilities()
  )
end

return {
  {
    'neovim/nvim-lspconfig',
    config = setup_lspconfig,
    dependencies = {
      {
        'saghen/blink.cmp',
        version = 'v1.*',
        dependencies = {
          {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp",
            dependencies = { 'honza/vim-snippets' },
            config = function()
              require("luasnip.loaders.from_snipmate").lazy_load()
            end
          },
        },
        opts = {
          keymap = { preset = 'default' },
          snippets = {
            expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
            active = function(filter)
              if filter and filter.direction then
                return require('luasnip').jumpable(filter.direction)
              end
              return require('luasnip').in_snippet()
            end,
            jump = function(direction) require('luasnip').jump(direction) end,
          },
          sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
            providers = {
              lazydev = {
                name = "LazyDev",
                module = "lazydev.integrations.blink",
                score_offset = 100,
              },
            },
          },
        },
      },
      {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {},
      },
      {
        'folke/trouble.nvim',
        opts = {},
        cmd = "Trouble",
        keys = {
          {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
          },
        },
      },
    },
  },
}
