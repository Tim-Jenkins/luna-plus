# Converted from 4DyuchiGXExecutive.vcproj (Release|Win32). Engine front end the client loads
# with LoadLibrary("Executive.dll") + DllCreateInstance; it creates the renderer, geometry and
# file-storage COM objects.
add_library(4DyuchiGXExecutive SHARED
  "4DyuchiGXEXECUTIVE.def"
  "dllmain.cpp"
  "factory.cpp"
  "GXDefault.cpp"
  "Script1.rc"
  "map.cpp"
  "../4DyuchiGRX_myself97/CheckClock.cpp"
  "../4DyuchiGRX_myself97/Logger.cpp"
  "../4DyuchiGRX_myself97/MClipper.cpp"
  "../4DyuchiGRX_myself97/Myself97Common.cpp"
  "../4DyuchiGRX_myself97/TriangleLib.cpp"
  "../4DYUCHIGRX_MYSELF97/CollisionTest/AAEllipsoidCollisionTest.cpp"
  "../4DYUCHIGRX_MYSELF97/CollisionTest/CollisionTestMovingEllipsoidMeetTriangle.cpp"
  "../4DYUCHIGRX_MYSELF97/CollisionTest/CollisionTestMovingSphereMeetTriangle.cpp"
  "../4DyuchiGRX_myself97/CollisionTest/DummyCollisionTest.cpp"
  "../4DyuchiGRX_myself97/CollisionTest/SphereCollisionTest.cpp"
  "../4DyuchiGRX_myself97/MStaticObjectTree.cpp"
  "executive.cpp"
  "GXDecal.cpp"
  "GXEventTriggerObject.cpp"
  "GXHFieldMapObject.cpp"
  "GXLight.cpp"
  "GXMapObject.cpp"
  "GXObject.cpp"
  "GXStaticMapObject.cpp"
  "ShadeManager.cpp"
)
set_target_properties(4DyuchiGXExecutive PROPERTIES OUTPUT_NAME Executive)
target_compile_definitions(4DyuchiGXExecutive PRIVATE _WINDOWS _USRDLL MY4DYUCHIGXEXECUTIVE_EXPORTS)
target_link_libraries(4DyuchiGXExecutive PRIVATE 4DyuchiGXGFunc)
luna_legacy_target(4DyuchiGXExecutive MBCS)
