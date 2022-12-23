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
    end,

    on_attach = function(_, buffer_number)
        local lsp_map = function(keys, func, desc)
            if desc then
                desc = 'LSP: ' .. desc
            end

            vim.keymap.set('n', keys, func, { buffer = buffer_number, desc = desc })
        end

        lsp_map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        lsp_map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        lsp_map('<leader>gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        lsp_map('<leader>gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        lsp_map('<leader>gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
        lsp_map('<leader>td', vim.lsp.buf.type_definition, 'Type [D]efinition')
        lsp_map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        lsp_map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        -- See `:help K` for why this keymap
        lsp_map('K', vim.lsp.buf.hover, 'Hover Documentation')
        lsp_map('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

        -- Lesser used LSP functionality
        lsp_map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        lsp_map('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
        lsp_map('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
        lsp_map('<leader>wl', function()
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
    end
}

-- Install language servers
require('mason-lspconfig').setup {
    ensure_installed = {
        'clangd',
        'rust_analyzer',
        'pyright',
        'sumneko_lua'
    }
}

-- Default LSP configuration
local function default_setup(lsp_server)
    require('lspconfig')[lsp_server].setup {
        on_attach = lib.lsp.on_attach,
        capabilities = lib.cmp.capabilities
    }
end

default_setup('pyright')
default_setup('rust_analyzer')

-- Custom LSP configuration
require('lspconfig').clangd.setup {
    capabilities = lib.cmp.capabilities,
    on_attach = function(_, buffer_number)
        lib.lsp.on_attach(_, buffer_number)
        vim.keymap.set('n', '<c-t>', ':ClangdSwitchSourceHeader<cr>', {
            buffer = buffer_number,
            silent = true,
            desc = 'LSP: Toggle header/source'
        })
    end
}

require('lspconfig').sumneko_lua.setup {
    capabilities = lib.cmp.capabilities,
    on_attach = lib.lsp.on_attach,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT'
            },
            diagnostics = {
                globals = { 'vim', 'use', 'next', 'ipairs' }
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
