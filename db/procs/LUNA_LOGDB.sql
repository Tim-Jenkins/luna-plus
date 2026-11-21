-- Stored procedures the servers call that are missing from LUNA_LOGDB.sql,
-- written from their call sites. Run after LUNA_LOGDB.sql; safe to re-run.
USE [LUNA_LOGDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- [Server]Map/MapDBMsgParser.cpp InsertLogFarm (hseos/Farm/SHFarmManager.cpp):
-- farm purchases, upgrades, taxes and removals.
CREATE OR ALTER PROCEDURE [dbo].[TP_FARM_LOG_INSERT]
(
	@Zone int,
	@Farm int,
	@Kind int,
	@PlayerID int,
	@Value01 int,
	@Value02 int
)
AS
	SET NOCOUNT ON
	INSERT TB_FARM_LOG (Zone, Farm, Kind, PlayerID, Value01, Value02)
	VALUES (@Zone, @Farm, @Kind, @PlayerID, @Value01, @Value02)
GO

-- [Server]Agent/AgentNetworkMsgParser.cpp: chat sent by GM, programmer and
-- developer accounts. The original table isn't in the export.
IF OBJECT_ID(N'[dbo].[TB_CHAT_LOG]', N'U') IS NULL
	CREATE TABLE [dbo].[TB_CHAT_LOG](
		[LOG_IDX] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
		[CHARACTER_IDX] [int] NOT NULL,
		[CHAT] [varchar](128) NOT NULL,
		[LOG_DATE] [datetime] NOT NULL DEFAULT (GETDATE())
	)
GO

CREATE OR ALTER PROCEDURE [dbo].[TP_CHAT_LOG_INSERT]
(
	@CharacterIdx int,
	@Chat varchar(128)
)
AS
	SET NOCOUNT ON
	INSERT TB_CHAT_LOG (CHARACTER_IDX, CHAT) VALUES (@CharacterIdx, @Chat)
GO

-- [Server]Agent/AgentDBMsgParser.cpp LogGMToolUse: GM commands (event
-- toggles, blocks, disconnects). The original table isn't in the export, and
-- TB_ToolLog belongs to UP_TOOLLOG, whose log types are a different enum.
IF OBJECT_ID(N'[dbo].[TB_GMTOOL_USE_LOG]', N'U') IS NULL
	CREATE TABLE [dbo].[TB_GMTOOL_USE_LOG](
		[LOG_IDX] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
		[CHARACTER_IDX] [int] NOT NULL,
		[LOG_TYPE] [int] NOT NULL,
		[LOG_KIND] [int] NOT NULL,
		[PARAM1] [int] NOT NULL,
		[PARAM2] [int] NOT NULL,
		[LOG_DATE] [datetime] NOT NULL DEFAULT (GETDATE())
	)
GO

CREATE OR ALTER PROCEDURE [dbo].[UP_GMTOOLUSELOG]
(
	@CharacterIdx int,
	@LogType int,
	@LogKind int,
	@Param1 int,
	@Param2 int
)
AS
	SET NOCOUNT ON
	INSERT TB_GMTOOL_USE_LOG (CHARACTER_IDX, LOG_TYPE, LOG_KIND, PARAM1, PARAM2)
	VALUES (@CharacterIdx, @LogType, @LogKind, @Param1, @Param2)
GO
