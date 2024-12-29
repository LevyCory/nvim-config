local luasnip = require('luasnip')
local snippet = luasnip.s
local text = luasnip.text_node

luasnip.add_snippets('python', {
  snippet('pdb', { text('import pdb; pdb.set_trace()') })
})
