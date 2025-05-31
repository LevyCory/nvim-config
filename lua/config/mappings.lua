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
vim.keymap.set('n', '<a-h>', ':vertical resize +1<CR>')
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

-- Map LSP related shortcuts on LspAttach
local function setup_lsp_mappings(args)
  local buffer = args['buf']

  local lsp_nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { buffer = buffer, desc = desc })
  end

  lsp_nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  lsp_nmap('<leader>a', vim.lsp.buf.code_action, '[C]ode [A]ction')
  lsp_nmap('<leader>gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  lsp_nmap('<leader>gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  lsp_nmap('<leader>gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  lsp_nmap('<leader>td', vim.lsp.buf.type_definition, 'Type [D]efinition')
  lsp_nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  lsp_nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  lsp_nmap('<leader>oc', require('telescope.builtin').lsp_outgoing_calls, '[O]utgoing [C]alls')
  lsp_nmap('<leader>ic', require('telescope.builtin').lsp_incoming_calls, '[I]ncoming [C]alls')

  -- See `:help K` for why this keymap
  lsp_nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  lsp_nmap('<M-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  lsp_nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  lsp_nmap(
    '<leader>wl',
    function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end,
    '[W]orkspace [L]ist Folders'
  )

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(buffer, 'Format', function(_)
    if vim.lsp.buf.format then
      vim.lsp.buf.format()
    elseif vim.lsp.buf.formatting then
      vim.lsp.buf.formatting()
    end
  end, { desc = 'Format current buffer with LSP' })

end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = setup_lsp_mappings,
})
