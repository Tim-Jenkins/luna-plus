cmake_minimum_required(VERSION 3.21)

project(LunaPlus LANGUAGES C CXX RC)

if(NOT MSVC)
  message(FATAL_ERROR "LUNA builds with MSVC only for now (see docs/adr/0001).")
endif()
if(NOT CMAKE_SIZEOF_VOID_P EQUAL 4)
  message(FATAL_ERROR "LUNA builds as 32-bit (Win32) only for now. Configure with -A Win32 (see #10 for 64-bit).")
endif()

set(LUNA_ROOT "${CMAKE_CURRENT_SOURCE_DIR}")
list(APPEND CMAKE_MODULE_PATH "${LUNA_ROOT}/cmake")
include(LunaLegacy)

# Static CRT everywhere; see docs/adr/0001.
set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")

# Put all binaries in one place so the servers can find the COM DLLs next to them.
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")

# Libraries
add_subdirectory("[Lib]YHLibrary")
add_subdirectory("[Lib]DBThread")
add_subdirectory("4DyuchiNET_Latest")
add_subdirectory("4DyuchiGXGFunc")
add_subdirectory("4DyuchiFileStorage")
add_subdirectory("4DYUCHIGX_RENDER")
add_subdirectory("4DyuchiGXGeometry")
add_subdirectory("4DYUCHIGXEXECUTIVE")
add_subdirectory("SoundLib")

# Servers
add_subdirectory("[Server]Agent")
add_subdirectory("[Server]Distribute")
add_subdirectory("[Server]Map")

# Client
add_subdirectory("[Client]LUNA")
