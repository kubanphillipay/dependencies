function( load_external_dependencies )
    message( STATUS "Load external dependencies" )

    #set( SDL_BUILD_SHARED TRUE )
    set( LOAD_DEPENDENCY_DEBUG true )

    find_package( OpenGL REQUIRED )
    #message( STATUS "Loading GLFW" )
    find_package( GLFW REQUIRED )
    find_package( GLEW REQUIRED )

    find_package( GLM REQUIRED )
    find_package( SDL REQUIRED )
    find_package( ZLIB REQUIRED )
    find_package( PNG REQUIRED )
    find_package( SDL_IMAGE REQUIRED )
    find_package( BMP REQUIRED COMPONENTS system thread program_options 
                                          chrono filesystem )

    if( LOAD_DEPENDENCY_DEBUG )
        message( STATUS "OpenGL_LIBRARY ${OPENGL_LIBRARY}" )
        message( STATUS "GLFW_LIBRARY ${GLFW_LIBRARY}" )
        message( STATUS "GLEW_LIBRARY ${GLEW_LIBRARY}" )
        message( STATUS "SDL_LIBRARY ${SDL_LIBRARY}" )
        message( STATUS "BMP_LIBRARY ${BMP_LIBRARY}" )
        MESSAGE( STATUS "SDL_IMAGE_LIBRARY: ${SDL_IMAGE_LIBRARY}" )
        MESSAGE( STATUS "PNG_LIBRARY: ${PNG_LIBRARY}" )
        MESSAGE( STATUS "ZLIB_LIBRARY: ${ZLIB_LIBRARY}" )
    endif()

    set( EXTERNAL_DEPENDENCY_LIBRARY
                ${SDL_IMAGE_LIBRARY}
                ${PNG_LIBRARY}
                ${ZLIB_LIBRARY}
                ${OPENGL_LIBRARY}
                ${GLFW_LIBRARY}
                ${GLEW_LIBRARY}
                ${SDL_LIBRARY}
                ${BMP_LIBRARY}
                PARENT_SCOPE
    )

    set( EXTERNAL_DEPENDENCY_INCLUDE_DIR
                ${ZLIB_INCLUDE_DIR}
                ${PNG_INCLUDE_DIR}
                ${SDL_IMAGE_INCLUDE_DIR}
                ${GLFW_INCLUDE_DIR}
                ${GLEW_INCLUDE_DIR}
                ${SDL_INCLUDE_DIR}
                ${BMP_INCLUDE_DIR}
                PARENT_SCOPE
    )

    set( EXTERNAL_DEPENDENCY_DEFINITIONS
                ${GLFW_DEFINITIONS}
                ${GLEW_DEFINITIONS}
                ${BMP_DEFINITIONS}
    )

    set( EXTERNAL_DEPENDENCY_DEFINITIONS ${EXTERNAL_DEPENDENCY_DEFINITIONS} PARENT_SCOPE )

    #set( SDL_LIBRARY ${SDL_LIBRARY} PARENT_SCOPE ) 
    #set( MY_VAR "THIS IS A TEST" PARENT_SCOPE )
endfunction()
