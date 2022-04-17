return require('packer').startup(function(use)
	-- packer updates {
	use 'wbthomason/packer.nvim'
	-- }

	-- colorschemes {
	use 'bluz71/vim-moonfly-colors'

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	-- }

	-- status bar {
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	-- }

	-- completion {
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp', opt = true,
			'neovim/nvim-lspconfig', opt = true,
			'L3MON4D3/LuaSnip', opt = true
		}
	}
	-- }
end)
