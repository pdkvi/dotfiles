require('nvim-treesitter.configs').setup{
	ensure_installed = { "c", "cpp", "lua", "glsl", "make", "vim", "cmake" },

	highlight = {
		enable = true
	}
}
