local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.system(
        {'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path}
    )
end

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Comment and uncomment code easily
    use 'tpope/vim-commentary'

    -- Fuzzy Finder
    use 'camspiers/snap'

	-- Status Line
	use {
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}

    -- File Tree Viewer
    use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons'
	}

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

    -- Colors
    use 'w0ng/vim-hybrid'
    use 'hzchirs/vim-material'

    if packer_bootstrap then
      require('packer').sync()
    end
end)
