require('neorg').setup {
    load = {
        ['core.defaults'] = {},
        ['core.norg.concealer'] = {},
        ['core.norg.dirman'] = {
            config = {
                workspaces = {
                    home = '~/org',
                }
            }
        },
        ['core.gtd.base'] = {
            config = {
                workspace = 'home'
            }
        },
        ['core.integrations.nvim-cmp'] = {},
    }
}
