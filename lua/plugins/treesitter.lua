return {
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            'bash',
            'c',
            'cpp',
            'json',
            'lua',
            'luadoc',
            'luap',
            'markdown',
            'markdown_inline',
            'norg',
            'python',
            'regex',
            'rust',
            'vim',
            'vimdoc',
            'yaml',
        },
        highlight = {
            enable = true, -- false will disable the whole extension
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true,
        },
    },
}
