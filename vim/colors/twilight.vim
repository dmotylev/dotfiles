
set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "twilight"

if version >= 700
  hi CursorLine guibg=#182028
  hi CursorColumn guibg=#182028
  hi MatchParen guifg=white guibg=#80a090 gui=bold

  "Tabpages
  hi TabLine guifg=black guibg=#b0b8c0 gui=italic
  hi TabLineFill guifg=#9098a0
  hi TabLineSel guifg=black guibg=#f0f0f0 gui=italic,bold

  "P-Menu (auto-completion)
  hi Pmenu guifg=white guibg=#808080
  "PmenuSel
  "PmenuSbar
  "PmenuThumb
endif

hi Cursor guifg=NONE guibg=#ff5d5d

"hi Normal guifg=#f8f8f8 guibg=#202020
hi Normal guifg=#989f98 guibg=#202020
"hi LineNr guifg=#808080 guibg=#e0e0e0
hi LineNr guifg=#808080 guibg=#202020 gui=italic

"hi StatusLine guifg=#f0f0f0 guibg=#4f4a50 gui=italic
"hi StatusLineNC guifg=#c0c0c0 guibg=#5f5a60 gui=italic
hi StatusLine guifg=#c0c0c0 guibg=#4f4a50 gui=italic
hi StatusLineNC guifg=#909090 guibg=#5f5a60 gui=italic
"hi VertSplit guifg=#5f5a60 guibg=#5f5a60 gui=italic
hi VertSplit guifg=#5f5f60 guibg=#202020 gui=italic
hi Folded guibg=#384048 guifg=#a0a8b0

hi Comment guifg=#5f5a60 gui=italic
"hi Todo guifg=#808080 guibg=NONE gui=bold,italic
hi Todo guifg=#4c6aaf guibg=NONE gui=underline

"hi Constant guifg=#cf6a4c
hi Constant guifg=#af6a4c
"hi String guifg=#8f9d6a
hi String guifg=#60a060

hi Identifier guifg=#7587a6
" Type
hi Structure guifg=#9B859D
hi Function guifg=#dad085
hi Type guifg=#b0b080 gui=bold
" dylan: method, library, ...
"hi Statement guifg=#dad085 gui=NONE
hi Statement guifg=#aaa055 gui=NONE
" Keywords
hi PreProc guifg=#cda869
"gui=underline

hi NonText guifg=#808080 guibg=#232323

"hi Macro guifg=#a0b0c0 gui=underline

"Tabs, trailing spaces, etc (lcs)
hi SpecialKey guifg=#808080 guibg=#343434

"hi TooLong guibg=#ff0000 guifg=#f8f8f8

hi Visual guibg=#7080b4 guifg=black gui=NONE
