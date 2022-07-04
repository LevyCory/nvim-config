local get_active_lsp = function()
    local lsp = lib.lsp.current_server();
    if lsp == '' then
        return 'No Active LSP'
    end

    return lsp
end

require('lualine').setup {
  options = {
    theme = 'auto',
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch'},
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = {{get_active_lsp, icon=' LSP:'}, 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}
