if exists(':GuiTabline')
	GuiTabline 0
endif

if exists(':GuiScrollBar')
	GuiScrollBar 0
endif

if exists(':GuiPopupmenu')
	GuiPopupmenu 0
endif

if exists(':GuiFont')
	GuiFont SF\ Mono:h10
endif

if exists('*GuiShowContextMenu')
	nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
	inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
	xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
	snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv

	nnoremap <S-Insert> "+gp
	inoremap <S-Insert> <ESC>"+gpi
	vnoremap <S-Insert> "+gp
endif
