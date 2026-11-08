# Converted from SoundLib.vcproj (Release|Win32). Miles Sound System wrapper; the client links
# its import library for CreateSoundLib. mss32.lib is the import library for the proprietary
# mss32.dll that ships with the game.
add_library(SoundLib SHARED
  "../4DyuchiGRX_myself97/CheckClock.cpp"
  "../4DyuchiGRX_myself97/Logger.cpp"
  "MilesSoundLib.cpp"
  "SoundEffect.cpp"
  "SoundEffectFile.cpp"
  "SoundLib.cpp"
  "SoundSample.cpp"
  "StdAfx.cpp"
)
target_compile_definitions(SoundLib PRIVATE _WINDOWS _USRDLL SOUNDLIB_EXPORTS)
target_include_directories(SoundLib INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}")
target_link_libraries(SoundLib PRIVATE 4DyuchiGXGFunc "${CMAKE_CURRENT_SOURCE_DIR}/mss/mss32.lib")
luna_legacy_target(SoundLib MBCS)
# mss32.lib's static stubs predate SafeSEH.
target_link_options(SoundLib PRIVATE /SAFESEH:NO)
