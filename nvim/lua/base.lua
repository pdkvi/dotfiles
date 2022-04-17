-- editor settings {
vim.o.termguicolors = true
vim.g.moonflyItalics = 0
vim.cmd('colorscheme moonfly')

vim.o.number = true
vim.o.relativenumber = true
vim.o.encoding = 'utf-8'
vim.o.compatible = false
vim.o.hidden = true
vim.o.wrap = false
-- }

-- searching {
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
-- }

-- status bar {
vim.o.ruler = true
vim.o.showcmd = true
vim.o.wildmenu = true
-- }

-- mouse support {
vim.o.mouse = 'a'
vim.o.mousemodel = 'popup'
-- }

-- folding and indentation {
vim.o.foldenable = true
vim.o.foldlevel = 100
vim.o.foldmethod = 'indent'

vim.o.expandtab = false
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

vim.o.autoindent = true
vim.o.cindent = true
vim.o.cinoptions = 'Ls,:0,l1,g0,N-s,E-s,t0,(s,U1,m1,j1,J1'

vim.cmd([[
function! CppNoNamespaceAndTemplateIndent()
    let l:cline_num = line('.')
    let l:cline = getline(l:cline_num)
    let l:pline_num = prevnonblank(l:cline_num - 1)
    let l:pline = getline(l:pline_num)
    while l:pline =~# '\(^\s*{\s*\|^\s*//\|^\s*/\*\|\*/\s*$\)'
        let l:pline_num = prevnonblank(l:pline_num - 1)
        let l:pline = getline(l:pline_num)
    endwhile
    let l:retv = cindent('.')
    let l:pindent = indent(l:pline_num)
    if l:pline =~# '^\s*template\s*\s*$'
        let l:retv = l:pindent
    elseif l:pline =~# '\s*typename\s*.*,\s*$'
        let l:retv = l:pindent
    elseif l:cline =~# '^\s*>\s*$'
        let l:retv = l:pindent - &shiftwidth
    elseif l:pline =~# '\s*typename\s*.*>\s*$'
        let l:retv = l:pindent - &shiftwidth
    elseif l:pline =~# '^\s*namespace.*'
        let l:retv = 0
    endif
    return l:retv
endfunction
if has("autocmd")
    autocmd BufEnter *.{cc,cxx,cpp,h,hh,hpp,hxx} setlocal indentexpr=CppNoNamespaceAndTemplateIndent()
endif
]])
-- }
