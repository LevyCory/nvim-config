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
