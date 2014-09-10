function( load_slnlib arg1 )

    set( LIB_NAME "slnlib" )
    include(${CMAKE_MODULE_PATH}/FindPackageHandleStandardArgs.cmake)
    include(${CMAKE_MODULE_PATH}/SelectLibraryConfigurations.cmake)


    if( ${arg1} STREQUAL "BUILD_LIB" )

        include(${CMAKE_MODULE_PATH}/Loadslnlibdependencies.cmake)
        load_slnlib_dependencies()

        message( STATUS "Build lib is set" )

        set( LIB_PATH "${CMAKE_SOURCE_DIR}/../${LIB_NAME}" CACHE PATH "Path to lib" )

        #Variable used to show the project was built with the lib
        set( LIB_TYPE "Project built with exe" CACHE STRING "Is the build in the project?" FORCE )

        if( IS_DIRECTORY ${CMAKE_SOURCE_DIR}/${LIB_NAME} )
            message(FATAL_ERROR "Cannot have a sub directory with the same name as the external lib: ${LIB_NAME}" )
        endif()

        if( NOT IS_DIRECTORY ${LIB_PATH} )
            message( FATAL_ERROR "Could not find path to ${LIB_NAME}: ${LIB_PATH}" )
        endif()

        add_subdirectory( ${LIB_PATH} ${CMAKE_BINARY_DIR}/${LIB_NAME} )

        # PASS EXTERNAL VARIABLES UP THE CHAIN
        # Will need to add external definitions....
        #message( STATUS "Load->Build SLN: EXTERNAL_DEPENDENCY_LIBRARY: ${EXTERNAL_DEPENDENCY_LIBRARY}" )
        set( ${LIB_NAME}_INCLUDE_DIR ${${LIB_NAME}_INCLUDE_DIR} PARENT_SCOPE )
        set( ${LIB_NAME}_LIBRARY ${${LIB_NAME}_LIBRARY} PARENT_SCOPE )
        set( EXTERNAL_DEPENDENCY_LIBRARY ${EXTERNAL_DEPENDENCY_LIBRARY} PARENT_SCOPE )
        set( EXTERNAL_DEPENDENCY_DEFINITIONS ${EXTERNAL_DEPENDENCY_DEFINITIONS} PARENT_SCOPE )



    elseif( ${arg1} STREQUAL "LOAD_LIB")
        message( STATUS "Load lib is set" )

        find_package( slnlib REQUIRED )

        set( ${LIB_NAME}_LIBRARY ${${LIB_NAME}_LIBRARY} PARENT_SCOPE )
        set( EXTERNAL_DEPENDENCY_DEFINITIONS ${EXTERNAL_DEPENDENCY_DEFINITIONS} PARENT_SCOPE )



        #set( ${LIB_NAME}_LIBRARY ${${LIB_NAME}_LIBRARY} PARENT_SCOPE )

        #message( STATUS "after find slnlib_LIBRARY: ${slnlib_LIBRARY}" )

        #set( ${LIB_NAME}_INCLUDE_DIR ${${LIB_NAME}_INCLUDE_DIR} PARENT_SCOPE )

        #set( EXTERNAL_DEPENDENCY_LIBRARY ${EXTERNAL_DEPENDENCY_LIBRARY} PARENT_SCOPE )

        #message( STATUS "Load->Find SLN: EXTERNAL_DEPENDENCY_LIBRARY: ${EXTERNAL_DEPENDENCY_LIBRARY}" )
    else()

        message( STATUS "SLN Lib either needs to  be set to Load_Lib or Build_Lib" )

    endif()




endfunction()