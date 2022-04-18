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
		requires = { 'kyazdani42/nvim-web-devicons' }
	}
	-- }

	-- top bar {
	use {
		'akinsho/bufferline.nvim', tag = '*',
		requires = { 'kyazdani42/nvim-web-devicons' }
	}
	-- }

	-- completion {
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'neovim/nvim-lspconfig',
			'L3MON4D3/LuaSnip'
		}
	}
	-- }

	-- file tree {
	use {
		'kyazdani42/nvim-tree.lua',
		requires = { 'kyazdani42/nvim-web-devicons' }
	}
	-- }

	-- terminal {
	use 'akinsho/toggleterm.nvim'
	-- }
end)
