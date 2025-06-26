return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim",
  },
  config = function()
    local fzf = require('fzf-lua')

    local function ignore_file()
      return lib.os.path.join(
        vim.fn.stdpath('config'),
        'resources',
        'vim-ignore'
      )
    end

    fzf.setup {
      -- Start fzf without the preview window
      winopts = {
        preview = {
          hidden = vim.api.nvim_win_get_width(0) < 130
        }
      },

      files = {
        git_icons = true,
        fd_opts = table.concat({
          '--color=never',
          '--type f',
          '--hidden',
          '--follow',
          '--ignore-file',
          ignore_file()
        }, ' ')
      },
    }

    local function fzf_map(shortcut, func, desc)
      if func == nil then
        print(shortcut)
      end
      vim.keymap.set('n', shortcut, func, { desc = 'FzfLua: ' .. desc })
    end

    fzf_map('<c-p>', fzf.files, 'find files in project')
    fzf_map('<leader>ff', fzf.live_grep, 'grep in project')
    fzf_map('<leader>fh', fzf.helptags, 'grep in project')
    fzf_map('<leader>b', fzf.buffers, 'find buffers')
    fzf_map('<leader>cmd', fzf.commands, 'search commands')
    fzf_map('<leader>/', fzf.grep_curbuf, 'find in current buffer')
    fzf_map('<leader>sh', fzf.search_history, 'show search history')
    fzf_map('<leader>gs', fzf.git_status, 'git status')
    fzf_map('<leader>gc', fzf.git_commits, 'git commits')
    fzf_map('<leader>gbc', fzf.git_bcommits, 'list commits for current buffer')
    fzf_map('<leader>gf', fzf.git_files, 'find files tracked by git')
    fzf_map('<leader>gS', fzf.git_stash, 'search stashes')
    fzf_map('<leader>reg', fzf.registers, 'search registers')
    fzf_map('<leader>k', fzf.keymaps, 'view keymaps')
    fzf_map('<leader>m', fzf.marks, 'view marks')
    fzf_map('<leader>j', fzf.jumps, 'view jumplist')
    fzf_map('<leader>nvo', fzf.nvim_options, 'search NeoVim options')
    fzf_map('~', fzf.resume, 'Resume last fzf session')
  end
}
