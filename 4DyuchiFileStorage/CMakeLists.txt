# Converted from 4DyuchiFileStorage.vcproj (Release|Win32). Pack-file storage, a COM DLL
# exported through its .def file and loaded by the engine at runtime.
add_library(4DyuchiFileStorage SHARED
  "4DyuchiFileStorage.def"
  "CoStorage.cpp"
  "dllmain.cpp"
  "factory.cpp"
  "PackFile.cpp"
  "Script1.rc"
)
set_target_properties(4DyuchiFileStorage PROPERTIES OUTPUT_NAME FileStorage)
target_compile_definitions(4DyuchiFileStorage PRIVATE _WINDOWS _USRDLL MY4DYUCHIFILESTORAGE_EXPORTS)
target_link_libraries(4DyuchiFileStorage PRIVATE 4DyuchiGXGFunc)
luna_legacy_target(4DyuchiFileStorage MBCS)
