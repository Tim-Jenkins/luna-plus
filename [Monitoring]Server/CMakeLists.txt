# Converted from MonitoringServer.vcproj (Release|Win32).
add_executable(MonitoringServer WIN32
  "MonitoringServer.cpp"
  "MonitoringServer.rc"
  "StdAfx.cpp"
  "CMSDBMsgParser.cpp"
  "MASManager.cpp"
  "MonitorNetwork.cpp"
  "MonitorServerTable.cpp"
  "MonitorUserTable.cpp"
  "MSManager.cpp"
  "MSSystem.cpp"
  "UserIPCheckMgr.cpp"
  "../[CC]ServerModule/CommonDBMsgParser.cpp"
  "../[CC]ServerModule/Console.cpp"
  "../[CC]ServerModule/DataBase.cpp"
  "../[CC]ServerModule/MHFile.cpp"
  "../[CC]ServerModule/ServerListManager.cpp"
  "../[CC]Header/AESFile.cpp"
  "../[CC]Header/Aes/aes.cpp"
  "../[CC]Header/TargetList/TargetData.cpp"
  "../[CC]Header/TargetList/TargetList.cpp"
  "../[CC]Header/TargetList/TargetListIterator.cpp"
)
target_include_directories(MonitoringServer PRIVATE
  "${CMAKE_CURRENT_SOURCE_DIR}"
  "${LUNA_ROOT}/[Lib]YHLibrary"
  "${LUNA_ROOT}/[CC]Header"
  "${LUNA_ROOT}/[CC]ServerModule"
)
luna_legacy_target(MonitoringServer MBCS)
target_compile_definitions(MonitoringServer PRIVATE _MONITORINGSERVER _AES_FILE_)
target_link_libraries(MonitoringServer PRIVATE YHLibrary ws2_32)
