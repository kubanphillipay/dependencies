

function( SetInstalPath )
    #message( STATUS "Checking the dependency Path..." )

    set( CACHE_SET OFF CACHE BOOL "CACHE IS SET" )

    if(NOT CACHE_SET  )
        message( FATAL_ERROR "Please set the CMAKE_INSTALL_PREFIX to where your dependencies are installed")
        set( CACHE_SET ON FORCE )
    else()
        message( STATUS "Prefix path is set")
        #set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_INSTALL_PREFIX}/cmake/modules/" PARENT_SCOPE )
    endif()

endfunction()

SetInstalPath()


