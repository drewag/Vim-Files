" Vim syntax file
" Language:	nuance grammar
" Maintainer:	Andrew Wagner <andrew.wagner@garmin.com>
" Filenames:	nuance-grammar.vim
" Last Change:	2011 Jan 7

if exists("b:current_syntax")
  finish
endif

syn case match
syn sync minlines=50

if has("spell")
  syn spell toplevel
endif

syn match nuanceKeywords "\!grammar"
syn match nuanceKeywords "\!language"
syn match nuanceKeywords "\!start"
syn match nuanceKeywords "\!import"
syn match nuanceKeywords "\!export"
syn keyword nuanceKeywords PRONAS

syn match nuanceProperties "\!pronounce"
syn match nuanceProperties "\!optional"
syn match nuanceProperties "\!id"

syn match nuanceVersionDeclaration "^#BNF+EM.*$"
syn match nuanceComment "\/\*\_.\{-}\*\/"
syn match nuanceString "\"\_.\{-}\""

syn match nuanceRule      "<[^>^<]\{-}>"
syn match nuanceBeginRule "<[^>^<]\{-}>:"
syn region nuanceRuleDefinition start="<[^>^<]\{-}>:" end=";" fold transparent contains=nuanceRule,nuanceBeginRule,nuanceProperties

let b:current_syntax = "nuanceGrammar"

hi def link nuanceKeywords              Keyword
hi def link nuanceProperties            Keyword
hi def link nuanceRule                  Identifier
hi def link nuanceBeginRule             Function
hi def link nuanceVersionDeclaration    Preproc
hi def link nuanceString                String
hi def link nuanceComment               Comment
