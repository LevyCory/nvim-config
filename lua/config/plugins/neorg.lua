if lib.machine.neorg then
    require('neorg').setup {
        load = {
            ['core.defaults'] = {},
            ['core.norg.concealer'] = {},
            ['core.norg.dirman'] = {
                config = {
                    workspaces = lib.machine.neorg.workspaces
                }
            },
            ['core.gtd.base'] = {
                config = {
                    workspace = lib.machine.neorg.gtd.workspace
                }
            },
            ['core.integrations.nvim-cmp'] = {},
        }
    }
end
