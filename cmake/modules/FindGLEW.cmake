#.rst:
# FindGLEW
# --------
#
# Find the OpenGL Extension Wrangler Library (GLEW)
#
# This module defines the following variables:
#
# ::
#
#   GLEW_INCLUDE_DIRS - include directories for GLEW
#   GLEW_LIBRARIES - libraries to link against GLEW
#   GLEW_FOUND - true if GLEW has been found and can be used

#=============================================================================
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

find_path(GLEW_INCLUDE_DIR GL/glew.h)
find_library(GLEW_LIBRARY_RELEASE NAMES GLEW glew32 glew glew32s PATH_SUFFIXES lib64)
find_library(GLEW_LIBRARY_DEBUG NAMES GLEWd glew32d glewd glew32sd PATH_SUFFIXES lib64)

set(GLEW_INCLUDE_DIRS ${GLEW_INCLUDE_DIR})

include(${CMAKE_CURRENT_LIST_DIR}/SelectLibraryConfigurations.cmake)
select_library_configurations(GLEW)

#set(GLEW_LIBRARIES ${GLEW_LIBRARY})

if( GLEW_SHARED )
    set( GLEW_DEFINITIONS "" )
else()
    set( GLEW_DEFINITIONS "GLEW_STATIC" )
endif()


include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
find_package_handle_standard_args(GLEW
                                  REQUIRED_VARS GLEW_INCLUDE_DIR GLEW_LIBRARY)

#mark_as_advanced(GLEW_INCLUDE_DIR GLEW_LIBRARY)
