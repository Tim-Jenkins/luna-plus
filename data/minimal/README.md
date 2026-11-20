# Minimal game data

The original game data (`System/Resource/*.bin`, `System/MapChannel.bin`) isn't in any install media we have (#21). This folder is a hand-written replacement with just enough data to log in, create a character and play a little on map 20 (Alker Harbor): a login point, eight NPCs you can talk to, and three kinds of monster you can target. There's no combat yet, because there's no skill data.

Build it with:

```sh
python3 tools/build_minimal_data.py          # writes build/data/
```

A source named `<name>.bin.txt` is encoded to `<name>.bin` with the legacy format `CMHFile` reads (`tools/mhbin.py`). Other files are copied unchanged. Copy the contents of `build/data/` into the servers' working folder **and** the client's install folder. The two copies must be identical: when you log in, Distribute compares a checksum of about 50 files (including `LoginPoint`, `MonsterList`, `NpcList`, `CharMake_List` and the `BodyList`s; the full list is in `SetScriptCheckValue`, `[CC]Header/CommonGameFunc.cpp`) with the client's. If they differ, login fails with "Client files have been changed". That error also resets the client's `LunaVerInfo.ver` and leaves the account in `LoginTable`, so copy `LunaVerInfo.ver` back and clear the row before you try again.

Packed files are read token by token, and a record loop only stops when the read position reaches the last byte. A trailing newline would add one extra, all-zero record, so the build script strips trailing whitespace. That's why there must be no blank lines at the end of a record file.

Packed files are tokenised with no comment support, so the column layouts are documented here instead of in the files. Missing files mostly just leave an empty table: almost no loader checks for errors. Files are added here only when something needs them.

## Files

| File | Loader | Columns | Notes |
|---|---|---|---|
| `System/MapChannel.bin` | `CMHMap::LoadMapChannel` | `$MAP_CHANNEL <map> <channels>` | Map 20, one channel |
| `System/Resource/characterExpPoint.bin` | `CGameResourceManager::LoadExpPoint` | `<level> <exp to next level>` | Levels 1–150, `100 * level^2.2`. A message box appears if it's missing |
| `System/Resource/FishingExpPoint.bin` | `CGameResourceManager::LoadFishingExpPoint` | `<level> <exp> <level restriction> <reward item>` | 4 fishing levels. A message box appears if it's missing |
| `System/Resource/HPMPdetermination.bin` | `CCharacterCalcManager::LoadHPMPDeterminateList` | `<class> <HP per point> <MP per point>` | First-grade classes only |
| `System/Resource/AddJobSkillList.bin` | `CCharacterCalcManager::LoadJobSkillList` | first line skipped; then `<class> <skill> <plus level>` | Header only (no job skills). A message box appears if it's missing |
| `System/Resource/ModList_<R>_<G>.bin` | `CGameResourceManager::LoadModFileList` | `<base model> <count>`, then one equipment model per line (`<model> [left-hand model]`) | Base model only (`h_man.chx`, `e_woman.chx`, ...), no equipment entries. Without it the client crashes when you open character creation |
| `System/Resource/FaceList_<R>_<G>.bin` | `LoadFaceModFileList` | `<count> <model>...` | The race and gender's `*_face.chr`. Face type picks a material on it |
| `System/Resource/HairList_<R>_<G>.bin` | `LoadHairModFileList` | `<count> <model>...` | Every `*_hairNNN.mod` in `character.pak` |
| `System/Resource/BodyList_<R>_<G>.bin` | `LoadBodyModFileList` | `<count> <model>...` | `*_body000.mod` |
| `System/Resource/CharMake_List.bin` | `cCharMakeManager::LoadOptionList` | first line skipped; then for each of 12 lists `<count> <id>` and `<count>` lines of `<label> <data> <helper>` | Face and hair options shown on the creation screen, in the order human/elf/devil × male/female × face/hair. The client uses the option's position, not `<data>` |
| `System/Resource/LoginPoint.bin` | `CGameResourceManager::LoadLoginPoint` | `<kind> <map name> <map> <point count> <x> <z>... <model>` | Kind 2019 is the one new characters get. The Map server picks the point by map number and adds up to ±250 at random. It's where the first character was created, in a corner of town by a wall |
| `System/Resource/NpcChxList.bin` | `LoadNpcChxList` (client) | `<count>`, then one model per line | Index 0 is a placeholder; the client asserts the index is above 0 |
| `System/Resource/NpcList.bin` | `LoadNpcList` | `<kind> <name> <model index> <role> <scale> <name height> <show role>` | Role is an `NPC_ROLE` (`[CC]Header/CommonGameDefine.h`): 1 dealer, 3 guild, 4 warehouse, 6 talker. The models are placeholders (`n001`–`n009` in order), so the priestess Luna looks like a knight. The dialog portrait follows the model |
| `System/Resource/StaticNpc.bin` | `CMHMap::LoadStaticNpc` (client), `LoadStaticNpc` (server) | `<map> <kind> <name> <unique id> <x> <z> <facing degrees> <notice dialog>` | The unique id picks the dialog in the client's `Data/Script/NPC/Npc_Script.bin` (`#NPCID`). Ids 1–9 are the Alker Harbor NPCs: 1 weapons, 2 Rien, 3 magic tools, 4 Hafreban, 5 armour, 6 Ellenshar, 8 warehouse, 9 the priestess Luna. Without `QuestNpcList.bin` the server's loader returns early, which is harmless |
| `System/Resource/MonsterList.bin` | `CGameResourceManager::LoadMonsterList` | 65 fields, then 15 drop slots of `<label> <item> <count> <percent>`; see the loader for the order | Slime (`m001`), Fungus (`m002`) and Turtle (`m003`), levels 1–3. Field 9 (object kind) is 32, monster. Field 10 (target type) must be 1: with 0 the client crashes when you click the monster, because no target window is chosen. No attack skills, so monsters don't fight back |
| `System/Resource/Monster_20.bin` | `CAISystem::Load` (server) | `$group <n> { #add 32 0 <monster kind> <x> <z> ... #addCondition <group> <ratio> <delay ms> <spawn now> <range> }`; `@` starts a comment line | Three groups of five, south and east of the login point. When a monster in a group dies, the group refills 15 s later |
| `System/Resource/motionList.bin` | `CMotionManager::LoadMotionList` (client) | `<count>`, then `<index> <file>` lines | Without it the client crashes as soon as a monster appears (`CObject::GetMotionIDX`) |
| `System/Resource/MonsterMotion.bin` | `CMotionManager::LoadMotionInfo` (client) | `#MOTIONID`, then for each of `#STAND #WALK #RUN #ATTACK #DIE #DAMAGE #REST` a count and `#MOTION <slot>...` | Motion id 0, which every monster uses. Slots are 1-based positions in the monster's `.chx` motion list |

`<R>` is `H`, `E` or `D` (human, elf, devil), and `<G>` is `M` or `W`. The model names come from the client's `Data/3Ddata/character.pak`.

`<class>` is `job * 1000 + (race + 1) * 100 + grade * 10 + subjob`. Jobs are 1 fighter, 2 rogue, 3 mage; races are 0 human, 1 elf, 2 devil. For a first-grade character `subjob` is 1, so a first-grade human fighter is `1111`.

## Client-only files

The client also needs these from `config/local/client/`: `system/ServerList.bin` and `LunaVerInfo.ver`.

## Not from this folder

- `System/Map/<map>.ttb` (terrain) comes from the client install.
- The servers also need `MHConsole.dll` registered with `regsvr32`. It's a COM component from the original server package, and its source isn't in this repo.
