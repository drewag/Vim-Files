" Vim color file
" Maintainer:	Andrew Wagner <andrew@digitalassertion.com>
" Last Change:	Date: 2011/02/07 
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
let g:colors_name="andrew"

hi Normal	guifg=White guibg=#1e1f28 ctermfg=White

" highlight groups
hi Cursor	guibg=khaki guifg=slategrey
"hi CursorIM
"hi Directory
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText
"hi ErrorMsg
hi VertSplit	guibg=#c2bfa5 guifg=grey50 gui=none
hi Folded	    guibg=grey30 guifg=gold
hi FoldColumn	guibg=grey30 guifg=tan
hi IncSearch	guifg=slategrey guibg=khaki
"hi LineNr
hi ModeMsg      guifg=goldenrod
hi MoreMsg      guifg=SeaGreen
hi NonText      guifg=LightBlue guibg=grey30
hi Question     guifg=springgreen
hi Search       guibg=peru guifg=wheat
hi SpecialKey	guifg=yellowgreen
hi StatusLine	guibg=#c2bfa5 guifg=black gui=none
hi StatusLineNC	guibg=#c2bfa5 guifg=grey50 gui=none
hi Title	    guifg=indianred
hi Visual	    gui=none guifg=khaki guibg=olivedrab
"hi VisualNOS
hi WarningMsg	guifg=salmon
"hi WildMenu
"hi Menu
"hi Scrollbar
"hi Tooltip

" syntax highlighting groups
hi String       guifg=#db2b37 ctermfg=DarkRed
hi Character    guifg=#776cc4 ctermfg=Blue
hi Number       guifg=#776cc4 ctermfg=Blue
hi Float        guifg=#776cc4 ctermfg=Blue
hi Boolean      guifg=#b11888 ctermfg=Magenta
hi Comment	    guifg=#ffff00 ctermfg=DarkYellow
hi Constant	    guifg=#c67c48 ctermfg=Green
hi Identifier	guifg=#009fbe ctermfg=Cyan
hi Function	    guifg=#82c057 ctermfg=Cyan
hi Statement	guifg=#b11888 ctermfg=Magenta
hi PreProc      guifg=#c67c48 ctermfg=Green
hi Type         guifg=#b11888 ctermfg=Magenta
hi Special      guifg=navajowhite
"hi Underlined
hi Ignore   	guifg=grey40
"hi Error
hi Todo	    	guifg=orangered guibg=yellow2
