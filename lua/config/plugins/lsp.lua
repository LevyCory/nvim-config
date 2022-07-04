local lspconfig = require('lspconfig')

lspconfig.clangd.setup {
    capabilities = lib.cmp.capabilities,
    on_attach = function()
        lib.map.lsp_register_defaults()
        vim.keymap.set('n', '<c-t>', ':ClangdSwitchSourceHeader<cr>', { buffer = 0})
    end
}

lspconfig.sumneko_lua.setup {
    capabilities = lib.cmp.capabilities,
    on_attach = lib.map.lsp_register_defaults,
    cmd = {
        '/usr/local/bin/lua-language-server/bin/lua-language-server',
        '-E',
        '/usr/local/bin/lua-language-server/bin/main.lua'
    },
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

lspconfig.jedi_language_server.setup {
    cmd = {'~/.local/bin/jedi-language-server'},
    capabilities = lib.cmp.capabilities,
    on_attach = lib.map.lsp_register_defaults
}
