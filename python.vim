" ------------------------------- Visual -------------------------------
let python_highlight_all = 1
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Wrap at 72 chars for comments.
set formatoptions=cq textwidth=72 foldignore= wildignore+=*.py[co]

" ------------------------------- Functionality -------------------------------
" Set compiler to nose which will run unit tests
compiler nose

" ------------------------------- Python Functions -------------------------------
if 1==has('python')

" `gf` jumps to the filename under the cursor.  Point at an import statement
" " and jump to it!
python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

" Execute a selection of code (very cool!)
" Use VISUAL to select a range and then hit ctrl-h to execute it.
python << EOL
import vim
def EvaluateCurrentRange():
    eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOL
map <C-h> :py EvaluateCurrentRange()<CR>

" Use F7/Shift-F7 to add/remove a breakpoint (vimpdb.set_trace)
" Totally cool.
python << EOF
def SetBreakpoint():
    import re
    nLine = int( vim.eval( 'line(".")'))

    strLine = vim.current.line
    strWhite = re.search( '^(\s*)', strLine).group(1)

    vim.current.buffer.append(
       "%(space)svimpdb.set_trace() %(mark)s Breakpoint %(mark)s" %
         {'space':strWhite, 'mark': '#' * 30}, nLine - 1)

    for strLine in vim.current.buffer:
        if strLine == "import vimpdb":
            break
    else:
        vim.current.buffer.append( 'import vimpdb', 0)
        vim.command( 'normal j1')

vim.command( 'map <leader>b :py SetBreakpoint()<cr>')

def RemoveBreakpoints():
    import re

    nCurrentLine = int( vim.eval( 'line(".")'))

    nLines = []
    nLine = 1
    for strLine in vim.current.buffer:
        if strLine == "import vimpdb" or strLine.lstrip()[:18] == "vimpdb.set_trace()":
            nLines.append( nLine)
        nLine += 1

    nLines.reverse()

    for nLine in nLines:
        vim.command( "normal %dG" % nLine)
        vim.command( "normal dd")
        if nLine < nCurrentLine:
            nCurrentLine -= 1

    vim.command( "normal %dG" % nCurrentLine)

vim.command( "map <leader>B :py RemoveBreakpoints()<cr>")
EOF

endif
