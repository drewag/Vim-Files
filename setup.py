# Installs the following modules:
#   nose - tool to search for and run all tests
#   pyflakes - check python syntax on single file

import os
import shutil

os.system( 'git clone git://github.com/nose-devs/nose.git nose_temp' )
os.system( 'python nose_temp/setup.py install' )

shutil.rmtree('nose_temp')

os.system( 'git clone git://github.com/kevinw/pyflakes.git pyflakes_temp' )
os.system( 'python pyflakes_temp/setup.py install' )

shutil.rmtree('pyflakes_temp')
