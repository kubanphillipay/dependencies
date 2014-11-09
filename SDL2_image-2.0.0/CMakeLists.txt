CMAKE_MINIMUM_REQUIRED(VERSION 3.0 )
PROJECT(ProjectName)

  
#include(supp/SetupInstallPath.cmake)

if( NOT SDL_INCLUDE_DIR  )
   message( FATAL_ERROR "SDL_PATH SHOULD BE SET" )
   FIND_PACKAGE(SDL REQUIRED )
endif()

if( NOT ZLIB_INCLUDE_DIR  )
   message( FATAL_ERROR "ZLIB_PATH SHOULD BE SET" )
   FIND_PACKAGE(ZLIB REQUIRED )
endif()

if( NOT PNG_INCLUDE_DIR  )
   message( FATAL_ERROR "SDL_PATH SHOULD BE SET" )
   FIND_PACKAGE(PNG REQUIRED )
endif()

SET(DEBUG_VAR ON)

if(DEBUG_VAR)
   MESSAGE( STATUS "SDL_INCLUDE_DIR: ${SDL_INCLUDE_DIR}" )

   MESSAGE( STATUS "PNG_INCLUDE_DIR: ${PNG_INCLUDE_DIR}" )

   MESSAGE( STATUS "ZLIB_INCLUDE_DIR: ${ZLIB_INCLUDE_DIR}" )
endif()

SET( SOURCES 
    IMG.c
    IMG_bmp.c
    IMG_gif.c
    IMG_jpg.c
    IMG_lbm.c
    IMG_pcx.c
    IMG_png.c
    IMG_pnm.c
    IMG_tga.c
    IMG_tif.c
    IMG_webp.c
    IMG_xcf.c
    IMG_xpm.c
    IMG_xv.c
    IMG_xxx.c
)


set(CMAKE_DEBUG_POSTFIX "d")

SET( HEADERS 
   SDL_image.h
)


SET( IMAGE_SOURCES 
       showimage.c
)

INCLUDE_DIRECTORIES(
   ${SDL_INCLUDE_DIR}
   ${PNG_INCLUDE_DIR}
   ${ZLIB_INCLUDE_DIR}
)

ADD_LIBRARY(sdl_image STATIC
   ${SOURCES}
   ${HEADERS}
)

#ADD_EXECUTABLE(showimage ${IMAGE_SOURCES} )
#TARGET_LINK_LIBRARIES(showimage 
#   sdl_image 
#   ${SDL_LIBRARY}
#   ${PNG_LIBRARY}
#   ${ZLIB_LIBRARY}
#)
SET(SDL_IMAGE_PROPERTIES 
   "LOAD_PNG"     
   "LOAD_BMP" 
   )

set_property( TARGET sdl_image PROPERTY COMPILE_DEFINITIONS 
   ${SDL_IMAGE_PROPERTIES} )


install(TARGETS 
sdl_image LIBRARY DESTINATION "lib"
  ARCHIVE DESTINATION "lib")

install(FILES ${HEADERS} DESTINATION include/SDL_Image )
