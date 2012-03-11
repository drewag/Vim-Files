" debugwindow.vim -- Debug window that uses gdb
" Author: Andrew Wagner
" Last Modified: 06-May-2010 @ 22:20
" Version: 1.0

"------------------------------------------------------------
"  Configuration
"------------------------------------------------------------

" Key Mappings
nmap <silent> <C-P>      :call Debug()<CR>
nmap <silent> <C-F9>     :call DebugToggleBreak()<CR>
nmap <silent> <C-F10>    :call DebugNext()<CR>
nmap <silent> <C-F5>     :call DebugContinue()<CR>
nmap <silent> <C-S-F5>   :call DebugContinue( "" )<Left><Left><Left>

" Appearance
highlight DebugBreak guibg=darkred guifg=white ctermbg=darkred ctermfg=white
highlight DebugStop guibg=lightgreen guifg=white ctermbg=lightgreen ctermfg=white

"------------------------------------------------------------
"  Global Variables
"------------------------------------------------------------

let g:loadedSymbols = {}
let g:running = 0
let g:nextSignNum = 1
let g:breakpoints = {}

"------------------------------------------------------------
"  Sending Commands
"------------------------------------------------------------

function! DebugSendCommand( command )
   call system( "python ~/Code/Python/DebugWindow/SendCommand.py " . v:servername . " \'" . a:command . "\'" ) 
endf

function! DebugLoad( program )
    if !has_key( g:loadedSymbols, a:program )
        let directory = getcwd()
        let g:loadedSymbols[ a:program ] = 1 
        call DebugSendCommand( "file " . directory . "/" . a:program )
    endif
endf

function! DebugRun( program )
    if !empty( a:program )
        call DebugLoad( a:program )
    endif
    call DebugSendCommand( "run" )
    let g:running = 1
endf

function! DebugContinue()
    if g:running
        call DebugSendCommand( "continue" )
    else
        call DebugRun( "" )
    endif 
endf

function! DebugToggleBreak()
   let line = line(".") 
   let filename = bufname("%")
   call DebugSendCommand( "break " . filename . ":" . line )
endf

function! DebugNext()
    call DebugSendCommand( "next" )
endf

"------------------------------------------------------------
"  Recieving Commands
"------------------------------------------------------------

"sign define breakpoint linehl=DebugBreak
"sign define current linhl=DebugStop

function! DebugRecieveOutput( output )
    echo a:output
endf

function! DebugSetBreak( line )
    execute "sign place " . g:nextSignNum
    let g:nextSignNum ++
endf

function! DebugUnsetBreak( filename, line )
    if !has_key( g:breakpoints, filename )
        return
    
    "execute "sign unplace " . 
endf
