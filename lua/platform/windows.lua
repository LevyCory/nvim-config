return {
    lsp = {
        sumneko_lua = {
            enabled = true,
            cmd = {
                'C:\\langsrv\\lua-language-server\\bin\\lua-language-server',
                '-E',
                'C:\\langsrv\\lua-language-server\\bin\\main.lua',
            }
        },
        jedi_language_server = {
            enabled = true,
            cmd = {
                'jedi-language-server'
            }
        }
    }
}
