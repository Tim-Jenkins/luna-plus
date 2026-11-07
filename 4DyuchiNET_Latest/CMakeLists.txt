# Converted from I4DyuchiNET.vcproj (Release|Win32). In-process COM server (INetwork.dll);
# the servers create it with CoCreateInstance, so it must be registered with regsvr32.
add_library(4DyuchiNET SHARED
  "dynamic_memory.cpp"
  "memory_object.cpp"
  "read_memory_handle.cpp"
  "write_memory_handle.cpp"
  "mainthread.cpp"
  "que.cpp"
  "quemanager.cpp"
  "switch_que.cpp"
  "timer.cpp"
  "exception.cpp"
  "log.cpp"
  "conetwork.cpp"
  "dllmain.cpp"
  "factory.cpp"
  "I4DyuchiNET.def"
  "accept.cpp"
  "connect.cpp"
  "connect_que.cpp"
  "connection.cpp"
  "network.cpp"
  "overlapped.cpp"
  "overlapped_recv.cpp"
  "overlapped_send.cpp"
  "overlapped_udp.cpp"
  "pre_connect.cpp"
  "cpio.cpp"
  "ver.rc"
  "collect_confirm_packet.cpp"
  "confirm.cpp"
  "create_index.cpp"
  "net_global.cpp"
)
set_target_properties(4DyuchiNET PROPERTIES OUTPUT_NAME INetwork)
luna_legacy_target(4DyuchiNET)
target_compile_definitions(4DyuchiNET PRIVATE _WIN32_WINNT=0x0500 _USE_WINSOCK)
target_link_libraries(4DyuchiNET PRIVATE ws2_32)
