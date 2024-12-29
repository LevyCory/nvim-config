local function setup_lsp_diagnostics()
  local function define_lsp_symbol(name, icon)
    vim.fn.sign_define(
      'DiagnosticSign' .. name,
      { text = icon, numhl = 'DiagnosticDefault' .. name }
    )
  end

  define_lsp_symbol('Error', '')
  define_lsp_symbol('Information', '')
  define_lsp_symbol('Hint', '')
  define_lsp_symbol('Info', '')
  define_lsp_symbol('Warning', '')

  lib.state.lsp_diagnostic_virtual_text = true
  local function lsp_diagnostic_virtual_text_toggle()
    vim.diagnostic.config({
      virtual_text = lib.state.lsp_diagnostic_virtual_text,
      underline = true,
      signs = true,
      severity_sort = true,
    })

    lib.state.lsp_diagnostic_virtual_text = not lib.state.lsp_diagnostic_virtual_text
  end

  lsp_diagnostic_virtual_text_toggle()
  vim.keymap.set('n', '<leader>vt', lsp_diagnostic_virtual_text_toggle,
    { desc = 'LSP: Toggle diagnostics [V]irtual [T]ext' })
end

local function on_attach(_, buffer_number)
  local lsp_map = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = buffer_number, desc = desc })
  end

  lsp_map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  lsp_map('<leader>A', vim.lsp.buf.code_action, '[C]ode [A]ction')
  lsp_map('<leader>gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  lsp_map('<leader>gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  lsp_map('<leader>gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  lsp_map('<leader>td', vim.lsp.buf.type_definition, 'Type [D]efinition')
  lsp_map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  lsp_map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  lsp_map('<leader>oc', require('telescope.builtin').lsp_outgoing_calls, '[O]utgoing [C]alls')
  lsp_map('<leader>ic', require('telescope.builtin').lsp_incoming_calls, '[I]ncoming [C]alls')

  -- See `:help K` for why this keymap
  lsp_map('K', vim.lsp.buf.hover, 'Hover Documentation')
  lsp_map('<M-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  lsp_map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  lsp_map(
    '<leader>wl',
    function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end,
    '[W]orkspace [L]ist Folders'
  )

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(buffer_number, 'Format', function(_)
    if vim.lsp.buf.format then
      vim.lsp.buf.format()
    elseif vim.lsp.buf.formatting then
      vim.lsp.buf.formatting()
    end
  end, { desc = 'Format current buffer with LSP' })

  -- Set up LSP diagnostics
  setup_lsp_diagnostics()
end

return {
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
    },
    lazy = false,
    config = function()
      -- Install language servers
      require('mason-lspconfig').setup {
        automatic_installation = true,
        ensure_installed = {
          'rust_analyzer',
          'jedi_language_server',
          'clangd',
          'lua_ls',
        },
      }

      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

      require('mason-lspconfig').setup_handlers {
        function(server)
          lspconfig[server].setup {
            on_attach = on_attach,
            capabilities = capabilities
          }
        end,
        ['clangd'] = function()
          lspconfig.clangd.setup {
            capabilities = capabilities,
            on_attach = function(_, buffer_number)
              on_attach(_, buffer_number)
              vim.keymap.set('n', '<c-t>', ':ClangdSwitchSourceHeader<cr>', {
                buffer = buffer_number,
                silent = true,
                desc = 'LSP: Toggle header/source'
              })
            end,
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
        end,
        ['lua_ls'] = function()
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
              Lua = {
                runtime = {
                  version = 'LuaJIT'
                },
                diagnostics = {
                  globals = {
                    'vim',
                    'next',
                    'ipairs'
                  }
                },
                workspace = {
                  library = vim.api.nvim_get_runtime_file('', true),
                  checkThirdParty = false
                },
                telemetry = {
                  enable = false
                }
              }
            }
          }
        end,
      }
    end
  }
}
