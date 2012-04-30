# Installs the following modules:
#   nose - tool to search for and run all tests
#   pyflakes - check python syntax on single file

import os
import shutil

print "Downloading nose..."
os.system( 'git clone git://github.com/nose-devs/nose.git nose_temp' )
print
print "Installing nose..."
os.system( 'cd nose_temp && python setup.py install' )
print

print "Downloading pyflakes..."
os.system( 'git clone git://github.com/kevinw/pyflakes.git pyflakes_temp' )
print
print "Installing pyflakes..."
os.system( 'cd pyflakes_temp && python setup.py install' )
print

print "Deleting temp files..."
shutil.rmtree('nose_temp')
shutil.rmtree('pyflakes_temp')
print
