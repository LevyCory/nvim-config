return {
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
            require('fidget').setup {
                window = {
                    blend = 0,
                },
            }
        end,
    },

    -- Tabline
    {
        'alvarosevilla95/luatab.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        lazy = false,
        config = function()
            require('luatab').setup()
        end
    },

    -- Hex color highlighter
    {
        'norcalli/nvim-colorizer.lua',
        event = 'BufReadPost',
        opts = {}
    }
}
