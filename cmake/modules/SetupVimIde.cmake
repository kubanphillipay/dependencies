function( SetupVimIde )

   set(oneValueArgs GAME_ENGINE_DIRECTORY GAME_EXE_DIRECTORY )
   set(multiValueArgs GAME_EXE_INCLUDES GAME_ENGINE_INCLUDES DIRECTORIES)
   include(CMakeParseArguments)
   cmake_parse_arguments(SetupVimIde "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN} )

   message( STATUS "Setting up VIM IDE " )
   set( TEST_VAR "_MY_TEST_VAR_" )
   

   #if( UNIX  )
   #   message( STATUS "Linux!!" )
   #   message( STATUS "Source Dir ${CMAKE_SOURCE_DIR}" )
   #   execute_process( COMMAND ls ${CMAKE_SOURCE_DIR} 
   #      OUTPUT_VARIABLE ls_OUTPUT )
   #   foreach( ls_VAR ${ls_OUTPUT} )
   #        message( STATUS "ls_Vars: ${ls_VAR}" )
   #        set( LIST_VAR ${LIST_VAR} ${ls_VAR} )
   #   endforeach()
   #else()
   #   message( STATUS "Not linux" )
   #endif()  
   
   file( WRITE ${CMAKE_BINARY_DIR}/.lvimrc 
      "\"let NERDTreeShowHidden=1\n"
      "\"let NERDTreeIgnore=['ignore_files$[[dir]]' , 'rth$[[dir]]' ]\n"
      "\"map <leader>m :\"this is a test\"\n"
      "map <leader>nt :NERDTree ${CMAKE_SOURCE_DIR}/..<cr>\n"
      "let g:ycm_global_ycm_extra_conf = '${CMAKE_BINARY_DIR}/.ycm_extra_conf.py'\n"
      "\"let g:ycm_extra_conf_globlist = ['${CMAKE_BINARY_DIR}/*']\n"
      ":let g:easytags_async = 1\n"
      ":let g:easytags_file = '${CMAKE_BINARY_DIR}/.myvimtags'\n"
      ":let g:easytags_include_members = 1\n"
      "\"My directories: ${SetupVimIde_DIRECTORIES}\n"
   ) 
   file( WRITE ${CMAKE_BINARY_DIR}/mytags
      "\"My directories: ${SetupVimIde_DIRECTORIES}\n"
   ) 

   SET(DEBUG_IDE OFF)
    
   if(DEBUG_IDE )
         message( STATUS "VIMIDE, Current Source dir: ${CMAKE_MODULE_PATH} " )
         
         message( STATUS "ARGN: ${ARGN}" )
         message( STATUS "DIRECTORIES: ${SetupVimIde_DIRECTORIES}" )
         message( STATUS "GAME_EXE_DIRECTORY: ${SetupVimIde_GAME_EXE_DIRECTORY}" )
         message( STATUS "GAME_ENGINE_DIRECTORY: ${SetupVimIde_GAME_ENGINE_DIRECTORY}" )
         message( STATUS "GAME_EXE_INCLUDES: ${SetupVimIde_GAME_EXE_INCLUDES}" )
         message( STATUS "GAME_ENGINE_INCLUDES: ${SetupVimIde_GAME_ENGINE_INCLUDES}" )

         message( STATUS "Printing individual GAME_EXE_INCLUDES" )
   endif()

   foreach( file ${SetupVimIde_GAME_EXE_INCLUDES} )  
      #message( STATUS "  -I ${file} " )
      string( CONCAT GAME_EXE_INCLUDES  ${GAME_EXE_INCLUDES} "'-I${file}',\n" )
   endforeach()

   if(DEBUG_IDE )
      message( STATUS "Printing individual GAME_ENGINE_INCLUDES" )
   endif()

   foreach( file ${SetupVimIde_GAME_ENGINE_INCLUDES} ) 
      #message( STATUS "  -I ${file} " )
      string( CONCAT GAME_ENGINE_INCLUDES  ${GAME_ENGINE_INCLUDES} "'-isystem${file}',\n" )
   endforeach()
   
   set( GAME_EXE_DIRECTORY ${SetupVimIde_GAME_EXE_DIRECTORY} )
   set( GAME_ENGINE_DIRECTORY ${SetupVimIde_GAME_ENGINE_DIRECTORY} )

   if(DEBUG_IDE )
      message (STATUS "Printing my EXE Includes: " )
      message( STATUS ${GAME_EXE_INCLUDES} )
      message (STATUS "Printing my Engine Includes: " )
      message( STATUS ${GAME_ENGINE_INCLUDES} )
   endif()  

   configure_file (
     "${CMAKE_MODULE_PATH}/.ycm_extra_conf_template.py"
     "${PROJECT_BINARY_DIR}/.ycm_extra_conf.py"
   )



endfunction()
