
#NOT USING THIS YET BUT I MIGHT
if(CMAKE_SIZEOF_VOID_P EQUAL 8)
  set(VC_LIB_PATH_SUFFIX lib/x64)
else()
  set(VC_LIB_PATH_SUFFIX lib/x86)
endif()


find_path(GLFW_INCLUDE_DIR glfw3.h
  PATH_SUFFIXES GLFW
)

find_library(GLFW_LIBRARY_RELEASE
  NAMES glfw3
)

find_library(GLFW_LIBRARY_DEBUG
  NAMES glfw3d
)

include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/SelectLibraryConfigurations.cmake)
select_library_configurations(GLFW)


if( GLFW_SHARED )
    set( GLFW_DEFINITIONS "GLFW_DLL" )
else()
    set( GLFW_DEFINITIONS "" )
endif()


FIND_PACKAGE_HANDLE_STANDARD_ARGS(GLFW
                                  REQUIRED_VARS GLFW_LIBRARY GLFW_INCLUDE_DIR)

set( GLFW_DEFINITIONS ${GLFW_DEFINITIONS} PARENT_SCOPE )
