M = {
    path = {
        -- Platform specific path delimeter
        separator = package.config:sub(1, 1),

        -- Platform specific path join
        join = function (...)
            return table.concat({...}, package.config:sub(1, 1))
        end,
        --
        -- Path separator consts
        UNIX = '/',
        WINDOWS = '\\'
    },

    is_windows = function ()
        return M.path.separator == M.path.WINDOWS
    end,
    is_unix = function ()
        return M.path.separator == M.path.UNIX
    end,

    -- Set config directory
    config_dir = vim.fn.stdpath('config')
}

-- Load platform specific settings
if M.is_windows then
    M.opt = require('platform.windows')
end

if M.is_unix() then
    M.opt = require('platform.unix')
end

return M
