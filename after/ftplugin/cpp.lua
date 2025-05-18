vim.keymap.set('n', '<c-t>', ':LspClangdSwitchSourceHeader<cr>', {
  silent = true,
  desc = 'LSP: Toggle header/source'
})

vim.keymap.set('n', '<leader>si', ':LspClangdShowSymbolInfo<cr>', {
  silent = true,
  desc = 'LSP: Show symbol info'
})
