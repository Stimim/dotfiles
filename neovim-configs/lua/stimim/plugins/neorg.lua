-- ref: https://github.com/nvim-neorg/neorg/issues/714#issuecomment-1859183586
local function setup_loading_template_on_new_file()
  local file_exists_and_is_empty = function(filepath)
    local file = io.open(filepath, 'r')   -- Open the file in read mode
    if file ~= nil then
      local content = file:read('*all') -- Read the entire content of the file
      file:close()                      -- Close the file
      return content == ''              -- Check if the content is empty
    else
      return false
    end
  end

  local callback = function(content)
    local bufname = vim.fn.bufname(content.buffer)

    vim.schedule(function()
      -- Because core.journal calls core.dirman.create_file **twice**,
      -- this callback function would be invoked twice too.
      -- Check if the file is empty before loading the template.
      -- ref: https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/journal/module.lua#L136C40-L138
      if not file_exists_and_is_empty(bufname) then
        return
      end
      -- lua patterns: https://www.lua.org/pil/20.2.html
      if string.find(bufname, '/journal/[%d-]+%.norg$') then
        print('loading template "journal"')
        vim.api.nvim_cmd(
          { cmd = 'Neorg', args = { 'templates', 'fload', 'journal' } },
          {}
        )
      else
        vim.api.nvim_cmd(
          { cmd = 'Neorg', args = { 'inject-metadata' } },
          {}
        )
      end
    end)
  end

  require('neorg.core.callbacks').on_event(
    'core.dirman.events.file_created',
    callback
  )
end


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
    },
    config = function()
      setup_loading_template_on_new_file()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {}, -- Loads default behaviour
          ['core.completion'] = { config = { engine = 'nvim-cmp', name = '[Norg]' } },
          ['core.integrations.nvim-cmp'] = {},
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
            }
          },
          --['core.concealer'] = {}, -- Adds pretty icons to your documents
          ['core.dirman'] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                home = '~/pkm/neorg/home',
                work = '~/pkm/neorg/work',
              },
              default_workspace = 'home',
            },
          },
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
  },
}
