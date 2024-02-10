-- ref: https://github.com/nvim-neorg/neorg/issues/714#issuecomment-1859183586
local function setup_loading_template_on_new_file()
  local group = vim.api.nvim_create_augroup(
    'NeorgLoadTemplateGroup',
    { clear = true }
  )

  local is_buffer_empty = function(buffer)
    -- Only read the first two lines.
    -- If the buffer is empty, it will return { '' }
    local content = vim.api.nvim_buf_get_lines(buffer, 0, 2, false)

    return #content == 1 and content[1] == ''
  end

  local callback = function(args)
    -- ref: https://neovim.io/doc/user/api.html#api-autocmd:~:text=documentation%20and%20troubleshooting).-,callback,-(function%7Cstring)%20optional
    -- args = {
    --   id: (number) autocommand id
    --   event: (string) name of the triggered event autocmd-events
    --   group: (number|nil) autocommand group id, if any
    --   match: (string) expanded value of <amatch>
    --   buf: (number) expanded value of <abuf>
    --   file: (string) expanded value of <afile>
    --   data: (any) arbitrary data passed from nvim_exec_autocmds()
    -- }
    vim.schedule(function()
      if not vim.api.nvim_buf_is_valid(args.buf) then
        return
      end

      if not is_buffer_empty(args.buf) then
        return
      end

      if string.find(args.file, '/journal/') then
        vim.api.nvim_cmd({ cmd = 'Neorg', args = { 'templates', 'fload', 'journal' } }, {})
      else
        vim.api.nvim_cmd({ cmd = 'Neorg', args = { 'inject-metadata' } }, {})
      end
    end)
  end

  vim.api.nvim_create_autocmd(
    { 'BufNewFile', 'BufNew', },
    {
      desc = 'Load template on new norg files',
      pattern = '*.norg',
      callback = callback,
      group = group,
    }
  )
end

-- keymap namespace: <leader><leader>
return {
  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    run = ':Neorg sync-parsers',
    ft = 'norg',
    cmd = 'Neorg',  -- lazy load on command
    -- tag = '*',
    dependencies = {
      {
        'pysan3/neorg-templates',
        dependencies = { 'L3MON4D3/LuaSnip' },
      },
      'nvim-treesitter/nvim-treesitter',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-cmp',
      'nvim-lua/plenary.nvim',
      { "nvim-neorg/neorg-telescope" },
    },
    config = function()
      setup_loading_template_on_new_file()

      require('neorg').setup {
        load = {
          ['core.defaults'] = {}, -- Loads default behaviour
          ['core.completion'] = { config = { engine = 'nvim-cmp', name = '[Neorg]' } },
          ['core.integrations.nvim-cmp'] = {},
          ['core.integrations.telescope'] = {},
          ['core.mode'] = {},
          ['core.journal'] = {
            config = {
              strategy = 'flat',
              use_template = false,
            }
          },
          ['core.keybinds'] = {
            -- ref: https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
            config = {
              default_keybinds = true,
              neorg_leader = '<Leader><Leader>',
              hook = function(keybinds)
                keybinds.unmap('norg', 'n', keybinds.leader .. 'id')

                -- these keymaps only works in norg files
                keybinds.map('norg', 'n', keybinds.leader .. 'jt', '<cmd>Neorg journal today<CR>')
                keybinds.map('norg', 'n', keybinds.leader .. 'r', '<cmd>Neorg return<CR>')

                keybinds.map_event_to_mode('norg', {
                  n = { -- Bind keys in normal mode
                    { keybinds.leader .. 'fl', 'core.integrations.telescope.find_linkable', opts = { desc = 'Find Linkable' } },
                    { keybinds.leader .. 'fh', 'core.integrations.telescope.search_headings', opts = { desc = 'Find Headings' } },
                  },
                  i = { -- Bind in insert mode
                    { '<C-l>', 'core.integrations.telescope.insert_link' },
                  },
                }, { silent = true, noremap = true, })

              end,
            }
          },
          ['core.concealer'] = {}, -- Adds pretty icons to your documents
          ['core.dirman'] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                home = '~/pkm/neorg/home',
                work = '~/pkm/neorg/work',
              },
              default_workspace = 'home',
            },
          },
          ['core.summary'] = {},
          ['external.templates'] = {
            -- ref: https://github.com/pysan3/neorg-templates
            -- templates_dir = vim.fn.stdpath('config') .. '/templates/norg',
            -- default_subcommand = 'add', -- or 'fload', 'load'
            -- keywords = { -- Add your own keywords.
            --   EXAMPLE_KEYWORD = function ()
            --     return require('luasnip').insert_node(1, 'default text blah blah')
            --   end,
            -- },
            -- snippets_overwrite = {},
          }
        },
      }
    end,
    keys = {
      { '<leader><leader>i', '<CMD>Neorg index<CR>', desc = 'Neorg index', noremap = true }
    },
  },
}
