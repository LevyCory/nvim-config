return {
    'nvim-neorg/neorg',
    ft = 'norg',
    build = ':Neorg sync-parsers',
    -- enabled = lib.machine.neorg,
    enabled = false,
    opts = {
        load = {
            ['core.defaults'] = {},
            ['core.norg.concealer'] = {},
            ['core.norg.dirman'] = {
                config = {
                    -- workspaces = lib.machine.neorg.workspaces
                }
            },
            ['core.gtd.base'] = {
                config = {
                    -- workspace = lib.machine.neorg.gtd.workspace
                }
            },
            ['core.integrations.nvim-cmp'] = {},
        }
    }
}
