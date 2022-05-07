return require('packer').startup({
	function(use)
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

	-- ruler {
	use 'lukas-reineke/virt-column.nvim'
	-- }

	-- telescope {
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-telescope/telescope-ui-select.nvim',
			'nvim-lua/plenary.nvim'
		}
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

	-- git {
	use 'lewis6991/gitsigns.nvim'
	-- }

	-- cmake {
	use {
		'Shatur/neovim-cmake',
		requires = {
			'nvim-lua/plenary.nvim',
			'mfussenegger/nvim-dap'
		}
	}
	-- }

	-- completion {
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			'onsails/lspkind.nvim',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-path'
		}
	}

	use 'windwp/nvim-autopairs'
	-- }

	-- diagnostics {
	use {
		'folke/trouble.nvim',
		requires = { 'kyazdani42/nvim-web-devicons' }
	}
	-- }

	-- buffers {
	use 'qpkorr/vim-bufkill'
	-- }

	-- comment {
	use 'terrortylor/nvim-comment'
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
end,

config = {
	display = {
		working_sym = '↻', -- The symbol for a plugin being installed/updated
		error_sym = '✗', -- The symbol for a plugin with an error in installation/updating
		done_sym = '✓', -- The symbol for a plugin which has completed installation/updating
		removed_sym = '-', -- The symbol for an unused plugin which was removed
		moved_sym = '→', -- The symbol for a plugin which was moved (e.g. from opt to start)
		header_sym = '━', -- The symbol for the header line in packer's display
	}
}
})
