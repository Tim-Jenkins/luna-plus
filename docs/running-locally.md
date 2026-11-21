# Running locally

How to run the Distribute, Agent and Map servers against a local database, and point the client at them. Nobody has got all the way into the game this way yet (#6), so expect gaps. Please record what you find.

The setup this was written for is a Mac running SQL Server in Docker, plus an x86 Windows VM in UTM (emulated, not ARM) that runs the servers and client. The steps are the same on a Windows PC: just run SQL Server wherever is convenient.

## 1. Binaries

Every push to `master` builds everything in CI. To download the latest successful build, use the [GitHub CLI](https://cli.github.com/):

```powershell
$run = gh run list -R Tim-Jenkins/luna-plus --branch master --status success --limit 1 --json databaseId --jq '.[0].databaseId'
gh run download $run -R Tim-Jenkins/luna-plus -n luna-win32-release -D C:\luna\bin
```

The C runtime is linked statically, so you don't need a Visual C++ redistributable.

## 2. Database

SQL Server only ships x86 images, so on Apple Silicon it needs Rosetta. With [Colima](https://github.com/abiosoft/colima):

```sh
colima start luna --vm-type vz --vz-rosetta --cpu 2 --memory 4
docker run -d --name luna-sql --platform linux/amd64 --restart unless-stopped \
  -e ACCEPT_EULA=Y -e MSSQL_PID=Developer -e "MSSQL_SA_PASSWORD=<a strong password>" \
  -p 1433:1433 -v luna-sql-data:/var/opt/mssql \
  mcr.microsoft.com/mssql/server:2022-latest
```

Then create the databases with the Korean collation, run the three schema scripts and the three `db/procs/` scripts (procedures missing from the export), and run `db/seed/local-test.sql`. If you set the databases up before the `db/procs/` scripts existed, just run those three. The exact commands are in `db/README.md`. The seed script creates:

| Login | Password | Purpose |
|---|---|---|
| `GameSrv` (SQL login) | `luna` | What the servers connect as; hardcoded in `[CC]ServerModule/DataBase.cpp` |
| `test` (game account) | `test` | Normal player (UserLevel 6) |
| `admin` (game account) | `admin` | GM "god" level (UserLevel 1) |

Port 1433 is published on every interface of the host, and the passwords above are weak. Don't do this on a network you don't trust.

From a UTM VM on the default "Shared Network", the Mac is the VM's default gateway, usually `192.168.64.1`; check with `ipconfig` in the VM. `Test-NetConnection 192.168.64.1 -Port 1433` checks that the VM can reach the database.

## 3. ODBC data sources (Windows)

The servers are 32-bit and connect through ODBC data source names, so use the 32-bit ODBC admin, `C:\Windows\SysWOW64\odbcad32.exe`. On the **System DSN** tab, add three DSNs with the "SQL Server" driver:

| Name | Server | Default database |
|---|---|---|
| `LUNA_MEMBERDB` | the database host, e.g. `192.168.64.1` | `LUNA_MEMBERDB` |
| `LUNA_GAMEDB` | same | `LUNA_GAMEDB` |
| `LUNA_LOGDB` | same | `LUNA_LOGDB` |

Use SQL Server authentication with `GameSrv` / `luna`.

## 4. Server folder

Run all three servers from one folder. Each server reads its config relative to its working directory.

1. Copy everything from `C:\luna\bin` into a working folder, e.g. `C:\luna\server`.
2. Copy the contents of `config/local/server/` from this repo into that folder:
   - `serverset.txt` holds the server set number (1).
   - `serverset/1/serverlist.txt` lists every server's address and ports. The comments in the file explain the format.
   - `serverset/1/DistributeDesc.txt` raises the account level Distribute accepts from 4 (GM only) to 6, so normal accounts can log in.
   - `serverset/1/MapServerDesc.txt` holds per-map settings (DB threads, village/PK flags). It needs a `$MAPNUM` block for each map server you run.
   - `serverset/1/ChannelInfo.bin` sets the channel name. Its source is `ChannelInfo.txt`; see [Packed .bin files](#packed-bin-files).
   - `ClientVerInfo.ver` holds the client version Distribute accepts. It has to match `g_CLIENTVERSION` in `[Client]LUNA/LUNAClient.cpp` (`LPTW10062701`), or every login fails with "invalid version".
3. Add the game data, one of:
   - **Original data (recommended).** If you have an original server's `system/` folder, copy it to `data/original/<name>/system/` (git ignores `data/original/`; the data isn't ours to redistribute) and run `python3 tools/import_original_data.py --from data/original/<name>`. It converts the tables whose format changed to what this source reads, takes what's missing from `data/minimal/`, and writes `build/data/`. See [Original data](#original-data).
   - **Minimal data.** Run `python3 tools/build_minimal_data.py`. This is the hand-written set from `data/minimal/` (#21): map 20 only, a few NPCs and monsters, no items or quests.

   Copy the contents of `build/data/` into the folder. Copy `System/Map/<map>.ttb` for each map you run (`20.ttb` at least) from the client install into `System\Map\` if the data didn't include it.
4. Copy `MHConsole.dll` from the original server package (`Server/Dll/`) into the folder. It's the COM component behind the server console windows, and its source isn't in this repo. Without it, the servers stop with "Console initializing Failed".
5. Register the three COM DLLs from an administrator prompt, using the 32-bit `regsvr32`:
   ```powershell
   C:\Windows\SysWOW64\regsvr32.exe C:\luna\server\DBThread.dll
   C:\Windows\SysWOW64\regsvr32.exe C:\luna\server\INetwork.dll
   C:\Windows\SysWOW64\regsvr32.exe C:\luna\server\MHConsole.dll
   ```
   `INetwork.dll` is the `4DyuchiNET_Latest` network library. Without this step, the servers fail with "unregistered Component".

## 5. Start the servers

The servers' console windows stay blank, but each server writes logs under `Log\`, and the Map server writes `serverStart.txt`, which lists each startup step it reached. If it stops partway, the last line tells you where.

Start them in this order. Each takes its server number (for a Map server, the map number) as its only argument, and it must match a line in `serverlist.txt`:

```powershell
cd C:\luna\server
Start-Process .\DistributeServer.exe 1
Start-Process .\AgentServer.exe 1
Start-Process .\MapServer.exe 20
```

New characters start on map 20 (`CreateCharacter` in `[Server]Agent/AgentDBMsgParser.cpp`). There's no monitoring server; when the servers can't find one, they connect to each other directly using `serverlist.txt`.

To run more maps, add a `3 <map> ...` line to `serverlist.txt` and a `$MAPNUM <map>` block to `MapServerDesc.txt`, then start `MapServer.exe <map>`.

## 6. Client

The client reads its server list from `system/ServerList.bin` in its install folder. Back up the original, then copy in `config/local/client/system/ServerList.bin`, which points at a Distribute server on `127.0.0.1:17001`. If the client runs on a different machine from the servers, edit `ServerList.txt` and the user addresses in `serverlist.txt`, then re-encode the client file.

Copy the contents of `build/data/` into the client's install folder too, so its `System/Resource` matches the servers' exactly. Distribute checksums about 50 of those files at login and refuses a client whose copies differ ("Client files have been changed"). After that error, copy `config/local/client/LunaVerInfo.ver` back (the client resets it). (Servers built before #26 was fixed also leave the account's row in `LUNA_MEMBERDB.dbo.LoginTable`; delete it, or the next login fails with "The connection to the server has been lost".)

The client exits with "You should not execute directly this file!!" unless its first argument is `anrgideoqkr`, which the launcher normally passes:

```powershell
.\LUNAClient.exe anrgideoqkr
```

Log in as `test` / `test`. A new character starts in a corner of Alker Harbor next to a wall. The NPCs and monsters are just behind it: hold the right mouse button and drag to turn the camera, and use the mouse wheel to zoom out. Click an NPC twice to talk to it. Click a monster to attack it with your fists; monsters fight back once hit. The minimap is the easiest way to get around: click on it to walk there.

If the client crashes it writes a minidump, `LPTW10062701.mhd`, next to `LUNAClient.exe`. Some failures exit with no dump; for those, turn on Windows Error Reporting dumps under `HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps\LUNAClient.exe`. The matching PDBs are in each CI run's `luna-win32-release-pdb` artifact.

## Original data

`tools/import_original_data.py` has been checked against one source: the Taiwanese LUNA Online server data from late 2008 (Big5 text, 165 files in `system/Resource`, plus `MapChannel.bin` and the server's terrain files). This source is from 2010, and these tables changed shape in between:

| File | Change |
|---|---|
| `SkillList.bin` | Two always-zero columns between area size and unit kind were removed (56 → 54) |
| `Skill_Buff_List.bin` | One column was added before the mana cost (33 → 34) |
| `MonsterList.bin` | `dwMonsterTargetType` was added after the object kind (124 → 125); 2 for bosses, 1 otherwise. The importer also shows the English name column instead of the Chinese one |
| `ItemList.bin` | Point type, two point values, item type and item type detail were added at the end (60 → 65) |
| `StaticNpc.bin` | A notice dialog id was added at the end (7 → 8) |
| `ConductList.bin` | `bInvalidOnVehicle` was added at the end (7 → 8). Without it the client crashes entering the world (`cConductManager::RegistConduct`) |

Everything else is copied unchanged and loads without errors, but only the files above have been compared field by field with their loaders. The importer takes the Devil race lists (`*_D_*`) and `skillScript.bin` from `data/minimal/`, since the 2008 data predates them.

Known issues with this data:
- Text is translated to English from `data/translations/en/` (`tools/translate_data.py`): item, skill, buff, NPC, map, quest and quest-item text, monster speech and character-creation names. Entries are keyed by a hash of the original bytes, so the repo holds no original text. Pass `--no-translate` to keep the Chinese. Files the game never shows (`TooTipMsg`, `Tooltipinfo`, `Trade`, `Quest`, `Dealitem`) and the `FilterWord` banned-name list are left as they are.
- `MapChannel.bin` gives map 20 three channels.
- On map 20 (a town) the spawns are training dummies (Bambusoideae, Rotten Board, level 10) and Puppies (level 1) next to the new-character login point at (347, 400).

## Packed .bin files

Files the game opens in `"rb"` mode (`CMHFile`) are encoded. `tools/mhbin.py` reads and writes the original (non-AES) encoding, which both the client and the servers still accept:

```sh
python3 tools/mhbin.py encode config/local/server/serverset/1/ChannelInfo.txt config/local/server/serverset/1/ChannelInfo.bin
python3 tools/mhbin.py decode some.bin some.txt
```

`decode` also reads the client's AES-encrypted files (the newer encoding, header version 20090506), for example the effect lists in `Data/Script/Direct/List_*.befl`, which map the effect ids used in `SkillList.bin` to effect files, and `Data/Interface/Windows/SystemMsg.bin`, the text of the client's system messages. `encode` still writes only the original encoding.

## Known gaps

- Without original data, the game data is a minimal hand-written set (`data/minimal/`): map 20 has eight NPCs and fifteen monsters, but there are no items or quests, and the only skills are the unarmed basic attack and one melee attack per monster.
- 22 stored procedures the servers call don't exist yet (see `db/README.md`, #3). Anything that calls one fails.
- Deleting a character fails: `MP_CHARACTER_DeleteCharacter` calls a linked server that doesn't exist.
- No billing server is configured, so Distribute keeps retrying a connection to an empty address. This should be harmless.
- With UTM's emulated graphics there's no 3D acceleration, so the DirectX 9 client renders in software and is very slow.
