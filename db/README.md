# Database

SQL Server schema scripts for the three databases the servers connect to. Exported from SQL Server on 2013-07-30 and taken from `Database.rar` in the original install media. Converted from UTF-16 to UTF-8 (LF line endings); otherwise unchanged.

| Script | Tables | Stored procedures |
|---|---|---|
| `LUNA_MEMBERDB.sql` | 22 | 54 |
| `LUNA_GAMEDB.sql` | 104 | 540 |
| `LUNA_LOGDB.sql` | 58 | 101 |

**Schema only.** The `INSERT`s in the scripts are inside stored procedures. Seed data for a local test server (the server login and two game accounts) is in `seed/local-test.sql`.

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
sqlcmd -S localhost -U sa -f 65001 -i seed/local-test.sql
```

All three schema scripts run without errors on SQL Server 2022. A few procedures reference objects that don't exist (old database names such as `MHCMEMBER`, a linked server, tables from earlier game versions); SQL Server creates them anyway and they fail only if called. The one on the normal play path is `MP_CHARACTER_DeleteCharacter`, which calls `dssog59.MHCMember.dbo.up_Character_Delete` on a linked server, so deleting a character fails.

`docs/running-locally.md` covers running SQL Server in Docker and connecting the servers to it.

The servers connect through ODBC `SQLConnect` (`[Lib]DBThread/DB.cpp`) using a DSN name, user and password, so each database needs an ODBC DSN on the server machine.

## Missing stored procedures

The servers call 284 distinct stored procedures; 262 are in these scripts. These 22 are not (tracked in #3):

| Procedure | Called from | Notes |
|---|---|---|
| `MP_PARTY_UPDATEMEMBER` | `[Server]Map/MapDBMsgParser.h` | Gameplay |
| `MP_GUILD_MARKUPDATE` | `[Server]Map/MapDBMsgParser.h` | Gameplay |
| `MP_GUILD_MARKDELETE` | `[Server]Map/MapDBMsgParser.h` | Gameplay |
| `MP_FAMILY_DELETE_EMBLEM` | `[Server]Agent/AgentDBMsgParser.cpp` | Gameplay |
| `MP_PET_INFO_REMOVE` | `[Server]Map/MapDBMsgParser.cpp` | Gameplay |
| `MP_SKILLTREE_UPDATEEXPBYTIME` | `[Server]Map/MapDBMsgParser.cpp` | Gameplay |
| `MP_GAMEROOM_LOAD_POINT` | `[Server]Map/Player.cpp` | PC-room points |
| `UP_CHARACTER_UPDATE_NAME` | `[Server]Agent/AgentNetworkMsgParser.cpp` | Name change |
| `MP_SIEGERECALL_REMOVE` | `[Server]Map/SiegeRecallMgr.h` | Siege |
| `MP_TEST_SIEGERECALL_INSERT` / `_KILLCOUNT` / `_LOAD` / `_REMOVE` / `_RESET` | `[Server]Map/SiegeRecallMgr.h`, `[Server]Agent/SiegeRecallMgr.h` | Non-`TEST_` versions exist (except `_REMOVE`); likely just switch the `#define`s |
| `MP_GMTOOL_UPDATEUSERSTATE` | `[Server]Agent/AgentDBMsgParser.cpp` | GM tool |
| `UP_GMTOOLUSELOG` | `[Server]Agent/AgentDBMsgParser.cpp` | GM tool log |
| `MP_GT_REWARD_MONEY` | `[Server]Map/MapDBMsgParser.cpp` | Event/reward |
| `MP_WEB_EVENT` | `[Server]Map/MapDBMsgParser.cpp`, `[Server]Agent/AgentDBMsgParser.cpp` | Web event |
| `UP_EVENTITEMUSE2` | `[Server]Agent/AgentDBMsgParser.cpp` | Event |
| `TP_CHAT_LOG_INSERT` | `[Server]Agent/AgentNetworkMsgParser.cpp` | Logging |
| `TP_FARM_LOG_INSERT` | `[Server]Map/MapDBMsgParser.cpp` | Logging |
| `UP_NPROTECTBLOCKLOG` | `[Server]Agent/AgentDBMsgParser.cpp` | Anti-cheat; goes away with #5 |

Each call site's format string shows the arguments, which is enough to write the missing procedures.
