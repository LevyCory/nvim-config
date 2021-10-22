-- Search as characters are entered
vim.opt.incsearch = true

-- Highlight matches
vim.opt.hlsearch = true

-- Case insensitive, unless a capital letter is searched for
vim.opt.smartcase = true

-- Turn of search highlights
-- noremap <tab><tab> :nohlsearch<cr>

-- Auto read modified files
vim.opt.autoread = true

-- TODO: Visual autocomplete
-- opt.wildmenu = true


-- Make tabs be 4 spaces wide
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Be smart about tabs
vim.opt.ai = true
vim.opt.wrap = true

-- Don't redraw buffer while macros are running
vim.opt.lazyredraw = true

-- Ignore garbage files
vim.opt.wildignore = {
    '*.swp',
    '*.o',
    '*.pyc'
}

-- Make backspace behave like you'd expect
vim.opt.backspace = {'indent', 'eol', 'start'}

-- Set shell
vim.opt.shell = 'D:/Programs/git/bin/bash.exe'

-- Python
-- Abbreviate pdb to 'import pdb; pdb.set_trace()'
vim.api.nvim_exec([[
    augroup init-lua-python
        au FileType python :iabbrev pdb import pdb; pdb.set_trace()
    augroup END
]], false)

-- make/cmake
vim.api.nvim_exec([[
    augroup init-lua-make-cmake
      autocmd!
      autocmd FileType make setlocal noexpandtab
      autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
    augroup END
]], false)

-- C++
vim.api.nvim_exec([[
    augroup init-lua-cpp
      autocmd BufNewFile,BufRead *.ixx setlocal filetype=cpp
    augroup END
]], false)
