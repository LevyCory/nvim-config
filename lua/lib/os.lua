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

return M
