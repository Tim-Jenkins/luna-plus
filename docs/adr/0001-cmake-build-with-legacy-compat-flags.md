# 1. CMake build with legacy compatibility flags

Date: 2026-11-07
Status: Accepted

## Context

All 34 solutions and 39 projects in the repo are Visual Studio .NET 2003 format (`.sln` Format Version 8.00, `.vcproj`). Current Visual Studio can't open or upgrade them, so every project needs a new build definition. The maintainer works on macOS, so builds have to be checkable without a local Windows machine.

The code was written for the VS2003 compiler and runtime, and the servers and client exchange fixed-layout C structs, so a modern build must not silently change behavior or struct layout.

## Decision

**Build system: CMake**, generating Visual Studio solutions on Windows. Each converted project gets a `CMakeLists.txt` next to its old `.vcproj`; the root `CMakeLists.txt` adds them. Old `.vcproj`/`.sln` files stay in place as a reference until everything is converted.

**CI: GitHub Actions** on `windows-latest` builds every converted target, so changes can be checked from macOS.

**Target: 32-bit (Win32)** only, to match the original binaries and wire format. 64-bit is #10.

**Third-party libraries come from vcpkg** (manifest `vcpkg.json`, triplet `x86-windows-static`) instead of the prebuilt VS2003 `.lib` files in the repo, which won't link with a modern toolchain.

**Compatibility settings**, applied to every legacy target by `luna_legacy_target()` in `cmake/LunaLegacy.cmake`:

| Setting | Why |
|---|---|
| Static CRT (`/MT`, `/MTd`) everywhere | The original projects mixed `/MD` and `/MT` within one executable (e.g. DistributeServer `/MT` + YHLibrary `/MD`); modern MSVC rejects that mix. Static CRT also means no VC++ redistributable is needed. |
| `/source-charset:.949 /execution-charset:.949` | Source files are CP949 (Korean). This keeps Korean string literals byte-identical to the original build regardless of the build machine's code page. |
| `/Zc:forScope-` | VS2003 didn't enforce `for`-loop variable scope by default, and the code relies on it. |
| `_USE_32BIT_TIME_T` | VS2003's `time_t` was 32-bit. Shared structs already use explicit `__time64_t`, but local code may print or store `time_t` as 32-bit. Not available on x64; revisit in #10. |
| `_MBCS` where the project used the multi-byte character set | Matches `CharacterSet="2"`. |
| `_CRT_SECURE_NO_WARNINGS` and related | Silence deprecation warnings for the old CRT and Winsock calls without changing code. |
| No precompiled headers | Simpler to start with; every source file includes its `stdafx.h` anyway. Can be added later for build speed. |

## Consequences

- Struct layout and string bytes match the original build, so the converted servers stay compatible with the original client.
- Each project's `CMakeLists.txt` lists sources explicitly, copied from its `.vcproj` Release configuration, so the build doesn't pick up stray files.
- `/Zc:forScope-` is deprecated in MSVC. If it is removed, the affected loops need fixing in code.
- `CIndexGenerator` exists only as a prebuilt VS2003 library (`[Lib]YHLibrary/IndexGenerator.lib`). Executables linking it need `/NODEFAULTLIB:libc.lib` and `/SAFESEH:NO`. Rewriting it from source would remove both.
- `4DyuchiGXGFunc` is built as `SS3DGFunc.dll`, the name in the prebuilt import library the original servers linked against.
- Servers load `DBThread` and `4DyuchiNET` as registered COM DLLs (`CoCreateInstance`), so running them still needs `regsvr32` on those DLLs. Not a build concern, but a deployment step.
