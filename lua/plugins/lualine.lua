local function get_attached_lsp_servers()
  local clients = vim.lsp.get_clients()
  if next(clients) == nil then
    return {}
  end

  local buf_ft = vim.api.nvim_get_option_value('filetype', { scope = 'local' })

  local servers = {}
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      table.insert(servers, client.name)
    end
  end

  return servers
end

local function attached_lsp_servers()
  local servers = get_attached_lsp_servers()
  if next(servers) == nil then
    return 'No Active LSP'
  end

  return table.concat(servers, ', ')
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  lazy = false,
  opts = {
    options = {
      theme = 'auto',
      component_separators = {
        left = '',
        right = '',
      },
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = {
        { 'mode', separator = { left = '', right = '' }, right_padding = 2 },
      },
      lualine_b = { 'branch', 'filename' },
      lualine_c = {},
      lualine_x = {},
      lualine_y = { { attached_lsp_servers, icon = ' LSP:' }, 'filetype', 'progress' },
      lualine_z = {
        { 'location', separator = { left = '', right = '' }, left_padding = 0 },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = { 'filename' },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {},
  }
}
