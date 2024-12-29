-- Tab Control
vim.keymap.set('n', 'tl', ':tabn<cr>')
vim.keymap.set('n', 'th', ':tabp<cr>')
vim.keymap.set('n', 'tn', ':tabe<cr>')
vim.keymap.set('n', 'tN', ':-1tabe<cr>')
vim.keymap.set('n', 'tL', ':tablast<cr>')
vim.keymap.set('n', 'tH', ':tabfirst<cr>')
vim.keymap.set('n', 'tt', ':tabe<space>')

-- Pane movement
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-l>', '<c-w>l')

-- Split resize
vim.keymap.set('n', '<a-k>', ':resize +1<CR>')
vim.keymap.set('n', '<a-j>', ':resize -1<CR>')
vim.keymap.set('n', '<a-h>',  ':vertical resize +1<CR>')
vim.keymap.set('n', '<a-l>', ':vertical resize -1<CR>')

-- Insert mode movements
vim.keymap.set('i', '<a-j>', '<c-o>j')
vim.keymap.set('i', '<a-k>', '<c-o>k')
vim.keymap.set('i', '<a-h>', '<c-o>h')
vim.keymap.set('i', '<a-l>', '<c-o>l')

-- Spell checker
vim.keymap.set('n', '<leader>SS', ':set spell!<CR>', { desc = 'Spell: Toggle spell checker' })
vim.keymap.set('n', '<leader>cw', 'zg', { desc = 'Spell: Mark word as correct' })
vim.keymap.set('n', '<leader>iw', 'zw', { desc = 'Spell: Mark word as incorrect' })
vim.keymap.set('n', '<suggest>?', 'z=', { desc = 'Spell: Suggest word' })

-- Move around lines visually
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- General remaps
vim.keymap.set('i', 'jj', '<esc>')

-- Font size control
vim.keymap.set('n', '<m-=>', lib.ui.increase_font_size, { desc = 'Increase editor font size' })
vim.keymap.set('n', '<m-->', lib.ui.decrease_font_size, { desc = 'Decrease editor font size' })

-- Terminal control
vim.keymap.set('n', '<leader>tt', ':vs | :term<cr>', { desc = 'Open terminal' })
vim.keymap.set('t', '<Esc>', '<c-\\><c-n>')
vim.keymap.set('t', '<c-[>', '<c-\\><c-n>')
vim.keymap.set('t', '<a-[>', '<Esc>')
vim.keymap.set('t', '<c-h>', '<c-\\><c-n><c-w>h')
vim.keymap.set('t', '<c-j>', '<c-\\><c-n><c-w>j')
vim.keymap.set('t', '<c-k>', '<c-\\><c-n><c-w>k')
vim.keymap.set('t', '<c-l>', '<c-\\><c-n><c-w>l')

-- Search
vim.keymap.set('n', '<tab><tab>', ':nohlsearch<cr>')

-- Disable cmdline history
vim.keymap.set('n', 'q:', '<nop>')

-- Disable default completion menu
vim.keymap.set('i', '<c-n>', '<nop>')
vim.keymap.set('i', '<c-p>', '<nop>')

-- Disable arrows (to be used with nvim-cmp)
vim.keymap.set('i', '<Up>', '<nop>')
vim.keymap.set('i', '<Down>', '<nop>')
vim.keymap.set('i', '<Left>', '<nop>')
vim.keymap.set('i', '<Right>', '<nop>')
