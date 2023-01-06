local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup {}

local function map_telescope(shortcut, func, desc)
    vim.keymap.set('n', shortcut, func, { desc = 'Telescope: ' .. desc })
end

map_telescope('<c-p>', builtin.find_files, 'find files in project')
map_telescope('<leader>ff', builtin.live_grep, 'grep in project')
map_telescope('<leader>fb', builtin.buffers, 'find buffers')
map_telescope('<leader>cmd', builtin.commands, 'search commands')
map_telescope('<leader>/', builtin.current_buffer_fuzzy_find, 'find in current buffer')
map_telescope('<leader>sh', builtin.search_history, 'show search history')
map_telescope('<leader>gs', builtin.git_status, 'git status')
map_telescope('<leader>gc', builtin.git_commits, 'git commits')
map_telescope('<leader>gbc', builtin.git_bcommits, 'list commits for current buffer')
map_telescope('<leader>gf', builtin.git_files, 'find files tracked by git')
map_telescope('<leader>gS', builtin.git_stash, 'search stashes')
map_telescope('<leader>reg', builtin.registers, 'search registers')
map_telescope('<leader>k', builtin.keymaps, 'view keymaps')

