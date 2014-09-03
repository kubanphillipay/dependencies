cmake_minimum_required (VERSION 2.6)


project( GLEW )

#file( GLOB Chrono_Sources src/*.cpp )


if( GLEW_BUILD_SHARED )
	message( STATUS "Glew cmake list not setup for building shared" )
endif()


####### SET SOURCE FILES ######

include_directories( include )

set( GLEW_SOURCES src/glew.c )
set( GLEW_HEADERS 
	include/GL/glew.h 
)

#if( WIN32 )
#	set( GLEW_HEADERS ${GLEW_HEADERS} include/GL/wglew.h )
#endif()

###### add library ############

add_library(  glew ${GLEW_SOURCES}  ${GLEW_HEADERS} )

set_property( TARGET glew PROPERTY COMPILE_DEFINITIONS "GLEW_STATIC" )


##### install #############

install(TARGETS 
glew LIBRARY DESTINATION "lib"
  ARCHIVE DESTINATION "lib")
install(FILES ${GLEW_HEADERS} DESTINATION include/GL )
