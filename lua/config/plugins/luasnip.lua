lib.luasnip = require('luasnip')

local snippet = lib.luasnip.s
local text = lib.luasnip.text_node
local insert = lib.luasnip.insert_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

lib.luasnip.config.set_config {
    history = true,
    updateevents = 'TextChanged,TextChangedI',
    enable_autosnippets = true
}

lib.luasnip.add_snippets('cpp', {
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

lib.luasnip.add_snippets('python', {
    snippet('pdb', { text('import pdb; pdb.set_trace()') })
})

-- Set snippet expansion key
-- TODO: Maybe set to something less overused than tab
vim.keymap.set({ 'i', 's'}, '<C-k>', function()
        if lib.luasnip.expand_or_jumpable() then
            lib.luasnip.expand_or_jump()
        end
    end, { silent = true }
)

-- Snippet Debugging
lib.luasnip.add_snippets('all', {
})

-- Reload this file with a mapping for easier debugging
local cmd = '<cmd>source %s<cr>'
local luasnip_path = lib.os.path.join(lib.os.config_dir, 'lua', 'config', 'plugins', 'lib.luasnip.lua')
vim.keymap.set('n', '<leader><leader>s', cmd:format(luasnip_path))
