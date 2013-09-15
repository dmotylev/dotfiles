" ======================================================================================
" File         : filetype.vim
" Author       : Wu Jie 
" Description  : Vim support file to overrule default file types
" ======================================================================================


" /////////////////////////////////////////////////////////////////////////////
"   au defines
" /////////////////////////////////////////////////////////////////////////////

" additional cpp file type
au BufNewFile,BufRead *.ipp       setf cpp

" High Level Shader Language
au BufNewFile,BufRead *.hlsl,*.fx,*.fxh,*.cg,*.vsh,*.psh,*.shd,*.glsl,*.shader       setf hlsl

" Max Script
au BufNewFile,BufRead *.ms,*.mse,*.mcr,*.mzp,*.ds  setf maxscript

" Doxygen Comment
au BufNewFile,BufRead *.dox,*.doxygen       setf cpp.doxygen

" gmsh
au BufNewFile,BufRead *.geo                 setf gmsh

" as (actionscript/flash) I use java analyasis it
au BufNewFile,BufRead *.as                  setf javascript

" nsis
au BufNewFile,BufRead *.nsh                 setf nsis

" txtfmt
au BufNewFile,BufRead *.txtfmt              setf txtfmt

" Go
au BufRead,BufNewFile *.go             setf go
au FileType go autocmd BufWritePre <buffer> Fmt
au Filetype go set makeprg=go\ build
"au BufRead,BufNewFile *.go             setf go
"au BufRead,BufNewFile *.go             compiler gb
"au BufRead,BufNewFile *.go             map <D-'> :Fmt<CR>
"au BufRead,BufNewFile *.go             imap <D-'> <C-o>:Fmt<CR>
