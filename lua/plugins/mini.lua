return {
  'echasnovski/mini.nvim',
  event = 'BufEnter',
  config = function()
    require('mini.ai').setup()
    require('mini.surround').setup()
    require('mini.pairs').setup()
    require('mini.comment').setup()
  end,
}
