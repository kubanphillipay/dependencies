#message( STATUS "Find png" )

find_path(PNG_INCLUDE_DIR png.h
  PATHS ${CMAKE_INSTALL_PREFIX}/include
  NO_DEFAULT_PATH
  PATH_SUFFIXES libpng16 libpng17
)

find_library(PNG_LIBRARY_RELEASE
  PATHS ${CMAKE_INSTALL_PREFIX}/lib
  NO_DEFAULT_PATH
  NAMES libpng16.a libpng16_static png16 png17
)

find_library(PNG_LIBRARY_DEBUG
  PATHS ${CMAKE_INSTALL_PREFIX}/lib
  NO_DEFAULT_PATH
  NAMES libpng16d.a libpng16_staticd png16d png17d
)

#MESSAGE( STATUS "FindPNG: PNG_LIBRARY_DEBUG: ${PNG_LIBRARY_DEBUG}" )
#MESSAGE( STATUS "FindPNG: PNG_LIBRARY_RELEASE: ${PNG_LIBRARY_RELEASE}" )


if(NOT WIN32)
  find_library(M_LIBRARY
    NAMES m
    PATHS /usr/lib /usr/local/lib
  )
  if(NOT M_LIBRARY)
     message(FATAL_ERROR
        "Error M library not found on linux")
     #else()
     #elsMESSAGE( STATUS "FindPng: M_LIBRARY: ${M_LIBRARY}" )
  endif()
else()
  # not needed on windows
  set(M_LIBRARY "")
endif()



#message( STATUS "WHAT" )
include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/SelectLibraryConfigurations.cmake)
select_library_configurations(PNG)

#MESSAGE( STATUS "FindPNG: PNG_LIBRARY Pre: ${PNG_LIBRARY}" )

set( PNG_LIBRARY ${PNG_LIBRARY} ${M_LIBRARY} )

#MESSAGE( STATUS "FindPNG: PNG_LIBRARY Post: ${PNG_LIBRARY}" )
FIND_PACKAGE_HANDLE_STANDARD_ARGS(PNG
                                  REQUIRED_VARS PNG_LIBRARY PNG_INCLUDE_DIR)

