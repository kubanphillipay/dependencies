

        #Probably should turn this into a macro, not a find package routine

        find_path(${LIB_NAME}_INCLUDE_DIR lib.h
          PATH_SUFFIXES slnlib
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

        select_library_configurations(${LIB_NAME} )

        FIND_PACKAGE_HANDLE_STANDARD_ARGS( ${LIB_NAME}
                                    REQUIRED_VARS ${LIB_NAME}_LIBRARY ${LIB_NAME}_INCLUDE_DIR )