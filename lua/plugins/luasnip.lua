return {
  'L3MON4D3/LuaSnip',
  config = function()
    local luasnip = require('luasnip')

    luasnip.config.set_config {
      history = true,
      updateevents = 'TextChanged,TextChangedI',
      enable_autosnippets = true
    }

    -- Set snippet expansion key
    -- TODO: Maybe set something less overused than tab
    vim.keymap.set({ 'i', 's' }, '<C-k>', function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { silent = true }
    )

    -- Load Snippets
    require 'snippets.cpp'
    require 'snippets.python'
  end
}
