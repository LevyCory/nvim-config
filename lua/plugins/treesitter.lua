return {
  'nvim-treesitter/nvim-treesitter',
  event = {
    "BufReadPost",
    "BufNewFile"
  },
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter.configs').setup {
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
        'yaml',
      },
      highlight = {
        enable = true, -- false will disable the whole extension
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = {
          'pkl'
        },
        disable = true,
      },
    }
  end,
}
