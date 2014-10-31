cmake_minimum_required (VERSION 2.6)

#############

project( Dependencies ) 


set (BUILD_SDL ON CACHE BOOL "Build SDL?" )
set (BUILD_GLFW ON CACHE BOOL "Build GLFW?" )
set (BUILD_GLEW ON CACHE BOOL "Build GLEW?" )
set (BUILD_GLM ON CACHE BOOL "Build GLM?" )
set (BUILD_BOOST_MEGA_PACK ON CACHE BOOL "Build Boost Mega Pack?" )
set (BUILD_LIB_PNG OFF )
set (BUILD_ENGINE OFF )



#############

string( REGEX REPLACE "Source" "Install" Install_Path ${CMAKE_SOURCE_DIR} )
string( REGEX REPLACE "Source" "Install" Install_Path ${Install_Path} )


#message( STATUS "Install Path: ${Install_Path}" )
#SET(Install_Path ${Install_Path} CACHE PATH  "Path for cmake install prefix" ) 
#SET(CMAKE_INSTALL_PREFIX ${Install_Path} CACHE PATH  "Path for cmake install prefix" FORCE ) 


set(CMAKE_DEBUG_POSTFIX "d")


########### SDL ###########

if( BUILD_SDL )

	message( STATUS "Looking for SDL directory" )
	
   find_path( SDL_PATH SDL.h 
		HINTS ${CMAKE_SOURCE_DIR}
		PATHS SDL2-2.0.3
		PATH_SUFFIXES include
	)
	
	string( REGEX REPLACE "/include" "" SDL_PATH ${SDL_PATH} )

	if(${SDL_PATH} STREQUAL "SDL_PATH-NOTFOUND" )
		message( FATAL_ERROR "SDL PATH NOT FOUND AND BUILD SET TO ON" )
	else()
		message( STATUS "SDL_PATH ${SDL_PATH}" )		
	endif()


   if(WIN32)
	   set( 3DNOW OFF CACHE INTERNAL "Set" FORCE )
	   set( ALSA OFF CACHE INTERNAL "Set" FORCE )
	   set( ARTS OFF CACHE INTERNAL "Set" FORCE )
	   set( ASSEMBLY OFF CACHE INTERNAL "Set" FORCE )
	   set( CLOCK_GETTIME OFF CACHE INTERNAL "Set" FORCE)
	   set( DIRECTX OFF CACHE INTERNAL "Set" FORCE)
	   set( ESD OFF CACHE INTERNAL "Set" FORCE)
	   set( FORCE_STATIC_VCRT OFF CACHE INTERNAL "Set" FORCE)
	   set( FUSIONSOUND OFF CACHE INTERNAL "Set" FORCE)
	   set( GCC_ATOMICS OFF CACHE INTERNAL "Set" FORCE)
	   set( INPUT_TSLIB OFF CACHE INTERNAL "Set" FORCE)
	   set( ESD OFF CACHE INTERNAL "Set" FORCE)
	   set( PULSEAUDIO OFF CACHE INTERNAL "Set" FORCE)
	   set( RPATH OFF CACHE INTERNAL "Set" FORCE)

	   set( MMX OFF CACHE INTERNAL "Set" FORCE)
	   set( NAS OFF CACHE INTERNAL "Set" FORCE)
	   set( NAS_SHARED OFF CACHE INTERNAL "Set" FORCE)
	   set( OSS OFF CACHE INTERNAL "Set" FORCE)
   endif()

	if( NOT WIN32 )
		set( PTHREADS ON CACHE INTERNAL "Set" FORCE)	
		set( LIBC ON CACHE INTERNAL "Set" FORCE )
	else()
		set( PTHREADS OFF CACHE INTERNAL "Set" FORCE)
		set( LIBC OFF CACHE INTERNAL "Set" FORCE )
	endif()


   if(WIN32)
	   set( SSE2 OFF CACHE INTERNAL "Set" FORCE)
	   set( SSEMATH OFF CACHE INTERNAL "Set" FORCE)
	   set( SNDIO OFF CACHE INTERNAL "Set" FORCE)
	   set( VIDEO_COCOA OFF CACHE INTERNAL "Set" FORCE)
	   set( VIDEO_DIRECTFB OFF CACHE INTERNAL "Set" FORCE)
	   set( VIDEO_MIR OFF CACHE INTERNAL "Set" FORCE)

	   set( ALTIVEC OFF CACHE INTERNAL "Set" FORCE)
	   set( DISKAUDIO OFF CACHE INTERNAL "Set" FORCE)
	   set( DUMMYAUDIO OFF CACHE INTERNAL "Set" FORCE)
	   set( RENDER_D3D OFF CACHE INTERNAL "Set" FORCE)
	   set( SSE OFF CACHE INTERNAL "Set" FORCE)
	   set( VIDEO_DUMMY OFF CACHE INTERNAL "Set" FORCE)
	   set( VIDEO_X11 OFF CACHE INTERNAL "Set" FORCE)
	   set( VIDEO_WAYLAND OFF CACHE INTERNAL "Set" FORCE)
   endif()

	#This is how it's going to be for now, want to do static eventually
	set( SDL_STATIC OFF CACHE INTERNAL "Set" FORCE)
	set( SDL_SHARED ON CACHE INTERNAL "Set" FORCE)

   if(WIN32)
	set( WINDRES "WINDRES-NOTFOUND" CACHE INTERNAL "Set" FORCE)
	set( ASSERTIONS "auto" CACHE INTERNAL "Set" FORCE)
   endif()
	

	add_subdirectory( ${SDL_PATH} )


endif()


########### GLFW ##########


