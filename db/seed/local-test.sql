-- Seed data for a local test server. Safe to run more than once.
--
-- Run after the three schema scripts (see db/README.md):
--   sqlcmd -S localhost -U sa -C -f 65001 -i db/seed/local-test.sql
--
-- Creates:
--   * the GameSrv / luna SQL login the servers connect with ([CC]ServerModule/DataBase.cpp),
--     as db_owner of all three databases. CHECK_POLICY is off because "luna" is too weak
--     for the default password policy. Local use only.
--   * two game accounts in LUNA_MEMBERDB.chr_log_info, which up_GameLoginAdult_FREE
--     checks with a plaintext password comparison:
--       test  / test   UserLevel 6 (eUSERLEVEL_USER)
--       admin / admin  UserLevel 1 (eUSERLEVEL_GOD)
--
-- Distribute rejects accounts whose UserLevel is above its limit, which defaults to
-- 4 (GM). serverset/<n>/DistributeDesc.txt in config/local raises it to 6 so "test"
-- can log in. A UserLevel of exactly 4 also needs the client's IP in
-- LUNA_MEMBERDB.tb_OperIp (UP_IP_CHECKIN), so neither account uses it.

SET NOCOUNT ON;
SET XACT_ABORT ON;

-------------------------------------------------------------------------------
-- Server login
-------------------------------------------------------------------------------
USE [master];
IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = N'GameSrv')
    CREATE LOGIN [GameSrv] WITH PASSWORD = N'luna', CHECK_POLICY = OFF, CHECK_EXPIRATION = OFF,
        DEFAULT_DATABASE = [LUNA_GAMEDB];
GO

USE [LUNA_MEMBERDB];
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'GameSrv')
    CREATE USER [GameSrv] FOR LOGIN [GameSrv];
ALTER ROLE [db_owner] ADD MEMBER [GameSrv];
GO

USE [LUNA_GAMEDB];
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'GameSrv')
    CREATE USER [GameSrv] FOR LOGIN [GameSrv];
ALTER ROLE [db_owner] ADD MEMBER [GameSrv];
GO

USE [LUNA_LOGDB];
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'GameSrv')
    CREATE USER [GameSrv] FOR LOGIN [GameSrv];
ALTER ROLE [db_owner] ADD MEMBER [GameSrv];
GO

-------------------------------------------------------------------------------
-- Game accounts
-------------------------------------------------------------------------------
-- propid is the account's user index; TB_CHARACTER.USER_IDX in LUNA_GAMEDB refers to it.
USE [LUNA_MEMBERDB];

MERGE [dbo].[chr_log_info] AS t
USING (VALUES
    (1, 1, 'test',  'test',  6),
    (2, 2, 'admin', 'admin', 1)
) AS s (id_idx, propid, id_loginid, id_passwd, UserLevel)
ON t.propid = s.propid
WHEN MATCHED THEN
    UPDATE SET id_loginid = s.id_loginid, id_passwd = s.id_passwd, UserLevel = s.UserLevel,
               sta_num = 1
WHEN NOT MATCHED THEN
    INSERT (id_idx, propid, id_loginid, id_passwd, UserLevel)
    VALUES (s.id_idx, s.propid, s.id_loginid, s.id_passwd, s.UserLevel);

SELECT propid, id_loginid, UserLevel FROM [dbo].[chr_log_info] WHERE propid IN (1, 2);
GO
