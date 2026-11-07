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

# CIndexGenerator only exists as a prebuilt VS2003 static library (no source in the repo).
# It asks for the old single-threaded CRT (LIBC), which no longer exists, so skip that.
target_link_libraries(YHLibrary INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/IndexGenerator.lib")
# It also predates SafeSEH (VS2003 left it off by default), so executables linking it need /SAFESEH:NO.
target_link_options(YHLibrary INTERFACE /NODEFAULTLIB:libc.lib /SAFESEH:NO)
