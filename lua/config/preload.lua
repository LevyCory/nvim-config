-- Initialize the common library
lib = require('lib.all')

-- Set platform settings
lib.platform = lib.os.get_platform_settings()

-- Required for some plugins
vim.opt.termguicolors = true
