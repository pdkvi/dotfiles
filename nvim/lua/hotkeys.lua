function map(mode, key, expr, opts)
	opts = opts or {}
	vim.api.nvim_set_keymap(mode, key, expr, opts)
end

map("n", "<Leader>e", ":NvimTreeToggle<CR>")
