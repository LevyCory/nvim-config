local luasnip = require('luasnip')
local snippet = luasnip.s
local text = luasnip.text_node
local insert = luasnip.insert_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

luasnip.add_snippets('cpp', {
  snippet('str', { text('std::string') }),
  snippet('cstr', { text('const std::string') }),
  snippet('cstrr', { text('const std::string&') }),
  snippet('wstr', { text('std::wstring') }),
  snippet('wcstr', { text('const std::wstring') }),
  snippet('wcstrr', { text('const std::wstring&') }),
  snippet('vec', fmt('std::vector<{}>', { insert(0, 'type') })),
  snippet('umap', fmt('std::unordered_map<{}, {}>', { insert(1, 'key'), insert(2, 'value') })),
  snippet('cctor', fmt('{}(const {}&) = delete;', { insert(1, 'class'), rep(1) })),
  snippet('casop', fmt('{}& operatpr=(const {}&) = delete;', { insert(1, 'class'), rep(1) })),
  snippet('mctor', fmt('{}({}&&) noexcept = default;', { insert(1, 'class'), rep(1) })),
  snippet('masop', fmt('{}& operator=({}&&) noexcept = default;', { insert(1, 'class'), rep(1) })),
  snippet('print', fmt('std::cout << "{}" << std::endl', { insert(0, 'text') }))
})
