local function map(mode, key, expr, opts)
	opts = opts or {}
	vim.api.nvim_set_keymap(mode, key, expr, opts)
end

local opts = { noremap = true, silent = true }

vim.g.BufKillCreateMappings = 0

map("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

map("n", "gt", ":BufferLineCycleNext<CR>", opts)
map("n", "gT", ":BufferLineCyclePrev<CR>", opts)
map("n", "]t", ":tabnext<CR>", opts)
map("n", "[t", ":tabprev<CR>", opts)

map("n", "<C-q>", ":BD<CR>", opts)

map("n", "<Leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<Leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<Leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<Leader>fh", ":Telescope help_tags<CR>", opts)

map("n", "<C-]>", ":lua vim.lsp.buf.definition()<CR>", opts)

map("n", "<F2>", ":CMake select_target<CR>", opts)
map("n", "<F3>", ":CMake configure<CR>", opts)
map("n", "<F7>", ":CMake build<CR>", opts)
map("n", "<F8>", ":CMake build_and_run<CR>", opts)
