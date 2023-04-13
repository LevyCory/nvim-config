return {
    -- Mason
    -- 'williamboman/mason.nvim',
    -- 'williamboman/mason-lspconfig.nvim',

    -- LSP
    -- 'neovim/nvim-lspconfig',

    -- Snippets
    -- 'L3MON4D3/LuaSnip',
    -- 'saadparwaiz1/cmp_luasnip',

    -- Autocomplete
    -- {
    --     'hrsh7th/nvim-cmp',
    --     dependencies = {
    --         'hrsh7th/cmp-nvim-lsp',
    --         'hrsh7th/cmp-nvim-lua',
    --         'hrsh7th/cmp-buffer',
    --         'hrsh7th/cmp-path',
    --         'hrsh7th/cmp-cmdline'
    --     }
    -- },

    -- Needed for configuring nvim-qt
    'equalsraf/neovim-gui-shim',

    -- Rust plugin
    {
        'rust-lang/rust.vim',
        ft = 'rust'
    },

    -- Comment and uncomment code easily
    {
        'numToStr/Comment.nvim',
        event = 'BufReadPost',
        opts = {}
    },

    -- LSP status spinner
    {
        'j-hui/fidget.nvim',
        event = 'LspAttach',
        config = function()
            require('fidget').setup {}
        end,
    },

    -- Hex color highlighter
    {
        'norcalli/nvim-colorizer.lua',
        event = 'BufReadPost',
        opts = {}
    }
}
