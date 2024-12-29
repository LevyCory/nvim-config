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
      theme = 'catppuccin',
      component_separators = '|',
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = {
        { 'mode', separator = { left = '' }, right_padding = 2 },
      },
      lualine_b = { 'filename', 'branch' },
      lualine_c = {},
      lualine_x = {},
      lualine_y = { { attached_lsp_servers, icon = ' LSP:' }, 'filetype', 'progress' },
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
}
