return {
  {
    'stimim/codereview.nvim',
    url = 'sso://user/stimim/codereview.nvim',
    dir = vim.fn.isdirectory(vim.fn.expand('~/work/codereview.nvim')) == 1 and vim.fn.expand('~/work/codereview.nvim') or nil,
    lazy = false,
    config = function()
      require('codereview').setup()
    end,
  },
}
