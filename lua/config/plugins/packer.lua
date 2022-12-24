-- Bootstrap packer
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = vim.fn.empty(vim.fn.glob(install_path)) > 0
if is_bootstrap then
    vim.fn.system {'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path}
    vim.cmd [[packadd packer.nvim]]
end

lib.packer = require('packer')
lib.packer.startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Cache for faster startup
    use 'lewis6991/impatient.nvim'

    -- Mason
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- Debug startuptime
    -- use 'dstein64/vim-startuptime'

    -- Comment and uncomment code easily
    use 'numToStr/Comment.nvim'

    -- Fuzzy Finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim',
    }

	-- Status Line
	use {
		'nvim-lualine/lualine.nvim',
		requires = 'kyazdani42/nvim-web-devicons'
	}

    -- Snippets
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- LSP status spinner
    use {
        'j-hui/fidget.nvim',
        config = function()
            require('fidget').setup {}
        end
    }

    -- Autocomplete
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline'
        }
    }

    -- TreeSitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use {
        'nvim-neorg/neorg',
        run = ':Neorg sync-parsers',
    }

    -- File Tree Viewer
    use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons'
	}

    -- Start screen
    use 'mhinz/vim-startify'

    -- Needed for configuring nvim-qt
	use 'equalsraf/neovim-gui-shim'

    -- Git integration
    use {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
    }

    -- Rust plugin
    use 'rust-lang/rust.vim'

    -- Hex color highlighter
    use 'norcalli/nvim-colorizer.lua'

    -- Colors
    use 'w0ng/vim-hybrid'
    use 'hzchirs/vim-material'
    use 'shaunsingh/nord.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'navarasu/onedark.nvim'

    if is_bootstrap then
        lib.packer.sync()
    end
end)

if is_bootstrap then
    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
    return
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd(
    'BufWritePost',
    {
        command = 'source <afile> | PackerCompile',
        group = packer_group,
        pattern = vim.fn.expand '$MYVIMRC',
    }
)
