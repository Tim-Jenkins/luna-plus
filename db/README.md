# Database

SQL Server schema scripts for the three databases the servers connect to. Exported from SQL Server on 2013-07-30 and taken from `Database.rar` in the original install media. Converted from UTF-16 to UTF-8 (LF line endings); otherwise unchanged.

| Script | Tables | Stored procedures |
|---|---|---|
| `LUNA_MEMBERDB.sql` | 22 | 54 |
| `LUNA_GAMEDB.sql` | 104 | 540 |
| `LUNA_LOGDB.sql` | 58 | 101 |

**Schema only.** The `INSERT`s in the scripts are inside stored procedures. Seed data for a local test server (the server login and two game accounts) is in `seed/local-test.sql`.

The export is missing some procedures the servers call. `procs/` adds them, one script per database; see [Added procedures](#added-procedures).

`LUNA_LOGDB.sql` has 102 procedure header comments but 101 procedures: `TP_CONSIGN_LOG_SIZE_SELECT` has two headers.

## Restoring

The scripts start with `USE [<db>]` and don't create the databases, and some procedures reference the other databases. So create all three first:

```sql
CREATE DATABASE LUNA_MEMBERDB COLLATE Korean_Wansung_CI_AS;
CREATE DATABASE LUNA_GAMEDB COLLATE Korean_Wansung_CI_AS;
CREATE DATABASE LUNA_LOGDB COLLATE Korean_Wansung_CI_AS;
```

The scripts don't set a collation, so the database default applies. `Korean_Wansung_CI_AS` uses code page 949, which matches the CP949 text the servers send through ANSI ODBC, so character names and other Korean text in `varchar` columns are stored correctly.

Then run each script. With `sqlcmd`, pass `-f 65001` so the Korean comments are read as UTF-8:

```sh
sqlcmd -S localhost -U sa -f 65001 -i LUNA_MEMBERDB.sql
sqlcmd -S localhost -U sa -f 65001 -i LUNA_GAMEDB.sql
sqlcmd -S localhost -U sa -f 65001 -i LUNA_LOGDB.sql
sqlcmd -S localhost -U sa -f 65001 -i procs/LUNA_MEMBERDB.sql
sqlcmd -S localhost -U sa -f 65001 -i procs/LUNA_GAMEDB.sql
sqlcmd -S localhost -U sa -f 65001 -i procs/LUNA_LOGDB.sql
sqlcmd -S localhost -U sa -f 65001 -i seed/local-test.sql
```

The `procs/` scripts use `CREATE OR ALTER` (SQL Server 2016 SP1 or later), so they can be re-run on an existing database, for example after pulling new procedures.

All three schema scripts run without errors on SQL Server 2022. A few procedures reference objects that don't exist (old database names such as `MHCMEMBER`, a linked server, tables from earlier game versions); SQL Server creates them anyway and they fail only if called. The one on the normal play path is `MP_CHARACTER_DeleteCharacter`, which calls `dssog59.MHCMember.dbo.up_Character_Delete` on a linked server, so deleting a character fails.

`docs/running-locally.md` covers running SQL Server in Docker and connecting the servers to it.

The servers connect through ODBC `SQLConnect` (`[Lib]DBThread/DB.cpp`) using a DSN name, user and password, so each database needs an ODBC DSN on the server machine.

## Added procedures

`tools/check_db_procs.py` lists every procedure the Agent, Distribute and Map servers call (from the sources their `CMakeLists.txt` build) and checks that `db/` creates it. It exits non-zero if any are missing:

```sh
python3 tools/check_db_procs.py          # summary and anything missing
python3 tools/check_db_procs.py --list   # every procedure with its call sites
```

The servers call 297 procedures. The export has 278; `procs/` adds the other 19, written from their call sites. Where the original backing system (the operator's web site, billing, matrix cards) doesn't exist, the procedure is a no-op or refuses the login.

| Procedure | Database | Called from | What it does |
|---|---|---|---|
| `MP_GUILD_MARKDELETE` | GAMEDB | `[Server]Map/MapDBMsgParser.cpp` | Deletes the guild mark and clears it from the guild and its members |
| `MP_FAMILY_DELETE_EMBLEM` | GAMEDB | `[Server]Agent/AgentDBMsgParser.cpp` | Deletes the family emblem |
| `MP_ITEM_DIVIDE_UNSEALED` | GAMEDB | `[Server]Map/ItemManager.cpp` | Copies seal state and remaining time to the new stack after a split |
| `MP_TRIGGER_UPDATE` | GAMEDB | `[Server]Map/trigger/Trigger.cpp` | Saves a trigger's repeat count (read back by `MP_TRIGGER_SELECT*`) |
| `MP_GAMEROOM_LOAD_POINT` | GAMEDB | `[Server]Map/Player.cpp` | PC room points and daily item/buff state at login |
| `MP_GT_REWARD_MONEY` | GAMEDB | `[Server]Map/MapDBMsgParser.cpp` | Adds guild tournament prize money to the guild master |
| `MP_GMTOOL_UPDATEUSERSTATE` | GAMEDB | `[Server]Agent/AgentDBMsgParser.cpp` | Sets `sta_num` on the account that owns a character (no callers yet) |
| `MP_PET_INFO_REMOVE` | GAMEDB | `[Server]Map/MapDBMsgParser.cpp` | Deletes a pet and its fixed-skill items (no callers yet) |
| `MP_SKILLTREE_UPDATEEXPBYTIME` | GAMEDB | `[Server]Map/MapDBMsgParser.cpp` | No-op: `TB_SKILL` has no experience column (no callers yet) |
| `MP_WEB_EVENT` | GAMEDB | `[Server]Map/MapDBMsgParser.cpp`, `[Server]Agent/AgentDBMsgParser.cpp` | No-op: notified the operator's web events |
| `TP_FARM_LOG_INSERT` | LOGDB | `[Server]Map/MapDBMsgParser.cpp` | Inserts into `TB_FARM_LOG` |
| `TP_CHAT_LOG_INSERT` | LOGDB | `[Server]Agent/AgentNetworkMsgParser.cpp` | Logs GM chat to a new `TB_CHAT_LOG` table |
| `UP_GMTOOLUSELOG` | LOGDB | `[Server]Agent/AgentDBMsgParser.cpp` | Logs GM commands to a new `TB_GMTOOL_USE_LOG` table |
| `UP_CHARACTER_UPDATE_NAME` | MEMBERDB | `[Server]Agent/AgentNetworkMsgParser.cpp` | No-op: MEMBERDB keeps no character names (the Map server renames in GAMEDB) |
| `UP_EVENTITEMUSE2`, `UP_EVENT051108_INSERT` | MEMBERDB | `[Server]Agent/AgentDBMsgParser.cpp` | No-op: event bookkeeping for the operator's web site |
| `UP_GAMELOGINADULT_FREE_JP` | MEMBERDB | `[Server]Distribute/DistributeDBMsgParser.cpp` | Normal login (`up_GameLoginAdult_FREE`) without the security password (no callers yet) |
| `UP_GAMELOGINMAT_FREE` | MEMBERDB | `[Server]Distribute/DistributeDBMsgParser.cpp` | Refuses matrix-card logins ("wrong ID or password") |
| `UP_WEBLAUNCHER_LOGIN_WITH_LOGINKEY` | MEMBERDB | `[Server]Distribute/DistributeDBMsgParser.cpp` | Refuses web-launcher logins ("wrong ID or password") |

`procs/LUNA_GAMEDB.sql` also redefines `MP_GAMEROOM_UPDATE_POINT`. In the export it is missing a `GO`, so its body ends with `DROP PROCEDURE MP_GAMEROOM_LOAD_POINT` and every call would drop that procedure.

Some names the sources mention need no procedure:

- `MP_TEST_SIEGERECALL_*` are used only when `_TEST_DB_` is defined, and the build never defines it. Without it the siege code uses the `MP_SIEGERECALL_*` procedures in the export.
- `UP_NPROTECTBLOCKLOG` is inside `#ifdef _NPROTECT_`, which the build also never defines. It goes away with the anti-cheat code (#5).
- `MP_PARTY_UPDATEMEMBER`, `MP_GUILD_MARKUPDATE` and `MP_SIEGERECALL_REMOVE` were named only by `#define`s nothing used; those were removed.
