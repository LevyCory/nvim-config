return {
  -- Needed for configuring nvim-qt
  'equalsraf/neovim-gui-shim',

  -- Colors
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
  },

  -- Rust plugin
  {
    'rust-lang/rust.vim',
    ft = 'rust'
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

  -- Smear cursor
  {
    "sphamba/smear-cursor.nvim",
    event = 'BufReadPost',
    opts = {
      stiffness = 0.8,
      trailing_stiffness = 0.5,
      distance_stop_animating = 0.5,
    },
  }
}
