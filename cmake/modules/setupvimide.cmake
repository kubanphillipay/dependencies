function( SetupVimIde )
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

   
   file( WRITE ${CMAKE_BINARY_DIR}/myvimfile 
      "\"let NERDTreeShowHidden=1\n"
      "\"let NERDTreeIgnore=['ignore_files$[[dir]]' , 'rth$[[dir]]' ]\n"
      "\"map <leader>m :\"this is a test\"\n"
      "map <leader>nt :NERDTree ${CMAKE_SOURCE_DIR}<cr>\n"
      "let g:ycm_global_ycm_extra_conf = '${CMAKE_BINARY_DIR}/.ycm_extra_conf.py'\n"
      "\"let g:ycm_extra_conf_globlist = ['${CMAKE_BINARY_DIR}/*']\n"
      ":let g:easytags_async = 1\n"
      ":let g:easytags_file = '${CMAKE_BINARY_DIR}/.myvimtags'\n"
      ":let g:easytags_include_members = 1\n"
   ) 
   #file( WRITE ${CMAKE_BINARY_DIR}/myvimfile 
   #       "Cmake Binary Dir: ${CMAKE_BINARY_DIR}\n"
   #       "Cmake Project Name: ${PROJECT_NAME}\n"
   #       "This is a line in my vim file"
   #       "This is another line"
   #       "What  happens when i do this" 
   #       "This is a ${TEST_VAR}" )

   

endfunction()
