return {
  -- keymap namespace: <leader>d
  {
    'stevearc/oil.nvim',
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- :help oil
      require('oil').setup {
        columns = {
          'icon',
          'permissions',
        }
      }
      --require('stimim.keymaps').bind_oil()
    end,
    -- we want keybinding but we also want to load it in the beginning.
    lazy = false,
    keys = {
      {'<leader>do', '<CMD>Oil<CR>', {noremap = true}}
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    keys = {
      { '<leader>dd', '<CMD>Neotree toggle<CR>', desc = { 'NeoTree' }, noremap = true, },
    },
  },
}
