M = {}

local function noremap(mode, binding, cmd)
    vim.api.nvim_set_keymap(mode, binding,  cmd, { noremap = true, silent = true })
end

function M.nnoremap(binding, cmd)
    noremap('n', binding, cmd)
end

function M.inoremap(binding, cmd)
    noremap('i', binding, cmd)
end

function M.tnoremap(binding, cmd)
    noremap('t', binding, cmd)
end

return M
