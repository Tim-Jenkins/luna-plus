# Minimal game data

The original game data (`System/Resource/*.bin`, `System/MapChannel.bin`) isn't in any install media we have (#21). This folder is a hand-written replacement with just enough data to run the servers and, eventually, log in and walk around map 20.

Build it with:

```sh
python3 tools/build_minimal_data.py          # writes build/data/
```

A source named `<name>.bin.txt` is encoded to `<name>.bin` with the legacy format `CMHFile` reads (`tools/mhbin.py`). Other files are copied unchanged. Copy the contents of `build/data/` into the servers' working folder. The client needs the same files plus its own (see below).

Packed files are tokenised with no comment support, so the column layouts are documented here instead of in the files. Missing files mostly just leave an empty table: almost no loader checks for errors. Files are added here only when something needs them.

## Files

| File | Loader | Columns | Notes |
|---|---|---|---|
| `System/MapChannel.bin` | `CMHMap::LoadMapChannel` | `$MAP_CHANNEL <map> <channels>` | Map 20, one channel |
| `System/Resource/characterExpPoint.bin` | `CGameResourceManager::LoadExpPoint` | `<level> <exp to next level>` | Levels 1–150, `100 * level^2.2`. A message box appears if it's missing |
| `System/Resource/FishingExpPoint.bin` | `CGameResourceManager::LoadFishingExpPoint` | `<level> <exp> <level restriction> <reward item>` | 4 fishing levels. A message box appears if it's missing |
| `System/Resource/HPMPdetermination.bin` | `CCharacterCalcManager::LoadHPMPDeterminateList` | `<class> <HP per point> <MP per point>` | First-grade classes only |
| `System/Resource/AddJobSkillList.bin` | `CCharacterCalcManager::LoadJobSkillList` | first line skipped; then `<class> <skill> <plus level>` | Header only (no job skills). A message box appears if it's missing |

`<class>` is `job * 1000 + (race + 1) * 100 + grade * 10 + subjob`. Jobs are 1 fighter, 2 rogue, 3 mage; races are 0 human, 1 elf, 2 devil. For a first-grade character `subjob` is 1, so a first-grade human fighter is `1111`.

## Not from this folder

- `System/Map/<map>.ttb` (terrain) comes from the client install.
- The servers also need `MHConsole.dll` registered with `regsvr32`. It's a COM component from the original server package, and its source isn't in this repo.
