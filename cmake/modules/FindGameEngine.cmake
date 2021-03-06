
include(${CMAKE_MODULE_PATH}/Loadexternaldependencies.cmake)
load_external_dependencies()

SET( LIB_NAME "gameengine" )

find_path(${LIB_NAME}_INCLUDE_DIR game_engine.h
  PATH_SUFFIXES GameEngine
)

find_library(${LIB_NAME}_LIBRARY_RELEASE
  NAMES ${LIB_NAME}
)

find_library(${LIB_NAME}_LIBRARY_DEBUG
  NAMES ${LIB_NAME}d
)

if( ${LIB_NAME}_SHARED )
    set( ${LIB_NAME}_DEFINITIONS "" )
else()
    set( ${LIB_NAME}_DEFINITIONS "" )
endif()

select_library_configurations( ${LIB_NAME} )

FIND_PACKAGE_HANDLE_STANDARD_ARGS( ${LIB_NAME}
                            REQUIRED_VARS ${LIB_NAME}_LIBRARY ${LIB_NAME}_INCLUDE_DIR )




set( EXTERNAL_DEPENDENCY_LIBRARY ${EXTERNAL_DEPENDENCY_LIBRARY} PARENT_SCOPE )
