cmake_minimum_required(VERSION 3.6)
set(PROJECT_NAME ftgl)
project(${PROJECT_NAME})

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CONFIGURATION_TYPES "Release" CACHE STRING "" FORCE)

if (CMAKE_SYSTEM_NAME STREQUAL "Windows")
  set(CMAKE_CXX_FLAGS_RELEASE "/GS- /MT /D_CRT_SECURE_NO_WARNINGS" )
endif()

add_subdirectory("freetype")
include_directories("freetype/include")

set(SOURCE_FILES FTFontAtlas.cpp FTFontAtlas.h)

#set_target_properties(freetype PROPERTIES IMPORTED_LOCATION freetype.lib)

add_library(${PROJECT_NAME} STATIC ${SOURCE_FILES})
target_link_libraries(${PROJECT_NAME} PRIVATE freetype)
