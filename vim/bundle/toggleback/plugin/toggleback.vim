if exists("g:loaded_toggleback") || &cp
  finish
endif
let g:loaded_toggleback = 1

" let the background be toggled in normal mode
map <silent> <F6> :call ToggleBackground()<CR>
" let the background be toggled in insert mode
imap <silent> <F6> <C-o>:silent call ToggleBackground()<CR>

let darkBackground = 1
function! ToggleBackground()
	let g:darkBackground = 1 - g:darkBackground
	if (g:darkBackground == 1)
		set background=dark
		colorscheme zenburn
		highlight LineNr guifg=#9c9c8c guibg=#3b3b3b
	else
		set background=light
		colorscheme moria
		highlight LineNr guifg=#9c9c8c guibg=#eaeaea
	endif
endfunc
