#message( STATUS "Findng Jsoncpp" )

find_path(JSONCPP_INCLUDE_DIR json.h
    PATHS ${CMAKE_INSTALL_PREFIX}/include
    NO_DEFAULT_PATH
    PATH_SUFFIXES json
)

find_library(JSONCPP_LIBRARY_RELEASE
   PATHS ${CMAKE_INSTALL_PREFIX}/lib
  NO_DEFAULT_PATH
  NAMES jsconcpp.a jsoncpp 
)

find_library(JSONCPP_LIBRARY_DEBUG
  PATHS ${CMAKE_INSTALL_PREFIX}/lib
  NO_DEFAULT_PATH
  NAMES jsoncppd.a jsoncppd
)

include(FindPackageHandleStandardArgs)
include(SelectLibraryConfigurations)
select_library_configurations(JSONCPP)

#MESSAGE( STATUS "FindZlib: ZLIB_LIBRARY: ${ZLIB_LIBRARY}" )


FIND_PACKAGE_HANDLE_STANDARD_ARGS(JSONCPP
                                  REQUIRED_VARS JSONCPP_LIBRARY JSONCPP_INCLUDE_DIR)
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



