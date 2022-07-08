local lspconfig = require('lspconfig')

if lib.os.opt.lsp.clangd then
    lspconfig.clangd.setup {
        capabilities = lib.cmp.capabilities,
        on_attach = function()
            lib.map.lsp_register_defaults()
            vim.keymap.set('n', '<c-t>', ':ClangdSwitchSourceHeader<cr>', { buffer = 0})
        end
    }
end

if lib.os.opt.lsp.sumneko_lua then
    lspconfig.sumneko_lua.setup {
        capabilities = lib.cmp.capabilities,
        on_attach = lib.map.lsp_register_defaults,
        cmd = lib.os.opt.lsp.sumneko_lua.cmd ,
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT'
                },
                diagnostics = {
                    globals = {'vim', 'use', 'next', 'ipairs'}
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

if lib.os.opt.lsp.jedi_language_server then
    lspconfig.jedi_language_server.setup {
        cmd = lib.os.opt.lsp.jedi_language_server.cmd,
        capabilities = lib.cmp.capabilities,
        on_attach = lib.map.lsp_register_defaults
    }
end

-- Get attached LSP name
lib.lsp = {
    current_server = function()
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return ''
        end

        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end

        return ''
    end
}
