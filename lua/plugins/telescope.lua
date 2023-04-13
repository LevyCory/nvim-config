return {
    'nvim-telescope/telescope.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    opts = {
        file_ignore_patterns = {
            '*target/*',
        }
    },
    lazy = false,
    config = function()
        local function telescope_map(shortcut, func, desc)
            vim.keymap.set('n', shortcut, func, { desc = 'Telescope: ' .. desc })
        end

        local builtin = require('telescope.builtin')
        telescope_map('<c-p>', builtin.find_files, 'find files in project')
        telescope_map('<leader>ff', builtin.live_grep, 'grep in project')
        telescope_map('<leader>fb', builtin.buffers, 'find buffers')
        telescope_map('<leader>cmd', builtin.commands, 'search commands')
        telescope_map('<leader>/', builtin.current_buffer_fuzzy_find, 'find in current buffer')
        telescope_map('<leader>sh', builtin.search_history, 'show search history')
        telescope_map('<leader>gs', builtin.git_status, 'git status')
        telescope_map('<leader>gc', builtin.git_commits, 'git commits')
        telescope_map('<leader>gbc', builtin.git_bcommits, 'list commits for current buffer')
        telescope_map('<leader>gf', builtin.git_files, 'find files tracked by git')
        telescope_map('<leader>gS', builtin.git_stash, 'search stashes')
        telescope_map('<leader>reg', builtin.registers, 'search registers')
        telescope_map('<leader>k', builtin.keymaps, 'view keymaps')
    end
}
