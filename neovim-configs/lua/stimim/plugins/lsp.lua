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
      --local opts = { buffer = ev.buf }
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
end

local function setup_cmp()
  local cmp = require('cmp')
  local luasnip = require('luasnip')

  -- ref: https://github.com/hrsh7th/nvim-cmp
  cmp.setup {
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
      ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- Down
      -- C-b (back) C-f (forward) for snippet placeholder navigation.
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    }),
    sources = {
      { name = 'luasnip' },
      { name = 'nvim_lsp' },
      { name = 'buffer' },
    },
  }
end

return {
  {
    'neovim/nvim-lspconfig',
    config = setup_lspconfig,
    dependencies = {
      {
        'hrsh7th/nvim-cmp',
        config = setup_cmp,
        dependencies = {
          {
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!).
            build = "make install_jsregexp"
          }
        },
      },
      'hrsh7th/cmp-nvim-lsp',
      {
        'saadparwaiz1/cmp_luasnip',
        dependencies = {
          'honza/vim-snippets',
        },
        config = function()
          require("luasnip.loaders.from_snipmate").lazy_load()
        end
      },
      {
        'folke/neodev.nvim',
        opts = {
          library = {
            -- this is must faster.
            --plugins = false,
            -- you can also specify the list of plugins to make available as a workspace library
            plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
          },
        },
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
