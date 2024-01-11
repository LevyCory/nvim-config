return {
    'nvim-telescope/telescope.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    lazy = false,
    config = function()
        local actions = require('telescope.actions')
        local trouble = require('trouble.providers.telescope')

        require('telescope').setup {
            defaults = {
                file_ignore_patterns = {
                    '.git/',
                    '.cache/',
                    'target/',
                    '%.o',
                    '%.a',
                    'externals/*',
                    '3rd_parties/*',
                    '3rd_party/*',
                },
                mappings = {
                    i = {
                        ['<esc>'] = actions.close,
                        -- Clear prompt
                        ['<c-u>'] = false,
                        -- Delete buffer
                        ['<c-d>'] = actions.delete_buffer + actions.move_to_top,
                        -- Cycle previews for git commit to show the full message
                        ['<C-s>'] = actions.cycle_previewers_next,
                        ['<C-a>'] = actions.cycle_previewers_prev,
                        -- Open results in trouble
                        ['<C-t>'] = trouble.open_with_trouble,
                    },
                    n = {
                        ['<C-t>'] = trouble.open_with_trouble,
                    },
                },
                vimgrep_arguments = {
                    'rg',
                    '--color=never',
                    '--no-heading',
                    '--with-filename',
                    '--line-number',
                    '--column',
                    '--smart-case',
                    '--trim' -- add this value
                },
            },
            pickers = {
                find_files = {
                    theme = 'ivy',
                    previewer = false
                },
            },
        }

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
