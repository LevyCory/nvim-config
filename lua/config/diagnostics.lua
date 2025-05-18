vim.diagnostic.config({
  underline = true,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.HINT] = '',
      [vim.diagnostic.severity.INFO] = '',
    },
  },
})

lib.state.lsp_diagnostic_virtual_text = true
local function lsp_diagnostic_virtual_text_toggle()
  vim.diagnostic.config({
    virtual_text = lib.state.lsp_diagnostic_virtual_text,
  })

  lib.state.lsp_diagnostic_virtual_text = not lib.state.lsp_diagnostic_virtual_text
end

lsp_diagnostic_virtual_text_toggle()
vim.keymap.set('n', '<leader>vt', lsp_diagnostic_virtual_text_toggle, {
  desc = 'LSP: Toggle diagnostics [V]irtual [T]ext'
})
