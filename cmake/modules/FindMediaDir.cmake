

set( MEDIA_DIRECTORY ${CMAKE_SOURCE_DIR}/slnsub CACHE PATH "Path to sub directory" )

if(NOT IS_DIRECTORY ${MEDIA_DIRECTORY} )
	message( STATUS "Need to add sln sub as a submodule")
else()
	message( STATUS "SLN sub exists, good job!")
endif()