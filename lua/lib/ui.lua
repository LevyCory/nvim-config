M = {}

function M.maximize_screen()
	vim.fn.rpcnotify(0, 'Gui', 'WindowMaximized', 1)
end

function M.set_font(font_name)
	vim.fn.rpcnotify(0, 'Gui', 'Font', font_name, 1)
end

return M
