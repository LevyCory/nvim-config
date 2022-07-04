-- require('nvim-treesitter.install').compilers = {
--     "clang",
--     "gcc"
--     'cpp'
-- }

require('nvim-treesitter.configs').setup {
    ensure_installed = {'c', 'lua'},
    highlight = {
      enable = true,              -- false will disable the whole extension
      additional_vim_regex_highlighting = false,
    },
}
