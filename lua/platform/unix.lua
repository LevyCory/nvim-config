return {
    shell = '/bin/zsh',
    lsp = {
        sumneko_lua = {
            enabled = true,
            cmd = {
                '/usr/local/bin/lua-language-server/bin/lua-language-server',
                '-E',
                '/usr/local/bin/lua-language-server/bin/main.lua'
            }
        },
        clangd = {
            enabled = true
        },
        jedi_language_server = {
            enabled = true,
            cmd = {
                -- '~/.local/bin/jedi-language-server'
                '~/.jedi'
            },
        }
    }
}
