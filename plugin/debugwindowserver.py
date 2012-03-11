#!/usr/bin/env python
import sys
import os
import threading
import Queue
import re

global vimServer
vimServer = sys.argv[1]

def vimCommand( command ):
    command = re.sub( r'"', r'\"', command )
    toSend = 'mvim --servername ' + vimServer + ' -u NONE -U NONE --remote-send \"<C-\\\\><C-N>:' + command + "\""  
    print toSend
    os.system( toSend )

vimCommand( 'echo "Hello World!"<CR>' )

gdb = os.popen('gdb')

while( 1 ):
    line = gdb.readline()
    while( line ):
        print line.rstrip('\n')
        line = gdb.readline()

    command = sys.stdin.readline()
    if( command.rstrip() == "q" ):
        break
    gdb.writeline( command )

gdb.close()
