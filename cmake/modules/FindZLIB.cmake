#message( STATUS "Findng Zlib" )

find_path(ZLIB_INCLUDE_DIR zlib.h
  PATHS ${CMAKE_INSTALL_PREFIX}/include
  NO_DEFAULT_PATH
  PATH_SUFFIXES zlib 
)
#find_path(TEST_INCLUDE_DIR test.h
#  PATHS ${CMAKE_INSTALL_PREFIX}/include
#  ${CMAKE_INSTALL_PREFIX}
#  PATH_SUFFIXES test 
#)
#
#MESSAGE( STATUS "Zlib: CMAKE_INSTALL_PREFIX: ${CMAKE_INSTALL_PREFIX}" )
#MESSAGE( STATUS "Zlib: TEST_INCLUDE_DIR: ${TEST_INCLUDE_DIR}" )
#
#
#MESSAGE( STATUS "FindZlib: ZLIB_INCLUDE_DIR: ${ZLIB_INCLUDE_DIR}" )


find_library(ZLIB_LIBRARY_RELEASE
   PATHS ${CMAKE_INSTALL_PREFIX}/lib
  NO_DEFAULT_PATH
  NAMES libz.a zlibstatic libz 
)

find_library(ZLIB_LIBRARY_DEBUG
  PATHS ${CMAKE_INSTALL_PREFIX}/lib
  NO_DEFAULT_PATH
  NAMES libzd.a zlibstaticd  libzd 
)
#include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
#include(${CMAKE_CURRENT_LIST_DIR}/SelectLibraryConfigurations.cmake)
include(FindPackageHandleStandardArgs)
include(SelectLibraryConfigurations)
select_library_configurations(ZLIB)

#MESSAGE( STATUS "FindZlib: ZLIB_LIBRARY: ${ZLIB_LIBRARY}" )


FIND_PACKAGE_HANDLE_STANDARD_ARGS(ZLIB
                                  REQUIRED_VARS ZLIB_LIBRARY ZLIB_INCLUDE_DIR)

