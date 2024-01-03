cmake_minimum_required(VERSION 3.6)
set(PROJECT_NAME ftgl)
project(${PROJECT_NAME})

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CONFIGURATION_TYPES "Release" CACHE STRING "" FORCE)

if (CMAKE_SYSTEM_NAME STREQUAL "Windows")
  set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} /GS- /MT /D_CRT_SECURE_NO_WARNINGS" )
elseif(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
  SET(CMAKE_OSX_DEPLOYMENT_TARGET 11.0)
  set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -O2 -std=c++11 -arch arm64 -mmacosx-version-min=11" )
endif()

add_subdirectory("freetype")
include_directories("freetype/include")

set(SOURCE_FILES FTFontAtlas.cpp FTFontAtlas.h)

add_library(${PROJECT_NAME} STATIC ${SOURCE_FILES})
target_link_libraries(${PROJECT_NAME} PRIVATE freetype)
