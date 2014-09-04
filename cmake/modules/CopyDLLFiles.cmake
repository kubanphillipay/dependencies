function( copy_dll_files arg1 )
    if(SDL_BUILD_SHARED )

        message( STATUS "Shared d: ${SDL_SHARED_DEBUG}" )
        message( STATUS "Shared r: ${SDL_SHARED_RELEASE}" )
        message( STATUS "PROJECT_BINARY_DIR: ${PROJECT_BINARY_DIR}" )

        add_custom_command(TARGET ${arg1} POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E copy_if_different
                "${SDL_SHARED_DEBUG}"
                "${PROJECT_BINARY_DIR}/Debug/SDL2d${CMAKE_SHARED_LIBRARY_SUFFIX}")

        add_custom_command(TARGET ${arg1} POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E copy_if_different
                "${SDL_SHARED_RELEASE}"
                "${PROJECT_BINARY_DIR}/Release/SDL2${CMAKE_SHARED_LIBRARY_SUFFIX}")
    endif()

endfunction()