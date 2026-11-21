-- Stored procedures the servers call that are missing from LUNA_MEMBERDB.sql,
-- written from their call sites. Run after LUNA_MEMBERDB.sql; safe to re-run.
USE [LUNA_MEMBERDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- [Server]Agent/AgentNetworkMsgParser.cpp, after a name-change item is used.
-- The Map server has already renamed the character in LUNA_GAMEDB; this told
-- the account database, which in this export keeps no character names. No-op.
CREATE OR ALTER PROCEDURE [dbo].[UP_CHARACTER_UPDATE_NAME]
(
	@CharacterIdx int,
	@UserIdx int,
	@Name varchar(16),
	@ServerSet int
)
AS
	SET NOCOUNT ON
GO

-- [Server]Agent/AgentDBMsgParser.cpp EventItemUse2 / EventItemUse051108:
-- recorded event item use for the operator's web site. No-ops.
CREATE OR ALTER PROCEDURE [dbo].[UP_EVENTITEMUSE2]
(
	@UserIdx int,
	@CharName varchar(16),
	@ServerSet int
)
AS
	SET NOCOUNT ON
GO

CREATE OR ALTER PROCEDURE [dbo].[UP_EVENT051108_INSERT]
(
	@UserIdx int,
	@CharName varchar(16),
	@ServerSet int
)
AS
	SET NOCOUNT ON
GO

-- [Server]Distribute/DistributeDBMsgParser.cpp login variants. Each returns
-- the same row as up_GameLoginAdult_FREE: state, server set, user index,
-- billing type, time, (unused), auth key, user level, agent number.

-- LoginCheckQueryForJP (currently has no callers): the normal login without
-- the security password.
CREATE OR ALTER PROCEDURE [dbo].[UP_GAMELOGINADULT_FREE_JP]
(
	@id_loginid varchar(16),
	@id_passwd varchar(16),
	@ip varchar(16),
	@kind char(1),
	@AuthKey varchar(16),
	@MaxUser int,
	@ageyear int,
	@agentnum tinyint
)
AS
	SET NOCOUNT ON
	EXEC [dbo].[up_GameLoginAdult_FREE] @id_loginid, @id_passwd, @ip, @kind, @AuthKey, @MaxUser, @ageyear, @agentnum, ''
GO

-- CheckDynamicPW: login with a matrix-card code instead of a password. There
-- are no matrix cards, so reply "wrong ID or password" (state 2).
CREATE OR ALTER PROCEDURE [dbo].[UP_GAMELOGINMAT_FREE]
(
	@id_loginid varchar(16),
	@id_passwd varchar(16),
	@ip varchar(16),
	@kind int,
	@AuthKey varchar(16),
	@MaxUser int,
	@ageyear int,
	@agentnum int
)
AS
	SET NOCOUNT ON
	SELECT 2, @kind, 0, 0, 0, 0, @AuthKey, 0, @agentnum
GO

-- WebLauncherLoginWithLoginKey: login with a key issued by the operator's web
-- launcher. There is no web launcher, so reply "wrong ID or password".
CREATE OR ALTER PROCEDURE [dbo].[UP_WEBLAUNCHER_LOGIN_WITH_LOGINKEY]
(
	@LoginKey varchar(64),
	@GameKey int,
	@ip varchar(16),
	@SecurityPW varchar(16),
	@kind int,
	@AuthKey int,
	@MaxUser int,
	@ageyear int,
	@agentnum int
)
AS
	SET NOCOUNT ON
	SELECT 2, @kind, 0, 0, 0, 0, @AuthKey, 0, @agentnum
GO
