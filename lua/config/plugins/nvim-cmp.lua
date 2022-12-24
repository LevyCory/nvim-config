local cmp = require('cmp')

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

cmp.setup {
    snippet = {
        expand = function(args)
            lib.luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif lib.luasnip.expand_or_jumpable() then
                lib.luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif lib.luasnip.jumpable(-1) then
                lib.luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'luasnip' }
    }, {
        { name = 'buffer' },
        { name = 'neorg' },
        { name = 'path' },
    },
}

lib.cmp = { capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()) }
