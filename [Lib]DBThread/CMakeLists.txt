# Converted from DBThread.vcproj (Release|Win32). In-process COM server (DBThread.dll);
# the servers create it with CoCreateInstance, so it must be registered with regsvr32.
add_library(DBThread SHARED
  "CODB.CPP"
  "DB.cpp"
  "DBThread.cpp"
  "DBThreadDll.cpp"
  "dbthreaddll.def"
  "DBThreadFactory.cpp"
  "MemoryPool.cpp"
  "Script1.rc"
  "Voidlist.cpp"
)
luna_legacy_target(DBThread)
target_compile_definitions(DBThread PRIVATE
  _DLLEXPORT_     # stdafx.h otherwise declares DllRegisterServer as dllimport, clashing with the SDK
  WINVER=0x0501   # sources set _WIN32_WINNT 0x0500, but current MFC (afx.h) needs WINVER >= 0x0501
)
