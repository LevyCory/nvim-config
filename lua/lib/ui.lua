M = {
    font = "",
    size = 0
}

function M.maximize_screen()
	return vim.fn.rpcnotify(0, 'Gui', 'WindowMaximized', 1)
end

function M.set_font(font, size)
    M.font = font
    M.size = size
    return vim.fn.rpcnotify(0, 'Gui', 'Font', font .. ":h" .. size, 1)
end

function M.increase_font_size()
    M.set_font(M.font, M.size + 1)
end

function M.decrease_font_size()
    M.set_font(M.font, M.size - 1)
end

return M
