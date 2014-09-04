function( load_slnlib_dependencies )
    message( STATUS "Load slnlib dependencies" )

    #set( SDL_BUILD_SHARED TRUE )

    find_package( OpenGL REQUIRED )
    find_package( GLFW REQUIRED )
    find_package( GLEW REQUIRED )

    find_package( GLM REQUIRED )
    find_package( SDL REQUIRED )
    find_package( BMP REQUIRED COMPONENTS system thread program_options chrono )

    if( LOAD_DEPENDENCY_DEBUG )
        message( STATUS "OpenGL_LIBRARY ${OPENGL_LIBRARY}" )
        message( STATUS "GLFW_LIBRARY ${GLFW_LIBRARY}" )
        message( STATUS "GLEW_LIBRARY ${GLEW_LIBRARY}" )
        message( STATUS "SDL_LIBRARY ${SDL_LIBRARY}" )
        message( STATUS "BMP_LIBRARY ${BMP_LIBRARY}" )
    endif()

    set( EXTERNAL_DEPENDENCY_LIBRARY
                ${OPENGL_LIBRARY}
                ${GLFW_LIBRARY}
                ${GLEW_LIBRARY}
                ${SDL_LIBRARY}
                ${BMP_LIBRARY}
                PARENT_SCOPE
    )

    set( EXTERNAL_DEPENDENCY_DEFINITIONS
                ${GLFW_DEFINITIONS}
                ${GLEW_DEFINITIONS}
    )

    set( EXTERNAL_DEPENDENCY_DEFINITIONS ${EXTERNAL_DEPENDENCY_DEFINITIONS} PARENT_SCOPE )


endfunction()