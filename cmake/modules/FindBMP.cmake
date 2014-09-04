#.rst:
# FindSDL
# -------
#
# Locate SDL library
#
# This module defines
#
# ::
#
#   SDL_LIBRARY, the name of the library to link against
#   SDL_FOUND, if false, do not try to link to SDL
#   SDL_INCLUDE_DIR, where to find SDL.h
#   SDL_VERSION_STRING, human-readable string containing the version of SDL
#
#
#
# This module responds to the flag:
#
# ::
#
#   SDL_BUILDING_LIBRARY
#     If this is defined, then no SDL_main will be linked in because
#     only applications need main().
#     Otherwise, it is assumed you are building an application and this
#     module will attempt to locate and set the proper link flags
#     as part of the returned SDL_LIBRARY variable.
#
#
#
# Don't forget to include SDLmain.h and SDLmain.m your project for the
# OS X framework based version.  (Other versions link to -lSDLmain which
# this module will try to find on your behalf.) Also for OS X, this
# module will automatically add the -framework Cocoa on your behalf.
#
#
#
# Additional Note: If you see an empty SDL_LIBRARY_TEMP in your
# configuration and no SDL_LIBRARY, it means CMake did not find your SDL
# library (SDL.dll, libsdl.so, SDL.framework, etc).  Set
# SDL_LIBRARY_TEMP to point to your SDL library, and configure again.
# Similarly, if you see an empty SDLMAIN_LIBRARY, you should set this
# value as appropriate.  These values are used to generate the final
# SDL_LIBRARY variable, but when these values are unset, SDL_LIBRARY
# does not get created.
#
#
#
# $SDLDIR is an environment variable that would correspond to the
# ./configure --prefix=$SDLDIR used in building SDL.  l.e.galup 9-20-02
#
# Modified by Eric Wing.  Added code to assist with automated building
# by using environmental variables and providing a more
# controlled/consistent search behavior.  Added new modifications to
# recognize OS X frameworks and additional Unix paths (FreeBSD, etc).
# Also corrected the header search path to follow "proper" SDL
# guidelines.  Added a search for SDLmain which is needed by some
# platforms.  Added a search for threads which is needed by some
# platforms.  Added needed compile switches for MinGW.
#
# On OSX, this will prefer the Framework version (if found) over others.
# People will have to manually change the cache values of SDL_LIBRARY to
# override this selection or set the CMake environment
# CMAKE_INCLUDE_PATH to modify the search paths.
#
# Note that the header path has changed from SDL/SDL.h to just SDL.h
# This needed to change because "proper" SDL convention is #include
# "SDL.h", not <SDL/SDL.h>.  This is done for portability reasons
# because not all systems place things in SDL/ (see FreeBSD).

#=============================================================================
# Copyright 2003-2009 Kitware, Inc.
# Copyright 2012 Benjamin Eikel
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file Copyright.txt for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#=============================================================================
# (To distribute this file outside of CMake, substitute the full
#  License text for the above reference.)
set( BMP_RELEASE-NOTFOUND FALSE )
set( BMP_DEBUG-NOTFOUND FALSE )

find_path(BMP_INCLUDE_DIR boost_mega_pack.h
    PATH_SUFFIXES boost
)

if( BMP_INCLUDE_DIR STREQUAL "BMP_INCLUDE_DIR-NOTFOUND" )
    message( FATAL_ERROR "Could not find bmp include dir" )
endif()


set( BOOST_LIBS )

include(${CMAKE_CURRENT_LIST_DIR}/SelectLibraryConfigurations.cmake)

