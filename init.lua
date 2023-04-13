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
require 'config.lazy'
require 'config.neovide'

-- Set up settings
require 'config.mappings'
require 'config.abbreviations'
require 'config.ui'
require 'config.root'
require 'config.general'

-- Call postload config
require 'config.postload'
