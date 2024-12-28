-- Search as characters are entered
vim.opt.incsearch = true

-- Highlight matches
vim.opt.hlsearch = true

-- Case insensitive, unless a capital letter is searched for
vim.opt.smartcase = true

-- Auto read modified files
vim.opt.autoread = true

-- Make tabs be 4 spaces wide
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Be smart about tabs
vim.opt.ai = true
vim.opt.wrap = true

-- Save undo history
vim.opt.undofile = true

-- Don't redraw buffer while macros are running
vim.opt.lazyredraw = true

-- Disable the default keyword completion
vim.opt.completeopt = {}

-- Ignore garbage files
vim.opt.wildignore = {
  '*.swp',
  '*.o',
  '*.pyc',
  '*.a',
  '*.obj'
}

-- Make backspace behave like you'd expect
vim.opt.backspace = { 'indent', 'eol', 'start' }

-- Set shell
if vim.fn.environ()['SHELL'] ~= nil then
  vim.opt.shell = vim.fn.environ()['SHELL']
end
