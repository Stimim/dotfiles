return {
  --{
    --'folke/tokyonight.nvim',
    --config = function(plugin)
      --vim.cmd[[colorscheme tokyonight]]
    --end
  --},
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin"
    end
  },
}
