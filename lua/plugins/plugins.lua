return {
  -- Needed for configuring nvim-qt
  'equalsraf/neovim-gui-shim',

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

  -- Leap (EasyMotion for NeoVim)
  {
    'ggandor/leap.nvim',
    lazy = false,
    config = function()
      require('leap').add_default_mappings()
    end
  },

  -- Pretty Markdown
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons'
    },
    opts = {},
  }
}
