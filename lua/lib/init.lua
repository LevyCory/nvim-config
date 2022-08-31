local function try_require(name)
    local err, module = pcall(require, name)
    if err then
        return module
    end

    return {}
end

return {
    os = require('lib.os'),
    machine = try_require('lib.machine'),
    map = require('lib.map'),
    ui = require('lib.ui')
}
