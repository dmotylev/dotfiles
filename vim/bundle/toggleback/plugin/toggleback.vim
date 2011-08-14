if exists("g:loaded_toggleback") || &cp
  finish
endif
let g:loaded_toggleback = 1

" let the background be toggled in normal mode
map <silent> <F6> :call ToggleBackground()<CR>
" let the background be toggled in insert mode
imap <silent> <F6> <C-o>:silent call ToggleBackground()<CR>

let darkBackground = 0
function! ToggleBackground()
	let g:darkBackground = 1 - g:darkBackground
	if (g:darkBackground == 1)
		set background=dark
	else
		set background=light
	endif
endfunc
