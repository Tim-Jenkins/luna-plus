# Converted from BaseNetwork.vcproj (Release|Win32). The client's network layer: an in-process
# COM server that [Client]LUNA/MHNetwork.cpp loads by name with LoadLibrary("Network.dll") and
# DllGetClassObject, so it doesn't need registering.
add_library(BaseNetwork SHARED
  "accept.cpp"
  "BaseNetwork.cpp"
  "BaseNetworkDll.cpp"
  "BaseNetworkdll.def"
  "BaseNetworkFactory.cpp"
  "connection.cpp"
  "create_index.cpp"
  "main_msg_que.cpp"
  "msgproc.cpp"
  "network.cpp"
  "overlapped.cpp"
  "overlapped_recv.cpp"
  "overlapped_send.cpp"
  "switch_que.cpp"
  "worker.cpp"
)
set_target_properties(BaseNetwork PROPERTIES OUTPUT_NAME "Network")
luna_legacy_target(BaseNetwork)
target_compile_definitions(BaseNetwork PRIVATE
  _DLLEXPORT_     # stdafx.h otherwise declares DllRegisterServer as dllimport, clashing with the SDK
)
target_link_libraries(BaseNetwork PRIVATE ws2_32)
