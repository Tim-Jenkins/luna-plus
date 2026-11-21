-- Stored procedures the servers call that are missing from LUNA_GAMEDB.sql,
-- written from their call sites. Run after LUNA_GAMEDB.sql; safe to re-run.
-- See db/README.md for which are real implementations and which are no-ops.
USE [LUNA_GAMEDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- The exported MP_GAMEROOM_UPDATE_POINT is missing a GO, so its body ends with
-- "DROP PROCEDURE MP_GAMEROOM_LOAD_POINT" and every call would drop that
-- procedure. Same procedure without the tail.
CREATE OR ALTER PROCEDURE [dbo].[MP_GAMEROOM_UPDATE_POINT]
(
	@CharIdx int,
	@Point int
)
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @UserIdx int
	SELECT @UserIdx = USER_IDX FROM TB_CHARACTER WHERE CHARACTER_IDX = @CharIdx
	IF @@ROWCOUNT = 0
		RETURN

	UPDATE TB_GAMEROOM SET PCROOM_POINT = @Point WHERE USER_IDX = @UserIdx
END
GO

-- [Server]Map/Player.cpp: PC room state when a player in a PC room logs in.
-- RLoadPCRoomPoint reads: point, can receive today's items, PC room members
-- online, buff provided, buff day, user index.
CREATE OR ALTER PROCEDURE [dbo].[MP_GAMEROOM_LOAD_POINT]
(
	@CharIdx int,
	@PCRoomIdx int,
	@MapNum int
)
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @UserIdx int
	SELECT @UserIdx = USER_IDX FROM TB_CHARACTER WHERE CHARACTER_IDX = @CharIdx
	IF @@ROWCOUNT = 0
		RETURN

	IF NOT EXISTS (SELECT NULL FROM TB_GAMEROOM WHERE USER_IDX = @UserIdx)
		INSERT TB_GAMEROOM (USER_IDX) VALUES (@UserIdx)

	UPDATE TB_GAMEROOM
	SET PCROOM_INDEX = @PCRoomIdx, CHARACTER_IDX = @CharIdx, LOGIN_MAP = @MapNum
	WHERE USER_IDX = @UserIdx

	-- Items are handed out once a day, resetting at 06:00, as in MP_GAMEROOM_PROVIDE_ITEM.
	SELECT
		G.PCROOM_POINT,
		CASE WHEN DATEDIFF(DAY, DATEADD(HOUR, -6, G.PROVIDE_TIME), GETDATE()) >= 1 THEN 1 ELSE 0 END,
		(SELECT COUNT(*) FROM TB_GAMEROOM WHERE PCROOM_INDEX = @PCRoomIdx AND CHARACTER_IDX <> 0),
		G.PROVIDE_BUFF,
		G.BUFF_DAY,
		G.USER_IDX
	FROM TB_GAMEROOM G
	WHERE G.USER_IDX = @UserIdx
END
GO

-- [Server]Map/MapDBMsgParser.cpp GuildMarkDelete. RGuildMarkDelete reads
-- guild index (0 = nothing deleted), mark index, character index.
CREATE OR ALTER PROCEDURE [dbo].[MP_GUILD_MARKDELETE]
(
	@GuildIdx int,
	@CharacterIdx int
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON

	DECLARE @MarkIdx int
	SELECT @MarkIdx = MarkName FROM TB_GUILD WHERE GuildIdx = @GuildIdx

	IF ISNULL(@MarkIdx, 0) = 0
	BEGIN
		SELECT 0, 0, @CharacterIdx
		RETURN
	END

	BEGIN TRAN
		DELETE TB_GUILDMARK WHERE GuildIdx = @GuildIdx
		UPDATE TB_GUILD SET MarkName = 0 WHERE GuildIdx = @GuildIdx
		UPDATE TB_CHARACTER SET CHARACTER_MUNPAMARKIDX = 0 WHERE CHARACTER_MUNPAIDX = @GuildIdx
	COMMIT

	SELECT @GuildIdx, @MarkIdx, @CharacterIdx
END
GO

-- [Server]Agent/AgentDBMsgParser.cpp Family_DeleteEmblem. No result is read.
CREATE OR ALTER PROCEDURE [dbo].[MP_FAMILY_DELETE_EMBLEM]
(
	@FamilyID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE TB_FAMILY_EMBLEM WHERE [ID] = @FamilyID
END
GO

-- [Server]Map/MapDBMsgParser.cpp PetInfoRemove (currently has no callers).
-- Removes the pet and the fixed-skill items MP_PET_INFO_ADD gave it.
CREATE OR ALTER PROCEDURE [dbo].[MP_PET_INFO_REMOVE]
(
	@ItemDBIdx int
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON

	DECLARE @PetIdx int
	SELECT @PetIdx = PET_IDX FROM TB_PET WHERE ITEM_DBIDX = @ItemDBIdx
	IF @PetIdx IS NULL
		RETURN

	BEGIN TRAN
		DELETE TB_ITEM WHERE PET_IDX = @PetIdx
		DELETE TB_PET WHERE PET_IDX = @PetIdx
	COMMIT
END
GO

-- [Server]Map/MapDBMsgParser.cpp UpdateSkillExpByTime (currently has no
-- callers). TB_SKILL has no experience column, so there is nothing to store.
CREATE OR ALTER PROCEDURE [dbo].[MP_SKILLTREE_UPDATEEXPBYTIME]
(
	@CharIdx int,
	@SkillDBIdx int,
	@Exp float
)
AS
	SET NOCOUNT ON
GO

-- [Server]Map/MapDBMsgParser.cpp GTRewardMoneyInsert: guild tournament prize
-- money for the guild master. RGTRewardMoneyInsert reads character index and
-- amount, then the Map server adds the money to the player if they're online.
-- Adding it here too keeps it for a master who is offline. An online player's
-- next save writes their in-memory total, which already includes it.
CREATE OR ALTER PROCEDURE [dbo].[MP_GT_REWARD_MONEY]
(
	@CharIdx int,
	@Money bigint
)
AS
BEGIN
	SET NOCOUNT ON

	-- The server formats a DWORD with %d, so amounts over 2^31 arrive negative.
	IF @Money < 0
		SET @Money = @Money + 4294967296

	-- MONEYTYPE is a DWORD.
	UPDATE TB_CHARACTER
	SET CHARACTER_MONEY = CASE WHEN CHARACTER_MONEY + @Money > 4294967295 THEN 4294967295
		ELSE CHARACTER_MONEY + @Money END
	WHERE CHARACTER_IDX = @CharIdx

	IF @@ROWCOUNT = 0
		RETURN

	SELECT @CharIdx, @Money
END
GO

-- [Server]Agent/AgentDBMsgParser.cpp GM_UpdateUserState (currently has no
-- callers): block or unblock the account that owns a character. Like
-- MP_GMTOOL_UpdateUserLevel in LUNA_MEMBERDB, it sets the account's sta_num.
-- RGM_UpdateUserState reads the number of accounts changed (0 = failed).
CREATE OR ALTER PROCEDURE [dbo].[MP_GMTOOL_UPDATEUSERSTATE]
(
	@ServerGroup int,
	@CharName varchar(16),
	@UserState int
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE M
	SET sta_num = @UserState
	FROM [LUNA_MEMBERDB].[dbo].[chr_log_info] M
	INNER JOIN TB_CHARACTER C ON C.USER_IDX = M.propid
	WHERE C.CHARACTER_NAME = @CharName

	SELECT @@ROWCOUNT
END
GO

-- [Server]Map/MapDBMsgParser.cpp and [Server]Agent/AgentDBMsgParser.cpp
-- WebEvent: told the operator's web event system about milestones (level ups
-- and so on). There's no such system, so this is a no-op.
CREATE OR ALTER PROCEDURE [dbo].[MP_WEB_EVENT]
(
	@UserIdx int,
	@Type varchar(10)
)
AS
	SET NOCOUNT ON
GO

-- [Server]Map/ItemManager.cpp: after a stack is split, the new stack keeps the
-- original's seal state and remaining time (the server copies nRemainSecond in
-- memory too). No result is read.
CREATE OR ALTER PROCEDURE [dbo].[MP_ITEM_DIVIDE_UNSEALED]
(
	@OriginalDBIdx int,
	@DividedDBIdx int
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE D
	SET ITEM_SEAL = O.ITEM_SEAL,
		ITEM_ENDTIME = O.ITEM_ENDTIME,
		ITEM_REMAINTIME = O.ITEM_REMAINTIME
	FROM TB_ITEM D
	INNER JOIN TB_ITEM O ON O.ITEM_DBIDX = @OriginalDBIdx
	WHERE D.ITEM_DBIDX = @DividedDBIdx
END
GO

-- [Server]Map/trigger/Trigger.cpp CTrigger::SaveToDb: saves a trigger's
-- repeat count, which MP_TRIGGER_SELECT and MP_TRIGGER_SELECT_COUNT read back.
-- No result is read.
CREATE OR ALTER PROCEDURE [dbo].[MP_TRIGGER_UPDATE]
(
	@ScriptIdx bigint,
	@Name varchar(64),
	@OwnerType int,
	@OwnerIdx int,
	@RepeatCount int,
	@MapIdx int
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE TB_TRIGGER
	SET NAME = LEFT(@Name, 30), REPEAT_COUNT = @RepeatCount, REG_DATE = GETDATE()
	WHERE SCRIPT_IDX = @ScriptIdx AND OWNER_TYPE = @OwnerType
		AND OWNER_IDX = @OwnerIdx AND MAP_IDX = @MapIdx

	IF @@ROWCOUNT = 0
		INSERT TB_TRIGGER (SCRIPT_IDX, NAME, OWNER_TYPE, OWNER_IDX, REPEAT_COUNT, MAP_IDX)
		VALUES (@ScriptIdx, LEFT(@Name, 30), @OwnerType, @OwnerIdx, @RepeatCount, @MapIdx)
END
GO
