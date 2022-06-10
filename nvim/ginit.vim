if exists('g:GuiLoaded')
	GuiTabline 0
	GuiScrollBar 0
	GuiPopupmenu 0
	GuiFont SF\ Mono:h10

	nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
	inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
	xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
	snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv

	nnoremap <S-Insert> "+gp
	inoremap <S-Insert> <ESC>"+gpa
	vnoremap <S-Insert> "+gp
endif

if exists('g:fvim_loaded')
	FVimCustomTitleBar v:true
	FVimUIPopupMenu v:false
	FVimUIWildMenu v:false

	FVimFontNormalWeight 500
	FVimFontBoldWeight 800
	set guifont=SF\ Mono:h14

	vnoremap <C-c> "+y
	inoremap <C-v> <ESC>"+pa

	nnoremap <S-Insert> "+gp
	inoremap <S-Insert> <ESC>"+gpa
	vnoremap <S-Insert> "+gp
endif
