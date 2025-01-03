-- OS Specific functionaliy and settings
M = {
  path = {
    UNIX = '/',
    WINDOWS = '\\',

    -- Platform specific path delimeter
    separator = package.config:sub(1, 1),

    -- Platform specific path join
    join = function(...)
      return table.concat({ ... }, package.config:sub(1, 1))
    end,
  },

  is_windows = function()
    return M.path.separator == M.path.WINDOWS
  end,
  is_unix = function()
    return M.path.separator == M.path.UNIX
  end,
}

-- Load platform specific settings
if M.is_windows() then
  M.opt = require('platform.windows')
elseif M.is_unix() then
  M.opt = require('platform.unix')
end

return M
