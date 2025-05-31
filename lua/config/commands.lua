-- TODO: Remove when vim.lsp.config gets thier shit together
vim.api.nvim_create_user_command('LspClangdSwitchSourceHeader', function()
  lib.lsp.clangd_switch_source_header(0)
end, { desc = 'Switch between source/header' })

vim.api.nvim_create_user_command('LspClangdShowSymbolInfo', function()
  lib.lsp.clangd_symbol_info()
end, { desc = 'Show symbol info' })
