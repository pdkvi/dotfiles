local path = require('plenary.path')

require('cmake').setup({
	cmake_executable = 'cmake',
	parameters_file = 'neovim.json',
	build_dir = tostring(path:new('{cwd}', 'build', '{os}-{build_type}')),
	default_projects_path = tostring(path:new(vim.loop.os_homedir(), 'Documents/Projects')),
	configure_args = { '-D', 'CMAKE_EXPORT_COMPILE_COMMANDS=1' },
	quickfix_only_on_error = false
})
