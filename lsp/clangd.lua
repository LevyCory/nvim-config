return {
  root_markers = {
    '.clangd',
    'compile_commands.json',
  },
  cmd = {
    'clangd',
    '--background-index',
    '--header-insertion=never',
    '--fallback-style=google',
    '--header-insertion-decorators',
    '--all-scopes-completion',
  },
  filetypes = {
    'c',
    'cpp',
    'h',
    'hpp',
    'hxx',
  },
}
