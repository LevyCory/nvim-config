return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  init = function()
    local ensure_installed = {
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
    }

    local installed_parsers = require('nvim-treesitter.config').get_installed()
    local parsers_to_install = vim.iter(ensure_installed):filter(function(parser)
      return not vim.tbl_contains(installed_parsers, parser)
    end):totable()

    require('nvim-treesitter').install(parsers_to_install)

    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
