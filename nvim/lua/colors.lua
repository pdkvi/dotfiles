vim.cmd('autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red')
vim.cmd('autocmd BufWinEnter * match ExtraWhitespace /\\s\\+$/')
vim.cmd('autocmd InsertEnter * match ExtraWhitespace /\\s\\+\\%#\\@<!$/')
vim.cmd('autocmd InsertLeave * match ExtraWhitespace /\\s\\+$/')
vim.cmd('autocmd BufWinLeave * call clearmatches()')

vim.o.termguicolors = true
vim.g.moonflyItalics = 0
vim.cmd('colorscheme moonfly')
