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
        event = {
            'BufReadPost',
            'BufNewFile',
        },
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
        config = function()
            require('colorizer').setup()
        end
    },

    -- Automatically insert closing brackets/braces/quotes
    {
        'windwp/nvim-autopairs',
        version = false,
        event = {
            'BufReadPost',
            'BufNewFile',
        },
        config = function()
            require('nvim-autopairs').setup()
        end
    },

    -- Leap (EasyMotion for NeoVim)
    {
        'ggandor/leap.nvim',
        lazy = false,
        config = function()
            require('leap').add_default_mappings()
        end
    },

    {
        "https://github.com/apple/pkl-neovim",
        lazy = true,
        event = {
            "BufReadPre *.pkl",
            "BufNewFile *.pkl"
        },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        build = function()
            vim.cmd("TSInstall! pkl")
        end,
    },
}
