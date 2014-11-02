# This file is NOT licensed under the GPLv3, which is the license for the rest
# of YouCompleteMe.
#
# Here's the license text for this file:
#
# This is free and unencumbered software released into the public domain.
#
# Anyone is free to copy, modify, publish, use, compile, sell, or
# distribute this software, either in source code form or as a compiled
# binary, for any purpose, commercial or non-commercial, and by any
# means.
#
# In jurisdictions that recognize copyright laws, the author or authors
# of this software dedicate any and all copyright interest in the
# software to the public domain. We make this dedication for the benefit
# of the public at large and to the detriment of our heirs and
# successors. We intend this dedication to be an overt act of
# relinquishment in perpetuity of all present and future rights to this
# software under copyright law.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#
# For more information, please refer to <http://unlicense.org/>

import os
import ycm_core

# These are the compilation flags that will be used in case there's no
# compilation database set (by default, one is not set).
# CHANGE THIS LIST OF FLAGS. YES, THIS IS THE DROID YOU HAVE BEEN LOOKING FOR.

gen_flags = [
'-Wall',
'-Wextra',
'-Werror',
'-Wno-long-long',
'-Wno-variadic-macros',
'-fexceptions',
'-DNDEBUG',
'-std=c++1y',
'-x' ,
'c++' 
]

#ENGINE FLAGS
flags1 = [
@GAME_ENGINE_INCLUDES@
]

#EXE FLAGS
flags2 = [
@GAME_EXE_INCLUDES@
]

directory1 = '@GAME_ENGINE_DIRECTORY@'
directory2 = '@GAME_EXE_DIRECTORY@'


def MakeRelativePathsInFlagsAbsolute( flags, working_directory ):
  if not working_directory:
    return list( flags )
  new_flags = []
  make_next_absolute = False
  path_flags = [ '-isystem', '-I', '-iquote', '--sysroot=' ]
  for flag in flags:
    new_flag = flag

    if make_next_absolute:
      make_next_absolute = False
      if not flag.startswith( '/' ):
        new_flag = os.path.join( working_directory, flag )

    for path_flag in path_flags:
      if flag == path_flag:
        make_next_absolute = True
        break

      if flag.startswith( path_flag ):
        path = flag[ len( path_flag ): ]
        new_flag = path_flag + os.path.join( working_directory, path )
        break

    if new_flag:
      new_flags.append( new_flag )
  return new_flags


def DirectoryOfThisScript():
  return os.path.dirname( os.path.abspath( __file__ ) )


def FlagsForFile( filename, **kwargs ):
  #myfile = open("ycm_out.txt" , 'a+' )
  #myfile.write( "Filename is: " + filename + '\n')
  #myfile.write( "Directory1 is: " + directory1 + '\n')


  if( filename.find(directory1) >=  0 ):
      #myfile.write( "This file is a GameEngine" + '\n')
      flags = gen_flags + flags1
  elif( filename.find(directory2) >= 0 ):
      #myfile.write( "This file is a GameConsoleExe" + '\n')
      flags = gen_flags + flags2
  else:
      #myfile.write( "I'm not sure what this file is" + '\n')
      flags = gen_flags 

  relative_to = DirectoryOfThisScript()
  #final_flags = MakeRelativePathsInFlagsAbsolute( flags, relative_to )

  #for f in flags:
  #    myfile.write( "Flag: " + f + '\n' )

  #myfile.write("\n")
  #myfile.close()
  return {
    'flags': flags,
    'do_cache': True
  }

