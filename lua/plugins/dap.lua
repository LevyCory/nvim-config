local function dap_map(binding, cmd, desc)
    vim.api.nvim_set_keymap('n', binding, cmd, { noremap = true, silent = true, desc = 'DAP: ' .. desc })
end

return {
    {
        'mfussenegger/nvim-dap',
        config = function()
            dap_map('<F5>', '<cmd>:DapContinue<CR>', 'Start/Continue')
            dap_map('<F9>', '<cmd>:DapToggleBreakpoint<CR>', 'Toggle Breakpoint')
            dap_map('<F10>', '<cmd>:DapStepOver<CR>', 'Step Over')
            dap_map('<F11>', '<cmd>:DapStepInto<CR>', 'Step Into')
            dap_map('<F12>', '<cmd>:DapStepOut<CR>', 'Step Out')

            vim.fn.sign_define('DapBreakpoint', {text='•', texthl='red', linehl='', numhl=''})
        end,
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = 'mfussenegger/nvim-dap',
        config = function()
            local dap = require('dap')
            local ui = require('dapui')

            ui.setup()
            dap.listeners.after.event_initialized['dapui_config'] = function()
                ui.open()
            end
            dap.listeners.before.event_terminated['dapui_config'] = function()
                ui.close()
            end
            dap.listeners.before.event_exited['dapui_config'] = function()
                ui.close()
            end

        end
    },
    {
        'mfussenegger/nvim-dap-python',
        dependencies = {
            'mfussenegger/nvim-dap',
            'rcarriga/nvim-dap-ui',
        },
        ft = 'python',
        config = function()
            if vim.fn.environ()['NVIM_PYTHON_PATH'] then
                require('dap-python').setup(vim.fn.environ()['NVIM_PYTHON_PATH'])
            end
        end,
    },
    {
        'nvim-telescope/telescope-dap.nvim',
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-telescope/telescope.nvim',
        },
        config = function()
            require('telescope').load_extension('dap')

            dap_map('<leader>bp', require('telescope').extensions.dap.list_breakpoints, 'List Breakpoints')
            dap_map('<leader>sf', require('telescope').extensions.dap.frames, 'List Breakpoints')
        end,
    },
}
