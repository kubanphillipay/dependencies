
function( PreventInSourceBuild )
    if("${PROJECT_SOURCE_DIR}" STREQUAL "${PROJECT_BINARY_DIR}")
        message( FATAL_ERROR "In-source builds are not permitted. Make a separate folder for building:\n"
            "mkdir build; cd build; cmake ..\nBefore that, remove the files already created:\n"
            "rm -rf CMakeCache.txt CMakeFiles" )
    else()
        message( STATUS "Build is out of source, good job" )
    endif()
endfunction()

