# Compatibility settings for code written for the Visual Studio .NET 2003 compiler.
# See docs/adr/0001-cmake-build-with-legacy-compat-flags.md for the reasoning behind each one.

# luna_legacy_target(<target> [MBCS] [NO_MP])
#   MBCS: the original project used the multi-byte character set (CharacterSet="2").
#   NO_MP: compile without /MP (needed for files that use #import).
function(luna_legacy_target target)
  cmake_parse_arguments(ARG "MBCS;NO_MP" "" "" ${ARGN})

  target_compile_definitions(${target} PRIVATE
    _USE_32BIT_TIME_T
    _CRT_SECURE_NO_WARNINGS
    _CRT_SECURE_NO_DEPRECATE
    _CRT_NONSTDC_NO_DEPRECATE
    _CRT_NON_CONFORMING_SWPRINTFS
    _SCL_SECURE_NO_WARNINGS
    _WINSOCK_DEPRECATED_NO_WARNINGS
    _SILENCE_STDEXT_HASH_DEPRECATION_WARNINGS  # <hash_map>/<hash_set> are still available
  )
  if(ARG_MBCS)
    target_compile_definitions(${target} PRIVATE _MBCS)
  endif()

  target_compile_options(${target} PRIVATE
    /source-charset:.949
    /execution-charset:.949
    /Zc:forScope-
    /W3
    /wd4996  # deprecated CRT functions
    /wd4819  # character that can't be represented in the current code page
    /we4477  # printf/scanf format string doesn't match the argument type
    /we4473  # printf/scanf has fewer arguments than the format string needs
  )
  if(NOT ARG_NO_MP)
    target_compile_options(${target} PRIVATE /MP)
  endif()

  # VS2003 linked these by default; CMake's default library list lacks the ODBC ones.
  target_link_libraries(${target} PRIVATE odbc32 odbccp32 winmm)
endfunction()
