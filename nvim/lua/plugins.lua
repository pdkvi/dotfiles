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
end)
