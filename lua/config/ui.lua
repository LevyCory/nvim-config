-- Set Colorscheme
vim.cmd('colorscheme hybrid')

-- Set Font
lib.ui.set_font('Consolas NF:h14')

-- For Neovide:
-- vim.opt.guifont = {"Consolas NF", "h14"}

-- Highlight line under cursor
vim.opt.cursorline = true

-- Set ruler
vim.opt.colorcolumn = '120'

-- Enable line numbers
vim.opt.number = true

-- Split vertically to the right
vim.opt.splitright = true

-- Disable mouse
vim.opt.mouse = ''

-- Support terminal colors
vim.opt.termguicolors = true