if( BUILD_GLFW )


	message( STATUS "Looking for GLFW directory" )
	
	set( lib_name "GLFW" )

	find_path( ${lib_name}_PATH_TEMP glfw3.h
		HINTS ${CMAKE_SOURCE_DIR}
		PATHS glfw-3.0.4
		PATH_SUFFIXES include/GLFW
	)
	
	if(${${lib_name}_PATH_TEMP} STREQUAL "${lib_name}_PATH_TEMP-NOTFOUND" )
		message( FATAL_ERROR "${lib_name} PATH NOT FOUND AND BUILD SET TO ON" )		
	endif()

	string( REGEX REPLACE "include/GLFW" "" ${lib_name}_PATH_TEMP ${${lib_name}_PATH_TEMP} )
	mark_as_advanced(${lib_name}_PATH_TEMP)

	set(${lib_name}_PATH ${${lib_name}_PATH_TEMP} CACHE PATH "Path to ${lib_name}" )
	

	set( BUILD_SHARED_LIBS OFF CACHE INTERNAL "GLFW Shared Libs" FORCE)
	set( GLFW_BUILD_DOCS OFF CACHE INTERNAL "GLFW Build Docs" FORCE)
	set( GLFW_DOCUMENT_INTERNALS OFF CACHE INTERNAL "GLFW Build Docs" FORCE)
	set( GLFW_USE_DWM_SWAP_INTERVAL OFF CACHE INTERNAL "GLFW Build Docs" FORCE)
	set( GLFW_USE_EGL OFF CACHE INTERNAL "GLFW Build Docs" FORCE)
	set( GLFW_USE_OPTIMUS_HPG OFF CACHE INTERNAL "GLFW Build Docs" FORCE)
	set( USE_MSVC_RUNTIME_LIBRARY_DLL ON CACHE INTERNAL "GLFW Build Docs" FORCE)

	set( GLFW_INSTALL ON CACHE INTERNAL "Install GLFW" FORCE)

	set( GLFW_BUILD_TESTS OFF CACHE BOOL "GLFW Build Tests" FORCE)
	set( GLFW_BUILD_EXAMPLES OFF CACHE BOOL "GLFW Build Examples" FORCE)


	add_subdirectory( ${${lib_name}_PATH} )


endif()



########### GLEW #########


if( BUILD_GLEW )	
	
	set( lib_name "GLEW" )

	message( STATUS "Looking for ${lib_name} directory" )
	
	find_path( ${lib_name}_PATH_TEMP glew.h
		HINTS ${CMAKE_SOURCE_DIR}
		PATHS glew-1.11.0
      NO_DEFAULT_PATH
      PATH_SUFFIXES include/GL
	)	
	
	if(${${lib_name}_PATH_TEMP} STREQUAL "${lib_name}_PATH_TEMP-NOTFOUND" )
		message( FATAL_ERROR "${lib_name} PATH NOT FOUND AND BUILD SET TO ON" )		
	endif()

   message( STATUS "#### ${lib_name}_PATH_TEMP: ${${lib_name}_PATH_TEMP}" )
   string( REGEX REPLACE "include/GL" "" ${lib_name}_PATH_TEMP ${${lib_name}_PATH_TEMP} )
   message( STATUS "#### ${lib_name}_PATH_TEMP: ${${lib_name}_PATH_TEMP}" )
	mark_as_advanced(${lib_name}_PATH_TEMP)

	set(${lib_name}_PATH ${${lib_name}_PATH_TEMP} CACHE PATH "Path to ${lib_name}" )


	add_subdirectory( ${${lib_name}_PATH} )




endif()




########### GLM #########


if( BUILD_GLM )

	set( lib_name "GLM" )

	message( STATUS "Looking for ${lib_name} directory" )
	
	find_path( ${lib_name}_PATH_TEMP glm.hpp
		HINTS ${CMAKE_SOURCE_DIR}
		PATHS glm-0.9.5.4
		PATH_SUFFIXES glm/glm
	)	
	
	if(${${lib_name}_PATH_TEMP} STREQUAL "${lib_name}_PATH_TEMP-NOTFOUND" )
		message( FATAL_ERROR "${lib_name} PATH NOT FOUND AND BUILD SET TO ON" )		
	endif()

	string( REGEX REPLACE "glm/glm" "glm" ${lib_name}_PATH_TEMP ${${lib_name}_PATH_TEMP} )
	mark_as_advanced(${lib_name}_PATH_TEMP)

	set(${lib_name}_PATH ${${lib_name}_PATH_TEMP} CACHE PATH "Path to ${lib_name}" )


	set( GLM_TEST_ENABLE OFF CACHE BOOL "GLM Test" FORCE)


	add_subdirectory( ${${lib_name}_PATH} )


endif()






########### BOOST #########


if( BUILD_BOOST_MEGA_PACK )

	message( STATUS "Looking for Boost mega pack directory" )
	
	find_path( BMP_PATH boost_mega_pack.h
		HINTS ${CMAKE_SOURCE_DIR}
		PATHS boost_mega_pack
		PATH_SUFFIXES 
	)	

	if(${BMP_PATH} STREQUAL "BMP_PATH-NOTFOUND" )
		message( FATAL_ERROR "Boost mega pack PATH NOT FOUND AND BUILD SET TO ON" )
	else()
		message( STATUS "BMP_PATH ${BMP_PATH}" )		
	endif()

	add_subdirectory( ${BMP_PATH} )


endif()


########### LIB_PNG #######


if( BUILD_LIB_PNG )

	message( FATAL_ERROR "Lib PNG build not supported at this time" )
endif()


######### Cmake files #######


install(DIRECTORY cmake DESTINATION ./ )




########## ENGINE #########


if( BUILD_ENGINE )
	message( FATAL_ERROR "Engine build not supported at this time" )
endif()
