lspconfig = require('lspconfig')

lspconfig.clangd.setup {
    capabilities = lib.cmp.capabilities,
    on_attach = function()
        lib.map.lsp_register_defaults()
        vim.keymap.set('n', '<c-t>', ':ClangdSwitchSourceHeader<cr>', { buffer = 0})
    end
}
