local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup {}

vim.keymap.set('n', '<c-p>', builtin.find_files)
vim.keymap.set('n', '<leader>ff', builtin.live_grep)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<a-R>', builtin.lsp_references)
