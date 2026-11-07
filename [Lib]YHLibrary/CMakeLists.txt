# Converted from YHLibrary.vcproj (Release|Win32). Static library linked into every server.
add_library(YHLibrary STATIC
  "connection.cpp"
  "hashtable.cpp"
  "MemoryPool.cpp"
  "MemoryPoolTempl.cpp"
  "HSEL.cpp"
  "StdAfx.cpp"
  "Strclass.cpp"
  "StrTokenizer.cpp"
  "Fileio.cpp"
  "Encryptor.cpp"
  "cConstLinkedList.cpp"
  "cLinkedList.cpp"
  "cLooseLinkedList.cpp"
  "PtrList.cpp"
)
target_include_directories(YHLibrary PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")
luna_legacy_target(YHLibrary MBCS)
target_compile_definitions(YHLibrary PRIVATE _LIB)
