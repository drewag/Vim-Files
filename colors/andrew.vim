" Vim color file
" Maintainer:	Andrew Wagner
" Last Change:	Date: 2012-03-12
" Version:	    1.0

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "andrew"

hi Normal          gui=NONE        guifg=white     guibg=#121918

hi Comment         gui=NONE        guifg=#FFFF00   guibg=NONE      term=NONE       ctermfg=Yellow      ctermbg=NONE

hi Constant        gui=NONE        guifg=Magenta   guibg=NONE      term=NONE       ctermfg=Magenta     ctermbg=NONE
hi String          gui=NONE        guifg=Red       guibg=NONE      term=NONE       ctermfg=Red         ctermbg=NONE
"hi Character      gui=NONE        guifg=NONE      guibg=NONE      term=NONE       ctermfg=NONE        ctermbg=NONE
"hi Number         gui=NONE        guifg=NONE      guibg=NONE      term=NONE       ctermfg=NONE        ctermbg=NONE
"hi Boolean        gui=NONE        guifg=NONE      guibg=NONE      term=NONE       ctermfg=NONE        ctermbg=NONE
"hi Float          gui=NONE        guifg=NONE      guibg=NONE      term=NONE       ctermfg=NONE        ctermbg=NONE

hi Identifier      gui=NONE        guifg=#7777FF   guibg=NONE      term=NONE       ctermfg=Blue        ctermbg=NONE
"hi Function       gui=NONE        guifg=NONE      guibg=NONE      term=NONE       ctermfg=NONE        ctermbg=NONE

hi Statement       gui=NONE        guifg=Orange    guibg=NONE      term=bold       ctermfg=11          ctermbg=NONE
"hi Conditional    gui=NONE        guifg=NONE      guibg=NONE      term=NONE       ctermfg=NONE        ctermbg=NONE
"hi Repeat         gui=NONE        guifg=NONE      guibg=NONE      term=NONE       ctermfg=NONE        ctermbg=NONE
"hi Label          gui=NONE        guifg=NONE      guibg=NONE      term=NONE       ctermfg=NONE        ctermbg=NONE
"hi Operator       gui=NONE        guifg=NONE      guibg=NONE      term=NONE       ctermfg=NONE        ctermbg=NONE
"hi Keyword        gui=NONE        guifg=NONE      guibg=NONE      term=NONE       ctermfg=NONE        ctermbg=NONE
"hi Exception      gui=NONE        guifg=NONE      guibg=NONE      term=NONE       ctermfg=NONE        ctermbg=NONE

hi link PreProc    statement
"hi PreProc        gui=NONE        guifg=NONE      guibg=NONE      term=NONE       ctermfg=NONE        ctermbg=NONE
"hi Include        gui=NONE        guifg=NONE      guibg=NONE      term=NONE       ctermfg=NONE        ctermbg=NONE
"hi Define         gui=NONE        guifg=NONE      guibg=NONE      term=NONE       ctermfg=NONE        ctermbg=NONE
"hi Macro          gui=NONE        guifg=NONE      guibg=NONE      term=NONE       ctermfg=NONE        ctermbg=NONE
"hi PreCondit      gui=NONE        guifg=NONE      guibg=NONE      term=NONE       ctermfg=NONE        ctermbg=NONE

hi Type            gui=NONE        guifg=#009500   guibg=NONE      term=bold       ctermfg=DarkGreen   ctermbg=NONE
"hi StorageClass   gui=NONE        guifg=NONE      guibg=NONE      term=NONE       ctermfg=NONE        ctermbg=NONE
"hi Structure      gui=NONE        guifg=NONE      guibg=NONE      term=NONE       ctermfg=NONE        ctermbg=NONE
"hi Typedef        gui=NONE        guifg=NONE      guibg=NONE      term=NONE       ctermfg=NONE        ctermbg=NONE

hi Special         gui=NONE        guifg=#FFFF88   guibg=NONE      term=bold       ctermfg=LightYellow ctermbg=NONE
"hi SpecialChar    gui=NONE        guifg=NONE      guibg=NONE      term=NONE       ctermfg=NONE        ctermbg=NONE
hi Tag             gui=underline   guifg=#FFFF88   guibg=NONE      term=underline  ctermfg=LightYellow ctermbg=NONE
"hi Delimiter      gui=NONE        guifg=NONE      guibg=NONE      term=NONE       ctermfg=NONE        ctermbg=NONE
"hi SpecialComment gui=NONE        guifg=NONE      guibg=NONE      term=NONE       ctermfg=NONE        ctermbg=NONE
"hi Debug          gui=NONE        guifg=NONE      guibg=NONE      term=NONE       ctermfg=NONE        ctermbg=NONE

"hi Underlined     gui=NONE        guifg=NONE      guibg=NONE      term=NONE       ctermfg=NONE        ctermbg=NONE

"hi Ignore         gui=NONE        guifg=NONE      guibg=NONE      term=NONE       ctermfg=NONE        ctermbg=NONE

hi Error           gui=NONE        guifg=White     guibg=Red       term=reverse    ctermfg=White       ctermbg=Red

hi Todo            gui=NONE        guifg=Blue      guibg=Yellow    term=standout   ctermfg=Black       ctermbg=Yellow

hi Visual          gui=reverse     guifg=Black     guibg=Yellow    term=reverse    ctermfg=Black       ctermbg=Yellow
hi Search          gui=NONE        guifg=Black     guibg=Cyan      term=reverse    ctermfg=Black       ctermbg=Cyan
hi StatusLine      gui=NONE        guifg=Yellow    guibg=DarkGray  term=reverse    ctermfg=Yellow      ctermbg=DarkGray

hi SpellBad        gui=NONE        guifg=White     guibg=Red       term=reverse    ctermfg=White       ctermbg=Red

hi! link MoreMsg Comment
hi! link ErrorMsg Visual
hi! link WarningMsg ErrorMsg
hi! link Question Comment
