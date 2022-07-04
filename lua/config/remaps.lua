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

-- Put those arrow keys to good use
lib.map.nnoremap('<Up>', ':resize -1<CR>')
lib.map.nnoremap('<Down>', ':resize +1<CR>')
lib.map.nnoremap('<Left>',  ':vertical resize +1<CR>')
lib.map.nnoremap('<Right>', ':vertical resize -1<CR>')

lib.map.nnoremap('<a-k>', ':resize -1<CR>')
lib.map.nnoremap('<a-j>', ':resize +1<CR>')
lib.map.nnoremap('<a-h>',  ':vertical resize +1<CR>')
lib.map.nnoremap('<a-l>', ':vertical resize -1<CR>')


-- Insert mode movements
lib.map.inoremap('<c-j>', '<c-o>j')
lib.map.inoremap('<c-k>', '<c-o>k')
lib.map.inoremap('<c-h>', '<c-o>h')
lib.map.inoremap('<c-l>', '<c-o>l')

-- Move around lines visually
lib.map.nnoremap('j', 'gj')
lib.map.nnoremap('k', 'gk')

-- General remaps
lib.map.nnoremap('<c-X>', 'ZZ')
lib.map.inoremap('jj', '<esc>')

-- Terminal control
lib.map.nnoremap('<leader>tt', ':vs | :term<cr>')
lib.map.tnoremap('<Esc>', '<c-\\><c-n>')
lib.map.tnoremap('<c-[>', '<c-\\><c-n>')
lib.map.tnoremap('<a-[>', '<Esc>')
lib.map.tnoremap('<c-h>', '<c-\\><c-n><c-w>h')
lib.map.tnoremap('<c-j>', '<c-\\><c-n><c-w>j')
lib.map.tnoremap('<c-k>', '<c-\\><c-n><c-w>k')
lib.map.tnoremap('<c-l>', '<c-\\><c-n><c-w>l')

-- Edit config
local config_dir = vim.fn.stdpath('config')
local config_cmd = ':tabnew %s <cr>'
lib.map.nnoremap('<leader>ev', config_cmd:format(config_dir))
lib.map.nnoremap('<leader>sv', ':source $MYVIMRC<cr>')

-- Search
lib.map.nnoremap('<tab><tab>', ':nohlsearch<cr>')

-- LSP server maps
lib.map.lsp_register_defaults = function()
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0})
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { buffer = 0})
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { buffer = 0})
    vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition, { buffer = 0})
    vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { buffer = 0})
    vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, { buffer = 0})
    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { buffer = 0})
end
