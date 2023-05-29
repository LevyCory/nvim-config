return {
    'nvim-neorg/neorg',
    enable = false,
    ft = 'norg',
    build = ':Neorg sync-parsers',
    config = function()
        require('neorg').setup {
            load = {
                ['core.defaults'] = {},
                ['core.concealer'] = {},
                ['core.completion'] = {
                    config = {
                        engine = 'nvim-cmp'
                    }
                },
                ['core.integrations.nvim-cmp'] = {},
                ['core.dirman'] = {
                    config = {
                        wokrspaces = {
                            work = '~/docs',
                        },
                        index = 'index.norg'
                    },
                },
            }
        }
    end
}
