
#NOT USING THIS YET BUT I MIGHT
if(CMAKE_SIZEOF_VOID_P EQUAL 8)
  set(VC_LIB_PATH_SUFFIX lib/x64)
else()
  set(VC_LIB_PATH_SUFFIX lib/x86)
endif()


find_path(GLM_INCLUDE_DIR glm.hpp
  PATH_SUFFIXES glm
)

