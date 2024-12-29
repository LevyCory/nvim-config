vim.keymap.set('n', '<c-t>', ':ClangdSwitchSourceHeader<cr>', {
  silent = true,
  desc = 'LSP: Toggle header/source'
})
