require('nvim-tree').setup({
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = { hint = "H", info = "I", warning = "W", error = "E" }
	},
})

-- TODO: change to lua variable
vim.cmd([[
let g:nvim_tree_icons =
\ {
	\ 'git':
	\ {
	\	 'unstaged': "✗",
	\	 'staged': "✓",
	\	 'unmerged': "⑂",
	\	 'renamed': "→",
	\	 'untracked': "+",
	\	 'deleted': "-",
	\	 'ignored': "○"
	\ }
\ }
]])

vim.cmd([[
autocmd BufEnter * ++nested if winnr('$') == 1 &&
	\ bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
