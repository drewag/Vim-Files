" Add end of function comment
map <F5> %?[a-z,A-Z,0-9]\+::[a-z,A-Z,0-9]\+[^),\n,^:]\{-}(<CR>:noh<CR>y$<C-O>%A // end of function <ESC>pF(D

" Convert function declaration into definition
map <F4> :call AddClassNameToFunction()<CR>

function! AddClassNameToFunction()
    let bufname = fnamemodify( bufname("%"), ':t' )
    let classname = matchstr( bufname,'\zs[^._]*' )
    " Insert classname
    normal ^
    call search( '(' )
    execute "normal bi".classname."::"

    " Wrap static and virtual in comments
    normal "xdd
    let @x = substitute( @x, "^virtual", '/\* virtual \*/', "" )
    let @x = substitute( @x, "^static", '/\* static \*/', "" )
    normal "xP^

    " Remove parameter comments
    call search( '(' )
    normal v%"xy
    let @x = substitute( @x, " *\/\/![^\n]*\n", "\n", "g" )
    let @x = substitute( @x, " = .\\{-}\\([,\n]\\)", "\\1", "g" )
    let @x = substitute( @x, "\n\n", "\\n", "g" )
    normal gvd
    normal "xP
    normal ^

    " Remove semicolon and put brackets
    call search( ';' )
    normal xo{
    normal <<o}
    exe "normal \<F5>"
    normal k
endfunction
