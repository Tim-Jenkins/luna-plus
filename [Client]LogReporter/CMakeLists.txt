# Converted from LogReporter.vcproj (Release|Win32). Builds LunaExecuter.exe, a small MFC dialog.
# The original linked MFC as a DLL; it's static here to match the static CRT (docs/adr/0001).
set(CMAKE_MFC_FLAG 1)
add_executable(LogReporter WIN32
  "LogReporter.cpp"
  "LogReporter.rc"
  "LogReporterDlg.cpp"
  "LogReporterGlobal.cpp"
  "StdAfx.cpp"
)
set_target_properties(LogReporter PROPERTIES OUTPUT_NAME "LunaExecuter")
target_include_directories(LogReporter PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}")
luna_legacy_target(LogReporter MBCS)
target_link_libraries(LogReporter PRIVATE netapi32 wsock32 version)
