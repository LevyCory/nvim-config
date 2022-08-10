local header = [[
███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝
]]

require('mini.sessions').setup({
  autoread = false,
  autowrite = false,
  directory =  lib.os.path.join(lib.os.data_dir, 'session'),
  file = 'session.vim',
})

local starter = require('mini.starter')
starter.setup({
    items = {
        starter.sections.builtin_actions(),
        starter.sections.recent_files(10, false),
        starter.sections.recent_files(10, true),
        starter.sections.sessions(20, true),
    },
    content_hooks = {
        starter.gen_hook.adding_bullet(),
        starter.gen_hook.indexing('all', { 'Builtin actions' }),
        starter.gen_hook.padding(3, 2),
    },
    header = header
})

local function save_session()
    local session_name = vim.fn.fnamemodify(vim.v.this_session, ':t')
    if session_name == nil then
        MiniSessions.write('', {})
    else
        MiniSessions.write(session_name, {})
    end
end

local function close_session()
    save_session()
    MiniStarter.open(-1)
end

local function test(str)
   print(str) 
end

vim.api.nvim_create_user_command("SC", close_session, {})
vim.api.nvim_create_user_command("SS", save_session, {})
vim.api.nvim_create_user_command("Cory", test, {})

