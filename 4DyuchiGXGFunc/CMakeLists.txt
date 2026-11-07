# Converted from 4DyuchiGXGFunc.vcproj (Release|Win32). Engine math / container helpers,
# exported from global.cpp with __declspec(dllexport). The servers link it for
# SetRotationYMatrix, TransformVector3_VPTR2 and the ICxxx index-creator functions.
# Named SS3DGFunc.dll to match the prebuilt SS3DGFunc.lib the original servers linked;
# the .vcproj's own output name was SS3DGFuncN.dll.
add_library(4DyuchiGXGFunc SHARED
  "BinSearchAE.cpp"
  "create_index.cpp"
  "DPCQ.cpp"
  "global.cpp"
  "Heap.cpp"
  "ItemIndexTable.cpp"
  "ItemQueue.cpp"
  "look_aside_list.cpp"
  "performance.cpp"
  "quad_bytes_hash.cpp"
  "resouce.rc"
  "sort.cpp"
  "SortLink.cpp"
  "StaticResourcePool.cpp"
  "various_bytes_hash.cpp"
)
set_target_properties(4DyuchiGXGFunc PROPERTIES OUTPUT_NAME SS3DGFunc)
target_include_directories(4DyuchiGXGFunc INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}")
luna_legacy_target(4DyuchiGXGFunc)
