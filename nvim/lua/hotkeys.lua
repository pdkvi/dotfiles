function map(mode, key, expr, opts)
	opts = opts or {}
	vim.api.nvim_set_keymap(mode, key, expr, opts)
end

local opts = { noremap = true, silent = true }

map("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

map("n", "gt", ":BufferLineCycleNext<CR>", opts)
map("n", "gT", ":BufferLineCyclePrev<CR>", opts)
map("n", "]t", ":tabnext<CR>", opts)
map("n", "[t", ":tabprev<CR>", opts)
