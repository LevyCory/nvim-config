return {
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      'mason-org/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    lazy = false,
    config = function()
      require('mason-lspconfig').setup {
        automatic_enable = true,
        ensure_installed = {
          'rust_analyzer',
          'jedi_language_server',
          'clangd',
          'lua_ls',
          'cmake',
        },
      }
    end
  }
}
