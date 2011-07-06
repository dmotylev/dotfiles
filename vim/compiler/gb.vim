" Compiler: gb
if exists("current_compiler")
  finish
endif
let current_compiler = "gb"

if exists(":CompilerSet") != 2	" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=gb\ $*

CompilerSet errorformat=%f:%l:%m
" vim: nowrap sw=2 sts=2 ts=8:
