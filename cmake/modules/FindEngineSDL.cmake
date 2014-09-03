
set( BUILD_SDL_LIB false CACHE bool "Set to true to build the library with the project.  False to compile it seperately and include the library files manually" )

set( SDL_DIRECTORY "" CACHE PATH "Path to top level lib directory" )

if( NOT SDL_DIRECTORY )
    message( FATAL_ERROR "Need to set SDL Directory" )
endif()

string(REGEX REPLACE "/include$" "" SDL_DIRECTORY ${SDL_DIRECTORY} )
set( SDL_INCLUDE_DIRECTORIES "${SDL_DIRECTORY}/include" )

if(NOT IS_DIRECTORY ${SDL_DIRECTORY} )
	message( FATAL_ERROR "Need to add sln lib as a"
		  "git repo")
else()
	message( STATUS "SLN lib exists, good job!")
endif()


if( BUILD_LIB )

    unset( SDL_LIBRARY_DEBUG CACHE )
    unset( SDL_LIBRARY_RELEASE CACHE )

	message( FATAL_ERROR "Build lib not functional yet" )

	if( IS_DIRECTORY ${CMAKE_SOURCE_DIR}/slnlib )
		message(FATAL_ERROR "At this time slnlib must" 				"be included as a sibling directory and not" 				"as a subdirectory" )
	endif()

    add_subdirectory( ${LIB_INCLUDE_DIR}    					             ${CMAKE_BINARY_DIR}/slnlib  )

    set( LIB_LIBRARIES slnlib )


else()
	message( STATUS "Building SDL seperately from main build" )
    string(REGEX REPLACE "^.*/" "" SDL_DIR_NAME ${SDL_DIRECTORY} )

	string(REGEX REPLACE "/Source/${SDL_DIR_NAME}" "/Build/${SDL_DIR_NAME}" DEFAULT_BUILD_DIR ${SDL_DIRECTORY} )
	string(REGEX REPLACE "source/${SDL_DIR_NAME}" "/build/${SDL_DIR_NAME}" ${DEFAULT_BUILD_DIR} ${SDL_DIRECTORY} )

    set( SDL_LIB_NAME "SDL2.lib" )
    set( RELEASE_LIB "${DEFAULT_BUILD_DIR}/Release/${SDL_LIB_NAME}" )
    set( DEBUG_LIB "${DEFAULT_BUILD_DIR}/Debug/${SDL_LIB_NAME}" )

    unset( SDL_LIBRARY_DEBUG CACHE )
    unset( SDL_LIBRARY_RELEASE CACHE )

    message( STATUS "SDL_LIBRARY_DEBUG : ${DEBUG_LIB}" )
    message( STATUS "SDL_LIBRARY_RELEASE : ${RELEASE_LIB}" )

	set( SDL_LIBRARY_DEBUG ${DEBUG_LIB} CACHE FILE "Path to lib" )
	set( SDL_LIBRARY_RELEASE ${RELEASE_LIB} CACHE FILE "Path to lib" )

	string(REGEX REPLACE "\\.lib$" ".dll" SDL_SHARED_DEBUG ${SDL_LIBRARY_DEBUG} )
	string(REGEX REPLACE "\\.lib$" ".dll" SDL_SHARED_RELEASE ${SDL_LIBRARY_RELEASE} )

	if( NOT EXISTS ${SDL_LIBRARY_DEBUG} )
		message (FATAL_ERROR "SDL Debug Library file does not exist" )
	elseif( NOT EXISTS ${SDL_LIBRARY_RELEASE} )
		message (FATAL_ERROR "SDL Library file does not exist" )
	endif()

	set( SDL_LIBRARIES optimized ${SDL_LIBRARY_RELEASE} debug ${SDL_LIBRARY_DEBUG} )


endif()