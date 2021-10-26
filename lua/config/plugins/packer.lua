local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.system(
        {'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path}
    )
end

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Cache for faster startup
    use 'lewis6991/impatient.nvim'

    use 'dstein64/vim-startuptime'

    -- Comment and uncomment code easily
    use 'tpope/vim-commentary'

    -- Fuzzy Finder
    use 'camspiers/snap'

	-- Status Line
	use {
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- TreeSitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- use {
	    -- 'nvim-treesitter/playground',
	    -- disabled = true
    -- }

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
      requires = {
        'nvim-lua/plenary.nvim'
      },
      tag = 'release'
    }

    -- Rust plugin
    use 'rust-lang/rust.vim'

    -- Colorizer
    use 'norcalli/nvim-colorizer.lua'

    -- Colors
    use 'w0ng/vim-hybrid'
    use 'hzchirs/vim-material'
    use 'shaunsingh/nord.nvim'

    if packer_bootstrap then
      require('packer').sync()
    end
end)
