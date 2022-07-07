M = {}

M.separator = package.config:sub(1, 1)

function M.join_path(...)
    return table.concat(arg, M.separator)
end

function M.is_windows()
    return M.separator == '\\'
end

function M.is_unix()
    return M.separator == '/'
end

-- Load platform specific settings
if M.is_windows then
    M.opt = require('platform.windows')
end

if M.is_unix() then
    M.opt = require('platform.unix')
end

return M
