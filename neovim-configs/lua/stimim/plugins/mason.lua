return {
  {
    'mason-org/mason.nvim',
  },
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
  },
  {
    'neovim/nvim-lspconfig',
  }
}
