return {
  'nvim-treesitter/nvim-treesitter',
  event = {
    "BufReadPost",
    "BufNewFile"
  },
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter').setup {
      ensure_installed = {
        'bash',
        'c',
        'cmake',
        'cpp',
        'javascript',
        'json',
        'lua',
        'luadoc',
        'luap',
        'markdown',
        'markdown_inline',
        'python',
        'regex',
        'rust',
        'vim',
        'vimdoc',
        'xml',
        'yaml',
      },
    }
  end,
}