foreach( comp ${BMP_FIND_COMPONENTS} )
    #message ( STATUS "Looking for component ${comp_temp}" )
    #set( comp ${comp_temp} )
    string( TOLOWER ${comp} comp )
    string( CONCAT comp "bmp_" ${comp} "_lib" )

    string( TOUPPER ${comp} comp_upper )



    #message ( STATUS "Looking for component: ${comp}   upper: ${comp_upper}" )
    #message ( STATUS "Looking for component ${comp}" )

    find_library(${comp_upper}_LIBRARY_RELEASE
        NAMES ${comp}
        PATH_SUFFIXES )

    find_library(${comp_upper}_LIBRARY_DEBUG
        NAMES ${comp}d
        PATH_SUFFIXES )


    select_library_configurations(${comp_upper})

    #message ( STATUS "Comp upper lib: ${${comp_upper}_LIBRARY}" )


    if( NOT ${comp_upper}_LIBRARY_RELEASE AND BMP_FIND_REQUIRED )
        message( FATAL_ERROR "BMP Release not found and Required was set" )
    endif()

    if( NOT ${comp_upper}_LIBRARY_DEBUG AND BMP_FIND_REQUIRED )
        message( FATAL_ERROR "BMP Debug not found and Required was set" )
    endif()

    #if(  BMP_${comp}_RELEASE STREQUAL "BMP_${comp}_RELEASE-NOTFOUND" )
    #    set( BMP_RELEASE-NOTFOUND TRUE )
    #endif()

    #if(  BMP_${comp}_DEBUG STREQUAL "BMP_${comp}_DEBUG-NOTFOUND" )
    #    set( BMP_DEBUG-NOTFOUND TRUE )
    #endif()

    #if( BMP_FIND_REQUIRED )
    #    message( STATUS "BMP REQUIRED" )
    #    if(  NOT BMP_RELEASE-NOTFOUND )
    #        message( FATAL_ERROR "BMP Release not found and Required was set" )
    #    elseif( NOT BMP_DEBUG-NOTFOUND )
    #        message( FATAL_ERROR "BMP Debug not found and Required was set" )
    #    endif()
    #endif()


    set( BMP_LIBRARY ${BMP_LIBRARY} ${${comp_upper}_LIBRARY} )


endforeach(comp)

#message( STATUS "BOOST_INCLUDES ${BMP_INCLUDE_DIR}")
#message( STATUS "BOOST_LIBS: ${BOOST_LIBS}" )




#if(SDL_INCLUDE_DIR AND EXISTS "${SDL_INCLUDE_DIR}/SDL_version.h")
#  file(STRINGS "${SDL_INCLUDE_DIR}/SDL_version.h" SDL_VERSION_MAJOR_LINE REGEX "^#define[ \t]+SDL_MAJOR_VERSION[ \t]+[0-9]+$")
#  file(STRINGS "${SDL_INCLUDE_DIR}/SDL_version.h" SDL_VERSION_MINOR_LINE REGEX "^#define[ \t]+SDL_MINOR_VERSION[ \t]+[0-9]+$")
#  file(STRINGS "${SDL_INCLUDE_DIR}/SDL_version.h" SDL_VERSION_PATCH_LINE REGEX "^#define[ \t]+SDL_PATCHLEVEL[ \t]+[0-9]+$")
#  string(REGEX REPLACE "^#define[ \t]+SDL_MAJOR_VERSION[ \t]+([0-9]+)$" "\\1" SDL_VERSION_MAJOR "${SDL_VERSION_MAJOR_LINE}")
#  string(REGEX REPLACE "^#define[ \t]+SDL_MINOR_VERSION[ \t]+([0-9]+)$" "\\1" SDL_VERSION_MINOR "${SDL_VERSION_MINOR_LINE}")
#  string(REGEX REPLACE "^#define[ \t]+SDL_PATCHLEVEL[ \t]+([0-9]+)$" "\\1" SDL_VERSION_PATCH "${SDL_VERSION_PATCH_LINE}")
#  set(SDL_VERSION_STRING ${SDL_VERSION_MAJOR}.${SDL_VERSION_MINOR}.${SDL_VERSION_PATCH})
#  unset(SDL_VERSION_MAJOR_LINE)
#  unset(SDL_VERSION_MINOR_LINE)
#  unset(SDL_VERSION_PATCH_LINE)
#  unset(SDL_VERSION_MAJOR)
#  unset(SDL_VERSION_MINOR)
#  unset(SDL_VERSION_PATCH)
#endif()

#include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)

#FIND_PACKAGE_HANDLE_STANDARD_ARGS(SDL
#                                  REQUIRED_VARS SDL_LIBRARY SDL_INCLUDE_DIR
#                                  VERSION_VAR SDL_VERSION_STRING)
