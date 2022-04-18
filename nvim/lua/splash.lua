local startify = require('alpha.themes.startify')

startify.section.mru.val = { { type = "padding", val = 0 } }

startify.section.top_buttons.val = {
	startify.button( "f", "File Explorer" , ":NvimTreeToggle<CR>"),
}

startify.section.bottom_buttons.val = {
	startify.button( "q", "Quit" , ":qa<CR>"),
}

require('alpha').setup(startify.config)
