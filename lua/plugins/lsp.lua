return {
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      'mason-org/mason.nvim',
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
    },
    lazy = false,
    config = function()
      -- Install language servers
      require('mason-lspconfig').setup {
        -- automatic_installation = true,
        automatic_enable = true,
        ensure_installed = {
          'rust_analyzer',
          'jedi_language_server',
          'clangd',
          'lua_ls',
          'cmake',
        },
      }

      -- vim.lsp.config('lua_ls', {
      vim.lsp.config.lua_ls = {
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT'
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file('', true),
              checkThirdParty = false
            },
            telemetry = {
              enable = false
            },
          }
        }
      }

      -- vim.lsp.config('clangd', {
      vim.lsp.config.clangd = {
        root_markers = {
          '.clangd',
          'compile_commands.json',
        },
        cmd = {
          'clangd',
          '-j=6',
          '--background-index',
          '--header-insertion=never',
          '--fallback-style=google',
          '--header-insertion-decorators',
          '--all-scopes-completion',
        }
      }
    end
  }
}
