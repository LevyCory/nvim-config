--     ________      ___          
--    |\   ____\    |\  \         
--    \ \  \___|    \ \  \        
--     \ \  \        \ \  \       
--      \ \  \____  __\ \  \____  
--       \ \_______\\__\ \_______\
--        \|_______\|__|\|_______|
-- 
-- Cory Levy's init.lua

-- Set leader
vim.g.mapleader = ','

-- Set library
lib = require('lib.all')

-- Set up plugins
require 'config.plugins.packer'
require 'config.plugins.nvim-tree'
require 'config.plugins.lualine'
require 'config.plugins.gitsigns'
require 'config.plugins.colorizer'
require 'config.plugins.snap'
require 'config.plugins.lsp'
require 'config.plugins.treesitter'

-- Set up settings
require 'config.remaps'
require 'config.abbreviations'
require 'config.ui'
require 'config.general'

lib.ui.maximize_screen()
