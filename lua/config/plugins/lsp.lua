local lspconfig = require('lspconfig')

if lib.platform.language_servers.clangd.enabled then
    lspconfig.clangd.setup {
        capabilities = lib.cmp.capabilities,
        on_attach = function()
            lib.map.lsp_register_defaults()
            vim.keymap.set('n', '<c-t>', ':ClangdSwitchSourceHeader<cr>', { buffer = 0})
        end
    }
end

if lib.platform.language_servers.sumneko_lua.enabled then
    lspconfig.sumneko_lua.setup {
        capabilities = lib.cmp.capabilities,
        on_attach = lib.map.lsp_register_defaults,
        cmd = lib.platform.language_servers.sumneko_lua.cmd ,
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT'
                },
                diagnostics = {
                    globals = {'vim', 'use'}
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file('', true)
                },
                telemetry = {
                    enable = false
                }
            }
        }
    }
end

if lib.platform.language_servers.jedi_language_server.enabled then
    lspconfig.jedi_language_server.setup {
        cmd = {'~/.local/bin/jedi-language-server'},
        capabilities = lib.cmp.capabilities,
        on_attach = lib.map.lsp_register_defaults
    }
end
