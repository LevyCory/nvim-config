-- Tab Control
lib.map.nnoremap('tl', ':tabn<cr>')
lib.map.nnoremap('th', ':tabp<cr>')
lib.map.nnoremap('tn', ':tabe<cr>')
lib.map.nnoremap('tN', ':-1tabe<cr>')
lib.map.nnoremap('tL', ':tablast<cr>')
lib.map.nnoremap('tH', ':tabfirst<cr>')
lib.map.nnoremap('tt', ':tabe<space>')

-- Pane movement
lib.map.nnoremap('<c-j>', '<c-w>j')
lib.map.nnoremap('<c-k>', '<c-w>k')
lib.map.nnoremap('<c-h>', '<c-w>h')
lib.map.nnoremap('<c-l>', '<c-w>l')

-- Split resize
lib.map.nnoremap('<a-k>', ':resize +1<CR>')
lib.map.nnoremap('<a-j>', ':resize -1<CR>')
lib.map.nnoremap('<a-h>',  ':vertical resize +1<CR>')
lib.map.nnoremap('<a-l>', ':vertical resize -1<CR>')

-- Insert mode movements
lib.map.inoremap('<a-j>', '<c-o>j')
lib.map.inoremap('<a-k>', '<c-o>k')
lib.map.inoremap('<a-h>', '<c-o>h')
lib.map.inoremap('<a-l>', '<c-o>l')

-- Spell checker
vim.keymap.set('n', '<F2>', ':set spell!<CR>', { desc = 'Toggle spell checker' })
vim.keymap.set('n', '<F3>', 'zg', { desc = 'Spell: Mark word as correct' })
vim.keymap.set('n', '<F4>', 'zw', { desc = 'Spell: Mark word as correct' })
vim.keymap.set('n', '<F5>', 'z=', { desc = 'Spell: Suggest word' })

-- Move around lines visually
lib.map.nnoremap('j', 'gj')
lib.map.nnoremap('k', 'gk')

-- General remaps
lib.map.inoremap('jj', '<esc>')

-- Font size control
vim.keymap.set('n', '<m-=>', lib.ui.increase_font_size, { desc = 'Increase editor font size' })
vim.keymap.set('n', '<m-->', lib.ui.decrease_font_size, { desc = 'Decrease editor font size' })

-- Terminal control
vim.keymap.set('n', '<leader>tt', ':vs | :term<cr>', { desc = 'Open terminal' })
lib.map.tnoremap('<Esc>', '<c-\\><c-n>')
lib.map.tnoremap('<c-[>', '<c-\\><c-n>')
lib.map.tnoremap('<a-[>', '<Esc>')
lib.map.tnoremap('<c-h>', '<c-\\><c-n><c-w>h')
lib.map.tnoremap('<c-j>', '<c-\\><c-n><c-w>j')
lib.map.tnoremap('<c-k>', '<c-\\><c-n><c-w>k')
lib.map.tnoremap('<c-l>', '<c-\\><c-n><c-w>l')

-- Search
lib.map.nnoremap('<tab><tab>', ':nohlsearch<cr>')

-- Disable cmdline history
lib.map.nnoremap('q:', '<nop>')
