# Converted from DistributeServer.vcproj (Release|Win32).
# The prebuilt VS2003 libcurl in [CC]Header/curl is replaced by curl from vcpkg;
# BillConnector.cpp still includes the old 7.19 header by path, which is API-compatible.
find_package(CURL CONFIG REQUIRED)

add_executable(DistributeServer WIN32
  "BillConnector.cpp"
  "Crypt.cpp"
  "DistributeDBMsgParser.cpp"
  "DistributeNetworkMsgParser.cpp"
  "MHTimeManager.cpp"
  "Server.cpp"
  "ServerSystem.cpp"
  "ServerTable.cpp"
  "StdAfx.cpp"
  "UserManager.cpp"
  "UserTable.cpp"
  "ChatRoomMgr.cpp"
  "../[CC]ServerModule/BootManager.cpp"
  "../[CC]ServerModule/CommonDBMsgParser.cpp"
  "../[CC]ServerModule/Console.cpp"
  "../[CC]ServerModule/DataBase.cpp"
  "../[CC]ServerModule/MHFile.cpp"
  "../[CC]ServerModule/MiniDumper.cpp"
  "../[CC]ServerModule/Network.cpp"
  "../[CC]ServerModule/ServerListManager.cpp"
  "../[CC]Header/AESFile.cpp"
  "../[CC]Header/CommonCalcFunc.cpp"
  "../[CC]Header/CommonGameFunc.cpp"
  "../[CC]Header/vector.cpp"
  "../[CC]Header/TargetList/TargetData.cpp"
  "../[CC]Header/TargetList/TargetList.cpp"
  "../[CC]Header/TargetList/TargetListIterator.cpp"
  "../[CC]Header/Aes/aes.cpp"
  "../hseos/Debug/SHDebug.cpp"
)
target_include_directories(DistributeServer PRIVATE
  "${CMAKE_CURRENT_SOURCE_DIR}"
  "${LUNA_ROOT}/[Lib]YHLibrary"
  "${LUNA_ROOT}/[CC]Header"
  "${LUNA_ROOT}/[CC]ServerModule"
)
luna_legacy_target(DistributeServer MBCS)
target_compile_definitions(DistributeServer PRIVATE _DISTRIBUTESERVER_ _AES_FILE_)
target_link_libraries(DistributeServer PRIVATE YHLibrary 4DyuchiGXGFunc CURL::libcurl)
