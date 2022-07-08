--     ________      ___          
--    |\   ____\    |\  \         
--    \ \  \___|    \ \  \        
--     \ \  \        \ \  \       
--      \ \  \____  __\ \  \____  
--       \ \_______\\__\ \_______\
--        \|_______\|__|\|_______|
-- 
-- Cory Levy's Neovim Config

-- Set leader
vim.g.mapleader = ','

-- Call preload config
require 'config.preload'

-- Set up plugins
require 'config.plugins.packer'
require 'config.plugins.nvim-cmp'
require 'config.plugins.lsp'
require 'config.plugins.nvim-tree'
require 'config.plugins.gitsigns'
require 'config.plugins.colorizer'
require 'config.plugins.telescope'
require 'config.plugins.treesitter'
require 'config.plugins.lualine'
require 'config.plugins.luasnip'
require 'config.plugins.comment'

-- Set up settings
require 'config.remaps'
require 'config.abbreviations'
require 'config.ui'
require 'config.general'

-- Call postload config
require 'config.postload'
