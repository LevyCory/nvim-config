return {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'LspAttach',
    config = function()
        require('trouble').setup()

        vim.keymap.set("n", "<leader>tr", function() require("trouble").toggle() end)
        vim.keymap.set("n", "<leader>wd", function() require("trouble").toggle('workspace_diagnostics') end)
        vim.keymap.set("n", "<leader>dd", function() require("trouble").toggle('document_diagnostics') end)
    end,
}
