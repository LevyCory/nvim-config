-- Set Colorscheme
vim.cmd('colorscheme onedark')

-- Set Font
lib.ui.set_font('Consolas NF', 14)

-- Highlight line under cursor
vim.opt.cursorline = true

-- Set ruler
vim.opt.colorcolumn = '120'

-- Set single statusline for all splits
vim.opt.laststatus = 3

-- Enable line numbers
vim.opt.number = true

-- Split vertically to the right
vim.opt.splitright = true

-- Disable mouse
vim.opt.mouse = ''
