USE [LUNA_GAMEDB]
GO
/****** Object:  Table [dbo].[tb_LogUser]    Script Date: 07/30/2013 14:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_LogUser](
	[CurLogUser] [int] NULL,
	[MaxLogUser] [int] NOT NULL,
	[MaxLogCheckTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_BUFF]    Script Date: 07/30/2013 14:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_BUFF](
	[CHARACTER_IDX] [int] NOT NULL,
	[SKILL_IDX] [int] NOT NULL,
	[REMAIN_TIME] [bigint] NOT NULL,
	[REMAIN_COUNT] [int] NOT NULL CONSTRAINT [DF_TB_BUFF_REMAIN_COUNT]  DEFAULT ((0)),
	[END_DATE] [datetime] NULL CONSTRAINT [DF_TB_BUFF_END_DATE]  DEFAULT (NULL)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_MAINQUEST]    Script Date: 07/30/2013 14:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_MAINQUEST](
	[CHARACTER_IDX] [int] NOT NULL,
	[QUEST_IDX] [int] NOT NULL,
	[SUBQUEST_DO] [int] NOT NULL CONSTRAINT [DF_TB_MAINQUEST_SUBQUEST_DO]  DEFAULT ((0)),
	[END_PARAM] [int] NOT NULL CONSTRAINT [DF_TB_MAINQUEST_END_PARAM]  DEFAULT ((0)),
	[REGIST_TIME] [int] NULL,
	[CHECK_TIME] [int] NOT NULL CONSTRAINT [DF_TB_MAINQUEST_CHECK_TIME]  DEFAULT ((0)),
	[CHECK_TYPE] [int] NOT NULL CONSTRAINT [DF_TB_MAINQUEST_CHECK_TYPE]  DEFAULT ((0)),
	[REPEAT] [tinyint] NOT NULL CONSTRAINT [DF_TB_MAINQUEST_REPEAT]  DEFAULT ((0))
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_GT_CANCELLIST]    Script Date: 07/30/2013 14:56:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_GT_CANCELLIST](
	[Tournament_Idx] [int] NOT NULL,
	[Guild_Idx] [int] NOT NULL,
	[Regist_Date] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_CHALLENGEZONE_ENTER]    Script Date: 07/30/2013 14:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_CHALLENGEZONE_ENTER](
	[PlayerID] [int] NOT NULL,
	[EnterFreq] [int] NOT NULL CONSTRAINT [DF_TB_CHALLENGEZONE_ENTER_EnterFreq]  DEFAULT ((0)),
	[BonusFreq] [int] NOT NULL CONSTRAINT [DF_TB_CHALLENGEZONE_ENTER_BonusFreq]  DEFAULT ((0)),
	[LastEnterDate] [smalldatetime] NOT NULL CONSTRAINT [DF_TB_CHALLENGEZONE_ENTER_LastEnterDate]  DEFAULT (getdate()),
	[ExpRate] [smallint] NULL,
 CONSTRAINT [PK_TB_CHALLENGEZONE_ENTER] PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[MP_EVENT_CBT_100217]    Script Date: 07/30/2013 14:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MP_EVENT_CBT_100217]
(
@useridx int,
@idx int
)
as
	Set Nocount on

return
GO
/****** Object:  Table [dbo].[TB_GT_INFO]    Script Date: 07/30/2013 14:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_GT_INFO](
	[GTCOUNT] [smallint] NOT NULL,
	[GUILD_IDX] [int] NOT NULL,
	[GUILD_NAME] [varchar](16) NULL,
	[GTPOS] [tinyint] NOT NULL,
	[GTROUND] [tinyint] NULL,
	[REGDATE] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_GT_PLAYER]    Script Date: 07/30/2013 14:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_GT_PLAYER](
	[GTCOUNT] [smallint] NOT NULL,
	[GUILD_IDX] [int] NOT NULL,
	[PLAYER0] [int] NOT NULL,
	[PLAYER1] [int] NOT NULL,
	[PLAYER2] [int] NOT NULL,
	[PLAYER3] [int] NOT NULL,
	[PLAYER4] [int] NOT NULL,
	[PLAYER5] [int] NOT NULL,
	[PLAYER6] [int] NOT NULL,
	[PLAYER7] [int] NOT NULL,
	[PLAYER8] [int] NOT NULL,
	[PLAYER9] [int] NOT NULL,
	[PLAYER10] [int] NOT NULL,
	[PLAYER11] [int] NOT NULL,
	[PLAYER12] [int] NOT NULL,
	[PLAYER13] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[MP_SearchByMunpaName]    Script Date: 07/30/2013 14:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     proc [dbo].[MP_SearchByMunpaName]
(
		@Munpa_Name		varchar(16)
	,	@Server_No		int
)

as

	Set Nocount on

	select 	MunpaIDX,
		MunpaName,
		Character_Name,
		MemberNum,
		MunpaMoney,
		Famous,
		Location,
		convert(varchar(30), CreateDate, 120)

	from tb_munpa where MunpaName = @Munpa_Name
GO
/****** Object:  Table [dbo].[TB_GT_RANKING]    Script Date: 07/30/2013 14:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_GT_RANKING](
	[Tournament_Idx] [int] NOT NULL,
	[Guild_Idx] [int] NOT NULL,
	[Guild_Name] [varchar](20) NOT NULL,
	[Guild_Position] [tinyint] NOT NULL,
	[Guild_Ranking] [tinyint] NOT NULL,
	[Guild_Process] [tinyint] NOT NULL,
	[Wait_Time] [int] NOT NULL,
	[Regist_Date] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_GUILD]    Script Date: 07/30/2013 14:56:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_GUILD](
	[GuildIdx] [int] IDENTITY(1,1) NOT NULL,
	[GuildName] [varchar](16) NOT NULL,
	[MasterIdx] [int] NOT NULL,
	[MasterName] [varchar](16) NOT NULL,
	[Intro] [varchar](100) NULL,
	[GuildLevel] [tinyint] NOT NULL,
	[Location] [tinyint] NOT NULL,
	[UnionIdx] [int] NOT NULL CONSTRAINT [DF_TB_GUILD_UnionIdx]  DEFAULT ((0)),
	[CreateDate] [smalldatetime] NOT NULL CONSTRAINT [DF__TB_GUILD__Create__02732F85]  DEFAULT (getdate()),
	[GuildMoney] [bigint] NOT NULL CONSTRAINT [DF_TB_GUILD_GuildMoney]  DEFAULT ((0)),
	[MarkName] [int] NOT NULL CONSTRAINT [DF_TB_GUILD_MarkName]  DEFAULT ((0)),
	[UnionEntryDate] [int] NOT NULL CONSTRAINT [DF_TB_GUILD_UnionEntryDate]  DEFAULT ((0)),
	[SCORE] [float] NOT NULL CONSTRAINT [DF_TB_GUILD_Score]  DEFAULT ((0)),
	[LAST_QUEST] [int] NOT NULL CONSTRAINT [DF_TB_GUILD_LAST_QUEST]  DEFAULT ((0)),
	[WAREHOUSE_SIZE] [smallint] NOT NULL CONSTRAINT [DF_TB_GUILD_WAREHOUSE_SIZE]  DEFAULT ((0)),
	[WAREHOUSE_RANK] [tinyint] NOT NULL CONSTRAINT [DF_TB_GUILD_WAREHOUES_RANK]  DEFAULT ((0)),
	[ACCESS_MAP_IDX] [tinyint] NOT NULL CONSTRAINT [DF_TB_GUILD_ACCESS_MAP]  DEFAULT ((0)),
	[ACCESS_CHAR_IDX] [int] NOT NULL CONSTRAINT [DF_TB_GUILD_ACCESS_USER]  DEFAULT ((0)),
	[NOTICE] [varchar](150) NOT NULL CONSTRAINT [DF_TB_GUILD_NOTICE]  DEFAULT ('')
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_MARRIAGE]    Script Date: 07/30/2013 14:58:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_MARRIAGE](
	[PlayerID] [int] NOT NULL,
	[PartnerID] [int] NOT NULL,
	[TeleportFreq] [int] NOT NULL,
	[Nickname] [varchar](16) NULL,
	[DivorceDate] [smalldatetime] NULL,
	[MarriageFreq] [int] NOT NULL,
 CONSTRAINT [PK_TB_MARRIAGE] PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_CHALLENGEZONE_SAVEPOS]    Script Date: 07/30/2013 14:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_CHALLENGEZONE_SAVEPOS](
	[PlayerID] [int] NOT NULL,
	[BeforeMapNum] [int] NOT NULL,
	[PosX] [int] NOT NULL,
	[PosY] [int] NOT NULL,
 CONSTRAINT [PK_TB_CHALLENGEZONE_MOVEPOINT] PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_MONSTERMETER]    Script Date: 07/30/2013 14:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_MONSTERMETER](
	[PlayerID] [int] NOT NULL,
	[PlayTime] [int] NOT NULL,
	[KillMonNum] [int] NOT NULL,
	[PlayTimeTotal] [int] NOT NULL,
	[KillMonNumTotal] [int] NOT NULL,
 CONSTRAINT [PK_TB_MONSTERMETER] PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_CHALLENGEZONE_SUCCESS]    Script Date: 07/30/2013 14:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_CHALLENGEZONE_SUCCESS](
	[PlayerID] [int] NOT NULL,
	[PartnerID] [int] NOT NULL,
	[Section] [int] NOT NULL,
	[SuccessFreq] [int] NOT NULL,
	[ClearTime] [int] NULL,
 CONSTRAINT [PK_TB_CHALLENGEZONE_SUCCESS] PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC,
	[PartnerID] ASC,
	[Section] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_NOTE]    Script Date: 07/30/2013 14:58:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_NOTE](
	[Note_IDX] [int] IDENTITY(1,1) NOT NULL,
	[Receiver_IDX] [int] NOT NULL,
	[Sender_Name] [varchar](16) NOT NULL,
	[Note] [varchar](600) NOT NULL,
	[SendDate] [smalldatetime] NULL CONSTRAINT [DF_TB_NOTE_SendDate]  DEFAULT (getdate()),
	[bRead] [bit] NULL CONSTRAINT [DF_TB_NOTE_bRead]  DEFAULT ((0)),
	[item_idx] [int] NOT NULL CONSTRAINT [DF_TB_NOTE_item_idx]  DEFAULT ((0)),
	[Title] [varchar](40) NULL DEFAULT (''),
	[PackageItemIdx] [int] NULL DEFAULT ((0)),
	[PackageMoney] [bigint] NULL DEFAULT ((0)),
	[bStored] [bit] NOT NULL DEFAULT ((0))
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[MP_RECALLNPC_MapchangePointReturn]    Script Date: 07/30/2013 14:54:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	proc [dbo].[MP_RECALLNPC_MapchangePointReturn]
	(
		@character_idx		int
	)

	AS

		SET NOCOUNT ON
		SET XACT_ABORT ON
GO
/****** Object:  Table [dbo].[TB_CHARACTER]    Script Date: 07/30/2013 14:55:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_CHARACTER](
	[CHARACTER_IDX] [int] IDENTITY(100,1) NOT NULL,
	[USER_IDX] [int] NOT NULL,
	[CHARACTER_NAME] [varchar](16) NOT NULL,
	[CHARACTER_STANDINDEX] [int] NOT NULL,
	[CHARACTER_PARTYIDX] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_PARTYIDX]  DEFAULT ((0)),
	[CHARACTER_STAGE] [tinyint] NOT NULL,
	[CHARACTER_GENDER] [tinyint] NOT NULL,
	[CHARACTER_STR] [int] NOT NULL,
	[CHARACTER_DEX] [int] NOT NULL,
	[CHARACTER_VIT] [int] NOT NULL,
	[CHARACTER_INT] [int] NOT NULL,
	[CHARACTER_WIS] [int] NOT NULL,
	[CHARACTER_LIFE] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_LIFE]  DEFAULT ((9999)),
	[CHARACTER_MAXLIFE] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_MAXLIFE]  DEFAULT ((9999)),
	[CHARACTER_MANA] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_MANA]  DEFAULT ((9999)),
	[CHARACTER_FAME] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_FAME]  DEFAULT ((0)),
	[CHARACTER_KARMA] [tinyint] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_KARMA]  DEFAULT ((0)),
	[CHARACTER_REPUTE] [varchar](16) NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_REPUTE]  DEFAULT ((0)),
	[CHARACTER_GRADE] [tinyint] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_GRADE]  DEFAULT ((1)),
	[CHARACTER_MAXGRADE] [tinyint] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_MAXGRADE]  DEFAULT ((0)),
	[CHARACTER_EXPOINT] [bigint] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_EXPOINT]  DEFAULT ((0)),
	[CHARACTER_GRADEUPPOINT] [smallint] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_GRADEUPPOINT]  DEFAULT ((0)),
	[CHARACTER_MONEY] [bigint] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_MONEY]  DEFAULT ((0)),
	[CHARACTER_WING] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_QUICKPACE]  DEFAULT ((0)),
	[CHARACTER_VITALITY] [tinyint] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_VITALITY]  DEFAULT ((0)),
	[CHARACTER_MAP] [tinyint] NOT NULL,
	[CHARACTER_FACETYPE] [tinyint] NOT NULL,
	[CHARACTER_HEADTYPE] [tinyint] NOT NULL,
	[CHARACTER_WEAPON] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_WEAPON]  DEFAULT ((0)),
	[CHARACTER_SHIELD] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_SHIELD]  DEFAULT ((0)),
	[CHARACTER_HAT] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_HAT]  DEFAULT ((0)),
	[CHARACTER_SHOES] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_SHOES]  DEFAULT ((0)),
	[CHARACTER_DRESS] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_DRESS]  DEFAULT ((0)),
	[CHARACTER_GLOVE] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_GLOVE]  DEFAULT ((0)),
	[CHARACTER_COSTUME_HAT] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_EARRING1]  DEFAULT ((0)),
	[CHARACTER_COSTUME_DRESS] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_EARRING2]  DEFAULT ((0)),
	[CHARACTER_COSTUME_SHOES] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_RING1]  DEFAULT ((0)),
	[CHARACTER_COSTUME_GLOVE] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_RING2]  DEFAULT ((0)),
	[CHARACTER_MASK] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_BELT]  DEFAULT ((0)),
	[CHARACTER_GLASSES] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_NECKLACE]  DEFAULT ((0)),
	[CHARACTER_BAND] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_BAND]  DEFAULT ((0)),
	[CHARACTER_MUNPAIDX] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_MUNPAIDX]  DEFAULT ((0)),
	[CHARACTER_MUNPAJIKCHEK] [tinyint] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_MUNPAJIKCHEK]  DEFAULT ((0)),
	[CHARACTER_MUNPAENTRYDATE] [smalldatetime] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_MUNPAENTRYDATE]  DEFAULT ((0)),
	[CHARACTER_MUNPACANENTRYDATE] [smalldatetime] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_MUNPACANENTRYDATE]  DEFAULT ((0)),
	[CHARACTER_MUNPANAME] [varchar](50) NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_MUNPANAME]  DEFAULT (''),
	[CHARACTER_MUNPAMARKIDX] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_MUNPAMARKIDX]  DEFAULT (''),
	[CHARACTER_ABILITY1] [tinyint] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_ABILITY1]  DEFAULT ((0)),
	[CHARACTER_ABILITY2] [tinyint] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_ABILITY2]  DEFAULT ((0)),
	[CHARACTER_ABILITY3] [tinyint] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_ABILITY3]  DEFAULT ((0)),
	[CHARACTER_ABILITY4] [tinyint] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_ABILITY4]  DEFAULT ((0)),
	[CHARACTER_ABILITY5] [tinyint] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_ABILITY5]  DEFAULT ((0)),
	[CHARACTER_ABILITY6] [tinyint] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_ABILITY6]  DEFAULT ((0)),
	[CHARACTER_ABILITY7] [tinyint] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_ABILITY7]  DEFAULT ((0)),
	[CHARACTER_BIRTH] [smalldatetime] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_BIRTH]  DEFAULT ((0)),
	[CHARACTER_LASTMODIFIED] [smalldatetime] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_LASTMODIFIED]  DEFAULT ((0)),
	[CHARACTER_STATE] [tinyint] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_STATE]  DEFAULT ((0)),
	[Character_MapChangePoint] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_Character_MapChangePoint]  DEFAULT ((0)),
	[Character_LoginPoint] [int] NOT NULL,
	[CHARACTER_ABILITYEXP] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_ABILITYEXP]  DEFAULT ((0)),
	[CHARACTER_CURRENTMAP] [tinyint] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_CURRENTMAP]  DEFAULT ((0)),
	[CHARACTER_BADFAME] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_BADFAME]  DEFAULT ((0)),
	[CHARACTER_POS_X] [int] NOT NULL,
	[CHARACTER_POS_Y] [int] NOT NULL,
	[CHARACTER_PLAYTIME] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_PLAYTIME]  DEFAULT ((0)),
	[CHARACTER_LASTPKENDTIME] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_LASTPKENDTIME]  DEFAULT ((0)),
	[CHARACTER_NICKNAME] [varchar](20) NULL,
	[CHARACTER_ATTR] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_ATTR]  DEFAULT ((0)),
	[CHARACTER_JOB] [tinyint] NOT NULL,
	[CHARACTER_JOB1] [tinyint] NOT NULL,
	[CHARACTER_JOB2] [tinyint] NOT NULL,
	[CHARACTER_JOB3] [tinyint] NOT NULL,
	[CHARACTER_JOB4] [tinyint] NOT NULL,
	[CHARACTER_JOB5] [tinyint] NOT NULL,
	[CHARACTER_JOB6] [tinyint] NOT NULL,
	[CHARACTER_FAMILYIDX] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_FAMILYIDX]  DEFAULT ((0)),
	[CHARACTER_FAMILYNAME] [varchar](30) NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_FAMILYNAME]  DEFAULT (''),
	[CHARACTER_FAMILYJIKCHEK] [tinyint] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_FAMILYJIKCHEK]  DEFAULT ((0)),
	[CHARACTER_FAMILYENTRYDATE] [smalldatetime] NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_FAMILYENTRYDATE]  DEFAULT ((0)),
	[CHARACTER_FAMILYCANENTRYDATE] [smalldatetime] NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_FAMILYCANENTRYDATE]  DEFAULT ((0)),
	[CHARACTER_FAMILYMARKIDX] [int] NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_FAMILYMARKIDX]  DEFAULT ((0)),
	[CHARACTER_FAMILYNICKNAME] [char](30) NULL,
	[CHARACTER_SKILLPOINT] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_SKILLPOINT]  DEFAULT ((0)),
	[CHARACTER_ACCSKILLPOINT] [int] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_ACCSKILLPOINT]  DEFAULT ((0)),
	[CHARACTER_INVENTORY] [tinyint] NOT NULL CONSTRAINT [DF_TB_CHARACTER_CHARACTER_INVENTORY]  DEFAULT ((0)),
	[CHARACTER_ZS] [int] NOT NULL DEFAULT ((0))
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILDWARRECORD_Load]    Script Date: 07/30/2013 14:53:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE     PROC [dbo].[MP_GUILDWARRECORD_Load]
(
		@StartIdx	int
)
AS	
	Set Nocount on
	SELECT 0
	return
GO
/****** Object:  StoredProcedure [dbo].[MP_ConnectionCheck]    Script Date: 07/30/2013 14:52:44 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create  proc [dbo].[MP_ConnectionCheck]



as
	Set Nocount On
	Set Xact_Abort On

	select 0
GO
/****** Object:  Table [dbo].[tb_npc_remaintime]    Script Date: 07/30/2013 14:58:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_npc_remaintime](
	[createdidx] [bigint] NOT NULL CONSTRAINT [DF__tb_npc_re__creat__0856260D]  DEFAULT ((0)),
	[npcidx] [smallint] NOT NULL CONSTRAINT [DF__tb_npc_re__npcid__094A4A46]  DEFAULT ((0)),
	[mapidx] [smallint] NOT NULL CONSTRAINT [DF__tb_npc_re__mapid__0A3E6E7F]  DEFAULT ((0)),
	[remaintick] [bigint] NOT NULL CONSTRAINT [DF__tb_npc_re__remai__0B3292B8]  DEFAULT ((0)),
	[connectionidx] [bigint] NOT NULL CONSTRAINT [DF__tb_npc_re__conne__0C26B6F1]  DEFAULT ((0)),
	[agentnum] [tinyint] NOT NULL CONSTRAINT [DF__tb_npc_re__agent__0D1ADB2A]  DEFAULT ((0))
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_GUILD_NOTICE]    Script Date: 07/30/2013 14:56:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_GUILD_NOTICE](
	[Idx] [int] IDENTITY(1,1) NOT NULL,
	[GuildIdx] [int] NOT NULL,
	[Notice] [varchar](150) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_GUILD_SKILL]    Script Date: 07/30/2013 14:56:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_GUILD_SKILL](
	[GUILD_IDX] [int] NOT NULL,
	[SKILL_IDX] [int] NOT NULL,
	[SKILL_LEVEL] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_GUILDFIELDWAR]    Script Date: 07/30/2013 14:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_GUILDFIELDWAR](
	[Idx] [int] IDENTITY(1,1) NOT NULL,
	[GuildIdx1] [int] NOT NULL,
	[GuildIdx2] [int] NOT NULL,
	[GFWMoney] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[MP_QUEST_EventEnd]    Script Date: 07/30/2013 14:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE       proc [dbo].[MP_QUEST_EventEnd]
(
	@UserIdx	int,
	@CharacterIdx	int,
	@Time		smalldatetime
)
as
	set nocount on

	update mhcmember.dbo.event060321_AttendNWorks set Works_Check = 'Y', Works_RegDate = getdate()
	where Web_RegDate >= @Time and Web_RegDate < @Time + 1 and charno = @CharacterIdx
GO
/****** Object:  Table [dbo].[TB_GUILDMARK]    Script Date: 07/30/2013 14:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_GUILDMARK](
	[MarkIdx] [int] IDENTITY(1,1) NOT NULL,
	[GuildIdx] [int] NOT NULL,
	[ImgData] [varbinary](1025) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[MP_QUEST_EventCheck]    Script Date: 07/30/2013 14:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE      proc [dbo].[MP_QUEST_EventCheck]
(
	@UserIdx	int,
	@CharacterIdx	int,
	@NpcIdx		int,
	@QuestIdx	int,
	@Time		smalldatetime
)
as
	set nocount on


	declare	@webcheck 	char(1)
	declare	@gamecheck 	char(1)

	select @webcheck = Web_Check, @gamecheck = Game_Check from mhcmember.dbo.event060321_AttendNWorks
	where Web_RegDate >= @Time and Web_RegDate < @Time + 1 and charno = @CharacterIdx 
	
	if( @webcheck = 'Y' )
	begin
		if( @gamecheck = 'N' )
		begin
			select @NpcIdx, @QuestIdx, 0
			update mhcmember.dbo.event060321_AttendNWorks set Game_Check = 'Y', Game_RegDate = getdate()
			where Web_RegDate >= @Time and Web_RegDate < @Time + 1 and charno = @CharacterIdx 
			return
		end
		else
		begin
			select @NpcIdx, @QuestIdx, 1
			return
		end
	end
	else
	begin
		select @NpcIdx, @QuestIdx, 2
		return
	end
GO
/****** Object:  Table [dbo].[TB_GuildUnion]    Script Date: 07/30/2013 14:57:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_GuildUnion](
	[GuildUnionIdx] [int] IDENTITY(1,1) NOT NULL,
	[GuildUnionName] [varchar](20) NOT NULL,
	[GuildIdx0] [int] NOT NULL,
	[GuildIdx1] [int] NOT NULL,
	[GuildIdx2] [int] NOT NULL,
	[GuildIdx3] [int] NOT NULL,
	[GuildIdx4] [int] NOT NULL,
	[GuildIdx5] [int] NOT NULL,
	[GuildIdx6] [int] NOT NULL,
	[MarkIdx] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_GuildUnionMark]    Script Date: 07/30/2013 14:57:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_GuildUnionMark](
	[MarkIdx] [int] IDENTITY(1,1) NOT NULL,
	[GuildUnionIdx] [int] NOT NULL,
	[ImgData] [varbinary](1025) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_GUILDWARRECORD]    Script Date: 07/30/2013 14:57:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_GUILDWARRECORD](
	[Idx] [int] IDENTITY(1,1) NOT NULL,
	[GuildIdx] [int] NOT NULL,
	[GFWVictory] [int] NULL,
	[GFWDraw] [int] NULL,
	[GFWLoose] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_OPTION]    Script Date: 07/30/2013 14:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_OPTION](
	[CHARACTER_IDX] [int] NOT NULL,
	[HIDEFLAG] [int] NOT NULL,
 CONSTRAINT [PK_TB_OPTION] PRIMARY KEY NONCLUSTERED 
(
	[CHARACTER_IDX] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[MP_QEUST_EXCUTE]    Script Date: 07/30/2013 14:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=================================================================================================
--	FILE		: MP_QUEST_EXCUTE
--	PURPOSE	: Excute all command of quest at once
--	PROGRAMMER	: Yongs Lee
--	DATE		: January 23, 2008
--
--	DESCRIPTION	: 현재 날짜의 퀘스트 구조 상, 퀘스트의 처리를 위한 명령어 실행이 각각 나눠져 실행되고 
--
--			  있다. 각 명령에 따른 프로시저 또한 나눠져 있는 상태이며, 한 묶음의 퀘스트 명령을 실행 
--
--			  시키면, 네트워크 트래픽에 따라 어떤 프로시저가 먼저 실행 될지 알 수 없는 상태이고, 
--
--			  또한 한 묶음의 명령어 실행 중, 서버에 문제가 생기거나 하면, 남은 프로시저의 실행 여부를 
--
--			  보장할 수 없기에 세팅 된 명령어를, 여러 프로시저가 아닌, 한 프로시저 안에서 해결하도록 
--
--			  처리한다. 이로 인해, 기존에 있던 퀘스트는 완료 되었는데 아이템이 반납되지 않거나 하는
--
--			  버그의 발생을 막고자 함이다.
--=================================================================================================



-- 아래는 실행 될 퀘스트 명령어의 종류를 구분하고자 함이다.

-- 앞에 정의 된 숫자는, 아래 명령어 구분에서 사용하게 될 것이다.

-- ( 0) eQuestExecute_EndQuest						퀘스트 종료
-- ( 1) eQuestExecute_StartQuest						퀘스트 시작

-- ( 2) eQuestExecute_EndSub						서브 퀘스트 종료
-- ( 3) eQuestExecute_EndOtherSub					다른 서브 퀘스트 종료
-- ( 4) eQuestExecute_StartSub						서브 퀘스트 시작

-- ( 5) eQuestExecute_AddCount						카운트 증가
-- ( 6) eQuestExecute_MinusCount						카운트 감소

-- ( 7) eQuestExecute_GiveQuestItem					퀘스트 아이템 반납
-- ( 8) eQuestExecute_TakeQuestItem					퀘스트 아이템 획득

-- ( 9) eQuestExecute_GiveItem						아이템 반납
-- (10) eQuestExecute_GiveMoney						돈 반납

-- (11) eQuestExecute_TakeItem						아이템 획득
-- (12) eQuestExecute_TakeMoney						돈 획득
-- (13) eQuestExecute_TakeExp						경험치 획득	
-- (14) eQuestExecute_TakeSExp						스킬 경험치 획득? 현재 사용 안함

-- (15) eQuestExecute_RandomTakeItem					아이템 랜덤 획득

-- (16) eQuestExecute_TakeQuestItemFQW					퀘스트 아이템 획득(특정 퀘스트 아이템을 소지 시)
-- (17) eQuestExecute_AddCountFQW					카운트 증가(특정 퀘스트 아이템을 소지 시)
-- (18) eQuestExecute_TakeQuestItemFW					퀘스트 아이템 획득(특정 아이템을 소지 시)
-- (19) eQuestExecute_AddCountFW					카운트 증가(특정 아이템을 소지 시)

-- (20) eQuestExecute_TakeMoneyPerCount					카운트에 따라 돈 획득

-- (21) eQuestExecute_RegenMonster					몬스터 리젠
-- (22) eQuestExecute_MapChange					맵 변경

-- (23) eQuestExecute_ChangeStage					캐릭터의 클래스 인덱스 변경	

-- (24) eQuestExecute_ChangeSubAttr					현재 사용하지 않음

-- (25) eQuestExecute_RegistTime						현재 사용하지 않음

-- (26) eQuestExecute_LevelGap						현재 사용하지 않음
-- (27) eQuestExecute_MonLevel						현재 사용하지 않음


CREATE  PROCEDURE [dbo].[MP_QEUST_EXCUTE]
(
	@parameter1 int,
	@parameter2 int
)


as
	Set Nocount On
	Set Xact_Abort On
return
GO
/****** Object:  Table [dbo].[TB_HOUSE]    Script Date: 07/30/2013 14:57:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_HOUSE](
	[USER_INDEX] [int] NOT NULL,
	[HOUSE_NAME] [varchar](32) NOT NULL,
	[EXTERIOR_KIND] [tinyint] NOT NULL,
	[EXTEND_LEVEL] [tinyint] NOT NULL,
	[TOTAL_VISITCOUNT] [int] NOT NULL,
	[DAILY_VISITCOUNT] [int] NOT NULL,
	[DECO_USEPOINT] [int] NOT NULL,
	[HOUSE_POINT] [int] NOT NULL,
	[UPDATEDATE] [datetime] NOT NULL CONSTRAINT [DF_TB_HOUSE_UPDATEDATE]  DEFAULT (getdate()),
 CONSTRAINT [PK_TB_HOUSE] PRIMARY KEY CLUSTERED 
(
	[USER_INDEX] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_PARTY]    Script Date: 07/30/2013 14:58:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_PARTY](
	[PARTY_IDX] [int] NOT NULL,
	[CHARACTER_IDX] [int] NOT NULL,
	[CHARACTER_RANK] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[TP_ChangeMugongPosition]    Script Date: 07/30/2013 14:55:00 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[TP_ChangeMugongPosition]
(
		@ChrIdx		int
	,	@DBIdx		int
	,	@Position	int
)
as
	set nocount on

	update tb_mugong set mugong_position = @Position where character_idx = @ChrIdx and mugong_dbidx = @DBIdx
GO
/****** Object:  Table [dbo].[TB_PARTYINFO]    Script Date: 07/30/2013 14:58:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_PARTYINFO](
	[PARTY_IDX] [int] IDENTITY(1,1) NOT NULL,
	[CHARACTER_IDX] [int] NOT NULL,
	[PARTY_OPTION] [smallint] NOT NULL,
	[PARTY_SUBOPTION] [smallint] NOT NULL CONSTRAINT [DK_PARTY_SUBOPTION]  DEFAULT ((3))
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_HOUSE_FURNITURE]    Script Date: 07/30/2013 14:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_HOUSE_FURNITURE](
	[USER_INDEX] [int] NOT NULL,
	[FURNITURE_INDEX] [int] NOT NULL,
	[ITEM_INDEX] [int] NOT NULL,
	[MTRL_INDEX] [smallint] NOT NULL,
	[POSX] [real] NOT NULL,
	[POSY] [real] NOT NULL,
	[POSZ] [real] NOT NULL,
	[ANGLE] [real] NOT NULL,
	[CATEGORY] [smallint] NOT NULL,
	[SLOT] [smallint] NOT NULL,
	[STATE] [smallint] NOT NULL,
	[NOTDELETE] [tinyint] NOT NULL,
	[ENDTIME] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_HOUSE_RANK]    Script Date: 07/30/2013 14:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_HOUSE_RANK](
	[NUM] [int] IDENTITY(1,1) NOT NULL,
	[RANK_1_USERID] [int] NULL,
	[RANK_1_HOUSENAME] [varchar](32) NULL,
	[RANK_1_EXTKIND] [int] NULL,
	[RANK_1_POINT] [int] NULL,
	[RANK_2_USERID] [int] NULL,
	[RANK_2_HOUSENAME] [varchar](32) NULL,
	[RANK_2_EXTKIND] [int] NULL,
	[RANK_2_POINT] [int] NULL,
	[RANK_3_USERID] [int] NULL,
	[RANK_3_HOUSENAME] [varchar](32) NULL,
	[RANK_3_EXTKIND] [int] NULL,
	[RANK_3_POINT] [int] NULL,
	[CALCDATE] [datetime] NOT NULL CONSTRAINT [DF_TB_HOUSE_RANK_CALCDATE]  DEFAULT (getdate())
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[MP_PYOGUK_ItemRareOption_Info]    Script Date: 07/30/2013 14:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE proc [dbo].[MP_PYOGUK_ItemRareOption_Info]
(
	@UserIdx	int,
	@StartIdx	int
)
as

	set nocount on

	select top 100 b.* from tb_item a
	right outer join tb_item_rare b on a.item_dbidx = b.ITEM_DBIDX and rare_dbidx > @StartIdx
	where a.item_pyogukIdx = @UserIdx
GO
/****** Object:  Table [dbo].[TB_PET]    Script Date: 07/30/2013 14:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_PET](
	[PET_IDX] [int] IDENTITY(1000000000,1) NOT NULL,
	[ITEM_DBIDX] [int] NOT NULL,
	[MASTER_IDX] [int] NOT NULL,
	[PET_KIND] [smallint] NOT NULL,
	[PET_LEVEL] [tinyint] NOT NULL CONSTRAINT [DF_TB_PET_PET_LEVEL]  DEFAULT ((1)),
	[PET_GRADE] [tinyint] NOT NULL CONSTRAINT [DF_TB_PET_PET_GRADE]  DEFAULT ((0)),
	[SKILL_SLOT] [tinyint] NOT NULL CONSTRAINT [DF_TB_PET_SKILL_SLOT]  DEFAULT ((0)),
	[PET_EXP] [smallint] NOT NULL CONSTRAINT [DF_TB_PET_PET_EXP]  DEFAULT ((0)),
	[PET_FRIENDLY] [tinyint] NOT NULL CONSTRAINT [DF_TB_PET_PET_FRIENDLY]  DEFAULT ((100)),
	[PET_HP] [int] NOT NULL CONSTRAINT [DF_TB_PET_PET_HP]  DEFAULT ((1000)),
	[PET_MAXHP] [int] NOT NULL CONSTRAINT [DF_TB_PET_PET_MAXHP]  DEFAULT ((1000)),
	[PET_MP] [int] NOT NULL CONSTRAINT [DF_TB_PET_PET_MP]  DEFAULT ((1000)),
	[PET_MAXMP] [int] NOT NULL CONSTRAINT [DF_TB_PET_PET_MAXMP]  DEFAULT ((1000)),
	[PET_AI] [tinyint] NOT NULL CONSTRAINT [DF_TB_PET_PET_AI]  DEFAULT ((1)),
	[PET_STATE] [tinyint] NOT NULL CONSTRAINT [DF_TB_PET_PET_STATE]  DEFAULT ((0)),
	[PET_TYPE] [tinyint] NOT NULL CONSTRAINT [DF_TB_PET_PET_TYPE]  DEFAULT ((0)),
	[PET_CHECKTIME] [int] NOT NULL CONSTRAINT [DF_TB_PET_PET_CHECKTIME]  DEFAULT ((0)),
 CONSTRAINT [IX_TB_PET_ITEM_DB_IDX] UNIQUE NONCLUSTERED 
(
	[ITEM_DBIDX] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_SelectAbility]    Script Date: 07/30/2013 14:52:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE     proc [dbo].[MP_CHARACTER_SelectAbility]
(
	@CHARACTER_IDX int
)

as
	Set Nocount on
	Set Xact_Abort on
	
	if exists (select * from TB_ABILITY where character_idx = @CHARACTER_IDX )
		select * from TB_ABILITY where character_idx = @CHARACTER_IDX
	else
	   begin

		insert TB_ABILITY
		(
			character_idx
		,	BattleAbility
		,	KyungGongAbility
		,	SocietyAbility
		,	JobAbility
		,	BattleQuick
		,	KyungGongQuick
		,	SocietyQuick
		,	JobQuick
		)
			values
			(
				@CHARACTER_IDX
			,	"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
			,	"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
			,	"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
			,	"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
			,	"                                        "
			,	"                                        "
			,	"                                        "
			,	"                                        "
			)

		select * from TB_ABILITY where character_idx = @CHARACTER_IDX
	   end
GO
/****** Object:  Table [dbo].[TB_IPADDRESSCHK]    Script Date: 07/30/2013 14:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_IPADDRESSCHK](
	[idx] [int] NOT NULL,
	[type] [char](1) NOT NULL,
	[ip_address] [varchar](12) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_ITEM]    Script Date: 07/30/2013 14:57:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_ITEM](
	[CHARACTER_IDX] [int] NOT NULL,
	[ITEM_DBIDX] [int] IDENTITY(1,1) NOT NULL,
	[ITEM_IDX] [int] NOT NULL,
	[ITEM_POSITION] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_ITEM_POSITION]  DEFAULT ((0)),
	[ITEM_QPOSITION] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_ITEM_QPOSITION]  DEFAULT ((0)),
	[ITEM_DURABILITY] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_ITEM_DURABILITY]  DEFAULT ((1)),
	[ITEM_PYOGUKIDX] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_ITEM_MUNPAIDX]  DEFAULT ((0)),
	[ITEM_MUNPAIDX] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_ITEM_FAMILYIDX]  DEFAULT ((0)),
	[ITEM_FAMILYIDX] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_ITEM_PYOGUKIDX]  DEFAULT ((0)),
	[ITEM_SHOPIDX] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_ITEM_SHOPIDX]  DEFAULT ((0)),
	[ITEM_PARAM] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_ITEM_PARAM]  DEFAULT ((0)),
	[ITEM_RAREIDX] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_ITEM_RAREIDX]  DEFAULT ((0)),
	[ITEM_SEAL] [tinyint] NOT NULL CONSTRAINT [DF_TB_ITEM_ITEM_SEAL]  DEFAULT ((0)),
	[ITEM_ENDTIME] [datetime] NOT NULL CONSTRAINT [DF_TB_ITEM_ITEM_BEGINTIME]  DEFAULT (getdate()),
	[ITEM_REMAINTIME] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_ITEM_REMAINTIME]  DEFAULT ((0)),
	[PET_IDX] [int] NOT NULL CONSTRAINT [DF__TB_ITEM__PET_IDX__22B5168E]  DEFAULT ((0))
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[StoredProcedure1]    Script Date: 07/30/2013 14:54:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StoredProcedure1]
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
AS
	/* SET NOCOUNT ON */
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_PETINVEN_ItemOption_Info]    Script Date: 07/30/2013 14:54:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE    PROC [dbo].[MP_PETINVEN_ItemOption_Info]
(
	@CharacterIdx	int,
	@StartPos	int,
	@EndPos	int
)
AS
	set nocount on

	if exists( select b.* from TB_ITEM a with(readuncommitted) right outer join TB_ITEM_OPTION b with(readuncommitted) on a.ITEM_DBIDX = b.ITEM_DBIDX
		where a.CHARACTER_IDX = @CharacterIdx and a.ITEM_POSITION >= @StartPos and a.ITEM_POSITION < @EndPos )
	begin
		select b.* from TB_ITEM a with(readuncommitted) right outer join TB_ITEM_OPTION b with(readuncommitted) on a.ITEM_DBIDX = b.ITEM_DBIDX
		where a.CHARACTER_IDX = @CharacterIdx and a.ITEM_POSITION >= @StartPos and a.ITEM_POSITION < @EndPos
	end
	else
	begin
		select 0
	end
GO
/****** Object:  StoredProcedure [dbo].[spGrantExectoAllStoredProcs]    Script Date: 07/30/2013 14:54:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGrantExectoAllStoredProcs] @user sysname
AS

/*----------------------------------------------------------------------------
-- Object Name: spGrantExectoAllStoredProcs
-- Author: Edgewood Solutions
-- Development Date: 03.19.2007
-- Called By: TBD
-- Description: Issue GRANT EXEC statement for all stored procedures 
-- based on the user name that is passed in to this stored procedure
-- Project: SQL Server Security
-- Database: User defined databases 
-- Business Process: SQL Server Security
-- 
----------------------------------------------------------------------------
-- Num | CRF ID | Date Modified | Developer | Description
----------------------------------------------------------------------------
-- 001  | N\A     | 03.15.2007    | Edgewood | Original code for the GRANT 
-- EXEC process
--
-- 
*/ 
SET NOCOUNT ON

-- 1 - Variable declarations
DECLARE @CMD1 varchar(8000)
DECLARE @MAXOID int
DECLARE @OwnerName varchar(128)
DECLARE @ObjectName varchar(128)

-- 2 - Create temporary table
CREATE TABLE #StoredProcedures
(OID int IDENTITY (1,1),
StoredProcOwner varchar(128) NOT NULL,
StoredProcName varchar(128) NOT NULL)

-- 3 - Populate temporary table
INSERT INTO #StoredProcedures (StoredProcOwner, StoredProcName)
SELECT u.[Name], o.[Name]
FROM dbo.sysobjects o
INNER JOIN dbo.sysusers u
ON o.uid = u.uid
WHERE o.Type = 'P'
AND o.[Name] NOT LIKE 'dt_%'

-- 4 - Capture the @MAXOID value
SELECT @MAXOID = MAX(OID) FROM #StoredProcedures

-- 5 - WHILE loop
WHILE @MAXOID > 0
BEGIN 

-- 6 - Initialize the variables
SELECT @OwnerName = StoredProcOwner,
@ObjectName = StoredProcName
FROM #StoredProcedures
WHERE OID = @MAXOID

-- 7 - Build the string
SELECT @CMD1 = 'GRANT EXEC ON ' + '[' + @OwnerName + ']' + '.' + '[' + @ObjectName + ']' + ' TO ' + @user

-- 8 - Execute the string
-- SELECT @CMD1
EXEC(@CMD1)

-- 9 - Decrement @MAXOID
SET @MAXOID = @MAXOID - 1
END

-- 10 - Drop the temporary table
DROP TABLE #StoredProcedures

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[MP_PETINVEN_ItemRareOption_Info]    Script Date: 07/30/2013 14:54:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE    PROC [dbo].[MP_PETINVEN_ItemRareOption_Info]
(
	@CharacterIdx	int,
	@StartPos	int,
	@EndPos	int
)
AS
	set nocount on

	if exists( select b.* from TB_ITEM a with(readuncommitted) right outer join TB_ITEM_RARE b with(readuncommitted) on a.ITEM_DBIDX = b.ITEM_DBIDX
		where a.CHARACTER_IDX = @CharacterIdx )
	begin
		select b.* from TB_ITEM a with(readuncommitted) right outer join TB_ITEM_RARE b with(readuncommitted) on a.ITEM_DBIDX = b.ITEM_DBIDX
		where a.CHARACTER_IDX = @CharacterIdx and a.ITEM_POSITION >= @StartPos and a.ITEM_POSITION < @EndPos
	end
	else
	begin
		select 0
	end
GO
/****** Object:  StoredProcedure [dbo].[RP_SearchMunpaByName]    Script Date: 07/30/2013 14:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 문파 정보 
CREATE proc [dbo].[RP_SearchMunpaByName]
(
	@munpaName		varchar(20)
)
as
	Set Nocount on

	
	select munpaIdx from tb_munpa with(nolock)  where munpaname = @munpaName
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_MugongUpdate]    Script Date: 07/30/2013 14:52:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MP_CHARACTER_MugongUpdate]
(
	@MUGONG_DBIDX		int
,	@MUGONG_IDX			int
, 	@MUGONG_EXPPOINT	int
, 	@MUGONG_SUNG		tinyint
, 	@MUGONG_POSITION		int
,	@MUGONG_QPOSITION		int
, 	@MUGONG_WEAR		bit
)
as
	set nocount on
	set xact_abort on
update TB_MUGONG set MUGONG_EXPPOINT = @MUGONG_EXPPOINT, 
	MUGONG_SUNG = @MUGONG_SUNG, MUGONG_POSITION = @MUGONG_POSITION,
	MUGONG_QPOSITION = @MUGONG_QPOSITION, MUGONG_WEAR = @MUGONG_WEAR 
	where MUGONG_DBIDX = @MUGONG_DBIDX
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_MugongMoveUpdate]    Script Date: 07/30/2013 14:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MP_CHARACTER_MugongMoveUpdate]
(
	@MUGONG_DBIDX1		int
, 	@MUGONG_POSITION1	int
,	@MUGONG_DBIDX2		int
, 	@MUGONG_POSITION2	int

)
as
	set nocount on
	set xact_abort on
update TB_MUGONG set MUGONG_POSITION = @MUGONG_POSITION1
	where MUGONG_DBIDX = @MUGONG_DBIDX1
update TB_MUGONG set MUGONG_POSITION = @MUGONG_POSITION2
	where MUGONG_DBIDX = @MUGONG_DBIDX2
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_MugongDelete]    Script Date: 07/30/2013 14:52:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MP_CHARACTER_MugongDelete]
(
	@CHARACTER_IDX		int
,	@MUGONG_IDX			int
,	@MUGONG_POSITION		int
)
as

	set nocount on
	set xact_abort on

	update TB_MUGONG set character_idx = 0 where (CHARACTER_IDX = @CHARACTER_IDX and
		MUGONG_IDX = @MUGONG_IDX and MUGONG_POSITION = @MUGONG_POSITION)
GO
/****** Object:  StoredProcedure [dbo].[RP_MunpaBaseInfo]    Script Date: 07/30/2013 14:54:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 캐릭터 이름으로 검색

CREATE   proc [dbo].[RP_MunpaBaseInfo]
(
	@MunpaIdx	int
)
as
	Set Nocount on

	select 	munpaidx, 
		munpaname, 
		character_name, 
		convert(varchar(5),year(createdate)) +'-'+ 
		convert(varchar(3), month(createdate)) +'-'+ 
		convert(varchar(3), day(createdate)),
		convert(varchar(17), createdate, 108)
		membernum, 
		location, 
		munpalevel, 
		famous, 
		kind, 
		munpamoney 
	from tb_munpa  with(nolock) 
	where munpaidx = @MunpaIdx
GO
/****** Object:  StoredProcedure [dbo].[RP_MugongUpdate]    Script Date: 07/30/2013 14:54:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[RP_MugongUpdate]
(
		@MUGONG_DBIDX		int
	,	@MUGONG_IDX			int
	, 	@MUGONG_EXPPOINT		int
	, 	@MUGONG_SUNG		tinyint
)
as
	set nocount on

	update TB_MUGONG set 

	MUGONG_IDX		= @MUGONG_IDX,
	MUGONG_EXPPOINT 	= @MUGONG_EXPPOINT, 
	MUGONG_SUNG 		= @MUGONG_SUNG

	where MUGONG_DBIDX = @MUGONG_DBIDX
GO
/****** Object:  StoredProcedure [dbo].[RP_MugongInsert]    Script Date: 07/30/2013 14:54:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[RP_MugongInsert]
(
		@CHARACTER_IDX	int
	,	@MUGONG_IDX		int
	,	@MUGONG_EXPPOINT	int
	,	@MUGONG_SUNG	int
	,	@MUGONG_POS		int
	,	@MUGONG_WEAR	int
)
as

	set nocount on

	insert tb_mugong
	(
		CHARACTER_IDX,
		MUGONG_IDX, 
		MUGONG_EXPPOINT,
		MUGONG_SUNG, 
		MUGONG_POSITION, 
		MUGONG_QPOSITION, 
		MUGONG_WEAR
	)
	values
	(
		@CHARACTER_IDX,
		@MUGONG_IDX,
		@MUGONG_EXPPOINT,
		@MUGONG_SUNG,
		@MUGONG_POS,
		0,
		@MUGONG_WEAR
	)
GO
/****** Object:  StoredProcedure [dbo].[RP_MugongDelete]    Script Date: 07/30/2013 14:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[RP_MugongDelete]
(
	@Mugong_DBIdx	int
)
as
	set nocount on

	delete tb_mugong where Mugong_DBIdx = @Mugong_DBIdx
GO
/****** Object:  Table [dbo].[TB_PETINFO]    Script Date: 07/30/2013 14:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_PETINFO](
	[PetDBIdx] [int] IDENTITY(1,1) NOT NULL,
	[MasterIdx] [int] NOT NULL,
	[SummonItemDBIdx] [int] NOT NULL,
	[Kind] [int] NOT NULL,
	[Grade] [int] NOT NULL,
	[Stamina] [int] NOT NULL,
	[FriendShip] [int] NOT NULL,
	[Alive] [tinyint] NOT NULL,
	[Summon] [tinyint] NOT NULL,
	[Rest] [tinyint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[RP_ItemOptionUpdate]    Script Date: 07/30/2013 14:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE proc [dbo].[RP_ItemOptionUpdate]
(
		@ItemDBIdx	int
	,	@Strength	int
	,	@Dexterity	int
	,	@Vitality	int
	,	@Intelligence	int
	,	@Wisdom	int
	,	@Life		int
	,	@Mana		int
	,	@FireAttrRegist	int
	,	@WaterAttrRegist	int
	,	@TreeAttrRegist	int
	,	@GoldAttrRegist	int
	,	@EarthAttrRegist	int
	,	@PhyAttack	int
	,	@Critical		int
	,	@FireAttrAttack	int
	,	@WaterAttrAttack	int
	,	@TreeAttrAttack	int
	,	@GoldAttrAttack	int
	,	@EarthAttrAttack	int
	,	@PhyDefense	int
)
as
	set nocount on

	update tb_item_option set
			Strength = @Strength, 
			Dexterity = @Dexterity,
			Vitality = @Vitality,
			Intelligence = @Intelligence,
			Wisdom = @Wisdom,
			Life = @Life,
			Mana = @Mana,
			FireAttrRegist = @FireAttrRegist,
			WaterAttrRegist = @WaterAttrRegist,
			TreeAttrRegist = @TreeAttrRegist,
			GoldAttrRegist = @GoldAttrRegist,
			EarthAttrRegist = @EarthAttrRegist,
			PhyAttack = @PhyAttack,
			Critical = @Critical,
			FireAttrAttack = @FireAttrAttack,
			WaterAttrAttack = @WaterAttrAttack,
			TreeAttrAttack = @TreeAttrAttack,
			GoldAttrAttack = @GoldAttrAttack,
			EarthAttrAttack = @EarthAttrAttack,
			PhyDefense = @PhyDefense
	where ITEM_DBIDX = @ItemDBIdx
GO
/****** Object:  Table [dbo].[TB_PYOGUK]    Script Date: 07/30/2013 14:58:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_PYOGUK](
	[User_IDX] [int] NOT NULL,
	[PyogukNum] [tinyint] NOT NULL CONSTRAINT [DF_TB_PYOGUK_PyogukNum]  DEFAULT ((0)),
	[PyogukMoney] [bigint] NOT NULL CONSTRAINT [DF_TB_PYOGUK_PyogukMoney]  DEFAULT ((0))
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_Logout]    Script Date: 07/30/2013 14:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[MP_CHARACTER_Logout]
(
	@CHARACTER_IDX					int
,	@CHARACTER_GENDER				tinyint
,	@CHARACTER_GENGOAL				smallint
,	@CHARACTER_LIFE				int
,	@CHARACTER_MAXLIFE				int
,	@CHARACTER_ENERGE				int
,	@CHARACTER_DEX					smallint
,	@CHARACTER_STA					smallint
,	@CHARACTER_SIMMAK				smallint
,	@CHARACTER_FAME					smallint
,	@CHARACTER_KARMA					tinyint
,	@CHARACTER_JOB					tinyint
,	@CHARACTER_STAGE					tinyint
,	@CHARACTER_GRADE					tinyint
,	@CHARACTER_EXPOINT				int
,	@CHARACTER_GRADEUPPOINT		smallint
,	@CHARACTER_MONEY				int
,	@CHARACTER_QUICKPACE			tinyint
,	@CHARACTER_VITALITY				tinyint
,	@CHARACTER_MAP					tinyint
,	@CHARACTER_FACETYPE				tinyint
,	@CHARACTER_HEADTYPE				tinyint
,	@CHARACTER_HAT					smallint
,	@CHARACTER_WEAPON				smallint
,	@CHARACTER_DRESS					smallint
,	@CHARACTER_SHOES				smallint
,	@CHARACTER_RING1					smallint
,	@CHARACTER_RING2					smallint
,	@CHARACTER_CAPE					smallint
,	@CHARACTER_NECKLACE				smallint
,	@CHARACTER_ARMLET				smallint
,	@CHARACTER_BELT					smallint
,	@CHARACTER_MUNPAIDX				int
,	@CHARACTER_MUNPAJIKCHEK			tinyint
,	@CHARACTER_ABILITY1				tinyint
,	@CHARACTER_ABILITY2				tinyint
,	@CHARACTER_ABILITY3				tinyint
,	@CHARACTER_ABILITY4				tinyint
,	@CHARACTER_ABILITY5				tinyint
,	@CHARACTER_ABILITY6				tinyint
,	@CHARACTER_ABILITY7				tinyint
)

as
	Set Nocount on
	Set Xact_Abort on

	
	exec MP_CHARACTER_Update	@CHARACTER_IDX
							,	@CHARACTER_GENDER
							,	@CHARACTER_GENGOAL		
							,	@CHARACTER_LIFE
							,	@CHARACTER_MAXLIFE
							,	@CHARACTER_ENERGE
							,	@CHARACTER_DEX			
							,	@CHARACTER_STA			
							,	@CHARACTER_SIMMAK		
							,	@CHARACTER_FAME			
							,	@CHARACTER_KARMA		
							,	@CHARACTER_JOB			
							,	@CHARACTER_STAGE	
							,	@CHARACTER_GRADE		
							,	@CHARACTER_EXPOINT		
							,	@CHARACTER_GRADEUPPOINT	
							,	@CHARACTER_MONEY		
							,	@CHARACTER_QUICKPACE	
							,	@CHARACTER_VITALITY		
							,	@CHARACTER_MAP			
							,	@CHARACTER_FACETYPE		
							,	@CHARACTER_HEADTYPE		
							,	@CHARACTER_HAT					
							,	@CHARACTER_WEAPON	
							,	@CHARACTER_DRESS		
							,	@CHARACTER_SHOES	
							,	@CHARACTER_RING1		
							,	@CHARACTER_RING2		
							,	@CHARACTER_CAPE		
							,	@CHARACTER_NECKLACE	
							,	@CHARACTER_ARMLET	
							,	@CHARACTER_BELT		
							,	@CHARACTER_MUNPAIDX
							,	@CHARACTER_MUNPAJIKCHEK
							,	@CHARACTER_ABILITY1		
							,	@CHARACTER_ABILITY2		
							,	@CHARACTER_ABILITY3		
							,	@CHARACTER_ABILITY4		
							,	@CHARACTER_ABILITY5		
							,	@CHARACTER_ABILITY6		
							,	@CHARACTER_ABILITY7
GO
/****** Object:  Table [dbo].[TB_ITEM_BACKUP]    Script Date: 07/30/2013 14:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_ITEM_BACKUP](
	[CHARACTER_IDX] [int] NOT NULL,
	[ITEM_DBIDX] [int] NOT NULL,
	[ITEM_IDX] [int] NOT NULL,
	[ITEM_POSITION] [int] NOT NULL,
	[ITEM_QPOSITION] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_BACKUP_ITEM_QPOSITION]  DEFAULT ((0)),
	[ITEM_DURABILITY] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_BACKUP_ITEM_DURABILITY]  DEFAULT ((1)),
	[ITEM_MUNPAIDX] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_BACKUP_ITEM_MUNPAIDX]  DEFAULT ((0)),
	[ITEM_FAMILYIDX] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_BACKUP_ITEM_FAMILYIDX]  DEFAULT ((0)),
	[ITEM_PYOGUKIDX] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_BACKUP_ITEM_PYOGUKIDX]  DEFAULT ((0)),
	[ITEM_SHOPIDX] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_BACKUP_ITEM_SHOPIDX]  DEFAULT ((0)),
	[ITEM_PARAM] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_BACKUP_ITEM_PARAM]  DEFAULT ((0)),
	[ITEM_RAREIDX] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_BACKUP_ITEM_RAREIDX]  DEFAULT ((0)),
	[ITEM_SEAL] [tinyint] NOT NULL CONSTRAINT [DF_TB_ITEM_BACKUP_ITEM_SEAL]  DEFAULT ((0)),
	[ITEM_ENDTIME] [datetime] NOT NULL CONSTRAINT [DF_TB_ITEM_BACKUP_ITEM_ENDTIME]  DEFAULT (getdate()),
	[ITEM_REMAINTIME] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_BACKUP_ITEM_REMINTIME]  DEFAULT ((0)),
	[PET_IDX] [int] NOT NULL CONSTRAINT [DF__TB_ITEM_BACKUP__PET_IDX__22F50DB0]  DEFAULT ((0)),
 CONSTRAINT [PK_TB_ITEM_BACKUP] PRIMARY KEY CLUSTERED 
(
	[ITEM_DBIDX] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_LoadItemRareOption_Inneed]    Script Date: 07/30/2013 14:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE              proc [dbo].[MP_GUILD_LoadItemRareOption_Inneed] 
(
	@MapNum	int,
	@GuildIdx	int,
	@StartIdx	int
) 
as
	Set Nocount on

	if exists( select b.* from tb_item a right outer join tb_item_rare b on a.item_dbIdx = b.ITEM_DBIDX
		where a.item_munpaidx = @GuildIdx )
	begin
		select @GuildIdx, b.* from tb_item a right outer join tb_item_rare b on a.item_dbidx = b.ITEM_DBIDX
		where a.item_munpaidx = @GuildIdx
	end
	else
	begin
		select @GuildIdx, 0
	end
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_LoadItemOption_Inneed]    Script Date: 07/30/2013 14:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE              proc [dbo].[MP_GUILD_LoadItemOption_Inneed] 
(
	@MapNum	int,
	@GuildIdx	int,
	@StartIdx	int
) 
as
	Set Nocount on


	if exists( select b.* from tb_item a right outer join tb_item_option b on a.item_dbIdx = b.ITEM_DBIDX
		where a.item_munpaidx = @GuildIdx )
	begin
		select @GuildIdx, b.* from tb_item a right outer join tb_item_option b on a.item_dbidx = b.ITEM_DBIDX
		where a.item_munpaidx = @GuildIdx
	end
	else
	begin
		select @GuildIdx, 0
	end
GO
/****** Object:  Table [dbo].[TB_QUEST]    Script Date: 07/30/2013 14:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_QUEST](
	[CHARACTER_IDX] [int] NOT NULL,
	[QUEST_IDX] [int] NOT NULL,
	[QUEST_STATE] [int] NOT NULL,
	[REGIST_TIME] [smalldatetime] NOT NULL,
	[COMPLETE_TIME] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[RP_ConfirmUserOut]    Script Date: 07/30/2013 14:54:49 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE      proc [dbo].[RP_ConfirmUserOut]
(
		@UserIdx	int,
		@CharIdx	int,
		@Kind		int
)

as
	Set Nocount on

	select @UserIdx, @CharIdx, @Kind
GO
/****** Object:  Table [dbo].[TB_QUESTITEM]    Script Date: 07/30/2013 14:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_QUESTITEM](
	[CHARACTER_IDX] [int] NOT NULL,
	[ITEM_IDX] [int] NOT NULL,
	[ITEM_COUNT] [int] NOT NULL,
	[QUEST_IDX] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_QUICK]    Script Date: 07/30/2013 14:58:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_QUICK](
	[CHARACTER_IDX] [int] NOT NULL,
	[SHEET] [tinyint] NOT NULL,
	[KIND_1] [tinyint] NOT NULL,
	[DB_IDX_1] [int] NOT NULL,
	[IDX_1] [int] NOT NULL,
	[DATA_1] [smallint] NOT NULL,
	[KIND_2] [tinyint] NOT NULL,
	[DB_IDX_2] [int] NOT NULL,
	[IDX_2] [int] NOT NULL,
	[DATA_2] [smallint] NOT NULL,
	[KIND_3] [tinyint] NOT NULL,
	[DB_IDX_3] [int] NOT NULL,
	[IDX_3] [int] NOT NULL,
	[DATA_3] [smallint] NOT NULL,
	[KIND_4] [tinyint] NOT NULL,
	[DB_IDX_4] [int] NOT NULL,
	[IDX_4] [int] NOT NULL,
	[DATA_4] [smallint] NOT NULL,
	[KIND_5] [tinyint] NOT NULL,
	[DB_IDX_5] [int] NOT NULL,
	[IDX_5] [int] NOT NULL,
	[DATA_5] [smallint] NOT NULL,
	[KIND_6] [tinyint] NOT NULL,
	[DB_IDX_6] [int] NOT NULL,
	[IDX_6] [int] NOT NULL,
	[DATA_6] [smallint] NOT NULL,
	[KIND_7] [tinyint] NOT NULL,
	[DB_IDX_7] [int] NOT NULL,
	[IDX_7] [int] NOT NULL,
	[DATA_7] [smallint] NOT NULL,
	[KIND_8] [tinyint] NOT NULL,
	[DB_IDX_8] [int] NOT NULL,
	[IDX_8] [int] NOT NULL,
	[DATA_8] [smallint] NOT NULL,
	[KIND_9] [tinyint] NOT NULL CONSTRAINT [DF_TB_QUICK_KIND_9]  DEFAULT ((0)),
	[DB_IDX_9] [int] NOT NULL CONSTRAINT [DF_TB_QUICK_DB_IDX_9]  DEFAULT ((0)),
	[IDX_9] [int] NOT NULL CONSTRAINT [DF_TB_QUICK_IDX_9]  DEFAULT ((0)),
	[DATA_9] [smallint] NOT NULL CONSTRAINT [DF_TB_QUICK_DATA_9]  DEFAULT ((0)),
	[KIND_10] [tinyint] NOT NULL CONSTRAINT [DF_TB_QUICK_KIND_10]  DEFAULT ((0)),
	[DB_IDX_10] [int] NOT NULL CONSTRAINT [DF_TB_QUICK_DB_IDX_10]  DEFAULT ((0)),
	[IDX_10] [int] NOT NULL CONSTRAINT [DF_TB_QUICK_IDX_10]  DEFAULT ((0)),
	[DATA_10] [smallint] NOT NULL CONSTRAINT [DF_TB_QUICK_DATA_10]  DEFAULT ((0))
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[MP_Character_ItemOptionInfo]    Script Date: 07/30/2013 14:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE     proc [dbo].[MP_Character_ItemOptionInfo]
(
	@CharIdx	int
)
as
	set nocount on
	set xact_abort on

	if exists(select b.* from tb_item a
 		right outer join tb_item_option b on a.item_dbIdx = b.ITEM_DBIDX
		where a.character_idx = @CharIdx)
		begin
		select @CharIdx, b.* from tb_item a
		right outer join tb_item_option b on a.item_dbidx = b.ITEM_DBIDX
		where a.character_idx = @CharIdx
		end
	else
		begin
		select @CharIdx, 0
		end
GO
/****** Object:  StoredProcedure [dbo].[RP_CharacterMugongInfo]    Script Date: 07/30/2013 14:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 무공 정보 획득
CREATE proc [dbo].[RP_CharacterMugongInfo]
(
	@CharIdx	int
)
as
	set Nocount on

	select * from tb_mugong with(nolock) where character_idx = @CharIdx
GO
/****** Object:  StoredProcedure [dbo].[RP_CharacterItemOptionInfo]    Script Date: 07/30/2013 14:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     proc [dbo].[RP_CharacterItemOptionInfo]
(
		@UserIdx	int
	,	@CharIdx	int
	,	@StartIdx	int
)
as

	set nocount on
	--set xact_abort on

	/*select top 100 @UserIdx, @CharIdx, b.* from tb_item a
	right outer join tb_item_option b on a.item_dbidx = b.item_dbidx and option_dbidx > @StartIdx
	where a.character_idx = @CharIdx or a.item_pyogukidx = @UserIdx*/


select top 100 @UserIdx, @CharIdx, b.* from
(
select item_dbidx from tb_item where item_pyogukidx = @UserIdx
union
select item_dbidx from tb_item where character_idx = @CharIdx
) as a 
inner join tb_item_option as b on a.item_dbidx = b.item_dbidx and b.option_dbidx > @StartIdx
GO
/****** Object:  StoredProcedure [dbo].[RP_CharacterAbilityInfo]    Script Date: 07/30/2013 14:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 특기 정보 획득

CREATE proc [dbo].[RP_CharacterAbilityInfo]
(
	@charidx	int
)
as
	Set Nocount on
	

	select * from tb_ability with(nolock) where character_idx = @charidx
GO
/****** Object:  StoredProcedure [dbo].[RP_AbilityUpdate]    Script Date: 07/30/2013 14:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[RP_AbilityUpdate]
(
		@CharIdx		int
	,	@BattleAbility	 	char(40)
	,	@KyungGongAbility 	char(40)
	,	@SocietyAbility 		char(40)
	,	@JobAbility 		char(40)
)
as
	set nocount on

	update tb_ability set
		BattleAbility = @BattleAbility,
		KyungGongAbility = @KyungGongAbility,
		SocietyAbility = @SocietyAbility,
		JobAbility = @JobAbility
	where character_idx = @CharIdx
GO
/****** Object:  StoredProcedure [dbo].[MP_WANTED_Search]    Script Date: 07/30/2013 14:54:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE      proc [dbo].[MP_WANTED_Search] (@WantedChrName varchar(17), @GotoPage int, @pagesize int )
as
	set nocount on
--	set xact_abort on
	DECLARE @SQL VARCHAR(600)
	DECLARE @tSQL NVARCHAR(150)
	declare @test int


set @tsql = N'select @TCount = count( WantedChr_Name) from TB_WANTEDINFO where WantedChr_Name LIKE '''
set @tsql = @tsql + @WantedChrName
set @tsql = @tsql + '%'''

exec sp_executesql @tsql, N'@TCount int out', @TCount = @test out


if(@test = 0)
begin
	select 0 , 0, '', 0, 0
	return
end

set @test = ceiling((@test - 1)/@pagesize) + 1

if(@GotoPage = 1)
begin
	set @sql = 'select top ' + CONVERT(VARCHAR(10), @pagesize)
	set @sql = @sql + ' '
	set @sql = @sql + CONVERT(VARCHAR(10),@test)
	set @sql = @sql + ', Wanted_idx, WantedChr_Name, Prize, volunteernum from tb_wantedinfo where '
	set @sql = @sql + 'WantedChr_Name LIKE '''  
	set @sql = @sql + @WantedChrName
	set @sql = @sql + '%'''
	set @sql = @sql + ' order by Prize desc'
end

else 
begin
	set @sql = 'select top ' + CONVERT(VARCHAR(10), @pagesize)
	set @sql = @sql + ' '
	set @sql = @sql + CONVERT(VARCHAR(10),@test)
	set @sql = @sql + ', Wanted_idx, WantedChr_Name, Prize, volunteernum from tb_wantedinfo where '
	set @sql = @sql + 'WantedChr_Name LIKE '''  
	set @sql = @sql + @WantedChrName
	set @sql = @sql + ' %'''
	set @sql = @sql + ' and Wanted_Idx not in (select top ' 
	set @sql = @sql + CONVERT(VARCHAR(10),((@GotoPage - 1)*@pagesize))
	set @sql = @sql + ' Wanted_Idx from TB_WANTEDINFO where '
	set @sql = @sql + 'WantedChr_Name LIKE '''  
	set @sql = @sql + @WantedChrName
	set @sql = @sql + '%'''
	set @sql = @sql +' order by Prize desc) order by Prize desc' 
end 
exec (@sql)
GO
/****** Object:  Table [dbo].[TB_RESIDENTREGIST]    Script Date: 07/30/2013 14:58:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_RESIDENTREGIST](
	[PlayerID] [int] NOT NULL,
	[Sex] [int] NOT NULL,
	[Age] [int] NOT NULL,
	[Location] [int] NOT NULL,
	[Favor] [int] NOT NULL,
	[PropensityLike01] [int] NOT NULL,
	[PropensityLike02] [int] NOT NULL,
	[PropensityLike03] [int] NOT NULL,
	[PropensityDisLike01] [int] NOT NULL,
	[PropensityDisLike02] [int] NOT NULL,
	[Introduction] [varchar](300) NULL,
	[CreateDate] [smalldatetime] NOT NULL CONSTRAINT [DF_TB_RESIDENTREGIST_Date]  DEFAULT (getdate()),
	[NickName] [varchar](16) NOT NULL CONSTRAINT [DF_TB_RESIDENTREGIST_NickName]  DEFAULT ('useless'),
 CONSTRAINT [PK_TB_RESIDENT_REGISTRATION] PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_ITEM_DROP_OPTION]    Script Date: 07/30/2013 14:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_ITEM_DROP_OPTION](
	[ITEM_DBIDX] [int] NOT NULL,
	[KEY1] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_DROP_OPTION_KEY1]  DEFAULT ((0)),
	[VALUE1] [float] NOT NULL CONSTRAINT [DF_TB_ITEM_DROP_OPTION_VALUE1]  DEFAULT ((0)),
	[KEY2] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_DROP_OPTION_KEY2]  DEFAULT ((0)),
	[VALUE2] [float] NOT NULL CONSTRAINT [DF_TB_ITEM_DROP_OPTION_VALUE2]  DEFAULT ((0)),
	[KEY3] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_DROP_OPTION_KEY3]  DEFAULT ((0)),
	[VALUE3] [float] NOT NULL CONSTRAINT [DF_TB_ITEM_DROP_OPTION_VALUE3]  DEFAULT ((0)),
	[KEY4] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_DROP_OPTION_KEY4]  DEFAULT ((0)),
	[VALUE4] [float] NOT NULL CONSTRAINT [DF_TB_ITEM_DROP_OPTION_VALUE4]  DEFAULT ((0)),
	[KEY5] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_DROP_OPTION_KEY5]  DEFAULT ((0)),
	[VALUE5] [float] NOT NULL CONSTRAINT [DF_TB_ITEM_DROP_OPTION_VALUE5]  DEFAULT ((0))
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_SAVEDMOVEPOINT]    Script Date: 07/30/2013 14:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_SAVEDMOVEPOINT](
	[POINT_DBIDX] [int] IDENTITY(1,1) NOT NULL,
	[CHARACTER_IDX] [int] NOT NULL,
	[SAVE_NAME] [char](20) NOT NULL,
	[MAP_NUM] [int] NOT NULL,
	[MAP_POINT] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_ChangeStage_Ability]    Script Date: 07/30/2013 14:52:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	proc [dbo].[MP_CHARACTER_ChangeStage_Ability]
(
	@CHARACTER_IDX int,
	@BattleAbility char(40)
)

as
	Set Nocount on
--	Set Xact_Abort on

	update TB_ABILITY set BattleAbility = @BattleAbility where character_idx = @CHARACTER_IDX
GO
/****** Object:  Table [dbo].[TB_SAVEDMOVEPOINT2]    Script Date: 07/30/2013 14:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_SAVEDMOVEPOINT2](
	[POINT_DBIDX] [int] IDENTITY(1,1) NOT NULL,
	[CHARACTER_IDX] [int] NOT NULL,
	[SAVE_NAME] [char](20) NOT NULL,
	[MAP_NUM] [int] NOT NULL,
	[MAP_POINT] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_SCRIPT_HACK_LOG]    Script Date: 07/30/2013 14:58:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_SCRIPT_HACK_LOG](
	[LOG_IDX] [int] IDENTITY(1,1) NOT NULL,
	[USER_IDX] [int] NOT NULL,
	[CHAR_IDX] [int] NOT NULL,
	[DATE] [datetime] NOT NULL CONSTRAINT [DF_TB_SCRIPT_HACK_LOG_DATE]  DEFAULT (getdate())
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_ShopItem]    Script Date: 07/30/2013 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_ShopItem](
	[Idx] [int] IDENTITY(1,1) NOT NULL,
	[ItemIdx] [int] NOT NULL,
	[ItemNum] [int] NOT NULL,
	[Param1] [int] NOT NULL,
	[Param2] [int] NOT NULL,
	[RegDate] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_SHOPITEMUSEINFO]    Script Date: 07/30/2013 14:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_SHOPITEMUSEINFO](
	[CHARACTER_IDX] [int] NOT NULL,
	[ITEM_IDX] [int] NOT NULL,
	[USER_IDX] [int] NOT NULL,
	[ITEM_DBIDX] [int] NOT NULL,
	[ITEM_PARAM] [int] NOT NULL,
	[BEGIN_TIME] [int] NOT NULL,
	[REMAIN_TIME] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_siegerecall]    Script Date: 07/30/2013 14:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_siegerecall](
	[themeidx] [tinyint] NOT NULL CONSTRAINT [DF__tb_sieger__theme__0F03239C]  DEFAULT ((0)),
	[mapidx] [tinyint] NOT NULL CONSTRAINT [DF__tb_sieger__mapid__0FF747D5]  DEFAULT ((0)),
	[recallmapidx] [smallint] NOT NULL CONSTRAINT [DF__tb_sieger__recal__10EB6C0E]  DEFAULT ((0)),
	[stepidx] [tinyint] NOT NULL CONSTRAINT [DF__tb_sieger__stepi__11DF9047]  DEFAULT ((0)),
	[addobjidx] [tinyint] NOT NULL CONSTRAINT [DF__tb_sieger__addob__12D3B480]  DEFAULT ((0)),
	[comkind] [tinyint] NOT NULL CONSTRAINT [DF__tb_sieger__comki__13C7D8B9]  DEFAULT ((0)),
	[comindex] [tinyint] NOT NULL CONSTRAINT [DF__tb_sieger__comin__14BBFCF2]  DEFAULT ((0)),
	[recallstep] [tinyint] NOT NULL CONSTRAINT [DF__tb_sieger__recal__15B0212B]  DEFAULT ((0))
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_ITEM_DROP_OPTION2]    Script Date: 07/30/2013 14:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_ITEM_DROP_OPTION2](
	[ITEM_DBIDX] [int] NOT NULL,
	[KEY1] [int] NOT NULL,
	[VALUE1] [float] NOT NULL,
	[KEY2] [int] NOT NULL,
	[VALUE2] [float] NOT NULL,
	[KEY3] [int] NOT NULL,
	[VALUE3] [float] NOT NULL,
	[KEY4] [int] NOT NULL,
	[VALUE4] [float] NOT NULL,
	[KEY5] [int] NOT NULL,
	[VALUE5] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_CharacterCreateInfo]    Script Date: 07/30/2013 14:55:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_CharacterCreateInfo](
	[CHARACTER_IDX] [int] NOT NULL,
	[USER_IDX] [int] NOT NULL,
	[CHARACTER_NAME] [varchar](16) NOT NULL,
	[FLAG] [int] NOT NULL,
	[CREATE_DATE] [smalldatetime] NULL,
	[CREATE_IP] [varchar](15) NULL,
	[DELETE_DATE] [smalldatetime] NULL,
	[DELETE_IP] [varchar](15) NULL,
	[RECOVER_DATE] [smalldatetime] NULL,
	[RECOVER_IP] [varchar](15) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_CHARSIZE]    Script Date: 07/30/2013 14:56:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_CHARSIZE](
	[CHARACTER_IDX] [int] NOT NULL,
	[CHANGECOUNT] [int] NOT NULL,
	[CUR_SIZE] [int] NOT NULL,
	[MAX_SIZE] [int] NOT NULL,
	[MIN_SIZE] [int] NOT NULL,
	[LASTDATE] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_ITEM_OPTION2]    Script Date: 07/30/2013 14:57:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ITEM_OPTION2](
	[ITEM_DBIDX] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_OPTION2_ITEM_DBIDX]  DEFAULT ((0)),
	[OPTION_IDX] [int] IDENTITY(1,1) NOT NULL,
	[REINFORCE_STRENGTH] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_OPTION2_STRENGTH]  DEFAULT ((0)),
	[REINFORCE_DEXTERITY] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_OPTION2_DEXTERITY]  DEFAULT ((0)),
	[REINFORCE_VITALITY] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_OPTION2_VITALITY]  DEFAULT ((0)),
	[REINFORCE_INTELLIGENCE] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_OPTION2_INTELLIGENCE]  DEFAULT ((0)),
	[REINFORCE_WISDOM] [int] NOT NULL,
	[REINFORCE_LIFE] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_OPTION2_LIFE]  DEFAULT ((0)),
	[REINFORCE_MANA] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_OPTION2_MANA]  DEFAULT ((0)),
	[REINFORCE_LIFE_RECOVERY] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_OPTION2_LIFE_RECOVERY]  DEFAULT ((0)),
	[REINFORCE_MANA_RECOVERY] [int] NOT NULL,
	[REINFORCE_PHYSIC_ATTACK] [int] NOT NULL,
	[REINFORCE_PHYSIC_DEFENCE] [int] NOT NULL,
	[REINFORCE_MAGIC_ATTACK] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_OPTION2_MAGIC_ATTACK]  DEFAULT ((0)),
	[REINFORCE_MAGIC_DEFENCE] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_OPTION2_MAGIC_DEFENCE]  DEFAULT ((0)),
	[REINFORCE_MOVE_SPEED] [int] NOT NULL,
	[REINFORCE_EVADE] [int] NOT NULL,
	[REINFORCE_ACCURACY] [int] NOT NULL,
	[REINFORCE_CRITICAL_RATE] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_OPTION2_CRITICAL_RATE]  DEFAULT ((0)),
	[REINFORCE_CRITICAL_DAMAGE] [int] NOT NULL,
	[REINFORCE_MADEBY] [varchar](16) NOT NULL CONSTRAINT [DF_TB_ITEM_OPTION2_REINFORCE_MADEBY]  DEFAULT (''),
	[MIX_STRENGTH] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_OPTION2_MIX_STRENGTH]  DEFAULT ((0)),
	[MIX_INTELLIGENCE] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_OPTION2_MIX_INTELLIGENCE]  DEFAULT ((0)),
	[MIX_DEXTERITY] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_OPTION2_MIX_DEXTERITY]  DEFAULT ((0)),
	[MIX_WISDOM] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_OPTION2_MIX_WISDOM]  DEFAULT ((0)),
	[MIX_VITALITY] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_OPTION2_MIX_VITALITY]  DEFAULT ((0)),
	[MIX_MADEBY] [varchar](16) NOT NULL CONSTRAINT [DF_TB_ITEM_OPTION2_MIX_MADEBY]  DEFAULT (''),
	[ENCHANT_INDEX] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_OPTION2_ENCHANT_INDEX]  DEFAULT ((0)),
	[ENCHANT_LEVEL] [tinyint] NOT NULL CONSTRAINT [DF_TB_ITEM_OPTION2_ENCHANT_LEVEL]  DEFAULT ((0)),
	[ENCHANT_MADEBY] [varchar](16) NOT NULL CONSTRAINT [DF_TB_ITEM_OPTION2_ENCHANT_MADEBY]  DEFAULT (''),
 CONSTRAINT [PK_OPTION_IDX] PRIMARY KEY NONCLUSTERED 
(
	[OPTION_IDX] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_CHATTING_GUEST]    Script Date: 07/30/2013 14:56:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_CHATTING_GUEST](
	[idx] [smallint] NOT NULL CONSTRAINT [DF_TB_CHATTING_GUEST_idx]  DEFAULT ((0)),
	[guest] [int] NOT NULL CONSTRAINT [DF_TB_CHATTING_GUEST_guest]  DEFAULT ((0))
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[MP_MUNPA_ItemOption_Info]    Script Date: 07/30/2013 14:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 문파 아이템 옵션
CREATE  proc [dbo].[MP_MUNPA_ItemOption_Info]
(
	@MapNum	int,
	@StartIdx	int
)
as

	set nocount on
	set xact_abort on


	select top 100  b.* from tb_item a
	right outer join tb_item_option b on a.item_dbidx = b.item_dbidx and option_dbidx > @StartIdx
	where a.item_munpaIdx  in (select munpaidx from tb_munpa where Location = @MapNum)
GO
/****** Object:  Table [dbo].[TB_CHATTING_INFO]    Script Date: 07/30/2013 14:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_CHATTING_INFO](
	[idx] [smallint] NOT NULL CONSTRAINT [DF_TB_CHATTING_idx]  DEFAULT ((0)),
	[type] [tinyint] NOT NULL CONSTRAINT [DF_TB_CHATTING_type]  DEFAULT ((0)),
	[closed] [bit] NOT NULL CONSTRAINT [DF_TB_CHATTING_closed]  DEFAULT ((0)),
	[code] [smallint] NOT NULL CONSTRAINT [DF_TB_CHATTING_code]  DEFAULT ((0)),
	[owner] [int] NOT NULL CONSTRAINT [DF_TB_CHATTING_owner]  DEFAULT ((0)),
	[guest_cur] [tinyint] NOT NULL CONSTRAINT [DF_TB_CHATTING_guest_cur]  DEFAULT ((0)),
	[guest_max] [tinyint] NOT NULL CONSTRAINT [DF_TB_CHATTING_guest_max]  DEFAULT ((0)),
	[title] [char](128) NOT NULL CONSTRAINT [DF_TB_CHATTING_title]  DEFAULT (NULL)
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[MP_MUGONG_UpdateExpBytime]    Script Date: 07/30/2013 14:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_MUGONG_UpdateExpBytime]
(
		@charno	int
	,	@mugongDBidx	int
	,	@mugongexp	int
)
as
	Set Nocount on


	update tb_mugong set mugong_exppoint = @mugongexp
	where character_idx = @charno and mugong_dbidx = @mugongDBidx
GO
/****** Object:  StoredProcedure [dbo].[MP_MUGONG_MoveUpdate]    Script Date: 07/30/2013 14:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[MP_MUGONG_MoveUpdate]
(
		@MUGONG_DBIDX1	int
	, 	@MUGONG_POSITION1	int
	,	@MUGONG_DBIDX2	int
	, 	@MUGONG_POSITION2	int
)

as

	Set Nocount On
	Set Xact_Abort On

update TB_MUGONG set MUGONG_POSITION = @MUGONG_POSITION1
	where MUGONG_DBIDX = @MUGONG_DBIDX1
update TB_MUGONG set MUGONG_POSITION = @MUGONG_POSITION2
	where MUGONG_DBIDX = @MUGONG_DBIDX2
GO
/****** Object:  StoredProcedure [dbo].[MP_MUGONG_UpdateEx]    Script Date: 07/30/2013 14:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_MUGONG_UpdateEx]
(
		@MUGONG_DBIDX		int
	,	@MUGONG_IDX			int
	, 	@MUGONG_EXPPOINT		int
	, 	@MUGONG_SUNG		tinyint
	, 	@MUGONG_POSITION		int
	,	@MUGONG_QPOSITION		int
	, 	@MUGONG_WEAR		bit
)

as
	Set Nocount On

update TB_MUGONG set 

	MUGONG_IDX		= @MUGONG_IDX,
	MUGONG_EXPPOINT 	= @MUGONG_EXPPOINT, 
	MUGONG_SUNG 		= @MUGONG_SUNG,
	MUGONG_POSITION 	= @MUGONG_POSITION,
	MUGONG_QPOSITION 	= @MUGONG_QPOSITION,
	MUGONG_WEAR 		= @MUGONG_WEAR 

	where MUGONG_DBIDX = @MUGONG_DBIDX
GO
/****** Object:  Table [dbo].[TB_SIEGEWAR_GUILDINFO]    Script Date: 07/30/2013 14:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_SIEGEWAR_GUILDINFO](
	[SIEGEWAR_IDX] [int] NOT NULL,
	[GUILD_DBIDX] [int] IDENTITY(1,1) NOT NULL,
	[GUILD_IDX] [int] NOT NULL,
	[GUILD_TYPE] [int] NOT NULL,
	[MAPNUM] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[MP_MUGONG_InsertEx]    Script Date: 07/30/2013 14:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[MP_MUGONG_InsertEx]
(
		@CHARACTER_IDX	int
	,	@MUGONG_IDX		int
	,	@MUGONG_EXPPOINT	int
	,	@MUGONG_SUNG	int
	,	@MUGONG_POS		int
	,	@MUGONG_WEAR	int

)

as
	set nocount on
	Set Xact_abort on

	insert tb_mugong
	(
		CHARACTER_IDX,
		MUGONG_IDX, 
		MUGONG_EXPPOINT,
		MUGONG_SUNG, 
		MUGONG_POSITION, 
		MUGONG_QPOSITION, 
		MUGONG_WEAR
	)
	values
	(
		@CHARACTER_IDX,
		@MUGONG_IDX,
		@MUGONG_EXPPOINT,
		@MUGONG_SUNG,
		@MUGONG_POS,
		0,
		@MUGONG_WEAR
	)

	select  * from tb_mugong where  mugong_dbidx = @@identity
GO
/****** Object:  Table [dbo].[TB_SIEGEWAR_INFO]    Script Date: 07/30/2013 14:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_SIEGEWAR_INFO](
	[SIEGEWAR_IDX] [int] NOT NULL,
	[REGIST_TIME] [int] NOT NULL,
	[SIEGEWAR_TIME] [int] NOT NULL,
	[GATE_LEVEL] [int] NOT NULL,
	[MAPNUM] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[MP_MUGONG_Delete]    Script Date: 07/30/2013 14:53:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_MUGONG_Delete]
(
	@MUGONG_DBIDX	int
)

as

	Set Nocount On

	delete TB_MUGONG where MUGONG_DBIDX = @MUGONG_DBIDX
GO
/****** Object:  Table [dbo].[TB_SIEGEWAR_PROFITINFO]    Script Date: 07/30/2013 14:58:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_SIEGEWAR_PROFITINFO](
	[SWMapNum] [int] NOT NULL,
	[GuildIdx] [int] NOT NULL,
	[TaxRate] [int] NOT NULL,
	[ProfitMoney] [int] NOT NULL,
	[RegDate] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_siegewarfare_info]    Script Date: 07/30/2013 14:58:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_siegewarfare_info](
	[maptype] [tinyint] NULL,
	[guildidx] [int] NULL,
	[state] [tinyint] NULL,
	[Registdate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_SKILL]    Script Date: 07/30/2013 14:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_SKILL](
	[CHARACTER_IDX] [int] NOT NULL,
	[SKILL_DBIDX] [int] IDENTITY(1,1) NOT NULL,
	[SKILL_IDX] [int] NOT NULL,
	[SKILL_LEVEL] [tinyint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_SKILL_RESET_MONEY]    Script Date: 07/30/2013 14:58:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_SKILL_RESET_MONEY](
	[SkillIdx] [int] NOT NULL,
	[Character_Money] [int] NOT NULL,
 CONSTRAINT [PK_TB_SKILL_RESET_MONEY] PRIMARY KEY CLUSTERED 
(
	[SkillIdx] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[TP_SearchUserLoginChk]    Script Date: 07/30/2013 14:55:19 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 개체: 저장 프로시저 dbo.TP_SearchUserLoginChk    스크립트 날짜: 2006-06-30 오후 7:58:19 ******/

CREATE      proc [dbo].[TP_SearchUserLoginChk]
(
	@Useridx		int
)

as
	Set Nocount on

	select count(propid) from mhcmember.dbo.logintable where propid = @Useridx
GO
/****** Object:  Table [dbo].[TB_CONSIGNMENT]    Script Date: 07/30/2013 14:56:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_CONSIGNMENT](
	[PRICE] [bigint] NOT NULL,
	[COMMISSION] [int] NOT NULL,
	[DEPOSIT] [int] NOT NULL,
	[INIT_DURABILITY] [int] NOT NULL,
	[ENDTIME] [smalldatetime] NOT NULL,
	[REGISTTIME] [smalldatetime] NOT NULL,
	[ENCHANT] [tinyint] NOT NULL CONSTRAINT [DF_TB_CONSIGNMENT_ENCHANT]  DEFAULT ((0)),
	[USELEVEL] [int] NOT NULL,
	[RARELEVEL] [tinyint] NOT NULL,
	[CATEGORY_2] [int] NOT NULL,
	[CATEGORY_1] [int] NOT NULL,
	[ITEM_NAME] [varchar](50) NOT NULL CONSTRAINT [DF_TB_CONSIGNMENT_ITEM_NAME]  DEFAULT (''),
	[CHARACTER_NAME] [varchar](16) NOT NULL CONSTRAINT [DF_TB_CONSIGNMENT_CHARACTER_NAME]  DEFAULT (''),
	[CHARACTER_IDX] [int] NOT NULL,
	[ITEM_INDEX] [int] NOT NULL,
	[ITEM_DBIDX] [int] NOT NULL,
	[CONSIGNMENT_IDX] [bigint] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_SKILL_RESET_POINT]    Script Date: 07/30/2013 14:58:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_SKILL_RESET_POINT](
	[grade] [int] NOT NULL,
	[skillpoint] [int] NOT NULL,
 CONSTRAINT [PK_TB_SKILL_RESET_POINT] PRIMARY KEY CLUSTERED 
(
	[grade] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_SKILLPOINT]    Script Date: 07/30/2013 14:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_SKILLPOINT](
	[CHARACTER_IDX] [int] NOT NULL CONSTRAINT [DF__TB_SKILLP__CHARA__015422C3]  DEFAULT ((0)),
	[SKILL_POINT] [int] NOT NULL CONSTRAINT [DF__TB_SKILLP__SKILL__024846FC]  DEFAULT ((0)),
	[CUMULATIVE_POINT] [int] NOT NULL CONSTRAINT [DF__TB_SKILLP__CUMUL__033C6B35]  DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[CHARACTER_IDX] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[MP_GMEvent01]    Script Date: 07/30/2013 14:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create	proc [dbo].[MP_GMEvent01]
(
	@UserIdx	int,
	@CharacterIdx	int,
	@Level		int,
	@ServerSet	int
)

as
GO
/****** Object:  StoredProcedure [dbo].[MP_GM_Control_Insert]    Script Date: 07/30/2013 14:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MP_GM_Control_Insert]
(
	@CHARACTER_IDX		int
,	@USER_IDX		int
,	@GM_IDX		int
,	@Kind		int
,	@StartDate		datetime
,	@EndDate		datetime
)
as

	set nocount on
	set xact_abort on


	insert tb_gmcontrol (CHARACTER_IDX,USER_Idx,GM_IDx,Kind,StartDate,EndDate)
	values (@Character_Idx,@User_IDX,@GM_Idx,@Kind,@StartDate,@EndDate)

	select @Character_Idx, @@identity,  @Kind, @StartDate, @EndDate
GO
/****** Object:  Table [dbo].[TB_CONSIGNMENT_AVERAGE]    Script Date: 07/30/2013 14:56:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_CONSIGNMENT_AVERAGE](
	[ITEM_INDEX] [int] NOT NULL,
	[ENCHANT] [tinyint] NOT NULL,
	[ACCUMULATE_PRICE] [bigint] NOT NULL,
	[ACCUMULATE_NUM] [int] NOT NULL,
	[AVERAGE_PRICE] [bigint] NOT NULL,
	[RESETDATE] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_COOKING]    Script Date: 07/30/2013 14:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_COOKING](
	[CHARACTER_IDX] [int] NOT NULL,
	[COOK_LEVEL] [int] NOT NULL CONSTRAINT [DF_TB_COOKING_COOK_LEVEL]  DEFAULT ((1)),
	[COOK_COUNT] [int] NULL CONSTRAINT [DF_TB_COOKING_COOK_COUNT]  DEFAULT ((0)),
	[EAT_COUNT] [int] NULL CONSTRAINT [DF_TB_COOKING_EAT_COUNT]  DEFAULT ((0)),
	[FIRE_COUNT] [int] NULL CONSTRAINT [DF_TB_COOKING_FIRE_COUNT]  DEFAULT ((0)),
 CONSTRAINT [PK_TB_COOKING] PRIMARY KEY CLUSTERED 
(
	[CHARACTER_IDX] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[MP_MEMORY_STONE_INFO_LOAD]    Script Date: 07/30/2013 14:53:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE  proc [dbo].[MP_MEMORY_STONE_INFO_LOAD]
(
	@character_idx 	int
)
as
	Set Nocount on
	Set Xact_abort on

select top 20 IDX, Memory_Name, Map_IDX, Pos_X, Pos_Z from TB_Memory_Stone_Info where Character_IDX = @character_idx;
GO
/****** Object:  StoredProcedure [dbo].[TP_SearchGuildWareItemOptionInfo]    Script Date: 07/30/2013 14:55:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE	proc [dbo].[TP_SearchGuildWareItemOptionInfo]
(
		@StartIdx	int,
		@GuildIdx	int
)
as

	set nocount on

	/*
	select		top 100 @GuildIdx, a.item_dbidx, b.* 
	from		tb_item a 
	right outer join	tb_item_option b
	on		a.item_dbidx = b.item_dbidx
	where		a.item_munpaidx = @GuildIdx 
	and		a.item_dbidx > @StartIdx
	*/

	
	select		top 100 @GuildIdx, a.item_dbidx, b.* 
	from
		(
		select item_dbidx from tb_item where item_munpaidx = @GuildIdx
		) as a
	inner join	tb_item_option as b
	on		a.item_dbidx = b.item_dbidx
	and		a.item_dbidx > @StartIdx
GO
/****** Object:  StoredProcedure [dbo].[MP_MEMORY_STONE_INFO_DELETE]    Script Date: 07/30/2013 14:53:52 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create  proc [dbo].[MP_MEMORY_STONE_INFO_DELETE]
(
	@character_idx 	int,
	@idx		tinyint
)
as
	Set Nocount on
	delete TB_MEMORY_STONE_INFO where Character_IDX=@character_idx and IDX=@idx
GO
/****** Object:  StoredProcedure [dbo].[MP_STORAGE_ItemRareOption_Info]    Script Date: 07/30/2013 14:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE proc [dbo].[MP_STORAGE_ItemRareOption_Info]
(
	@UserIdx	int,
	@StartIdx	int
)
as

	set nocount on

	select top 100 b.* from tb_item a
	right outer join tb_item_rare b on a.item_dbidx = b.ITEM_DBIDX and rare_dbidx > @StartIdx
	where a.item_pyogukIdx = @UserIdx
GO
/****** Object:  Table [dbo].[TB_SkillPointReset]    Script Date: 07/30/2013 14:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_SkillPointReset](
	[character_level] [tinyint] NOT NULL,
	[skill_point] [smallint] NOT NULL,
 CONSTRAINT [PK_SkillPointReset] PRIMARY KEY CLUSTERED 
(
	[character_level] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[MP_MEMORY_STONE_INFO_ADD]    Script Date: 07/30/2013 14:53:52 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE  proc [dbo].[MP_MEMORY_STONE_INFO_ADD]
(
	@character_idx 	int,
	@memory_name	char(32),
	@mapIdx	tinyint,
	@posX		int,
	@posZ		int,
	@idx		tinyint
)

as
	Set Nocount on
	Set Xact_abort on

insert TB_MEMORY_STONE_INFO
(
	IDX,
	CHARACTER_IDX,
	MEMORY_NAME,
	MAP_IDX,
	POS_X,
	POS_Z
)
values
(
	@idx,
	@character_idx,
	@memory_name,
	@mapIdx,
	@posX,
	@posZ
)
GO
/****** Object:  StoredProcedure [dbo].[MP_GAMEROOM_SELECT]    Script Date: 07/30/2013 14:53:04 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
/*
091228 LUJ, PC방에 해당하는 IP인지 쿼리한다
*/
CREATE proc [dbo].[MP_GAMEROOM_SELECT]
(
	@ADDRESS VARCHAR(16)
)
AS
SET NOCOUNT ON

DECLARE @GAMEROOM_NAME VARCHAR(40)
DECLARE @GAMEROOM_INDEX VARCHAR(20)

SELECT
	@GAMEROOM_NAME = ID_PCBANG,
	@GAMEROOM_INDEX = NO_PCBANG
FROM [BX_TB_PCBANG_IPLIST]
WHERE TXT_IP = @ADDRESS

IF 0 = @@ROWCOUNT
BEGIN
	SET @GAMEROOM_INDEX = ''
	SET @GAMEROOM_NAME = '*noGameRoom'
END

SELECT
	SUBSTRING(@GAMEROOM_INDEX, 1, 10) AS LOWER_INDEX,
	SUBSTRING(@GAMEROOM_INDEX, 11, 20) AS UPPER_INDEX,
	SUBSTRING(@GAMEROOM_NAME, 1, 16) AS NAME,
	@ADDRESS AS ADDRESS
RETURN
GO
/****** Object:  Table [dbo].[TB_ITEM_TEST]    Script Date: 07/30/2013 14:57:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_ITEM_TEST](
	[CHARACTER_IDX] [int] NOT NULL,
	[ITEM_DBIDX] [int] IDENTITY(1,1) NOT NULL,
	[ITEM_IDX] [int] NOT NULL,
	[ITEM_POSITION] [int] NOT NULL,
	[ITEM_QPOSITION] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_TEST_ITEM_QPOSITION]  DEFAULT ((0)),
	[ITEM_DURABILITY] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_TEST_ITEM_DURABILITY]  DEFAULT ((1)),
	[ITEM_MUNPAIDX] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_TEST_ITEM_MUNPAIDX]  DEFAULT ((0)),
	[ITEM_FAMILYIDX] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_TEST_ITEM_FAMILYIDX]  DEFAULT ((0)),
	[ITEM_PYOGUKIDX] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_TEST_ITEM_PYOGUKIDX]  DEFAULT ((0)),
	[ITEM_SHOPIDX] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_TEST_ITEM_SHOPIDX]  DEFAULT ((0)),
	[ITEM_PARAM] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_TEST_ITEM_PARAM]  DEFAULT ((0)),
	[ITEM_RAREIDX] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_TEST_ITEM_RAREIDX]  DEFAULT ((0)),
	[ITEM_SEAL] [tinyint] NOT NULL CONSTRAINT [DF_TB_ITEM_TEST_ITEM_SEAL]  DEFAULT ((0)),
	[ITEM_ENDTIME] [datetime] NOT NULL CONSTRAINT [DF_TB_ITEM_TEST_ITEM_ENDTIME]  DEFAULT (getdate()),
	[ITEM_REMAINTIME] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_TEST_ITEM_REMINTIME]  DEFAULT ((0)),
 CONSTRAINT [PK_TB_ITEM_TEST] PRIMARY KEY CLUSTERED 
(
	[ITEM_DBIDX] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_speedhack]    Script Date: 07/30/2013 14:59:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_speedhack](
	[SpeedIdx] [int] IDENTITY(1,1) NOT NULL,
	[CharNo] [int] NOT NULL,
	[CharName] [varchar](30) NOT NULL,
	[Distance] [int] NOT NULL,
	[SkillDelay] [int] NOT NULL,
	[CheckDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_SUBQUEST]    Script Date: 07/30/2013 14:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_SUBQUEST](
	[CHARACTER_IDX] [int] NOT NULL,
	[QUEST_IDX] [int] NOT NULL,
	[SUBQUEST_IDX] [int] NOT NULL,
	[DATA] [int] NOT NULL,
	[REGIST_TIME] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_COOKRECIPE]    Script Date: 07/30/2013 14:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_COOKRECIPE](
	[CHARACTER_IDX] [int] NOT NULL,
	[RECIPEIDX] [int] NOT NULL,
	[SLOT] [int] NOT NULL,
	[REMAINTIME] [int] NOT NULL CONSTRAINT [DF_TB_COOKRECIPE_REMAINTIME]  DEFAULT ((0))
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[MP_SKILLTREE_UpdateAccSkillPoint]    Script Date: 07/30/2013 14:54:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MP_SKILLTREE_UpdateAccSkillPoint]
	(
		@CHARACTER_IDX	INT
	)
	
	AS
	SET NOCOUNT ON
	RETURN
GO
/****** Object:  Table [dbo].[TB_TMPUSERIDX]    Script Date: 07/30/2013 14:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_TMPUSERIDX](
	[idx] [int] NOT NULL,
	[cnt] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_TRIGGER]    Script Date: 07/30/2013 14:59:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_TRIGGER](
	[SCRIPT_IDX] [bigint] NOT NULL,
	[NAME] [varchar](30) NOT NULL CONSTRAINT [DF_TB_TRIGGER_NAME]  DEFAULT (''),
	[OWNER_TYPE] [int] NOT NULL,
	[OWNER_IDX] [int] NOT NULL,
	[REPEAT_COUNT] [int] NOT NULL,
	[MAP_IDX] [int] NOT NULL,
	[REG_DATE] [smalldatetime] NOT NULL CONSTRAINT [DF_TB_TRIGGER_REG_DATE]  DEFAULT (getdate())
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_CREATEINFO]    Script Date: 07/30/2013 14:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_CREATEINFO](
	[CHARACTER_IDX] [int] NOT NULL,
	[CREATEINFO_CREATE] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_DUNGEON]    Script Date: 07/30/2013 14:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_DUNGEON](
	[CHAR_IDX] [int] NOT NULL,
	[MAP_NUM] [int] NOT NULL,
	[TOTAL_VISIT] [int] NOT NULL,
	[DAILY_VISIT] [int] NOT NULL,
	[LAST_VISIT] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[MP_MAP_BaseEconomy]    Script Date: 07/30/2013 14:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MP_MAP_BaseEconomy]
(
	@MAP_NUM tinyint
)
as
	set nocount on
	set xact_abort on
	declare @result		int

	select @result = count(*) from TB_BASEECONOMY where MAPRATES_MAPNUM = @MAP_NUM
	if(@result != 0)
		begin
			select * from TB_BASEECONOMY where MAPRATES_MAPNUM = @MAP_NUM
			return
		end
	else
		begin 
			select 0
			return
		end
GO
/****** Object:  Table [dbo].[TB_EVENTITEM]    Script Date: 07/30/2013 14:56:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_EVENTITEM](
	[Event_Idx] [int] IDENTITY(1,1) NOT NULL,
	[User_Idx] [int] NOT NULL,
	[Item_Idx] [int] NOT NULL,
	[Item_Dur] [int] NOT NULL,
	[bReceive] [bit] NOT NULL,
	[ReceiveDate] [datetime] NOT NULL,
	[ReceiveChr_Idx] [int] NOT NULL,
	[WindGrade] [tinyint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_TUTORIAL]    Script Date: 07/30/2013 14:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_TUTORIAL](
	[CHARACTER_ID] [int] NOT NULL,
	[TUTORIAL_IDX] [int] NOT NULL,
	[IS_COMPLETE] [tinyint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_FAMILY]    Script Date: 07/30/2013 14:56:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_FAMILY](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](16) NOT NULL,
	[MasterID] [int] NOT NULL,
	[HonorPoint] [int] NOT NULL CONSTRAINT [DF_TB_FAMILY__HonorPoint]  DEFAULT ((0)),
	[NicknameON] [int] NOT NULL CONSTRAINT [DF_TB_FAMILY__NicknameFlag]  DEFAULT ((0)),
	[BUILD_DATE] [smalldatetime] NOT NULL CONSTRAINT [DF_TB_FAMILY_BUILD_DATE]  DEFAULT (getdate())
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_ULD]    Script Date: 07/30/2013 14:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_ULD](
	[UserIdx] [int] NOT NULL,
 CONSTRAINT [PK_TB_ULD] PRIMARY KEY CLUSTERED 
(
	[UserIdx] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_ULF]    Script Date: 07/30/2013 14:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_ULF](
	[UserIdx] [int] NOT NULL,
 CONSTRAINT [PK_TB_ULF] PRIMARY KEY CLUSTERED 
(
	[UserIdx] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_FAMILY_EMBLEM]    Script Date: 07/30/2013 14:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_FAMILY_EMBLEM](
	[ID] [int] NOT NULL,
	[imgData] [varbinary](1000) NOT NULL,
 CONSTRAINT [PK_TB_FAMILY_EMBLEM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_VEHICLE]    Script Date: 07/30/2013 14:59:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_VEHICLE](
	[CHAR_IDX] [int] NOT NULL,
	[ITEM_IDX] [int] NOT NULL,
	[ITEM_POSITION] [int] NOT NULL,
	[MAP_IDX] [int] NOT NULL,
	[UPDATED_DATE] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_VEHICLE_PASSENGER]    Script Date: 07/30/2013 14:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_VEHICLE_PASSENGER](
	[PASSENGER_CHAR_IDX] [int] NOT NULL,
	[SEAT_IDX] [int] NOT NULL,
	[DRIVER_CHAR_IDX] [int] NOT NULL,
	[MAP_IDX] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_FAMILY_LEAVE]    Script Date: 07/30/2013 14:56:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_FAMILY_LEAVE](
	[MemberID] [int] NOT NULL,
	[LeaveDate] [bigint] NOT NULL,
	[LeaveKind] [int] NOT NULL,
 CONSTRAINT [PK_TB_FAMILY_LEAVE] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC,
	[LeaveKind] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_WANTCOMPLETE]    Script Date: 07/30/2013 14:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_WANTCOMPLETE](
	[Wanted_IDX] [int] NOT NULL,
	[WantedChr_IDX] [char](10) NOT NULL,
	[RegistChr_IDX] [int] NOT NULL,
	[RegistDate] [varchar](30) NOT NULL,
	[Prize] [int] NULL,
	[Killer_IDX] [int] NOT NULL,
	[CompleteDate] [varchar](30) NOT NULL,
	[Kind] [tinyint] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_ITEM_TEST2]    Script Date: 07/30/2013 14:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_ITEM_TEST2](
	[CHARACTER_IDX] [int] NOT NULL,
	[ITEM_DBIDX] [int] IDENTITY(1,1) NOT NULL,
	[ITEM_IDX] [int] NOT NULL,
	[ITEM_POSITION] [int] NOT NULL,
	[ITEM_QPOSITION] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_TEST2_ITEM_QPOSITION]  DEFAULT ((0)),
	[ITEM_DURABILITY] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_TEST2_ITEM_DURABILITY]  DEFAULT ((1)),
	[ITEM_MUNPAIDX] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_TEST2_ITEM_MUNPAIDX]  DEFAULT ((0)),
	[ITEM_FAMILYIDX] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_TEST2_ITEM_FAMILYIDX]  DEFAULT ((0)),
	[ITEM_PYOGUKIDX] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_TEST2_ITEM_PYOGUKIDX]  DEFAULT ((0)),
	[ITEM_SHOPIDX] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_TEST2_ITEM_SHOPIDX]  DEFAULT ((0)),
	[ITEM_PARAM] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_TEST2_ITEM_PARAM]  DEFAULT ((0)),
	[ITEM_RAREIDX] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_TEST2_ITEM_RAREIDX]  DEFAULT ((0)),
	[ITEM_SEAL] [tinyint] NOT NULL CONSTRAINT [DF_TB_ITEM_TEST2_ITEM_SEAL]  DEFAULT ((0)),
	[ITEM_ENDTIME] [datetime] NOT NULL CONSTRAINT [DF_TB_ITEM_TEST2_ITEM_ENDTIME]  DEFAULT (getdate()),
	[ITEM_REMAINTIME] [int] NOT NULL CONSTRAINT [DF_TB_ITEM_TEST2_ITEM_REMINTIME]  DEFAULT ((0))
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_WANTEDINFO]    Script Date: 07/30/2013 14:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_WANTEDINFO](
	[Wanted_Idx] [int] IDENTITY(1,1) NOT NULL,
	[WantedChr_Idx] [int] NOT NULL,
	[WantedChr_Name] [varchar](16) NOT NULL,
	[Prize] [int] NULL,
	[RegistChr_Idx] [int] NOT NULL,
	[RegistDate] [smalldatetime] NULL,
	[VolunteerNum] [tinyint] NULL,
	[RegistMoney] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[TP_CharacterRareItemOptionInfo]    Script Date: 07/30/2013 14:55:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE   proc [dbo].[TP_CharacterRareItemOptionInfo]
(
		@UserIdx	int
	,	@CharIdx	int
	,	@StartIdx	int
)
as

	set nocount on

	/*
	select top 100 @UserIdx, @CharIdx, b.* from tb_item a
	right outer join tb_item_rare b on a.item_dbidx = b.ITEM_DBIDX and b.rare_dbidx > @StartIdx
	where a.character_idx = @CharIdx or a.item_pyogukidx = @UserIdx
	*/

	select		top 100 @UserIdx, @CharIdx, b.* 
	from
		(
		select item_dbidx from tb_item where character_idx = @charidx
		union
		select item_dbidx from tb_item where item_pyogukidx = @UserIdx
		) as a
	inner join	tb_item_rare b 
	on		a.item_dbidx = b.ITEM_DBIDX
	and		b.rare_dbidx > @StartIdx
GO
/****** Object:  Table [dbo].[TB_FAMILY_MEMBER]    Script Date: 07/30/2013 14:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_FAMILY_MEMBER](
	[FamilyID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[MemberNickname] [varchar](16) NULL,
 CONSTRAINT [PK_TB_FAMILY_MEMBER] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_WANTEDLIST]    Script Date: 07/30/2013 14:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_WANTEDLIST](
	[Character_Idx] [int] NOT NULL,
	[Wanted_Idx] [int] NOT NULL,
	[RegistDate] [smalldatetime] NULL,
	[bComplete] [tinyint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_FARM_ANIMAL]    Script Date: 07/30/2013 14:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_FARM_ANIMAL](
	[Zone] [int] NOT NULL,
	[Farm] [int] NOT NULL,
	[Animal] [int] NOT NULL,
	[AnimalOwnerID] [int] NOT NULL,
	[AnimalKind] [int] NOT NULL,
	[AnimalStep] [int] NOT NULL,
	[AnimalLife] [int] NOT NULL,
	[AnimalNextStepTime] [int] NOT NULL,
	[AnimalContentment] [int] NOT NULL,
	[AnimalInterest] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_FARM_CROP]    Script Date: 07/30/2013 14:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_FARM_CROP](
	[Zone] [int] NOT NULL,
	[Farm] [int] NOT NULL,
	[Crop] [int] NOT NULL,
	[CropOwnerID] [int] NOT NULL,
	[CropKind] [int] NOT NULL,
	[CropStep] [int] NOT NULL,
	[CropLife] [int] NOT NULL,
	[CropNextStepTime] [int] NOT NULL,
	[CropSeedGrade] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Pager]    Script Date: 07/30/2013 14:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[Pager]
@tbname     nvarchar(255),		--要分页显示的表名
@FieldKey   nvarchar(255),		--用于定位记录的主键(惟一键)字段,只能是单个字段
@PageCurrent int=1,				--要显示的页码
@PageSize   int=20,             --每页的大小(记录数)
@FieldShow  nvarchar(1000),		--以逗号分隔的要显示的字段列表,如果不指定,则显示所有字段
@FieldOrder  nvarchar(1000),	--以逗号分隔的排序字段列表,可以指定在字段后面指定DESC/ASC 用于指定排序顺序
@Where     nvarchar(1000),		--查询条件
@PageCount  int output,			--总页数
@RecordCount int output			--总记录数
as
declare @sql nvarchar(4000)
set nocount on
--检查对象是否有效
if object_id(@tbname) is null
begin
	raiserror(N'对象"%s"不存在', 1, 16, @tbname)
	return
end

if objectproperty(object_id(@tbname), N'IsTable')=0
and objectproperty(object_id(@tbname), N'IsView')=0
and objectproperty(object_id(@tbname), N'IsTableFunction')=0
begin
	raiserror(N'"%s"不是表、视图或者表值函数', 1, 16, @tbname)
	return
end

--分页字段检查
if isnull(@FieldKey, N'')=''
begin
	raiserror(N'分页处理需要主键（或者惟一键）',1,16)
	return
end

--其他参数检查及规范
if isnull(@PageCurrent,0) < 1    set @PageCurrent=1
if isnull(@PageSize,0) < 1       set @PageSize=10
if isnull(@FieldShow,N'') = N''  set @FieldShow=N'*'
if isnull(@FieldOrder,N'') = N'' set @FieldOrder=N''
else
	set @FieldOrder = N'ORDER BY '+ltrim(@FieldOrder)
if isnull(@Where,N'') = N''
	set @Where = N''
else
	set @Where = N'WHERE ('+@Where+N')'

--如果@RecordCount为NULL值,则计算总记录数(这样设计可以只在第一次计算总记录数,以后调用时,把总记录数传回给存储过程,避免再次计算总记录数,对于不想计算总记录数的处理而言,可以给@RecordCount赋值)
if @RecordCount is null
begin
	set @sql = N'select @RecordCount=COUNT(*)'
	+N' FROM ' + @tbname
	+N' ' + @Where
	exec sp_executesql @sql,N'@RecordCount int OUTPUT', @RecordCount output
end
--如果@PageCount为NULL值,则计算总页数(这样设计可以只在第一次计算总页数,以后调用时,把总页数传回给存储过程,避免再次计算总页数,对于不想计算总页数的处理而言,可以给@PageCount赋值)
if @PageCount IS NULL
begin
	set @PageCount = (@RecordCount + @PageSize - 1) / @PageSize
end

--计算分页显示的TOPN值
declare @TopN varchar(20), @TopN1 varchar(20)
select @TopN = @PageSize,
@TopN1 = @PageCurrent * @PageSize

--第一页直接显示
if @PageCurrent=1
	exec(N'select TOP ' + @TopN
	+N' ' + @FieldShow
	+N' FROM ' + @tbname
	+N' ' + @Where
	+N' ' + @FieldOrder)
else
begin
	select @PageCurrent = @TopN1,
	@sql=N'select @n=@n-1,@s=CASE WHEN @n<' + @TopN
	+ N' THEN @s+N'',''+QUOTENAME(RTRIM(CAST(' + @FieldKey
	+ N' as varchar(8000))),N'''''''') else N'''' end FROM ' + @tbname
	+ N' ' + @Where
	+ N' ' + @FieldOrder
	set rowcount @PageCurrent
	exec sp_executesql @sql,
	N'@n int,@s nvarchar(4000) OUTPUT',
	@PageCurrent, @sql output
	set rowcount 0
	if @sql = N''
		exec(N'select TOP 0'
		+N' ' + @FieldShow
		+N' FROM ' + @tbname)
	else
	begin
		set @sql=stuff(@sql, 1, 1, N'')
		--执行查询
		exec(N'select TOP ' + @TopN
		+N' ' + @FieldShow
		+N' FROM ' + @tbname
		+N' WHERE ' + @FieldKey
		+N' IN(' + @sql
		+N') ' + @FieldOrder)
	end
end


SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  Table [dbo].[TB_FARM_FARM]    Script Date: 07/30/2013 14:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_FARM_FARM](
	[Zone] [int] NOT NULL,
	[Farm] [int] NOT NULL,
	[FarmState] [int] NOT NULL,
	[FarmOwnerID] [int] NOT NULL,
	[GardenGrade] [int] NOT NULL,
	[HouseGrade] [int] NOT NULL,
	[WarehouseGrade] [int] NOT NULL,
	[AnimalCageGrade] [int] NOT NULL,
	[FenceGrade] [int] NOT NULL,
	[BUILD_DATE] [smalldatetime] NOT NULL CONSTRAINT [DF_TB_FARM_FARM_BUILD_DATE]  DEFAULT (getdate())
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_FARM_LOG]    Script Date: 07/30/2013 14:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_FARM_LOG](
	[LOG_IDX] [int] IDENTITY(1,1) NOT NULL,
	[Zone] [int] NOT NULL,
	[Farm] [int] NOT NULL,
	[Kind] [int] NOT NULL,
	[PlayerID] [int] NOT NULL,
	[Value01] [int] NOT NULL,
	[Value02] [int] NOT NULL,
	[Date] [smalldatetime] NOT NULL CONSTRAINT [DF_TB_FARM_LOG_Date]  DEFAULT (getdate()),
 CONSTRAINT [PK_TB_FARM_LOG] PRIMARY KEY CLUSTERED 
(
	[LOG_IDX] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_FARM_TAX]    Script Date: 07/30/2013 14:56:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_FARM_TAX](
	[Zone] [int] NOT NULL,
	[Farm] [int] NOT NULL,
	[TaxArrearageFreq] [int] NOT NULL,
	[TaxPayPlayerID] [int] NOT NULL,
 CONSTRAINT [PK_TB_FARM_TAX] PRIMARY KEY CLUSTERED 
(
	[Zone] ASC,
	[Farm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[up_PlaytimeForDayLog]    Script Date: 07/30/2013 14:55:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[up_PlaytimeForDayLog]
as

	Set Nocount on
declare @Server		varchar(4)
declare @num		int
declare @Date		varchar(12) 
declare @DateC		varchar(10)
declare @sql 		varchar(2000)

set @num = 1 		-- 오늘을 기준으로 (예: 이틀전을 필요로 하면 2)
set @Server = '3'		-- 서버군의 데이터 ( 1- 테스트, 2 - 성인섭, 3 - 틴섭 )
set @Date = ( select convert( varchar(4), datepart(yyyy, getdate()-@num) ) + convert( varchar(4), datepart(mm, getdate()-@num) ) + convert( varchar(4), datepart(dd, getdate()-@num) ) )
set @DateC = ( select convert( varchar(4), datepart(yyyy, getdate()-@num) ) + '-' + convert( varchar(4), datepart(mm, getdate()-@num) ) + '-' + convert( varchar(4), datepart(dd, getdate()-@num) ) )

set @sql = 'select c.propid, c.login_id, c.time, c.btime, datediff(ss, c.time, c.btime) from '
set @sql = @sql + '(select login_id, propid,  time, isnull('
set @sql = @sql + '(select top 1 b.time from login_log_'+@Date+' b where a.propid=b.propid and b.status=2 and time >= '
set @sql = @sql + '(select min(time) from login_log_'+@Date+' where propid=a.propid and b.status=2 and  time >= a.time and kind = '+@Server+') and time >= a.time and kind= '+@Server
set @sql = @sql + '), convert(char(10), dateadd(dd, 1, '''+@DateC+'''), 120)) as btime '
set @sql = @sql + 'from login_log_'+@Date+' a '
set @sql = @sql + 'where status=4 and kind = '+@Server+')  as c '
set @sql = @sql + 'left outer join chr_log_info d on c.propid = d.propid and d.userlevel = 6 '
set @sql = @sql + 'where d.propid is not null '
set @sql = @sql + 'order by c.propid asc, c.time asc'

exec (@sql)
GO
/****** Object:  Table [dbo].[TB_ITEMMall_OPTION]    Script Date: 07/30/2013 14:57:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_ITEMMall_OPTION](
	[OPTION_DBIDX] [int] IDENTITY(1,1) NOT NULL,
	[LIFE] [smallint] NOT NULL,
	[weaponATTACK] [smallint] NOT NULL,
	[blow] [smallint] NOT NULL,
	[selfprotection] [smallint] NOT NULL,
	[NAERYUK] [smallint] NOT NULL,
	[MINCHUB] [smallint] NOT NULL,
	[range] [smallint] NOT NULL,
	[CHERYUK] [smallint] NOT NULL,
	[SIMMEK] [smallint] NOT NULL,
	[gunyuk] [smallint] NOT NULL,
	[character_inven] [smallint] NOT NULL,
	[PYOGUK_inven] [smallint] NOT NULL,
	[counterattack] [smallint] NOT NULL,
	[gyeonggong] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_FARM_TIMEDELAY]    Script Date: 07/30/2013 14:56:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_FARM_TIMEDELAY](
	[PlayerID] [int] NOT NULL,
	[Kind] [int] NOT NULL,
	[RemainTime] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[up_Event_CharacterInfoUpdate]    Script Date: 07/30/2013 14:55:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE   PROC [dbo].[up_Event_CharacterInfoUpdate]

as
Set Nocount on
Set Xact_abort on


DECLARE @DB VARCHAR( 20 )
DECLARE @SQL VARCHAR( 1000 )

--1 블루랜드 정보 삽입

--1.1 사용할 DB명 설정
SET @DB = 'luna01' + CONVERT( VARCHAR( 8 ), GETDATE(), 112 )

--1.2 기존 블루랜드 정보 삭제

delete [LUNA_RBEVENT_01].[dbo].[tbl_MemberCharacter_Auto]
delete [LUNA_RBEVENT_01].[dbo].[tbl_MemberRefCharacter_Auto]

--1.3 블루랜드 정보 삽입

--1.3.1 tbl_MemberCharacter_Auto 업데이트


--1.3.1.1 생성된 캐릭터 정보 삽입
SET @SQL = 
N'insert into [LUNA_RBEVENT_01].[dbo].[tbl_MemberCharacter_Auto] ' +
N'( f_IDX, f_CharacterName, f_Server_Code, f_Lv, f_ID, f_NickName, f_LUNAIDX ) ' +
N'select a.USER_IDX, a.CHARACTER_NAME, 2, a.CHARACTER_GRADE, b.Login_id, b.NickName, b.propid ' +
N'from [' + @DB + N'].[dbo].TB_CHARACTER a, [LunaBlue_Member].[dbo].[member_info] b ' +
N'where ' +
N'a.USER_IDX = b.propid and a.CHARACTER_STANDINDEX <> 5 and b.STATUS <> 10'

EXEC( @SQL )

--1.3.1.2 생성된 캐릭터 정보중 f_LUNAIDX가 1000000 이상인 것들은 신규 계정이 아니므로 NULL로 대체
update [LUNA_RBEVENT_01].[dbo].[tbl_MemberCharacter_Auto]
set f_LUNAIDX = NULL
where f_LUNAIDX >= 1000000

--1.3.2 tbl_MemberRefCharacter_Auto 업데이트
--1.3.2.1 친구
SET @SQL = 
N'insert into [LUNA_RBEVENT_01].[dbo].[tbl_MemberRefCharacter_Auto] ' +
N'( f_IDX, f_MemberCharacter_CharacterName, f_MemberCharacter_Server_Code, f_MemberRefType_Code, f_Lv, f_CharacterName, f_CreateDate ) ' +
N'select a.USER_IDX, a.CHARACTER_NAME, 2, 1, b.CHARACTER_GRADE, c.FRIEND_NAME, b.CHARACTER_BIRTH ' +
N'from [' + @DB + N'].[dbo].TB_CHARACTER a, [' + @DB + N'].[dbo].TB_CHARACTER b, [' + @DB + N'].[dbo].TB_FRIEND c ' +
N'where ' +
N'a.CHARACTER_IDX = c.CHARACTER_IDX and ' +
N'b.CHARACTER_IDX = c.FRIEND_IDX and a.CHARACTER_STANDINDEX <> 5 and b.CHARACTER_STANDINDEX <> 5'

EXEC( @SQL )

--1.3.2.2 패밀리
SET @SQL = 
N'insert into [LUNA_RBEVENT_01].[dbo].[tbl_MemberRefCharacter_Auto] ' +
N'( f_IDX, f_MemberCharacter_CharacterName, f_MemberCharacter_Server_Code, f_MemberRefType_Code, f_Lv, f_CharacterName, f_CreateDate ) ' +
N'select a.USER_IDX, a.CHARACTER_NAME, 2, 2, b.CHARACTER_GRADE, b.CHARACTER_NAME, b.CHARACTER_BIRTH ' +
N'from [' + @DB + N'].[dbo].TB_CHARACTER a, [' + @DB + N'].[dbo].TB_CHARACTER b, [' + @DB + N'].[dbo].TB_FAMILY_MEMBER c, [' + @DB + N'].[dbo].TB_FAMILY_MEMBER d ' +
N'where ' +
N'a.CHARACTER_IDX = c.MemberID and ' +
N'b.CHARACTER_IDX = d.MemberID and ' +
N'd.FamilyID = c.FamilyID and ' +
N'c.MemberID <> d.MemberID and a.CHARACTER_STANDINDEX <> 5 and b.CHARACTER_STANDINDEX <> 5'

EXEC( @SQL )

--1.3.2.3 길드
SET @SQL = 
N'insert into [LUNA_RBEVENT_01].[dbo].[tbl_MemberRefCharacter_Auto] ' +
N'( f_IDX, f_MemberCharacter_CharacterName, f_MemberCharacter_Server_Code, f_MemberRefType_Code, f_Lv, f_CharacterName, f_CreateDate ) ' +
N'select a.USER_IDX, a.CHARACTER_NAME, 2, 3, b.CHARACTER_GRADE, b.CHARACTER_NAME, b.CHARACTER_BIRTH ' +
N'from [' + @DB + N'].[dbo].TB_CHARACTER a, [' + @DB + N'].[dbo].TB_CHARACTER b ' +
N'where ' +
N'b.CHARACTER_MUNPAIDX <> 0 and ' +
N'b.CHARACTER_MUNPAIDX = a.CHARACTER_MUNPAIDX and ' +
N'a.CHARACTER_IDX <> b.CHARACTER_IDX and a.CHARACTER_STANDINDEX <> 5 and b.CHARACTER_STANDINDEX <> 5'

EXEC( @SQL )

--2 디렌 정보 삽입

--2.1 사용할 DB명 설정
SET @DB = 'luna99' + CONVERT( VARCHAR( 8 ), GETDATE(), 112 )

--2.2 기존 디렌 정보 삭제

delete [LUNA_RBEVENT_01].[dbo].[tbl_MemberCharacterLUNA_Auto]
where f_Server_Code = 2

delete [LUNA_RBEVENT_01].[dbo].[tbl_MemberRefCharacterLUNA_Auto]
where f_MemberCharacter_Server_Code = 2

--2.3 디렌 정보 삽입

--2.3.1 tbl_MemberCharacterLUNA_Auto 업데이트


--2.3.1.1 생성된 캐릭터 정보 삽입
SET @SQL = 
N'insert into [LUNA_RBEVENT_01].[dbo].[tbl_MemberCharacterLUNA_Auto] ' +
N'( f_IDX, f_CharacterName, f_Server_Code, f_Lv, f_ID, f_NickName ) ' +
N'select a.USER_IDX, a.CHARACTER_NAME, 2, a.CHARACTER_GRADE, b.id_loginid, c.id_name ' +
N'from [' + @DB + N'].[dbo].TB_CHARACTER a, [lunamember].[dbo].[chr_log_info] b, [lunamember].[dbo].[chr_log_info_plus] c ' +
N'where ' +
N'a.USER_IDX = b.propid and b.id_loginid = c.id_loginid and a.CHARACTER_STANDINDEX <> 5'

EXEC( @SQL )

--2.3.1.2 엔팡에서 사용된 propid 업데이트
update [LUNA_RBEVENT_01].[dbo].[tbl_MemberCharacterLUNA_Auto]
set f_ENPANGIDX = 
(
select propid
from [LunaBlue_Member].[dbo].[Member_info]
where f_IDX = propid and status <> 10
)

--2.3.2 tbl_MemberRefCharacterLUNA_Auto 업데이트
--2.3.2.1 친구
SET @SQL = 
N'insert into [LUNA_RBEVENT_01].[dbo].[tbl_MemberRefCharacterLUNA_Auto] ' +
N'( f_IDX, f_MemberCharacter_CharacterName, f_MemberCharacter_Server_Code, f_MemberRefType_Code, f_Lv, f_CharacterName, f_CreateDate ) ' +
N'select a.USER_IDX, a.CHARACTER_NAME, 2, 1, b.CHARACTER_GRADE, c.FRIEND_NAME, b.CHARACTER_BIRTH ' +
N'from [' + @DB + N'].[dbo].TB_CHARACTER a, [' + @DB + N'].[dbo].TB_CHARACTER b, [' + @DB + N'].[dbo].TB_FRIEND c ' +
N'where ' +
N'a.CHARACTER_IDX = c.CHARACTER_IDX and ' +
N'b.CHARACTER_IDX = c.FRIEND_IDX and a.CHARACTER_STANDINDEX <> 5 and b.CHARACTER_STANDINDEX <> 5'

EXEC( @SQL )

--2.3.2.2 패밀리
SET @SQL = 
N'insert into [LUNA_RBEVENT_01].[dbo].[tbl_MemberRefCharacterLUNA_Auto] ' +
N'( f_IDX, f_MemberCharacter_CharacterName, f_MemberCharacter_Server_Code, f_MemberRefType_Code, f_Lv, f_CharacterName, f_CreateDate ) ' +
N'select a.USER_IDX, a.CHARACTER_NAME, 2, 2, b.CHARACTER_GRADE, b.CHARACTER_NAME, b.CHARACTER_BIRTH ' +
N'from [' + @DB + N'].[dbo].TB_CHARACTER a, [' + @DB + N'].[dbo].TB_CHARACTER b, [' + @DB + N'].[dbo].TB_FAMILY_MEMBER c, [' + @DB + N'].[dbo].TB_FAMILY_MEMBER d ' +
N'where ' +
N'a.CHARACTER_IDX = c.MemberID and ' +
N'b.CHARACTER_IDX = d.MemberID and ' +
N'd.FamilyID = c.FamilyID and ' +
N'c.MemberID <> d.MemberID and a.CHARACTER_STANDINDEX <> 5 and b.CHARACTER_STANDINDEX <> 5'

EXEC( @SQL )

--2.3.2.3 길드
SET @SQL = 
N'insert into [LUNA_RBEVENT_01].[dbo].[tbl_MemberRefCharacterLUNA_Auto] ' +
N'( f_IDX, f_MemberCharacter_CharacterName, f_MemberCharacter_Server_Code, f_MemberRefType_Code, f_Lv, f_CharacterName, f_CreateDate ) ' +
N'select a.USER_IDX, a.CHARACTER_NAME, 2, 3, b.CHARACTER_GRADE, b.CHARACTER_NAME, b.CHARACTER_BIRTH ' +
N'from [' + @DB + N'].[dbo].TB_CHARACTER a, [' + @DB + N'].[dbo].TB_CHARACTER b ' +
N'where ' +
N'b.CHARACTER_MUNPAIDX <> 0 and ' +
N'b.CHARACTER_MUNPAIDX = a.CHARACTER_MUNPAIDX and ' +
N'a.CHARACTER_IDX <> b.CHARACTER_IDX and a.CHARACTER_STANDINDEX <> 5 and b.CHARACTER_STANDINDEX <> 5'

EXEC( @SQL )
GO
/****** Object:  Table [dbo].[TB_JACKPOT]    Script Date: 07/30/2013 14:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_JACKPOT](
	[Idx] [int] IDENTITY(1,1) NOT NULL,
	[TotalMoney] [bigint] NULL,
	[PrizeMoney] [bigint] NULL,
	[CharacterIdx] [int] NULL,
	[RegDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_TB_JACKPOT] PRIMARY KEY CLUSTERED 
(
	[Idx] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_FISHING]    Script Date: 07/30/2013 14:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_FISHING](
	[CHARACTER_IDX] [int] NOT NULL,
	[FISHING_LEVEL] [int] NOT NULL,
	[FISHING_EXP] [bigint] NOT NULL,
	[FISH_POINT] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_FORBIDCHAT_LIST]    Script Date: 07/30/2013 14:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_FORBIDCHAT_LIST](
	[Character_Idx] [int] NOT NULL,
	[RegistDate] [smalldatetime] NOT NULL,
	[ReleaseDate] [smalldatetime] NOT NULL,
	[Operator_Name] [varchar](16) NOT NULL,
	[Reason] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_JOURNAL]    Script Date: 07/30/2013 14:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_JOURNAL](
	[Journal_IDX] [int] IDENTITY(1,1) NOT NULL,
	[Character_IDX] [int] NOT NULL,
	[RegDate] [smalldatetime] NULL,
	[Kind] [tinyint] NOT NULL,
	[Param] [int] NOT NULL CONSTRAINT [DF_TB_JOURNAL_Param]  DEFAULT ((0)),
	[Param_2] [int] NOT NULL CONSTRAINT [DF_TB_JOURNAL_Param_2]  DEFAULT ((0)),
	[Param_3] [int] NOT NULL CONSTRAINT [DF_TB_JOURNAL_Param_3]  DEFAULT ((0)),
	[bSaved] [tinyint] NOT NULL CONSTRAINT [DF_TB_JOURNAL_bSaved]  DEFAULT ((0)),
	[ParamName] [varchar](16) NULL,
 CONSTRAINT [PK_TB_JOURNAL] PRIMARY KEY CLUSTERED 
(
	[Journal_IDX] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_FRIEND]    Script Date: 07/30/2013 14:56:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_FRIEND](
	[Character_idx] [int] NOT NULL,
	[Friend_idx] [int] NOT NULL,
	[Friend_name] [varchar](16) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_GAMEROOM]    Script Date: 07/30/2013 14:56:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_GAMEROOM](
	[USER_IDX] [int] NOT NULL,
	[PROVIDE_CNT] [int] NOT NULL CONSTRAINT [DF_TB_GAMEROOM_ITEM_PROVIDE_CNT]  DEFAULT ((0)),
	[PROVIDE_TIME] [datetime] NOT NULL CONSTRAINT [DF_TB_GAMEROOM_ITEM_provide_time]  DEFAULT ((0)),
	[PCROOM_POINT] [int] NOT NULL CONSTRAINT [DF_TB_GAMEROOM_PCROOM_POINT]  DEFAULT ((0)),
	[PCROOM_INDEX] [int] NOT NULL CONSTRAINT [DF_TB_GAMEROOM_PCROOM_INDEX]  DEFAULT ((0)),
	[PROVIDE_BUFF] [smallint] NOT NULL CONSTRAINT [DF_TB_GAMEROOM_PROVIDE_BUFF]  DEFAULT ((0)),
	[BUFF_DAY] [smallint] NOT NULL CONSTRAINT [DF_TB_GAMEROOM_BUFF_DAY]  DEFAULT ((0)),
	[BUFF_LEVEL] [smallint] NOT NULL CONSTRAINT [DF_TB_GAMEROOM_BUFF_LEVEL]  DEFAULT ((0)),
	[BUFF_STAGE] [smallint] NOT NULL CONSTRAINT [DF_TB_GAMEROOM_BUFF_STAGE]  DEFAULT ((0)),
	[CHARACTER_IDX] [int] NOT NULL CONSTRAINT [DF_TB_GAMEROOM_CHARACTER_IDX]  DEFAULT ((0)),
	[LOGIN_MAP] [smallint] NOT NULL CONSTRAINT [DF_TB_GAMEROOM_LOGIN_MAP]  DEFAULT ((0))
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_AUTONOTELIST]    Script Date: 07/30/2013 14:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_AUTONOTELIST](
	[character_idx] [int] NOT NULL CONSTRAINT [DF_TB_AUTONOTELIST_character_idx]  DEFAULT ((0)),
	[auto_name] [varchar](16) NOT NULL CONSTRAINT [DF_TB_AUTONOTELIST_auto_name]  DEFAULT (''),
	[reg_date] [smalldatetime] NOT NULL CONSTRAINT [DF_TB_AUTONOTELIST_reg_date]  DEFAULT (getdate()),
	[auto_character_idx] [int] NOT NULL CONSTRAINT [DF_TB_AUTONOTELIST_auto_character_idx]  DEFAULT ((0)),
	[auto_user_idx] [int] NOT NULL CONSTRAINT [DF_TB_AUTONOTELIST_auto_user_idx]  DEFAULT ((0))
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_LOGINCHECK]    Script Date: 07/30/2013 14:57:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_LOGINCHECK](
	[USER_IDX] [int] NOT NULL,
	[LOGCINHECK_INTIME] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_LoginMapInfo]    Script Date: 07/30/2013 14:57:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_LoginMapInfo](
	[Character_idx] [int] NOT NULL,
	[Character_Name] [varchar](16) NOT NULL,
	[MapNum] [tinyint] NOT NULL,
	[MapPort] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_LoginUserCount]    Script Date: 07/30/2013 14:57:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_LoginUserCount](
	[CurUser] [int] NULL,
	[MaxUser] [int] NULL,
	[LoginTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_LOGOUTCHECK]    Script Date: 07/30/2013 14:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_LOGOUTCHECK](
	[CHARACTER_IDX] [int] NOT NULL,
	[LOGOUTCHECK_OUTTIME] [datetime] NOT NULL,
	[LOGOUTCHECK_OUTMAP] [tinyint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_BUFF_ADD]    Script Date: 07/30/2013 14:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080219 LUJ, 기간제 스킬인 경우 종료 시간에 표시한다
080506 LUJ, 업데이트 조건 검사가 잘못된 거 수정(CHARACTER_IDX를 비교하지 않았음)
090204 LUJ, @remain_count의 수치 범위를 확장함.
	END_DATE 업데이트 구문을 레코드 삽입 시 함께 처리하도록 함
*/
CREATE     proc [dbo].[MP_CHARACTER_BUFF_ADD]
(
	@CHARACTER_IDX 	INT,
	@SKILL_IDX 	INT,
	@REMAIN_TIME	BIGINT,
	@REMAIN_COUNT	INT,
	@IS_END_DATE	INT
)
as
	SET NOCOUNT ON
	SET XACT_ABORT ON

	DELETE
	FROM	TB_BUFF
	WHERE	CHARACTER_IDX = @CHARACTER_IDX AND
		SKILL_IDX = @SKILL_IDX

	-- 090204 LUJ, END_DATE 업데이트를 따로 하던 것을 합침
	INSERT TB_BUFF
	(
		CHARACTER_IDX,
		SKILL_IDX,
		REMAIN_TIME,
		REMAIN_COUNT,
		END_DATE
	)
	VALUES
	(
		@CHARACTER_IDX,
		@SKILL_IDX,
		@REMAIN_TIME,
		@REMAIN_COUNT,
		CASE
			WHEN 0 < @IS_END_DATE THEN DATEADD( SECOND, @REMAIN_TIME / 1000, GETDATE() )
			ELSE NULL
		END
	)

	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_BUFF_LOAD]    Script Date: 07/30/2013 14:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080219 LUJ, 만료된 기간제 스킬은 제거하고 로딩한다
080819 LUJ, 로그를 남기기 위해 만료된 기간제 스킬도 쿼리한다.
*/
CREATE    proc [dbo].[MP_CHARACTER_BUFF_LOAD]
(
	@character_idx int
)
as
	Set Nocount on
	Set Xact_abort on

	-- 080219 LUJ, 만료된 기간제 스킬은 제거하고 로딩한다
	BEGIN
		-- 080819 LUJ, 로그를 남기기 위해 만료된 기간제 스킬도 쿼리한다.
		SELECT	SKILL_IDX,
			REMAIN_TIME,
			REMAIN_COUNT,
			DURATION = 
				CASE
					WHEN 	END_DATE IS NULL	THEN 0
					WHEN 	END_DATE < GETDATE() 	THEN 0
					ELSE	DATEDIFF( SECOND, GETDATE(), ISNULL( END_DATE, GETDATE()  ) )
				END
		FROM	TB_BUFF
		WHERE	CHARACTER_IDX = @CHARACTER_IDX

		DELETE
		FROM	TB_BUFF
		WHERE	CHARACTER_IDX = @CHARACTER_IDX 	AND
			END_DATE IS NOT NULL			AND
			GETDATE() >= END_DATE
	END
	
	RETURN
/*
	-- 080819 이전 코드
	BEGIN
		DELETE
		FROM	TB_BUFF
		WHERE	CHARACTER_IDX = @CHARACTER_IDX AND
				END_DATE IS NOT NULL AND
				GETDATE() >= END_DATE

		SELECT	SKILL_IDX,
				REMAIN_TIME,
				REMAIN_COUNT,
				CASE
					-- 기간이 긴 경우 오버플로가 
					WHEN END_DATE IS NOT NULL THEN DATEDIFF( SECOND, GETDATE(), END_DATE )
					ELSE 0
				END				
		FROM	TB_BUFF
		WHERE	CHARACTER_IDX = @CHARACTER_IDX
	END
*/
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_BUFF_REMOVE]    Script Date: 07/30/2013 14:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[MP_CHARACTER_BUFF_REMOVE]
(
	@character_idx 	int,
	@skill_idx 	int
)
as
	Set Nocount on
	Set Xact_abort on

delete	tb_buff
where	character_idx = @character_idx and skill_idx = @skill_idx
/*
return

UPDATE	TB_ITEM_DROP_OPTION
SET		KEY1 = 0, VALUE1 = 0
WHERE	VALUE1 < 0.001

UPDATE	TB_ITEM_DROP_OPTION
SET		KEY2 = 0, VALUE2 = 0
WHERE	VALUE2 < 0.001

UPDATE	TB_ITEM_DROP_OPTION
SET		KEY3 = 0, VALUE3 = 0
WHERE	VALUE3 < 0.001

UPDATE	TB_ITEM_DROP_OPTION
SET		KEY4 = 0, VALUE4 = 0
WHERE	VALUE4 < 0.001

UPDATE	TB_ITEM_DROP_OPTION
SET		KEY5 = 0, VALUE5 = 0
WHERE	VALUE5 < 0.001


SELECT	*
FROM	TB_ITEM_DROP_OPTION
WHERE	(KEY1 BETWEEN 200 AND 300) OR
		(KEY2 BETWEEN 200 AND 300) OR
		(KEY3 BETWEEN 200 AND 300) OR
		(KEY4 BETWEEN 200 AND 300) OR
		(KEY5 BETWEEN 200 AND 300)
*/
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_BUFF_UPDATE]    Script Date: 07/30/2013 14:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080219 LUJ, REMAIN_TIME曖 ?擊 INT -> BIGINT煎 ??
080522 LUJ, ?檜?? ?渡 溯?萄陛 橈朝 ?辦 鳶殮?紫煙 ?
090204 LUJ, @remain_count曖 熱纂 彰嬪? ???
100804 ShinJS, END_DATE曖 頂辨擊 機等檜? ?紫煙 熱薑
*/
CREATE    proc [dbo].[MP_CHARACTER_BUFF_UPDATE]
(
	@CHARACTER_IDX 	INT,
	@SKILL_IDX	INT,
	@REMAIN_TIME 	BIGINT,
	@REMAIN_COUNT	INT,
	@IS_CHANGE_DATE	INT
)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	UPDATE	TB_BUFF
	SET	REMAIN_TIME = @REMAIN_TIME, 
		REMAIN_COUNT = @REMAIN_COUNT,
		END_DATE = 
			CASE
				WHEN END_DATE IS NULL THEN NULL
				ELSE DATEADD( SECOND, @REMAIN_TIME / 1000, GETDATE() )
			END
		
	WHERE	CHARACTER_IDX = @CHARACTER_IDX AND SKILL_IDX = @SKILL_IDX
	RETURN

/****** 偃羹:  StoredProcedure [dbo].[MP_CHARACTER_UPDATE_ON_MAPOUT]    蝶?董? 陳瞼: 08/17/2010 16:53:05 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[RP_CharacterMainQuestInfo]    Script Date: 07/30/2013 14:54:48 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE    proc [dbo].[RP_CharacterMainQuestInfo]
(
		@charIdx	int
)
as
	Set Nocount on

	select * from tb_mainquest with(nolock) where character_idx = @charIdx order by quest_idx
GO
/****** Object:  StoredProcedure [dbo].[MP_QUEST_DELETEQUEST_NEW]    Script Date: 07/30/2013 14:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_QUEST_DELETEQUEST_NEW]
(
	@CHARACTER_IDX	int,
	@QUEST_IDX		int,
	@PARAM		int
)
as
	Set Nocount On
	Set Xact_Abort On

	

	-- subquest delete
if @PARAM = 1
begin
	delete TB_SUBQUEST where CHARACTER_IDX = @CHARACTER_IDX and QUEST_IDX = @QUEST_IDX
end	
	-- delete questitem
	delete TB_QUESTITEM where CHARACTER_IDX = @CHARACTER_IDX and QUEST_IDX = @QUEST_IDX

	-- delete mainquest
	delete TB_MAINQUEST where CHARACTER_IDX = @CHARACTER_IDX and QUEST_IDX = @QUEST_IDX
GO
/****** Object:  StoredProcedure [dbo].[MP_QUEST_ENDQUEST_NEW]    Script Date: 07/30/2013 14:54:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_QUEST_ENDQUEST_NEW]
(
	@CHARACTER_IDX	int,
	@QUEST_IDX		int,
	@SUBQUEST_DO		int,
	@END_PARAM		int,
	@REGIST_TIME		int
)
as
	Set Nocount On
	Set Xact_Abort On

	-- subquest delete
	delete TB_SUBQUEST where CHARACTER_IDX = @CHARACTER_IDX and QUEST_IDX = @QUEST_IDX
	
	-- delete questitem
	delete TB_QUESTITEM where CHARACTER_IDX = @CHARACTER_IDX and QUEST_IDX = @QUEST_IDX

	update TB_MAINQUEST
	set SUBQUEST_DO = @SUBQUEST_DO,
	END_PARAM = @END_PARAM,
	REGIST_TIME = @REGIST_TIME
	where CHARACTER_IDX = @CHARACTER_IDX and QUEST_IDX = @QUEST_IDX
GO
/****** Object:  StoredProcedure [dbo].[MP_QUEST_ENDSUBQUEST_NEW]    Script Date: 07/30/2013 14:54:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_QUEST_ENDSUBQUEST_NEW]
(
	@CHARACTER_IDX	int,
	@QUEST_IDX		int,
	@SUBQUEST_IDX		int,
	@SUBQUEST_DO		int,	
	@REGIST_TIME		int
)
as
	Set Nocount On
	Set Xact_Abort On

	-- delete subquest
	delete TB_SUBQUEST where CHARACTER_IDX=@CHARACTER_IDX and QUEST_IDX=@QUEST_IDX and SUBQUEST_IDX=@SUBQUEST_IDX

	-- update mainquest
	update TB_MAINQUEST set 
	SUBQUEST_DO = @SUBQUEST_DO,
	REGIST_TIME = @REGIST_TIME
	where CHARACTER_IDX = @CHARACTER_IDX and QUEST_IDX = @QUEST_IDX
GO
/****** Object:  StoredProcedure [dbo].[TP_QUEST_MAIN_DELETE]    Script Date: 07/30/2013 14:55:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 071106 웅주
-- 메인퀘스트를 지우면 다시 진행할 수 있게 한다
CREATE PROCEDURE [dbo].[TP_QUEST_MAIN_DELETE]
(
	@CHAR_IDX		INT,
	@MAIN_QUEST_IDX	INT
)
AS
	SET NOCOUNT ON
	
	-- 퀘스트 아이템 지운다	
	DELETE FROM TB_QUESTITEM
	WHERE   (CHARACTER_IDX = @CHAR_IDX) AND (QUEST_IDX = @MAIN_QUEST_IDX)
	
	-- 서브 퀘스트를 지운다
	DELETE FROM TB_SUBQUEST
	WHERE   (CHARACTER_IDX = @CHAR_IDX) AND (QUEST_IDX = @MAIN_QUEST_IDX)
	
	-- 메인 퀘스트를 지운다
	DELETE FROM TB_MAINQUEST
	WHERE   (CHARACTER_IDX = @CHAR_IDX) AND (QUEST_IDX = @MAIN_QUEST_IDX)
	
	IF 0 < @@ROWCOUNT
	BEGIN
		SELECT @CHAR_IDX, @MAIN_QUEST_IDX
		RETURN
	END
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_QUEST_MAIN_SELECT]    Script Date: 07/30/2013 14:55:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080102 웅주, 플레이어 인덱스도 쿼리
*/
CREATE PROCEDURE [dbo].[TP_QUEST_MAIN_SELECT]
(
	@CHAR_IDX	INT,
	@QUEST_IDX	INT
)
AS
	SET NOCOUNT ON
	
	SELECT TOP 100
		QUEST_IDX,
		SUBQUEST_DO,
		END_PARAM,
		REGIST_TIME,
		CHECK_TYPE,
		CHECK_TIME,
		@CHAR_IDX
	FROM TB_MAINQUEST
	WHERE CHARACTER_IDX = @CHAR_IDX AND QUEST_IDX > @QUEST_IDX
	ORDER BY QUEST_IDX
		
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_QUEST_SUB_DELETE]    Script Date: 07/30/2013 14:55:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 071106 웅주
-- 서브퀘스트를 지우면 완료한 것이 된다
CREATE PROCEDURE [dbo].[TP_QUEST_SUB_DELETE]
(
	@CHAR_IDX		INT,
	@MAIN_QUEST_IDX	INT,
	@SUB_QUEST_IDX	INT,
	@SUB_QUEST_DO	INT
)
AS
	SET NOCOUNT ON
	
	UPDATE  TB_MAINQUEST
	SET		SUBQUEST_DO = @SUB_QUEST_DO
	WHERE   (CHARACTER_IDX = @CHAR_IDX) AND (QUEST_IDX = @MAIN_QUEST_IDX)
	
	IF 0 = @@ROWCOUNT
		RETURN
		
	DELETE FROM TB_SUBQUEST
	WHERE  (CHARACTER_IDX = @CHAR_IDX) AND (QUEST_IDX = @MAIN_QUEST_IDX) AND 
		   (SUBQUEST_IDX = @SUB_QUEST_IDX)

	IF 0 < @@ROWCOUNT
	BEGIN	
		SELECT @MAIN_QUEST_IDX, @SUB_QUEST_IDX, @SUB_QUEST_DO
		RETURN
	END
	
	RETURN 
/*
SELECT   CHARACTER_IDX, QUEST_IDX, SUBQUEST_IDX
FROM      TB_SUBQUEST
WHERE   (CHARACTER_IDX = 1330) AND (QUEST_IDX = 1)

SELECT   *, TB_CHARACTER.CHARACTER_NAME AS Expr1
FROM      TB_MAINQUEST INNER JOIN
                TB_CHARACTER ON 
                TB_MAINQUEST.CHARACTER_IDX = TB_CHARACTER.CHARACTER_IDX
WHERE   (TB_CHARACTER.CHARACTER_NAME = '사유해')

UPDATE  TB_MAINQUEST
SET         SUBQUEST_DO = - 2147483648
WHERE   (CHARACTER_IDX = 1330) AND (QUEST_IDX = 1)
*/

SELECT *
FROM TB_ITEM
GO
/****** Object:  StoredProcedure [dbo].[MP_MAINQUEST_Delete]    Script Date: 07/30/2013 14:53:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_MAINQUEST_Delete]
(
	@CHARACTER_IDX	int,
	@QUEST_IDX		int
)
as
	set nocount on
--	set xact_abort on

	delete TB_MAINQUEST where CHARACTER_IDX=@CHARACTER_IDX and QUEST_IDX=@QUEST_IDX
GO
/****** Object:  StoredProcedure [dbo].[MP_MAINQUEST_Load]    Script Date: 07/30/2013 14:53:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
070920 웅주
퀘스트를 100개 이상 읽을 수 있도록 묵향 프로시저를 적용함
*/

CREATE  proc [dbo].[MP_MAINQUEST_Load]
(
	@CHARACTER_IDX		int,
	@QUEST_IDX			int
)
as
	Set Nocount on
	--Set Xact_abort on

--if not exists    (select count(*) from TB_MAINQUEST where CHARACTER_IDX = @CHARACTER_IDX) 
--	begin
--		return
--	end
--else
--	begin 
	
		UPDATE TB_MAINQUEST
		
		SET END_PARAM = 1
		
		WHERE CHARACTER_IDX = @CHARACTER_IDX AND QUEST_IDX NOT IN
		(
			SELECT	QUEST_IDX
			FROM	TB_SUBQUEST
			WHERE	CHARACTER_IDX = @CHARACTER_IDX
		)
	
		delete from dbo.tb_mainquest
		where character_idx = @character_idx and end_param = 1 and repeat = 1
	
		select top 100 QUEST_IDX, SUBQUEST_DO, END_PARAM,REGIST_TIME, CHECK_TYPE, CHECK_TIME
		from TB_MAINQUEST where CHARACTER_IDX = @CHARACTER_IDX and QUEST_IDX > @QUEST_IDX
		order by QUEST_IDX
			
		return
--	end
/*
-- 예전 코드

ALTER proc MP_MAINQUEST_Load
(
	@CHARACTER_IDX			int
)
as
	Set Nocount on
	Set Xact_abort on

if not exists    (select count(*) from TB_MAINQUEST where CHARACTER_IDX = @CHARACTER_IDX) 
	begin		
		return
	end
else
	begin 
		select QUEST_IDX, SUBQUEST_DO, END_PARAM,REGIST_TIME, CHECK_TYPE, CHECK_TIME
			 from TB_MAINQUEST where CHARACTER_IDX = @CHARACTER_IDX
		return
	end
*/


/*
SELECT   CHARACTER_IDX, QUEST_IDX
FROM      TB_MAINQUEST
GROUP BY CHARACTER_IDX, QUEST_IDX
HAVING   (COUNT(QUEST_IDX) > 1)
ORDER BY CHARACTER_IDX, QUEST_IDX
*/
GO
/****** Object:  StoredProcedure [dbo].[MP_MAINQUEST_Insert]    Script Date: 07/30/2013 14:53:49 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE  proc [dbo].[MP_MAINQUEST_Insert]
(
	@CHARACTER_IDX	int,
	@QUEST_IDX		int,
	@SUBQUEST_DO	int,
	@REGIST_TIME	int,
	@REPEAT		tinyint
)
as
	set nocount on
	--set xact_abort on

	insert TB_MAINQUEST
	(
		CHARACTER_IDX,
		QUEST_IDX, 
		SUBQUEST_DO,
		REGIST_TIME,
		REPEAT
	)
	values
	(
		@CHARACTER_IDX,
		@QUEST_IDX,
		@SUBQUEST_DO,
		@REGIST_TIME,
		@REPEAT
	)
GO
/****** Object:  StoredProcedure [dbo].[MP_MAINQUEST_Update]    Script Date: 07/30/2013 14:53:50 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE  proc [dbo].[MP_MAINQUEST_Update]
(
	@CHARACTER_IDX	int,
	@QUEST_IDX		int,
	@SUBQUEST_DO	int,
	@END_PARAM		int,
	@REGIST_TIME	int
)
as
	Set Nocount On
--	Set Xact_Abort On

update TB_MAINQUEST set 
	SUBQUEST_DO = @SUBQUEST_DO,
	END_PARAM = @END_PARAM,
	REGIST_TIME = @REGIST_TIME
	where CHARACTER_IDX = @CHARACTER_IDX and QUEST_IDX = @QUEST_IDX
GO
/****** Object:  StoredProcedure [dbo].[MP_MAINQUEST_UpdateCheckTime]    Script Date: 07/30/2013 14:53:50 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE  proc [dbo].[MP_MAINQUEST_UpdateCheckTime]
(
	@CHARACTER_IDX	int,
	@QUEST_IDX		int,
	@CHECK_TYPE		int,
	@CHECK_TIME		int
)
as
	Set Nocount On
	Set Xact_Abort On

	update TB_MAINQUEST set CHECK_TYPE = @CHECK_TYPE, CHECK_TIME = @CHECK_TIME 
	where CHARACTER_IDX = @CHARACTER_IDX and QUEST_IDX = @QUEST_IDX
GO
/****** Object:  StoredProcedure [dbo].[MP_GT_CancelInsert]    Script Date: 07/30/2013 14:53:07 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE     proc [dbo].[MP_GT_CancelInsert]
(
	@Tournament_Idx		int,
	@Guild_Idx		int
)
as
	set nocount on
	set xact_abort on

	insert TB_GT_CANCELLIST
	(
		Tournament_Idx,
		Guild_Idx,
		Regist_Date
	)
	values
	(
		@Tournament_Idx,
		@Guild_Idx,
		getdate()
	)
GO
/****** Object:  StoredProcedure [dbo].[MP_GT_CancelLoad]    Script Date: 07/30/2013 14:53:07 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE     proc [dbo].[MP_GT_CancelLoad]
(
	@Tournament_Idx		int
)
as
	set nocount on
	set xact_abort on

	begin
		select Guild_Idx from TB_GT_CANCELLIST
		where Tournament_Idx = @Tournament_Idx
	end
GO
/****** Object:  StoredProcedure [dbo].[MP_GT_CHECK_REGIST]    Script Date: 07/30/2013 14:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 접수여부를 조회한다.
CREATE   PROC [dbo].[MP_GT_CHECK_REGIST]
(
	@CHAR_IDX		INT,
	@MAP_NUM		INT,
	@CONNECTION_IDX	INT,
	@GUILD_IDX		INT,
	@NEEDED_GUILD_SCORE	FLOAT,
	@NEEDED_MONEY	BIGINT
)
AS
	SET NOCOUNT 		ON
	SET XACT_ABORT 	ON

	BEGIN TRANSACTION
	
	-- 길드 포인트 검사
	IF 0 < @NEEDED_GUILD_SCORE
	BEGIN
		UPDATE TB_GUILD
		SET	SCORE = SCORE - @NEEDED_GUILD_SCORE
		WHERE	SCORE >= @NEEDED_GUILD_SCORE AND
			GUILDIDX IN
			(	
				SELECT CHARACTER_MUNPAIDX
				FROM	TB_CHARACTER
				WHERE	CHARACTER_IDX = @CHAR_IDX
			)

		IF @@ROWCOUNT = 0
		BEGIN
			GOTO FAILURE
		END
	END

	-- 소지금 검사
	BEGIN
		UPDATE TB_CHARACTER
		SET	CHARACTER_MONEY	= CHARACTER_MONEY	- @NEEDED_MONEY
		WHERE	CHARACTER_MONEY	>= @NEEDED_MONEY	AND
			CHARACTER_IDX 		= @CHAR_IDX

		IF @@ROWCOUNT = 0
		BEGIN
			GOTO FAILURE
		END
	END

	COMMIT

	SELECT @CHAR_IDX, @MAP_NUM, @CONNECTION_IDX, @GUILD_IDX, @NEEDED_GUILD_SCORE, @NEEDED_MONEY, 1
	RETURN	

	-- 업데이트 실패 처리
FAILURE:
	ROLLBACK

	-- 업데이트 실패시 DB에 저장된 해당길드의 정보를 삭제한다.
	declare @curcount	int
	select @curcount  = max(GTCOUNT) from TB_GT_INFO
	delete TB_GT_INFO where GTCOUNT=@curcount and GUILD_IDX=@GUILD_IDX

	SELECT @CHAR_IDX, @MAP_NUM, @CONNECTION_IDX, @GUILD_IDX, @NEEDED_GUILD_SCORE, @NEEDED_MONEY, 0
	RETURN

SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[MP_GT_FORCESET_TO_BEFOENTRANCE]    Script Date: 07/30/2013 14:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 08/09/02 스케쥴러 비정상 동작을 임시로 처리하기 위한 프로시저.
-- 참가신청종료후 입장전 단계로 정상적으로 상태변경이 이루어 지지않아
-- 가장 최근의 경기상태를 강제로 입장전 단계로 설정한다.

CREATE     proc [dbo].[MP_GT_FORCESET_TO_BEFOENTRANCE]

as
	set nocount on
	set xact_abort on

declare @lastcount int

select top 1 @lastcount=GTPOS from TB_GT_INFO where GUILD_IDX = 0  order by GTCOUNT desc-- 가장 최근의 정보만 받아온다
update TB_GT_INFO  set GTPOS = 2 where GTCOUNT=@lastcount and GUILD_IDX = 0 -- 입장전단계(==2)로 강제설정한다.
GO
/****** Object:  StoredProcedure [dbo].[MP_GT_INFOINSERT]    Script Date: 07/30/2013 14:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 경기정보를 추가한다.
CREATE  PROCEDURE [dbo].[MP_GT_INFOINSERT]
(
	@gtcount	smallint,
	@guildidx	int,
	@guildname	varchar(16),
	@position	smallint,
	@round		smallint
)

AS
	Set	Nocount	On
	
	delete from TB_GT_INFO where (GTCOUNT=@gtcount and GUILD_IDX=@guildidx)

	insert TB_GT_INFO
	(
		GTCOUNT,
		GUILD_IDX,
		GUILD_NAME,
		GTPOS,
		GTROUND,
		REGDATE
	)
	values
	(
		@gtcount,
		@guildidx,
		@guildname,
		@position,
		@round,
		getdate()
	)
GO
/****** Object:  StoredProcedure [dbo].[MP_GT_INFOLOAD]    Script Date: 07/30/2013 14:53:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 최근열린 경기정보를 읽어온다.
CREATE    proc [dbo].[MP_GT_INFOLOAD]

as
	set nocount on
	set xact_abort on

select top 1 GTCOUNT,  GTPOS, GTROUND from TB_GT_INFO where GUILD_IDX = 0  order by GTCOUNT desc-- 가장 최근의 정보만 받아온다
GO
/****** Object:  StoredProcedure [dbo].[MP_GT_INFOUPDATE]    Script Date: 07/30/2013 14:53:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 경기정보를 업데이트 한다.
CREATE      PROCEDURE [dbo].[MP_GT_INFOUPDATE]
(
	@gtcount	smallint,
	@guildidx	int,
	@position	smallint,
	@round		smallint
)

AS
	Set	Nocount	On

	update TB_GT_INFO
	set
		GUILD_IDX = @guildidx,
		GTPOS = @position,
		GTROUND = @round

	where GUILD_IDX=@guildidx and GTCOUNT=@gtcount
GO
/****** Object:  StoredProcedure [dbo].[MP_GT_INFOLOADALL]    Script Date: 07/30/2013 14:53:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 최근열린 경기정보를 모두 읽어온다.
CREATE  proc [dbo].[MP_GT_INFOLOADALL]
(
	@getcount smallint
)

as
	set nocount on
	set xact_abort on


select 
	GTCOUNT,
	GUILD_IDX,
	GUILD_NAME,
	GTPOS,
	GTROUND

 from TB_GT_INFO where GTCOUNT=@getcount
GO
/****** Object:  StoredProcedure [dbo].[MP_GT_INFORESET]    Script Date: 07/30/2013 14:53:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 경기정보를 Reset한다.
CREATE   PROCEDURE [dbo].[MP_GT_INFORESET]
(
	@gtcount	smallint,
	@round		smallint
)
AS
	Set	Nocount	On
	
	delete from TB_GT_INFO where GTCOUNT=@gtcount

	insert TB_GT_INFO
	(
		GTCOUNT,
		GUILD_IDX,
		GUILD_NAME,
		GTPOS,
		GTROUND,
		REGDATE
	)
	values
	(
		@gtcount,
		0,
		'*GTReset',
		0,
		@round,
		getdate()
	)

	delete from TB_GT_PLAYER where GTCOUNT=@gtcount
GO
/****** Object:  StoredProcedure [dbo].[MP_CHALLENGEZONE_ENTER_LoadInfo]    Script Date: 07/30/2013 14:52:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 챌린지 존 입장 정보 읽기
CREATE   PROC [dbo].[MP_CHALLENGEZONE_ENTER_LoadInfo] (@PlayerID int)
as
	Set Nocount on
	Set Xact_abort on

begin
	-- 마지막 입장 날짜와 오늘 날짜를 비교해서 날짜가 다르면(하루이상이 지났으면)입장 회수를 초기화한다.
	declare @LastEnterDate smalldatetime
	set @LastEnterDate = getdate()
	select @LastEnterDate = LastEnterDate from TB_CHALLENGEZONE_ENTER with(nolock) where PlayerID = @PlayerID

	if (datediff(dd, getdate(), @LastEnterDate) != 0)
		begin
			select 0, BonusFreq
			from TB_CHALLENGEZONE_ENTER with(nolock)
			where PlayerID = @PlayerID
		end
	else
		begin
			select EnterFreq, BonusFreq
			from TB_CHALLENGEZONE_ENTER with(nolock)
			where PlayerID = @PlayerID
		end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_CHALLENGEZONE_ENTER_SaveInfo]    Script Date: 07/30/2013 14:52:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
--챌린지 존 입장  정보 저장
CREATE   PROC [dbo].[MP_CHALLENGEZONE_ENTER_SaveInfo]         	(
									@PlayerID		int,
									@EnterFreq		int,
									@BonusFreq	 	int
									)
as
	Set Nocount on
	Set Xact_abort on

begin
	-- 레코드가 생성되어 있지 않으면 Insert
	if not exists (select null from TB_CHALLENGEZONE_ENTER where PlayerID = @PlayerID)
	begin
		insert TB_CHALLENGEZONE_ENTER
			(
			PlayerID,
			EnterFreq,
			BonusFreq
			)
		values
			(
			@PlayerID,
			@EnterFreq,
			@BonusFreq
			)
	end
	-- 레코드가 생성되어 있으면 Update
	else
	begin
		update TB_CHALLENGEZONE_ENTER 
		set	PlayerID = @PlayerID, 
			EnterFreq = @EnterFreq,
			BonusFreq = @BonusFreq,
			LastEnterDate = getdate()
		 where PlayerID = @PlayerID
	end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_CHALLENGEZONE_EXP_RATE_LOAD]    Script Date: 07/30/2013 14:52:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE      PROC [dbo].[MP_CHALLENGEZONE_EXP_RATE_LOAD] 
(
	@PlayerID 	int,
	@PartnerID 	int,
	@Section 	int
)
as
	Set Nocount on
	Set Xact_abort on

begin

	if not exists (select null from TB_CHALLENGEZONE_ENTER where PlayerID = @PlayerID)
	begin
		return		
	end
	else
	begin
		declare @PlayerExpRate	smallint
		declare @PartnerExpRate	smallint
		declare @PlayerName 	varchar(16)
		declare @PartnerName 	varchar(16)
	
		set @PlayerExpRate = 0
		set @PartnerExpRate = 0
		set @PlayerName = ''
		set @PartnerName = ''
			
		-- 플레이어 경험치비율 얻기	
		select @PlayerExpRate = ExpRate 
		from TB_CHALLENGEZONE_ENTER
		where  PlayerID = @PlayerID

		-- 파트너 경험치비율 얻기
		select @PartnerExpRate = ExpRate 
		from TB_CHALLENGEZONE_ENTER
		where  PlayerID = @PartnerID	
	
		-- 플레이어 이름 얻기
		select @PlayerName = CHARACTER_NAME
		from TB_CHARACTER 
		where CHARACTER_IDX = @PlayerID
	
		-- 파트너 이름 얻기
		select @PartnerName = CHARACTER_NAME
		from TB_CHARACTER 
		where CHARACTER_IDX = @PartnerID
	
		-- 최종 정보 얻기
		select @PlayerName, @PartnerName, @PlayerExpRate, @PartnerExpRate, @Section
	end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_CHALLENGEZONE_EXP_RATE_SAVE]    Script Date: 07/30/2013 14:52:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE      PROC [dbo].[MP_CHALLENGEZONE_EXP_RATE_SAVE]
(
	@PlayerID		int,
	@ExpRate		smallint
)
as
	Set Nocount on
	Set Xact_abort on

begin

	if not exists (select null from TB_CHALLENGEZONE_ENTER where PlayerID = @PlayerID)
	begin
		insert TB_CHALLENGEZONE_ENTER
			(
			PlayerID,
			EnterFreq,
			BonusFreq,
			LastEnterDate,
			ExpRate
			)
		values
			(
			@PlayerID,
			0,
			0,
			0,
			@ExpRate
			)
	end
	-- 레코드가 생성되어 있으면 Update
	else
	begin
		update TB_CHALLENGEZONE_ENTER 
		set	ExpRate = @ExpRate
		 where PlayerID = @PlayerID
	end

end
GO
/****** Object:  StoredProcedure [dbo].[MP_GT_PLAYERINSERT]    Script Date: 07/30/2013 14:53:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 플레이어 정보를 기록한다.
CREATE  PROCEDURE [dbo].[MP_GT_PLAYERINSERT]
(
	@gtcount	smallint,
	@guildidx	int,
	@p0		int,
	@p1		int,
	@p2		int,
	@p3		int,
	@p4		int,
	@p5		int,
	@p6		int,
	@p7		int,
	@p8		int,
	@p9		int,
	@p10		int,
	@p11		int,
	@p12		int,
	@p13		int
)

AS
	Set	Nocount	On
	
	delete from TB_GT_PLAYER where (GTCOUNT=@gtcount and GUILD_IDX=@guildidx)

	insert TB_GT_PLAYER
	(
		GTCOUNT,
		GUILD_IDX,
		PLAYER0, PLAYER1, PLAYER2, PLAYER3, PLAYER4, PLAYER5, PLAYER6, 
		PLAYER7, PLAYER8, PLAYER9, PLAYER10, PLAYER11, PLAYER12, PLAYER13
	)
	values
	(
		@gtcount,
		@guildidx,
		@p0, @p1, @p2, @p3, @p4, @p5, @p6, 
		@p7, @p8, @p9, @p10, @p11, @p12, @p13
	)
GO
/****** Object:  StoredProcedure [dbo].[MP_GT_PLAYERLOAD]    Script Date: 07/30/2013 14:53:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 플레이어 정보를 읽어온다.
CREATE  PROCEDURE [dbo].[MP_GT_PLAYERLOAD]
(
	@getcount	smallint,
	@guildidx	int
)
AS
	set nocount on
	set xact_abort on

select *
 from TB_GT_PLAYER where GUILD_IDX=@guildidx and GTCOUNT=@getcount
GO
/****** Object:  StoredProcedure [dbo].[MP_GT_TrInfoUpdate]    Script Date: 07/30/2013 14:53:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE       proc [dbo].[MP_GT_TrInfoUpdate]
(
	@Tournament_Idx		int,
	@Process		tinyint,
	@Wait_Time		int
)
as
	set nocount on
	set xact_abort on


	update TB_GT_RANKING 
	set	Tournament_Idx = @Tournament_Idx,		-- 토너먼트 횟수
		Guild_Position = @Tournament_Idx,			-- 토너먼트 횟수
		Guild_Process = @Process,			-- 진행상황
		Wait_Time = @Wait_Time
	 where Guild_idx = 0
GO
/****** Object:  StoredProcedure [dbo].[MP_GT_Insert]    Script Date: 07/30/2013 14:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_GT_Insert]
(
	@Guild_Idx	int,
	@Guild_Name	varchar(20),
	@Guild_Position	int
)
as
	set nocount on
	set xact_abort on

	declare @Count	int
	select @Count = Tournament_Idx from TB_GT_RANKING where Guild_Idx = 0

	insert TB_GT_RANKING
	(
		Tournament_Idx,
		Guild_Idx,
		Guild_Name,
		Guild_Position,
		Guild_Ranking,
		Guild_Process,
		Wait_Time,
		Regist_Date		
	)
	values
	(
		@Count,
		@Guild_Idx,
		@Guild_Name,
		@Guild_Position,
		32,
		0,
		0,
		getdate()
	)
GO
/****** Object:  StoredProcedure [dbo].[MP_GT_LoadAll]    Script Date: 07/30/2013 14:53:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE          proc [dbo].[MP_GT_LoadAll]
as
	set nocount on
	set xact_abort on

	declare @Count	int
	select @Count = Tournament_Idx from TB_GT_RANKING where Guild_Idx = 0

	if( @Count = NULL )
	begin
		insert TB_GT_RANKING (Tournament_Idx, Guild_Idx, Guild_Name, Guild_Position, Guild_Ranking, Guild_Process, Wait_Time, Regist_Date)
		values ( 1, 0, '', 1, 0, 0, 0, getdate() )
		select 0, 1, 0, 0, 0
	end
	else
	begin
		select Guild_Idx, Guild_Position, Guild_Ranking, Guild_Process, Wait_Time from TB_GT_RANKING 
		where Tournament_Idx = @Count
	end
GO
/****** Object:  StoredProcedure [dbo].[MP_GT_Update]    Script Date: 07/30/2013 14:53:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE    proc [dbo].[MP_GT_Update]
(
	@Guild_Idx	int,
	@Guild_Ranking	tinyint,
	@Guild_Process	tinyint
)
as
	set nocount on
	set xact_abort on

	declare @Count	int
	select @Count = Tournament_Idx from TB_GT_RANKING where Guild_Idx = 0

	update TB_GT_RANKING 
	set
		Guild_Ranking = @Guild_Ranking,
		Guild_Process = @Guild_Process,
		Regist_Date = getdate()
	 where Tournament_Idx = @Count and Guild_Idx = @Guild_Idx
GO
/****** Object:  StoredProcedure [dbo].[MP_GT_Delete]    Script Date: 07/30/2013 14:53:08 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE   proc [dbo].[MP_GT_Delete]
(
	@Guild_Idx	int
)
as
	set nocount on
	set xact_abort on

	declare @Count	int
	select @Count = Tournament_Idx from TB_GT_RANKING where Guild_Idx = 0

	delete TB_GT_RANKING where Tournament_Idx = @Count and Guild_Idx = @Guild_Idx
GO
/****** Object:  StoredProcedure [dbo].[MP_MOVE_RECALL_DATA_SELECT]    Script Date: 07/30/2013 14:53:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
081031 LUJ, DB에서 정보를 가져와야하는 리콜에 사용된다
*/
CREATE   proc [dbo].[MP_MOVE_RECALL_DATA_SELECT]
(
	@GUILD_IDX	INT,
	@FAMILY_IDX	INT
)
as
	SET NOCOUNT ON

	DECLARE @GUILD_SCORE FLOAT
	DECLARE @FAMILY_POINT	INT

	SELECT	@GUILD_SCORE = SCORE
	FROM	TB_GUILD
	WHERE	GUILDIDX = @GUILD_IDX

	SELECT	@FAMILY_POINT = HONORPOINT
	FROM	TB_FAMILY
	WHERE	ID = @FAMILY_IDX

	SELECT	CAST( ISNULL( @GUILD_SCORE, 0 ) AS INT ),
		ISNULL( @FAMILY_POINT, 0 )

	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_SearchGuildInfo]    Script Date: 07/30/2013 14:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     proc [dbo].[TP_SearchGuildInfo]
(
		@GuildName	varchar(17)
)
as
	Set Nocount On
	
	declare	@GuildIdx	int

	select @GuildIdx = GuildIdx from tb_guild where GuildName = @GuildName

	if( @GuildIdx = 0 )
		begin
			select 0
			return
		end
	else
		begin
			select	GuildIdx, GuildName, MasterIdx, MasterName, GuildLevel, Location, UnionIdx, GuildMoney,
				convert(varchar(5),year(CreateDate)) +'-'+ convert(varchar(3), month(CreateDate)) +'-'+ convert(varchar(3), day(CreateDate)),
				convert(varchar(17), CreateDate, 108)
			from TB_GUILD where GuildIdx = @GuildIdx
		end
GO
/****** Object:  StoredProcedure [dbo].[MP_SKILL_CHECK_USABLE]    Script Date: 07/30/2013 14:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080602 LUJ, 蝶鑒 嫦翕 衛 模? 褻勒擊 醱褶?朝雖 匐餌??
		?楠燮暮擊 餌辨?罹 褻勒 ? ?睡陛 褒??賊 煤寥?堅, ?舒 ?奢? ?辦?虜 醴???
100825 LUJ, 翕晦?陛 ?蹂?雖 彊擎 薑爾朝 憮??憮 霜? ?葬?紫煙 ??
*/
CREATE    PROC [dbo].[MP_SKILL_CHECK_USABLE]
(
	@CHAR_IDX INT,
	@SKILL_IDX INT,
	@NEEDED_FAMILY_POINT INT,
	@NEEDED_GUILD_SCORE	FLOAT
)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON

	BEGIN TRANSACTION
	
	-- 080602 LUJ, ?塵葬 ?檣? 匐餌
	IF 0 < @NEEDED_FAMILY_POINT
	BEGIN
		UPDATE TB_FAMILY
		SET	HONORPOINT = HONORPOINT - @NEEDED_FAMILY_POINT
		WHERE	HONORPOINT >= @NEEDED_FAMILY_POINT AND
			ID IN
			(
				-- 080602 LUJ, 輿曖! CHARACTER_FAMILYIDX朝 餌辨腎雖 彊朝?				
				SELECT	FAMILYID
				FROM	TB_FAMILY_MEMBER M INNER JOIN TB_CHARACTER C
					ON M.MEMBERID = C.CHARACTER_IDX
				WHERE	C.CHARACTER_IDX = @CHAR_IDX
			)

		IF @@ROWCOUNT = 0
		BEGIN
			GOTO FAILURE
		END
	END

	-- 080602 LUJ, 望萄 ?檣? 匐餌
	IF 0 < @NEEDED_GUILD_SCORE
	BEGIN
		UPDATE TB_GUILD
		SET	SCORE = SCORE - @NEEDED_GUILD_SCORE
		WHERE	SCORE >= @NEEDED_GUILD_SCORE AND
			GUILDIDX IN
			(
				SELECT CHARACTER_MUNPAIDX
				FROM	TB_CHARACTER
				WHERE	CHARACTER_IDX = @CHAR_IDX
			)

		IF @@ROWCOUNT = 0
		BEGIN
			GOTO FAILURE
		END
	END

	COMMIT

	SELECT @CHAR_IDX, @SKILL_IDX
	RETURN	

	-- 080602 LUJ, 機等檜? 褒? ?葬
FAILURE:
	ROLLBACK

	SELECT @CHAR_IDX, 0
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_SearchGuild]    Script Date: 07/30/2013 14:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    proc [dbo].[TP_SearchGuild]
(
		@StartIdx	int
)
as
	Set Nocount On

	select top 100	GuildIdx, GuildName, MasterIdx, MasterName, GuildLevel, Location, UnionIdx, GuildMoney,
			convert(varchar(5),year(CreateDate)) +'-'+ convert(varchar(3), month(CreateDate)) +'-'+ convert(varchar(3), day(CreateDate)),
			convert(varchar(17), CreateDate, 108)
	from TB_GUILD
	where GuildIdx > @StartIdx
	order by GuildIdx asc
GO
/****** Object:  StoredProcedure [dbo].[MP_ITEM_MoveUpdateMunpa]    Script Date: 07/30/2013 14:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080410 LUJ, 영역 정보가 바뀌어도 관계없도록 인자로 받도록 함
*/
CREATE proc [dbo].[MP_ITEM_MoveUpdateMunpa] -- 문파로 이동하는 아이템. 인벤 ->문파 , 문파->문파
(
		@CharacterIDX 	int
	,	@MunpaIDX	int
	,	@FromIdx	int
	,	@FromPos	int
	,	@ToIdx		int
	,	@ToPos		int
	,	@BEGIN_INVEN_POS	INT
	,	@END_INVEN_POS		INT
)
as
	Set Nocount on
	Set Xact_Abort on

	update TB_ITEM 
	set ITEM_POSITION = @FromPos,  CHARACTER_IDX  = 0 ,  ITEM_MUNPAIDX = @MunpaIDX, ITEM_PYOGUKIDX = 0,
		ITEM_QPOSITION= 0
	where  ITEM_DBIDX = @FromIdx

	--인벤토리로 가면 캐릭터 인덱스를 셋팅
	if( @ToPos BETWEEN @BEGIN_INVEN_POS AND @END_INVEN_POS ) 
		update TB_ITEM set ITEM_POSITION = @ToPos, character_idx = @CharacterIDX, item_pyogukidx = 0, item_munpaidx = 0 where  ITEM_DBIDX = @ToIdx
	-- 문파면 문파 인덱스를 셋팅
	else 
		update TB_ITEM set ITEM_POSITION = @ToPos, item_qposition = 0, character_idx = 0,  item_pyogukidx = 0, item_munpaidx =  @MunpaIDX where  ITEM_DBIDX = @ToIdx

	RETURN

/*
-- 080410 LUJ, 이전 코드
ALTER proc dbo.MP_ITEM_MoveUpdateMunpa -- 문파로 이동하는 아이템. 인벤 ->문파 , 문파->문파
(
		@CharacterIDX 	int
	,	@MunpaIDX	int
	,	@FromIdx	int
	,	@FromPos	int
	,	@ToIdx		int
	,	@ToPos		int
)

as

	Set Nocount on
	Set Xact_Abort on

update TB_ITEM 
set ITEM_POSITION = @FromPos,  CHARACTER_IDX  = 0 ,  ITEM_MUNPAIDX = @MunpaIDX, ITEM_PYOGUKIDX = 0,
	ITEM_QPOSITION= 0
where  ITEM_DBIDX = @FromIdx

if ( @ToIdx != 0 ) -- 자동자리바꿀 때 
begin
	if( 0 <= @ToPos and @ToPos < 90 ) --인벤토리로 가면 캐릭터 인덱스를 셋팅
		update TB_ITEM set ITEM_POSITION = @ToPos, character_idx = @CharacterIDX, item_pyogukidx = 0, item_munpaidx = 0 where  ITEM_DBIDX = @ToIdx
	else -- 문파면 문파 인덱스를 셋팅
		update TB_ITEM set ITEM_POSITION = @ToPos, item_qposition = 0, character_idx = 0,  item_pyogukidx = 0, item_munpaidx =  @MunpaIDX where  ITEM_DBIDX = @ToIdx
end
*/

SELECT *
FROM TB_GUILD
WHERE GUILDNAME = '길드도'
GO
/****** Object:  StoredProcedure [dbo].[MP_FAMILY_MEMBER_LoadExInfo01]    Script Date: 07/30/2013 14:52:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE              proc [dbo].[MP_FAMILY_MEMBER_LoadExInfo01]
(
	@CHARACTER_IDX int
)

as
	Set Nocount on
	Set Xact_Abort on

	declare	@GuildIDX int
	declare @GuildName varchar(16)

	set @GuildIDX = 0
	set @GuildName = ''

	select		
			@GuildIDX = CHARACTER_MUNPAIDX
			from TB_CHARACTER where CHARACTER_IDX = @CHARACTER_IDX
	select 
			@GuildName = GuildName
			from TB_GUILD where GuildIdx = @GuildIDX

	select
			CHARACTER_IDX
		,	CHARACTER_NAME
		,	CHARACTER_STAGE
		,	CHARACTER_GENDER
		,	CHARACTER_JOB
		,	CHARACTER_JOB1
		,	CHARACTER_JOB2
		,	CHARACTER_JOB3
		,	CHARACTER_JOB4
		,	CHARACTER_JOB5
		,	CHARACTER_JOB6
		,	CHARACTER_GRADE
		,	@GuildName
			from TB_CHARACTER where CHARACTER_IDX = @CHARACTER_IDX
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_ADD_SCORE]    Script Date: 07/30/2013 14:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MP_GUILD_ADD_SCORE]
(
	@GUILD_IDX	INT,
	@ADD_SCORE	FLOAT
)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @OLD_SCORE FLOAT
	
	SELECT  @OLD_SCORE = SCORE
	FROM    TB_GUILD
	WHERE   (GuildIdx = @GUILD_IDX)
	
	DECLARE @NEW_SCORE FLOAT
	SET @NEW_SCORE = @OLD_SCORE + @ADD_SCORE 
	
	-- 5백만 점 이상 누적시키지 않는다
	IF 5000000 < @NEW_SCORE
	BEGIN
		SET @NEW_SCORE = 5000000
	END
	
	UPDATE  TB_GUILD
	SET     SCORE = @NEW_SCORE
	WHERE   (GuildIdx = @GUILD_IDX)
	
	SELECT CAST( @NEW_SCORE AS INT )
	
	RETURN	
	
	DELETE FROM TB_SKILL WHERE CHARACTER_IDX = 675
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_ADD_SKILL]    Script Date: 07/30/2013 14:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080417 LUJ, 길드 스킬 획득
*/
CREATE PROCEDURE [dbo].[MP_GUILD_ADD_SKILL]
(
	@GUILD_IDX		INT,
	-- 080417 LUJ, 스킬 습득에 필요한 길드 포인트
	@NEEDED_SCORE	FLOAT,
	@NEEDED_MONEY	INT,
	@SKILL_IDX		INT,
	@SKILL_LEVEL	INT
)
AS
	SET NOCOUNT ON
	
	-- 080417 LUJ, 포인트 갱신
	BEGIN
		UPDATE	TB_GUILD
		SET		SCORE = SCORE - @NEEDED_SCORE
		WHERE	GUILDIDX = @GUILD_IDX AND SCORE > @NEEDED_SCORE
		
		IF 0 = @@ROWCOUNT
		BEGIN
			SELECT 0
			RETURN
		END
	END
	
	-- 080417 LUJ, 길드 스킬 갱신
	BEGIN
		UPDATE	TB_GUILD_SKILL
		SET		SKILL_LEVEL = @SKILL_LEVEL
		WHERE	GUILD_IDX = @GUILD_IDX AND SKILL_IDX = @SKILL_IDX
		
		IF 0 = @@ROWCOUNT
		BEGIN
			INSERT	TB_GUILD_SKILL
					( GUILD_IDX, SKILL_IDX, SKILL_LEVEL )
			VALUES	( @GUILD_IDX, @SKILL_IDX, @SKILL_LEVEL )
		END
	END
	
	-- 080417 LUJ, 결과 반환.
	--				주의! 실수로 반환할 경우 메모리 영역 침범이 발생할 수 있음.
	--				실수로 반환할 경우에는 자리수가 너무 커지지 않도록 할 것
	SELECT	@SKILL_IDX, @SKILL_LEVEL, @NEEDED_MONEY, CAST( SCORE AS INT )
	FROM	TB_GUILD
	WHERE	GUILDIDX = @GUILD_IDX
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_BreakUp]    Script Date: 07/30/2013 14:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080417 LUJ, 길드 해산 때 보유한 길드 스킬을 삭제한다
*/
CREATE PROC [dbo].[MP_GUILD_BreakUp]
(
		@GuildIdx	int
)
AS	
	Set Nocount on
	Set Xact_Abort on

	declare @masteridx int


select @masteridx = MasterIdx 
from tb_guild  with(nolock)
where GuildIdx = @GuildIdx

update tb_character
set 	character_munpaidx = 0,
	character_munpaname = '',
	character_munpajikchek = 0,
	character_munpamarkidx = 0,
	character_nickname = ''
where character_munpaidx = @GuildIdx

update tb_character
set 	character_munpacanentrydate = getdate() + 7
where character_idx = @masteridx

delete tb_guild
where GuildIdx = @GuildIdx

delete tb_guildmark
where GuildIdx = @GuildIdx

delete tb_item
where item_munpaidx = @GuildIdx

-- 080417 LUJ, 길드 스킬 삭제
DELETE TB_GUILD_SKILL WHERE GUILD_IDX = @GuildIdx

select @GuildIdx ,  convert(varchar(30), getdate() + 7, 102)
RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_AddMember]    Script Date: 07/30/2013 14:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071212 웅주, 가입 시점에 문파 가입일을 갱신하도록 함
*/
CREATE PROC [dbo].[MP_GUILD_AddMember]
(
		@GuildIdx	int,
		@CharacterIdx	int,
		@GuildName	varchar(40),
		@Rank		int
)
AS	
	Set Nocount on
	Set Xact_Abort on

	declare @markname int 
	set @markname  = 0
if ( select character_munpaidx from tb_character where character_idx = @CharacterIdx ) > 0
begin
	return
end

else if not exists ( select * from tb_guild with(nolock) where guildidx = @GuildIdx )
begin
	return
end

select @markname = markidx from tb_guildmark where guildidx = @GuildIdx

update tb_character
set 	character_munpaidx = @GuildIdx,
	character_munpaname = @GuildName,
	character_munpajikchek = @Rank,
	character_munpamarkidx = @markname,
	CHARACTER_MUNPAENTRYDATE = GETDATE()
where character_idx = @CharacterIdx

SELECT @GuildIdx

RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_CHANGE_MASTER]    Script Date: 07/30/2013 14:53:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MP_GUILD_CHANGE_MASTER]
(
	@GUILD_IDX			INT,
	@CHAR_IDX			INT,	
	@MASTER_RANK		TINYINT,
	@EX_MASTER_RANK		TINYINT
)
AS
	SET NOCOUNT ON
	
	DECLARE @EX_MASTER_IDX INT
	
	SET @EX_MASTER_IDX = (	SELECT   MasterIdx
							FROM      TB_GUILD
							WHERE   (GuildIdx = @GUILD_IDX ) )
	
	-- 차고 접속 중에는 불가능
	IF EXISTS ( SELECT  *
				FROM      TB_GUILD
				WHERE   (ACCESS_CHAR_IDX = @EX_MASTER_IDX) )
	BEGIN
		SELECT 0
		RETURN
	END
	
	BEGIN TRANSACTION

	-- 이전 마스터의 랭크를 바꾸고	
	UPDATE  TB_CHARACTER
	SET     CHARACTER_MUNPAJIKCHEK = @EX_MASTER_RANK
	WHERE   CHARACTER_IDX = @EX_MASTER_IDX
	
	IF @@ROWCOUNT = 0
	BEGIN
		ROLLBACK
		SELECT 0
		RETURN
	END
	
	-- 직책 정보 수정
	UPDATE  TB_CHARACTER
	SET     CHARACTER_MUNPAJIKCHEK = @MASTER_RANK
	WHERE   (CHARACTER_IDX = @CHAR_IDX) AND (CHARACTER_MUNPAIDX = @GUILD_IDX)
	
	IF @@ROWCOUNT = 0
	BEGIN
		ROLLBACK
		SELECT 0
		RETURN
	END
	
	-- 마스터로 변경
	UPDATE  TB_GUILD
	SET     MasterIdx = @CHAR_IDX, MasterName = (
		SELECT   CHARACTER_NAME
		FROM      TB_CHARACTER
		WHERE   (CHARACTER_IDX = @CHAR_IDX) )
	WHERE   (GuildIdx = @GUILD_IDX)
	
	IF @@ROWCOUNT = 0
	BEGIN
		ROLLBACK
		SELECT 0
		RETURN
	END
	
	COMMIT
	
	SELECT @CHAR_IDX	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_ChangeLocation]    Script Date: 07/30/2013 14:53:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	proc [dbo].[MP_GUILD_ChangeLocation]
(  
	@GuildIdx	int,
	@MapNum	int
)  
as  
	set nocount on  

	update TB_GUILD set Location = @MapNum where GuildIdx = @GuildIdx
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_LOAD]    Script Date: 07/30/2013 14:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
081006 LUJ, 플레이어가 관련된 길드(소속/적/연합) 정보를 읽는다
081013 LUJ, 연합, 길드전 중이 아닐 경우 소속 길드 정보를 읽지 못하는 문제 수정
081016 LUJ, QUERY 타입으로 변경. 100개 쿼리 가능
*/
CREATE        PROC [dbo].[MP_GUILD_LOAD]
(
	@GUILD_IDX	INT
)
AS	
	DECLARE @UNION_IDX INT
	SELECT @UNION_IDX = UNIONIDX
	FROM	TB_GUILD WITH(NOLOCK)
	WHERE	GUILDIDX = @GUILD_IDX

	-- 081013 LUJ, 자신의 길드 정보를 읽는다
	-- 081016 LUJ, QUERY 타입으로 변경. 100개 쿼리 가능
	SELECT	TOP 100
		GUILDIDX, 
		GUILDLEVEL, 
		GUILDNAME,
		MASTERIDX, 
		MASTERNAME, 
		UNIONIDX, 
		MARKNAME,
		UNIONENTRYDATE
	FROM	TB_GUILD WITH(NOLOCK)
	WHERE	GUILDIDX = @GUILD_IDX
	UNION
	-- 081013 LUJ, 길드전 중인 길드 정보를 읽는다
	SELECT	DISTINCT
		GUILDIDX, 
		GUILDLEVEL, 
		GUILDNAME,
		MASTERIDX, 
		MASTERNAME, 
		UNIONIDX, 
		MARKNAME,
		UNIONENTRYDATE
	FROM    TB_GUILD G WITH (NOLOCK) INNER JOIN TB_GUILDFIELDWAR F WITH (NOLOCK)
		ON ( G.GUILDIDX = F.GUILDIDX1 OR G.GUILDIDX = F.GUILDIDX2  )
	WHERE	( ( F.GUILDIDX1 = @GUILD_IDX OR F.GUILDIDX2 = @GUILD_IDX ) AND ( G.GUILDIDX <> @GUILD_IDX ) )
	UNION
	-- 081013 LUJ, 연합에 가입된 길드 정보를 읽는다
	SELECT	DISTINCT
		GUILDIDX, 
		GUILDLEVEL, 
		GUILDNAME,
		G.MASTERIDX, 
		MASTERNAME, 
		UNIONIDX, 
		MARKNAME,
		UNIONENTRYDATE
	FROM	TB_GUILD G WITH (NOLOCK) INNER JOIN TB_GUILDUNION U WITH (NOLOCK)
		ON ( 	G.GUILDIDX = U.GUILDIDX0 OR
			G.GUILDIDX = U.GUILDIDX1 OR
			G.GUILDIDX = U.GUILDIDX2 OR
			G.GUILDIDX = U.GUILDIDX3 OR
			G.GUILDIDX = U.GUILDIDX4 OR
			G.GUILDIDX = U.GUILDIDX5 OR
			G.GUILDIDX = U.GUILDIDX6  )
	WHERE	U.GUILDUNIONIDX = @UNION_IDX

	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_LoadGuild]    Script Date: 07/30/2013 14:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROC [dbo].[MP_GUILD_LoadGuild]
(
		@StartGuildIdx		int
)
AS	
	Set Nocount on
	Set Xact_Abort on

	/*
	select top 100
			MasterName,
			GuildName,			
			GuildIdx,
			MasterIdx,
			GuildLevel,
			Location,
			UnionIdx,
			GuildMoney,
			MarkName,
			POINT,
			UnionEntryDate
	from	tb_guild
	where	guildIdx > @StartGuildIdx
	*/
	
	SELECT   top 100
				GuildIdx, 
				MasterIdx, 
				MasterName, 
				GuildName,
				GuildLevel, 
				Location, UnionIdx, 
	            GuildMoney,
	            MarkName,
	            UnionEntryDate
	FROM      TB_GUILD
	where	guildIdx > @StartGuildIdx
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_LoadItem]    Script Date: 07/30/2013 14:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE           proc [dbo].[MP_GUILD_LoadItem] 
(
@MapNum int,
@StartItemDBIDX int
) 
as
	Set Nocount on
		
--	select top 100 A.ITEM_MUNPAIDX, A.ITEM_DBIDX, A.ITEM_IDX, A.ITEM_POSITION, A.ITEM_DURABILITY, A.ITEM_RAREIDX 
--	from  TB_ITEM A  with(readuncommitted) 
--	inner JOIN TB_GUILD B with(readuncommitted) on A.item_munpaidx = B.GUILDIDX
--	where A.ITEM_DBIDX > @StartItemDBIDX and B.location = @MapNum and A.item_munpaidx >0
--	order by A.ITEM_DBIDX 

	declare @selidx int
	declare @selstring varchar(7000)
	set @selstring = ''
	declare @sql varchar(8000)
	declare @rownum int
	select @rownum = count(*) from TB_GUILD where Location = @MapNum
	set @rownum = isnull(@rownum, 0)

	if @rownum=0
	begin
		select top 1 ITEM_MUNPAIDX, ITEM_DBIDX, ITEM_IDX, ITEM_POSITION, ITEM_DURABILITY, ITEM_RAREIDX 
		from TB_ITEM where 1=2
	end
	else
	begin
		declare cur_idx cursor fast_forward for
		select GUILDIDX from TB_GUILD where Location = @MapNum
		
		open cur_idx
		fetch next from cur_idx into @selidx
		while @@fetch_status = 0
		begin
			set @selstring = @selstring +cast(@selidx as varchar(10)) + ','
			fetch next from cur_idx into @selidx
		end
		close cur_idx

		deallocate cur_idx

		set @selstring = substring(@selstring, 1, len(@selstring)-1)
		set @sql = 'select top 100 ITEM_MUNPAIDX, ITEM_DBIDX, ITEM_IDX, ITEM_POSITION, ITEM_DURABILITY, ITEM_RAREIDX 
			   from TB_ITEM with(nolock) where ITEM_DBIDX >'+cast(@StartItemDBIDX as varchar(20))+' and item_munpaidx in ('+@selstring+') order by ITEM_DBIDX'
		exec (@sql)
	end
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_ChangeRank]    Script Date: 07/30/2013 14:53:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MP_GUILD_ChangeRank]
(
		@GuildIdx	int,
		@CharacterIdx	int,
		@Rank		int
)
AS	
	Set Nocount on
	Set Xact_Abort on

if not exists ( select * from tb_guild with(nolock) where guildidx = @GuildIdx )
begin
	return
end

-- 관리자 수 검사? 

update tb_character
set
	character_munpajikchek = @Rank
where	character_idx = @CharacterIdx and
		character_munpaidx = @GuildIdx




RETURN

SELECT *
FROM TB_CHARACTER
WHERE CHARACTER_NAME = '웅주님하'

SELECT *
FROM TB_ITEM
WHERE ITEM_PYOGUKIDX = 156
ORDER BY ITEM_POSITION

UPDATE  TB_ITEM
SET         ITEM_IDX = 21000001, ITEM_DURABILITY = 1, 
                ITEM_ENDTIME = '2008-02-12 19:15:40.243'
WHERE   (ITEM_DBIDX = 24024269)
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_CREATE2]    Script Date: 07/30/2013 14:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
070808 웅주, 길드를 생성한다. 레벨에 따른 길드 창고 추가와 창고 접근 권한 부여로 인해
			필드가 추가되었다.
*/
CREATE PROCEDURE [dbo].[MP_GUILD_CREATE2]
(
	@CHAR_IDX		INT,
	@CHAR_NAME		VARCHAR( 16 ),
	@USER_LEVEL		TINYINT,
	@GUILD_NAME		VARCHAR( 16 ),
	@INTRO			VARCHAR( 100 ),
	@LOCATION		TINYINT,
	@MASTER_RANK	TINYINT			-- 길드 내에서의 직위(플레이어 레벨이 아님!)
)
AS
	SET NOCOUNT ON
	SET	XACT_ABORT ON

	-- 중복 이름 체크	
	IF EXISTS ( SELECT * FROM TB_GUILD WHERE GuildName = @GUILD_NAME )
	BEGIN
		SELECT 0
		RETURN
	END	

	INSERT TB_GUILD
	(
		MASTERIDX,
		MASTERNAME,
		GUILDNAME,
		INTRO,
		GUILDLEVEL,
		LOCATION,
		SCORE,
		LAST_QUEST,
		WAREHOUSE_SIZE,
		WAREHOUSE_RANK
	)
	VALUES
	(
		@CHAR_IDX,
		@CHAR_NAME,
		@GUILD_NAME,
		@INTRO,
		1,
		@LOCATION,
		0,
		0,
		0,
		@MASTER_RANK
	)
	
	UPDATE	TB_CHARACTER 
	SET		CHARACTER_MUNPAIDX		= @@IDENTITY,
			CHARACTER_MUNPAJIKCHEK	= @MASTER_RANK,
			CHARACTER_MUNPANAME		= @GUILD_NAME
	WHERE	CHARACTER_IDX = @CHAR_IDX

	SELECT	@@IDENTITY, @LOCATION, @GUILD_NAME, @CHAR_NAME, @USER_LEVEL
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_Create]    Script Date: 07/30/2013 14:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MP_GUILD_Create]
(
		@CharacterIdx		int
	,	@CharacterName	varchar(16)
	,	@CharacterGrade	int
	,	@GuildName		varchar(20)
	,	@Intro			varchar(50)
	,	@Location		tinyint
	,	@GuildLevel		tinyint
)
AS	
	Set Nocount on
	Set Xact_Abort on

if exists ( select * from tb_guild where GuildName like @GuildName )
begin
	select 1
	return
end
	
else if ( select Character_munpaidx from tb_character with(nolock) where character_idx = @CharacterIdx ) > 0
begin
	select 2
	return
end

else if exists ( select * from tb_guild where masteridx = @CharacterIdx ) 
begin
	select 3
	return
end

else if exists ( select * from tb_character where character_name = @GuildName )
begin
	select 4
	return
end

else
begin
	insert tb_guild
	(
	MasterIdx,
	MasterName,
	GuildName,
	Intro,
	GuildLevel,
	Location	
	)
	values
	(
	@CharacterIdx,
	@CharacterName,
	@GuildName,
	@Intro,
	@GuildLevel,
	@Location					
	)
	update tb_character 
	set	character_munpaidx = @@identity,
		character_munpajikchek = 50,
		character_munpaname = @GuildName
	where character_idx = @CharacterIdx

	select 0, @@identity, @GuildName, @Location, @CharacterName, @CharacterGrade
end

RETURN

DECLARE @CONSTRAINT SYSNAME
SELECT @CONSTRAINT = object_name(cdefault) 
FROM   syscolumns 
WHERE  id = object_id('TB_GUILD') 
AND  name = 'CREATEDATE'
  
EXEC ('ALTER TABLE TB_GUILD DROP CONSTRAINT ' + @CONSTRAINT )

ALTER TABLE TB_GUILD
ADD DEFAULT GETDATE() FOR CREATEDATE
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_DeleteMember]    Script Date: 07/30/2013 14:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071205 웅주, 기획팀(정진문) 요청으로 길드 재가입 시점을 기존 2일에서 1일로 단축
071213 웅주, 재가입 시점 처리가 정상이 아니었음. 다시 수정
*/
CREATE PROC [dbo].[MP_GUILD_DeleteMember]
(
	@GuildIdx		int,
	@CharacterIdx	int
)
AS	
	Set Nocount on
	Set Xact_Abort on
	declare @masteridx int

select @masteridx = MasterIdx from tb_guild with(nolock)  where GuildIdx = @GuildIdx

if not exists ( select * from tb_guild with(nolock) where guildidx = @GuildIdx )
begin
	select 0 , @masteridx
	return 
end

DECLARE @NEXT_ENTRY_DATE SMALLDATETIME
SET @NEXT_ENTRY_DATE = GETDATE() + 1

update tb_character
set
	character_munpaidx = 0,
	character_munpaname = '',
	character_munpajikchek = 0,
	character_munpamarkidx = 0,
	--character_munpacanentrydate = getdate() + 2,
	character_munpacanentrydate = @NEXT_ENTRY_DATE,
	character_nickname = ''
where character_idx = @CharacterIdx AND
	character_munpaidx = @GuildIdx
	
IF 0 < @@ROWCOUNT
BEGIN
	select @CharacterIdx , convert(varchar(30), @NEXT_ENTRY_DATE, 102)	
END

select  0, @masteridx

RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_LEVEL_UPDATE]    Script Date: 07/30/2013 14:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MP_GUILD_LEVEL_UPDATE]
(
	@GUILD_IDX		INT,
	@CHAR_IDX		INT,
	@REQUIRED_MONEY	INT,
	@REQUIRED_SCORE	FLOAT,
	@REQUIRED_QUEST	INT,
	@WAREHOUSE_SIZE	SMALLINT
)
AS
SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @PREV_LEVEL INT
	
	SELECT	@PREV_LEVEL = GuildLevel
	FROM	TB_GUILD
	WHERE	GuildIdx = @GUILD_IDX
	
	UPDATE  TB_GUILD
	SET     SCORE = SCORE - @REQUIRED_SCORE,
			GuildLevel = @PREV_LEVEL + 1,
			WAREHOUSE_SIZE = @WAREHOUSE_SIZE
	WHERE   (GuildIdx = @GUILD_IDX) AND
			(LAST_QUEST = @REQUIRED_QUEST) AND 
			(MasterIdx = @CHAR_IDX) AND
			(SCORE >= @REQUIRED_SCORE )
	
	SELECT   GuildIdx, CAST( SCORE AS INT ), @REQUIRED_MONEY, @REQUIRED_SCORE, GuildLevel
	FROM      TB_GUILD
	WHERE   (GuildIdx = @GUILD_IDX) AND
			(@PREV_LEVEL <> GuildLevel) AND
			(@PREV_LEVEL IS NOT NULL )

 	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_CharacterRecover]    Script Date: 07/30/2013 14:55:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071211 웅주, 이 프로시저는 올리지 말 것! 올릴 경우 꼭 팀장과 상의할 것
테스트 서버는 MHCMEMBER가 아닌 개별적인 DB 이름을 정해야해기 때문
*/
CREATE PROC [dbo].[TP_CharacterRecover]
(
	@CHAR_IDX	INT
,	@CHAR_NAME	VARCHAR(16)
,	@IP			VARCHAR(16)
,	@SERVERNO	INT


)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @MAX_CHAR_SIZE	INT
	SET @MAX_CHAR_SIZE = 5
	
	
	DECLARE @USER_IDX 	INT
	SELECT @USER_IDX = USER_IDX FROM TB_CHARACTER  WITH(NOLOCK) WHERE CHARACTER_IDX = @CHAR_IDX

	IF( @USER_IDX = 0 OR @CHAR_NAME IS NULL )
	BEGIN
		SELECT 1
		RETURN
	END
	ELSE IF @MAX_CHAR_SIZE < ( SELECT COUNT( * ) FROM TB_CHARACTER  WITH(NOLOCK) WHERE USER_IDX = @USER_IDX AND CHARACTER_STANDINDEX < 5 )
	BEGIN
		SELECT 2		-- 캐릭터가 꽉찼음 리턴
		RETURN
	END
	ELSE IF EXISTS ( SELECT NULL FROM TB_CHARACTER  WITH(NOLOCK) WHERE CHARACTER_NAME = @CHAR_NAME )
	BEGIN
		-- 캐릭이름이 중복됨 리턴
		SELECT 3, @CHAR_IDX, @CHAR_NAME
		RETURN 		
	END
	ELSE IF EXISTS (SELECT NULL  FROM TB_GUILD WITH(NOLOCK) WHERE @CHAR_NAME = GUILDNAME )
	BEGIN
		-- 문파이름 중복
		SELECT 4, @CHAR_IDX, @CHAR_NAME
		RETURN
	END
	ELSE IF EXISTS (SELECT	NULL FROM TB_FAMILY WHERE @CHAR_NAME = NAME )
	BEGIN
		-- 패밀리이름 중복
		SELECT 5, @CHAR_IDX, @CHAR_NAME 		
		RETURN
	END	

	DECLARE @STAND_IDX	INT
	SET @STAND_IDX = 0
	
	--SELECT @STANDINDEX = COUNT(CHARACTER_IDX) FROM TB_CHARACTER WITH(NOLOCK) WHERE USER_IDX = @USER_IDX
	--SET @STAND_IDX = 0
	--IF(@STANDINDEX != 0) 
	
	BEGIN
		WHILE(@STAND_IDX < @MAX_CHAR_SIZE)
		BEGIN 
			IF EXISTS (SELECT NULL FROM TB_CHARACTER WHERE CHARACTER_STANDINDEX = @STAND_IDX AND USER_IDX = @USER_IDX)
			BEGIN
				SET @STAND_IDX = @STAND_IDX + 1
				CONTINUE
			END
			ELSE
			BEGIN
				--SET @STANDINDEX = @STAND_IDX
				BREAK
			END
		END
	END

	IF @MAX_CHAR_SIZE <= @STAND_IDX
	BEGIN
		SELECT 2
		RETURN
	END	
	UPDATE TB_CHARACTER SET CHARACTER_STANDINDEX = @STAND_IDX, CHARACTER_NAME = @CHAR_NAME WHERE CHARACTER_IDX = @CHAR_IDX

	-- 생성정보 셋팅
	UPDATE TB_CHARACTERCREATEINFO SET FLAG = 3, RECOVER_DATE = GETDATE(), RECOVER_IP = @IP
	WHERE CHARACTER_IDX = @CHAR_IDX

	SELECT 0, @CHAR_IDX, @CHAR_NAME
	
	EXEC MHCMEMBER.DBO.UP_CHARACTER_INSERT @CHAR_IDX, @USER_IDX, @CHAR_NAME, @SERVERNO

	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILDFIELDWAR_SELECT_FOR_REWARD]    Script Date: 07/30/2013 14:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071012 웅주

길드 전쟁 종전에 따른 보상 및 처벌을 하기 위해 참여한 길드 목록을 얻는다

*/
CREATE PROCEDURE [dbo].[MP_GUILDFIELDWAR_SELECT_FOR_REWARD]
(
	@WINNER_GUILD_IDX	INT,
	@WINNER_UNION_IDX	INT,
	@LOSER_GUILD_IDX	INT,
	@LOSER_UNION_IDX	INT
)
AS
	SET XACT_ABORT ON
	SET NOCOUNT ON
	
	-- 이렇게 체크하지 않으면 값이 0으로 오기 때문에 엄청난 쿼리가 발생할 것이다...
	IF 0 = @WINNER_UNION_IDX
		SET @WINNER_UNION_IDX = -1
	
	-- 이렇게 체크하지 않으면 값이 0으로 오기 때문에 엄청난 쿼리가 발생할 것이다...
	IF 0 = @LOSER_UNION_IDX
		SET @LOSER_UNION_IDX = -1
	
	DECLARE @WINNER_FLAG TINYINT
	DECLARE @LOSER_FLAG	TINYINT
		
	SET @WINNER_FLAG	= 1
	SET @LOSER_FLAG		= 0
	
	SELECT	@WINNER_FLAG AS TYPE, GuildIdx, CAST( SCORE AS INT ) AS SCORE
	FROM    TB_GUILD
	WHERE   (UnionIdx = @WINNER_UNION_IDX) OR (GuildIdx = @WINNER_GUILD_IDX)
	UNION
	SELECT  @LOSER_FLAG AS TYPE, GuildIdx, CAST( SCORE AS INT ) AS SCORE
	FROM    TB_GUILD
	WHERE   (UnionIdx = @LOSER_UNION_IDX) OR (GuildIdx = @LOSER_GUILD_IDX)
	ORDER BY TYPE
		
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_GUILD_DATA_SELECT]    Script Date: 07/30/2013 14:55:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071101 웅주, 합이 없는 경우에도 이름을 빈 문자열로 반환하기 위해 OUTER JOIN을 사용한다
*/
CREATE PROCEDURE [dbo].[TP_GUILD_DATA_SELECT]
(
	@GUILD_NAME	VARCHAR( 20 ),
	@GUILD_IDX	INT
)
AS
	SET NOCOUNT ON
	
	-- 길드 인덱스로 검색
	IF 0 < @GUILD_IDX 
	BEGIN
		SELECT  A.GuildIdx, A.GuildLevel,
				CAST( A.SCORE AS INT ) AS SCORE,
				A.GuildMoney,
				A.GuildName,
				A.CreateDate AS BUILD_DATE,
				ISNULL( B.GuildUnionName, '' ) AS UNION_NAME,
				A.UnionEntryDate
		FROM    TB_GUILD A LEFT JOIN
				TB_GuildUnion B ON B.GuildUnionIdx = A.UnionIdx
		WHERE   (A.GuildIdx = @GUILD_IDX)
	END
	-- 길드 이름으로 검색
	ELSE
	BEGIN
		SELECT  A.GuildIdx, A.GuildLevel,
				CAST( A.SCORE AS INT ) AS SCORE,
				A.GuildMoney,
				A.GuildName,
				A.CreateDate AS BUILD_DATE,
				ISNULL( B.GuildUnionName, '' ) AS UNION_NAME,
				A.UnionEntryDate
		FROM    TB_GUILD A LEFT JOIN
				TB_GuildUnion B ON B.GuildUnionIdx = A.UnionIdx
		WHERE   (A.GuildName = @GUILD_NAME)
	END
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_GUILD_DATA_UPDATE]    Script Date: 07/30/2013 14:55:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_GUILD_DATA_UPDATE]
(
	@GUILD_IDX		INT,
	@GUILD_NAME		VARCHAR( 20 ),
	@ALLIANCE_NAME	VARCHAR( 20 ),
	@LEVEL			TINYINT,
	@MONEY			BIGINT,
	@SCORE			FLOAT
)
AS
	SET NOCOUNT ON
	
	UPDATE  TB_GUILD
	SET     GuildName = @GUILD_NAME, GuildLevel = @LEVEL, GuildMoney = @MONEY, SCORE =  @SCORE
	WHERE   (GuildIdx = @GUILD_IDX)
	
	IF 0 > @@ROWCOUNT
		RETURN	
	
	UPDATE  TB_GuildUnion
	SET     GuildUnionName = @ALLIANCE_NAME
	WHERE	GuildUnionIdx	IN
	(
		SELECT   UnionIdx
		FROM      TB_GUILD
		WHERE   (GuildIdx = @GUILD_IDX)
	)
	
	IF 0 > @@ROWCOUNT
		RETURN
	ELSE
		SELECT @GUILD_IDX
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_GUILD_ENEMY_SELECT]    Script Date: 07/30/2013 14:55:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_GUILD_ENEMY_SELECT]
(
	@GUILD_IDX	INT
)
AS
	SET NOCOUNT ON
	
	/*
	SELECT  A.GuildIdx,
			A.GuildName,
			COUNT( B.CHARACTER_IDX ) AS SIZE,
			A.GuildLevel,
			B.GFWMoney
	FROM    TB_GUILDFIELDWAR AS A LEFT JOIN
			TB_CHARACTER AS B ON B.CHARACTER_MUNPAIDX = A.GuildIdx2
	WHERE	(A.GuildIdx1 = @GUILD_IDX )
	GROUP BY	A.GuildIdx,
				A.GuildName,
				A.GuildLevel
	*/
	
	SELECT	TOP 100
			B.GuildIdx2, A.GuildName, COUNT(C.CHARACTER_IDX) AS SIZE, A.GuildLevel, B.GFWMoney
	FROM    TB_GUILD A INNER JOIN
	        TB_GUILDFIELDWAR B ON A.GuildIdx = B.GuildIdx2 INNER JOIN
	        TB_CHARACTER C ON B.GuildIdx2 = C.CHARACTER_MUNPAIDX
	WHERE   (B.GuildIdx1 = @GUILD_IDX)
	GROUP BY	B.GuildIdx2,
				A.GuildName,
				A.GuildLevel,
				B.GFWMoney
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_GUILD_LIST_SELECT]    Script Date: 07/30/2013 14:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_GUILD_LIST_SELECT]
(
	@KEYWORD		VARCHAR( 20 ),
	@IS_DISMISSED	TINYINT	-- 해체된 길드만 검색할 지 여부
)
AS
	SET NOCOUNT ON
	
	SELECT  TOP 100
			A.GuildIdx,
			A.GuildName,
			COUNT( B.CHARACTER_IDX ) AS SIZE,
			A.GuildLevel
	FROM    TB_GUILD AS A LEFT JOIN
			TB_CHARACTER AS B ON B.CHARACTER_MUNPAIDX = A.GuildIdx
	WHERE	A.GuildName LIKE @KEYWORD
	GROUP BY	A.GuildIdx,
				A.GuildName,
				A.GuildLevel
				
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_GUILD_FRIENDLY_SELECT]    Script Date: 07/30/2013 14:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_GUILD_FRIENDLY_SELECT]
(
	@GUILD_IDX	INT
)
AS
	SET NOCOUNT ON
	
	DECLARE @UNION_IDX	INT
	
	SELECT	@UNION_IDX = UnionIdx
	FROM    TB_GUILD
	WHERE   (GuildIdx = @GUILD_IDX) AND (0 < UnionIdx)
	
	IF @UNION_IDX IS NULL
		RETURN
	
	SELECT  TOP 100
			A.GuildIdx,
			A.GuildName,
			COUNT( B.CHARACTER_IDX ) AS SIZE,
			A.GuildLevel
	FROM    TB_GUILD AS A INNER JOIN
			TB_CHARACTER AS B ON B.CHARACTER_MUNPAIDX = A.GuildIdx
	WHERE	(A.GuildIdx <> @GUILD_IDX ) AND (A.UnionIdx = @UNION_IDX)
	GROUP BY	A.GuildIdx,
				A.GuildName,
				A.GuildLevel
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_GUILD_RANK_UPDATE]    Script Date: 07/30/2013 14:55:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
길드 마스터가 두명 이상 등록될 경우 나중에 갱신된 회원이 길드 마스터가 된다

주의: 길드 정보는 맵 서버 모두가 메모리에 담고 있으므로, 점검 시간이 아닐때
	이 프로시저를 실행할 경우 문제가 발생할 수 있다
*/
CREATE PROCEDURE [dbo].[TP_GUILD_RANK_UPDATE]
(
	@GUILD_IDX	INT,
	@CHAR_IDX	INT,
	@RANK		TINYINT,
	@IS_MASTER	TINYINT
)
AS
	SET NOCOUNT ON
	
	DECLARE @PREV_RANK	TINYINT
	
	SELECT  @PREV_RANK = CHARACTER_MUNPAJIKCHEK
	FROM    TB_CHARACTER
	WHERE	(CHARACTER_IDX = @CHAR_IDX) AND
			(CHARACTER_MUNPAIDX = @GUILD_IDX)
		
	UPDATE	TB_CHARACTER
	SET     CHARACTER_MUNPAJIKCHEK = @RANK
	WHERE   (CHARACTER_IDX = @CHAR_IDX) AND
			(CHARACTER_MUNPAIDX = @GUILD_IDX)

	-- 갱신된 것이 없으므로 오류
	IF 0 = @@ROWCOUNT
	BEGIN
		SELECT 0
		RETURN
	END
	
	-- 길드 마스터로 변경되었으면 길드 테이블을 갱신한다
	IF 0 < @IS_MASTER
	BEGIN
		DECLARE @NAME VARCHAR( 16 )
		
		SELECT	@NAME = CHARACTER_NAME
		FROM	TB_CHARACTER
		WHERE   (CHARACTER_IDX = @CHAR_IDX)
		
		UPDATE  TB_GUILD
		SET		MasterIdx = @CHAR_IDX,
				MasterName = ISNULL( @NAME, '' )
		WHERE   (GuildIdx = @GUILD_IDX)	
		
		SELECT @CHAR_IDX, @RANK, @GUILD_IDX, @PREV_RANK
		RETURN
	END
		
	-- 이전에 길드마스터인 회원이 강등되었을 경우도 마찬가지
	IF EXISTS (
		SELECT *
		FROM	TB_GUILD
		WHERE	(MasterIdx = @CHAR_IDX ) ) AND
		( 0 = @IS_MASTER )
	BEGIN
		-- 마스터 없는 길드가 되어버린다
		UPDATE  TB_GUILD
		SET         MasterIdx = 0, MasterName = ''
		WHERE   (GuildIdx = @GUILD_IDX)
		
		SELECT @CHAR_IDX, @RANK, @GUILD_IDX, @PREV_RANK
		RETURN
	END
		
	SELECT @CHAR_IDX, @RANK, @GUILD_IDX, @PREV_RANK		
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILDFIELDWAR_CheckMoney]    Script Date: 07/30/2013 14:53:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	proc [dbo].[MP_GUILDFIELDWAR_CheckMoney]
(
	@SENDerIdx	int,
	@EnemyGuildIdx	int,
	@Money		bigint
)
as
	SET NOCOUNT ON
--	SET xact_abort on

	DECLARE @EnemyMasterIdx	int
	
	SELECT @EnemyMasterIdx = MasterIdx 
	FROM tb_guild WITH(READUNCOMMITTED) 
	WHERE GuildIdx = @EnemyGuildIdx

	DECLARE @RCurmap	int
	DECLARE @RMoney	bigint
	DECLARE @SMoney	bigint	
	SET @RCurmap = 0
	SET @RMoney = 0
	SET @SMoney = 0	

	SELECT 
	@RCurmap = character_currentmap,
	@RMoney = character_money 
	FROM tb_character WITH(READUNCOMMITTED) 
	WHERE character_idx = @EnemyMasterIdx
	
	IF( @RCurmap = 0 )
		BEGIN
			SELECT 1		-- receiver not login
			RETURN
		END
	IF( @Money > @RMoney )
		BEGIN
			SELECT 2, @EnemyMasterIdx, @RCurmap		-- receiver money not enough
			RETURN
		END

	SELECT @SMoney = character_money 
	FROM tb_character WITH(READUNCOMMITTED) 
	WHERE character_idx = @SENDerIdx

	IF( @Money > @SMoney )
		BEGIN
			SELECT 3, @EnemyMasterIdx, @RCurmap		-- sENDer money not enough
			RETURN
		END

	SELECT 0, @SENDerIdx, @EnemyGuildIdx, @Money
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILDFIELDWAR_CheckMasterLogin]    Script Date: 07/30/2013 14:53:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MP_GUILDFIELDWAR_CheckMasterLogin]
(
	@SENDerIdx	int,
	@GuildName	varchar(17),
	@Money		bigint,
	@Protocol	int
)
AS
	SET NOCOUNT ON
--	SET xact_abort on

/*
	DECLARE @Count	int
	SELECT @Count = count(*) FROM tb_guild WHERE MasterIdx = @SENDerIdx
	IF( @Count = 0 )
*/
	IF NOT EXISTS (SELECT * FROM dbo.tb_guild WHERE masteridx = @sENDeridx)
		BEGIN
			SELECT 1		-- sENDer is not master
			RETURN
		END

	DECLARE @MasterIdx	int
	DECLARE @Curmap	int
	SET @MasterIdx  = 0
	SET @Curmap = 0


	SELECT @MasterIdx = MasterIdx FROM tb_guild WHERE GuildName = @GuildName
	IF( @MasterIdx = 0 )
		BEGIN
			SELECT 2		-- IS NOT GUILD
			RETURN
		END

	IF( @SENDerIdx = @MasterIdx )
		BEGIN
			SELECT 3		-- same guild	
			RETURN
		END
/*
	IF EXISTS (SELECT * FROM tb_guild WHERE GuildName = @GuildName AND MasterIdx = @SENDerIdx)
	BEGIN 
		SELECT 3		-- same guild	
		RETURN
	END 
	ELSE 
	BEGIN 
			SELECT 2		-- is not guild
			RETURN
	END 
*/


	SELECT @Curmap = character_currentmap FROM tb_character WHERE character_idx = @MasterIdx
	IF( @Curmap = 0 )
		BEGIN
			SELECT 4		-- not login
			RETURN
		END
	ELSE
		BEGIN
			SELECT 0, @SENDerIdx, @MasterIdx, @Curmap, @Money, @Protocol
			RETURN
		END
/*
IF EXISTS (SELECT * FROM tb_character WHERE character_idx = @masteridx AND character_currentmap = 0)
	BEGIN
		SELECT 4		-- not login
		RETURN
	END
	ELSE
	BEGIN
		SELECT 0, @SENDerIdx, @MasterIdx, @Curmap, @Money, @Protocol
		RETURN
	END
*/
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_WAREHOUSE_CLOSE]    Script Date: 07/30/2013 14:53:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
070808 웅주, 길드 창고 사용을 끝낸다
*/
CREATE PROCEDURE [dbo].[MP_GUILD_WAREHOUSE_CLOSE]
(
	@GUILD_IDX	INT,
	@MAP_IDX	TINYINT,
	@CHAR_IDX	INT
)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	UPDATE  TB_GUILD
	SET     ACCESS_MAP_IDX = 0,
			ACCESS_CHAR_IDX = 0
	WHERE   (GuildIdx = @GUILD_IDX)		AND
			(ACCESS_MAP_IDX = @MAP_IDX) AND 
	        (ACCESS_CHAR_IDX = @CHAR_IDX)
	        
	IF 1 = @@ROWCOUNT
	BEGIN
		SELECT @CHAR_IDX
	END
	ELSE
	BEGIN
		SELECT 0
	END
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_SelectByCharacterIDX]    Script Date: 07/30/2013 14:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_CHARACTER_SelectByCharacterIDX]
(
	@CHARACTER_IDX int
)
as
	Set Nocount on
	Set Xact_Abort on
	
	declare @CHARACTER_SKILLPOINT int	
	select @CHARACTER_SKILLPOINT = skill_point from tb_skillpoint with( nolock ) where character_idx = @CHARACTER_IDX
	
	declare @Character_partyidx int	
	select @Character_partyidx = party_idx from tb_party with( nolock ) where character_idx = @CHARACTER_IDX

	declare @GUILD_NAME varchar( 16 )
	select @GUILD_NAME = GuildName from tb_guild with( nolock ) where guildidx in
	(
		select	character_munpaidx
		from	tb_character
		where	character_idx = @CHARACTER_IDX
	)

	-- LUJ, ?塵葬 廓? 蘭葬
	DECLARE @FAMILY_IDX INT
	DECLARE @FAMILY_NICK VARCHAR(16)
	SELECT @FAMILY_IDX = FAMILYID,
		@FAMILY_NICK = MEMBERNICKNAME
	FROM TB_FAMILY_MEMBER
	WHERE MEMBERID = @CHARACTER_IDX

	-- LUJ, 議葛攪 ?晦 蘭葬
	DECLARE @CHAR_SIZE INT
	SELECT @CHAR_SIZE = CUR_SIZE
	FROM TB_CHARSIZE
	WHERE CHARACTER_IDX = @CHARACTER_IDX

	select
			CHARACTER_IDX
		,	USER_IDX
		,	ISNULL( @Character_partyidx, 0 )
		,	CHARACTER_GENDER
		,	CHARACTER_STR
		, 	CHARACTER_LIFE
		,	CHARACTER_MANA
		,	CHARACTER_DEX
		,	CHARACTER_VIT
		,	CHARACTER_INT
		,	CHARACTER_WIS
		,	ISNULL(@FAMILY_IDX, 0)
		,	CHARACTER_NAME
		,	CHARACTER_REPUTE
		,	CHARACTER_GRADE
		,	CHARACTER_EXPOINT
		,	CHARACTER_GRADEUPPOINT
		,	CHARACTER_MONEY
		,	CHARACTER_WING
		,	CHARACTER_VITALITY
		,	CHARACTER_MAP
		,	CHARACTER_FACETYPE
		,	CHARACTER_HEADTYPE
		,	CHARACTER_HAT					
		,	CHARACTER_WEAPON	
		,	CHARACTER_DRESS		
		,	CHARACTER_SHOES	
		,	CHARACTER_COSTUME_HAT		
		,	CHARACTER_COSTUME_DRESS		
		,	CHARACTER_GLOVE		
		,	CHARACTER_COSTUME_SHOES	
		,	CHARACTER_COSTUME_GLOVE	
		,	CHARACTER_MASK		
		,	CHARACTER_MUNPAIDX
		,	CHARACTER_BADFAME
		, 	Character_MapChangePoint
		,	Character_LoginPoint
		,	CHARACTER_INVENTORY
		,	character_pos_x
		,	character_pos_y
		,	CHARACTER_PLAYTIME
		,	CHARACTER_LASTPKENDTIME
		,	CHARACTER_MAXGRADE
		,	CHARACTER_MUNPAMARKIDX
		,	 convert(varchar(30), CHARACTER_MUNPACANENTRYDATE, 102)
		,	CHARACTER_NICKNAME
		,	CHARACTER_STAGE
		,	CHARACTER_JOB
		,	CHARACTER_JOB1
		,	CHARACTER_JOB2
		,	CHARACTER_JOB3
		,	CHARACTER_JOB4
		,	CHARACTER_JOB5
		,	CHARACTER_JOB6
		, 	CHARACTER_SHIELD
		,	CHARACTER_GLASSES
		,	CHARACTER_BAND	
		,	ISNULL( @CHARACTER_SKILLPOINT, 0 )
		,	ISNULL(@CHAR_SIZE, 100)
		,	ISNULL(@FAMILY_NICK, '')
		from	TB_CHARACTER WITH (NOLOCK)
		where	CHARACTER_IDX = @CHARACTER_IDX
	
	update TB_CHARACTER set CHARACTER_LASTMODIFIED = DEFAULT where CHARACTER_IDX = @CHARACTER_IDX

-----------------------
-- ?衙渠? 薑溺 綠薑鼻 (??堅葬)
-----------------------
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_WAREHOUSE_OPEN]    Script Date: 07/30/2013 14:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
070808 웅주, 길드 창고를 연다. 
ACCESS_MAP_IDX, ACCESS_CHAR_IDX는 현재 창고를 사용중인 플레이어가 위치한 맵 번호와 인덱스를 지칭한다.

071205 웅주, 창고 저장 공간이 0인 경우에도 접속자를 갱신하던 문제를 수정
090223 LUJ, 원자적으로 실행되도록 트랜잭션으로 묶는다
*/
CREATE  PROCEDURE [dbo].[MP_GUILD_WAREHOUSE_OPEN]
(
	@GUILD_IDX	INT,
	@MAP_IDX	TINYINT,
	@CHAR_IDX	INT
)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
-- 090223 LUJ, 트랜잭션 선언
BEGIN TRANSACTION
	IF	EXISTS( SELECT	NULL
		FROM	TB_GUILD
		WHERE	GuildIdx = @GUILD_IDX AND WAREHOUSE_SIZE = 0 )
	BEGIN
		SELECT	0,
			0,
			0,
			0,
			0,
			@GUILD_IDX
		-- 090223 LUJ, 트랜잭션을 취소한다
		ROLLBACK
		RETURN
	END
	-- ACCESS_CHAR_IDX에 값이 있으면 접속 중인 플레이어 정보를 반환한다.
	ELSE IF	EXISTS (	SELECT  NULL
	  	        	FROM    TB_GUILD
	  	        	WHERE   (GuildIdx = @GUILD_IDX) AND (ACCESS_CHAR_IDX <> 0) )
	BEGIN
		SELECT  B.WAREHOUSE_SIZE,
			B.WAREHOUSE_RANK,
			0,
			A.CHARACTER_NAME,
			0,
			@GUILD_IDX
		FROM	TB_CHARACTER AS A INNER JOIN TB_GUILD AS B
			ON A.CHARACTER_IDX = B.ACCESS_CHAR_IDX AND
			B.GuildIdx = @GUILD_IDX
		-- 090223 LUJ, 트랜잭션을 취소한다
		ROLLBACK
		RETURN
	END
	
	DECLARE	@WAREHOUSE_RANK	TINYINT
	
	SELECT  @WAREHOUSE_RANK = WAREHOUSE_RANK
	FROM    TB_GUILD
	WHERE   (GuildIdx = @GUILD_IDX)
	
	-- 직위 검사
	IF EXISTS (	SELECT  NULL
			FROM    TB_CHARACTER
			WHERE   (CHARACTER_IDX = @CHAR_IDX) AND 
				(CHARACTER_MUNPAJIKCHEK < @WAREHOUSE_RANK) )
	BEGIN
		SELECT  B.WAREHOUSE_SIZE,
			B.WAREHOUSE_RANK,
			0,
			A.CHARACTER_NAME,
			0,
			@GUILD_IDX
		FROM	TB_CHARACTER AS A INNER JOIN TB_GUILD AS B
			ON A.CHARACTER_MUNPAIDX = B.GuildIdx AND A.CHARACTER_IDX = @CHAR_IDX
		-- 090223 LUJ, 트랜잭션을 취소한다
		ROLLBACK
		RETURN
	END	
	
	-- 아니라면 유저 인덱스 값을 바꾸자
	UPDATE  TB_GUILD
	SET     ACCESS_MAP_IDX = @MAP_IDX, ACCESS_CHAR_IDX = @CHAR_IDX
	WHERE   (GuildIdx = @GUILD_IDX)
	
	SELECT  B.WAREHOUSE_SIZE,
		B.WAREHOUSE_RANK, 
	        B.GuildMoney,
	        A.CHARACTER_NAME, 
	        A.CHARACTER_IDX,
	        B.GuildIdx
	FROM    TB_CHARACTER AS A INNER JOIN TB_GUILD AS B
		ON A.CHARACTER_IDX = B.ACCESS_CHAR_IDX AND A.CHARACTER_IDX = @CHAR_IDX
	-- 090223 LUJ, 트랜잭션을 승인한다
	COMMIT
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_WAREHOUSE_RANK_UPDATE]    Script Date: 07/30/2013 14:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
070809 웅주, 길드 창고 접근 권한을 설정한다
*/
CREATE PROCEDURE [dbo].[MP_GUILD_WAREHOUSE_RANK_UPDATE]
(
	@GUILD_IDX	INT,
	@CHAR_IDX	INT,
	@RANK		TINYINT
)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	UPDATE  TB_GUILD
	SET     WAREHOUSE_RANK = @RANK
	WHERE   (GuildIdx = @GUILD_IDX) AND (MasterIdx = @CHAR_IDX)
	
	SELECT  WAREHOUSE_RANK
	FROM    TB_GUILD
	WHERE   (GuildIdx = @GUILD_IDX)
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_WAREHOUSE_RESET]    Script Date: 07/30/2013 14:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
070808, 웅주.	맵 서버가 시작될때 자신의 맵 서버에서 열었던 길드 창고 정보를 초기화한다.
				맵 서버가 다운되고 다시 가동될 때 창고에 접근할 수 있도록 하기 위해 필요하다
*/
CREATE PROCEDURE [dbo].[MP_GUILD_WAREHOUSE_RESET]
(
	@MAP_IDX	TINYINT
)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	UPDATE	TB_GUILD
	SET     ACCESS_MAP_IDX = 0,
			ACCESS_CHAR_IDX = 0
	WHERE   (ACCESS_MAP_IDX = @MAP_IDX)
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_CHARACTER_DATA_SELECT]    Script Date: 07/30/2013 14:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080725 LUJ, 테스트 서버와 서비스 서버의 데이터 저장 위치가 다른 것이 있어 분리했다.
	서비스 서버로 올리거나 해외 서버에 업데이트할 때 저장 위치가 올바른지 확인하고 신중히 업데이트해야한다. 
	다음 저장 위치가 다르다.

	1) 스킬 포인트
		테스트 서버: TB_SKILLPOINT.SKILL_POINT
		서비스 서버: TB_CHARACTER.CHARACTER_SKILLPOINT

	2) 인벤토리 크기
		테스트 서버: TB_CHARACTER.CHARACTER_INVENTORY
		서비스 서버: TB_CHARACTER.CHARACTER_ABILITYEXP
*/
CREATE   PROCEDURE [dbo].[TP_CHARACTER_DATA_SELECT]
(
	@CHAR_IDX	INT
)
AS
	SET NOCOUNT ON
	
	SELECT	C.CHARACTER_IDX,
		C.CHARACTER_GENDER,
		C.CHARACTER_STR,
		C.CHARACTER_DEX,
		C.CHARACTER_VIT,
		C.CHARACTER_INT,
		C.CHARACTER_WIS,
		C.CHARACTER_LIFE,
		C.CHARACTER_MANA,
		C.CHARACTER_GRADE,
		C.CHARACTER_MAXGRADE,
		C.CHARACTER_EXPOINT,
		C.CHARACTER_GRADEUPPOINT,
		C.CHARACTER_MONEY,
		C.CHARACTER_PLAYTIME,
		ISNULL( S.SKILL_POINT, 0 ),
		C.CHARACTER_ATTR,
		C.CHARACTER_INVENTORY,
		C.CHARACTER_BADFAME,
		C.CHARACTER_MAP,
		C.CHARACTER_POS_X,
		C.CHARACTER_POS_Y,
		C.CHARACTER_JOB,
		C.CHARACTER_JOB1,
		C.CHARACTER_JOB2,
		C.CHARACTER_JOB3,
		C.CHARACTER_JOB4,
		C.CHARACTER_JOB5,
		C.CHARACTER_JOB6,
		C.CHARACTER_MUNPAIDX,
		C.CHARACTER_MUNPAJIKCHEK,
		ISNULL( G.GuildName, '' ) AS MUNPA_NAME,
		C.USER_IDX
	FROM 	TB_CHARACTER C LEFT JOIN TB_SKILLPOINT S ON C.CHARACTER_IDX =  S.CHARACTER_IDX LEFT OUTER JOIN TB_GUILD G ON C.CHARACTER_MUNPAIDX = G.GuildIdx
	WHERE 	(C.CHARACTER_IDX = @CHAR_IDX)

	/*
	081104 LUJ, 본섭 적용된 프로시저
	SELECT C.CHARACTER_IDX, C.CHARACTER_GENDER, C.CHARACTER_STR, C.CHARACTER_DEX,
		C.CHARACTER_VIT, C.CHARACTER_INT, C.CHARACTER_WIS, C.CHARACTER_LIFE, C.CHARACTER_MANA,
		C.CHARACTER_GRADE, C.CHARACTER_MAXGRADE, C.CHARACTER_EXPOINT, C.CHARACTER_GRADEUPPOINT,
		C.CHARACTER_MONEY, C.CHARACTER_PLAYTIME, C.CHARACTER_SKILLPOINT, C.CHARACTER_ATTR,
		C.CHARACTER_ABILITYEXP, C.CHARACTER_BADFAME, C.CHARACTER_MAP, C.CHARACTER_POS_X, C.CHARACTER_POS_Y,
		C.CHARACTER_JOB, C.CHARACTER_JOB1, C.CHARACTER_JOB2,  C.CHARACTER_JOB3, C.CHARACTER_JOB4, C.CHARACTER_JOB5,  C.CHARACTER_JOB6,
		C.CHARACTER_MUNPAIDX, C.CHARACTER_MUNPAJIKCHEK, ISNULL( G.GuildName, '' ) AS MUNPA_NAME, C.USER_IDX
	FROM TB_CHARACTER C LEFT OUTER JOIN TB_GUILD G ON C.CHARACTER_MUNPAIDX = G.GuildIdx
	WHERE (C.CHARACTER_IDX = @CHAR_IDX)
	*/
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_MoneyUpdate]    Script Date: 07/30/2013 14:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MP_GUILD_MoneyUpdate]
(
		@CHAR_IDX	INT,
		@MONEY		MONEY,
		@MAX_MONEY	MONEY,
		@IS_DEPOSIT	TINYINT
)
AS	
	SET NOCOUNT ON
	
	-- 인출
	IF @IS_DEPOSIT = 0
	BEGIN
		UPDATE  TB_GUILD
		SET     GuildMoney = GuildMoney - @MONEY
		WHERE   (ACCESS_CHAR_IDX = @CHAR_IDX) AND ( GuildMoney >= @MONEY )
	END
	-- 저금
	ELSE
	BEGIN
		UPDATE	TB_GUILD
		SET     GuildMoney = GuildMoney + @MONEY
		WHERE   (ACCESS_CHAR_IDX = @CHAR_IDX) AND ( @MAX_MONEY >= GuildMoney + @MONEY )
	END
	
	IF @@ROWCOUNT = 1
	BEGIN
		SELECT	GuildMoney, @MONEY, @IS_DEPOSIT
		FROM	TB_GUILD
		WHERE	(ACCESS_CHAR_IDX = @CHAR_IDX)
	END
	

--update tb_guild set GuildMoney = @Money where GuildIdx  = @GuildIdx
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_MarkRegist]    Script Date: 07/30/2013 14:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 이미지 크기: (가로)16 X (세로)16 X (픽셀 당 비트)2 X (저장 단위)2 = 1024
CREATE proc [dbo].[MP_GUILD_MarkRegist] ( @GuildIdx int , @ImgData varbinary(1025) )
AS
	Set Nocount on
	Set Xact_Abort on

	declare @markname int 


if not exists ( select null from tb_guild where guildidx = @GuildIdx )
begin
	select 0
	return
end 

if exists ( select null from tb_guildmark where guildIdx = @GuildIdx )
begin
	delete tb_guildmark where guildIdx = @GuildIdx
end

insert tb_guildmark
	(
	GuildIdx, 
	ImgData
	)
values 
	(
	@GuildIdx,
	@ImgData
	)

set @markname = @@identity

update tb_character
set character_munpamarkidx = @markname
where character_munpaidx = @GuildIdx

update tb_guild
set MarkName = @markname
where guildidx = @GuildIdx

select markidx, @GuildIdx,  ImgData from tb_guildmark with(nolock) where guildidx = @GuildIdx
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_NOTICE_UPDATE]    Script Date: 07/30/2013 14:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
070809 웅주, 길드 공지를 갱신한다
			※ 기존에는 별도의 테이블(TB_GUILD_NOTICE)에 있었으나 TB_GUILD로 합쳤음
*/
CREATE PROCEDURE [dbo].[MP_GUILD_NOTICE_UPDATE]
(
	@GUILD_IDX	INT,
	@NOTICE		VARCHAR( 150 )
)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	UPDATE  TB_GUILD
	SET     NOTICE = @NOTICE
	WHERE   (GuildIdx = @GUILD_IDX)
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_SELECT]    Script Date: 07/30/2013 14:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
070801 웅주, 길드 세부 정보를 읽는다
071211 웅주, 길드 점수가 FLOAT으로 되어 있어서 가끔 잘못된 값으로 캐스팅되는 문제 수정
*/
CREATE PROCEDURE [dbo].[MP_GUILD_SELECT]
(
	@GUILD_IDX INT
)
AS
	SET NOCOUNT ON
	
	SELECT  GuildIdx,
			GuildLevel,
			UnionIdx,
			--SCORE,
			CAST( SCORE AS INT ),
			Location,
			WAREHOUSE_SIZE,
			WAREHOUSE_RANK,
			MasterIdx, 			
			GuildName,
			MarkName,
			Intro,
			NOTICE
	FROM      TB_GUILD
	WHERE   (GuildIdx = @GUILD_IDX)
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_UNION_AddGuild]    Script Date: 07/30/2013 14:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROC [dbo].[MP_GUILD_UNION_AddGuild]
(
		@GuildUnionIdx		int
	,	@Index			int
	,	@GuildIdx		int
)
AS	
	Set Nocount on
	Set Xact_Abort on

	if( @Index = 0 )
	begin
		update TB_GuildUnion set GuildIdx0 = @GuildIdx where GuildUnionIdx = @GuildUnionIdx
		update TB_Guild set UnionIdx = @GuildUnionIdx, UnionEntryDate = 0 where GuildIdx = @GuildIdx
	end
	else if( @Index = 1 )
	begin
		update TB_GuildUnion set GuildIdx1 = @GuildIdx where GuildUnionIdx = @GuildUnionIdx
		update TB_Guild set UnionIdx = @GuildUnionIdx, UnionEntryDate = 0 where GuildIdx = @GuildIdx
	end
	else if( @Index = 2 )
	begin
		update TB_GuildUnion set GuildIdx2 = @GuildIdx where GuildUnionIdx = @GuildUnionIdx
		update TB_Guild set UnionIdx = @GuildUnionIdx, UnionEntryDate = 0 where GuildIdx = @GuildIdx
	end
	else if( @Index = 3 )
	begin
		update TB_GuildUnion set GuildIdx3 = @GuildIdx where GuildUnionIdx = @GuildUnionIdx
		update TB_Guild set UnionIdx = @GuildUnionIdx, UnionEntryDate = 0 where GuildIdx = @GuildIdx
	end
	else if( @Index = 4 )
	begin
		update TB_GuildUnion set GuildIdx4 = @GuildIdx where GuildUnionIdx = @GuildUnionIdx
		update TB_Guild set UnionIdx = @GuildUnionIdx, UnionEntryDate = 0 where GuildIdx = @GuildIdx	
	end
	else if( @Index = 5 )
	begin
		update TB_GuildUnion set GuildIdx5 = @GuildIdx where GuildUnionIdx = @GuildUnionIdx
		update TB_Guild set UnionIdx = @GuildUnionIdx, UnionEntryDate = 0 where GuildIdx = @GuildIdx
	end
	else if( @Index = 6 )
	begin
		update TB_GuildUnion set GuildIdx6 = @GuildIdx where GuildUnionIdx = @GuildUnionIdx
		update TB_Guild set UnionIdx = @GuildUnionIdx, UnionEntryDate = 0 where GuildIdx = @GuildIdx	
	end
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_UNION_Create]    Script Date: 07/30/2013 14:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MP_GUILD_UNION_Create]
(
	@GuildIdx		int	
,	@GuildUnionName	varchar(20)	
)
AS	
	Set Nocount on
	Set Xact_Abort on

	if exists (select * from TB_GuildUnion where GuildUnionName like @GuildUnionName)
	begin
		select 0
		return
	end

	insert TB_GuildUnion( GuildUnionName, GuildIdx0, GuildIdx1, GuildIdx2, GuildIdx3, GuildIdx4, GuildIdx5, GuildIdx6, MarkIdx )
	values( @GuildUnionName, @GuildIdx, 0, 0, 0, 0, 0, 0, 0 )

	update TB_Guild	set UnionIdx  = @@identity, UnionEntryDate = 0 where GuildIdx = @GuildIdx

	select @@identity, @GuildUnionName, @GuildIdx
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_UNION_Destroy]    Script Date: 07/30/2013 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE                   PROC [dbo].[MP_GUILD_UNION_Destroy]
(
		@GuildUnionIdx		int
,		@MarkIdx		int
,		@MasterGuildIdx		int
,		@Time			int
)
AS	
	Set Nocount on
	Set Xact_Abort on

	delete TB_GuildUnion where GuildUnionIdx = @GuildUnionIdx
	delete TB_GuildUnionMark where MarkIdx = @MarkIdx
	update TB_Guild set UnionIdx = 0, UnionEntryDate = 0 where UnionIdx = @GuildUnionIdx
	update TB_Guild set UnionIdx = 0, UnionEntryDate = @Time where GuildIdx = @MasterGuildIdx
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_UNION_RemoveGuild]    Script Date: 07/30/2013 14:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROC [dbo].[MP_GUILD_UNION_RemoveGuild]
(
		@GuildUnionIdx		int
	,	@Index			int
	,	@GuildIdx		int
)
AS	
	Set Nocount on
	Set Xact_Abort on

	if( @Index = 0 )
	begin
		update TB_GuildUnion set GuildIdx0 = 0 where GuildUnionIdx = @GuildUnionIdx
		update TB_Guild set UnionIdx = 0, UnionEntryDate = 0 where GuildIdx = @GuildIdx
	end
	else if( @Index = 1 )
	begin
		update TB_GuildUnion set GuildIdx1 = 0 where GuildUnionIdx = @GuildUnionIdx
		update TB_Guild set UnionIdx = 0, UnionEntryDate = 0 where GuildIdx = @GuildIdx
	end
	else if( @Index = 2 )
	begin
		update TB_GuildUnion set GuildIdx2 = 0 where GuildUnionIdx = @GuildUnionIdx
		update TB_Guild set UnionIdx = 0, UnionEntryDate = 0 where GuildIdx = @GuildIdx
	end
	else if( @Index = 3 )
	begin
		update TB_GuildUnion set GuildIdx3 = 0 where GuildUnionIdx = @GuildUnionIdx
		update TB_Guild set UnionIdx = 0, UnionEntryDate = 0 where GuildIdx = @GuildIdx
	end
	else if( @Index = 4 )
	begin
		update TB_GuildUnion set GuildIdx4 = 0 where GuildUnionIdx = @GuildUnionIdx
		update TB_Guild set UnionIdx = 0, UnionEntryDate = 0 where GuildIdx = @GuildIdx	
	end
	else if( @Index = 5 )
	begin
		update TB_GuildUnion set GuildIdx5 = 0 where GuildUnionIdx = @GuildUnionIdx
		update TB_Guild set UnionIdx = 0, UnionEntryDate = 0 where GuildIdx = @GuildIdx
	end
	else if( @Index = 6 )
	begin
		update TB_GuildUnion set GuildIdx6 = 0 where GuildUnionIdx = @GuildUnionIdx
		update TB_Guild set UnionIdx = 0, UnionEntryDate = 0 where GuildIdx = @GuildIdx	
	end
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_UNION_SecedeGuild]    Script Date: 07/30/2013 14:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROC [dbo].[MP_GUILD_UNION_SecedeGuild]
(
		@GuildUnionIdx		int
	,	@Index			int
	,	@GuildIdx		int
	,	@Time			int
)
AS	
	Set Nocount on
	Set Xact_Abort on

	if( @Index = 0 )
	begin
		update TB_GuildUnion set GuildIdx0 = 0 where GuildUnionIdx = @GuildUnionIdx
		update TB_Guild set UnionIdx = 0, UnionEntryDate = @Time where GuildIdx = @GuildIdx
	end
	else if( @Index = 1 )
	begin
		update TB_GuildUnion set GuildIdx1 = 0 where GuildUnionIdx = @GuildUnionIdx
		update TB_Guild set UnionIdx = 0, UnionEntryDate = @Time where GuildIdx = @GuildIdx
	end
	else if( @Index = 2 )
	begin
		update TB_GuildUnion set GuildIdx2 = 0 where GuildUnionIdx = @GuildUnionIdx
		update TB_Guild set UnionIdx = 0, UnionEntryDate = @Time where GuildIdx = @GuildIdx
	end
	else if( @Index = 3 )
	begin
		update TB_GuildUnion set GuildIdx3 = 0 where GuildUnionIdx = @GuildUnionIdx
		update TB_Guild set UnionIdx = 0, UnionEntryDate = @Time where GuildIdx = @GuildIdx
	end
	else if( @Index = 4 )
	begin
		update TB_GuildUnion set GuildIdx4 = 0 where GuildUnionIdx = @GuildUnionIdx
		update TB_Guild set UnionIdx = 0, UnionEntryDate = @Time where GuildIdx = @GuildIdx	
	end
	else if( @Index = 5 )
	begin
		update TB_GuildUnion set GuildIdx5 = 0 where GuildUnionIdx = @GuildUnionIdx
		update TB_Guild set UnionIdx = 0, UnionEntryDate = @Time where GuildIdx = @GuildIdx
	end
	else if( @Index = 6 )
	begin
		update TB_GuildUnion set GuildIdx6 = 0 where GuildUnionIdx = @GuildUnionIdx
		update TB_Guild set UnionIdx = 0, UnionEntryDate = @Time where GuildIdx = @GuildIdx	
	end
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_UPDATE_SCORE]    Script Date: 07/30/2013 14:53:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071008 웅주, 길드전때 길드원끼리 살해했을 경우 발생하는 길드 점수를 갱신한다.

071205 웅주, 결과 반환 때 길드 인덱스도 포함함. 해당 플레이어가 없을 경우 결과를 보낼 길드 인덱스를 알 수 없기 때문
*/
CREATE PROCEDURE [dbo].[MP_GUILD_UPDATE_SCORE]
(
	@KILLER_CHAR_IDX	INT,
	@KILLER_GUILD_IDX	INT,
	@KILLER_POINT		FLOAT,
	@CORPSE_CHAR_IDX	INT,
	@CORPSE_GUILD_IDX	INT,
	@CORPSE_POINT		FLOAT
)
AS
	SET NOCOUNT ON
	
	-- 차감되는 상대가 속한 길드의 점수가 킬드 포인트 이상이 아니면 처리하지 않는다
	DECLARE @GUILD_POINT FLOAT
	
	SELECT  @GUILD_POINT = SCORE
	FROM    TB_GUILD
	WHERE   (GuildIdx = @CORPSE_GUILD_IDX)
	
	IF @CORPSE_POINT > @GUILD_POINT
	BEGIN
		SELECT @KILLER_CHAR_IDX, -1, @KILLER_GUILD_IDX, 1 AS FIELD								-- 승자 인덱스, 얻는 점수
		UNION
		SELECT @CORPSE_CHAR_IDX, -1, @CORPSE_GUILD_IDX, 2 AS FIELD	-- 패자 인덱스, 반영된 점수
		ORDER BY FIELD
		RETURN
	END
	
	-- 점수 차감	
	-- 죽인 상대의 길드 포인트를 더해준다
	UPDATE  TB_GUILD
	SET     SCORE = SCORE + @KILLER_POINT
	WHERE   (GuildIdx = @KILLER_GUILD_IDX)
	
	-- 죽은 상대의 길드 포인트를 차감하고
	UPDATE  TB_GUILD
	SET     SCORE = SCORE - @CORPSE_POINT
	WHERE   (GuildIdx = @CORPSE_GUILD_IDX)
	
	-- 현재 길드 포인트를 반환한다,
	-- 주의: 죽인자의 레코드가 첫번째로 나와야한다.	
	SELECT	@KILLER_CHAR_IDX, CAST( SCORE AS INT ), @KILLER_GUILD_IDX, 1 AS FIELD
	FROM	TB_GUILD
	WHERE	(GuildIdx = @KILLER_GUILD_IDX)
	UNION
	SELECT	@CORPSE_CHAR_IDX, CAST( SCORE AS INT ), @CORPSE_GUILD_IDX, 2 AS FIELD
	FROM	TB_GUILD
	WHERE	(GuildIdx = @CORPSE_GUILD_IDX)
	ORDER BY FIELD
	
	RETURN 
	
	/*
	DECLARE @GUILD_POINT FLOAT
	
	SELECT  @GUILD_POINT = SCORE
	FROM    TB_GUILD
	WHERE   (GuildIdx = 56)
	
	
	SELECT 802, 0, 1 AS TYPE
	UNION
	SELECT 675, CAST( @GUILD_POINT AS INT ), 2 AS TYPE
	ORDER BY TYPE

*/
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_DeleteCharacter]    Script Date: 07/30/2013 14:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE               proc [dbo].[MP_CHARACTER_DeleteCharacter]
(
	@CHARACTER_IDX	int,
	@ServerNo		int,
	@IP			varchar(16)
)
as
	Set Nocount on
	Set Xact_Abort on

if(select character_partyidx from tb_character where character_idx = @CHARACTER_IDX ) > 0
begin
	select 1
	return
end

else if (select character_munpaidx from tb_character where character_idx = @CHARACTER_IDX ) > 0
begin 
	select 2
	return
end
-- ?塵葬 ?陛
else if (select FamilyID from TB_FAMILY_MEMBER where MemberID = @CHARACTER_IDX ) > 0
begin 
	select 3
	return
end
--?? ?陛
else if (select PartnerID from TB_MARRIAGE where PlayerID = @CHARACTER_IDX ) > 0
begin 
	select 3
	return
end

ELSE IF (SELECT [CONSIGNMENT_IDX] FROM TB_CONSIGNMENT WHERE [CHARACTER_IDX] = @character_idx ) > 0
BEGIN
	SELECT 5 -- ?衙渠?? 蛔煙脹 鼻?檜 氈?.
	RETURN
END

ELSE IF (SELECT [Note_IDX] FROM TB_NOTE WHERE [Receiver_IDX] = @character_idx and
			(0<[PackageItemIdx] or 0<[PackageMoney])) > 0
BEGIN
	SELECT 6 -- 辦??? 模?(?檜蠱,?萄)陛 氈?.
	RETURN
END

else
begin
	
--	insert TB_DeletedCharacter select * from TB_Character where CHARACTER_IDX = @CHARACTER_IDX
--	delete TB_CHARACTER	where CHARACTER_IDX = @CHARACTER_IDX

	-- character_standindex = 5賊 雖?霞 議葛攪
	declare @insertname varchar(16)
	set @insertname = '@'+convert(varchar(15),@CHARACTER_IDX)
	update tb_character set character_standindex = 5, character_name = @insertname where character_idx = @CHARACTER_IDX

--	delete TB_CREATEINFO 	where CHARACTER_IDX = @CHARACTER_IDX
--	delete TB_ITEM		where CHARACTER_IDX = @CHARACTER_IDX
--	delete TB_MUGONG	where CHARACTER_IDX = @CHARACTER_IDX
--	delete TB_CHARACTER	where CHARACTER_IDX = @CHARACTER_IDX

--	delete tb_quest		where character_idx = @character_idx -- 蟾爾濠 薑爾 餉薯(??? ?蝶? 餉薯)
--	delete tb_mainquest	where character_idx = @character_idx
--	delete tb_subquest	where character_idx = @character_idx

	delete tb_friend where character_idx = @Character_idx --頂陛 蛔煙? 餌塋
	delete tb_friend where Friend_idx = @Character_idx --?? 蛔煙? 餌塋 萃 ? 雖??. 
	delete tb_note where receiver_idx = @Character_idx

	update TB_CharacterCreateInfo set flag = 2, delete_date = getdate(), delete_ip = @IP
	where character_idx = @CHARACTER_IDX

	select 0, @CHARACTER_IDX
	--?辦癒?棲??婦? ?陛
	--exec [korea.test.member].dbo.up_Character_Delete @ServerNo, @Character_idx
	--?辦癒?棲??婦? ?陛

	exec dssog59.MHCMember.dbo.up_Character_Delete @ServerNo, @CHARACTER_IDX

end




set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[MP_MARRIAGE_DIVORCE_SaveInfo]    Script Date: 07/30/2013 14:53:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 이혼 처리
CREATE   PROC [dbo].[MP_MARRIAGE_DIVORCE_SaveInfo]    		(
									@PlayerID		int
									)
as
	Set Nocount on
	Set Xact_abort on

begin
	update TB_MARRIAGE 
	set	PartnerID = 0,
		TeleportFreq = 0,
		DivorceDate = getdate()
	 where PlayerID = @PlayerID
end
GO
/****** Object:  StoredProcedure [dbo].[MP_MARRIAGE_SaveInfo]    Script Date: 07/30/2013 14:53:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
--결혼 정보 저장
CREATE   PROC [dbo].[MP_MARRIAGE_SaveInfo]		    		(
									@PlayerID		int,
									@PartnerID		int,
									@TeleportFreq	 	int
									)
as
	Set Nocount on
	Set Xact_abort on

begin
	-- 레코드가 생성되어 있지 않으면 Insert
	if not exists (select null from TB_MARRIAGE where PlayerID = @PlayerID)
	begin
		insert TB_MARRIAGE
			(
			PlayerID,
			PartnerID,
			TeleportFreq,
			Nickname,
			DivorceDate,
			MarriageFreq
			)
		values
			(
			@PlayerID,
			@PartnerID,
			@TeleportFreq,
			NULL,
			NULL,
			1
			)
	end
	-- 레코드가 생성되어 있으면 Update
	else
	begin
		update TB_MARRIAGE 
		set	PlayerID = @PlayerID, 
			PartnerID = @PartnerID,
			TeleportFreq = @TeleportFreq,
			Nickname = NULL,
			DivorceDate = NULL,
			MarriageFreq = MarriageFreq + 1
		 where PlayerID = @PlayerID
	end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_MARRIAGE_TELEPORTFREQ_SaveInfo]    Script Date: 07/30/2013 14:53:52 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
--결혼 정보 저장
CREATE   PROC [dbo].[MP_MARRIAGE_TELEPORTFREQ_SaveInfo]	(
									@PlayerID		int,
									@TeleportFreq	 	int
									)
as
	Set Nocount on
	Set Xact_abort on

begin
	update TB_MARRIAGE 
	set       TeleportFreq = @TeleportFreq
	 where PlayerID = @PlayerID
end
GO
/****** Object:  StoredProcedure [dbo].[MP_MARRIAGE_LoadInfo]    Script Date: 07/30/2013 14:53:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 결혼 정보 읽기
CREATE   PROC [dbo].[MP_MARRIAGE_LoadInfo] (@PlayerID int)
as
	Set Nocount on
	Set Xact_abort on

begin
	declare @PartnerName varchar(16)
	declare @PartnerID int
	declare @PartnerRace int
	declare @PartnerJob int
	declare @PartnerJob1 int
	declare @PartnerJob2 int
	declare @PartnerJob3 int
	declare @PartnerJob4 int
	declare @PartnerJob5 int
	declare @PartnerJob6 int
	declare @PartnerGrade int
	set @PartnerName = ''
	set @PartnerID = 0
	set @PartnerRace = 0
	set @PartnerJob = 0
	set @PartnerJob1 = 0
	set @PartnerJob2 = 0
	set @PartnerJob3 = 0
	set @PartnerJob4 = 0
	set @PartnerJob5 = 0
	set @PartnerJob6 = 0
	set @PartnerGrade = 0

	-- 먼저 파트너의 ID를 얻어서
	select @PartnerID = PartnerID
	from TB_MARRIAGE with(nolock)
	where PlayerID = @PlayerID

	-- 이름을 찾는다.
	select 	@PartnerName   = 	CHARACTER_NAME,
		@PartnerRace  =	CHARACTER_STAGE,
		@PartnerJob    =	CHARACTER_JOB,
		@PartnerJob1  =	CHARACTER_JOB1,
		@PartnerJob2  =	CHARACTER_JOB2,
		@PartnerJob3  =	CHARACTER_JOB3,
		@PartnerJob4  =	CHARACTER_JOB4,
		@PartnerJob5  =	CHARACTER_JOB5,
		@PartnerJob6  =	CHARACTER_JOB6,
		@PartnerGrade =	 CHARACTER_GRADE
	from TB_CHARACTER 
	where CHARACTER_IDX = @PartnerID
	
	-- 스타일 120(yyyy-mm-dd hh:mi:ss(24h)) 형식으로 날짜 변환
	select 	PartnerID, 
		@PartnerName, 
		@PartnerRace, 
		@PartnerJob  ,
		@PartnerJob1 ,
		@PartnerJob2 ,
		@PartnerJob3 ,
		@PartnerJob4 ,
		@PartnerJob5 ,
		@PartnerJob6 ,
		@PartnerGrade,
		TeleportFreq,  
		Nickname, 
		convert(varchar(16), DivorceDate, 120)
	from TB_MARRIAGE with(nolock)
	where PlayerID = @PlayerID
end
GO
/****** Object:  StoredProcedure [dbo].[MP_MARRIAGE_NICKNAME_SaveInfo]    Script Date: 07/30/2013 14:53:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- 호칭 처리
CREATE   PROC [dbo].[MP_MARRIAGE_NICKNAME_SaveInfo]    		(
									@PlayerID		int,
									@Nickname		varchar(16)
									)
as
	Set Nocount on
	Set Xact_abort on

begin
	update TB_MARRIAGE 
	set       Nickname = @Nickname
	 where PlayerID = @PlayerID
end
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_LOGOUTPOINTUPDATE_TOCHALLENGESAVEDPOINT]    Script Date: 07/30/2013 14:52:35 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE    proc [dbo].[MP_CHARACTER_LOGOUTPOINTUPDATE_TOCHALLENGESAVEDPOINT]
(
	@character_idx int
)
as
	Set Nocount on
	Set Xact_abort on
	
	Declare @MapNum Int
	Declare @PosX Int
	Declare @PosY Int
	
	Set @MapNum = 0
	Set @PosX = 0
	Set @PosY = 0
	
	-- TB_CHALLENGEZONE_SAVEPOS 에 저장된 맵번호, 맵위치를 읽어와 TB_CHARACTER 에 저장하고 해당 내용을 제거한다
	Select @MapNum = BEFOREMAPNUM, @PosX = PosX, @PosY = PosY From TB_CHALLENGEZONE_SAVEPOS Where PlayerID = @character_idx
	Update TB_CHARACTER Set CHARACTER_MAP = @MapNum, CHARACTER_POS_X = @PosX, CHARACTER_POS_Y = @PosY Where CHARACTER_IDX = @character_idx
	Delete TB_CHALLENGEZONE_SAVEPOS Where PlayerID = @character_idx
GO
/****** Object:  StoredProcedure [dbo].[MP_CHALLENGEZONE_SAVEPOS_SaveInfo]    Script Date: 07/30/2013 14:52:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
--챌린지 존 회귀 포인트 저장
CREATE   PROC [dbo].[MP_CHALLENGEZONE_SAVEPOS_SaveInfo]         	(
									@PlayerID		int,
									@BeforeMapNum	int,
									@PosX		 	int, 
									@PosY			int
									)
as
	Set Nocount on
	Set Xact_abort on

begin
	-- 레코드가 생성되어 있지 않으면 Insert
	if not exists (select null from TB_CHALLENGEZONE_SAVEPOS where PlayerID = @PlayerID)
	begin
		insert TB_CHALLENGEZONE_SAVEPOS
			(
			PlayerID,
			BeforeMapNum,
			PosX,
			PosY
			)
		values
			(
			@PlayerID,
			@BeforeMapNum,
			@PosX,
			@PosY
			)
	end
	-- 레코드가 생성되어 있으면 Update
	else
	begin
		update TB_CHALLENGEZONE_SAVEPOS 
		set	BeforeMapNum = @BeforeMapNum, 
			PosX = @PosX,
			PosY = @PosY
		 where PlayerID = @PlayerID
	end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_CHALLENGEZONE_SAVEPOS_RemoveInfo]    Script Date: 07/30/2013 14:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--챌린지 존 회귀 포인트 클리어
CREATE  PROCEDURE [dbo].[MP_CHALLENGEZONE_SAVEPOS_RemoveInfo]          	(
									@PlayerID		int)
as
	Set Nocount on
	Set Xact_abort on

begin
	delete TB_CHALLENGEZONE_SAVEPOS where PlayerID = @PlayerID
end
	/* SET NOCOUNT ON */
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_SelectByUserIDX]    Script Date: 07/30/2013 14:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_CHARACTER_SelectByUserIDX]
(
	@USER_IDX	int,
	@AuthKey	int
)

as
	Set Nocount On
	Set Xact_Abort On

if not exists (select null  from tb_character where user_idx = @USER_IDX and character_standindex != 5)
begin
	select 	0
,			0
,			0
,			0
,			0
,			0
,			0
,			0
,			0
,			0
,			0
,			0
,			0
,			0
,			0
,			0
,			0
,			0
,			0
,			0
,			0
,			@AuthKey
end

else
begin
	-- 챌린지 존에서 로그아웃되었을 경우 저장해 두었던 귀환 포인트 맵 번호와 좌표를  얻어서 그 값으로 설정한다.
	-- 5개의 캐릭터 만큼 select 해서 해당 ID의 저장한 정보를 설정한다.
	declare @PlayerID int
	declare @Cnt int
	set @PlayerID = 0
	set @Cnt = 0

	while @Cnt < 5
	begin
		select @PlayerID = CHARACTER_IDX from TB_CHARACTER where USER_IDX = @USER_IDX and character_standindex = @Cnt
		if exists (select null from TB_CHALLENGEZONE_SAVEPOS where PlayerID = @PlayerID)
		begin
			declare @MapNum int
			declare @PosX int
			declare @PosY int
			set @MapNum = 0
			set @PosX = 0
			set @PosY = 0
			
			select @MapNum = BeforeMapNum, @PosX = PosX, @PosY = PosY from TB_CHALLENGEZONE_SAVEPOS where PlayerID = @PlayerID			
			update TB_CHARACTER set CHARACTER_MAP = @MapNum, CHARACTER_POS_X = @PosX, CHARACTER_POS_Y = @PosY where CHARACTER_IDX = @PlayerID
			delete TB_CHALLENGEZONE_SAVEPOS where PlayerID = @PlayerID
		end
		set @Cnt = @Cnt + 1
	end	-----------------------------------------------------------------------------------------------------------
	
	select 	CHARACTER_IDX
,			CHARACTER_STANDINDEX
,			CHARACTER_NAME
,			CHARACTER_FACETYPE
,			CHARACTER_HEADTYPE
,			CHARACTER_GLOVE
,			CHARACTER_DRESS
,			CHARACTER_SHOES
,			CHARACTER_WEAPON
,			CHARACTER_GRADE
,			CHARACTER_MAP
,			CHARACTER_GENDER
,			CHARACTER_STAGE
,			CHARACTER_JOB
,			CHARACTER_JOB1
,			CHARACTER_JOB2
,			CHARACTER_JOB3
,			CHARACTER_JOB4
,			CHARACTER_JOB5
,			CHARACTER_JOB6
,			CHARACTER_MUNPANAME
,			@AuthKey
			from TB_CHARACTER where USER_IDX = @USER_IDX and character_standindex != 5
end
GO
/****** Object:  StoredProcedure [dbo].[MP_MONSTERMETER_SetInfo]    Script Date: 07/30/2013 14:53:54 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
--몬스터미터 정보 저장
CREATE   PROC [dbo].[MP_MONSTERMETER_SetInfo] (@PlayerID int, @PlayTime int, @KillMonNum int, @PlayTimeTotal int, @KillMonNumTotal int)
as
	Set Nocount on
	Set Xact_abort on

begin
	-- 레코드가 생성되어 있지 않으면 Insert
	if not exists (select null from TB_MONSTERMETER where PlayerID = @PlayerID)
	begin
		insert TB_MONSTERMETER
			(
			PlayerID,
			PlayTime,
			KillMonNum,
			PlayTimeTotal,
			KillMonNumTotal
			)
		values
			(
			@PlayerID,
			@PlayTime,
			@KillMonNum,
			@PlayTimeTotal,
			@KillMonNumTotal
			)
	end
	-- 레코드가 이미 생성되어 있으면 Update
	else 
	begin
		update TB_MONSTERMETER set PlayTime = @PlayTime, KillMonNum = @KillMonNum, PlayTimeTotal = @PlayTimeTotal, KillMonNumTotal = @KillMonNumTotal where PlayerID = @PlayerID
	end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_MONSTERMETER_LoadInfo]    Script Date: 07/30/2013 14:53:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 몬스터미터 정보를 DB에서 읽어옴
CREATE PROC [dbo].[MP_MONSTERMETER_LoadInfo] (@PlayerID int)
as
	Set Nocount on
	Set Xact_abort on

begin
	-- 레코드가 생성되어 있지 않으면return
	select PlayTime, KillMonNum, PlayTimeTotal, KillMonNumTotal from TB_MONSTERMETER with(nolock) where PlayerID = @PlayerID
end

/*
	-- 레코드가 생성되어 있지 않으면return
	if not exists (select null from TB_MONSTERMETER where PlayerID = @PlayerID)
	begin
		return
	end
	-- 레코드가 생성되어 있으면 read
	else 
	begin
		select PlayTime, KillMonNum, PlayTimeTotal, KillMonNumTotal from TB_MONSTERMETER with(nolock) where PlayerID = @PlayerID
	end
*/
GO
/****** Object:  StoredProcedure [dbo].[MP_MONSTERMETER_InitInfo]    Script Date: 07/30/2013 14:53:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
--몬스터미터 정보 저장
CREATE   PROC [dbo].[MP_MONSTERMETER_InitInfo] (@PlayerID int)
as
	Set Nocount on
	Set Xact_abort on

begin
	-- 레코드가 생성되어 있지 않으면 Insert
	if not exists (select null from TB_MONSTERMETER where PlayerID = @PlayerID)
	begin
		insert TB_MONSTERMETER
			(
			PlayerID,
			PlayTime,
			KillMonNum,
			PlayTimeTotal,
			KillMonNumTotal
			)
		values
			(
			@PlayerID,
			0,
			0,
			0,
			0
			)
	end
	-- 레코드가 이미 생성되어 있으면 Update
	else 
	begin
		update TB_MONSTERMETER set PlayTime = 0, KillMonNum = 0 where PlayerID = @PlayerID
	end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_CHALLENGEZONE_CLEAR_NO1_LoadInfo]    Script Date: 07/30/2013 14:52:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 챌린지 존 클리어 최단 기록 얻기
CREATE   PROC [dbo].[MP_CHALLENGEZONE_CLEAR_NO1_LoadInfo] (@Section int)
as
	Set Nocount on
	Set Xact_abort on

begin
	declare @PlayerID int
	declare @PartnerID int
	declare @ClearTime int
	declare @PlayerName varchar(16)
	declare @PartnerName varchar(16)

	set @PlayerID = 0
	set @PartnerID = 0
	set @ClearTime = 0
	set @PlayerName = ''
	set @PartnerName = ''

	-- 클리어 최단 시간 정보 얻기
	select Top 1 @PlayerID = PlayerID, @PartnerID = PartnerID, @ClearTime = ClearTime
	from TB_CHALLENGEZONE_SUCCESS
	where Section = @Section and ClearTime != null Order by ClearTime asc

	-- 플레이어 이름 얻기
	select @PlayerName = CHARACTER_NAME
	from TB_CHARACTER 
	where CHARACTER_IDX = @PlayerID

	-- 플레이어 이름 얻기
	select @PartnerName = CHARACTER_NAME
	from TB_CHARACTER 
	where CHARACTER_IDX = @PartnerID

	-- 최종 정보 얻기
	select @PlayerName, @PartnerName, @ClearTime, @Section
end
GO
/****** Object:  StoredProcedure [dbo].[MP_CHALLENGEZONE_SUCCESS_SaveInfo]    Script Date: 07/30/2013 14:52:22 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
--챌린지 존 성공  정보 저장
CREATE   PROC [dbo].[MP_CHALLENGEZONE_SUCCESS_SaveInfo]         	(
									@PlayerID		int,
									@PartnerID		int,
									@Section	 	int,
									@ClearTime		int
									)
as
	Set Nocount on
	Set Xact_abort on

begin
	-- 레코드가 생성되어 있지 않으면 Insert
	if not exists (select null from TB_CHALLENGEZONE_SUCCESS where PlayerID = @PlayerID and PartnerID = @PartnerID and [Section] = @Section)
	begin
		insert TB_CHALLENGEZONE_SUCCESS
			(
			PlayerID,
			PartnerID,
			[Section],
			SuccessFreq,
			ClearTime
			)
		values
			(
			@PlayerID,
			@PartnerID,
			@Section,
			1,
			@ClearTime
			)
	end
	-- 레코드가 생성되어 있으면 Update. 저장되어 있는 성공회수 값에 +1 로 업데이트.
             -- 클리어 타임이 빨라졌다면, 빨라진 클리어 타임으로 설정
	else
	begin
		update TB_CHALLENGEZONE_SUCCESS 
		set	PlayerID = @PlayerID, 
			PartnerID = @PartnerID,
			[Section] = @Section,
			SuccessFreq = SuccessFreq+1,
			ClearTime = case when ClearTime >  @ClearTime or ClearTime = null  then @ClearTime else ClearTime end
		 where PlayerID = @PlayerID and PartnerID = @PartnerID and [Section] = @Section
	end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_NOTE_DeleteAll]    Script Date: 07/30/2013 14:53:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_NOTE_DeleteAll] ( @Character_idx int )
as
	Set Nocount On

delete tb_note where Receiver_idx = @Character_idx
GO
/****** Object:  StoredProcedure [dbo].[MP_NOTE_IsNewNote]    Script Date: 07/30/2013 14:53:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_NOTE_IsNewNote] (@character_idx int)
as
	set nocount on


if exists (select null from tb_note where Receiver_idx = @character_idx and bRead = 0) 
	select 1
else
	select 0
GO
/****** Object:  StoredProcedure [dbo].[MP_NOTE_DelNote]    Script Date: 07/30/2013 14:53:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_NOTE_DelNote] (@Character_idx int, @bUserDelete int, @NoteID int, @bLast int) 
as
	set nocount on
	Set Xact_abort on

declare @PackageItemIdx int
declare @PackageMoney int

select @PackageItemIdx = [PackageItemIdx],
		@PackageMoney = [PackageMoney]
from [dbo].[TB_NOTE]
where NOTE_IDX=@NoteID

-- 소포가 있는경우 유저삭제가 불가능하다.
if( 0 < @bUserDelete and
	(0<@PackageItemIdx or 0<@PackageMoney) )
begin
select -1
return
end

if(0 < @PackageItemIdx)
begin
	delete TB_ITEM				where ITEM_DBIDX = @PackageItemIdx	
	delete TB_ITEM_OPTION2		where ITEM_DBIDX = @PackageItemIdx
	delete TB_ITEM_DROP_OPTION	where ITEM_DBIDX = @PackageItemIdx
end

delete tb_note where Note_IDX = @NoteID
select @NoteID, @bLast, @PackageItemIdx, @PackageMoney







set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[MP_NOTE_GetNoteList]    Script Date: 07/30/2013 14:53:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE      proc [dbo].[MP_NOTE_GetNoteList] (@character_idx int, @pagesize int, @GotoPage INT , @isStored int)
as
	set nocount on

	declare @TotalMsgNum int
	declare @CeilingNum int
	DECLARE @SQL VARCHAR(400)
	DECLARE @filter varchar(100)

-- 100221 NYJ 쪽지->우편함 변경으로 선물쪽지기능 처리에 대한 부분제거

select @TotalMsgNum = count( Note_IDX ) from tb_note 
	where Receiver_IDX = @character_idx and bStored = @isStored

set @CeilingNum = ceiling((@TotalMsgNum - 1)/@pagesize) + 1

begin

	if(@GotoPage = 1)
		begin
			set @sql = 'select top ' + CONVERT(VARCHAR(10),@pagesize)
			set @sql = @sql + ' Note_IDX, Sender_Name,  convert(varchar(16),SendDate,20), convert(varchar(30), SendDate, 108), '
			set @sql = @sql + CONVERT(VARCHAR(10),@CeilingNum)
			set @sql = @sql + ', bRead, Title, PackageItemIdx, PackageMoney, ' + CONVERT(VARCHAR(10),@TotalMsgNum)
			set @sql = @sql + ' from tb_note where '
				if @isStored = 1
					begin
					set @sql = @sql + ' bStored <> 0 and'
					end
				else
					begin
					set @sql = @sql + ' bStored = 0 and'
					end
			set @sql = @sql + ' receiver_idx = ' 
			set @sql = @sql + CONVERT(VARCHAR(10),@character_idx)
			--set @sql = @sql + ' order by Note_IDX desc'
			set @sql = @sql + ' order by Note_IDX asc'
		end
	else
		begin
			set @sql = 'SELECT TOP ' + CONVERT(VARCHAR(10),@pagesize) 
			set @sql = @sql + ' '
			set @sql = @sql + 'Note_IDX, Sender_Name,   convert(varchar(16),SendDate,20), convert(varchar(30), SendDate, 108), '
			set @sql = @sql + CONVERT(VARCHAR(10),@CeilingNum)
			set @sql = @sql + ', bRead, Title, PackageItemIdx, PackageMoney, ' + CONVERT(VARCHAR(10),@TotalMsgNum)
			set @sql = @sql + ' from tb_note where' 
				if @isStored = 1
					begin
					set @sql = @sql + ' bStored <> 0 and'
					end
				else
					begin
					set @sql = @sql + ' bStored = 0 and'
					end
			set @sql = @sql + ' receiver_idx ='
			set @sql = @sql + CONVERT(VARCHAR(10),@character_idx)
			set @sql = @sql + ' and Note_IDX not in'
			set @sql = @sql + '(SELECT TOP ' + CONVERT(VARCHAR(10),((@GotoPage - 1) * @pagesize)) 
			set @sql = @sql + ' Note_IDX from tb_note where'
				if @isStored = 1
					begin
					set @sql = @sql + ' bStored <> 0 and'
					end
				else
					begin
					set @sql = @sql + ' bStored = 0 and'
					end
			set @sql = @sql + ' receiver_idx = ' + CONVERT(VARCHAR(10),@character_idx)
			--set @sql = @sql + ' order by Note_IDX desc) '
			set @sql = @sql + ' order by Note_IDX asc) '
			--set @sql = @sql + ' order by Note_IDX desc'
			set @sql = @sql + ' order by Note_IDX asc'
		end	

exec (@sql)
end
GO
/****** Object:  StoredProcedure [dbo].[MP_NOTE_GetPackage]    Script Date: 07/30/2013 14:53:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROC [dbo].[MP_NOTE_GetPackage] 
(
@CharacterIndex int,
@NoteIdx int,
@InvenPos int,
@PackageItemDBIdx int,
@PackageMoney int
)
AS 
SET  NOCOUNT  ON 

declare @ReceiverIndex int
declare @PackageItemOnDB int
declare @PackageMoneyOnDB int
declare @NoteTitle varchar(40)

select	@ReceiverIndex = Receiver_IDX,
		@PackageItemOnDB = PackageItemIdx,
		@PackageMoneyOnDB = PackageMoney,
		@NoteTitle = Title
from [dbo].[tb_note]
where NOTE_IDX=@NoteIdx and bRead=1

-- 蹂? 嶸?? ?檣
if(@ReceiverIndex <> @CharacterIndex)
begin
	return -1
end

if(0 < @PackageItemDBIdx)
begin
	if(@PackageItemDBIdx != @PackageItemOnDB)
	begin
	return -1
	end
end

if(0 < @PackageMoney)
begin
	if(@PackageMoney != @PackageMoneyOnDB)
	begin
	return -1
	end
end

if(@PackageItemOnDB > 0)
	begin
	update tb_note
	set PackageItemIdx = 0,
		PackageMoney = 0
	where note_idx = @NoteIdx

	SELECT	1,
			@PackageMoneyOnDB,
			A.ITEM_DBIDX,
			A.ITEM_IDX,
			@InvenPos,  -- 檜 ?檜蠱檜 ?橫陞 嶸?曖 檣漸蝸煜
			A.ITEM_QPOSITION,
			A.ITEM_DURABILITY,
			A.ITEM_PARAM,
			A.ITEM_SEAL, 
			A.ITEM_REMAINTIME,
			ISNULL( B.REINFORCE_STRENGTH, 0 ),
			ISNULL( B.REINFORCE_DEXTERITY, 0 ), 
			ISNULL( B.REINFORCE_VITALITY, 0 ),
			ISNULL( B.REINFORCE_INTELLIGENCE, 0 ), 
			ISNULL( B.REINFORCE_WISDOM, 0 ),
			ISNULL( B.REINFORCE_LIFE, 0 ),
			ISNULL( B.REINFORCE_MANA, 0 ), 
			ISNULL( B.REINFORCE_LIFE_RECOVERY, 0 ),
			ISNULL( B.REINFORCE_MANA_RECOVERY, 0 ), 
			ISNULL( B.REINFORCE_PHYSIC_ATTACK, 0 ),
			ISNULL( B.REINFORCE_PHYSIC_DEFENCE, 0 ), 
			ISNULL( B.REINFORCE_MAGIC_ATTACK, 0 ),
			ISNULL( B.REINFORCE_MAGIC_DEFENCE, 0 ), 
			ISNULL( B.REINFORCE_MOVE_SPEED, 0 ),
			ISNULL( B.REINFORCE_EVADE, 0 ), 
			ISNULL( B.REINFORCE_ACCURACY, 0 ),
			ISNULL( B.REINFORCE_CRITICAL_RATE, 0 ), 
			ISNULL( B.REINFORCE_CRITICAL_DAMAGE, 0 ),
			ISNULL( B.REINFORCE_MADEBY, '' ),
			ISNULL( B.MIX_STRENGTH, 0 ), 
			ISNULL( B.MIX_INTELLIGENCE, 0 ),
			ISNULL( B.MIX_DEXTERITY, 0 ),
			ISNULL( B.MIX_WISDOM, 0 ),
			ISNULL( B.MIX_VITALITY, 0 ), 
			ISNULL( B.MIX_MADEBY, '' ),
			ISNULL( B.ENCHANT_INDEX, 0 ),
			ISNULL( B.ENCHANT_LEVEL, 0 ), 
			ISNULL( B.ENCHANT_MADEBY, '' ),
			ISNULL( C.KEY1, 0 ),
			CAST( ROUND( ISNULL( C.VALUE1, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
			ISNULL( C.KEY2, 0 ),
			CAST( ROUND( ISNULL( C.VALUE2, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
			ISNULL( C.KEY3, 0 ),
			CAST( ROUND( ISNULL( C.VALUE3, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
			ISNULL( C.KEY4, 0 ),
			CAST( ROUND( ISNULL( C.VALUE4, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
			ISNULL( C.KEY5, 0 ),
			CAST( ROUND( ISNULL( C.VALUE5, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
			@NoteIdx,
			@NoteTitle
		FROM    TB_ITEM A  LEFT OUTER JOIN
				TB_ITEM_DROP_OPTION C  ON 
				A.ITEM_DBIDX = C.ITEM_DBIDX LEFT OUTER JOIN
				TB_ITEM_OPTION2 B  ON A.ITEM_DBIDX = B.ITEM_DBIDX
		WHERE	A.ITEM_DBIDX = @PackageItemDBIdx
	return
	end
else
	begin
	update tb_note
	set PackageMoney = 0
	where note_idx = @NoteIdx

	SELECT	2, @PackageMoneyOnDB, @NoteTitle
	end

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[MP_NOTE_SaveNote]    Script Date: 07/30/2013 14:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_NOTE_SaveNote] (@Character_idx int, @NoteID int, @bLast int) 
as
	set nocount on
	Set Xact_abort on

declare @bRead tinyint
declare @PackageItemIdx int
declare @PackageMoney int
select @bRead=bRead, @PackageItemIdx=PackageItemIdx, @PackageMoney=PackageMoney
from tb_note where Note_IDX = @NoteID

if(@bRead<>1 or (@PackageItemIdx<>0 or @PackageMoney<>0))
begin
select -1
return
end

update tb_note  set [bStored] = 1 where Note_IDX = @NoteID
select @NoteID, @bLast


SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[MP_NOTE_SendNoteID]    Script Date: 07/30/2013 14:54:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE  proc [dbo].[MP_NOTE_SendNoteID] ( @FromCharacterIDX int, @FromPlayerName varchar(16), @ToCharacterIDX int, @Note varchar(200) )
as
	set nocount on
	Set Xact_abort on

	declare @ToPlayerName varchar(16)

-- 2:invail user, 3: full space

if not exists (select null from tb_character where  character_idx  = @ToCharacterIDX)
	select 2  --invalid user

else
begin
	select @ToPlayerName = character_name from tb_character where character_idx  = @ToCharacterIDX

	if (select count(Receiver_IDX) from tb_note where Receiver_IDX = @ToCharacterIDX) >= 30
		select 3, @ToPlayerName  --full space
	
	else 
		begin
			insert tb_note (
				Receiver_IDX,
				Sender_Name,
				Note
				)
			values (
				@ToCharacterIDX,
				@FromPlayerName,
				@Note
				)
				
			if not exists (select character_currentmap from tb_character where character_idx = @ToCharacterIDX)
				set @ToCharacterIDX = 0
			select 0, @ToPlayerName,  @ToCharacterIDX--success
		end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_CHANGE_NAME]    Script Date: 07/30/2013 14:52:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE         PROC [dbo].[MP_CHARACTER_CHANGE_NAME]
(
@character_after VARCHAR(16),
@character_idx	INT,
@item_idx	INT,
@item_pos	INT
)
AS 
SET NOCOUNT ON

DECLARE @character_before varchar(16)

IF EXISTS(SELECT * FROM TB_NOTE WHERE [Receiver_IDX] = @character_idx and
			(0<[PackageItemIdx] or 0<[PackageMoney]))
	BEGIN
		SELECT 7 -- 辦??? 模?(?檜蠱,?萄)陛 氈?.
		RETURN
	END

IF EXISTS(SELECT * FROM TB_CONSIGNMENT WHERE [CHARACTER_IDX] = @character_idx)
	BEGIN
		SELECT 6 -- ?衙渠?? 蛔煙脹 鼻?檜 氈?.
		RETURN
	END

IF EXISTS(SELECT * FROM dbo.tb_character WHERE character_name = @character_after)
	BEGIN 
		SELECT 5 --?? 議葛檜?.
		RETURN 
	END

IF EXISTS(SELECT * FROM dbo.tb_character WHERE character_idx = @character_idx AND CHARACTER_MUNPAIDX > 0)
	BEGIN 
		SELECT 4 --望萄? 陛殮檜 腎橫氈?.
		RETURN 
	END

IF EXISTS(SELECT * FROM tb_party WHERE character_idx = @character_idx)
	BEGIN 
		SELECT 3 --??? 陛殮檜 腎橫氈?.
		RETURN 
	END

IF EXISTS(SELECT * FROM dbo.tb_character WHERE character_idx = @character_idx AND CHARACTER_FAMILYIDX > 0)
	BEGIN
		SELECT 2 -- ?塵葬? 陛殮檜 腎橫氈?.
		RETURN
	END

--IF EXISTS(SELECT * FROM TB_WANTEDINFO WHERE WantedChr_Idx = @character_idx)
--	BEGIN 
--		SELECT 2 -- 繫? 渠鼻跡煙? 氈?.
--		RETURN 
--	END

	SELECT @character_before = character_name 
	FROM tb_character WITH(READUNCOMMITTED)
	WHERE character_idx = @character_idx

BEGIN TRAN

	UPDATE dbo.tb_character 
	SET character_name = @character_after 
	WHERE character_idx = @character_idx  

	-- 080116 KTH "錠輿? 蹂??煎 罐?憮 匐儀檜 ???? ?晦 嬪?憮 ?陛"
	UPDATE dbo.tb_charactercreateinfo 
	SET character_name = @character_after
	WHERE character_idx = @character_idx
	
	DELETE tb_note WHERE receiver_idx = @character_idx

	DELETE tb_friend where  Character_idx = @character_idx or Friend_idx = @character_idx
	
	-- ?憮??憮 霜? 煎斜? 陳溥遽?.
	--EXEC LUNA_LOGDB.dbo.UP_charrename_log_insert @character_idx,@character_before,@character_after

IF @@ERROR > 0 
BEGIN 
	ROLLBACK TRAN
	SELECT 1 
END
ELSE
BEGIN
	COMMIT TRAN
	SELECT 0, @character_after, @item_idx, @item_pos
END





----------------------------
-- 議葛攪 餉薯 ?煎衛? 熱薑
----------------------------
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[MP_NOTE_ReadNote]    Script Date: 07/30/2013 14:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    proc [dbo].[MP_NOTE_ReadNote] (@character_idx int, @NoteIDX int, @IsFront int) -- @IsFront = 1 : 최신꺼, 0 : 전에꺼
as
set nocount on

	declare @noteid int
	declare @senderName varchar(30)
	declare @note varchar(500)
	declare @itemIdx int
	declare @packageItemIdx int
	declare @packageMoney int
	declare @itemInfo varchar(500)

begin
	update tb_note set bRead = 1 where note_idx = @NoteIDX
	select @packageItemIdx = PackageItemIdx
	from tb_note with(nolock) where Note_IDX = @NoteIDX and Receiver_IDX = @character_idx
	
	if(@packageItemIdx=0 and @packageMoney=0)
	begin
		select	Note_IDX, 
			Sender_Name, 
			Note,item_idx,
			0, -- No PackageItem
			PackageMoney
			from tb_note with(nolock)
			where receiver_idx = @character_idx and Note_IDX = @NoteIDX
	end
	else
	begin
		select	@noteid = Note_IDX, 
			@senderName = Sender_Name, 
			@note = Note,
			@itemIdx = item_idx,
			@packageMoney = PackageMoney 
			from tb_note with(nolock)
			where receiver_idx = @character_idx and Note_IDX = @NoteIDX

		select @itemInfo = 
			CONVERT(VARCHAR(10),A.ITEM_DBIDX) + ','
			+ CONVERT(VARCHAR(10),A.ITEM_IDX) + ','
			+ CONVERT(VARCHAR(10),A.ITEM_POSITION) + ','
	        + CONVERT(VARCHAR(10),A.ITEM_QPOSITION) + ','
	        + CONVERT(VARCHAR(10),A.ITEM_DURABILITY) + ','
	        + CONVERT(VARCHAR(10),A.ITEM_PARAM) + ','
	        + CONVERT(VARCHAR(10),A.ITEM_SEAL) + ','
			+ CONVERT(VARCHAR(10),DATEDIFF(SECOND, GETDATE(), A.ITEM_ENDTIME)) + ','
			+ CONVERT(VARCHAR(10),A.ITEM_REMAINTIME) + ','
			+ CONVERT(VARCHAR(10),ISNULL( B.REINFORCE_STRENGTH, 0 )) + ','
	        + CONVERT(VARCHAR(10),ISNULL( B.REINFORCE_DEXTERITY, 0 )) + ','
	        + CONVERT(VARCHAR(10),ISNULL( B.REINFORCE_VITALITY, 0 )) + ','
	        + CONVERT(VARCHAR(10),ISNULL( B.REINFORCE_INTELLIGENCE, 0 )) + ','
	        + CONVERT(VARCHAR(10),ISNULL( B.REINFORCE_WISDOM, 0 )) + ','
	        + CONVERT(VARCHAR(10),ISNULL( B.REINFORCE_LIFE, 0 )) + ','
	        + CONVERT(VARCHAR(10),ISNULL( B.REINFORCE_MANA, 0 )) + ','
	        + CONVERT(VARCHAR(10),ISNULL( B.REINFORCE_LIFE_RECOVERY, 0 )) + ','
	        + CONVERT(VARCHAR(10),ISNULL( B.REINFORCE_MANA_RECOVERY, 0 )) + ','
	        + CONVERT(VARCHAR(10),ISNULL( B.REINFORCE_PHYSIC_ATTACK, 0 )) + ','
	        + CONVERT(VARCHAR(10),ISNULL( B.REINFORCE_PHYSIC_DEFENCE, 0 )) + ','
	        + CONVERT(VARCHAR(10),ISNULL( B.REINFORCE_MAGIC_ATTACK, 0 )) + ','
	        + CONVERT(VARCHAR(10),ISNULL( B.REINFORCE_MAGIC_DEFENCE, 0 )) + ','
	        + CONVERT(VARCHAR(10),ISNULL( B.REINFORCE_MOVE_SPEED, 0 )) + ','
	        + CONVERT(VARCHAR(10),ISNULL( B.REINFORCE_EVADE, 0 )) + ','
	        + CONVERT(VARCHAR(10),ISNULL( B.REINFORCE_ACCURACY, 0 )) + ','
	        + CONVERT(VARCHAR(10),ISNULL( B.REINFORCE_CRITICAL_RATE, 0 )) + ','
	        + CONVERT(VARCHAR(10),ISNULL( B.REINFORCE_CRITICAL_DAMAGE, 0 )) + ','
			+ '<' + CONVERT(VARCHAR(16),ISNULL( B.REINFORCE_MADEBY, '' )) + '>,'
	        + CONVERT(VARCHAR(10),ISNULL( B.MIX_STRENGTH, 0 )) + ','
	        + CONVERT(VARCHAR(10),ISNULL( B.MIX_INTELLIGENCE, 0 )) + ','
	        + CONVERT(VARCHAR(10),ISNULL( B.MIX_DEXTERITY, 0 )) + ','
	        + CONVERT(VARCHAR(10),ISNULL( B.MIX_WISDOM, 0 )) + ','
	        + CONVERT(VARCHAR(10),ISNULL( B.MIX_VITALITY, 0 )) + ','
			+ '<' + CONVERT(VARCHAR(16),ISNULL( B.MIX_MADEBY, '' )) + '>,'
	        + CONVERT(VARCHAR(10),ISNULL( B.ENCHANT_INDEX, 0 )) + ','
	        + CONVERT(VARCHAR(10),ISNULL( B.ENCHANT_LEVEL, 0 )) + ','
			+ '<' + CONVERT(VARCHAR(16),ISNULL( B.ENCHANT_MADEBY, '' )) + '>,'
			+ CONVERT(VARCHAR(10),ISNULL( C.KEY1, 0 )) + ','
	        + CONVERT(VARCHAR(10),CAST( ROUND( ISNULL( C.VALUE1, 0 ), 3, 3 ) AS VARCHAR( 16 ) )) + ','
	        + CONVERT(VARCHAR(10),ISNULL( C.KEY2, 0 )) + ','
	        + CONVERT(VARCHAR(10),CAST( ROUND( ISNULL( C.VALUE2, 0 ), 3, 3 ) AS VARCHAR( 16 ) )) + ','
	        + CONVERT(VARCHAR(10),ISNULL( C.KEY3, 0 )) + ','
	        + CONVERT(VARCHAR(10),CAST( ROUND( ISNULL( C.VALUE3, 0 ), 3, 3 ) AS VARCHAR( 16 ) )) + ','
	        + CONVERT(VARCHAR(10),ISNULL( C.KEY4, 0 )) + ','
	        + CONVERT(VARCHAR(10),CAST( ROUND( ISNULL( C.VALUE4, 0 ), 3, 3 ) AS VARCHAR( 16 ) )) + ','
	        + CONVERT(VARCHAR(10),ISNULL( C.KEY5, 0 )) + ','
	        + CONVERT(VARCHAR(10),CAST( ROUND( ISNULL( C.VALUE5, 0 ), 3, 3 ) AS VARCHAR( 16 ) ))
			FROM	TB_ITEM A LEFT OUTER JOIN
					TB_ITEM_DROP_OPTION C ON 
					A.ITEM_DBIDX = C.ITEM_DBIDX LEFT OUTER JOIN
					TB_ITEM_OPTION2 B ON A.ITEM_DBIDX = B.ITEM_DBIDX
			WHERE @packageItemIdx = A.ITEM_DBIDX

		select @noteid, @senderName, @note, @itemIdx, @packageItemIdx, @packageMoney, @ItemInfo
	end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_NOTE_CheckDate]    Script Date: 07/30/2013 14:53:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROC [dbo].[MP_NOTE_CheckDate] 
(
@CharacterIndex int
)
AS 
SET  NOCOUNT  ON 

declare @OverDate smalldatetime

set @OverDate = dateadd(day, -60, getdate())

SELECT  [Note_IDX], [PackageItemIdx], [PackageMoney], [Title]
from [dbo].[TB_NOTE] with (nolock)
where Receiver_IDX = @CharacterIndex and
		bStored = 0 and
		SendDate < @OverDate


set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[MP_NOTEJOB_DELETE]    Script Date: 07/30/2013 14:54:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create    PROC [dbo].[MP_NOTEJOB_DELETE]
AS
SET NOCOUNT ON
delete dbo.tb_note From dbo.tb_note XX inner JOIN
	(
		select note_idx from 
			(
			select A.note_idx,A.Receiver_IDX ,del = count(*)
			from dbo.tb_note A WITH(READUNCOMMITTED)
			inner join dbo.tb_note B WITH(READUNCOMMITTED)
			on A.Receiver_IDX=B.Receiver_IDX 
			and A.note_idx <= B.note_idx 
			WHERE A.item_idx >0 AND B.item_idx >0
			group by A.Receiver_IDX,A.note_idx
			)X
		where X.del > 10
	)YY 
on XX.note_idx = YY.note_idx
GO
/****** Object:  StoredProcedure [dbo].[MP_NOTE_SendNote]    Script Date: 07/30/2013 14:54:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROC [dbo].[MP_NOTE_SendNote] 
(
@ToPlayerName varchar(16),
@FromPlayerName varchar(16),
@Title varchar(40),
@Note varchar(600),
@PackageItemDBIdx int,
@PackageMoney int,
@SendDate smalldatetime = 0, -- 보낸날자 지정이 필요할 경우.
@NoResult tinyint = 0 -- 다른 프로시저에서 exec로 호출시 결과값 리턴받지 않기위함.
) 
AS
SET  NOCOUNT  ON 
DECLARE @ToPlayerID int
DECLARE @CheckSendDate smalldatetime

if(@SendDate <> 0)
	begin
	set @CheckSendDate = @SendDate
	end
else
	begin
	set @CheckSendDate = getdate()
	end 

-- 2:invail user, 3: full space

--캐릭이름이 정확하냐???
IF  NOT  EXISTS  (SELECT * FROM dbo.tb_character WITH(READUNCOMMITTED) WHERE  character_name = @ToPlayerName)
	SELECT  2, @ToPlayerName --invalid user

ELSE
BEGIN
	SELECT @ToPlayerID = character_idx FROM dbo.tb_character WITH(READUNCOMMITTED) WHERE character_name = @ToPlayerName

	if(@PackageItemDBIdx <> 0)
	begin
	update [dbo].[TB_ITEM]
	set [CHARACTER_IDX] = 0
	where [ITEM_DBIDX] = @PackageItemDBIdx
	end

	INSERT tb_note 
	(
	Receiver_IDX,
	Sender_Name,
	Title,
	Note,
	SendDate,
	PackageItemIdx,
	PackageMoney
	)
	values 
	(
	@ToPlayerID,
	@FromPlayerName,
	@Title,
	@Note,
	@CheckSendDate,
	@PackageItemDBIdx,
	@PackageMoney
	)

	if(@NoResult = 1) -- 결과값을 원치 않는다. 여기서 리턴처리
	begin
	return
	end

	--//쪽지 받는 사람이 로그아웃 상태이다.
	if EXISTS(SELECT character_currentmap from dbo.tb_character with(readuncommitted) where character_idx = @ToPlayerID AND character_currentmap = 0) 
		SET  @ToPlayerID = 0	

	SELECT 0, @ToPlayerName,  @ToPlayerID--success
END
GO
/****** Object:  StoredProcedure [dbo].[MP_character_rename]    Script Date: 07/30/2013 14:52:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MP_character_rename]
(
@character_idx INT,
@character_after VARCHAR(16),
@item_position int
)
AS 
SET NOCOUNT ON

DECLARE @character_before varchar(16)

IF EXISTS(SELECT * FROM dbo.tb_character WHERE character_name = @character_after)
	BEGIN 
		SELECT 5 --중복 캐릭이다.
		RETURN 
	END

IF EXISTS(SELECT * FROM dbo.tb_character WHERE character_idx = @character_idx AND CHARACTER_MUNPAIDX > 0)
	BEGIN 
		SELECT 4 --문파에 가입이 되어있다.
		RETURN 
	END

IF EXISTS(SELECT * FROM tb_party WHERE character_idx = @character_idx)
	BEGIN 
		SELECT 3 -- 방파에 가입이 되어있다.
		RETURN 
	END

IF EXISTS(SELECT * FROM TB_WANTEDINFO WHERE WantedChr_Idx = @character_idx)
	BEGIN 
		SELECT 2 -- 척살 대상목록에 있다.
		RETURN 
	END

	SELECT @character_before = character_name 
	FROM tb_character WITH(READUNCOMMITTED)
	WHERE character_idx = @character_idx

BEGIN TRAN

	UPDATE dbo.tb_character 
	SET character_name = @character_after 
	WHERE character_idx = @character_idx  
	
	DELETE tb_note WHERE receiver_idx = @character_idx

	DELETE tb_friend where  Character_idx = @character_idx or Friend_idx = @character_idx
	
	--서버셋마다 디비명을 바꿔 주세요!!
	EXEC LUNA_LOGDB.dbo.UP_charrename_log_insert @character_idx,@character_before,@character_after

IF @@ERROR > 0 
BEGIN 
	ROLLBACK TRAN
	SELECT 1 
END 
ELSE 
BEGIN 
	COMMIT TRAN
	SELECT 0 , @item_position  -- 성공!!
END
GO
/****** Object:  StoredProcedure [dbo].[MP_NOTE_RestorePackage]    Script Date: 07/30/2013 14:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROC [dbo].[MP_NOTE_RestorePackage]
(
@CharacterIndex int,
@NoteIdx int,
@PackageItemDBIdx int,
@PackageMoney int
)
AS 
SET  NOCOUNT  ON 

update [dbo].[TB_NOTE]
set PackageItemIdx = @PackageItemDBIdx,
	PackageMoney = @PackageMoney
where note_idx = @NoteIdx

return




--------------------
-- ?煎衛? ?? 熱薑?萄
--------------------
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[RP_UpdateCharacterInfo]    Script Date: 07/30/2013 14:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    proc [dbo].[RP_UpdateCharacterInfo]
(
	@CharIdx	int,
	@exppoint	int,
	@level		int,
	@badfame	int,
	@Strength		int,
	@Dexterity	int,
	@Vitality	int,
	@Intelligence	int,
	@Wisdom	int,
	@uppoint	int,
	@money		int,
	@abilexp	int
)
as

	set nocount on

	update tb_character set 
		character_str		=	@Strength		,
		character_dex		=	@Dexterity	,
		character_vit		=	@Vitality	,
		character_int		=	@Intelligence	,
		character_wis		=	@Wisdom	,
		character_badfame	=	@badfame	,
		character_grade		=	@level		,
		character_expoint	=	@exppoint	,
		character_gradeuppoint	=	@uppoint	,
		character_money	=	@money		--,
--		character_abilityexp	=	@abilexp
	where character_idx = @CharIdx
GO
/****** Object:  StoredProcedure [dbo].[TP_CharacterMainPetList]    Script Date: 07/30/2013 14:55:04 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** 개체: 저장 프로시저 dbo.TP_CharacterMainPetList    스크립트 날짜: 2006-06-30 오후 7:58:19 ******/
CREATE     proc [dbo].[TP_CharacterMainPetList]
(
		@chrIdx	int
)
as
	Set Nocount On
	
	declare	@PETIDXCH	int

	select		@PETIDXCH = count(PETDBIDX)
	from		TB_PETINFO as a
	inner join	tb_item as b
	on		a.summonitemdbidx = b.item_dbidx
	inner join	tb_character as c
	on		b.character_idx = c.character_idx		
	where		c.character_idx = @chrIdx


	if( @PETIDXCH = 0 )
		begin
			select 0
			return
		end
	else
		begin
			select		a.PetDBIdx, a.Kind, a.Grade, a.Stamina, a.FriendShip
			from		TB_PETINFO as a
			inner join	tb_item as b
			on		a.summonitemdbidx = b.item_dbidx
			inner join	tb_character as c
			on		b.character_idx = c.character_idx		
			where		c.character_idx = @chrIdx

		end
GO
/****** Object:  StoredProcedure [dbo].[MP_LoginCharacterSearchForName]    Script Date: 07/30/2013 14:53:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[MP_LoginCharacterSearchForName]
(
	@Character_Name varchar(16),
	@Character_idx int
)
as
	set nocount on
	set xact_abort on

-- 1:invalid user, 2: not login
--	declare @count int
	declare @SenderName varchar(16)
	declare @ReceiverIDX int
	declare @Curmap tinyint
	set @ReceiverIDX  = 0
	set @Curmap = 0

	select @SenderName = Character_name from tb_Character where character_idx = @Character_idx
	select @ReceiverIDX = character_idx, @Curmap =  character_currentmap
		from tb_character where Character_Name = @Character_Name

--	select @count=count(*) from tb_character where Character_name = @character_name
--	if(@count = 0)
	if (@ReceiverIDX) = 0
		begin
			select 1
		end
	else
		begin
--			select @count=count(*) from tb_LoginMapInfo where Character_Name = @Character_Name
--			if(@count = 0)
			if  (@Curmap) = 0
				begin
					select 2
				end
			else
				begin
--					select @SenderName, * from tb_LoginMapInfo where Character_Name = @Character_Name
					select @SenderName, @ReceiverIDX, @Curmap
				end
		end
GO
/****** Object:  StoredProcedure [dbo].[MP_LoginMapInfo_Regist]    Script Date: 07/30/2013 14:53:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     proc [dbo].[MP_LoginMapInfo_Regist]
(
	@Character_idx int,
	@Character_name varchar(16),
	@MapNum tinyint,
	@MapPort int
)
as
	set nocount on
--	set xact_abort on
-------------------------
	update tb_character set character_currentmap = @MapNum where character_idx = @Character_idx
-------------------------
GO
/****** Object:  StoredProcedure [dbo].[up_useridx_search_by_chr_name]    Script Date: 07/30/2013 14:55:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
제   목:루나 관리자페이지 캐릭명으로 유저아이디 찾기
작성자:이문수(rabara@nate.com)     
작성일:2008-01-17      
수정자:      
수정일:
메   모:
*/

create proc [dbo].[up_useridx_search_by_chr_name]
@chrname varchar(20),
@useridx int output

as

set @useridx = (select user_idx from tb_character with(nolock) where character_name = @chrname)
return
GO
/****** Object:  StoredProcedure [dbo].[MP_FARM_LoadFarmState]    Script Date: 07/30/2013 14:52:56 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- 농장의 상태를 DB에서 읽어옴
CREATE     PROC [dbo].[MP_FARM_LoadFarmState] (@ZONE_INDEX int, @FARM_INDEX int)
as
	Set Nocount on
	Set Xact_abort on

begin
	-- 레코드가 생성되어 있지 않으면return
	if not exists (select null from TB_FARM_FARM where Zone = @ZONE_INDEX and Farm = @FARM_INDEX)
	begin
		return
	end
	-- 레코드가 생성되어 있으면 read
	else 
	begin
		-- 농장 관리비 납부 상태
		declare @TaxArrearageFreq int
		declare @TaxPayPlayerID int
		declare @TaxPayPlayerName varchar(16)

		set @TaxArrearageFreq = 0
		set @TaxPayPlayerID = 0

		-- 연체 횟수, 납부 플레이어 얻기
		select @TaxArrearageFreq = TaxArrearageFreq , @TaxPayPlayerID = TaxPayPlayerID
		from TB_FARM_TAX
		where Zone = @ZONE_INDEX and Farm = @FARM_INDEX

		-- 납부 플레이어 이름 얻기
		select @TaxPayPlayerName = CHARACTER_NAME
		from TB_CHARACTER 
		where CHARACTER_IDX = @TaxPayPlayerID

		select Zone, Farm, FarmState, FarmOwnerID, GardenGrade, HouseGrade, WarehouseGrade, AnimalCageGrade, FenceGrade, @TaxArrearageFreq, @TaxPayPlayerName
		from TB_FARM_FARM with(nolock) 
		where Zone = @ZONE_INDEX and Farm = @FARM_INDEX
	end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_GM_FORBIDCHAT_UPDATE]    Script Date: 07/30/2013 14:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_GM_FORBIDCHAT_UPDATE] (@OperatorIdx int, @TargetIdx int, @ForbidReason varchar (100), @ForbidTime int, @ForbidType smallint)

as

	Set Nocount on

	declare @Result      tinyint
	declare @ReleaseDate smalldatetime
	declare @CurrentDate smalldatetime
	set		@CurrentDate = getdate()

	if @ForbidType = 1	-- 瓣??雖 ?陛
		begin
			declare @Operator_Name	varchar(16)
			set		@Operator_Name = ''
			select @Operator_Name = Character_Name from TB_CHARACTER where Character_Idx = @OperatorIdx 

			set		@ReleaseDate =  dateadd("s", @ForbidTime, @CurrentDate)	
			set		@Result = 1
			
			insert TB_FORBIDCHAT_LIST (Character_Idx, RegistDate, ReleaseDate, Operator_Name, Reason)
			values(@TargetIdx, @CurrentDate, @ReleaseDate, @Operator_Name, @ForbidReason)	
		end
	else				-- 瓣??雖 ?薯
		begin
			declare @RegisterDate smalldatetime

			select @RegisterDate = RegistDate 
			from TB_FORBIDCHAT_LIST 
			where Character_Idx = @TargetIdx 
			order by RegistDate 
			

			update TB_FORBIDCHAT_LIST
			set ReleaseDate = dateadd("m", -1, @CurrentDate)
			where Character_Idx = @TargetIdx and RegistDate = @RegisterDate
			
			set		@ReleaseDate =  dateadd("m", -1, @CurrentDate)
			set		@Result = 0
		end

	select @Result, @TargetIdx, DATEDIFF( second, '1970-01-01 09:00:00', @ReleaseDate )
	return

SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[MP_FARM_SendNote_DelFarm]    Script Date: 07/30/2013 14:52:57 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 관리비 체납 농작 삭제 시 멤버에게 쪽지 전송
CREATE   PROC [dbo].[MP_FARM_SendNote_DelFarm]		         	(
										@FarmOwnerID	int
									)
as
	Set Nocount on
	Set Xact_abort on

begin
	select CHARACTER_NAME
	from TB_CHARACTER 
	where CHARACTER_IDX = @FarmOwnerID
end
GO
/****** Object:  StoredProcedure [dbo].[MP_FARM_SELECT]    Script Date: 07/30/2013 14:52:56 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/*
081017 LUJ, 농장 정보를 일괄로 쿼리함
090520 LUJ, 세금 정보가 없을 때 농장 정보를 쿼리하지 못하는 문제 수정
090708 LUJ, 세금 정보가 없을 때 농장 정보를 쿼리하지 못하는 문제 수정
*/
CREATE       PROC [dbo].[MP_FARM_SELECT]
(
	@ZONE_IDX 	INT
)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON

	SELECT TOP 100
		F.FARM,
		F.FARMSTATE,
		F.FARMOWNERID,
		F.GARDENGRADE,
		F.HOUSEGRADE,
		F.WAREHOUSEGRADE,
		F.ANIMALCAGEGRADE,
		F.FENCEGRADE,
		ISNULL( TAX.FREQUENCY, 0 ) AS FREQUENCY,
		ISNULL( TAX.CHAR_NAME, '' ) AS PAY_PLAYER_NAME
	FROM TB_FARM_FARM F LEFT JOIN
		(
			SELECT	T.FARM FARM,
				T.TAXARREARAGEFREQ FREQUENCY,
				C.CHARACTER_NAME CHAR_NAME
			FROM 	TB_FARM_TAX T INNER JOIN TB_CHARACTER C ON
				T.TAXPAYPLAYERID = C.CHARACTER_IDX
		) TAX ON F.FARM = TAX.FARM
	WHERE F.ZONE = @ZONE_IDX
		
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_STORAGE_SELECT]    Script Date: 07/30/2013 14:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071228 LUJ, 창고 정보를 가져옴
*/
CREATE PROCEDURE [dbo].[TP_STORAGE_SELECT]
(
	@CHAR_IDX	INT
)
AS
	SET NOCOUNT ON
	
	DECLARE @USER_IDX INT
	
	SELECT	@USER_IDX = USER_IDX
	FROM	TB_CHARACTER
	WHERE	CHARACTER_IDX = @CHAR_IDX
	
	SELECT  User_IDX, PyogukNum, PyogukMoney
	FROM    TB_PYOGUK
	WHERE	User_IDX = @USER_IDX
	
	
	SELECT   P.User_IDX, P.PyogukNum, P.PyogukMoney, C.CHARACTER_INVENTORY
	FROM      TB_CHARACTER C INNER JOIN
	                TB_PYOGUK P ON C.USER_IDX = P.User_IDX
	WHERE   (C.CHARACTER_IDX = @CHAR_IDX)
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_STORAGE_UPDATE]    Script Date: 07/30/2013 14:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071228 LUJ, 추가
*/
CREATE PROCEDURE [dbo].[TP_STORAGE_UPDATE]
(
	@CHAR_IDX	INT,
	@SIZE		TINYINT,
	@MONEY		BIGINT	
)
AS
	SET NOCOUNT ON
	
	DECLARE @USER_IDX INT
	
	SELECT	@USER_IDX = USER_IDX
	FROM	TB_CHARACTER
	WHERE	CHARACTER_IDX = @CHAR_IDX
	
	IF NOT EXISTS
	(
		SELECT	NULL
		FROM	TB_PYOGUK 
		WHERE	USER_IDX = @USER_IDX
	)
	BEGIN
		INSERT INTO TB_PYOGUK
	                (User_IDX, PyogukNum, PyogukMoney)
		VALUES   (@USER_IDX, @SIZE, @MONEY)
	END
	ELSE
	BEGIN
		UPDATE	TB_PYOGUK
		SET		PYOGUKNUM = @SIZE, PYOGUKMONEY = @MONEY
		WHERE	USER_IDX = @USER_IDX
	END
	
	SELECT @USER_IDX, @SIZE, @MONEY	
	RETURN 


select *
from tb_character
where character_idx = 802

select *
from tb_item
where character_idx = 802

update tb_item
set item_shopidx = 156
where item_dbidx = 24026350

select *
from tb_item
where item_shopidx > 0
GO
/****** Object:  StoredProcedure [dbo].[MP_SHOPITEM_UseInfo_JP]    Script Date: 07/30/2013 14:54:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE                proc [dbo].[MP_SHOPITEM_UseInfo_JP]
(
		@Character_IDX		int
)

as
Set Nocount On

declare @UserIdx		int
select @UserIdx = USER_IDX from tb_character where character_idx=@Character_idx

select  A.ITEM_IDX, A.ITEM_DBIDX, A.ITEM_PARAM, A.BEGIN_TIME, A.REMAIN_TIME,isnull(B.item_position,0)
from TB_SHOPITEMUSEINFO A with(readuncommitted)  
left outer join Tb_item B with(readuncommitted)  on A.item_dbidx= B.item_dbidx
where A.CHARACTER_IDX=@Character_IDX or A.USER_IDX=@UserIdx
GO
/****** Object:  StoredProcedure [dbo].[TP_USER_DELETED_PLAYER_SELECT]    Script Date: 07/30/2013 14:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[TP_USER_DELETED_PLAYER_SELECT]
(
	@USER_IDX	INT,
	@CHAR_IDX	INT
)
AS
	SET NOCOUNT ON
	
	SELECT  TOP 100
			A.CHARACTER_IDX,
			A.CHARACTER_GRADE,
			B.CHARACTER_NAME,
			@USER_IDX
	FROM    TB_CHARACTER A INNER JOIN
	        TB_CharacterCreateInfo B ON A.CHARACTER_IDX = B.CHARACTER_IDX
	WHERE   (A.USER_IDX = @USER_IDX) AND
			(A.CHARACTER_IDX > @CHAR_IDX) AND 
			(B.DELETE_IP IS NOT NULL) AND
			(B.FLAG = 2)
	ORDER BY A.CHARACTER_IDX
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_USER_LIVE_PLAYER_SELECT]    Script Date: 07/30/2013 14:55:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주: 복구 플래그를 구분하여 읽도록 함
*/
CREATE  PROCEDURE [dbo].[TP_USER_LIVE_PLAYER_SELECT]
(
	@USER_IDX	INT,
	@CHAR_IDX	INT
)
AS
	SET NOCOUNT ON
	
	/*
	SELECT  TOP 100
			A.CHARACTER_IDX,
			A.CHARACTER_GRADE,
			A.CHARACTER_NAME,
			@USER_IDX
	FROM    TB_CHARACTER A INNER JOIN
	        TB_CharacterCreateInfo B ON A.CHARACTER_IDX = B.CHARACTER_IDX
	WHERE   (A.USER_IDX = @USER_IDX) AND
			(A.CHARACTER_IDX > @CHAR_IDX)
	ORDER BY A.CHARACTER_IDX
	*/
	
	SELECT  TOP 100
			A.CHARACTER_IDX,
			A.CHARACTER_GRADE,
			A.CHARACTER_NAME, 
	        @USER_IDX
	FROM    TB_CHARACTER A INNER JOIN
	        TB_CharacterCreateInfo B ON A.CHARACTER_IDX = B.CHARACTER_IDX
	WHERE   (A.USER_IDX = @USER_IDX) AND (A.CHARACTER_IDX > @CHAR_IDX) AND B.FLAG <> 2
	ORDER BY A.CHARACTER_IDX
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_SearchMemberNumFromCharName]    Script Date: 07/30/2013 14:55:18 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- CharName
CREATE     proc [dbo].[TP_SearchMemberNumFromCharName]
(
	@CharName	varchar(20)
)

as
	Set Nocount on

	select USER_IDX	from TB_CHARACTER with(nolock) where CHARACTER_NAME = @CharName
GO
/****** Object:  StoredProcedure [dbo].[MP_GM_Control_GetList]    Script Date: 07/30/2013 14:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MP_GM_Control_GetList]
(
	@CHARACTER_IDX		int
)
as

	set nocount on
	set xact_abort on

	declare @User_IDX int

	select @User_IDX =User_Idx from tb_character where character_idx = @CHARACTER_IDX

	
	select Character_Idx,ID,Kind,StartDate,EndDate
	from tb_gmcontrol 
	Where character_idx = @character_idx or user_idx = @user_idx
GO
/****** Object:  StoredProcedure [dbo].[MP_STORAGE_ListInfo]    Script Date: 07/30/2013 14:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_STORAGE_ListInfo] ( 	@CHARACTER_IDX int )
as
	set nocount on
	
	declare @useridx int
	declare @pyoguknum tinyint

select @useridx = user_idx  from tb_character WHERE CHARACTER_IDX = @CHARACTER_IDX
if exists ( select null from tb_pyoguk where user_idx = @useridx ) 
	select @pyoguknum = pyoguknum from tb_pyoguk  where user_idx = @useridx
else 
	select @pyoguknum = 0
GO
/****** Object:  StoredProcedure [dbo].[TP_SearchPetList]    Script Date: 07/30/2013 14:55:18 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** 개체: 저장 프로시저 dbo.TP_SearchPetList    스크립트 날짜: 2006-06-30 오후 7:58:19 ******/
CREATE     proc [dbo].[TP_SearchPetList]
(
		@useridx	int	
)
as
	Set Nocount On
	
	declare	@PETIDXCH	int

		select	@PETIDXCH = count(*)
		from	tb_petinfo as a
		left join	tb_item as b
		on	a.summonitemdbidx = b.item_dbidx
		left join	tb_character as c
		on	b.character_idx = c.character_idx	
		where	masteridx = @useridx

	if( @PETIDXCH = 0 )
		begin
			select 0
			return
		end
	else
		begin

			select	a.PetDBIdx, a.Kind, a.Grade, a.Stamina, a.FriendShip, isnull(c.character_idx,0), isnull(c.character_name,'')
			from	tb_petinfo as a
			left join	tb_item as b
			on	a.summonitemdbidx = b.item_dbidx
			left join	tb_character as c
			on	b.character_idx = c.character_idx	
			where	masteridx = @useridx
		end
GO
/****** Object:  StoredProcedure [dbo].[TP_SearchPetInfo]    Script Date: 07/30/2013 14:55:18 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** 개체: 저장 프로시저 dbo.TP_SearchPetInfo    스크립트 날짜: 2006-06-30 오후 7:58:19 ******/
CREATE     proc [dbo].[TP_SearchPetInfo]
(
		@PETIDX	INT
)
as
	Set Nocount On
	
	declare	@PETIDXCH	int

	select		@PETIDXCH = count(a.PetDBIdx)
	from		TB_PETINFO as a
	left join		tb_item as b
	on		a.summonitemdbidx = b.item_dbidx
	left join		tb_character as c
	on		b.character_idx = c.character_idx			
	where		a.PetDBIdx = @PETIDX

	if( @PETIDXCH = 0 )
		begin
			select 0
			return
		end
	else
		begin
			select		a.PetDBIdx, a.MasterIdx, a.SummonItemDBIdx, a.Kind, a.Grade, a.Stamina, a.FriendShip, a.Alive, a.Summon, a.Rest, isnull(c.character_name,''), isnull(c.character_idx,0)
			from		TB_PETINFO as a
			left join		tb_item as b
			on		a.summonitemdbidx = b.item_dbidx
			left join		tb_character as c
			on		b.character_idx = c.character_idx			
			where		a.PetDBIdx = @PETIDX
		end
GO
/****** Object:  StoredProcedure [dbo].[MP_STORAGE_Buy]    Script Date: 07/30/2013 14:54:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_STORAGE_Buy] ( 	@CHARACTER_IDX int )
as
	set nocount on

	declare @useridx int
	declare @num tinyint

select @useridx  = User_idx from tb_character with(nolock) where character_idx = @CHARACTER_IDX
if not exists ( select null from tb_pyoguk with(nolock)  where user_idx = @useridx )
begin
	insert tb_pyoguk 
		(
		User_IDX,
		PyogukNum
		)
	values 	(
		@useridx,
		1
		)
end
else 
begin
	select @num = PyogukNum from tb_pyoguk with(nolock) where user_idx = @useridx
	update tb_pyoguk set PyogukNum = @num + 1 where user_idx = @useridx
end
GO
/****** Object:  StoredProcedure [dbo].[TP_SearchCharIdxFromCharName]    Script Date: 07/30/2013 14:55:16 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE     proc [dbo].[TP_SearchCharIdxFromCharName]
(
	@CharName	varchar(20)
)

as
	Set Nocount on

	select Character_Idx from TB_CHARACTER with(nolock) where CHARACTER_NAME = @CharName
GO
/****** Object:  StoredProcedure [dbo].[MP_GAMEROOM_PROVIDE_ITEM]    Script Date: 07/30/2013 14:53:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 100610 ONS PC방 지급 아이템에 봉인정보/시간을 설정하도록 수정
CREATE PROCEDURE [dbo].[MP_GAMEROOM_PROVIDE_ITEM]
(
	@CharIdx int,
	@ItemIdx1 int,
	@ItemCnt1 smallint,
	@ItmeSealType1 smallint,
	@ItemEndTime1 bigint,
	@ItemIdx2 int,
	@ItemCnt2 smallint,
	@ItmeSealType2 smallint,
	@ItemEndTime2 int,	
	@ItemIdx3 int,
	@ItemCnt3 smallint,
	@ItmeSealType3 smallint,
	@ItemEndTime3 int,	
	@ItemIdx4 int,
	@ItemCnt4 smallint,
	@ItmeSealType4 smallint,
	@ItemEndTime4 int,	
	@ItemIdx5 int,
	@ItemCnt5 smallint,
	@ItmeSealType5 smallint,
	@ItemEndTime5 int	
)
AS
BEGIN
	SET NOCOUNT ON;

   	Declare @UserIdx int
	
	Select @UserIdx = USER_IDX From TB_CHARACTER Where CHARACTER_IDX = @CharIdx
	IF @@ROWCOUNT = 0 
		RETURN

	-- PC방 아이템 지급 날짜 확인
	Declare @LastProvideTime datetime
	Select @LastProvideTime = PROVIDE_TIME From TB_GAMEROOM Where USER_IDX = @UserIdx
	Set @LastProvideTime = Dateadd( Hour, -6, @LastProvideTime )
	-- 06시 지급 이후 시간이 경과하지 않은 경우
	IF Datediff( Day, @LastProvideTime, GetDate() ) < 1 
		BEGIN
			Select 2
			RETURN
		END
	

	Declare @ItemDBIdx1 int
	Declare @ItemDBIdx2 int
	Declare @ItemDBIdx3 int
	Declare @ItemDBIdx4 int
	Declare @ItemDBIdx5 int

	Set @ItemDBIdx1 = 0
	Set @ItemDBIdx2 = 0
	Set @ItemDBIdx3 = 0
	Set @ItemDBIdx4 = 0
	Set @ItemDBIdx5 = 0

	-- 아이템 지급
	IF @ItemIdx1 > 0
		BEGIN

			INSERT INTO [dbo].[TB_ITEM] (
					ITEM_IDX, 
					ITEM_DURABILITY, 
					ITEM_SHOPIDX, 
					ITEM_POSITION, 
					CHARACTER_IDX, 
					ITEM_SEAL, 
					ITEM_ENDTIME
			)
			VALUES(	
					@ItemIdx1, 
					@ItemCnt1, 
					@UserIdx, 
					0, 
					0,
					@ItmeSealType1,
					dateadd(second, @ItemEndTime1, '1970-01-01 09:00:00')	 
			)
			Set @ItemDBIdx1 = @@IDENTITY
		END
	
	IF @ItemIdx2 > 0
		BEGIN
			INSERT INTO [dbo].[TB_ITEM] (
					ITEM_IDX, 
					ITEM_DURABILITY, 
					ITEM_SHOPIDX, 
					ITEM_POSITION, 
					CHARACTER_IDX, 
					ITEM_SEAL, 
					ITEM_ENDTIME
			)
			VALUES(
					@ItemIdx2, 
					@ItemCnt2, 
					@UserIdx, 
					0, 
					0,
					@ItmeSealType2,
					dateadd(second, @ItemEndTime2, '1970-01-01 09:00:00')
			)
			Set @ItemDBIdx2 = @@IDENTITY
		END

	IF @ItemIdx3 > 0
		BEGIN
			INSERT INTO [dbo].[TB_ITEM] (
					ITEM_IDX, 
					ITEM_DURABILITY, 
					ITEM_SHOPIDX, 
					ITEM_POSITION, 
					CHARACTER_IDX, 
					ITEM_SEAL, 
					ITEM_ENDTIME
			)
			VALUES(
					@ItemIdx3, 
					@ItemCnt3, 
					@UserIdx, 
					0, 
					0,
					@ItmeSealType3,
					dateadd(second, @ItemEndTime3, '1970-01-01 09:00:00')
			)
			Set @ItemDBIdx3 = @@IDENTITY
		END

	IF @ItemIdx4 > 0
		BEGIN
			INSERT INTO [dbo].[TB_ITEM] (
					ITEM_IDX, 
					ITEM_DURABILITY, 
					ITEM_SHOPIDX, 
					ITEM_POSITION, 
					CHARACTER_IDX, 
					ITEM_SEAL, 
					ITEM_ENDTIME
			)
			VALUES(
					@ItemIdx4, 
					@ItemCnt4, 
					@UserIdx, 
					0, 
					0,
					@ItmeSealType4,
					dateadd(second, @ItemEndTime4, '1970-01-01 09:00:00')
			)
			Set @ItemDBIdx4 = @@IDENTITY
		END

	IF @ItemIdx5 > 0
		BEGIN
			INSERT INTO [dbo].[TB_ITEM] (
					ITEM_IDX, 
					ITEM_DURABILITY, 
					ITEM_SHOPIDX, 
					ITEM_POSITION, 
					CHARACTER_IDX, 
					ITEM_SEAL, 
					ITEM_ENDTIME
			)
			VALUES(
					@ItemIdx5, 
					@ItemCnt5, 
					@UserIdx, 
					0, 
					0,
					@ItmeSealType5,
					dateadd(second, @ItemEndTime5, '1970-01-01 09:00:00')
			)
			Set @ItemDBIdx5 = @@IDENTITY
		END

	-- 결과 저장
	IF NOT EXISTS (Select NULL From TB_GAMEROOM Where USER_IDX = @UserIdx)
		BEGIN
			INSERT INTO TB_GAMEROOM (USER_IDX, PROVIDE_CNT, PROVIDE_TIME)
			VALUES(@UserIdx, 1, GetDate())
		END
	ELSE
		BEGIN
			UPDATE TB_GAMEROOM 
			SET PROVIDE_CNT = PROVIDE_CNT + 1,
				PROVIDE_TIME = GetDate()
			WHERE USER_IDX = @UserIdx
		END

	Select 1, @UserIdx, 
		@ItemIdx1, @ItemIdx2, @ItemIdx3, @ItemIdx4, @ItemIdx5, 
		@ItemCnt1, @ItemCnt2, @ItemCnt3, @ItemCnt4, @ItemCnt5,
		@ItemDBIdx1, @ItemDBIdx2, @ItemDBIdx3, @ItemDBIdx4, @ItemDBIdx5
END
GO
/****** Object:  StoredProcedure [dbo].[MP_FRIEND_NotifyLogout]    Script Date: 07/30/2013 14:53:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[MP_FRIEND_NotifyLogout] (@CharacterIDX int)
as
 
set nocount on
--set xact_abort on 제거
 
declare @LoggoutName varchar(16)
 
select @LoggoutName = character_name from tb_character with(nolock) where character_idx = @CharacterIDX
 
select c.character_idx, @LoggoutName from
(
select a.character_idx, a.character_currentmap from tb_character as a with(nolock) 
inner join tb_friend as b with(nolock)
on a.character_idx=b.character_idx
where b.friend_idx = @CharacterIDX
) as c
where c.character_currentmap>0
GO
/****** Object:  StoredProcedure [dbo].[MP_GAMEROOM_UPDATE_BUFF]    Script Date: 07/30/2013 14:53:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MP_GAMEROOM_UPDATE_BUFF]
(
	@CharIdx int,
	@BuffState smallint,
	@BuffStage smallint,
	@BuffDay   smallint,
	@LoginMap  smallint
)
AS
BEGIN
	SET NOCOUNT ON

	Declare @UserIdx int
	

	-- 100307 ONS 서버 기동시 DB에 남아있는 해당맵의 PC방 지급버프 정보를 초기화하는 처리추가
	IF @BuffState = 0
		BEGIN
			Update TB_GAMEROOM 
			Set PCROOM_INDEX = 0, CHARACTER_IDX = 0 , PROVIDE_BUFF = 0, BUFF_STAGE = 0, BUFF_DAY = 0, LOGIN_MAP = 0
			Where LOGIN_MAP = @LoginMap
		END
	ELSE
		BEGIN
			Select @UserIdx = USER_IDX From TB_CHARACTER Where CHARACTER_IDX = @CharIdx
			IF @@ROWCOUNT = 0 
				RETURN
			
			IF @BuffState = 1
				BEGIN
					Update TB_GAMEROOM 
					Set PROVIDE_BUFF = 1, BUFF_STAGE = @BuffStage, BUFF_DAY = @BuffDay
					Where USER_IDX = @UserIdx
				END
			ELSE
				BEGIN
					Update TB_GAMEROOM 
					Set PCROOM_INDEX = 0, CHARACTER_IDX = 0 , PROVIDE_BUFF = 0,  BUFF_STAGE = 0, BUFF_DAY = 0, LOGIN_MAP = 0
					Where USER_IDX = @UserIdx
				END
		END
END
GO
/****** Object:  StoredProcedure [dbo].[TP_SearchGuildMemberInfo]    Script Date: 07/30/2013 14:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE       proc [dbo].[TP_SearchGuildMemberInfo]
(
		@StartIdx	int,
		@GuildIdx	int			
)
as
	Set Nocount On

	select top 100	character_idx, 
		         	character_name, 
			character_grade,
			character_standindex,
			character_munpaidx,
			character_munpajikchek			
	from tb_character with(nolock)
	where character_munpaidx = @GuildIdx and character_idx > @StartIdx
	order by character_idx  asc
GO
/****** Object:  StoredProcedure [dbo].[MP_GAMEROOM_UPDATE_POINT]    Script Date: 07/30/2013 14:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MP_GAMEROOM_UPDATE_POINT]
(
	@CharIdx int,
	@Point int
)
AS
BEGIN
	SET NOCOUNT ON

	Declare @UserIdx int
	
	Select @UserIdx = USER_IDX From TB_CHARACTER Where CHARACTER_IDX = @CharIdx
	IF @@ROWCOUNT = 0 
		RETURN

	Update TB_GAMEROOM Set PCROOM_POINT = @Point Where USER_IDX = @UserIdx
END




/****** 개체:  StoredProcedure [dbo].[MP_GAMEROOM_LOAD_POINT]    스크립트 날짜: 01/04/2010 12:26:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MP_GAMEROOM_LOAD_POINT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MP_GAMEROOM_LOAD_POINT]

SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[MP_FRIEND_NotifyLogin]    Script Date: 07/30/2013 14:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_FRIEND_NotifyLogin] (@CharacterIDX int) --나를 등록한 사람들에게 내가 로그인 했다고 알림
as
	set nocount on
--	set xact_abort on
	declare @LogginName varchar(16)

select @LogginName = character_name from tb_character with(nolock) where character_idx = @CharacterIDX

select character_idx, @LogginName  
	from tb_character with(nolock)
		where character_idx in
			(select character_idx from tb_friend with(nolock) where FRIEND_idx = @CharacterIDX )
			and (character_currentmap > 0)
/*
select character_idx, @LogginName  from tb_loginmapinfo where character_idx in 
	(	 select character_idx 
		from tb_friend 
		where FRIEND_idx = @CharacterIDX 
	)
*/
GO
/****** Object:  StoredProcedure [dbo].[MP_FRIEND_LoginFriend]    Script Date: 07/30/2013 14:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[MP_FRIEND_LoginFriend] (@CharacterIDX int) --로그인한 친구들 알림
as
	set nocount on
	set xact_abort on

--select f.Friend_idx, f.Friend_Name from tb_friend f, tb_loginmapinfo l 
--where f.character_idx = @CharacterIDX and l.Character_idx = f.Friend_idx
select character_idx, character_Name 
	 from tb_character
		where character_idx in 
			(select friend_idx from tb_friend where character_idx = @CharacterIDX) 
			and ( character_currentmap > 0 )
GO
/****** Object:  StoredProcedure [dbo].[MP_FRIEND_IsValidTarget]    Script Date: 07/30/2013 14:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[MP_FRIEND_IsValidTarget](@FromCharacterIDX int, @TargetCharacterIDX int, @FromName varchar(16))
as
	set nocount on
	set xact_abort on

	declare @Errcode int
	declare @TargetName varchar(16)

-- 1: 없는 캐릭터, 2: 친구리스트가 다 찼다. 4: 로그인해 있지 않은 캐릭터, 5: 이미 등록된 친구

if not exists (select *  from tb_character where character_idx = @TargetCharacterIDX )
	set @Errcode = 1
--else if (select count(character_idx) from tb_friend where character_idx = @FromCharacterIDX ) >= 30 --친구리스트 맥스치 30
	--set @Errcode = 2
else if exists (select * 
		from tb_friend
			where character_idx = @FromCharacterIDX and Friend_idx = @TargetCharacterIDX )
	set @Errcode = 5
--else if not exists (select * from tb_loginmapinfo where character_idx = @TargetCharacterIDX )
else if (select character_currentmap  from tb_character where character_idx = @TargetCharacterIDX ) = 0
	set @Errcode = 4
else 
	set @Errcode = 0 -- success 

select @TargetName = character_name  from tb_character where character_idx = @TargetCharacterIDX

select @FromCharacterIDX, @TargetCharacterIDX,  @FromName, @TargetName, @Errcode
GO
/****** Object:  StoredProcedure [dbo].[MP_MAP_SavePoint]    Script Date: 07/30/2013 14:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MP_MAP_SavePoint]
(
	@Character_idx int,
	@SavePoint int
)
as
	Set Nocount on
	Set Xact_abort on
update tb_character set character_map = @SavePoint where @Character_idx = character_idx
GO
/****** Object:  StoredProcedure [dbo].[MP_SKILLTREE_Reset]    Script Date: 07/30/2013 14:54:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE     PROC [dbo].[MP_SKILLTREE_Reset]
(
	@CHARACTER_IDX	INT	
)
AS
SET NOCOUNT ON

DECLARE 	@CHARACTER_RACE		TINYINT	
DECLARE 	@ACCSKILLPOINT		INT		

SELECT @CHARACTER_RACE = CHARACTER_STAGE
FROM TB_CHARACTER						
WHERE CHARACTER_IDX = @CHARACTER_IDX	

SELECT @ACCSKILLPOINT = CUMULATIVE_POINT
FROM TB_SKILLPOINT						
WHERE CHARACTER_IDX = @CHARACTER_IDX	



IF @CHARACTER_RACE IS NULL						
BEGIN
	SELECT 0							
	RETURN
END

DELETE TB_SKILL WHERE CHARACTER_IDX = @CHARACTER_IDX	

if @CHARACTER_RACE = 0
begin
	insert tb_skill	( CHARACTER_IDX, SKILL_IDX, SKILL_LEVEL )
		values ( @CHARACTER_IDX, 8001601, 1 )
end
else if @CHARACTER_RACE = 1
begin
	insert tb_skill	( CHARACTER_IDX, SKILL_IDX, SKILL_LEVEL )
		values ( @CHARACTER_IDX, 8001701, 1 )
end
else if @CHARACTER_RACE = 2
begin
	insert tb_skill	( CHARACTER_IDX, SKILL_IDX, SKILL_LEVEL )
		values ( @CHARACTER_IDX, 8001501, 1 )
end
	insert tb_skill	( CHARACTER_IDX, SKILL_IDX, SKILL_LEVEL )
		values ( @CHARACTER_IDX, 3204301, 1 )


UPDATE TB_SKILLPOINT						       
SET 	SKILL_POINT = @ACCSKILLPOINT		       
WHERE CHARACTER_IDX = @CHARACTER_IDX			   

SELECT SKILL_DBIDX, SKILL_IDX, SKILL_LEVEL, @ACCSKILLPOINT	 
FROM TB_SKILL							   
WHERE CHARACTER_IDX = @CHARACTER_IDX	

RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_FAMILY_FARM_SELECT]    Script Date: 07/30/2013 14:55:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_FAMILY_FARM_SELECT]
(
	@CHAR_IDX	INT
)
AS
	SET NOCOUNT ON
	
	DECLARE @FAMILY_MASTER_IDX INT
	
	SELECT   @FAMILY_MASTER_IDX = TB_FAMILY.MasterID
	FROM      TB_CHARACTER INNER JOIN
	                TB_FAMILY_MEMBER ON 
	                TB_CHARACTER.CHARACTER_IDX = TB_FAMILY_MEMBER.MemberID INNER JOIN
	                TB_FAMILY ON TB_FAMILY_MEMBER.FamilyID = TB_FAMILY.ID
	WHERE   (TB_CHARACTER.CHARACTER_IDX = @CHAR_IDX)
	        
	IF @FAMILY_MASTER_IDX IS NULL
		RETURN
		
	SELECT   Zone, Farm, FarmState, FarmOwnerID, GardenGrade, HouseGrade, 
	                WarehouseGrade, AnimalCageGrade, FenceGrade, BUILD_DATE
	FROM      TB_FARM_FARM
	WHERE   (FarmOwnerID = @FAMILY_MASTER_IDX)
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_FRIEND_GETPCROOMINFO]    Script Date: 07/30/2013 14:53:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 100312 ONS PC방인덱스로 PC방접속자를 구하도록 변경.
CREATE proc [dbo].[MP_FRIEND_GETPCROOMINFO] (@PCRoom_idx int) 
as
	set nocount on
	set xact_abort on

	
	IF NOT EXISTS (SELECT NULL FROM TB_GAMEROOM WHERE PCROOM_INDEX = @PCRoom_idx)
	BEGIN
		RETURN
	END
	-- 캐릭터 계열, 이름, 클래스를 반환한다.
	SELECT CHARACTER_IDX, CHARACTER_NAME,  
		CASE 
		WHEN Character_job=1 THEN CHARACTER_JOB1 * 1000 + ( CHARACTER_STAGE + 1 ) * 100 + CHARACTER_JOB * 10 + 1
		WHEN Character_job=2 THEN CHARACTER_JOB1 * 1000 + ( CHARACTER_STAGE + 1 ) * 100 + CHARACTER_JOB * 10 + CHARACTER_JOB2
		WHEN Character_job=3 THEN CHARACTER_JOB1 * 1000 + ( CHARACTER_STAGE + 1 ) * 100 + CHARACTER_JOB * 10 + CHARACTER_JOB3
		WHEN Character_job=4 THEN CHARACTER_JOB1 * 1000 + ( CHARACTER_STAGE + 1 ) * 100 + CHARACTER_JOB * 10 + CHARACTER_JOB4
		WHEN Character_job=5 THEN CHARACTER_JOB1 * 1000 + ( CHARACTER_STAGE + 1 ) * 100 + CHARACTER_JOB * 10 + CHARACTER_JOB5
		WHEN Character_job=6 THEN CHARACTER_JOB1 * 1000 + ( CHARACTER_STAGE + 1 ) * 100 + CHARACTER_JOB * 10 + CHARACTER_JOB6		
		ELSE -1 END  
	FROM TB_CHARACTER 
	WHERE CHARACTER_IDX IN
		( SELECT CHARACTER_IDX FROM TB_GAMEROOM WHERE PCROOM_INDEX = @PCRoom_idx )
GO
/****** Object:  StoredProcedure [dbo].[MP_FRIEND_GetTargetIDX]    Script Date: 07/30/2013 14:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE       proc [dbo].[MP_FRIEND_GetTargetIDX] (@TargetName varchar(16) , @FromCharacterIDX int)
as
	set nocount on
	set xact_abort on
	declare @Toid int
	declare @Fromname varchar(16)
	declare @Errcode int

-- 1: 이름이 없는 캐릭터, 2: 친구리스트가 다 찼다. 4: 로그인 안해있는 캐릭터, 5: 이미 등록된 친구

select @Toid = character_idx from tb_character where character_name = @TargetName
select @Fromname = character_name from tb_character where character_idx = @FromCharacterIDX

if not exists (select * from tb_character where character_idx = @Toid )
	set @Errcode = 1
else if (select count(character_idx) from tb_friend where character_idx = @FromCharacterIDX ) >= 30 --친구리스트 맥스치 30
	set @Errcode = 2
else if exists (select * from tb_friend where character_idx = @FromCharacterIDX and Friend_idx = @Toid )
	set @Errcode = 5
else if (select character_currentmap from tb_character where character_idx = @Toid ) = 0
	set @Errcode = 4
else 
	set @Errcode = 0 -- success 


select @FromCharacterIDX, @Toid,  @Fromname, @TargetName, @Errcode
GO
/****** Object:  StoredProcedure [dbo].[TP_FAMILY_CROP_SELECT]    Script Date: 07/30/2013 14:55:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_FAMILY_CROP_SELECT]
(
	@CHAR_IDX	INT
)
AS
	SET NOCOUNT ON
	
	DECLARE @FAMILY_IDX INT
	
	SELECT   @FAMILY_IDX = FamilyID
	FROM      TB_FAMILY_MEMBER
	WHERE   (MemberID = @CHAR_IDX)
	
	IF @FAMILY_IDX IS NULL
		RETURN

	SELECT   CROP.Crop, CROP.CropOwnerID, CHAR.CHARACTER_NAME, CROP.CropKind, 
	                CROP.CropStep, CROP.CropLife, CROP.CropNextStepTime, 
	                CROP.CropSeedGrade
	FROM      TB_FAMILY_MEMBER MEMBER INNER JOIN
	                TB_FARM_CROP CROP ON 
	                MEMBER.MemberID = CROP.CropOwnerID INNER JOIN
	                TB_CHARACTER CHAR ON MEMBER.MemberID = CHAR.CHARACTER_IDX
	WHERE   (MEMBER.FamilyID = @FAMILY_IDX)
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_FRIEND_GetFriendList]    Script Date: 07/30/2013 14:53:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE    proc [dbo].[MP_FRIEND_GetFriendList] (@Character_idx int) 
as
	set nocount on
	set xact_abort on
	
select character_idx, character_name, character_currentmap 
from tb_character 
where character_idx in 
	( select  friend_idx 
	from tb_friend 
	where character_idx = @Character_idx )
GO
/****** Object:  StoredProcedure [dbo].[TP_CheckCharacterName]    Script Date: 07/30/2013 14:55:06 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	proc [dbo].[TP_CheckCharacterName]
(
	@CHARACTER_NAME	varchar(16)
)
as
	Set Nocount on
	
if exists ( select * from TB_CHARACTER with(nolock) where CHARACTER_NAME = @CHARACTER_NAME and CHARACTER_STANDINDEX != 5 )
	begin
		select 1
		return 		-- 캐릭이름이 중복됨 리턴
	end
else if exists (select *  from tb_munpa with(nolock) where @CHARACTER_NAME = MunpaName )
	begin
		select 2 		-- 문파이름 중복
		return
	end
else if ( @CHARACTER_NAME is null )
	begin 
		select 3			-- 캐릭이름이 null 리턴
		return 
	end
else
	begin
		select 0
		return
	end
GO
/****** Object:  StoredProcedure [dbo].[MP_LoginMapInfo_UnRegist]    Script Date: 07/30/2013 14:53:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    proc [dbo].[MP_LoginMapInfo_UnRegist]
(
	@Character_idx int
)
as
	set nocount on
	set xact_abort on
	
	update tb_character set character_currentmap = 0 where character_idx = @Character_idx
GO
/****** Object:  StoredProcedure [dbo].[MP_FRIEND_AddFriend]    Script Date: 07/30/2013 14:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 100305 ONS 친구추가 승락여부를 묻지않고 이름을 통해 추가되도록 수정.
CREATE proc [dbo].[MP_FRIEND_AddFriend] (@Character_idx int , @TargetName varchar(16))  --@Character_idx = 친구 신청한 사람,  @TargetName   = 승낙한 사람
as
	set nocount on
--	set xact_abort on
	declare @TargetIDX int
	declare @FromName varchar(16)	
	declare @CharaErr smallint
	declare @TargetErr smallint
	
	set @CharaErr = 0
	set @TargetErr = 0

-- 5 already in list 는 에러에서 정상처리로 옮김
--@Errcode : 0 success, 1 invalid user, 2 full list, 3 add deny, 4 not loggin, , 5 alread list

select @TargetIDX = character_idx from tb_character where character_name = @TargetName
select @FromName = character_name from tb_character where character_idx = @Character_idx

if not exists (select *  from tb_character where character_idx = @TargetIDX )
begin
	set @CharaErr = 1
end
else if (select count(character_idx) from tb_friend with(nolock) where character_idx = @Character_idx ) >= 30 --친구리스트 맥스치 30
begin
	set @CharaErr = 2
end
else if (select character_currentmap  from tb_character where character_idx = @TargetIDX ) = 0
begin
	set @CharaErr = 4
end
else if  exists (select * from tb_friend with(nolock) where character_idx = @Character_idx and Friend_idx = @TargetIDX )
begin
	set @CharaErr = 5
end
else
begin
	insert tb_friend 
		( character_idx, Friend_idx, Friend_name)
	values 
		( @Character_idx, @TargetIDX,  @TargetName)
end

if not exists (select *  from tb_character where character_idx = @TargetIDX )
begin
	set @TargetErr = 1
end
else if not exists (select *  from tb_character where character_idx = @Character_idx )
begin
	set @TargetErr = 1
end
else if (select count(character_idx) from tb_friend with(nolock) where character_idx = @TargetIDX ) >= 30 --친구리스트 맥스치 30
begin
	set @TargetErr = 2
end
else if (select character_currentmap  from tb_character where character_idx = @Character_idx ) = 0
begin
	set @TargetErr = 4
end
else if  exists (select * from tb_friend with(nolock) where character_idx = @TargetIDX and Friend_idx = @Character_idx )
begin
	set @TargetErr = 5
end
else
begin
	insert tb_friend 
		( character_idx, Friend_idx, Friend_name)
	values 
		( @TargetIDX, @Character_idx,  @FromName)
end

select @CharaErr, @Character_idx, @FromName, @TargetErr, @TargetIDX, @TargetName
GO
/****** Object:  StoredProcedure [dbo].[test]    Script Date: 07/30/2013 14:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[test]
as
select * from tb_character
GO
/****** Object:  StoredProcedure [dbo].[MP_PYOGUK_Buy]    Script Date: 07/30/2013 14:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_PYOGUK_Buy] ( 	@CHARACTER_IDX int )
as
	set nocount on

	declare @useridx int
	declare @num tinyint

select @useridx  = User_idx from tb_character with(nolock) where character_idx = @CHARACTER_IDX
if not exists ( select null from tb_pyoguk with(nolock)  where user_idx = @useridx )
begin
	insert tb_pyoguk 
		(
		User_IDX,
		PyogukNum
		)
	values 	(
		@useridx,
		1
		)
end
else 
begin
	select @num = PyogukNum from tb_pyoguk with(nolock) where user_idx = @useridx
	update tb_pyoguk set PyogukNum = @num + 1 where user_idx = @useridx
end
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_NameCheck]    Script Date: 07/30/2013 14:52:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[MP_CHARACTER_NameCheck]
(
	@CHARACTER_NAME	varchar(16)
)
as
	set nocount on
	set xact_abort on
	declare	@NAME_CHECK1	bit
	declare	@NAME_CHECK2	bit
	declare	@NAME_CHECK3	bit

	set @NAME_CHECK1 = (select count(CHARACTER_NAME) from TB_CHARACTER where CHARACTER_NAME = @CHARACTER_NAME and character_standindex != 5)
--	set @NAME_CHECK2 = (select count(CHARACTER_NAME) from TB_TABOOCHARACTER_NAME where CHARACTER_NAME = @CHARACTER_NAME)
--	set @NAME_CHECK3 = (select count(CHARACTER_NAME) from TB_CHARACTER_FORTH where CHARACTER_NAME = @CHARACTER_NAME)

if (select count(MunpaName) from tb_munpa where @CHARACTER_NAME = MunpaName ) >0
	begin
		select 3 -- fail
		return
	end


else	if @NAME_CHECK1 = 0 -- and @NAME_CHECK2 = 0 and @NAME_CHECK3 = 0
		begin
			select 0 --success
			return
		end
	else
		begin
			select 1 -- fail
			return
		end
GO
/****** Object:  StoredProcedure [dbo].[MP_character_name_chk]    Script Date: 07/30/2013 14:52:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE      proc [dbo].[MP_character_name_chk]
@character_name varchar(16),
@itemidx	int
as

set nocount oN
declare @user_idx int
declare @CHARACTER_CURRENTMAP int
declare @characteR_idx int

select 
@user_idx= user_idx,
@CHARACTER_CURRENTMAP  = CHARACTER_CURRENTMAP,
@characteR_idx = characteR_idx
from dbo.tb_character with(readuncommitted) 
where character_name = @character_name

	if @user_idx is null
	begin
		select 0 --캐릭터 이름이 정확하지 않다.
		return
	end
	else
	begin

		if not exists(select* from tb_wantedinfo where wantedchr_idx=@characteR_idx)
		begin
			select 1 -- 척살목록에 없다.
			return
		end

		if exists(select * from mhcmember.dbo.logintable where propid = @user_idx)
		begin
			select @characteR_idx , @CHARACTER_CURRENTMAP, @itemidx -- 로그인이 OK라면
			return
		end			
		else
		begin
			select 0  --로그아웃중
			return
		end

	end
GO
/****** Object:  StoredProcedure [dbo].[RP_UpdateCharacterMoney]    Script Date: 07/30/2013 14:54:58 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    proc [dbo].[RP_UpdateCharacterMoney]
(
		@CharIdx	int,
		@Money		int,
		@Flag		int
)

as
	Set Nocount on
	Set Xact_Abort on

	update tb_character set character_money = @Money where character_idx = @CharIdx

	select @CharIdx, @Money, @Flag
GO
/****** Object:  StoredProcedure [dbo].[MP_PK_CharacterUpdate]    Script Date: 07/30/2013 14:54:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROC [dbo].[MP_PK_CharacterUpdate] (@Character_idx int, @val int)
as
	Set Nocount On

update TB_CHARACTER set CHARACTER_LASTPKENDTIME = @val where character_idx = @Character_idx
GO
/****** Object:  StoredProcedure [dbo].[RP_MunpaMemberInfo]    Script Date: 07/30/2013 14:54:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 문파원 정보
CREATE      proc [dbo].[RP_MunpaMemberInfo]
(
		@MunpaIdx	int
	,	@startIdx	int
)
as
	Set Nocount On


	select top 100	@MunpaIdx,
			character_idx, 
		         	character_name, 
			character_grade, 
			character_munpajikchek,
			convert(varchar(5),year(character_munpaentrydate)) +'-'+ 
			convert(varchar(3), month(character_munpaentrydate)) +'-'+ 
			convert(varchar(3), day(character_munpaentrydate)),
			convert(varchar(17), character_munpaentrydate, 108)
	from tb_character with(nolock)
	where (character_idx > @startIdx) and (character_munpaidx = @MunpaIdx)
	order by character_idx  asc
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_MapChangePointUpdate_SiegeWarfare]    Script Date: 07/30/2013 14:52:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[MP_CHARACTER_MapChangePointUpdate_SiegeWarfare]
	(
		@character_idx 			int
	,	@character_mapchangepoint	int
--	,	@mapchangepoint_kind		smallint
	,	@Xposition			int
	,	@Zposition			int
	)

	as

		Set Nocount on
		Set Xact_abort on

	Update tb_character 

	set 	character_mapchangepoint 	= @character_mapchangepoint 
--	,	ChangeMapPoint_kind 		= @mapchangepoint_kind
	,	CHARACTER_POS_X		= @Xposition
	,	CHARACTER_POS_Y		= @Zposition

	where @character_idx = character_idx
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_MapchangePointUpdate]    Script Date: 07/30/2013 14:52:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[MP_CHARACTER_MapchangePointUpdate]
(
	@character_idx int
,	@character_mapchangepoint int
)
as
	Set Nocount on
	Set Xact_abort on

Update tb_character set character_mapchangepoint = @character_mapchangepoint where @character_idx = character_idx
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_MAPCHANGEPOINTRETURN]    Script Date: 07/30/2013 14:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
081218 LUJ, 플레이어 소지금 처리 추가
*/
CREATE     proc [dbo].[MP_CHARACTER_MAPCHANGEPOINTRETURN]
(
	@character_idx int
,	@character_mapchangepoint int
, 	@dwConnectionIdx int
,	@level int

-- 080605 LYW : 경험치 확장(__int32 -> __int64) 에 따른 데이터 타입 수정.
--, 	@exppoint int
, 	@exppoint bigint
	-- 081218 LUJ, 플레이어 소지금
,	@inventoryMoney	bigint
,	@pyogukmoney bigint 

)
as
	Set Nocount on
	Set Xact_abort on

	declare  @UserIdx int 

Update TB_CHARACTER 
set CHARACTER_MAPCHANGEPOINT = @character_mapchangepoint ,
CHARACTER_GRADE = @level,
CHARACTER_EXPOINT = @exppoint,
-- 081218 LUJ, 플레이어 소지금 처리 추가
CHARACTER_MONEY = @inventoryMoney

where @character_idx = CHARACTER_IDX

select @UserIdx = USER_IDX 
from TB_CHARACTER with(nolock) 
where CHARACTER_IDX = @character_idx

update TB_PYOGUK
set PYOGUKMONEY = @pyogukmoney
where USER_IDX = @UserIdx 

select @dwConnectionIdx , @character_mapchangepoint
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_SelectMap]    Script Date: 07/30/2013 14:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MP_CHARACTER_SelectMap]
(
	@CHARACTER_IDX					int
)
as
	Set Nocount on
	Set Xact_Abort on

select CHARACTER_IDX, CHARACTER_MAP from TB_CHARACTER where CHARACTER_IDX = @CHARACTER_IDX
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILDFIELDWAR_AddMoney]    Script Date: 07/30/2013 14:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	proc [dbo].[MP_GUILDFIELDWAR_AddMoney]
(
	@CharIdx	int,
	@Money		int
)
as
	SET NOCOUNT ON
--	SET xact_abort on

	DECLARE @Curmap	int
	DECLARE @RMoney	int
	SET @Curmap = 0
	SET @RMoney = 0

	SELECT @Curmap = character_currentmap, @RMoney = character_money 
	FROM tb_character  WITH(READUNCOMMITTED) 
	WHERE character_idx = @CharIdx
	
	IF( @Curmap = 0 )
		BEGIN
			UPDATE tb_character SET character_money = @RMoney + @Money  WHERE character_idx = @CharIdx
			SELECT 1		-- not login
			RETURN
		END
	ELSE
		BEGIN
			SELECT 0, @Curmap, @CharIdx, @Money
		END
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_TotalInfoUpdate]    Script Date: 07/30/2013 14:52:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080530 LUJ, 레벨 값이 0인 경우 현재 레벨로 업데이트하도록 함
*/
CREATE  proc [dbo].[MP_CHARACTER_TotalInfoUpdate]
(
	@CHARACTER_IDX				int
,	@CHARACTER_GENDER			tinyint
,	@CHARACTER_LIFE				int
,	@CHARACTER_GRADE			tinyint
,	@CHARACTER_MAP				tinyint
,	@CHARACTER_FACETYPE			tinyint
,	@CHARACTER_HEADTYPE			tinyint
,	@CHARACTER_HAT				int
,	@CHARACTER_WEAPON			int
,	@CHARACTER_DRESS			int
,	@CHARACTER_SHOES			int
,	@CHARACTER_COSTUME_HAT		int
,	@CHARACTER_COSTUME_DRESS	int
,	@CHARACTER_GLOVE			int
,	@CHARACTER_COSTUME_SHOES	int
,	@CHARACTER_COSTUME_GLOVE	int
,	@CHARACTER_MASK				int
,	@CHARACTER_SHIELD			int
,	@CHARACTER_BADFAME			int
,	@CHARACTER_GLASSES			int
,	@CHARACTER_BAND				int
)

as
	Set Nocount on
	--Set Xact_Abort on (DeadLock관련 주석)
	
	-- 080530 LUJ, 레벨이 0인 경우 현재 레벨로 세팅함
	IF 0 = @CHARACTER_GRADE
	BEGIN
		SELECT	@CHARACTER_GRADE = CHARACTER_GRADE
		FROM	TB_CHARACTER
		WHERE	CHARACTER_IDX = @CHARACTER_IDX
	END

	update 	TB_CHARACTER 	set			
			CHARACTER_GENDER		= 	@CHARACTER_GENDER
		,	CHARACTER_LIFE		=	@CHARACTER_LIFE
		,	CHARACTER_GRADE		=	@CHARACTER_GRADE
		,	CHARACTER_FACETYPE	= 	@CHARACTER_FACETYPE
		,	CHARACTER_HEADTYPE	=	@CHARACTER_HEADTYPE
		,	CHARACTER_HAT		=	@CHARACTER_HAT
		,	CHARACTER_WEAPON	=	@CHARACTER_WEAPON
		,	CHARACTER_DRESS		=	@CHARACTER_DRESS
		,	CHARACTER_SHOES		=	@CHARACTER_SHOES
		,	CHARACTER_COSTUME_HAT	=	@CHARACTER_COSTUME_HAT
		,	CHARACTER_COSTUME_DRESS	=	@CHARACTER_COSTUME_DRESS
		,	CHARACTER_GLOVE		=	@CHARACTER_GLOVE
		,	CHARACTER_COSTUME_SHOES	=	@CHARACTER_COSTUME_SHOES
		,	CHARACTER_COSTUME_GLOVE		=	@CHARACTER_COSTUME_GLOVE
		,	CHARACTER_MASK		=	@CHARACTER_MASK	
		,	CHARACTER_SHIELD		=	@CHARACTER_SHIELD	
		,	CHARACTER_LASTMODIFIED	=	getdate()
		,	CHARACTER_BADFAME	=	@CHARACTER_BADFAME
		,	CHARACTER_GLASSES		=	@CHARACTER_GLASSES
		,	CHARACTER_BAND		=	@CHARACTER_BAND
		where CHARACTER_IDX = @CHARACTER_IDX
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_PYOGUK_ListInfo]    Script Date: 07/30/2013 14:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_PYOGUK_ListInfo] ( 	@CHARACTER_IDX int )
as
	set nocount on
	
	declare @useridx int
	declare @pyoguknum tinyint

select @useridx = user_idx  from tb_character WHERE CHARACTER_IDX = @CHARACTER_IDX
if exists ( select null from tb_pyoguk where user_idx = @useridx ) 
	select @pyoguknum = pyoguknum from tb_pyoguk  where user_idx = @useridx
else 
	select @pyoguknum = 0
GO
/****** Object:  StoredProcedure [dbo].[TP_ChangeLoginPoint]    Script Date: 07/30/2013 14:55:00 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE    proc [dbo].[TP_ChangeLoginPoint]
(
	@CharIdx	int,
	@MapNum	int
)
as
	set nocount on
	Set Xact_Abort on

	update tb_character set character_map = @MapNum, character_loginpoint = @MapNum + 2000 where character_idx = @CharIdx
	
	select @CharIdx, @MapNum
GO
/****** Object:  StoredProcedure [dbo].[TP_CHARACTER_DATA_UPDATE]    Script Date: 07/30/2013 14:55:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080102 웅주, 확장 인벤 추가
080725 LUJ, 악명 추가, 스킬 포인트 업데이트 부분 분리(테스트 서버만 유효함)
*/
CREATE  PROCEDURE [dbo].[TP_CHARACTER_DATA_UPDATE]
(
	@CHAR_IDX	INT,
	@STRENGTH	INT,
	@DEXTERITY	INT,
	@VITALITY	INT,
	@INTELLIGENCE	INT,
	@WISDOM		INT,
	@LIFE		INT,
	@MANA		INT,
	@GRADE		INT,
	@MAX_GRADE	INT,
	@EXP		BIGINT,
	@GRADE_UP_POINT	INT,
	@MONEY		BIGINT,
	@SKILL_POINT	INT,
	@EXTENDED_INVEN_SIZE	TINYINT,
	@MAP_IDX	TINYINT,
	@MAP_X		INT,
	@MAP_Y		INT,
	@JOB_IDX	TINYINT,
	@JOB_DATA1	TINYINT,
	@JOB_DATA2	TINYINT,
	@JOB_DATA3	TINYINT,
	@JOB_DATA4	TINYINT,
	@JOB_DATA5	TINYINT,
	@JOB_DATA6	TINYINT,
	@BAD_FAME	INT
)
AS
	SET NOCOUNT ON
	
	UPDATE  TB_CHARACTER
	SET	CHARACTER_STR = @STRENGTH, 
		CHARACTER_DEX = @DEXTERITY,
		CHARACTER_VIT = @VITALITY, 
		CHARACTER_INT = @INTELLIGENCE,
		CHARACTER_WIS = @WISDOM, 
		CHARACTER_LIFE = @LIFE,
		CHARACTER_MANA = @MANA, 
		CHARACTER_GRADE = @GRADE,
		CHARACTER_MAXGRADE = @MAX_GRADE, 
		CHARACTER_EXPOINT = @EXP,
		CHARACTER_GRADEUPPOINT = @GRADE_UP_POINT, 
		CHARACTER_MONEY = @MONEY,
		CHARACTER_INVENTORY = @EXTENDED_INVEN_SIZE,
		CHARACTER_MAP = @MAP_IDX, 
		CHARACTER_POS_X = @MAP_X,
		CHARACTER_POS_Y = @MAP_Y,
		CHARACTER_JOB = @JOB_IDX,
		CHARACTER_JOB1 = @JOB_DATA1, 
		CHARACTER_JOB2 = @JOB_DATA2,
		CHARACTER_JOB3 = @JOB_DATA3, 
		CHARACTER_JOB4 = @JOB_DATA4,
		CHARACTER_JOB5 = @JOB_DATA5, 
		CHARACTER_JOB6 = @JOB_DATA6,
		-- 080725 LUJ, 악명 추가
		CHARACTER_BADFAME	= @BAD_FAME
	WHERE   (CHARACTER_IDX = @CHAR_IDX)

	-- 080725 LUJ, 스킬 포인트 저장 테이블이 분리되었음.
	--		주의: 아직 서비스 서버에는 TB_CHARACTER.CHARACTER_SKILLPOINT를 사용 중
	UPDATE TB_SKILLPOINT
	SET	SKILL_POINT = @SKILL_POINT
	WHERE	CHARACTER_IDX  = @CHAR_IDX
	
	IF 0 < @@ROWCOUNT
	BEGIN
		SELECT @CHAR_IDX
		RETURN
	END	
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_UpdateAbility]    Script Date: 07/30/2013 14:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[MP_CHARACTER_UpdateAbility]
(
	@CHARACTER_IDX int,
	@BattleAbility char(40),
	@KyungGongAbility char(40),
	@SocietyAbility char(40),
	@JobAbility char(40),
	@BattleQuick char(40),
	@KyungGongQuick char(40),
	@SocietyQuick char(40),
	@JobQuick char(40)
)

as
	Set Nocount on
--	Set Xact_Abort on

	update TB_ABILITY set
		BattleAbility = @BattleAbility,
		KyungGongAbility = @KyungGongAbility,
		SocietyAbility = @SocietyAbility,
		JobAbility = @JobAbility,
		BattleQuick = @BattleQuick,
		KyungGongQuick = @KyungGongQuick,
		SocietyQuick = @SocietyQuick,
		JobQuick = @JobQuick
	      where character_idx = @CHARACTER_IDX







return

select *
from tb_character
where character_idx =2340
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_UPDATE_ON_MAPOUT]    Script Date: 07/30/2013 14:52:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
081218 LUJ, ? 檜翕 衛 ?溯檜橫 輿蹂 薑爾? 偵褐??
081219 LUJ, 等萄塊檜 嫦?? ?辦 ?楠燮暮檜 褒?? 熱 氈?. 檜? ?楠燮暮擊 薯剪?
*/
CREATE    proc [dbo].[MP_CHARACTER_UPDATE_ON_MAPOUT]
(
	@CHAR_IDX		INT,
	@USER_IDX		INT,
	@INVENTORY_MONEY	BIGINT,
	@STORAGE_MONEY	BIGINT,
	@MAP			INT,
	@CHANNEL		INT
)
as
	SET NOCOUNT ON
	SET XACT_ABORT ON

	IF 0 < @INVENTORY_MONEY
	BEGIN
		UPDATE	TB_CHARACTER
		SET		CHARACTER_MONEY = @INVENTORY_MONEY
		WHERE		CHARACTER_IDX = @CHAR_IDX
	END

	SELECT	1,
			@MAP,
			@CHANNEL
	RETURN


--------------------
-- 援塊 ?煎衛? ?陛
--------------------
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[TP_CHARACTER_EXTENDED_DATA_SELECT]    Script Date: 07/30/2013 14:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071026 웅주, 플레이어 정보 중 레코드 길이가 긴 날짜 형식이나 문자열 필드가 쿼리하는 프로시저
*/
CREATE PROCEDURE [dbo].[TP_CHARACTER_EXTENDED_DATA_SELECT]
(
	@CHAR_IDX	INT
)
AS
	SET NOCOUNT ON
	
	/*
	DECLARE @FAMILY_NICK VARCHAR( 16 )
	
	SELECT  @FAMILY_NICK = MemberNickname
	FROM    TB_FAMILY_MEMBER
	WHERE   (MemberID = @CHAR_IDX)
	
	SELECT  A.CHARACTER_NAME,
			A.CHARACTER_NICKNAME,
			ISNULL( @FAMILY_NICK, '' ),
			A.CHARACTER_LASTMODIFIED,
			B.CHARACTER_NAME AS ORIGINAL_NAME,
			B.FLAG,
			B.CREATE_DATE,
			B.CREATE_IP,
			B.DELETE_DATE,
			B.DELETE_IP,
			B.RECOVER_DATE,
			B.RECOVER_IP
	FROM    TB_CHARACTER AS A INNER JOIN
	        TB_CharacterCreateInfo AS B ON 
	        A.CHARACTER_IDX = B.CHARACTER_IDX
	WHERE   (A.CHARACTER_IDX = @CHAR_IDX)
	*/
	
	SELECT   A.CHARACTER_NAME, A.CHARACTER_NICKNAME, ISNULL(C.MemberNickname, '') 
	                AS FAMILY_NICK, A.CHARACTER_LASTMODIFIED, 
	                B.CHARACTER_NAME AS ORIGINAL_NAME, B.FLAG, B.CREATE_DATE, 
	                B.CREATE_IP, B.DELETE_DATE, B.DELETE_IP, B.RECOVER_DATE, 
	                B.RECOVER_IP
	FROM      TB_CHARACTER A INNER JOIN
	                TB_CharacterCreateInfo B ON 
	                A.CHARACTER_IDX = B.CHARACTER_IDX LEFT OUTER JOIN
	                TB_FAMILY_MEMBER C ON A.CHARACTER_IDX = C.MemberID
	WHERE   (A.CHARACTER_IDX = @CHAR_IDX)
	
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_CHARACTER_EXTENDED_DATA_UPDATE]    Script Date: 07/30/2013 14:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071026 웅주. 문자열이나 날짜 등 상대적으로 크기가 큰 정보를 갱신하는데 쓰임
071128 웅주. 게시판의 신고 캐릭터 정보를 TB_CHARACTERCREATEINFO에서 가져오므음 이름
	변경 시 여기도 함께 수정토록 함
081124 LUJ, 이름이 바뀌지 않고 별명만 바뀔 경우 처리 추가
081126 LUJ, 패밀리 별명 변경 추가
090218 LUJ, TB_CHARACTERCREATEINFO에서 검색하지 않도록 함. 이럴 경우 지웠더라도 생성했던 이름으로는
	캐릭터 이름을 변경할 수 없었음
*/
CREATE      PROCEDURE [dbo].[TP_CHARACTER_EXTENDED_DATA_UPDATE]
(
	@CHAR_IDX	INT,
	@CHAR_NAME	VARCHAR( 20 ),
	@GUILD_NICK	VARCHAR( 20 ),
	@FAMILY_NICK	VARCHAR( 16 ) = ''
)
AS
	SET NOCOUNT ON

	DECLARE @IS_CHECK_DUPLICATED_NAME INT	

	-- 081124 LUJ, 이름이 하나만 바뀔 경우 있음
	-- 		현재 이름과 적용된 이름이 다를 경우만 검사하자
	BEGIN
		DECLARE @OLD_CHAR_NAME VARCHAR( 20 )
		
		SELECT @OLD_CHAR_NAME = CHARACTER_NAME
		FROM	TB_CHARACTER WITH (NOLOCK)
		WHERE	CHARACTER_IDX	= @CHAR_IDX

		IF @OLD_CHAR_NAME <> @CHAR_NAME
		BEGIN
			SET @IS_CHECK_DUPLICATED_NAME = 1
		END
	END

	IF @IS_CHECK_DUPLICATED_NAME IS NOT NULL
	BEGIN
		-- 중복 이름 허용하지 않음
		IF EXISTS (
			SELECT   CHARACTER_NAME
			FROM      TB_CHARACTER
			WHERE   (CHARACTER_NAME = @CHAR_NAME) )
		-- 090218 LUJ, TB_CHARACTERCREATEINFO에서 쿼리할 경우 존재하지 않는 캐릭터 이름이라도 해도 변경할 수가 없게됨
		--	이에 주석 처리함
		-- OR
		--EXISTS (	SELECT   CHARACTER_NAME
		--	FROM      TB_CHARACTERCREATEINFO
		--	WHERE   (CHARACTER_NAME = @CHAR_NAME) )
		BEGIN
			SELECT 0
			RETURN
		END
	END
	
	UPDATE  TB_CHARACTER
	SET	CHARACTER_NAME = @CHAR_NAME, CHARACTER_NICKNAME = @GUILD_NICK
	WHERE   (CHARACTER_IDX = @CHAR_IDX)

	-- 081126 LUJ, 패밀리 별명 변경
	IF @FAMILY_NICK <> ''
	BEGIN
		UPDATE	TB_FAMILY_MEMBER
		SET	MEMBERNICKNAME = @FAMILY_NICK
		WHERE	MEMBERID = @CHAR_IDX
	END
	
	UPDATE  TB_CharacterCreateInfo
	SET     CHARACTER_NAME = @CHAR_NAME
	WHERE   (CHARACTER_IDX = @CHAR_IDX)
	
	SELECT @CHAR_IDX
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_UpdateInfoBytime]    Script Date: 07/30/2013 14:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 경험치, 특기경험치, 돈 (시간마다 업데이트)

CREATE    proc [dbo].[MP_CHARACTER_UpdateInfoBytime]
(
		@charno	int

-- 080605 LYW : 경험치 확장(__int32 -> __int64) 에 따른 데이터 타입 수정.
--	,	@exp		int
	,	@exp		bigint

	,	@abilityexp	int
	,	@money		bigint
	,	@time		int
	,	@lastpkendtime int
)
as
	Set Nocount on
	Set Xact_Abort on
-----------------------------------------------------------------
-- 080605 LYW : 경험치 확장(__int32 -> __int64) 에 따른 데이터 타입 수정.
--	declare @chrexp int
	declare @chrexp bigint

select @chrexp = character_expoint from tb_character where character_idx = @charno
if ( @chrexp > @exp ) 
	return
-----------------------------------------------------------------
-- 080610 LYW --- 확장 인벤토리가 사라지는 현상 수정.
--	update tb_character set character_expoint = @exp, character_abilityexp = @abilityexp, character_money = @money, character_playtime = @time, character_lastpkendtime = @lastpkendtime

	update tb_character 
	set character_expoint = @exp, 
--	character_abilityexp = @abilityexp, 
	character_money = @money, 
	character_playtime = @time, 
	character_lastpkendtime = @lastpkendtime

	where character_idx = @charno
GO
/****** Object:  StoredProcedure [dbo].[TP_CHARACTER_NAME_SELECT]    Script Date: 07/30/2013 14:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 개체: 저장 프로시저 dbo.TP_CHARACTER_NAME_SELECT    스크립트 날짜: 2009-09-16 오후 3:03:41 ******/

/*
071024 웅주

키워드로 플레이어 정보를 검색한다
*/
CREATE PROCEDURE [dbo].[TP_CHARACTER_NAME_SELECT]
(
	@USER_IDX	INT,
	@USER_NAME	VARCHAR( 20 ),
	@KEYWORD	VARCHAR( 20 )
)
AS
	SET NOCOUNT ON
	
	IF 0 < @USER_IDX
	BEGIN
		SELECT	0 AS CHAR_IDX, CAST( @USER_IDX AS VARCHAR( 20 ) ), ''
		UNION
		SELECT   TOP 99 CHARACTER_IDX, CHARACTER_NAME, @USER_NAME
		FROM      TB_CHARACTER
		WHERE   USER_IDX = @USER_IDX
		ORDER BY CHAR_IDX
	END
	ELSE
	BEGIN
		SELECT	0 AS CHAR_IDX, CAST( @USER_IDX AS VARCHAR( 20 ) ), ''
		UNION
		SELECT   TOP 99 CHARACTER_IDX, CHARACTER_NAME, @USER_NAME
		--FROM      TB_CHARACTER
		FROM      TB_CHARACTERCREATEINFO
		WHERE   CHARACTER_NAME LIKE @KEYWORD
		ORDER BY CHAR_IDX
	END

	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_RESET_CHARACTER_INVENTORY]    Script Date: 07/30/2013 14:54:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROC  [dbo].[MP_RESET_CHARACTER_INVENTORY]
(
	@Character_IDX	int
)
AS	
	SET NOCOUNT ON

	UPDATE TB_CHARACTER SET CHARACTER_INVENTORY = 0 WHERE
		 CHARACTER_IDX = @Character_IDX
GO
/****** Object:  StoredProcedure [dbo].[TP_GUILD_MEMBER_SELECT]    Script Date: 07/30/2013 14:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071212 웅주, 길드 가입일을 추가로 가져오도록 함
071213 웅주, 튜닝. 연산 비용이 큰 정렬을 제거: 0.0165 -> 0.00483 
*/
CREATE PROCEDURE [dbo].[TP_GUILD_MEMBER_SELECT]
(
	@GUILD_IDX INT
)
AS
	SET NOCOUNT ON
	
	SELECT  TOP 100
			CHARACTER_IDX,
			CHARACTER_NAME,
			CHARACTER_GRADE, 
	        CHARACTER_MUNPAJIKCHEK,
	        CONVERT( VARCHAR( 6 ), CHARACTER_MUNPAENTRYDATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), CHARACTER_MUNPAENTRYDATE, 8 )
	FROM    TB_CHARACTER
	WHERE   (CHARACTER_MUNPAIDX = @GUILD_IDX)
	--ORDER BY CHARACTER_MUNPAJIKCHEK DESC
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_HOUSEDELETE]    Script Date: 07/30/2013 14:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MP_HOUSEDELETE]
(
	@dwConnectionIndex	int,
	@dwPlayerMapNum		int,
	@dwPlayerID			int,
	@szCharacterName	varchar(16)
)
AS

DECLARE @dwUserIndex int
DECLARE @szHouseName varchar(32)
set @dwUserIndex = 0
set @szHouseName = ''


set @dwUserIndex = (select USER_IDX from TB_CHARACTER where CHARACTER_NAME = @szCharacterName )

-- 유저인덱스가 없다
if(0 = @dwUserIndex)
begin
	select 1
	return
end

-- 보유중인 하우스가 없다
if not exists (select * from TB_HOUSE where USER_INDEX = @dwUserIndex)
begin
	select 2
	return
end

select 0, @dwConnectionIndex, @dwPlayerMapNum, @dwPlayerID, @dwUserIndex

delete from TB_HOUSE where USER_INDEX = @dwUserIndex
delete from TB_HOUSE_FURNITURE where USER_INDEX = @dwUserIndex
GO
/****** Object:  StoredProcedure [dbo].[MP_HOUSEENTRANCE]    Script Date: 07/30/2013 14:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE         PROCEDURE [dbo].[MP_HOUSEENTRANCE]
(
	@dwConnectionIndex	int,
	@dwPlayerMapNum	int,
	@cKind			int,
	@dwValue1		int,
	@dwValue2		int,
	@dwPlayerID		int,
	@szCharacterName	varchar(16)
)
AS

set nocount on

DECLARE @dwUserIndex int
DECLARE @szHouseName varchar(32)
set @dwUserIndex = 0
set @szHouseName = ''


if(1/*eHouseVisitByLink*/= @cKind)
	begin
	set @dwUserIndex = @dwValue2
	end
else if(2/*eHouseVisitByRandom*/ = @cKind)
	begin
	-- 최근 업데이트 30위까지 추출
	declare @tmp_LatestUpdate table
	(
		user_index	int
	)
	
	insert @tmp_LatestUpdate
	(
		user_index
	)
	select top 30 USER_INDEX from TB_HOUSE order by UPDATEDATE desc
	
	
	-- 후보 2명 추출
	declare @tmp_Candidate table
	(
		rownum int identity(1, 1),
		user_index int
	)
	insert into @tmp_Candidate
	(
		user_index
	)
	select top 2 user_index from @tmp_LatestUpdate order by newid()
	
	
	declare @dwResult int
	declare @dwQueryUserIndex int
	set @dwQueryUserIndex = (select USER_IDX from TB_CHARACTER where CHARACTER_IDX = @dwPlayerID )

	set @dwResult = (select user_index from @tmp_Candidate where rownum=1)
	
	if (@dwResult = @dwQueryUserIndex)
		set @dwResult = (select user_index from @tmp_Candidate where rownum=2)
	
	set @dwUserIndex = @dwResult
	end
else
	begin
	set @dwUserIndex = (select USER_IDX from TB_CHARACTER where CHARACTER_NAME = @szCharacterName )
	end

-- 유저인덱스가 없다
if(0 = @dwUserIndex)
begin
	select 1, @dwConnectionIndex, @dwPlayerMapNum, @cKind, @dwValue1, @dwValue2, @dwPlayerID
	return
end

-- 보유중인 하우스가 없다
if not exists (select * from TB_HOUSE where USER_INDEX = @dwUserIndex)
begin
	select 2, @dwConnectionIndex, @dwPlayerMapNum, @cKind, @dwValue1, @dwValue2, @dwPlayerID
	return
end

declare @today char(10)
set @today = convert(char(10), getdate(), 126)

select 0, @dwConnectionIndex, @dwPlayerMapNum, @cKind, @dwValue1, @dwValue2, @dwPlayerID, USER_INDEX, HOUSE_NAME, EXTERIOR_KIND, EXTEND_LEVEL,
	 TOTAL_VISITCOUNT, DAILY_VISITCOUNT,  DECO_USEPOINT, HOUSE_POINT, datediff(day, DATEADD(d,0,@today), UPDATEDATE)
 from TB_HOUSE where USER_INDEX = @dwUserIndex
GO
/****** Object:  StoredProcedure [dbo].[MP_HOUSEDATA_LOAD]    Script Date: 07/30/2013 14:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROCEDURE [dbo].[MP_HOUSEDATA_LOAD]
	(
		@dwPlayerID	int
	)
AS
	Set	Nocount	on
	Set	Xact_abort on

declare @dwUserIndex int
select @dwUserIndex = USER_IDX from TB_CHARACTER where CHARACTER_IDX = @dwPlayerID
	
if not exists (select count(*) from TB_HOUSE where USER_INDEX = @dwPlayerID)
	begin
		return
	end
else
	begin
		select HOUSE_NAME from TB_HOUSE where USER_INDEX = @dwUserIndex
		return
	end
GO
/****** Object:  StoredProcedure [dbo].[TP_GUILD_MEMBER_DELETE]    Script Date: 07/30/2013 14:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071213 웅주, 길드에서 탈퇴시키는 프로시저 추가
*/
CREATE PROCEDURE [dbo].[TP_GUILD_MEMBER_DELETE]
(
	@CHAR_IDX INT
)
AS
	SET NOCOUNT ON
	
	DECLARE @GUILD_IDX INT
	
	SELECT @GUILD_IDX = CHARACTER_MUNPAIDX
	FROM TB_CHARACTER
	WHERE CHARACTER_IDX = @CHAR_IDX
	
	IF @GUILD_IDX IS NULL
	BEGIN
		SELECT 1, @CHAR_IDX
	RETURN
	END
	
	IF 1 = (	SELECT COUNT( * )
				FROM TB_CHARACTER
				WHERE CHARACTER_MUNPAIDX = @GUILD_IDX
				GROUP BY CHARACTER_MUNPAIDX )
	BEGIN
		SELECT 2, @CHAR_IDX
		RETURN
	END
	
	UPDATE  TB_CHARACTER
	SET         CHARACTER_MUNPAIDX = 0, CHARACTER_MUNPAJIKCHEK = 0, 
	                CHARACTER_MUNPAENTRYDATE = GETDATE(), 
	                CHARACTER_MUNPACANENTRYDATE = GETDATE(), 
	                CHARACTER_MUNPANAME = '', CHARACTER_MUNPAMARKIDX = 0
	WHERE   (CHARACTER_IDX = @CHAR_IDX)
	
	IF 0 < @@ROWCOUNT 
	BEGIN
		SELECT 0, @CHAR_IDX
		RETURN
	END
	
	SELECT 3, @CHAR_IDX	
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_HOUSECREATE]    Script Date: 07/30/2013 14:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[MP_HOUSECREATE]
(
	@dwConnectionIndex	int,
	@dwPlayerMapNum	int,
	@dwPlayerIndex		int,
	@szCreateName		varchar(32),
	@dwDecoUsePoint	int
)
AS

Set	Nocount	on

DECLARE @dwUserIndex int
set @dwUserIndex = 0


set @dwUserIndex = (select USER_IDX from TB_CHARACTER where CHARACTER_IDX = @dwPlayerIndex )

-- 유저인덱스가 없다
if(0 = @dwUserIndex)
begin
	select 1, @dwConnectionIndex, @dwPlayerMapNum, @dwPlayerIndex
	return
end

-- 하우스 보유중
if exists (select USER_INDEX from TB_HOUSE where USER_INDEX = @dwUserIndex)
begin
	select 3, @dwConnectionIndex, @dwPlayerMapNum, @dwPlayerIndex
	return
end

-- 성공
select 0, @dwConnectionIndex, @dwPlayerMapNum, @dwUserIndex, @szCreateName
insert dbo.TB_HOUSE
(
	USER_INDEX,
	HOUSE_NAME,
	EXTERIOR_KIND,
	EXTEND_LEVEL,
	TOTAL_VISITCOUNT,
	DAILY_VISITCOUNT,
	DECO_USEPOINT,
	HOUSE_POINT
)
values
(
	@dwUserIndex,
	@szCreateName,
	0,
	0,
	0,
	0,
	@dwDecoUsePoint,
	0
)
GO
/****** Object:  StoredProcedure [dbo].[MP_HOUSE_FURNITURE_UPDATE]    Script Date: 07/30/2013 14:53:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE              PROCEDURE [dbo].[MP_HOUSE_FURNITURE_UPDATE]
(
	@WorkKind		int,

	@UserIndex		int,
	@FurnitureIndex		int,
	@LinkItemIndex		int,
	@MtrlIndex		int,
	@posX			float,
	@posY			float,
	@posZ			float,
	@angle			float,
	@Category		smallint,
	@Slot			smallint,
	@State			smallint,
	@NotDelete		tinyint,
	@Time			int
)
AS

SET TEXTSIZE 8000
Set	Nocount	on

-- 유저인덱스가 없다
if not exists (select * from TB_CHARACTER where USER_IDX = @UserIndex )
begin
	return
end


if(1 = @WorkKind)		-- 추가
	begin
	insert TB_HOUSE_FURNITURE values (@UserIndex, @FurnitureIndex, @LinkItemIndex, @MtrlIndex, @posX, @posY, @posZ, @angle, @Category, @Slot, @State, @NotDelete, DATEADD(second, @Time, Getdate()))
	end
else if(2 = @WorkKind)	-- 삭제
	begin
	delete from TB_HOUSE_FURNITURE where USER_INDEX=@UserIndex and FURNITURE_INDEX=@FurnitureIndex and CATEGORY=@Category and SLOT=@Slot
	end
else if(3 = @WorkKind)	-- 갱신
	begin
	if(@Time > 0)
		begin
		update TB_HOUSE_FURNITURE
		set MTRL_INDEX=@MtrlIndex, POSX=@posX, POSY=@posY, POSZ=@posZ, ANGLE=@angle, CATEGORY=@Category, SLOT=@Slot, STATE=@State, ENDTIME=DATEADD(second, @Time, Getdate())
		where USER_INDEX=@UserIndex and FURNITURE_INDEX=@FurnitureIndex and CATEGORY=@Category and SLOT=@Slot
		end
	else
		begin
		update TB_HOUSE_FURNITURE
		set MTRL_INDEX=@MtrlIndex, POSX=@posX, POSY=@posY, POSZ=@posZ, ANGLE=@angle, CATEGORY=@Category, SLOT=@Slot, STATE=@State
		where USER_INDEX=@UserIndex and FURNITURE_INDEX=@FurnitureIndex and CATEGORY=@Category and SLOT=@Slot
		end
	end
GO
/****** Object:  StoredProcedure [dbo].[TP_FAMILY_MEMBER_SELECT]    Script Date: 07/30/2013 14:55:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_FAMILY_MEMBER_SELECT]
(
	@CHAR_IDX INT
)
AS
	SET NOCOUNT ON
	
	DECLARE @FAMILY_IDX INT
	
	SELECT  @FAMILY_IDX = FamilyID
	FROM    TB_FAMILY_MEMBER
	WHERE   (MemberID = @CHAR_IDX)
	
	DECLARE @MASTER_IDX	INT
	
	SELECT  @MASTER_IDX = MasterID
	FROM    TB_FAMILY
	WHERE   (ID = @FAMILY_IDX)
	
	SELECT  C.CHARACTER_IDX,
			F.MemberNickname,
			C.CHARACTER_NAME,
			C.CHARACTER_GRADE, 
	        1 AS IS_MASTER
	FROM    TB_CHARACTER C INNER JOIN
	        TB_FAMILY_MEMBER F ON C.CHARACTER_IDX = F.MemberID
	WHERE   (C.CHARACTER_IDX = @MASTER_IDX)
	UNION	
	SELECT   F.MemberID,
			F.MemberNickname,
			C.CHARACTER_NAME,
			C.CHARACTER_GRADE,
			0 AS IS_MASTER
	FROM      TB_FAMILY_MEMBER F INNER JOIN
	                TB_CHARACTER C ON F.MemberID = C.CHARACTER_IDX
	WHERE   (F.FamilyID = @FAMILY_IDX)  AND
		(C.CHARACTER_IDX <> @MASTER_IDX)
	ORDER BY IS_MASTER DESC
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_CHARACTER_SELECT]    Script Date: 07/30/2013 14:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 개체: 저장 프로시저 dbo.TP_CHARACTER_SELECT    스크립트 날짜: 2009-09-16 오후 3:03:41 ******/
/*
071024 웅주, 키워드로 플레이어 정보를 검색한다
071224 웅주, 검색 속도를 높일 수 있도록 검색 조건을 단순화함
071228 웅주, 활성/비활성화된 플레이어 구분 없이 읽어들이도록 한다. 처리는 클라이언트에 일임한다
090717 LUJ, 사용하지 않는 조인 연산 제거
*/
CREATE PROCEDURE [dbo].[TP_CHARACTER_SELECT]
(
	@USER_IDX		INT,
	@USER_NAME		VARCHAR( 20 ),
	@KEYWORD		VARCHAR( 20 ),
	@BEGIN_CHAR_IDX	INT
)
AS
	SET NOCOUNT ON
	
	IF 0 < @USER_IDX
	BEGIN
		SELECT	TOP 100
				@USER_IDX,
				@USER_NAME,
				C.CHARACTER_IDX,
				I.CHARACTER_NAME,
				C.CHARACTER_STANDINDEX,
				@KEYWORD
		FROM	TB_CHARACTER C INNER JOIN TB_CHARACTERCREATEINFO I
				ON C.CHARACTER_IDX = I.CHARACTER_IDX
		WHERE	C.USER_IDX = @USER_IDX
				AND C.CHARACTER_IDX > @BEGIN_CHAR_IDX
	END
	ELSE
	BEGIN
		SELECT	TOP 100
				@USER_IDX,
				@USER_NAME,
				C.CHARACTER_IDX,
				I.CHARACTER_NAME,
				C.CHARACTER_STANDINDEX,
				@KEYWORD
		FROM	TB_CHARACTER C INNER JOIN TB_CHARACTERCREATEINFO I
				ON C.CHARACTER_IDX = I.CHARACTER_IDX
		WHERE	I.CHARACTER_NAME LIKE @KEYWORD
				AND C.CHARACTER_IDX > @BEGIN_CHAR_IDX
	END

	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_FAME_CharacterUpdate]    Script Date: 07/30/2013 14:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MP_FAME_CharacterUpdate] (@Character_idx int, @Fameval int)
as
	Set Nocount On
	Set Xact_Abort On

update TB_CHARACTER set character_fame = @Fameval where character_idx = @Character_idx
GO
/****** Object:  StoredProcedure [dbo].[MP_ITEM_INSERT_TO_INVENTORY]    Script Date: 07/30/2013 14:53:35 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/*
090513 LUJ, insert item to player's inventory with time
	notice! To serialize player should be log out from game.
*/
CREATE  PROC [dbo].[MP_ITEM_INSERT_TO_INVENTORY]
(
	@CHAR_IDX INT,
	@ITEM_IDX INT,
	-- if item is sealing, value must be 1 nor 0.
	@ITEM_IS_SEALING INT,
	@ITEM_USE_MONTH INT,
	@ITEM_USE_DAY INT,
	@ITEM_USE_HOUR INT,
	@ITEM_USE_MINUTE INT
)
AS
	SET NOCOUNT ON

	-- define constants
	DECLARE @ERROR_NONE INT
	SET @ERROR_NONE = 0
	DECLARE @ERROR_NO_PLAYER INT
	SET @ERROR_NO_PLAYER = 1
	DECLARE @ERROR_INVENTORY_IS_FULL INT
	SET @ERROR_INVENTORY_IS_FULL = 2
	DECLARE @ERROR_PLAYER_IS_IN_GAME INT
	SET @ERROR_PLAYER_IS_IN_GAME = 3

	
	-- to serialize, transaction begins
	BEGIN TRANSACTION

	-- get player's extended inventory size
	DECLARE @EXTENDED_INVENTORY_SIZE INT
	SELECT @EXTENDED_INVENTORY_SIZE = CHARACTER_INVENTORY
	FROM TB_CHARACTER
	WHERE CHARACTER_IDX = @CHAR_IDX

	IF @EXTENDED_INVENTORY_SIZE IS NULL
	BEGIN
		RETURN @ERROR_NO_PLAYER
	END
	
	DECLARE @INVENTORY_DEFAULT_SIZE INT
	SET @INVENTORY_DEFAULT_SIZE = 40
	DECLARE @INVENTORY_MAX_SIZE INT
	
	SET @INVENTORY_MAX_SIZE = @INVENTORY_DEFAULT_SIZE + @EXTENDED_INVENTORY_SIZE * 20

	DECLARE @ITEM_POSITION INT
	SET @ITEM_POSITION = 0

	-- find empty position for item
	WHILE( @ITEM_POSITION < @INVENTORY_MAX_SIZE )
	BEGIN
		IF NOT EXISTS
		(
			SELECT NULL
			FROM TB_ITEM
			WHERE ITEM_POSITION = @ITEM_POSITION AND
				CHARACTER_IDX = @CHAR_IDX
		)
		BEGIN
			BREAK
		END

		SET @ITEM_POSITION = @ITEM_POSITION + 1
	END

	-- inventory is full. it's error.
	IF @ITEM_POSITION = @INVENTORY_MAX_SIZE
	BEGIN
		ROLLBACK
		RETURN @ERROR_INVENTORY_IS_FULL
	END

	DECLARE @ITEM_DATE DATETIME
	SET @ITEM_DATE = DATEADD( MONTH, @ITEM_USE_MONTH, GETDATE() )
	SET @ITEM_DATE = DATEADD( DAY, @ITEM_USE_DAY, @ITEM_DATE )
	SET @ITEM_DATE = DATEADD( HOUR, @ITEM_USE_HOUR, @ITEM_DATE )
	SET @ITEM_DATE = DATEADD( MINUTE, @ITEM_USE_MINUTE, @ITEM_DATE )

	-- insert item
	INSERT TB_ITEM
	(
		CHARACTER_IDX,
		ITEM_IDX,
		ITEM_POSITION,
		ITEM_DURABILITY,
		ITEM_PYOGUKIDX,
		ITEM_SHOPIDX,
		ITEM_SEAL,
		ITEM_ENDTIME
	)
	VALUES
	(
		@CHAR_IDX,
		@ITEM_IDX,
		@ITEM_POSITION,
		1,
		0,
		0,
		CASE @ITEM_DATE
			WHEN GETDATE() THEN @ITEM_IS_SEALING
			ELSE 2
		END,
		@ITEM_DATE
	)

	COMMIT
	
	SELECT @ERROR_NONE
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_SHOPITEM_GetItem]    Script Date: 07/30/2013 14:54:22 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE   proc [dbo].[MP_SHOPITEM_GetItem] ( @CHARACTER_IDX int, @ITEM_IDX int, @ITEM_DUR int )
as
	Set Nocount on
	declare @user_idx int

select @user_idx = user_idx from tb_character with(readuncommitted)  where CHARACTER_IDX = @CHARACTER_IDX


insert into TB_ITEM (ITEM_SHOPIDX, ITEM_IDX, ITEM_POSITION, ITEM_DURABILITY, ITEM_PARAM)
values (@user_idx, @ITEM_IDX, 0, @ITEM_DUR, 1)
GO
/****** Object:  StoredProcedure [dbo].[MP_FAMILY_ChangeMaster]    Script Date: 07/30/2013 14:52:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MP_FAMILY_ChangeMaster]
(
	@OLD_MASTER		INT,
	@NEW_MASTER		INT,
	@FAMILY_IDX		INT
)
AS

Set Nocount on
Set Xact_abort on

BEGIN

	DECLARE	@FARM_ZONE	INT
	DECLARE	@FARM_ID	INT
	SET		@FARM_ZONE = -1
	SET		@FARM_ID = -1

	IF NOT EXISTS (SELECT NULL FROM TB_FAMILY WHERE MASTERID = @OLD_MASTER)
	BEGIN
		RETURN
	END
	-- 패밀리마스터 변경
	UPDATE TB_FAMILY SET MASTERID = @NEW_MASTER WHERE ( ID = @FAMILY_IDX AND MASTERID = @OLD_MASTER )

	-- 농장을 소유하고 있을경우
	SELECT @FARM_ID = Farm FROM TB_FARM_FARM WHERE FARMOWNERID = @OLD_MASTER
	IF @FARM_ID > 0
	BEGIN
		-- 농장소유주 변경
		UPDATE TB_FARM_FARM SET FARMOWNERID = @NEW_MASTER WHERE FARMOWNERID = @OLD_MASTER
		SELECT @FARM_ZONE = ZONE, @FARM_ID = FARM FROM TB_FARM_FARM WHERE FARMOWNERID = @NEW_MASTER
	END

	-- 결과값 리턴
	SELECT @NEW_MASTER, CHARACTER_NAME, @FARM_ZONE, @FARM_ID  FROM TB_CHARACTER WHERE CHARACTER_IDX = @NEW_MASTER	

END
GO
/****** Object:  StoredProcedure [dbo].[MP_SHOPITEM_ItemInfo]    Script Date: 07/30/2013 14:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_SHOPITEM_ItemInfo]
(
	@Character_IDX INT,
	@StartItem_DBIDX INT
)
AS
	SET NOCOUNT ON 

	DECLARE @USER_IDX INT
	SELECT @USER_IDX = USER_IDX
	FROM TB_CHARACTER WITH(READUNCOMMITTED)
	WHERE CHARACTER_IDX = @CHARACTER_IDX

	IF EXISTS
	(
		SELECT TOP 1
			NULL
		FROM TB_ITEM WITH(NOLOCK)
		WHERE ITEM_SHOPIDX = @USER_IDX
	)
	BEGIN
		SELECT TOP 36
			ITEM_DBIDX,
			ITEM_IDX,
			ITEM_DURABILITY,
			ITEM_PARAM,
			ITEM_SEAL,
			DATEDIFF(SECOND, GETDATE(), ITEM_ENDTIME),
			ITEM_REMAINTIME
		FROM TB_ITEM WITH(READUNCOMMITTED)
		WHERE ITEM_SHOPIDX = @USER_IDX
	END
	ELSE
	BEGIN
		SELECT 0
	END

	RETURN


SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[MP_SHOPITEM_ITEMINFO_1]    Script Date: 07/30/2013 14:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create                 PROC [dbo].[MP_SHOPITEM_ITEMINFO_1]
(
		@CHARACTER_IDX		INT
	,	@STARTITEM_DBIDX		INT
)

AS

	SET NOCOUNT ON 
	DECLARE @USER_IDX INT

	SELECT @USER_IDX = USER_IDX FROM TB_CHARACTER WITH(READUNCOMMITTED)  WHERE CHARACTER_IDX = @CHARACTER_IDX

IF @USER_IDX IS NOT NULL AND EXISTS (SELECT * FROM TB_ITEM WHERE (ITEM_DBIDX > @STARTITEM_DBIDX) AND (ITEM_SHOPIDX = @USER_IDX) )
BEGIN
	SELECT TOP 91 ITEM_DBIDX, ITEM_IDX, ITEM_POSITION, ITEM_DURABILITY, ITEM_PARAM
	FROM TB_ITEM WITH(READUNCOMMITTED)  WHERE ITEM_SHOPIDX = @USER_IDX				
END
ELSE
BEGIN
	SELECT   0
END
GO
/****** Object:  StoredProcedure [dbo].[TP_ITEM_OWNER_SELECT]    Script Date: 07/30/2013 14:55:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071031 LUJ, find 100 owner who have the item
090219 LUJ, 인벤토리 정보를 볼 수 있도록 사용자 번호도 쿼리하도록 함
*/
CREATE   PROCEDURE [dbo].[TP_ITEM_OWNER_SELECT]
(
	@ITEM_IDX	INT,
	@CHAR_IDX	INT
)
AS
SET NOCOUNT ON
	
	SELECT  TOP 100
		A.ITEM_IDX,
		COUNT(A.ITEM_IDX) AS SLOT,
		A.CHARACTER_IDX,
		B.CHARACTER_NAME,
		B.USER_IDX,
		SUM(A.ITEM_DURABILITY) AS QUANTITY
	FROM   	TB_ITEM AS A  WITH (NOLOCK) INNER JOIN
	      	TB_CHARACTER AS B  WITH (NOLOCK) ON 
	      	A.CHARACTER_IDX = B.CHARACTER_IDX
	WHERE   (A.CHARACTER_IDX > @CHAR_IDX) AND 
	        (A.ITEM_IDX = @ITEM_IDX)
	GROUP BY 	A.ITEM_IDX, A.CHARACTER_IDX, 
	         	B.CHARACTER_NAME,
			B.USER_IDX
	ORDER BY A.CHARACTER_IDX	
	RETURN 
	
	/*
SELECT  TOP 100
			ITEM_IDX, CHARACTER_IDX, COUNT( ITEM_IDX ) AS SIZE
	FROM    TB_ITEM
	WHERE   (CHARACTER_IDX > @CHAR_IDX) AND (ITEM_IDX = @ITEM_IDX)
	GROUP BY ITEM_IDX, CHARACTER_IDX
	ORDER BY CHARACTER_IDX	
	*/
GO
/****** Object:  StoredProcedure [dbo].[MP_INCREASE_CHARACTER_INVENTORY]    Script Date: 07/30/2013 14:53:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROC  [dbo].[MP_INCREASE_CHARACTER_INVENTORY]
(
	@Character_IDX	int
)
AS	
	SET NOCOUNT ON

	UPDATE TB_CHARACTER SET CHARACTER_INVENTORY = CHARACTER_INVENTORY+1 WHERE
		 CHARACTER_IDX = @Character_IDX
	
	IF @@ROWCOUNT = 1
	BEGIN
		SELECT	CHARACTER_INVENTORY
		FROM	TB_CHARACTER
		WHERE	(CHARACTER_IDX = @Character_IDX)
	END
GO
/****** Object:  StoredProcedure [dbo].[MP_DEFAULT_STATS_Update]    Script Date: 07/30/2013 14:52:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROC [dbo].[MP_DEFAULT_STATS_Update]
(
	@CHARACTER_IDX	INT,
	@C_STR			INT,
	@C_DEX			INT,
	@C_VIT			INT,
	@C_INT			INT,
	@C_WIS			INT,
	@C_POINT		INT
)

AS

set nocount on

UPDATE TB_CHARACTER

SET 
	CHARACTER_STR = @C_STR,
	CHARACTER_DEX = @C_DEX, 
	CHARACTER_VIT = @C_VIT,
	CHARACTER_INT = @C_INT,
	CHARACTER_WIS = @C_WIS,
	CHARACTER_GRADEUPPOINT = @C_POINT
	
FROM TB_CHARACTER
WHERE CHARACTER_IDX = @CHARACTER_IDX

  SELECT @CHARACTER_IDX-- FROM TB_CHARACTER WHERE CHARACTER_IDX = @CHARACTER_IDX


--SELECT @C_STR, @C_DEX, @C_VIT, @C_INT, @C_WIS, @C_POINT

--SELECT * FROM TB_CHARACTER WHERE CHARACTER_IDX = @CHARACTER_IDX
GO
/****** Object:  StoredProcedure [dbo].[MP_SEARCH_FOR_INVITEPARTY]    Script Date: 07/30/2013 14:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MP_SEARCH_FOR_INVITEPARTY]

	(
		@InvitedName varchar(16)
	)

AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @Curmap tinyint
	DECLARE @InvitedIDX int
	DECLARE @PartyIDX int
	SET @Curmap = 0
	SET @InvitedIDX = 0
	SET @PartyIDX = 0
	
	-- 이름으로 초대대상의 캐릭터 ID를 구한다
	SELECT @InvitedIDX = CHARACTER_IDX, @Curmap =  CHARACTER_CURRENTMAP, @PartyIDX = CHARACTER_PARTYIDX
		FROM TB_CHARACTER WHERE CHARACTER_NAME = @InvitedName AND CHARACTER_STANDINDEX != 5
		
	-- 초대 대상이 존재하지 않는 경우
	IF @InvitedIDX = 0
		BEGIN
			SELECT 1
		END
	ELSE
		BEGIN
			-- 초대 대상이 접속하지 않은 경우
			IF @Curmap = 0
				BEGIN
					SELECT 2
				END
			
			-- 초대 대상이 이미 다른 파티에 속해 있는 경우
			ELSE IF @PartyIDX > 0
				BEGIN
					SELECT 3
				END
			
			-- 초대 대상이 접속한 경우(초대가능)
			ELSE			
				BEGIN
					SELECT 4, @InvitedIDX
				END
		END
	
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_CharacterMapLoad]    Script Date: 07/30/2013 14:52:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[MP_CHARACTER_CharacterMapLoad]
(
	@character_idx int
)
as
	Set Nocount on
	Set Xact_abort on

select @character_idx, [CHARACTER_MAP]
from tb_character
where @character_idx = character_idx
GO
/****** Object:  StoredProcedure [dbo].[MP_NPCRECALL_MapchangePointReturn]    Script Date: 07/30/2013 14:54:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------
	--	NAME		: MP_NPCRECALL_MapchangePointReturn
	--	DESC		: Update map change info.
	--	PROGRAMMER	: Yongs Lee
	--	DATE		: August 25, 2008
	---------------------------------------------------------------------------------------------------
	CREATE	proc [dbo].[MP_NPCRECALL_MapchangePointReturn]
	(
		@character_idx		int				-- 캐릭터 인덱스.
	,	@changemap_idx		int				-- 이동하려는 맵 인덱스.
	,	@dwConnection_Idx	int				-- 맵 서버 연결 인덱스.
	,	@level			int				-- 캐릭터 레벨.
	,	@exppoint		bigint				-- 캐릭터 경험치.
	,	@pyogukmoney		bigint				-- 창고 머니.
	)

	AS

		SET NOCOUNT ON
		SET XACT_ABORT ON


		-- 유저 인덱스를 받을 임시 변수를 선언한다.
		declare 	@UserIdx 	int
		,	@Count1		int
		,	@Count2		int


		-- 레벨 / 경험치 / 창고 머니 등을 먼저 업데이트 한다.
		update tb_character

		set character_grade 	= @level,

		character_expoint 	= @exppoint

		where character_idx 	= @character_idx

		
		-- 업데이트 된 캐릭터의 유저 인덱스를 받는다.
		select @UserIdx = user_idx

		from tb_character with(nolock)

		where character_idx = @character_idx


		-- 유저 인덱스로, 창고 머니를 업데이트 한다.
		update tb_pyoguk

		set pyogukMoney	 = @pyogukmoney

		where user_idx 	 = @UserIdx


		-- 캐릭터 인덱스와 일치하는 필드가 있는지 카운트를 받는다.
		set @Count1 = 0
		set @Count2 = (select count(*) from tb_npcrecall_changemap where character_idx = @character_idx)


		-- 일치하는 필드가 없으면,
		if @Count1 >= @Count2
			begin
				-- 데이터를 추가한다.
				insert tb_npcrecall_changemap
				(
					change_mapnum
				,	connection_idx	
				)
				values
				(
					@changemap_idx
				,	@dwConnection_Idx
				)
			end
		-- 일치하는 필드가 있으면,
		else
			begin
				-- 데이터를 업데이트 한다.
				update tb_npcrecall_changemap

				set change_mapnum  	= @changemap_idx,
		
				connection_idx 		= @dwConnection_Idx
		
				where character_idx 	= @character_idx
			end


		-- 연결 인덱스와, 맵 정보를 리턴한다.
		select @dwConnection_Idx, @changemap_idx
GO
/****** Object:  StoredProcedure [dbo].[MP_WANTED_Regist]    Script Date: 07/30/2013 14:54:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE      proc [dbo].[MP_WANTED_Regist] (@CharacterIDX int, @TargetIDX int, @Prize decimal)

as

	Set Nocount on
	Set Xact_Abort on

	declare @TargetName varchar(16)

if exists (select null from tb_wantedinfo where WantedChr_Idx = @TargetIDX ) 
begin
	update tb_wantedinfo set Prize = Prize + @Prize where WantedChr_Idx = @TargetIDX

	select Wanted_Idx, WantedChr_Idx, WantedChr_Name, Prize
		from tb_wantedinfo with(nolock) 
			where WantedChr_Idx = @TargetIDX
end

else 
begin
	select @TargetName = character_name from tb_character with(nolock) where character_idx = @TargetIDX

	insert tb_wantedinfo 
	(
	WantedChr_Idx,
	WantedChr_Name,
	Prize,
	RegistChr_Idx,
	RegistMoney
	)
	values
	(
	@TargetIDX,
	@TargetName,
	@Prize,
	@CharacterIDX,
	@Prize
	)
	
	-- 현상범이 되면 가지고 있는 척살권 없앤다.
	update tb_wantedinfo set VolunteerNum = VolunteerNum -1 where Wanted_Idx
	in ( select Wanted_Idx from tb_wantedlist where character_Idx = @TargetIDX and bComplete = 0 )

	delete tb_wantedlist where character_idx = @TargetIDX 

	select Wanted_Idx, WantedChr_Idx, WantedChr_Name, Prize
		from tb_wantedinfo with(nolock) 
			where WantedChr_Idx = @TargetIDX

	
end
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_HeroInfoUPdate]    Script Date: 07/30/2013 14:52:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080530 LUJ, 레벨 값이 0인 경우 현재 레벨로 업데이트하도록 함
*/
CREATE   proc [dbo].[MP_CHARACTER_HeroInfoUPdate]
(
	@CHARACTER_IDX				int
,	@CHARACTER_STR				int
,	@CHARACTER_MANA				int	
,	@CHARACTER_DEX				int
,	@CHARACTER_VIT				int
,	@CHARACTER_INT				int
,	@CHARACTER_WIS				int
,	@CHARACTER_FAME				smallint
,	@CHARACTER_KARMA			tinyint

-- 080604 LYW --- MP_CHARACTER_HeroInfoUpdate : 경험치 필드는 bigint로 되어있는데, 
-- 프로시저에서 int로 되어있는 것을 bigint로 수정함
--,	@CHARACTER_EXPOINT			int
,	@CHARACTER_EXPOINT			bigint

,	@CHARACTER_GRADEUPPOINT		smallint
,	@CHARACTER_MONEY			bigint
,	@CHARACTER_QUICKPACE			int
,	@CHARACTER_ABILITYEXP			int
,	@CHARACTER_PLAYTIME			int
,	@CHARACTER_LASTPKENDTIME		int
,	@CHARACTER_MAXGRADE			tinyint
)

as
	Set Nocount on
--	Set Xact_Abort on

	declare @Cur_Date datetime
	Set @Cur_Date = getdate()
	
	-- 080530 LUJ, 레벨이 0인 경우 현재 레벨로 세팅함
	IF 0 = @CHARACTER_MAXGRADE
	BEGIN
		SELECT	@CHARACTER_MAXGRADE = CHARACTER_MAXGRADE
		FROM	TB_CHARACTER
		WHERE	CHARACTER_IDX = @CHARACTER_IDX
	END
	
	update 	TB_CHARACTER 	set			
			CHARACTER_STR			=	@CHARACTER_STR
		,	CHARACTER_MANA			=	@CHARACTER_MANA
		,	CHARACTER_DEX			= 	@CHARACTER_DEX
		,	CHARACTER_VIT			= 	@CHARACTER_VIT
		,	CHARACTER_INT			=	@CHARACTER_INT
		,	CHARACTER_WIS			=	@CHARACTER_WIS
		,	CHARACTER_FAME			=	@CHARACTER_FAME
		,	CHARACTER_KARMA			=	@CHARACTER_KARMA
		,	CHARACTER_EXPOINT			=	@CHARACTER_EXPOINT
		,	CHARACTER_GRADEUPPOINT		= 	@CHARACTER_GRADEUPPOINT
		,	CHARACTER_MONEY			=	@CHARACTER_MONEY
--		, 	CHARACTER_ABILITYEXP		= 	@CHARACTER_ABILITYEXP
		,	CHARACTER_PLAYTIME		=	@CHARACTER_PLAYTIME
		,	CHARACTER_LASTPKENDTIME	=	@CHARACTER_LASTPKENDTIME
		,	CHARACTER_LASTMODIFIED		=	@Cur_date
		,	CHARACTER_MAXGRADE		=	@CHARACTER_MAXGRADE

		where CHARACTER_IDX = @CHARACTER_IDX
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_GiveMemberNickName]    Script Date: 07/30/2013 14:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE	proc [dbo].[MP_GUILD_GiveMemberNickName]
(
	@CharacterIdx	int,
	@NickName	varchar(30)
)
as
	set nocount on

update tb_character
set character_nickname = @NickName
where character_idx = @CharacterIdx
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_LogoutPointUpdate]    Script Date: 07/30/2013 14:52:35 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_CHARACTER_LogoutPointUpdate]
(
	@character_idx int
,	@character_map int
,	@pos_x int
,	@pos_y int
)
as
	Set Nocount on
	Set Xact_abort on

Update tb_character 
set 

character_pos_x = @pos_x, 
character_pos_y = @pos_y,
character_map = @character_map 

where @character_idx = character_idx
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_LoadMember]    Script Date: 07/30/2013 14:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080225 LUJ, 직업 정보를 읽도록 함
*/
CREATE  PROC [dbo].[MP_GUILD_LoadMember]
(
		@StartCharacterIdx	int
)
AS	
	Set Nocount on
	Set Xact_Abort on

select top 100
		character_idx, 
		character_name, 
		character_grade, 
		character_munpaidx, 
		character_munpajikchek,
		CHARACTER_JOB,		
		CHARACTER_JOB1,
		CHARACTER_JOB2,
		CHARACTER_JOB3,
		CHARACTER_JOB4,
		CHARACTER_JOB5,
		CHARACTER_JOB6,
		CHARACTER_STAGE
from tb_character
where character_idx > @StartCharacterIdx and character_munpaidx > 0
order by character_idx
GO
/****** Object:  StoredProcedure [dbo].[MP_PARTY_DelMember]    Script Date: 07/30/2013 14:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROC [dbo].[MP_PARTY_DelMember] (@PARTY_IDX  int, @Character_IDX int)
as
	Set Nocount on
	Set Xact_abort on
begin
	if not exists (select null from tb_party where character_idx = @Character_IDX)
	begin
		select 1
		return
	end
	else if ( select character_rank from tb_party where character_idx = @Character_IDX ) <> 1
	begin
		select 2
		return
	end 
	else 
	begin
		update tb_character set character_partyidx = 0 where character_idx = @Character_IDX
		delete tb_party where character_idx = @Character_IDX
		select 0, @Character_IDX
	end

end
GO
/****** Object:  StoredProcedure [dbo].[MP_PARTY_DelPartyidxinCharacterTB]    Script Date: 07/30/2013 14:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_PARTY_DelPartyidxinCharacterTB]
(
	@character_idx	int
)
as
	Set Nocount on

update tb_character set character_partyidx = 0 where @character_idx = character_idx
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_LoginPointUpdate]    Script Date: 07/30/2013 14:52:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MP_CHARACTER_LoginPointUpdate]
(
	@character_idx int
,	@character_Loginpoint int
,	@character_map int
)
as
	Set Nocount on
	Set Xact_abort on

Update tb_character set character_Loginpoint = @character_Loginpoint, character_map = @character_map where @character_idx = character_idx
GO
/****** Object:  StoredProcedure [dbo].[MP_PARTY_PartyInfoByUserLogin]    Script Date: 07/30/2013 14:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[MP_PARTY_PartyInfoByUserLogin] (@PARTY_IDX  int)
as
	Set Nocount on

	declare @opt smallint
begin
	select @opt = party_option from tb_partyinfo where party_idx = @PARTY_IDX
	select c.character_idx,c.character_name, c.character_currentmap, c.character_grade, @opt
	from tb_character c with(nolock) , tb_party p
	where c.character_idx in 
		(select p.character_idx 
		from tb_party 
		where p.party_idx = @PARTY_IDX ) 
	order by CHARACTER_RANK desc

end
GO
/****** Object:  StoredProcedure [dbo].[MP_PARTY_CreateParty]    Script Date: 07/30/2013 14:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 주사위분배등급 인자 추가
CREATE    PROC [dbo].[MP_PARTY_CreateParty] ( @CHARACTER_IDX INT, @PartyOption smallint, @PartySubOption smallint) --rank : 파티장 20, 멤버 1
as
	Set Nocount On
	Set Xact_Abort On

	declare @maxpartyidx int

if exists (select null from TB_PARTY where Character_IDX = @CHARACTER_IDX)
	begin
		select 0, 0, @CHARACTER_IDX	-- 파티가 이미 있다. 
		return
	end
else 
	BEGIN
		INSERT TB_PARTYINFO
			(
			CHARACTER_IDX,
			PARTY_OPTION,
			PARTY_SUBOPTION
			)
		VALUES
			(
			@CHARACTER_IDX,
			@PartyOption,
			@PartySubOption
			)

		set @maxpartyidx  = @@identity

		INSERT TB_PARTY 
			(
			Party_IDX,
			Character_IDX,
			Character_Rank
			)
		VALUES (
			@maxpartyidx,
			@CHARACTER_IDX,
			20
			)
		update tb_character set character_partyidx = @maxpartyidx where character_idx = @character_idx
		SELECT 1, @maxpartyidx, @CHARACTER_IDX, @PartyOption, @PartySubOption
		
	END
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_Job_Update]    Script Date: 07/30/2013 14:52:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create proc [dbo].[MP_CHARACTER_Job_Update]
(
	@CHARACTER_IDX		int
, 	@Job_Grade		tinyint
, 	@Job1			tinyint
, 	@Job2			tinyint
, 	@Job3			tinyint
, 	@Job4			tinyint
, 	@Job5			tinyint
, 	@Job6			tinyint
)
as
	set nocount on
	set xact_abort on
update TB_CHARACTER set 

	CHARACTER_JOB = @Job_Grade
,	CHARACTER_JOB1 = @Job1
,	CHARACTER_JOB2 = @Job2
,	CHARACTER_JOB3 = @Job3
,	CHARACTER_JOB4 = @Job4
,	CHARACTER_JOB5 = @Job5
,	CHARACTER_JOB6 = @Job6	

where CHARACTER_IDX = @CHARACTER_IDX
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_ItemSlotInfo_JP]    Script Date: 07/30/2013 14:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE                       proc [dbo].[MP_CHARACTER_ItemSlotInfo_JP]
(
	@Character_idx	int
)
as
	Set Nocount On
	Set Xact_Abort On

	declare @UserIdx		int
	declare @Inven		int
	declare @Pyoguk		int
	declare @Mugong	int
	declare @Character	int

select @UserIdx = USER_IDX from tb_character where character_idx=@Character_idx
select @Pyoguk = ITEM_PARAM from TB_SHOPITEMUSEINFO where USER_IDX = @UserIdx and ITEM_IDX = 57544
select @Character = ITEM_PARAM from TB_SHOPITEMUSEINFO where USER_IDX = @UserIdx and ITEM_IDX = 57543
select @Inven = ITEM_PARAM from TB_SHOPITEMUSEINFO where CHARACTER_IDX = @Character_idx and ITEM_IDX = 57542
select @Mugong = ITEM_PARAM from TB_SHOPITEMUSEINFO where CHARACTER_IDX = @Character_idx and ITEM_IDX = 55361


select isnull(@Inven,0), isnull(@Pyoguk,0), isnull(@Mugong,0), isnull(@Character,0)
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_LOAD_MEMBER]    Script Date: 07/30/2013 14:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080225 LUJ, 해당 길드의 회원 목록을 읽어들임
081013 LUJ, 20개 단위로 읽어들이도록 함
081016 LUJ, QUERY 타입으로 변경. 100개 쿼리 가능
*/
CREATE     PROC [dbo].[MP_GUILD_LOAD_MEMBER]
(
	@GUILD_IDX		INT,
	@LAST_CHAR_IDX	INT
)
AS	
	SET NOCOUNT ON
	SET XACT_ABORT ON

	-- 081013 LUJ, MIDDLE QUERY 타입으로 호출되므로, 20개만 쿼리할 수 있다.
	-- 081016 LUJ, QUERY 타입으로 변경. 100개 쿼리 가능
	SELECT	TOP 100
		CHARACTER_IDX, 
		CHARACTER_NAME, 
		CHARACTER_GRADE, 
		CHARACTER_MUNPAJIKCHEK,
		CHARACTER_JOB,		
		CHARACTER_JOB1,
		CHARACTER_JOB2,
		CHARACTER_JOB3,
		CHARACTER_JOB4,
		CHARACTER_JOB5,
		CHARACTER_JOB6,
		CHARACTER_STAGE
	FROM	TB_CHARACTER WITH (NOLOCK)
	WHERE 	CHARACTER_IDX > @LAST_CHAR_IDX AND CHARACTER_MUNPAIDX = @GUILD_IDX
	ORDER BY CHARACTER_IDX

	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_PARTY_BreakupParty]    Script Date: 07/30/2013 14:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROC [dbo].[MP_PARTY_BreakupParty] (@PARTY_IDX INT)
as
	Set Nocount On
	Set Xact_Abort On

DELETE TB_PARTY WHERE TB_PARTY.PARTY_IDX = @PARTY_IDX
DELETE TB_PARTYINFO WHERE PARTY_IDX = @PARTY_IDX 
update tb_character set character_partyidx = 0 where @party_idx = character_partyidx
GO
/****** Object:  StoredProcedure [dbo].[MP_PARTY_AddMember]    Script Date: 07/30/2013 14:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MP_PARTY_AddMember] (@PARTY_IDX  int, @Character_IDX int)
as
	Set Nocount on
	Set Xact_abort on


begin
	if not exists (select null from tb_partyinfo where party_idx = @PARTY_IDX)
	begin
		return
	end
	else if(select count(party_idx) from tb_party where party_idx =  @PARTY_IDX) >= 7
	begin
		return
	end
	else if exists (select null from tb_party where character_idx = @Character_IDX)
	begin
		return
	end
	else 
	begin
		insert tb_party (
			PARTY_IDX,
			character_idx,
			character_rank
			)
		values (
			@PARTY_IDX,
			@Character_IDX,
			1
			)
		update tb_character set character_partyidx = @PARTY_IDX where character_idx = @Character_IDX
		
		-- 090529 ShinJS --- 멤버추가시 파티, 파티원들의 정보를 얻어 갱신한다.
		SELECT  p.PARTY_IDX, pinfo.PARTY_OPTION, p.CHARACTER_IDX, c.CHARACTER_NAME, c.CHARACTER_GRADE, c.CHARACTER_CURRENTMAP, p.CHARACTER_RANK

		FROM      TB_CHARACTER c 
			INNER JOIN TB_PARTY p ON c.CHARACTER_IDX = p.CHARACTER_IDX 
			INNER JOIN TB_PARTYINFO pinfo ON c.CHARACTER_PARTYIDX = pinfo.PARTY_IDX

		WHERE   c.CHARACTER_PARTYIDX = @PARTY_IDX AND c.CHARACTER_STANDINDEX != 5 
		order by p.CHARACTER_RANK DESC
		
	end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_GT_REWARD_INSERT]    Script Date: 07/30/2013 14:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE      proc [dbo].[MP_GT_REWARD_INSERT] 
(
	@CharIdx int,
	@GTCount int,
	@ItemIdx int, 
	@ItemCount int,
	@ItemType int,
	@ItemEndTime int
)

as

Set Nocount on
SET xact_abort on

declare @na int --나누어주는 갯수

declare @loginidx int --계정 번호
declare @count int -- 내부적 나눠주는데서 필요
declare @value int -- 아이템  갯수 값
declare @i int --반복문안에 이용

declare @Useridx int -- 유저인덱스
declare @Charname varchar(16) -- 캐릭터이름


if not exists (select count(*) from TB_CHARACTER where CHARACTER_IDX = @CharIdx)
begin
	return
end

select @Useridx =  USER_IDX from TB_CHARACTER where CHARACTER_IDX = @CharIdx
select @Charname  = CHARACTER_NAME from TB_CHARACTER where CHARACTER_IDX = @CharIdx



set @i=1

if @ItemType = 1  --수량아이템은 겹치기 단위로 나누어 넣고
begin
	set @na = 100
	set @count= CEILING(@ItemCount/cast(@na as float))
end
else --고유아이템은 수량만큼 넣는다.
begin
	set @na = 1
	set @count= @ItemCount
end


while @i<=@count
begin
	if @ItemType = 1 --겹치기 아이템
	begin
		if @ItemCount>=@na
			set @value=@na
		else
			set @value=@ItemCount
	end 
	else  --고유아이템
	begin
		set @value=0
	end


	if(0 < @ItemEndTime)
		begin
			insert into dbo.tb_item (item_idx,item_durability,item_shopidx,item_position,CHARACTER_IDX, ITEM_SEAL, ITEM_ENDTIME) 
			values(@ItemIdx,@value,@Useridx,0,0, 2, dateadd(second, @ItemEndTime, getdate())) -- 기간이 있으면 봉인을 해제해서 지급
		end
	else
		begin
			insert into dbo.tb_item (item_idx,item_durability,item_shopidx,item_position,CHARACTER_IDX) 
			values(@ItemIdx,@value,@Useridx,0,0)		
		end

set @ItemCount=@ItemCount-@na
set @i=@i+1
end

select @CharIdx, @Charname, @ItemIdx, @value
GO
/****** Object:  StoredProcedure [dbo].[MP_MunpaChat_FindOnPlayer]    Script Date: 07/30/2013 14:53:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    proc [dbo].[MP_MunpaChat_FindOnPlayer](@Character_idx int)
as
	Set Nocount On

	declare @MunpaIDX int
	declare @SenderName varchar(16)
begin
	select @MunpaIDX = character_Munpaidx, @SenderName = Character_name
		 from tb_character where Character_idx = @Character_idx
	if(@MunpaIDX = 0)
		return
	select @SenderName, character_idx from tb_character 
		where character_munpaidx = @MunpaIDX and character_currentmap != 0
			and character_munpajikchek > 1 -- 1 :  가입신청인
end
GO
/****** Object:  StoredProcedure [dbo].[MP_MUNPA_LoadJoinMemberList]    Script Date: 07/30/2013 14:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[MP_MUNPA_LoadJoinMemberList] (@MunpaID int)
as
	Set Nocount On
	Set Xact_Abort On
begin
	select Character_Name, Character_Grade, Character_Fame, 0 from TB_CHARACTER 
	where Character_MunpaIDx = @MunpaID 
	order by CHARACTER_MUNPAENTRYDATE

end
GO
/****** Object:  StoredProcedure [dbo].[MP_BADFAME_CharacterUpdate]    Script Date: 07/30/2013 14:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MP_BADFAME_CharacterUpdate] (@Character_idx int, @BadFameval int)
as
	Set Nocount On
	Set Xact_Abort On

update TB_CHARACTER set character_badfame = @BadFameval where character_idx = @Character_idx
RETURN

SELECT   CHARACTER_JOB, CHARACTER_JOB1, CHARACTER_JOB2, CHARACTER_JOB3, 
                CHARACTER_JOB4, CHARACTER_JOB5, CHARACTER_JOB6, 
                CHARACTER_NAME
FROM      TB_CHARACTER
GO
/****** Object:  StoredProcedure [dbo].[TP_SimpleCharacterInfoFromMN]    Script Date: 07/30/2013 14:55:19 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 캐릭정보 획득
CREATE               proc [dbo].[TP_SimpleCharacterInfoFromMN]
(
		@MemberNum	int
)

as
	Set Nocount on

	select	USER_IDX,
		CHARACTER_IDX,		
		CHARACTER_NAME,
		convert(varchar(5),year(CHARACTER_BIRTH)) +'-'+ convert(varchar(3), month(CHARACTER_BIRTH)) +'-'+ convert(varchar(3), day(CHARACTER_BIRTH)),
		convert(varchar(17), CHARACTER_BIRTH, 108)
	from TB_CHARACTER with(nolock) where USER_IDX = @MemberNum and CHARACTER_STANDINDEX != 5
GO
/****** Object:  StoredProcedure [dbo].[MP_AUTONOTELIST_ADD]    Script Date: 07/30/2013 14:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_AUTONOTELIST_ADD]
(
	@character_idx int,
	@auto_name varchar(16),
	@auto_character_idx int,
	@auto_user_idx int
)
as
	Set Nocount on

declare @regtime smalldatetime
set @regtime = getdate()

insert tb_autonotelist
(
	character_idx,
	auto_name,
	reg_date,
	auto_character_idx,
	auto_user_idx
)
values
(
	@character_idx,
	@auto_name,
	@regtime,
	@auto_character_idx,
	@auto_user_idx
)

select	@auto_name, convert( char(16), @regtime, 120)

RETURN

SELECT *
FROM TB_ITEM
WHERE CHARACTER_IDX = 802;SELECT *
FROM TB_CHARACTER
WHERE CHARACTER_IDX =802
GO
/****** Object:  StoredProcedure [dbo].[MP_WANTED_Destroyed]    Script Date: 07/30/2013 14:54:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE           proc [dbo].[MP_WANTED_Destroyed] ( @WantedIdx int )
as
-- 척살권 최대 100명이 갖는다.

	Set Nocount on
	Set Xact_Abort on
	declare @WantedName  varchar(16)

	-- bComplete : 0 - doing  1 - complete, 2 - other player complete, 3 - can't complete by character delete
	-- 5: deleted by time 

select @WantedName = WantedChr_Name 
from tb_WantedInfo 
where Wanted_Idx = @WantedIdx

update tb_wantedlist set bComplete = 5 where Wanted_Idx = @WantedIDX

insert into tb_wantcomplete
	( Wanted_IDX,
	WantedChr_IDX,
	RegistChr_IDX,
	RegistDate,
	Prize,
	Killer_IDX,
	Kind
	)
select 	@WantedIDX,
	Wantedchr_idx,
	Registchr_idx,
	registdate,
	prize,
	0,
	5
from tb_wantedinfo 
where  Wanted_Idx = @WantedIDX
	
---------------------------------------------------------------------------------
--일지 업데이트 : notcomplete처리는 여기서. kind 0: quest, 1: wanted 
--param 1 - complete, 2 - other player complete, 3 - can't complete by character delete
--5: deleted by time 

insert into tb_journal
(
Character_IDX,
Kind,
Param,
ParamName
)
select 
Character_Idx, 
1, 
5, 
@WantedName 
from tb_wantedlist 
where Wanted_Idx = @WantedIDX 
---------------------------------------------------------------------------------

select top 100 Character_Idx 
	from tb_wantedlist 
		where Wanted_Idx = @WantedIDX 
		and Character_Idx in 
				(select Character_IDX from tb_character where CHARACTER_CURRENTMAP <> 0 )


delete tb_wantedinfo where Wanted_Idx = @WantedIDX
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_ChangeAttr_JP]    Script Date: 07/30/2013 14:52:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_CHARACTER_ChangeAttr_JP]
(
	@CHARACTER_IDX	int,
	@Attr			int
)

as
	Set Nocount on

	update TB_CHARACTER set CHARACTER_ATTR = @Attr where CHARACTER_IDX = @CHARACTER_IDX



return

select *
from tb_character
where character_name = '풋가네'

select *
from tb_item
where character_idx = 2104 and item_idx = 12000032

UPDATE TB_CHARACTER
SET CHARACTER_SKILLPOINT = 999
WHERE CHARACTER_IDX = 2104

UPDATE TB_ITEM
SET ITEM_DURABILITY = 0, ITEM_POSITION = 80, ITEM_IDX = 12000001
WHERE ITEM_DBIDX = 24028711

SELECT *
FROM TB_ITEM_OPTION2
WHERE OPTION_IDX = 63
GO
/****** Object:  StoredProcedure [dbo].[MP_WANTED_Delete]    Script Date: 07/30/2013 14:54:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE         proc [dbo].[MP_WANTED_Delete] ( @CharacterIDX int )
as
	Set Nocount on
	Set Xact_Abort on
	declare @Wanted_IDX int
	declare @CharacterName varchar(16)

delete tb_wantedlist where Character_Idx = @CharacterIDX

select @Wanted_IDX = Wanted_IDX from tb_wantedinfo where WantedChr_Idx = @CharacterIDX
select @CharacterName = Character_Name from tb_character where Character_idx = @CharacterIDX

if @Wanted_IDX is not null
begin
	--------------------------------------------------------------------------------------
	--일지 업데이트 : notcomplete처리는 여기서. kind 0: quest, 1: wanted, param 1 : complete 2: not complete 
	insert into tb_journal
	(
	Character_IDX,
	Kind,
	Param,
	ParamName
	)
	select Character_Idx, 1, 3, @CharacterName from tb_wantedlist where Wanted_Idx = @Wanted_IDX
	--------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------
	--현상금 로그 
	insert into tb_wantcomplete
	(
	Wanted_IDX,
	WantedChr_IDX,
	RegistChr_IDX,
	RegistDate,
	Prize,
	Killer_IDX,
	Kind
	)
	select 
	Wanted_Idx,
	@CharacterIDX,
	RegistChr_Idx,
	RegistDate,
	Prize,
	0,
	3
	from tb_wantedinfo
	where WantedChr_Idx = @CharacterIDX
	--------------------------------------------------------------------------------------
	
	update tb_wantedlist set bComplete = 3 where Wanted_Idx = @Wanted_IDX

	select top 100 @Wanted_IDX, Character_Idx 
	from tb_wantedlist 
	where Wanted_Idx = @Wanted_IDX 
	and bComplete = 0
	and Character_Idx in 
		(select Character_IDX 
		from tb_character 
		where CHARACTER_CURRENTMAP != 0 )
	order by Character_Idx
	
	delete tb_wantedinfo where wanted_idx = @Wanted_IDX

end
else 
	select 0
GO
/****** Object:  StoredProcedure [dbo].[MP_WANTED_Complete]    Script Date: 07/30/2013 14:54:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE           proc [dbo].[MP_WANTED_Complete] (@CharacterIDX int, @TargetName varchar(16), @WantedIDX int)
as
-- 척살권 최대 100명이 갖는다.

	Set Nocount on
	Set Xact_Abort on
	-- bComplete : 0 - doing  1 - complete, 2 - other player complete, 3 - can't complete by character delete

update tb_wantedlist set bComplete = 2 where Wanted_Idx = @WantedIDX
update tb_wantedlist  set bComplete = 1 where Character_Idx = @CharacterIDX and Wanted_Idx = @WantedIDX

insert into tb_wantcomplete
	( Wanted_IDX,
	WantedChr_IDX,
	RegistChr_IDX,
	RegistDate,
	Prize,
	Killer_IDX,
	Kind
	)
select 	@WantedIDX,
	Wantedchr_idx,
	Registchr_idx,
	registdate,
	prize,
	@CharacterIDX,
	1
from tb_wantedinfo 
where  Wanted_Idx = @WantedIDX
	
---------------------------------------------------------------------------------
--일지 업데이트 : notcomplete처리는 여기서. kind 0: quest, 1: wanted 
--param 1 - complete, 2 - other player complete, 3 - can't complete by character delete
insert into tb_journal 
(
Character_IDX,
Kind,
Param,
ParamName
)
values 
(
@CharacterIDX,
1,
1,
@TargetName
)
insert into tb_journal
(
Character_IDX,
Kind,
Param,
ParamName
)
select Character_Idx, 1, 2, @TargetName 
from tb_wantedlist 
where Wanted_Idx = @WantedIDX and bComplete <> 1
---------------------------------------------------------------------------------

select top 100 Character_Idx 
	from tb_wantedlist 
		where Wanted_Idx = @WantedIDX 
		and Character_Idx in 
				(select Character_IDX from tb_character where CHARACTER_CURRENTMAP != 0 )
		and bComplete = 2

delete tb_wantedinfo where Wanted_Idx = @WantedIDX
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_BadFameUpdate]    Script Date: 07/30/2013 14:52:22 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE           proc [dbo].[MP_CHARACTER_BadFameUpdate]
(
	@CHARACTER_IDX					int
,	@CHARACTER_BADFAME				int
,	@CHARACTER_MONEY				bigint
)

as
	Set Nocount on

	update 	TB_CHARACTER 	set			
			CHARACTER_BADFAME		=	@CHARACTER_BADFAME
		,	CHARACTER_MONEY			=	@CHARACTER_MONEY
		where CHARACTER_IDX = @CHARACTER_IDX
GO
/****** Object:  StoredProcedure [dbo].[mp_npcremaintime_insert]    Script Date: 07/30/2013 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------------------------------ 소환 npc 관련 db 정보 추가 프로시저
	CREATE proc [dbo].[mp_npcremaintime_insert]
	(
		@created_idx		bigint
	,	@npc_idx		smallint
	,	@map_idx		smallint
	,	@remaintick		bigint
	,	@dwconnectionidx	bigint
	,	@agentnum		tinyint
	)

	as

		set nocount on

	declare	@count1		int
	,	@count2		int
	,	@result		tinyint

	set @count1 = 0

	set @count2 = (select count(*) from tb_npc_remaintime

	where	createdidx	= @created_idx
	and	npcidx		= @npc_idx
	and	mapidx		= @map_idx
	and	agentnum	= @agentnum )

	if @count1 >= @count2
		begin
			insert tb_npc_remaintime
			(
				createdidx
			,	npcidx
			,	mapidx
			,	remaintick
			,	connectionidx
			,	agentnum
			)
			values
			(
				@created_idx
			,	@npc_idx
			,	@map_idx
			,	@remaintick
			,	@dwconnectionidx
			,	@agentnum
			)
		end
	else
		begin
			update	tb_npc_remaintime

			set	remaintick	= @remaintick
			,	connectionidx	= @dwconnectionidx
		end
GO
/****** Object:  StoredProcedure [dbo].[mp_npcremaintime_update]    Script Date: 07/30/2013 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------------------------------ 소환 npc 관련 db 정보 업데이트 프로시저
	CREATE proc [dbo].[mp_npcremaintime_update]
	(
		@created_idx	int
	,	@npc_idx	smallint
	,	@map_idx	smallint
	,	@remaintick	int
	)

	as

		set nocount on

		update tb_npc_remaintime

		set remaintick = @remaintick

		where	createdidx	= @created_idx
		and	npcidx		= @npc_idx
		and	mapidx		= @map_idx
GO
/****** Object:  StoredProcedure [dbo].[mp_npcremaintime_load]    Script Date: 07/30/2013 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------------------------------ 소환 npc 관련 db 정보 로드 프로시저
	CREATE proc [dbo].[mp_npcremaintime_load]
	(
		@mapidx	smallint
	)

	as
		
		set nocount on

		select 	npcidx
		,	remaintick

		from tb_npc_remaintime

		where mapidx = @mapidx
GO
/****** Object:  StoredProcedure [dbo].[mp_npcremaintime_delete]    Script Date: 07/30/2013 14:54:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------------------------------------------
	-- 공성 관련 프로시저 변환.
	--------------------------------------------------------------------------------------------------

	------------------------------------------------------------------ 소환 npc 관련 db 정보 삭제 프로시저
	CREATE proc [dbo].[mp_npcremaintime_delete]
	(
		@created_idx		bigint
	,	@npc_idx		smallint
	,	@map_idx		smallint
	,	@agentnum		tinyint
	)

	as

		set nocount on

	declare	@result			tinyint

	if not exists ( select count(*) from tb_npc_remaintime 
	where createdidx = @created_idx)	
		begin
			set @result = 0 
			select @result, @npc_idx, @map_idx
		end
	else
		begin
			delete from tb_npc_remaintime

			where 	createdidx	= @created_idx
			and	npcidx		= @npc_idx
			and	mapidx		= @map_idx
			and	agentnum	= @agentnum
		end
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_LoadNotice]    Script Date: 07/30/2013 14:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROC [dbo].[MP_GUILD_LoadNotice]
(
	@StartIdx	int
)
AS	
	Set Nocount on
	Set Xact_Abort on

	select top 100 Idx, GuildIdx, Notice from TB_GUILD_NOTICE where idx > @StartIdx
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_UpdateNotice]    Script Date: 07/30/2013 14:53:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROC [dbo].[MP_GUILD_UpdateNotice]
(
	@GuildIdx	int,
	@Notice		varchar(150)
)
AS	
	Set Nocount on
	Set Xact_Abort on

	if exists ( select * from TB_GUILD_NOTICE where guildIdx = @GuildIdx )
	begin
		update TB_GUILD_NOTICE set Notice = @Notice where guildIdx = @GuildIdx
	end
	else
	begin
		insert TB_GUILD_NOTICE(guildidx, notice) values(@GuildIdx, @Notice)
	end
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_ENEMY_SELECT]    Script Date: 07/30/2013 14:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080616 LUJ, 적 길드를 읽는다
*/
CREATE    PROCEDURE [dbo].[MP_GUILD_ENEMY_SELECT]
(
	@GUILD_IDX		INT,
	@BEGIN_IDX		INT,
	@MAX_QUERY_SIZE	INT
)
AS
	SET NOCOUNT ON

	SET ROWCOUNT @MAX_QUERY_SIZE

	SELECT 		IDX, GUILDIDX1, GUILDIDX2, @GUILD_IDX
	FROM		TB_GUILDFIELDWAR
	WHERE		( GUILDIDX1 = @GUILD_IDX OR GUILDIDX2 = @GUILD_IDX ) AND
			IDX > @BEGIN_IDX
	ORDER BY 	IDX

	SET ROWCOUNT 0
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILDFIELDWAR_Load]    Script Date: 07/30/2013 14:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROC [dbo].[MP_GUILDFIELDWAR_Load]
(
	@StartGuildFieldWarIdx	int
)
AS	
SET NOCOUNT ON

SELECT TOP 100	Idx,
		GuildIdx1,
		GuildIdx2,
		GFWMoney
FROM TB_GUILDFIELDWAR
WHERE Idx > @StartGuildFieldWarIdx
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILDFIELDWAR_Insert]    Script Date: 07/30/2013 14:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MP_GUILDFIELDWAR_Insert]
(
		@GuildIdx1	int,
		@GuildIdx2	int,
		@GFWMoney	BIGINT
)
AS	
	SET NOCOUNT ON
	
	-- 중복된 값을 등록하지 않도록 한다
	IF EXISTS ( SELECT  *
				FROM    TB_GUILDFIELDWAR
				WHERE   (GuildIdx1 = @GuildIdx1) AND (GuildIdx2 = @GuildIdx2) )
	BEGIN
		RETURN
	END 
	ELSE IF EXISTS (	SELECT  *
						FROM    TB_GUILDFIELDWAR
						WHERE   (GuildIdx1 = @GuildIdx2) AND (GuildIdx2 = @GuildIdx1) )
	BEGIN
		RETURN
	END
	
	INSERT TB_GUILDFIELDWAR 
	(
	GuildIdx1,
	GuildIdx2,
	GFWMoney
	) 
	VALUES 
	(
	@GuildIdx1,
	@GuildIdx2, 
	@GFWMoney
	)
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILDFIELDWAR_Delete]    Script Date: 07/30/2013 14:53:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE  PROC [dbo].[MP_GUILDFIELDWAR_Delete]
(
		@GuildIdx1	int
	,	@GuildIdx2	int
)
AS	
	Set Nocount on

	delete TB_GUILDFIELDWAR where GuildIdx1 = @GuildIdx1 and GuildIdx2 = @GuildIdx2
	delete TB_GUILDFIELDWAR where GuildIdx1 = @GuildIdx2 and GuildIdx2 = @GuildIdx1
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_LOAD_MARK]    Script Date: 07/30/2013 14:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
081006 LUJ, 해당 길드의 마크를 읽어들인다
*/
CREATE   PROC [dbo].[MP_GUILD_LOAD_MARK]
(
	@MARK_IDX	INT
)
AS	
	SET NOCOUNT ON
	SET XACT_ABORT ON

	SELECT 	MARKIDX, IMGDATA
	FROM	TB_GUILDMARK WITH (NOLOCK)
	WHERE	MARKIDX = @MARK_IDX

	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_LoadMark]    Script Date: 07/30/2013 14:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071204 LUJ. 마크의 인덱스가 반드시 정렬되어 있다고 보장할 수 없음. 그래서
			맵 서버가 켜질 때 길드 마크를 정상적으로 읽어오지 못하는 문제가 있었음
			이에 인덱스로 정렬한 상태로 가져오게 함	
*/
CREATE proc [dbo].[MP_GUILD_LoadMark] ( @startmarkidx int )
as
	Set Nocount On
	Set Xact_Abort On

select markidx, imgdata
from tb_guildmark
where markidx > @startmarkidx
order by markidx
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_LOAD_UNION]    Script Date: 07/30/2013 14:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
081006 LUJ, 연합 정보를 읽는다
*/
create   PROC [dbo].[MP_GUILD_LOAD_UNION]
(
	@UNION_IDX	INT
)
AS	
	SET NOCOUNT ON
	SET XACT_ABORT ON

	SELECT	GUILDUNIONNAME,
		GUILDIDX0,
		GUILDIDX1,
		GUILDIDX2,
		GUILDIDX3,
		GUILDIDX4,
		GUILDIDX5,
		GUILDIDX6,
		MARKIDX
	FROM	TB_GUILDUNION WITH (NOLOCK)
	WHERE	GUILDUNIONIDX = @UNION_IDX

	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_UNION_Load]    Script Date: 07/30/2013 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MP_GUILD_UNION_Load]
(
		@StartGuildUnionIdx	int
)
AS	
	Set Nocount on
	Set Xact_Abort on

	select top 100 * from TB_GuildUnion where GuildUnionIdx > @StartGuildUnionIdx
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_UNION_MarkRegist]    Script Date: 07/30/2013 14:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 檜?雖 ?晦: (陛煎)16 X (撮煎)16 X (?撚 渡 綠?)2 X (?? 欽嬪)2 = 1024
CREATE proc [dbo].[MP_GUILD_UNION_MarkRegist]
(
	@CHARACTERIDX INT,
	@IS_UPDATE INT,
	@GUILDUNIONIDX INT ,
	@IMGDATA VARBINARY(1025)
)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON

	DELETE
		TB_GUILDUNIONMARK
	WHERE
		GUILDUNIONIDX = @GUILDUNIONIDX

	DECLARE @MARKIDX INT
	
	IF 1 = @IS_UPDATE
	BEGIN
		INSERT TB_GUILDUNIONMARK
		(
			GUILDUNIONIDX,
			IMGDATA
		)
		VALUES
		(
			@GUILDUNIONIDX,
			@IMGDATA
		)

		SET @MARKIDX = @@IDENTITY

		UPDATE
			TB_GUILDUNION
		SET
			MARKIDX = @MARKIDX
		WHERE
			GUILDUNIONIDX = @GUILDUNIONIDX
	END

	SELECT
		@CHARACTERIDX,
		ISNULL(@MARKIDX, 0),
		@GUILDUNIONIDX,
		@IMGDATA
	RETURN

/*

	if not exists ( select null from TB_GuildUnion where GuildUnionIdx = @GuildUnionIdx )
	begin
		select 0
		return
	end 
	
	delete TB_GuildUnionMark where MarkIdx = @MarkIdx

	insert TB_GuildUnionMark( GuildUnionIdx, ImgData ) values ( @GuildUnionIdx, @ImgData )
	set @MarkIdx = @@identity

	update TB_GuildUnion set MarkIdx = @MarkIdx where GuildUnionIdx = @GuildUnionIdx

	select @CharacterIdx, @MarkIdx, @GuildUnionIdx, @ImgData


*/

------------------------------
-- ?? 蛔煙 寞雖
------------------------------
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_UNION_LoadMark]    Script Date: 07/30/2013 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071204 LUJ. 마크의 인덱스가 반드시 정렬되어 있다고 보장할 수 없음. 그래서
			맵 서버가 켜질 때 길드 마크를 정상적으로 읽어오지 못하는 문제가 있었음
			이에 인덱스로 정렬한 상태로 가져오게 함	
*/
CREATE proc [dbo].[MP_GUILD_UNION_LoadMark] ( @startmarkidx int )
as
	Set Nocount On
	Set Xact_Abort On

	select MarkIdx, GuildUnionIdx, ImgData
	from TB_GuildUnionMark
	where markidx > @startmarkidx
	order by MarkIdx
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILDFIELDWAR_Record]    Script Date: 07/30/2013 14:53:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[MP_GUILDFIELDWAR_Record]
(
		@GuildIdx	int
	,	@Victory		int
	,	@Draw		int
	,	@Loose		int
)
AS	
	Set Nocount on
	

	if EXISTS(select GuildIdx from TB_GUILDWARRECORD where GuildIdx = @GuildIdx ) 
		begin
			update TB_GUILDWARRECORD set GFWVictory = @Victory, GFWDraw = @Draw, GFWLoose = @Loose where GuildIdx = @GuildIdx
			return
		end
	else
		begin
			insert TB_GUILDWARRECORD (GuildIdx, GFWVictory, GFWDraw, GFWLoose) values(@GuildIdx, @Victory, @Draw, @Loose )
			return
		end
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILDWARRECORD_Delete]    Script Date: 07/30/2013 14:53:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE   PROC [dbo].[MP_GUILDWARRECORD_Delete]
(
		@GuildIdx	int
)
AS	
	Set Nocount on

	delete from TB_GUILDWARRECORD where GuildIdx = @GuildIdx
GO
/****** Object:  StoredProcedure [dbo].[MP_OPTIONUPDATE]    Script Date: 07/30/2013 14:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MP_OPTIONUPDATE]
	(
		@dwPlayerID	int,
		@dwHideFlag	int
	)
AS
	SET NOCOUNT ON
	
	
	delete from TB_OPTION where (CHARACTER_IDX = @dwPlayerID)

	insert TB_OPTION
	(
		CHARACTER_IDX,
		HIDEFLAG
	)
	values
	(
		@dwPlayerID,
		@dwHideFlag
	)
GO
/****** Object:  StoredProcedure [dbo].[MP_OPTIONLOAD]    Script Date: 07/30/2013 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[MP_OPTIONLOAD]
	(
		@dwPlayerID	int
	)
AS
	Set	Nocount	on
	Set	Xact_abort on

	declare	@HideFlag	int
	if not exists ( select * from tb_option where character_idx = @dwPlayerID )
	begin
		set @HideFlag = 0
		insert tb_option(character_idx, hideflag) values(@dwPlayerID, @HIDEFLAG)
	end

	select hideflag from tb_option where character_idx = @dwPlayerID
GO
/****** Object:  StoredProcedure [dbo].[MP_HOUSERANK]    Script Date: 07/30/2013 14:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[MP_HOUSERANK]
AS

set nocount on

declare @rank1_userid	int
declare @rank1_hname	varchar(32)
declare @rank1_extkind	int
declare @rank1_hpoint	int
set @rank1_userid = 0
set @rank1_hname = ' '
set @rank1_extkind = 0
set @rank1_hpoint = 0

declare @rank2_userid	int
declare @rank2_hname	varchar(32)
declare @rank2_extkind	int
declare @rank2_hpoint	int
set @rank2_userid = 0
set @rank2_hname = ' '
set @rank2_extkind = 0
set @rank2_hpoint = 0

declare @rank3_userid	int
declare @rank3_hname	varchar(32)
declare @rank3_extkind	int
declare @rank3_hpoint	int
set @rank3_userid = 0
set @rank3_hname = ' '
set @rank3_extkind = 0
set @rank3_hpoint = 0

-- 임시 순위테이블 생성
create table #temp_HouseRank
(
	rank	int IDENTITY (1, 1),
	userid	int,
	hname	varchar(32),
	extkind	int,
	hpoint	int
)


declare @HouseNum	int
select @HouseNum=count(*) from TB_HOUSE where USER_INDEX > 0



if (@HouseNUM >= 1)
begin
	-- 임시 순위테이블에 3위까지 삽입
	insert #temp_HouseRank
	(
		userid,
		hname,
		extkind,
		hpoint
	)
	select top 3  USER_INDEX, HOUSE_NAME, EXTERIOR_KIND, HOUSE_POINT from TB_HOUSE order by HOUSE_POINT desc
	
	
	select @rank1_userid=userid, @rank1_hname=hname, @rank1_extkind=extkind, @rank1_hpoint=hpoint from #temp_HouseRank where rank=1
	select @rank2_userid=userid, @rank2_hname=hname, @rank2_extkind=extkind, @rank2_hpoint=hpoint from #temp_HouseRank where rank=2
	select @rank3_userid=userid, @rank3_hname=hname, @rank3_extkind=extkind, @rank3_hpoint=hpoint from #temp_HouseRank where rank=3

	-- 순위계산 후 기존 HousePoint 초기화
	update TB_HOUSE set HOUSE_POINT=0 where USER_INDEX>0
end

insert TB_HOUSE_RANK
(
	rank_1_userid,
	rank_1_housename,
	rank_1_extkind,
	rank_1_point,

	rank_2_userid,
	rank_2_housename,
	rank_2_extkind,
	rank_2_point,

	rank_3_userid,
	rank_3_housename,
	rank_3_extkind,
	rank_3_point,

	calcdate
)
values
(
	@rank1_userid,
	@rank1_hname,
	@rank1_extkind,
	@rank1_hpoint,

	@rank2_userid,
	@rank2_hname,
	@rank2_extkind,
	@rank2_hpoint,

	@rank3_userid,
	@rank3_hname,
	@rank3_extkind,
	@rank3_hpoint,

	getdate()
)

--임시 순위테이블 삭제
drop table #temp_HouseRank


select top 1
	1,
	rank_1_userid,
	rank_1_housename,
	rank_1_extkind,
	rank_1_point,

	rank_2_userid,
	rank_2_housename,
	rank_2_extkind,
	rank_2_point,

	rank_3_userid,
	rank_3_housename,
	rank_3_extkind,
	rank_3_point,

	convert(char(10), calcdate, 126)
 from TB_HOUSE_RANK order by num desc
GO
/****** Object:  StoredProcedure [dbo].[MP_HOUSEUPDATE]    Script Date: 07/30/2013 14:53:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROCEDURE [dbo].[MP_HOUSEUPDATE]
(
	@dwUserIndex		int,

	@dwExteriorKind		int,
	@dwExtendLevel		int,
	@dwTotalVisitCount	int,
	@dwDailyVisitCount	int,
	@dwDecoUsePoint	int,
	@dwHousePoint		int,
	@szHouseName		varchar(32)
)
AS

if not exists (select * from TB_HOUSE where USER_INDEX = @dwUserIndex )
begin
	return
end

begin
update TB_HOUSE
	set EXTERIOR_KIND=@dwExteriorKind, EXTEND_LEVEL=@dwExtendLevel, TOTAL_VISITCOUNT=@dwTotalVisitCount, DAILY_VISITCOUNT=@dwDailyVisitCount,
		  DECO_USEPOINT=@dwDecoUsePoint, HOUSE_POINT=@dwHousePoint, HOUSE_NAME=@szHouseName, UPDATEDATE=getdate()
	where USER_INDEX=@dwUserIndex
end
GO
/****** Object:  StoredProcedure [dbo].[MP_PARTY_ChangeMaster]    Script Date: 07/30/2013 14:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROC [dbo].[MP_PARTY_ChangeMaster] (@PARTY_IDX  int, @MasterIDX int, @TargetIDX int)
as
	Set Nocount on
	Set Xact_abort on
begin
	if not exists (select null from tb_party where Party_idx = @PARTY_IDX and character_idx = @TargetIDX) 
	begin
		select 3
		return
	end

	if(select character_rank from tb_party where Party_idx = @PARTY_IDX and character_idx = @MasterIDX) <> 20
	begin
		select 1
		return
	end
	if(select character_rank from tb_party where Party_idx = @PARTY_IDX and character_idx = @TargetIDX) <> 1
	begin
		select 2
		return
	end

	update tb_party set CHARACTER_RANK = 1 where Party_idx = @PARTY_IDX and character_idx = @MasterIDX
	update tb_party set CHARACTER_RANK = 20 where Party_idx = @PARTY_IDX and character_idx = @TargetIDX
	update tb_partyinfo set character_idx = @TargetIDX where party_idx = @PARTY_IDX
	select 0, @TargetIDX
end
GO
/****** Object:  StoredProcedure [dbo].[MP_PARTY_Regist]    Script Date: 07/30/2013 14:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_PARTY_Regist] (@StartPartyIDX int)
as
	Set Nocount on
begin
	
	select  distinct top 100  PARTY_IDX from TB_PARTY with(nolock)  where PARTY_IDX  > @StartPartyIDX
end
GO
/****** Object:  StoredProcedure [dbo].[MP_HOUSE_FURNITURE_LOAD]    Script Date: 07/30/2013 14:53:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE         PROC [dbo].[MP_HOUSE_FURNITURE_LOAD]
(
		@OwnerIndex			int,
		@StartIndex			int,
		@QueryServerConnectionIndex	int,
		@QueryPlayerMapNum		int,
		@VisitKind			int,
		@dwValue1			int,
		@dwValue2			int,
		@QueryPlayerIndex		int
)
AS	

	Set Nocount on
	Set Xact_Abort on
	
	SELECT  top 100 
	@QueryServerConnectionIndex,
	@QueryPlayerMapNum,
	@VisitKind,
	@dwValue1,
	@dwValue2,
	@QueryPlayerIndex,
	USER_INDEX,
	FURNITURE_INDEX,
	ITEM_INDEX,
	MTRL_INDEX,
	POSX,
	POSY,
	POSZ,
	ANGLE,
	CATEGORY,
	SLOT,
	STATE,
	NOTDELETE,
	DATEDIFF(SECOND, GETDATE(), ENDTIME)

	FROM    TB_HOUSE_FURNITURE
	where	USER_INDEX=@OwnerIndex and FURNITURE_INDEX > @StartIndex
	order by FURNITURE_INDEX
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_HOUSERANK_LOAD]    Script Date: 07/30/2013 14:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE         PROCEDURE [dbo].[MP_HOUSERANK_LOAD]
AS

set nocount on

select top 1
	0,
	rank_1_userid,
	rank_1_housename,
	rank_1_extkind,
	rank_1_point,

	rank_2_userid,
	rank_2_housename,
	rank_2_extkind,
	rank_2_point,

	rank_3_userid,
	rank_3_housename,
	rank_3_extkind,
	rank_3_point,

	convert(char(10), calcdate, 126)
 from TB_HOUSE_RANK order by num desc
GO
/****** Object:  StoredProcedure [dbo].[TP_PET_INSERT]    Script Date: 07/30/2013 14:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080731 LUJ, 펫을 추가한다
*/
CREATE    PROCEDURE [dbo].[TP_PET_INSERT]
	@USER_IDX	INT,
	@ITEM_DBIDX	INT,
	@SKILL_SLOT	INT,
	@PET_KIND	SMALLINT,
	@MAX_HEALTH	INT,
	@MAX_MANA	INT
	
AS
	SET NOCOUNT 		ON
	SET XACT_ABORT 	ON

	IF EXISTS
	(
		SELECT 	NULL
		FROM	TB_PET
		WHERE	ITEM_DBIDX = @ITEM_DBIDX
	)
	BEGIN
		SELECT 0
		RETURN
	END

BEGIN TRANSACTION

	UPDATE TB_ITEM
	SET	ITEM_SEAL = 0
	WHERE	ITEM_DBIDX = @ITEM_DBIDX

	IF 0 = @@ROWCOUNT
	BEGIN
		GOTO FAILURE
	END

	INSERT TB_PET
	( MASTER_IDX, ITEM_DBIDX, PET_KIND, SKILL_SLOT )
	VALUES
	( @USER_IDX, @ITEM_DBIDX, @PET_KIND, @SKILL_SLOT )

	IF 0 = @@ROWCOUNT
	BEGIN
		GOTO FAILURE
	END

	UPDATE TB_PET
	SET	PET_MAXHP 	= @MAX_HEALTH,
		PET_HP		= @MAX_HEALTH,
		PET_MAXMP	= @MAX_MANA,
		PET_MP		= @MAX_MANA
	WHERE	ITEM_DBIDX	= @ITEM_DBIDX

	IF 0 = @@ROWCOUNT
	BEGIN
		GOTO FAILURE
	END
	
	COMMIT

	SELECT	PET_IDX,
		ITEM_DBIDX,
		PET_KIND,
		PET_LEVEL,
		PET_GRADE,
		SKILL_SLOT,
		PET_EXP,
		PET_FRIENDLY,
		PET_HP,
		PET_MAXHP,
		PET_MP,
		PET_MAXMP,
		PET_AI,
		PET_STATE,
		PET_TYPE
	FROM	TB_PET
	WHERE	ITEM_DBIDX = @ITEM_DBIDX
	RETURN

FAILURE:
	ROLLBACK

	SELECT 0
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_PET_MASTER_UPDATE]    Script Date: 07/30/2013 14:54:09 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[MP_PET_MASTER_UPDATE]
(
	@Master_Idx	int,
	@Item_DBIdx	int
)
AS

update dbo.tb_pet
set
MASTER_IDX = @Master_Idx
where ITEM_DBIDX = @Item_DBIdx

Set Nocount On
GO
/****** Object:  StoredProcedure [dbo].[MP_PET_INFO_LOAD]    Script Date: 07/30/2013 14:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 100406 LUJ, 캐릭터 번호를 반환하여, 소환 대상을 파악할 수 있도록 함
CREATE PROCEDURE [dbo].[MP_PET_INFO_LOAD]
(
	@Master_Idx	int
)
AS

Set Nocount On

SELECT
	P.PET_IDX,
	P.ITEM_DBIDX,
	P.MASTER_IDX,
	P.PET_KIND,
	P.PET_LEVEL,
	P.PET_GRADE,
	P.SKILL_SLOT,
	P.PET_EXP,
	P.PET_FRIENDLY,
	P.PET_HP,
	P.PET_MAXHP,
	P.PET_MP,
	P.PET_MAXMP,
	P.PET_AI,
	P.PET_STATE,
	P.PET_TYPE,
	P.PET_CHECKTIME,
	I.CHARACTER_IDX
FROM DBO.TB_PET P INNER JOIN DBO.TB_ITEM I WITH(NOLOCK) ON P.ITEM_DBIDX = I.ITEM_DBIDX
WHERE P.MASTER_IDX = @Master_Idx
RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_PET_INFO_UPDATE]    Script Date: 07/30/2013 14:54:08 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[MP_PET_INFO_UPDATE]
(
	@Item_DBIdx	int,
	@level		tinyint,
	@Grade	tinyint,
	@Type		tinyint,
	@Slot		tinyint,
	@Exp		smallint,
	@Friendly	tinyint,
	@MAXHP	int,
	@HP		int,
	@MAXMP	int,
	@MP		int,
	@AI		tinyint,
	@State		tinyint,
	@Time		int
)
AS

update dbo.tb_pet
set
PET_LEVEL = @Level,
PET_GRADE = @Grade,
SKILL_SLOT = @Slot,
PET_EXP = @Exp,
PET_FRIENDLY = @Friendly,
PET_MAXHP = @MAXHP,
PET_HP = @HP,
PET_MAXMP = @MAXMP,
PET_MP = @MP,
PET_AI = @AI,
PET_STATE = @State,
PET_TYPE = @Type,
PET_CHECKTIME = @Time
where ITEM_DBIDX = @Item_DBIdx

Set Nocount On
GO
/****** Object:  StoredProcedure [dbo].[MP_PET_INFO_ADD_WITH_STATIC_SKILL]    Script Date: 07/30/2013 14:54:07 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE   PROCEDURE [dbo].[MP_PET_INFO_ADD_WITH_STATIC_SKILL]
(
	@Master_Idx	int,
	@Item_DBIdx	int,
	@Kind		smallint,
	@Skill_Slot	tinyint,					
	-- 090714 ONS 펫 고정 스킬 추가 
	@ITEM_IDX	int,					-- 펫 고정 스킬 인덱스
	@ITEM_POSITION	tinyint					-- 펫 고정 스킬 슬롯 위치
)
AS

	Set Nocount On
	
	insert dbo.tb_pet ( master_idx, item_dbidx, pet_kind, skill_slot )
	values ( @Master_Idx, @Item_DBIdx, @Kind, @Skill_Slot )
	
	-- 090714 ONS 방금 추가 된 행의 Database 인덱스를 가져온다
	declare @PET_IDX int
	select @PET_IDX = @@identity
	
	update dbo.tb_item
	set item_seal = 0
	where item_dbidx = @Item_DBIdx

	-- 090714 ONS 펫 봉인 해제시 고정 스킬 아이템을 추가한다.
	insert TB_ITEM						
	(
		CHARACTER_IDX					-- 캐릭터 인덱스
	,	PET_IDX						-- 펫 인덱스	
	, 	ITEM_IDX					-- 아이템 인덱스
	, 	ITEM_DURABILITY					-- 내구성 ( 현재 중복 개수로 사용 ) 
	, 	ITEM_POSITION					-- 인벤토리 상의 아이템 위치
	, 	ITEM_QPOSITION					-- 퀵 슬롯 상의 아이템 위치
	, 	ITEM_PYOGUKIDX					-- 표국 인덱스
	, 	item_munpaidx					-- 문파 인덱스
	,	ITEM_PARAM					-- 아이템 parameter
	,	ITEM_SEAL					-- 봉인상태
	,	ITEM_REMAINTIME				-- 남은 시간

	)
	values							-- 추가 값을 열거
	(
		0						-- 캐릭터 인덱스
	,	@PET_IDX					-- 펫 인덱스
	, 	@ITEM_IDX					-- 아이템 인덱스
	, 	0						-- 내구성( 현재 중복 개수로 사용 )
	, 	@ITEM_POSITION					-- 인벤토리 상의 아이템 위치
	, 	0						-- 퀵 슬롯 상의 아이템 위치
	, 	0						-- 표국 인덱스
	, 	0						-- 문파 인덱스
	,	0						-- 아이템 parameter
	,	0						-- 봉인 상태
	,	0						-- 남은 시간
	)


	select *
	from dbo.tb_pet
	where item_dbidx = @Item_DBIdx
GO
/****** Object:  StoredProcedure [dbo].[MP_PET_INFO_ADD]    Script Date: 07/30/2013 14:54:06 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE    PROCEDURE [dbo].[MP_PET_INFO_ADD]
(
	@Master_Idx	int,
	@Item_DBIdx	int,
	@Kind		smallint,
	@Skill_Slot	tinyint,					
	-- 090714 ONS 펫 고정 스킬 추가 
	@ITEM_IDX	int,					-- 펫 고정 스킬 인덱스
	@ITEM_POSITION	tinyint					-- 펫 고정 스킬 슬롯 위치
)
AS

	Set Nocount On
	
	insert dbo.tb_pet ( master_idx, item_dbidx, pet_kind, skill_slot )
	values ( @Master_Idx, @Item_DBIdx, @Kind, @Skill_Slot )
	
	-- 090714 ONS 방금 추가 된 행의 Database 인덱스를 가져온다
	declare @PET_IDX int
	select @PET_IDX = @@identity
	
	update dbo.tb_item
	set item_seal = 0
	where item_dbidx = @Item_DBIdx

	-- 090714 ONS 펫 봉인 해제시 고정 스킬 아이템을 추가한다.
	insert TB_ITEM						
	(
		CHARACTER_IDX					-- 캐릭터 인덱스
	,	PET_IDX						-- 펫 인덱스	
	, 	ITEM_IDX					-- 아이템 인덱스
	, 	ITEM_DURABILITY					-- 내구성 ( 현재 중복 개수로 사용 ) 
	, 	ITEM_POSITION					-- 인벤토리 상의 아이템 위치
	, 	ITEM_QPOSITION					-- 퀵 슬롯 상의 아이템 위치
	, 	ITEM_PYOGUKIDX					-- 표국 인덱스
	, 	item_munpaidx					-- 문파 인덱스
	,	ITEM_PARAM					-- 아이템 parameter
	,	ITEM_SEAL					-- 봉인상태
	,	ITEM_REMAINTIME				-- 남은 시간

	)
	values							-- 추가 값을 열거
	(
		0						-- 캐릭터 인덱스
	,	@PET_IDX					-- 펫 인덱스
	, 	@ITEM_IDX					-- 아이템 인덱스
	, 	0						-- 내구성( 현재 중복 개수로 사용 )
	, 	@ITEM_POSITION					-- 인벤토리 상의 아이템 위치
	, 	0						-- 퀵 슬롯 상의 아이템 위치
	, 	0						-- 표국 인덱스
	, 	0						-- 문파 인덱스
	,	0						-- 아이템 parameter
	,	0						-- 봉인 상태
	,	0						-- 남은 시간
	)


	select *
	from dbo.tb_pet
	where item_dbidx = @Item_DBIdx
GO
/****** Object:  StoredProcedure [dbo].[RP_ItemUpdate]    Script Date: 07/30/2013 14:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[RP_ItemUpdate]
(
		@ItemDBIdx	int
	,	@ItemIdx		int
	,	@ItemDur	int
	,	@ItemPos	int
)
as
	set nocount on

	update tb_item set 
		Item_Idx = @ItemIdx,
		Item_durability = @ItemDur,
		Item_Position = @ItemPos
	where Item_DBIdx = @ItemDBIdx
GO
/****** Object:  StoredProcedure [dbo].[RP_ItemDelete]    Script Date: 07/30/2013 14:54:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RP_ItemDelete]
(
		@ItemDBIdx	int
	,	@OptionIdx	int
)
as
	set nocount on
	set xact_abort on

	delete tb_item where Item_dbIdx = @ItemDBIdx


	if( @OptionIdx != 0)
	begin
		delete tb_item_option where option_dbIdx = @OptionIdx
	end
GO
/****** Object:  StoredProcedure [dbo].[RP_InvenItemInsert]    Script Date: 07/30/2013 14:54:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE    proc [dbo].[RP_InvenItemInsert]
(
		@charname	varchar(17)
	,	@character_idx	int
	,	@item_idx	int
	,	@item_dur	int
	,	@item_position	int

	,	@Option_idx	int
	,	@Strength	int
	,	@Dexterity	int
	,	@Vitality	int
	,	@Intelligence	int
	,	@Wisdom	int
	,	@Life		int
	,	@Mana		int
	,	@FireAttrRegist	int
	,	@WaterAttrRegist	int
	,	@TreeAttrRegist	int
	,	@GoldAttrRegist	int
	,	@EarthAttrRegist	int
	,	@PhyAttack	int
	,	@Critical		int
	,	@FireAttrAttack	int
	,	@WaterAttrAttack	int
	,	@TreeAttrAttack	int
	,	@GoldAttrAttack	int
	,	@EarthAttrAttack	int
	,	@PhyDefense	int
)
as
	set nocount on
	set xact_abort on

	declare @item_dbidx	int
	declare @option_dbidx	int

	insert TB_ITEM
		(
		CHARACTER_IDX, ITEM_IDX, ITEM_DURABILITY, ITEM_POSITION, ITEM_QPOSITION, ITEM_PYOGUKIDX, item_munpaidx )
	values
		(
		@character_idx, @item_idx, @item_dur, @item_position, 0, 0, 0 )

	select @item_dbidx = @@identity

	if( @item_idx>55100 )
		update TB_ITEM set ITEM_PARAM=1 where ITEM_DBIDX=@item_dbidx

	if( @Option_idx != 0 )
	begin

		insert tb_Item_option
			(
				ITEM_DBIDX, 
				Strength, 
				Dexterity,
				Vitality,
				Intelligence,
				Wisdom,
				Life,
				Mana,
				FireAttrRegist,
				WaterAttrRegist,
				TreeAttrRegist,
				GoldAttrRegist,
				EarthAttrRegist,
				PhyAttack,
				Critical,
				FireAttrAttack,
				WaterAttrAttack,
				TreeAttrAttack,
				GoldAttrAttack,
				EarthAttrAttack,
				PhyDefense
			)
			values
			(
				@item_dbidx, 
				@Strength, 
				@Dexterity,
				@Vitality,
				@Intelligence,
				@Wisdom,
				@Life,
				@Mana,
				@FireAttrRegist,
				@WaterAttrRegist,
				@TreeAttrRegist,
				@GoldAttrRegist,
				@EarthAttrRegist,
				@PhyAttack,
				@Critical,
				@FireAttrAttack,
				@WaterAttrAttack,
				@TreeAttrAttack,
				@GoldAttrAttack,
				@EarthAttrAttack,
				@PhyDefense
			)

		select @option_dbidx = @@identity
		update tb_item set ITEM_DURABILITY = @option_dbidx where item_dbidx = @item_dbidx

	end

	select @charname, * from tb_item where item_dbidx = @item_dbidx
GO
/****** Object:  StoredProcedure [dbo].[RP_ItemOptionInsert]    Script Date: 07/30/2013 14:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE proc [dbo].[RP_ItemOptionInsert]
(	
		@ItemDBIdx	int
	,	@Strength	int
	,	@Dexterity	int
	,	@Vitality	int
	,	@Intelligence	int
	,	@Wisdom	int
	,	@Life		int
	,	@Mana		int
	,	@FireAttrRegist	int
	,	@WaterAttrRegist	int
	,	@TreeAttrRegist	int
	,	@GoldAttrRegist	int
	,	@EarthAttrRegist	int
	,	@PhyAttack	int
	,	@Critical		int
	,	@FireAttrAttack	int
	,	@WaterAttrAttack	int
	,	@TreeAttrAttack	int
	,	@GoldAttrAttack	int
	,	@EarthAttrAttack	int
	,	@PhyDefense	int
)

as
	set nocount on
	set xact_abort on

	insert tb_Item_option
		(
			ITEM_DBIDX, 
			Strength, 
			Dexterity,
			Vitality,
			Intelligence,
			Wisdom,
			Life,
			Mana,
			FireAttrRegist,
			WaterAttrRegist,
			TreeAttrRegist,
			GoldAttrRegist,
			EarthAttrRegist,
			PhyAttack,
			Critical,
			FireAttrAttack,
			WaterAttrAttack,
			TreeAttrAttack,
			GoldAttrAttack,
			EarthAttrAttack,
			PhyDefense
		)
		values
		(
			@ItemDBIdx, 
			@Strength, 
			@Dexterity,
			@Vitality,
			@Intelligence,
			@Wisdom,
			@Life,
			@Mana,
			@FireAttrRegist,
			@WaterAttrRegist,
			@TreeAttrRegist,
			@GoldAttrRegist,
			@EarthAttrRegist,
			@PhyAttack,
			@Critical,
			@FireAttrAttack,
			@WaterAttrAttack,
			@TreeAttrAttack,
			@GoldAttrAttack,
			@EarthAttrAttack,
			@PhyDefense
		)


	update tb_item set item_durability = @@identity where item_dbidx = @ItemDBIdx
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_LoadItem_Inneed]    Script Date: 07/30/2013 14:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE             proc [dbo].[MP_GUILD_LoadItem_Inneed] 
(
	@MapNum	int,
	@GuildIdx	int
) 
as
	Set Nocount on


	select @GuildIdx, item_dbidx, item_idx, item_position, item_durability, item_rareidx
	from tb_item where item_munpaidx = @GuildIdx
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_ItemInfo]    Script Date: 07/30/2013 14:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MP_CHARACTER_ItemInfo]
	(
		@CHARACTER_IDX	int
	)

	AS

	SET NOCOUNT ON

	SELECT

		CHARACTER_IDX
	,	ITEM_DBIDX
	,	ITEM_IDX
	,	ITEM_POSITION
	,	ITEM_QPOSITION
	,	ITEM_DURABILITY
	,	ITEM_PARAM
	,	ITEM_RAREIDX

	FROM TB_ITEM

	WHERE CHARACTER_IDX = @CHARACTER_IDX

	RETURN


/*
ALTER         proc MP_CHARACTER_ItemInfo
	(
		@CHARACTER_IDX			int	
	)
	as
		Set Nocount on
	--	Set Xact_abort on


	------------------------------------------------------------------------- 필요 임시 변수 선언 및 세팅
	declare 
		@reducelogin 	int
	,	@usetime	int

	select 
		@reducelogin = item_reducelogin 
	,	@usetime = item_usetime

	from TB_ITEM with(readuncommitted) 

	where 
		CHARACTER_IDX=@CHARACTER_IDX 
		and 
		ITEM_POSITION < 109 	

	------------------------------------------------------------------------- 시간 사용 아이템이 아닐 경우,
	if @usetime is null
		begin
			select top 110 		
				character_idx
			, 	item_dbidx
			, 	item_idx
			, 	item_position
			, 	item_qposition
			, 	item_durability
			, 	item_param
			, 	item_rareidx
			,	0
			,	0
			,	0

			 from TB_ITEM with(readuncommitted) 
	
			where 
				CHARACTER_IDX=@CHARACTER_IDX  
				and 
				ITEM_POSITION < 109 order by ITEM_POSITION
			return
		end
			
	------------------------------------------------------------------------- 시간을 사용하는 아이템일 경우,
	
	--------------------------------------------------------- 로그인 시 시간을 줄이는 아이템.
	if @reducelogin = 1
		select top 110 		
				character_idx
			, 	item_dbidx
			, 	item_idx
			, 	item_position
			, 	item_qposition
			, 	item_durability
			, 	item_param
			, 	item_rareidx
			,	ISNULL(item_usetime, 0)
			,	ISNULL(item_reducelogin, 0)
			,	ISNULL(item_remaintime, 0)

		 from TB_ITEM with(readuncommitted) 

		where 
			CHARACTER_IDX=@CHARACTER_IDX  
			and 
			ITEM_POSITION < 109 order by ITEM_POSITION
	--------------------------------------------------------- 서버 기준으로 시간을 줄이는 아이템.
	else if @reducelogin = 0
		select top 110 		
				character_idx
			, 	item_dbidx
			, 	item_idx
			, 	item_position
			, 	item_qposition
			, 	item_durability
			, 	item_param
			, 	item_rareidx
			,	ISNULL(item_usetime, 0)
			,	ISNULL(item_reducelogin, 0)
			,	0

		 from TB_ITEM with(readuncommitted) 

		where 
			CHARACTER_IDX=@CHARACTER_IDX  
			and 
			ITEM_POSITION < 109 order by ITEM_POSITION
	--------------------------------------------------------- null 이면,
	else 
		select top 110 		
				character_idx
			, 	item_dbidx
			, 	item_idx
			, 	item_position
			, 	item_qposition
			, 	item_durability
			, 	item_param
			, 	item_rareidx
			,	0
			,	0
			,	0

		 from TB_ITEM with(readuncommitted) 

		where 
			CHARACTER_IDX=@CHARACTER_IDX  
			and 
			ITEM_POSITION < 109 order by ITEM_POSITION

	------------------------------------------------------------------------- 쿼리문 처리 종료		
	return
*/
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_ItemRareOptionInfo]    Script Date: 07/30/2013 14:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_CHARACTER_ItemRareOptionInfo]
(
	@CharIdx	int
)
as
	set nocount on
	set xact_abort on

	if exists(select b.* from tb_item a
 		right outer join tb_item_rare b on a.item_dbIdx = b.ITEM_DBIDX
		where a.character_idx = @CharIdx)
	begin
		select @CharIdx, b.* from tb_item a
		right outer join tb_item_rare b on a.item_dbidx = b.ITEM_DBIDX
		where a.character_idx = @CharIdx
	end
	else
	begin
		select @CharIdx, 0
	end



return

select *
from tb_item
where character_idx = 802
order by item_position
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_ItemInfo_New]    Script Date: 07/30/2013 14:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080124 웅주, 로딩 속도 향상을 위해 아이템 옵션 정보를 조인해서 함께 읽도록 함
*/
CREATE  PROC [dbo].[MP_CHARACTER_ItemInfo_New]
(
	@CHAR_IDX	int
)
AS
	SET NOCOUNT ON
	
	IF NOT EXISTS(	SELECT NULL
					FROM TB_ITEM
					WHERE CHARACTER_IDX = @CHAR_IDX )
	BEGIN
		SELECT @CHAR_IDX, 0
		RETURN
	END
	
	SELECT  A.CHARACTER_IDX,
			A.ITEM_DBIDX,
			A.ITEM_IDX,
			A.ITEM_POSITION, 
	        A.ITEM_QPOSITION,
	        A.ITEM_DURABILITY,
	        A.ITEM_PARAM,
	        A.ITEM_SEAL, 
	        DATEDIFF(SECOND, GETDATE(), A.ITEM_ENDTIME), 
	        A.ITEM_REMAINTIME,
	        ISNULL( B.REINFORCE_STRENGTH, 0 ),
	        ISNULL( B.REINFORCE_DEXTERITY, 0 ), 
	        ISNULL( B.REINFORCE_VITALITY, 0 ),
	        ISNULL( B.REINFORCE_INTELLIGENCE, 0 ), 
	        ISNULL( B.REINFORCE_WISDOM, 0 ),
	        ISNULL( B.REINFORCE_LIFE, 0 ),
	        ISNULL( B.REINFORCE_MANA, 0 ), 
	        ISNULL( B.REINFORCE_LIFE_RECOVERY, 0 ),
	        ISNULL( B.REINFORCE_MANA_RECOVERY, 0 ), 
	        ISNULL( B.REINFORCE_PHYSIC_ATTACK, 0 ),
	        ISNULL( B.REINFORCE_PHYSIC_DEFENCE, 0 ), 
	        ISNULL( B.REINFORCE_MAGIC_ATTACK, 0 ),
	        ISNULL( B.REINFORCE_MAGIC_DEFENCE, 0 ), 
	        ISNULL( B.REINFORCE_MOVE_SPEED, 0 ),
	        ISNULL( B.REINFORCE_EVADE, 0 ), 
	        ISNULL( B.REINFORCE_ACCURACY, 0 ),
	        ISNULL( B.REINFORCE_CRITICAL_RATE, 0 ), 
	        ISNULL( B.REINFORCE_CRITICAL_DAMAGE, 0 ),
	        ISNULL( B.REINFORCE_MADEBY, '' ),
	        ISNULL( B.MIX_STRENGTH, 0 ), 
	        ISNULL( B.MIX_INTELLIGENCE, 0 ),
	        ISNULL( B.MIX_DEXTERITY, 0 ),
	        ISNULL( B.MIX_WISDOM, 0 ),
	        ISNULL( B.MIX_VITALITY, 0 ), 
	        ISNULL( B.MIX_MADEBY, '' ),
	        ISNULL( B.ENCHANT_INDEX, 0 ),
	        ISNULL( B.ENCHANT_LEVEL, 0 ), 
	        ISNULL( B.ENCHANT_MADEBY, '' ),
			ISNULL( C.KEY1, 0 ),
	        CAST( ROUND( ISNULL( C.VALUE1, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
	        ISNULL( C.KEY2, 0 ),
	        CAST( ROUND( ISNULL( C.VALUE2, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
	        ISNULL( C.KEY3, 0 ),
	        CAST( ROUND( ISNULL( C.VALUE3, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
	        ISNULL( C.KEY4, 0 ),
	        CAST( ROUND( ISNULL( C.VALUE4, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
	        ISNULL( C.KEY5, 0 ),
	        CAST( ROUND( ISNULL( C.VALUE5, 0 ), 3, 3 ) AS VARCHAR( 16 ) )
	FROM    TB_ITEM A  LEFT OUTER JOIN
	        TB_ITEM_DROP_OPTION C  ON 
	        A.ITEM_DBIDX = C.ITEM_DBIDX LEFT OUTER JOIN
	        TB_ITEM_OPTION2 B  ON A.ITEM_DBIDX = B.ITEM_DBIDX
	WHERE	A.CHARACTER_IDX = @CHAR_IDX
	ORDER BY A.ITEM_DBIDX
	
	RETURN	

/*
-- 080123 이전 코드
if not exists (	SELECT NULL
				FROM TB_ITEM
				WHERE CHARACTER_IDX = @CHAR_IDX )
begin
		select 0, @CHAR_IDX
		RETURN
	end
else
	begin
		select character_idx, item_dbidx, item_idx, item_position, item_qposition, item_durability,item_param, item_rareidx,ITEM_SEAL,DATEDIFF(second, GetDate(), ITEM_ENDTIME) 
	,ITEM_REMAINTIME
			 from TB_ITEM with(readuncommitted) where CHARACTER_IDX=@CHAR_IDX

		RETURN
	end
*/


select *
from tb_item_drop_option
where item_dbidx = 24027316
GO
/****** Object:  StoredProcedure [dbo].[RP_CharacterPyogukItemInfo]    Script Date: 07/30/2013 14:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[RP_CharacterPyogukItemInfo]
(
		@useridx	int
	,	@startPos	int
)
as
	Set Nocount On

	select top 100  @useridx, ITEM_DBIDX, ITEM_IDX, ITEM_POSITION, ITEM_QPOSITION, ITEM_DURABILITY, item_rareidx
	from tb_item with(readuncommitted)
	where (item_position > @startPos) and (item_pyogukidx = @useridx)
	order by item_position asc
GO
/****** Object:  StoredProcedure [dbo].[RP_CharacterInvenInfo]    Script Date: 07/30/2013 14:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 캐릭터 인벤 정보
CREATE       proc [dbo].[RP_CharacterInvenInfo]
(
		@StartIdx	int,
		@CharIdx	int
)
as
	Set Nocount on

	select top 100 character_idx, item_dbidx, item_idx, item_position, item_qposition, item_durability, item_param, item_rareidx
	from TB_ITEM with(readuncommitted)
	where (ITEM_DBIDX > @StartIdx) and (CHARACTER_IDX=@CharIdx)
	order by ITEM_DBIDX
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_ITEM_SELECT]    Script Date: 07/30/2013 14:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
070808 웅주, 길드 아이템을 가져온다
071209 웅주, 조인 연산 제거, 인덱싱된 필드(CHARACTER_IDX)로 인한 쿼리 속도 향상
080128 웅주, 옵션을 함께 읽도록 함
*/
CREATE PROCEDURE [dbo].[MP_GUILD_ITEM_SELECT]
(
	@GUILD_IDX			INT,
	@BEGIN_ITEM_DBIDX	INT
)
AS
	SET NOCOUNT ON
	
	SELECT  TOP 100
			0,
			A.ITEM_DBIDX,
			A.ITEM_IDX,
			A.ITEM_POSITION, 
	        A.ITEM_QPOSITION,
	        A.ITEM_DURABILITY,
	        A.ITEM_PARAM,
	        A.ITEM_SEAL,
			DATEDIFF(SECOND, GETDATE(), A.ITEM_ENDTIME), 
			A.ITEM_REMAINTIME,
			ISNULL( B.REINFORCE_STRENGTH, 0 ),
	        ISNULL( B.REINFORCE_DEXTERITY, 0 ), 
	        ISNULL( B.REINFORCE_VITALITY, 0 ),
	        ISNULL( B.REINFORCE_INTELLIGENCE, 0 ), 
	        ISNULL( B.REINFORCE_WISDOM, 0 ),
	        ISNULL( B.REINFORCE_LIFE, 0 ),
	        ISNULL( B.REINFORCE_MANA, 0 ), 
	        ISNULL( B.REINFORCE_LIFE_RECOVERY, 0 ),
	        ISNULL( B.REINFORCE_MANA_RECOVERY, 0 ), 
	        ISNULL( B.REINFORCE_PHYSIC_ATTACK, 0 ),
	        ISNULL( B.REINFORCE_PHYSIC_DEFENCE, 0 ), 
	        ISNULL( B.REINFORCE_MAGIC_ATTACK, 0 ),
	        ISNULL( B.REINFORCE_MAGIC_DEFENCE, 0 ), 
	        ISNULL( B.REINFORCE_MOVE_SPEED, 0 ),
	        ISNULL( B.REINFORCE_EVADE, 0 ), 
	        ISNULL( B.REINFORCE_ACCURACY, 0 ),
	        ISNULL( B.REINFORCE_CRITICAL_RATE, 0 ), 
	        ISNULL( B.REINFORCE_CRITICAL_DAMAGE, 0 ),
	        ISNULL( B.REINFORCE_MADEBY, '' ),
	        ISNULL( B.MIX_STRENGTH, 0 ), 
	        ISNULL( B.MIX_INTELLIGENCE, 0 ),
	        ISNULL( B.MIX_DEXTERITY, 0 ),
	        ISNULL( B.MIX_WISDOM, 0 ),
	        ISNULL( B.MIX_VITALITY, 0 ), 
	        ISNULL( B.MIX_MADEBY, '' ),
	        ISNULL( B.ENCHANT_INDEX, 0 ),
	        ISNULL( B.ENCHANT_LEVEL, 0 ), 
	        ISNULL( B.ENCHANT_MADEBY, '' ),
			ISNULL( C.KEY1, 0 ),
	        CAST( ROUND( ISNULL( C.VALUE1, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
	        ISNULL( C.KEY2, 0 ),
	        CAST( ROUND( ISNULL( C.VALUE2, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
	        ISNULL( C.KEY3, 0 ),
	        CAST( ROUND( ISNULL( C.VALUE3, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
	        ISNULL( C.KEY4, 0 ),
	        CAST( ROUND( ISNULL( C.VALUE4, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
	        ISNULL( C.KEY5, 0 ),
	        CAST( ROUND( ISNULL( C.VALUE5, 0 ), 3, 3 ) AS VARCHAR( 16 ) )
	FROM	TB_ITEM A LEFT OUTER JOIN
	        TB_ITEM_DROP_OPTION C ON 
	        A.ITEM_DBIDX = C.ITEM_DBIDX LEFT OUTER JOIN
	        TB_ITEM_OPTION2 B ON A.ITEM_DBIDX = B.ITEM_DBIDX
	WHERE	ITEM_MUNPAIDX = @GUILD_IDX AND @BEGIN_ITEM_DBIDX < A.ITEM_DBIDX
	ORDER BY A.ITEM_DBIDX
	RETURN
		
	
/*
	-- 080128 이전
	
	SELECT  ITEM_DBIDX,
			ITEM_IDX,
			ITEM_POSITION,
			--A.ITEM_QPOSITION, 
			ITEM_DURABILITY,
	        --A.ITEM_PYOGUKIDX,
	        --A.ITEM_FAMILYIDX, 
	        --A.ITEM_SHOPIDX,
	        --A.ITEM_PARAM,
			--ITEM_RAREIDX,
			-- 071208 Seal 정보 추가
			ITEM_SEAL
	FROM	TB_ITEM WITH (NOLOCK)
	WHERE	ITEM_MUNPAIDX = @GUILD_IDX AND
			CHARACTER_IDX = 0
*/
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_ITEM_OPTION_SELECT]    Script Date: 07/30/2013 14:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
070808 웅주, 길드 소유의 아이템 옵션을 가져온다
071209 웅주, 쿼리 속도 향상(조건을 추가하여 스캔 범위를 줄이고 TB_ITEM_OPTION2에 
			ITEM_DBIDX에 대한 인덱스를 만들었다. 나중에 OPTION_IDX대신 ITEM_DBIDX를
			클러스터 키로 만들면 더 나은 성능 향상이 있다는 점을 유의하자)
*/
CREATE PROCEDURE [dbo].[MP_GUILD_ITEM_OPTION_SELECT]
(
	@GUILD_IDX	INT
)
AS
	SET NOCOUNT ON
	
	SELECT  OPTION_IDX,
			REINFORCE_STRENGTH,
			REINFORCE_DEXTERITY,
			REINFORCE_VITALITY,
			REINFORCE_INTELLIGENCE,
			REINFORCE_WISDOM,
			REINFORCE_LIFE,
			REINFORCE_MANA,
			REINFORCE_LIFE_RECOVERY,
			REINFORCE_MANA_RECOVERY,
			REINFORCE_PHYSIC_ATTACK,
			REINFORCE_PHYSIC_DEFENCE,
			REINFORCE_MAGIC_ATTACK,
			REINFORCE_MAGIC_DEFENCE,
			REINFORCE_MOVE_SPEED,
			REINFORCE_EVADE,
			REINFORCE_ACCURACY,
			REINFORCE_CRITICAL_RATE,
			REINFORCE_CRITICAL_DAMAGE,
			REINFORCE_MADEBY,
			MIX_STRENGTH,
			MIX_INTELLIGENCE,
			MIX_DEXTERITY,	
			MIX_WISDOM,		
			MIX_VITALITY,
			MIX_MADEBY,
			ENCHANT_INDEX,
	        ENCHANT_LEVEL,
	        ENCHANT_MADEBY
	FROM TB_ITEM_OPTION2
	WHERE ITEM_DBIDX  IN
		(
			SELECT ITEM_DBIDX
			FROM	TB_ITEM
			WHERE	CHARACTER_IDX = 0 AND
					ITEM_MUNPAIDX = @GUILD_IDX
		)
		
	RETURN
	
	/*
	SELECT  A.OPTION_IDX,
			A.REINFORCE_STRENGTH,
			A.REINFORCE_DEXTERITY,
			A.REINFORCE_VITALITY,
			A.REINFORCE_INTELLIGENCE,
			A.REINFORCE_WISDOM,
			A.REINFORCE_LIFE,
			A.REINFORCE_MANA,
			A.REINFORCE_LIFE_RECOVERY,
			A.REINFORCE_MANA_RECOVERY,
			A.REINFORCE_PHYSIC_ATTACK,
			A.REINFORCE_PHYSIC_DEFENCE,
			A.REINFORCE_MAGIC_ATTACK,
			A.REINFORCE_MAGIC_DEFENCE,
			A.REINFORCE_MOVE_SPEED,
			A.REINFORCE_EVADE,
			A.REINFORCE_ACCURACY,
			A.REINFORCE_CRITICAL_RATE,
			A.REINFORCE_CRITICAL_DAMAGE,
			A.REINFORCE_MADEBY,
			A.MIX_STRENGTH,
			A.MIX_INTELLIGENCE,
			A.MIX_DEXTERITY,	
			A.MIX_WISDOM,		
			A.MIX_VITALITY,
			A.MIX_MADEBY,
			A.ENCHANT_INDEX,
	        A.ENCHANT_LEVEL,
	        A.ENCHANT_MADEBY
	FROM    TB_ITEM_OPTION2 AS A INNER JOIN TB_ITEM AS B 
			ON A.ITEM_DBIDX = B.ITEM_DBIDX
	WHERE   (B.ITEM_MUNPAIDX = @GUILD_IDX)
	*/
	
SELECT *
FROM TB_ITEM_DROP_OPTION
WHERE ITEM_DBIDX = 24029680
GO
/****** Object:  StoredProcedure [dbo].[TP_ShopWareItemInsert]    Script Date: 07/30/2013 14:55:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE	proc [dbo].[TP_ShopWareItemInsert]
(
		@item_shopidx	int
	,	@item_idx	int
	,	@item_position	int
	,	@item_durability	int
)
as
	set nocount on
	set xact_abort on

	declare @item_dbidx	int
	declare @option_dbidx	int

	insert TB_ITEM
		(
		CHARACTER_IDX, ITEM_IDX, ITEM_POSITION, ITEM_QPOSITION, ITEM_DURABILITY, ITEM_MUNPAIDX,
		ITEM_PYOGUKIDX, ITEM_SHOPIDX, ITEM_PARAM )
	values
		(
		0, @item_idx, @item_position, 0, @item_durability, 0,
		0, @item_shopidx, 1 )

	select @item_dbidx = @@identity

	select * from tb_item with(nolock) where item_dbidx = @item_dbidx
GO
/****** Object:  StoredProcedure [dbo].[MP_PET_ITEM_LOAD]    Script Date: 07/30/2013 14:54:09 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MP_PET_ITEM_LOAD]
(
	@Pet_Idx	int
)
AS

Set Nocount On

select *
from dbo.tb_Item
where pet_idx = @Pet_Idx
GO
/****** Object:  StoredProcedure [dbo].[RP_MunpaItemInfo]    Script Date: 07/30/2013 14:54:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 문파 아이템 정보
CREATE   proc [dbo].[RP_MunpaItemInfo]
(
		@MunpaIdx	int
	,	@startPos	int
)
as
	Set Nocount On

	select top 100  ITEM_MUNPAIDX, ITEM_DBIDX, ITEM_IDX, ITEM_POSITION, ITEM_QPOSITION, ITEM_DURABILITY  from tb_item  with(nolock) 
	where (item_position > @startPos) and (item_munpaidx = @MunpaIdx)
	order by item_position asc
GO
/****** Object:  StoredProcedure [dbo].[MP_PET_ITEMINFO]    Script Date: 07/30/2013 14:54:09 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE  PROC [dbo].[MP_PET_ITEMINFO]
	(
		@PET_IDX	int
	)

	AS

	SET NOCOUNT ON

	SELECT

		PET_IDX
	,	ITEM_DBIDX
	,	ITEM_IDX
	,	ITEM_POSITION
	,	ITEM_SEAL
	,	DATEDIFF(SECOND,GETDATE(), ITEM_ENDTIME )
	,	ITEM_REMAINTIME

	
	FROM TB_ITEM

	WHERE PET_IDX = @PET_IDX

	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_PET_WearItemInfo]    Script Date: 07/30/2013 14:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	proc [dbo].[MP_PET_WearItemInfo]
(
	@CharacterIdx	int,
	@StartPos	int,
	@EndPos	int
)
as
	Set Nocount on
--	Set Xact_abort on

if not exists ( select * from TB_ITEM with(readuncommitted) where CHARACTER_IDX=@CharacterIdx and item_position >= @StartPos and item_position <  @EndPos )
begin
	select 0, @CharacterIdx
	return
end
else
begin 
	select character_idx, item_dbidx, item_idx, item_position, item_qposition, item_durability, item_param
	 from TB_ITEM with(readuncommitted) where CHARACTER_IDX=@CharacterIdx and item_position >= @StartPos and item_position <  @EndPos order by item_position
	return
end
GO
/****** Object:  StoredProcedure [dbo].[RP_PyogukItemInsert]    Script Date: 07/30/2013 14:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE      proc [dbo].[RP_PyogukItemInsert]
(
		@pyoguk_idx	int
	,	@item_idx	int
	,	@item_dur	int
	,	@item_position	int

	,	@Option_idx	int
	,	@Strength	int
	,	@Dexterity	int
	,	@Vitality	int
	,	@Intelligence	int
	,	@Wisdom	int
	,	@Life		int
	,	@Mana		int
	,	@FireAttrRegist	int
	,	@WaterAttrRegist	int
	,	@TreeAttrRegist	int
	,	@GoldAttrRegist	int
	,	@EarthAttrRegist	int
	,	@PhyAttack	int
	,	@Critical		int
	,	@FireAttrAttack	int
	,	@WaterAttrAttack	int
	,	@TreeAttrAttack	int
	,	@GoldAttrAttack	int
	,	@EarthAttrAttack	int
	,	@PhyDefense	int
)
as
	set nocount on
	set xact_abort on

	declare @item_dbidx	int
	declare @option_dbidx	int

	insert TB_ITEM
		(
		CHARACTER_IDX, ITEM_IDX, ITEM_DURABILITY, ITEM_POSITION, ITEM_QPOSITION, ITEM_PYOGUKIDX, item_munpaidx )
	values
		(
		0, @item_idx, @item_dur, @item_position, 0, @pyoguk_idx, 0 )

	select @item_dbidx = @@identity


	if( @Option_idx != 0 )
	begin

		insert tb_Item_option
			(
				ITEM_DBIDX, 
				Strength, 
				Dexterity,
				Vitality,
				Intelligence,
				Wisdom,
				Life,
				Mana,
				FireAttrRegist,
				WaterAttrRegist,
				TreeAttrRegist,
				GoldAttrRegist,
				EarthAttrRegist,
				PhyAttack,
				Critical,
				FireAttrAttack,
				WaterAttrAttack,
				TreeAttrAttack,
				GoldAttrAttack,
				EarthAttrAttack,
				PhyDefense
			)
			values
			(
				@item_dbidx, 
				@Strength, 
				@Dexterity,
				@Vitality,
				@Intelligence,
				@Wisdom,
				@Life,
				@Mana,
				@FireAttrRegist,
				@WaterAttrRegist,
				@TreeAttrRegist,
				@GoldAttrRegist,
				@EarthAttrRegist,
				@PhyAttack,
				@Critical,
				@FireAttrAttack,
				@WaterAttrAttack,
				@TreeAttrAttack,
				@GoldAttrAttack,
				@EarthAttrAttack,
				@PhyDefense
			)

		select @option_dbidx = @@identity
		update tb_item set ITEM_DURABILITY = @option_dbidx where item_dbidx = @item_dbidx

	end

	select * from tb_item with(nolock) where item_dbidx = @item_dbidx
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_MugongToInventory]    Script Date: 07/30/2013 14:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    proc [dbo].[MP_CHARACTER_MugongToInventory]
(
	@CHARACTER_IDX	int
,	@ITEM_IDX			int
,	@ITEM_POSITION		int
,	@ITEM_DURABILITY	int
)
as
	set nocount on
	set xact_abort on



	insert TB_ITEM(CHARACTER_IDX, ITEM_IDX, ITEM_POSITION, ITEM_DURABILITY)
		values(@CHARACTER_IDX, @ITEM_IDX, @ITEM_POSITION, @ITEM_DURABILITY)

	select * from TB_ITEM where ITEM_DBIDX = @@identity
	return
GO
/****** Object:  StoredProcedure [dbo].[MP_PETINVEN_ItemInfo]    Script Date: 07/30/2013 14:54:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE   PROC [dbo].[MP_PETINVEN_ItemInfo]
(
	@CharacterIdx	int,
	@StartPos	int,
	@EndPos	int
)
AS
	set nocount on

	if exists ( select count(*) from TB_ITEM with(readuncommitted) where CHARACTER_IDX = @CharacterIdx and ITEM_POSITION >= @StartPos and ITEM_POSITION < @EndPos )
	begin
		select * from TB_ITEM with(readuncommitted) where CHARACTER_IDX = @CharacterIdx  and ITEM_POSITION >= @StartPos and ITEM_POSITION < @EndPos
	end
	else
	begin
		select 0
	end
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_MugongWear]    Script Date: 07/30/2013 14:52:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     proc [dbo].[MP_CHARACTER_MugongWear]
(
	@CHARACTER_IDX	int
,	@item_DBIdx			int
,	@MUGONG_IDX		int
,	@mugong_position	int
, 	@mugong_wear		bit
)
as
	set nocount on
	set xact_abort on

	declare @Maxmugong_dbidx int

	update tb_item set character_idx = 0 where @item_dbidx = item_dbidx
	insert tb_mugong(CHARACTER_IDX,MUGONG_IDX, MUGONG_EXPPOINT,
		 MUGONG_SUNG, MUGONG_POSITION, MUGONG_QPOSITION, MUGONG_WEAR)
		values(@character_idx, @mugong_idx, 0, 0, @mugong_position, 0, @mugong_wear)

	select @Maxmugong_dbidx = @@identity
	select  * from tb_mugong where mugong_dbidx = @Maxmugong_dbidx
GO
/****** Object:  StoredProcedure [dbo].[TP_ChangeWareItemPosition]    Script Date: 07/30/2013 14:55:01 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[TP_ChangeWareItemPosition]
(
		@UserIdx	int
	,	@ItemDBIdx	int
	,	@ItemPos	int
)
as
	set nocount on

	update tb_item set item_position = @ItemPos where item_pyogukidx = @UserIdx and Item_DBIdx = @ItemDBIdx
GO
/****** Object:  StoredProcedure [dbo].[TP_ChangeItemPosition]    Script Date: 07/30/2013 14:55:00 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[TP_ChangeItemPosition]
(
		@ChrIdx		int
	,	@ItemDBIdx	int
	,	@ItemPos	int
)
as
	set nocount on

	update tb_item set item_position = @ItemPos where character_idx = @ChrIdx and Item_DBIdx = @ItemDBIdx
GO
/****** Object:  StoredProcedure [dbo].[MP_ITEM_Insert]    Script Date: 07/30/2013 14:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080820 LUJ, 획득 시 쿨타임을 가진 아이템 처리 추가
*/
 CREATE   proc [dbo].[MP_ITEM_Insert]			-- 아이템 추가 프로시저
	(
		@CHARACTER_IDX 	int			-- 캐릭터 인덱스 변수 선언
	,	@ITEM_IDX		int			-- 아이템 인덱스 변수 선언
	,	@ITEM_DURABILITY	int			-- 내구성 ( 현재 중복 개수로 사용 ) 변수 선언
	,	@ITEM_POSITION		int			-- 인벤토리 상의 아이템 위치 변수 선언
	-- 071126 KTH
	,	@ITEM_SEAL		int
	,	@ITEM_PARAM 		int=0			-- 아이템 parameter 변수 선언 및 0세팅
	-- 080820 LUJ,
	,	@ITEM_REMAINTIME	int=0
	)
	
	as

	Set Nocount on
--	Set Xact_Abort on

	declare @ITEM_DBIDX int					-- 아이템 Database 변수 선언
	
	insert TB_ITEM						-- 추가 대상 테이블을 설정한다
	(
		CHARACTER_IDX					-- 캐릭터 인덱스
	, 	ITEM_IDX					-- 아이템 인덱스
	, 	ITEM_DURABILITY					-- 내구성 ( 현재 중복 개수로 사용 ) 
	, 	ITEM_POSITION					-- 인벤토리 상의 아이템 위치
	, 	ITEM_QPOSITION					-- 퀵 슬롯 상의 아이템 위치
	, 	ITEM_PYOGUKIDX					-- 표국 인덱스
	, 	item_munpaidx					-- 문파 인덱스
	,	ITEM_PARAM					-- 아이템 parameter
	-- 071126 KTH
	,	ITEM_SEAL					-- 봉인상태
	--080820 LUJ, 획득 시 쿨타임을 가진 아이템 처리 추가
	,	ITEM_REMAINTIME				-- 남은 시간
	)
	values							-- 추가 값을 열거
	(
		@CHARACTER_IDX				-- 캐릭터 인덱스
	, 	@ITEM_IDX					-- 아이템 인덱스
	, 	@ITEM_DURABILITY				-- 내구성( 현재 중복 개수로 사용 )
	, 	@ITEM_POSITION					-- 인벤토리 상의 아이템 위치
	, 	0						-- 퀵 슬롯 상의 아이템 위치
	, 	0						-- 표국 인덱스
	, 	0						-- 문파 인덱스
	,	@ITEM_PARAM					-- 아이템 parameter
	-- 071126 KTH
	,	@ITEM_SEAL					-- 봉인 상태
	--080820 LUJ, 획득 시 쿨타임을 가진 아이템 처리 추가
	,	@ITEM_REMAINTIME				-- 남은 시간
	)

	select @ITEM_DBIDX = @@identity				-- 방금 추가 된 행의 Database 인덱스를 선택한다

	select 							-- 선택 할 열 종류를 열거한다
		CHARACTER_IDX					-- 캐릭터 인덱스
	,	ITEM_DBIDX					-- 아이템 Database 인덱스
	,	ITEM_IDX					-- 아이템 인덱스
	,	ITEM_POSITION					-- 인벤토리 상의 아이템 위치 
	,	ITEM_QPOSITION					-- 퀵 슬롯 상의 아이템 위치
	,	ITEM_DURABILITY					-- 내구성 ( 현재 중복 개수로 사용 )
	,	ITEM_PARAM 					-- 아이템 parameter
	-- 071126 KTH
	,	ITEM_SEAL					-- 봉인 상태
	--080820 LUJ, 획득 시 쿨타임을 가진 아이템 처리 추가
	,	ITEM_REMAINTIME				-- 남은 시간

	from TB_ITEM with(nolock) 				-- 대상 테이블을 선택한다

	where ITEM_DBIDX = @ITEM_DBIDX				-- 조건을 방금 처리 된 행으로 세팅한다
	
	return
GO
/****** Object:  StoredProcedure [dbo].[TP_ITEM_REMAIN_TIME_UPDATE]    Script Date: 07/30/2013 14:55:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071210 웅주, 아이템 사용 가능 시간을 수정하는 프로시저 생성
*/
CREATE PROCEDURE [dbo].[TP_ITEM_REMAIN_TIME_UPDATE]
(
	@ITEM_DBIDX	INT,
	@SECOND		INT
)
AS
	SET NOCOUNT ON
	
	DECLARE @UPDATE_TIME DATETIME
	
	UPDATE	TB_ITEM
	SET		ITEM_REMAINTIME = ITEM_REMAINTIME + @SECOND
	WHERE   (ITEM_DBIDX = @ITEM_DBIDX)
	
	IF 0 < @@ROWCOUNT
	BEGIN
		SELECT	ITEM_DBIDX, ITEM_REMAINTIME
		FROM    TB_ITEM
		WHERE	ITEM_DBIDX = @ITEM_DBIDX
	END
	
	SELECT 0
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_ITEM_CombineUpdate]    Script Date: 07/30/2013 14:53:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[MP_ITEM_CombineUpdate]
(
		@FromIdx	int
	,	@FromDur	int
	,	@ToIdx		int
	,	@ToDur		int
)

as

	Set Nocount on
	Set Xact_Abort on

update TB_ITEM set ITEM_DURABILITY = @ToDur where  ITEM_DBIDX = @ToIdx


if ( @FromDur = 0 )
	begin
		delete TB_ITEM  where  ITEM_DBIDX = @FromIdx
	end
else
	begin
		update TB_ITEM set ITEM_DURABILITY = @FromDur where  ITEM_DBIDX = @FromIdx
	end
GO
/****** Object:  StoredProcedure [dbo].[MP_ITEM_Delete]    Script Date: 07/30/2013 14:53:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080125 웅주, 아이템 삭제 시 옵션도 지우도록 함
*/
CREATE PROC [dbo].[MP_ITEM_Delete]
(
	@ITEM_DBIDX	INT
)
AS
	SET NOCOUNT ON
--	SET XACT_ABORT ON

	DELETE TB_ITEM				WHERE ITEM_DBIDX = @ITEM_DBIDX	
	DELETE TB_ITEM_OPTION2		WHERE ITEM_DBIDX = @ITEM_DBIDX
	DELETE TB_ITEM_DROP_OPTION	WHERE ITEM_DBIDX = @ITEM_DBIDX

	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_ITEM_INSERT]    Script Date: 07/30/2013 14:55:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080303 LUJ, 복구툴로 아이템을 추가한다
*/
CREATE PROCEDURE [dbo].[TP_ITEM_INSERT]
(
	@CHAR_IDX			INT,
	@ITEM_IDX			INT,
	@ITEM_POSITION		INT,
	@ITEM_DURABILITY	INT,
	@ITEM_PYOGUKIDX		INT,
	@ITEM_SHOPIDX		INT,
	@ITEM_SEAL			TINYINT,
	@TYPE				INT
)
AS
	SET NOCOUNT ON
	
	INSERT INTO TB_ITEM
	(
		CHARACTER_IDX,
		ITEM_IDX,
		ITEM_POSITION,
		ITEM_DURABILITY,
		ITEM_PYOGUKIDX,
		ITEM_SHOPIDX,
		ITEM_SEAL		
	)
	VALUES
	(
		@CHAR_IDX,
		@ITEM_IDX,
		@ITEM_POSITION,
		@ITEM_DURABILITY,
		@ITEM_PYOGUKIDX,
		@ITEM_SHOPIDX,
		@ITEM_SEAL		
	)
	
	SELECT	CHARACTER_IDX,
			ITEM_DBIDX,
			ITEM_IDX,
			ITEM_POSITION,
			ITEM_DURABILITY,
			ITEM_SEAL,
			@TYPE
	FROM	TB_ITEM
	WHERE	ITEM_DBIDX = @@IDENTITY;
						
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_ITEM_END_TIME_UPDATE]    Script Date: 07/30/2013 14:55:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071210 웅주, 아이템 사용 종료 시간을 수정하는 프로시저 생성
080115 웅주, 무조건 0을 반환하던 문제 수정
*/
CREATE PROCEDURE [dbo].[TP_ITEM_END_TIME_UPDATE]
(
	@ITEM_DBIDX	INT,
	@SECOND		INT
)
AS
	SET NOCOUNT ON
	
	DECLARE @UPDATE_TIME DATETIME
	
	UPDATE	TB_ITEM
	SET		ITEM_ENDTIME = DATEADD( SECOND, @SECOND, GETDATE() )
	WHERE   (ITEM_DBIDX = @ITEM_DBIDX)
	
	IF 0 < @@ROWCOUNT
	BEGIN
		SELECT	ITEM_DBIDX, DATEDIFF( SECOND, GETDATE(), ITEM_ENDTIME )
		FROM    TB_ITEM
		WHERE	ITEM_DBIDX = @ITEM_DBIDX
	END
	ELSE
	BEGIN
		SELECT 0
	END	
	
	RETURN 


select *
from tb_item
where item_dbidx = 24028006
GO
/****** Object:  StoredProcedure [dbo].[MP_ITEM_MIX_WITH_OPTION_INSERT]    Script Date: 07/30/2013 14:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
070907 웅주

옵션이 붙은 조합 아이템 정보를 DB에 갱신한다.

주의: 겹쳐지는 아이템일 때 이 쿼리를 실행할 경우 정상 동작을 보장할 수 없다...
*/
CREATE PROCEDURE [dbo].[MP_ITEM_MIX_WITH_OPTION_INSERT]
(
	@CHAR_IDX			INT,
	@ITEM_IDX			INT,
	@QUANTITY			INT,
	@POSITION			INT,
	@STRENGTH			INT,
	@INTELLIGENCE		INT,
	@DEXTERITY			INT,
	@WISDOM				INT,
	@VITALITY			INT,
	@MADEBY				VARCHAR( 16 )
)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	IF NOT EXISTS ( SELECT * FROM TB_ITEM )
	BEGIN
		RETURN
	END
	
	-- 아이템 정보 삽입
	INSERT INTO TB_ITEM
	(	CHARACTER_IDX,
		ITEM_IDX,
		ITEM_DURABILITY,
		ITEM_POSITION,
		ITEM_QPOSITION,
		ITEM_PYOGUKIDX,
		ITEM_MUNPAIDX,
		ITEM_PARAM
	)
	VALUES
	(
		@CHAR_IDX,
		@ITEM_IDX,
		@QUANTITY,
		@POSITION,
		0,
		0,
		0,
		0
	)

	DECLARE @ITEM_DBIDX INT
	SET @ITEM_DBIDX = @@IDENTITY

	INSERT INTO TB_ITEM_OPTION2
	                (
	                ITEM_DBIDX,
	                REINFORCE_STRENGTH,
	                REINFORCE_DEXTERITY,
	                REINFORCE_VITALITY,
	                REINFORCE_INTELLIGENCE,
	                REINFORCE_WISDOM,
	                REINFORCE_LIFE,
	                REINFORCE_MANA,
	                REINFORCE_LIFE_RECOVERY,
	                REINFORCE_MANA_RECOVERY,
	                REINFORCE_PHYSIC_ATTACK,
	                REINFORCE_PHYSIC_DEFENCE,
	                REINFORCE_MAGIC_ATTACK,
	                REINFORCE_MAGIC_DEFENCE,
	                REINFORCE_MOVE_SPEED,
	                REINFORCE_EVADE,
	                REINFORCE_ACCURACY,
	                REINFORCE_CRITICAL_RATE,
	                REINFORCE_CRITICAL_DAMAGE,
	                REINFORCE_MADEBY,
	                MIX_STRENGTH,
	                MIX_INTELLIGENCE,
	                MIX_DEXTERITY,
	                MIX_WISDOM,
	                MIX_VITALITY,
	                MIX_MADEBY,
	                ENCHANT_INDEX,
	                ENCHANT_LEVEL,
	                ENCHANT_MADEBY)
	VALUES   (@ITEM_DBIDX, 
					0, 0, 0, 0, 0, 0, 0, 0, 0, 
	                0, 0, 0, 0, 0, 0, 0, 0, 0, '',
	                @STRENGTH,
	                @INTELLIGENCE,
	                @DEXTERITY,
	                @WISDOM,
	                @VITALITY,
	                @MADEBY,
	                0, 0, '' )
	
	DECLARE @OPTION_DBIDX INT
	SET @OPTION_DBIDX = @@IDENTITY
	
	-- 옵션 DB인덱스를 나중에 얻으므로 잊지 말고 업데이트해주자. 그렇지 않으면 옵션을 갖지 않은 아이템이 되어버린다.
	UPDATE  TB_ITEM
	SET         ITEM_DURABILITY = @OPTION_DBIDX
	WHERE   (ITEM_DBIDX = @ITEM_DBIDX)
	
	SELECT
	@ITEM_DBIDX, @ITEM_IDX, @OPTION_DBIDX, @POSITION,
	@STRENGTH,
	@INTELLIGENCE,
	@DEXTERITY,
	@WISDOM,
	@VITALITY,
	@MADEBY
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_ITEM_INSERT_BY_WEB]    Script Date: 07/30/2013 14:53:34 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
/*
081013 LUJ, 웹을 통해 아이템을 추가할 때 쓰는 프로시저
*/
CREATE  proc [dbo].[MP_ITEM_INSERT_BY_WEB]
(
	@USER_IDX		INT,
	@ITEM_IDX		INT,
	@ITEM_QUANTITY		INT,
	@ITEM_SEAL		INT
)
as
	SET NOCOUNT ON

	INSERT	TB_ITEM (
			ITEM_IDX,
			ITEM_DURABILITY, 
			ITEM_SHOPIDX,
			ITEM_POSITION,
			ITEM_SEAL,
			CHARACTER_IDX )
	VALUES		(
			@ITEM_IDX,
			@ITEM_QUANTITY,
			@USER_IDX,
			0,
			@ITEM_SEAL,
			0 )

	RETURN @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[MP_SHOPITEM_Delete]    Script Date: 07/30/2013 14:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    proc [dbo].[MP_SHOPITEM_Delete] ( @CHARACTER_IDX int, @ITEM_DBIDX int )
as
	Set Nocount on
/*	20071121 TimeLimitItem 삭제를 위하여 아래와 같이 변경하였음. ( 임시 )
delete from TB_SHOPITEMUSEINFO
where CHARACTER_IDX = @CHARACTER_IDX and ITEM_DBIDX = @ITEM_DBIDX
*/
delete from TB_ITEM
where CHARACTER_IDX = @CHARACTER_IDX and ITEM_DBIDX = @ITEM_DBIDX
GO
/****** Object:  StoredProcedure [dbo].[MP_SHOPITEM_InvenInfo]    Script Date: 07/30/2013 14:54:23 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE   proc [dbo].[MP_SHOPITEM_InvenInfo]
(
	@CHARACTER_IDX			int	
)
as
	Set Nocount on

if not exists ( select * from TB_ITEM with(readuncommitted) where CHARACTER_IDX=@CHARACTER_IDX and item_position>=390 and item_position<410)
	begin
		select 0, @CHARACTER_IDX
	end
else
	begin 
		select character_idx, item_dbidx, item_idx, item_position, item_qposition, item_durability, item_param
			 from TB_ITEM with(readuncommitted) where CHARACTER_IDX=@CHARACTER_IDX and  item_position>=390 and item_position<410	
	end
GO
/****** Object:  StoredProcedure [dbo].[TP_GUILD_STORE_SELECT]    Script Date: 07/30/2013 14:55:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_GUILD_STORE_SELECT]
(
	@GUILD_IDX	INT
)
AS
	SET NOCOUNT ON
	
	SELECT  TOP 100
			ITEM_DBIDX,
			ITEM_IDX,
			ITEM_DURABILITY
	FROM      TB_ITEM
	WHERE   (ITEM_MUNPAIDX = @GUILD_IDX)
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_CONSIGNMENT_Search]    Script Date: 07/30/2013 14:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROC [dbo].[MP_CONSIGNMENT_Search] 
(
@CharacterIndex int,
@SortType int,
@StartPage int,
@Category1 int,
@Category2 int,
@MinLevel int,
@MaxLevel int,
@RareLevel int
)
AS 
SET  NOCOUNT  ON 

declare @TOTAL_COUNT int
declare @PER_PAGE int
declare @END_PAGE int
declare @MOD_COUNT int
declare @START_CNT int
declare @END_CNT int

select @TOTAL_COUNT = COUNT(CONSIGNMENT_IDX)
from ( select ROW_NUMBER() over(order by [CONSIGNMENT_IDX] asc) as ROWNUM,
		[CONSIGNMENT_IDX], [ITEM_NAME], [USELEVEL], [PRICE]
		from [dbo].[TB_CONSIGNMENT] with (nolock)
		where 
			[CONSIGNMENT_IDX] > 0 and
			[ENDTIME] > getdate() and 
			[CATEGORY_1]=@Category1 and
			[CATEGORY_2]=@Category2 and
			(@RareLevel=(-1) or [RARELEVEL]=@RareLevel) and
			([USELEVEL] between @MinLevel and @MaxLevel)) AS a

set @PER_PAGE = 10
set @END_PAGE = @TOTAL_COUNT / @PER_PAGE
set @MOD_COUNT = @TOTAL_COUNT % @PER_PAGE

if(@MOD_COUNT <> 0)
begin
	set @END_PAGE = @END_PAGE + 1
end

set @START_CNT = (@PER_PAGE * (@StartPage - 1)) + 1
set @END_CNT = @START_CNT + (@PER_PAGE - 1)

if (@SortType = 2) -- eConsignmentSORT_LevelAsc
begin
SELECT  S.[CONSIGNMENT_IDX],
		S.[CHARACTER_NAME],
		S.[REMAINTIME],
		0,
		S.[DEPOSIT],
		S.[COMMISSION],
		S.[PRICE],
		@StartPage,
		@END_PAGE,
		A.ITEM_DBIDX,
		A.ITEM_IDX,
        A.ITEM_DURABILITY,
        A.ITEM_PARAM,
        A.ITEM_SEAL, 
        A.ITEM_REMAINTIME,
        ISNULL( B.REINFORCE_STRENGTH, 0 ),
        ISNULL( B.REINFORCE_DEXTERITY, 0 ), 
        ISNULL( B.REINFORCE_VITALITY, 0 ),
        ISNULL( B.REINFORCE_INTELLIGENCE, 0 ), 
        ISNULL( B.REINFORCE_WISDOM, 0 ),
        ISNULL( B.REINFORCE_LIFE, 0 ),
        ISNULL( B.REINFORCE_MANA, 0 ), 
        ISNULL( B.REINFORCE_LIFE_RECOVERY, 0 ),
        ISNULL( B.REINFORCE_MANA_RECOVERY, 0 ), 
        ISNULL( B.REINFORCE_PHYSIC_ATTACK, 0 ),
        ISNULL( B.REINFORCE_PHYSIC_DEFENCE, 0 ), 
        ISNULL( B.REINFORCE_MAGIC_ATTACK, 0 ),
        ISNULL( B.REINFORCE_MAGIC_DEFENCE, 0 ), 
        ISNULL( B.REINFORCE_MOVE_SPEED, 0 ),
        ISNULL( B.REINFORCE_EVADE, 0 ), 
        ISNULL( B.REINFORCE_ACCURACY, 0 ),
        ISNULL( B.REINFORCE_CRITICAL_RATE, 0 ), 
        ISNULL( B.REINFORCE_CRITICAL_DAMAGE, 0 ),
        ISNULL( B.REINFORCE_MADEBY, '' ),
        ISNULL( B.MIX_STRENGTH, 0 ), 
        ISNULL( B.MIX_INTELLIGENCE, 0 ),
        ISNULL( B.MIX_DEXTERITY, 0 ),
        ISNULL( B.MIX_WISDOM, 0 ),
        ISNULL( B.MIX_VITALITY, 0 ), 
        ISNULL( B.MIX_MADEBY, '' ),
        ISNULL( B.ENCHANT_INDEX, 0 ),
        ISNULL( B.ENCHANT_LEVEL, 0 ), 
        ISNULL( B.ENCHANT_MADEBY, '' ),
		ISNULL( C.KEY1, 0 ),
        CAST( ROUND( ISNULL( C.VALUE1, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY2, 0 ),
        CAST( ROUND( ISNULL( C.VALUE2, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY3, 0 ),
        CAST( ROUND( ISNULL( C.VALUE3, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY4, 0 ),
        CAST( ROUND( ISNULL( C.VALUE4, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY5, 0 ),
        CAST( ROUND( ISNULL( C.VALUE5, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
		@TOTAL_COUNT,
		ISNULL(D.AVERAGE_PRICE, 0)
FROM	(
		select [CONSIGNMENT_IDX],
				[ITEM_DBIDX],
				[ITEM_INDEX],
				[CHARACTER_IDX],
				[CHARACTER_NAME],
				[CATEGORY_1],
				[CATEGORY_2],
				[RARELEVEL],
				[USELEVEL],
				[ENCHANT],
				datediff(minute, getdate(), [ENDTIME]) as [REMAINTIME],
				[INIT_DURABILITY],
				[DEPOSIT],
				[COMMISSION],
				[PRICE]
		from ( select ROW_NUMBER() over(order by [USELEVEL] asc) as ROWNUM,
				*
				from [dbo].[TB_CONSIGNMENT] with (nolock)
				where 
					[CONSIGNMENT_IDX] > 0 and
					[ENDTIME] > getdate() and
					[CATEGORY_1]=@Category1 and
					[CATEGORY_2]=@Category2 and
					(@RareLevel=(-1) or [RARELEVEL]=@RareLevel) and
					([USELEVEL] between @MinLevel and @MaxLevel)) AS TEMP
		where ROWNUM between @START_CNT and @END_CNT
		) AS S LEFT OUTER JOIN
		TB_ITEM A ON
		S.ITEM_DBIDX = A.ITEM_DBIDX LEFT OUTER JOIN
		TB_ITEM_DROP_OPTION C  ON 
		S.ITEM_DBIDX = C.ITEM_DBIDX LEFT OUTER JOIN
        TB_ITEM_OPTION2 B  ON
		S.ITEM_DBIDX = B.ITEM_DBIDX LEFT OUTER JOIN
		TB_CONSIGNMENT_AVERAGE D ON
		S.ITEM_INDEX = D.ITEM_INDEX and S.ENCHANT = D.ENCHANT
order by S.[USELEVEL] asc
end

else if (@SortType = 3) -- eConsignmentSORT_LevelDesc
begin
SELECT  S.[CONSIGNMENT_IDX],
		S.[CHARACTER_NAME],
		S.[REMAINTIME],
		0,
		S.[DEPOSIT],
		S.[COMMISSION],
		S.[PRICE],
		@StartPage,
		@END_PAGE,
		A.ITEM_DBIDX,
		A.ITEM_IDX,
        A.ITEM_DURABILITY,
        A.ITEM_PARAM,
        A.ITEM_SEAL, 
        A.ITEM_REMAINTIME,
        ISNULL( B.REINFORCE_STRENGTH, 0 ),
        ISNULL( B.REINFORCE_DEXTERITY, 0 ), 
        ISNULL( B.REINFORCE_VITALITY, 0 ),
        ISNULL( B.REINFORCE_INTELLIGENCE, 0 ), 
        ISNULL( B.REINFORCE_WISDOM, 0 ),
        ISNULL( B.REINFORCE_LIFE, 0 ),
        ISNULL( B.REINFORCE_MANA, 0 ), 
        ISNULL( B.REINFORCE_LIFE_RECOVERY, 0 ),
        ISNULL( B.REINFORCE_MANA_RECOVERY, 0 ), 
        ISNULL( B.REINFORCE_PHYSIC_ATTACK, 0 ),
        ISNULL( B.REINFORCE_PHYSIC_DEFENCE, 0 ), 
        ISNULL( B.REINFORCE_MAGIC_ATTACK, 0 ),
        ISNULL( B.REINFORCE_MAGIC_DEFENCE, 0 ), 
        ISNULL( B.REINFORCE_MOVE_SPEED, 0 ),
        ISNULL( B.REINFORCE_EVADE, 0 ), 
        ISNULL( B.REINFORCE_ACCURACY, 0 ),
        ISNULL( B.REINFORCE_CRITICAL_RATE, 0 ), 
        ISNULL( B.REINFORCE_CRITICAL_DAMAGE, 0 ),
        ISNULL( B.REINFORCE_MADEBY, '' ),
        ISNULL( B.MIX_STRENGTH, 0 ), 
        ISNULL( B.MIX_INTELLIGENCE, 0 ),
        ISNULL( B.MIX_DEXTERITY, 0 ),
        ISNULL( B.MIX_WISDOM, 0 ),
        ISNULL( B.MIX_VITALITY, 0 ), 
        ISNULL( B.MIX_MADEBY, '' ),
        ISNULL( B.ENCHANT_INDEX, 0 ),
        ISNULL( B.ENCHANT_LEVEL, 0 ), 
        ISNULL( B.ENCHANT_MADEBY, '' ),
		ISNULL( C.KEY1, 0 ),
        CAST( ROUND( ISNULL( C.VALUE1, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY2, 0 ),
        CAST( ROUND( ISNULL( C.VALUE2, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY3, 0 ),
        CAST( ROUND( ISNULL( C.VALUE3, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY4, 0 ),
        CAST( ROUND( ISNULL( C.VALUE4, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY5, 0 ),
        CAST( ROUND( ISNULL( C.VALUE5, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
		@TOTAL_COUNT,
		ISNULL(D.AVERAGE_PRICE, 0)
FROM	(
		select [CONSIGNMENT_IDX],
				[ITEM_DBIDX],
				[ITEM_INDEX],
				[CHARACTER_IDX],
				[CHARACTER_NAME],
				[CATEGORY_1],
				[CATEGORY_2],
				[RARELEVEL],
				[USELEVEL],
				[ENCHANT],
				datediff(minute, getdate(), [ENDTIME]) as [REMAINTIME],
				[INIT_DURABILITY],
				[DEPOSIT],
				[COMMISSION],
				[PRICE]
		from ( select ROW_NUMBER() over(order by [USELEVEL] desc) as ROWNUM,
				*
				from [dbo].[TB_CONSIGNMENT] with (nolock)
				where 
					[CONSIGNMENT_IDX] > 0 and
					[ENDTIME] > getdate() and
					[CATEGORY_1]=@Category1 and
					[CATEGORY_2]=@Category2 and
					(@RareLevel=(-1) or [RARELEVEL]=@RareLevel) and
					([USELEVEL] between @MinLevel and @MaxLevel)) AS TEMP
		where ROWNUM between @START_CNT and @END_CNT
		) AS S LEFT OUTER JOIN
		TB_ITEM A ON
		S.ITEM_DBIDX = A.ITEM_DBIDX LEFT OUTER JOIN
		TB_ITEM_DROP_OPTION C  ON 
		S.ITEM_DBIDX = C.ITEM_DBIDX LEFT OUTER JOIN
        TB_ITEM_OPTION2 B  ON
		S.ITEM_DBIDX = B.ITEM_DBIDX LEFT OUTER JOIN
		TB_CONSIGNMENT_AVERAGE D ON
		S.ITEM_INDEX = D.ITEM_INDEX and S.ENCHANT = D.ENCHANT
order by S.[USELEVEL] desc
end

else if (@SortType = 4) -- eConsignmentSORT_PriceAsc
begin
SELECT  S.[CONSIGNMENT_IDX],
		S.[CHARACTER_NAME],
		S.[REMAINTIME],
		0,
		S.[DEPOSIT],
		S.[COMMISSION],
		S.[PRICE],
		@StartPage,
		@END_PAGE,
		A.ITEM_DBIDX,
		A.ITEM_IDX,
        A.ITEM_DURABILITY,
        A.ITEM_PARAM,
        A.ITEM_SEAL, 
        A.ITEM_REMAINTIME,
        ISNULL( B.REINFORCE_STRENGTH, 0 ),
        ISNULL( B.REINFORCE_DEXTERITY, 0 ), 
        ISNULL( B.REINFORCE_VITALITY, 0 ),
        ISNULL( B.REINFORCE_INTELLIGENCE, 0 ), 
        ISNULL( B.REINFORCE_WISDOM, 0 ),
        ISNULL( B.REINFORCE_LIFE, 0 ),
        ISNULL( B.REINFORCE_MANA, 0 ), 
        ISNULL( B.REINFORCE_LIFE_RECOVERY, 0 ),
        ISNULL( B.REINFORCE_MANA_RECOVERY, 0 ), 
        ISNULL( B.REINFORCE_PHYSIC_ATTACK, 0 ),
        ISNULL( B.REINFORCE_PHYSIC_DEFENCE, 0 ), 
        ISNULL( B.REINFORCE_MAGIC_ATTACK, 0 ),
        ISNULL( B.REINFORCE_MAGIC_DEFENCE, 0 ), 
        ISNULL( B.REINFORCE_MOVE_SPEED, 0 ),
        ISNULL( B.REINFORCE_EVADE, 0 ), 
        ISNULL( B.REINFORCE_ACCURACY, 0 ),
        ISNULL( B.REINFORCE_CRITICAL_RATE, 0 ), 
        ISNULL( B.REINFORCE_CRITICAL_DAMAGE, 0 ),
        ISNULL( B.REINFORCE_MADEBY, '' ),
        ISNULL( B.MIX_STRENGTH, 0 ), 
        ISNULL( B.MIX_INTELLIGENCE, 0 ),
        ISNULL( B.MIX_DEXTERITY, 0 ),
        ISNULL( B.MIX_WISDOM, 0 ),
        ISNULL( B.MIX_VITALITY, 0 ), 
        ISNULL( B.MIX_MADEBY, '' ),
        ISNULL( B.ENCHANT_INDEX, 0 ),
        ISNULL( B.ENCHANT_LEVEL, 0 ), 
        ISNULL( B.ENCHANT_MADEBY, '' ),
		ISNULL( C.KEY1, 0 ),
        CAST( ROUND( ISNULL( C.VALUE1, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY2, 0 ),
        CAST( ROUND( ISNULL( C.VALUE2, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY3, 0 ),
        CAST( ROUND( ISNULL( C.VALUE3, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY4, 0 ),
        CAST( ROUND( ISNULL( C.VALUE4, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY5, 0 ),
        CAST( ROUND( ISNULL( C.VALUE5, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
		@TOTAL_COUNT,
		ISNULL(D.AVERAGE_PRICE, 0)
FROM	(
		select [CONSIGNMENT_IDX],
				[ITEM_DBIDX],
				[ITEM_INDEX],
				[CHARACTER_IDX],
				[CHARACTER_NAME],
				[CATEGORY_1],
				[CATEGORY_2],
				[RARELEVEL],
				[USELEVEL],
				[ENCHANT],
				datediff(minute, getdate(), [ENDTIME]) as [REMAINTIME],
				[INIT_DURABILITY],
				[DEPOSIT],
				[COMMISSION],
				[PRICE]
		from ( select ROW_NUMBER() over(order by [PRICE] asc) as ROWNUM,
				*
				from [dbo].[TB_CONSIGNMENT] with (nolock)
				where 
					[CONSIGNMENT_IDX] > 0 and
					[ENDTIME] > getdate() and
					[CATEGORY_1]=@Category1 and
					[CATEGORY_2]=@Category2 and
					(@RareLevel=(-1) or [RARELEVEL]=@RareLevel) and
					([USELEVEL] between @MinLevel and @MaxLevel)) AS TEMP
		where ROWNUM between @START_CNT and @END_CNT
		) AS S LEFT OUTER JOIN
		TB_ITEM A ON
		S.ITEM_DBIDX = A.ITEM_DBIDX LEFT OUTER JOIN
		TB_ITEM_DROP_OPTION C  ON 
		S.ITEM_DBIDX = C.ITEM_DBIDX LEFT OUTER JOIN
        TB_ITEM_OPTION2 B  ON
		S.ITEM_DBIDX = B.ITEM_DBIDX LEFT OUTER JOIN
		TB_CONSIGNMENT_AVERAGE D ON
		S.ITEM_INDEX = D.ITEM_INDEX and S.ENCHANT = D.ENCHANT
order by S.[PRICE] asc
end

else if (@SortType = 5) -- eConsignmentSORT_PriceDesc
begin
SELECT  S.[CONSIGNMENT_IDX],
		S.[CHARACTER_NAME],
		S.[REMAINTIME],
		0,
		S.[DEPOSIT],
		S.[COMMISSION],
		S.[PRICE],
		@StartPage,
		@END_PAGE,
		A.ITEM_DBIDX,
		A.ITEM_IDX,
        A.ITEM_DURABILITY,
        A.ITEM_PARAM,
        A.ITEM_SEAL, 
        A.ITEM_REMAINTIME,
        ISNULL( B.REINFORCE_STRENGTH, 0 ),
        ISNULL( B.REINFORCE_DEXTERITY, 0 ), 
        ISNULL( B.REINFORCE_VITALITY, 0 ),
        ISNULL( B.REINFORCE_INTELLIGENCE, 0 ), 
        ISNULL( B.REINFORCE_WISDOM, 0 ),
        ISNULL( B.REINFORCE_LIFE, 0 ),
        ISNULL( B.REINFORCE_MANA, 0 ), 
        ISNULL( B.REINFORCE_LIFE_RECOVERY, 0 ),
        ISNULL( B.REINFORCE_MANA_RECOVERY, 0 ), 
        ISNULL( B.REINFORCE_PHYSIC_ATTACK, 0 ),
        ISNULL( B.REINFORCE_PHYSIC_DEFENCE, 0 ), 
        ISNULL( B.REINFORCE_MAGIC_ATTACK, 0 ),
        ISNULL( B.REINFORCE_MAGIC_DEFENCE, 0 ), 
        ISNULL( B.REINFORCE_MOVE_SPEED, 0 ),
        ISNULL( B.REINFORCE_EVADE, 0 ), 
        ISNULL( B.REINFORCE_ACCURACY, 0 ),
        ISNULL( B.REINFORCE_CRITICAL_RATE, 0 ), 
        ISNULL( B.REINFORCE_CRITICAL_DAMAGE, 0 ),
        ISNULL( B.REINFORCE_MADEBY, '' ),
        ISNULL( B.MIX_STRENGTH, 0 ), 
        ISNULL( B.MIX_INTELLIGENCE, 0 ),
        ISNULL( B.MIX_DEXTERITY, 0 ),
        ISNULL( B.MIX_WISDOM, 0 ),
        ISNULL( B.MIX_VITALITY, 0 ), 
        ISNULL( B.MIX_MADEBY, '' ),
        ISNULL( B.ENCHANT_INDEX, 0 ),
        ISNULL( B.ENCHANT_LEVEL, 0 ), 
        ISNULL( B.ENCHANT_MADEBY, '' ),
		ISNULL( C.KEY1, 0 ),
        CAST( ROUND( ISNULL( C.VALUE1, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY2, 0 ),
        CAST( ROUND( ISNULL( C.VALUE2, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY3, 0 ),
        CAST( ROUND( ISNULL( C.VALUE3, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY4, 0 ),
        CAST( ROUND( ISNULL( C.VALUE4, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY5, 0 ),
        CAST( ROUND( ISNULL( C.VALUE5, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
		@TOTAL_COUNT,
		ISNULL(D.AVERAGE_PRICE, 0)
FROM	(
		select [CONSIGNMENT_IDX],
				[ITEM_DBIDX],
				[ITEM_INDEX],
				[CHARACTER_IDX],
				[CHARACTER_NAME],
				[CATEGORY_1],
				[CATEGORY_2],
				[RARELEVEL],
				[USELEVEL],
				[ENCHANT],
				datediff(minute, getdate(), [ENDTIME]) as [REMAINTIME],
				[INIT_DURABILITY],
				[DEPOSIT],
				[COMMISSION],
				[PRICE]
		from ( select ROW_NUMBER() over(order by [PRICE] desc) as ROWNUM,
				*
				from [dbo].[TB_CONSIGNMENT] with (nolock)
				where 
					[CONSIGNMENT_IDX] > 0 and
					[ENDTIME] > getdate() and
					[CATEGORY_1]=@Category1 and
					[CATEGORY_2]=@Category2 and
					(@RareLevel=(-1) or [RARELEVEL]=@RareLevel) and
					([USELEVEL] between @MinLevel and @MaxLevel)) AS TEMP
		where ROWNUM between @START_CNT and @END_CNT
		) AS S LEFT OUTER JOIN
		TB_ITEM A ON
		S.ITEM_DBIDX = A.ITEM_DBIDX LEFT OUTER JOIN
		TB_ITEM_DROP_OPTION C  ON 
		S.ITEM_DBIDX = C.ITEM_DBIDX LEFT OUTER JOIN
        TB_ITEM_OPTION2 B  ON
		S.ITEM_DBIDX = B.ITEM_DBIDX LEFT OUTER JOIN
		TB_CONSIGNMENT_AVERAGE D ON
		S.ITEM_INDEX = D.ITEM_INDEX and S.ENCHANT = D.ENCHANT
order by S.[PRICE] desc
end




-----------------------
-- ?衙渠? 薑溺 綠薑鼻 (檣策蝶)
-----------------------
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[MP_CONSIGNMENT_Insert]    Script Date: 07/30/2013 14:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROC [dbo].[MP_CONSIGNMENT_Insert] 
(
	@PlayerIndex int,
	@ItemDBIndex int,
	@ItemIndex int,
	@CharacterName varchar(16),
	@ItemName varchar(32),
	@Category_1 int,
	@Category_2 int,
	@RareLevel tinyint,
	@UseLevel int,
	@Enchant tinyint,
	@Deposit int,
	@Commission int,
	@Price bigint,
	@FromPos int,
	@Stack int
) 
AS 
SET  NOCOUNT  ON 

declare @ErrorIndex int
declare @CharacterIdx int
declare @Durability int
declare @ConsignmentIdx int
declare @InitDurability int

set @ErrorIndex = 0
set @CharacterIdx = 0

if (select count(*) from [dbo].[TB_CONSIGNMENT] where [ITEM_DBIDX] = @ItemDBIndex) > 0
begin
	set @ErrorIndex = -1
	select @ErrorIndex, @ItemDBIndex, @ItemIndex, @Deposit, @FromPos
	return
end

select	@CharacterIdx = [CHARACTER_IDX],
		@Durability = [ITEM_DURABILITY]
from [dbo].[TB_ITEM] with (nolock)
where [ITEM_DBIDX] = @ItemDBIndex

if(@CharacterIdx <> @PlayerIndex)
begin
	set @ErrorIndex = -1
	select @ErrorIndex, @ItemDBIndex, @ItemIndex, @Deposit, @FromPos
	return
end

if(@Stack = 0)
	begin
	set @InitDurability = 0
	end
else
	begin
	set @InitDurability = @Durability
	end


-- 蛔煙脹 熱? 褻? - 10偃檜鼻 蛔煙?陛
if (select count(*) from [dbo].[TB_CONSIGNMENT] where [CHARACTER_IDX] = @CharacterIdx) >= 10
begin
	set @ErrorIndex = -4 --eConsignmentDBResult_RegistedOver
	select @ErrorIndex, @ItemDBIndex, @ItemIndex, 0, 0
	return
end

INSERT [dbo].[TB_CONSIGNMENT]
	([ITEM_DBIDX],
	[ITEM_INDEX],
	[CHARACTER_IDX],
	[CHARACTER_NAME],
	[ITEM_NAME],
	[CATEGORY_1],
	[CATEGORY_2],
	[RARELEVEL],
	[USELEVEL],
	[ENCHANT],
	[REGISTTIME],
	[ENDTIME],
	[INIT_DURABILITY],
	[DEPOSIT],
	[COMMISSION],
	[PRICE] )
values
	( @ItemDBIndex,
	@ItemIndex,
	@PlayerIndex,
	@CharacterName,
	@ItemName,
	@Category_1,
	@Category_2,
	@RareLevel,
	@UseLevel,
	@Enchant,
	getdate(),
	dateadd(hour, 24*7, getdate()),
	@InitDurability,
	@Deposit,
	@Commission,
	@Price )

if @@error<>0 or @@rowcount<>1
	begin
	select -1, @ItemDBIndex, @ItemIndex, @Deposit, @FromPos
	return
	end

-- 億煎蛔煙? ?檜蠱曖 檣策蝶 ?橫?濠.
select @ConsignmentIdx = [CONSIGNMENT_IDX]
	from [dbo].[TB_CONSIGNMENT] with (nolock)
	where [ITEM_DBIDX] = @ItemDBIndex

if @@error<>0 or @@rowcount<>1 or @ConsignmentIdx=0
	begin
	select -1, @ItemDBIndex, @ItemIndex, @Deposit, @FromPos
	return
	end

-- TB_ITEM 曖 CHARACTER_IDX=0 ?煎 撲薑??.
update [dbo].[TB_ITEM]
	set [CHARACTER_IDX] = 0
where [ITEM_DBIDX] = @ItemDBIndex

select @ConsignmentIdx, @ItemDBIndex, @ItemIndex, @Deposit, @FromPos, @Price
return

------------------------------
-- 議葛攪? ?? ?煎衛? 熱薑
------------------------------

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[MP_CONSIGNMENT_GetList]    Script Date: 07/30/2013 14:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROC [dbo].[MP_CONSIGNMENT_GetList] 
(
@CharacterIndex int
)
AS 
SET  NOCOUNT  ON 

SELECT  S.[CONSIGNMENT_IDX],
		S.[CHARACTER_NAME],
		S.[REMAINTIME],
		--S.[SELLNUM],
		S.[INIT_DURABILITY],
		S.[DEPOSIT],
		S.[COMMISSION],
		S.[PRICE],
		0,
		0,
		A.ITEM_DBIDX,
		A.ITEM_IDX,
		--A.ITEM_POSITION, 
        --A.ITEM_QPOSITION,
        A.ITEM_DURABILITY, --S.[REMAINNUM], --A.ITEM_DURABILITY,
        A.ITEM_PARAM,
        A.ITEM_SEAL, 
        --DATEDIFF(SECOND, GETDATE(), A.ITEM_ENDTIME), 
        A.ITEM_REMAINTIME,
        ISNULL( B.REINFORCE_STRENGTH, 0 ),
        ISNULL( B.REINFORCE_DEXTERITY, 0 ), 
        ISNULL( B.REINFORCE_VITALITY, 0 ),
        ISNULL( B.REINFORCE_INTELLIGENCE, 0 ), 
        ISNULL( B.REINFORCE_WISDOM, 0 ),
        ISNULL( B.REINFORCE_LIFE, 0 ),
        ISNULL( B.REINFORCE_MANA, 0 ), 
        ISNULL( B.REINFORCE_LIFE_RECOVERY, 0 ),
        ISNULL( B.REINFORCE_MANA_RECOVERY, 0 ), 
        ISNULL( B.REINFORCE_PHYSIC_ATTACK, 0 ),
        ISNULL( B.REINFORCE_PHYSIC_DEFENCE, 0 ), 
        ISNULL( B.REINFORCE_MAGIC_ATTACK, 0 ),
        ISNULL( B.REINFORCE_MAGIC_DEFENCE, 0 ), 
        ISNULL( B.REINFORCE_MOVE_SPEED, 0 ),
        ISNULL( B.REINFORCE_EVADE, 0 ), 
        ISNULL( B.REINFORCE_ACCURACY, 0 ),
        ISNULL( B.REINFORCE_CRITICAL_RATE, 0 ), 
        ISNULL( B.REINFORCE_CRITICAL_DAMAGE, 0 ),
        ISNULL( B.REINFORCE_MADEBY, '' ),
        ISNULL( B.MIX_STRENGTH, 0 ), 
        ISNULL( B.MIX_INTELLIGENCE, 0 ),
        ISNULL( B.MIX_DEXTERITY, 0 ),
        ISNULL( B.MIX_WISDOM, 0 ),
        ISNULL( B.MIX_VITALITY, 0 ), 
        ISNULL( B.MIX_MADEBY, '' ),
        ISNULL( B.ENCHANT_INDEX, 0 ),
        ISNULL( B.ENCHANT_LEVEL, 0 ), 
        ISNULL( B.ENCHANT_MADEBY, '' ),
		ISNULL( C.KEY1, 0 ),
        CAST( ROUND( ISNULL( C.VALUE1, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY2, 0 ),
        CAST( ROUND( ISNULL( C.VALUE2, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY3, 0 ),
        CAST( ROUND( ISNULL( C.VALUE3, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY4, 0 ),
        CAST( ROUND( ISNULL( C.VALUE4, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY5, 0 ),
        CAST( ROUND( ISNULL( C.VALUE5, 0 ), 3, 3 ) AS VARCHAR( 16 ) )
FROM	(
		select [CONSIGNMENT_IDX],
				[ITEM_DBIDX],
				[ITEM_INDEX],
				[CHARACTER_IDX],
				[CHARACTER_NAME],
				[CATEGORY_1],
				[CATEGORY_2],
				[RARELEVEL],
				[USELEVEL],
				[ENCHANT],
				datediff(minute, getdate(), [ENDTIME]) as [REMAINTIME],
				[INIT_DURABILITY],
				[DEPOSIT],
				[COMMISSION],
				[PRICE]
		from ( select ROW_NUMBER() over(order by [CONSIGNMENT_IDX] asc) as ROWNUM,
				*
				from [dbo].[TB_CONSIGNMENT] with (nolock)
				where 
					[CHARACTER_IDX] = @CharacterIndex) AS TEMP
		) AS S LEFT OUTER JOIN
		TB_ITEM A ON
		S.ITEM_DBIDX = A.ITEM_DBIDX LEFT OUTER JOIN
		TB_ITEM_DROP_OPTION C  ON 
		S.ITEM_DBIDX = C.ITEM_DBIDX LEFT OUTER JOIN
        TB_ITEM_OPTION2 B  ON S.ITEM_DBIDX = B.ITEM_DBIDX




SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[TP_CharacterShopItemUseInfoDelete]    Script Date: 07/30/2013 14:55:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	proc [dbo].[TP_CharacterShopItemUseInfoDelete]
(
	@CharIdx	int,
	@ItemDBIdx	int,
	@bDelete	int	
)
as
	Set Nocount On 

	delete tb_shopitemuseinfo where character_idx = @CharIdx and item_dbidx = @ItemDBIdx

	if( @bDelete = 1 )
	begin
		delete tb_item where item_dbidx = @ItemDBIdx and character_idx = @CharIdx
	end
GO
/****** Object:  StoredProcedure [dbo].[TP_CharacterShopWareItemInfo]    Script Date: 07/30/2013 14:55:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	proc [dbo].[TP_CharacterShopWareItemInfo]
(
	@UserIdx	int	
)
as
	Set Nocount On 

	select top 90 ITEM_DBIDX, ITEM_IDX, ITEM_POSITION, ITEM_DURABILITY, ITEM_PARAM
	from TB_ITEM with(readuncommitted)
	where ITEM_SHOPIDX = @UserIdx
	order by ITEM_DBIDX
GO
/****** Object:  StoredProcedure [dbo].[MP_STORAGE_ItemInfo]    Script Date: 07/30/2013 14:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080128 웅주, 옵션을 함께 읽도록 함
090624 LUJ, 액세스가 많은 TB_ITEM을 dirty read하여 데드락 발생 여지를 최소화시킴
*/
CREATE   PROC [dbo].[MP_STORAGE_ItemInfo]
(
		@USER_IDX			INT,
		@BEGIN_ITEM_DBIDX	INT
)
AS
	SET NOCOUNT ON

	SELECT TOP 100
		0,
		A.ITEM_DBIDX,
		A.ITEM_IDX,
		A.ITEM_POSITION, 
		A.ITEM_QPOSITION,
		A.ITEM_DURABILITY,
		A.ITEM_PARAM,
		A.ITEM_SEAL,
		DATEDIFF(SECOND, GETDATE(), A.ITEM_ENDTIME), 
		A.ITEM_REMAINTIME,
		ISNULL( B.REINFORCE_STRENGTH, 0 ),
		ISNULL( B.REINFORCE_DEXTERITY, 0 ), 
		ISNULL( B.REINFORCE_VITALITY, 0 ),
		ISNULL( B.REINFORCE_INTELLIGENCE, 0 ), 
		ISNULL( B.REINFORCE_WISDOM, 0 ),
		ISNULL( B.REINFORCE_LIFE, 0 ),
		ISNULL( B.REINFORCE_MANA, 0 ), 
		ISNULL( B.REINFORCE_LIFE_RECOVERY, 0 ),
		ISNULL( B.REINFORCE_MANA_RECOVERY, 0 ), 
		ISNULL( B.REINFORCE_PHYSIC_ATTACK, 0 ),
		ISNULL( B.REINFORCE_PHYSIC_DEFENCE, 0 ), 
		ISNULL( B.REINFORCE_MAGIC_ATTACK, 0 ),
		ISNULL( B.REINFORCE_MAGIC_DEFENCE, 0 ), 
		ISNULL( B.REINFORCE_MOVE_SPEED, 0 ),
		ISNULL( B.REINFORCE_EVADE, 0 ), 
		ISNULL( B.REINFORCE_ACCURACY, 0 ),
		ISNULL( B.REINFORCE_CRITICAL_RATE, 0 ), 
		ISNULL( B.REINFORCE_CRITICAL_DAMAGE, 0 ),
		ISNULL( B.REINFORCE_MADEBY, '' ),
		ISNULL( B.MIX_STRENGTH, 0 ), 
		ISNULL( B.MIX_INTELLIGENCE, 0 ),
		ISNULL( B.MIX_DEXTERITY, 0 ),
		ISNULL( B.MIX_WISDOM, 0 ),
		ISNULL( B.MIX_VITALITY, 0 ), 
		ISNULL( B.MIX_MADEBY, '' ),
		ISNULL( B.ENCHANT_INDEX, 0 ),
		ISNULL( B.ENCHANT_LEVEL, 0 ), 
		ISNULL( B.ENCHANT_MADEBY, '' ),
		ISNULL( C.KEY1, 0 ),
		CAST( ROUND( ISNULL( C.VALUE1, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
		ISNULL( C.KEY2, 0 ),
		CAST( ROUND( ISNULL( C.VALUE2, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
		ISNULL( C.KEY3, 0 ),
		CAST( ROUND( ISNULL( C.VALUE3, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
		ISNULL( C.KEY4, 0 ),
		CAST( ROUND( ISNULL( C.VALUE4, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
		ISNULL( C.KEY5, 0 ),
		CAST( ROUND( ISNULL( C.VALUE5, 0 ), 3, 3 ) AS VARCHAR( 16 ) )
	FROM	TB_ITEM A WITH (NOLOCK) LEFT OUTER JOIN
		TB_ITEM_DROP_OPTION C WITH (NOLOCK) ON 
		A.ITEM_DBIDX = C.ITEM_DBIDX LEFT OUTER JOIN
		TB_ITEM_OPTION2 B WITH (NOLOCK) ON A.ITEM_DBIDX = B.ITEM_DBIDX
	WHERE	(A.ITEM_DBIDX > @BEGIN_ITEM_DBIDX) AND (A.ITEM_PYOGUKIDX = @USER_IDX)
	ORDER BY A.ITEM_DBIDX
	RETURN


/*
-- 080128 이전
if exists (select null from tb_item where (ITEM_DBIDX > @Start) and (ITEM_PYOGUKIDX = @User_IDX) )
begin
	select top 100    
		ITEM_DBIDX
	, 	ITEM_IDX
	, 	ITEM_POSITION
	, 	ITEM_QPOSITION
	, 	ITEM_DURABILITY
	, 	ITEM_RAREIDX  
	,	ITEM_SEAL
--	,	DATEDIFF(second, GetDate(), ITEM_ENDTIME) 
	,	case when ITEM_ENDTIME > getdate()  then DATEDIFF(second, GetDate(), ITEM_ENDTIME) else 0 end as 'DIFFTIME'
	,	ITEM_REMAINTIME
	

	from tb_item 
	where (ITEM_DBIDX > @Start) and (ITEM_PYOGUKIDX = @User_IDX) order by ITEM_DBIDX
				
end
else
	select   0
*/
GO
/****** Object:  StoredProcedure [dbo].[MP_STORAGE_Itemoption_info]    Script Date: 07/30/2013 14:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MP_STORAGE_Itemoption_info]
(
	@USER_IDX	INT,
	@STARTIDX	INT
)
AS

	SET NOCOUNT ON

	--select top 100 b.* from tb_item a
	--right outer join tb_item_option b on a.item_dbidx = b.ITEM_DBIDX and option_dbidx > @StartIdx
	--where a.item_pyogukIdx = @UserIdx

	SELECT	TOP	100
			A.OPTION_IDX,
			A.REINFORCE_STRENGTH, 
	        A.REINFORCE_DEXTERITY,
	        A.REINFORCE_VITALITY, 
	        A.REINFORCE_INTELLIGENCE,
	        A.REINFORCE_WISDOM, 
	        A.REINFORCE_LIFE,
	        A.REINFORCE_MANA, 
	        A.REINFORCE_LIFE_RECOVERY,
	        A.REINFORCE_MANA_RECOVERY, 
	        A.REINFORCE_PHYSIC_ATTACK,
	        A.REINFORCE_PHYSIC_DEFENCE, 
	        A.REINFORCE_MAGIC_ATTACK,
	        A.REINFORCE_MAGIC_DEFENCE, 
	        A.REINFORCE_MOVE_SPEED,
	        A.REINFORCE_EVADE, 
	        A.REINFORCE_ACCURACY,
	        A.REINFORCE_CRITICAL_RATE, 
	        A.REINFORCE_CRITICAL_DAMAGE,
	        A.REINFORCE_MADEBY,
	        A.MIX_STRENGTH,
			A.MIX_INTELLIGENCE,
			A.MIX_DEXTERITY,	
			A.MIX_WISDOM,		
			A.MIX_VITALITY,
			A.MIX_MADEBY,
	        A.ENCHANT_INDEX,
	        A.ENCHANT_LEVEL,
	        A.ENCHANT_MADEBY
	FROM    TB_ITEM_OPTION2 AS A INNER JOIN TB_ITEM AS B 
	        ON A.ITEM_DBIDX = B.ITEM_DBIDX
	WHERE   (B.ITEM_PYOGUKIDX = @USER_IDX) AND
			(A.OPTION_IDX > @STARTIDX)

	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_SearchPetWareItemInfo]    Script Date: 07/30/2013 14:55:18 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** 개체: 저장 프로시저 dbo.TP_SearchPetWareItemInfo    스크립트 날짜: 2006-06-30 오후 7:58:19 ******/
CREATE	proc [dbo].[TP_SearchPetWareItemInfo]
(
		@Chridx	int,
		@PosstartIdx	int,
		@PosendIdx	int
)
as
	Set Nocount On

	select a.character_idx, a.item_dbidx, a.item_idx, a.item_position, a.item_durability
	from tb_item  as a 
	where a.item_position between @posstartidx and @posendidx
	and a.character_idx =@Chridx
GO
/****** Object:  StoredProcedure [dbo].[TP_SearchGuildWareItemInfo]    Script Date: 07/30/2013 14:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	proc [dbo].[TP_SearchGuildWareItemInfo]
(
		@StartIdx	int,
		@GuildIdx	int
)
as
	Set Nocount On

	select top 100 item_munpaidx, item_dbidx, item_idx, item_position, item_durability
	from tb_item  with(nolock) 
	where item_munpaidx = @GuildIdx and item_dbidx > @StartIdx
GO
/****** Object:  StoredProcedure [dbo].[mp_gift_item_insert]    Script Date: 07/30/2013 14:53:05 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE  proc [dbo].[mp_gift_item_insert] 
(
	@UserIdx int,
	@EventIdx int,
	@ItemIdx int, 
	@ItemCount int,
	@ItemType int
)

as

Set Nocount on
SET xact_abort on

declare @na int --나누어주는 갯수

declare @loginidx int --계정 번호
declare @count int -- 내부적 나눠주는데서 필요
declare @value int -- 아이템  갯수 값
declare @i int --반복문안에 이용

set @i=1


if @ItemType = 1  --수량아이템은 겹치기 단위로 나누어 넣고
begin
	set @na = 100
	set @count= CEILING(@ItemCount/cast(@na as float))
end
else --고유아이템은 수량만큼 넣는다.
begin
	set @na = 1
	set @count= @ItemCount
end


while @i<=@count
begin
	if @ItemType = 1 --겹치기 아이템
	begin
		if @ItemCount>=@na
			set @value=@na
		else
			set @value=@ItemCount
	end 
	else  --고유아이템
	begin
		set @value=0
	end


	insert into dbo.tb_item (item_idx,item_durability,item_shopidx,item_position,CHARACTER_IDX) 
	values(@ItemIdx,@value,@UserIdx,0,0)	

set @ItemCount=@ItemCount-@na
set @i=@i+1
end

select @EventIdx  AS Expr1
return
GO
/****** Object:  StoredProcedure [dbo].[MP_MONSTER_OPEN_DOOR]    Script Date: 07/30/2013 14:53:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080805 LUJ, 인벤토리에 해당 아이템이 있으면 삭제하고 결과를 반환한다
*/
CREATE   PROC [dbo].[MP_MONSTER_OPEN_DOOR]
(	
	@ITEM_IDX		INT,
	@INVENTORY_START	INT,
	@INVENTORY_END	INT,
	@CHAR_IDX		INT,
	@DOOR_IDX		VARCHAR( 20 )
)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON

	DECLARE @ITEM_POSITION 	INT
	DECLARE @ITEM_DBIDX		INT

	BEGIN TRANSACTION	

	-- 080805 LUJ, 쿼리 결과 중 하나를 변수에 담는다
	SELECT	TOP 1
		@ITEM_POSITION = ITEM_POSITION,
		@ITEM_DBIDX = ITEM_DBIDX
	FROM	TB_ITEM
	WHERE	CHARACTER_IDX = @CHAR_IDX AND
		ITEM_IDX = @ITEM_IDX AND
		ITEM_POSITION BETWEEN @INVENTORY_START AND @INVENTORY_END

	IF 	@ITEM_POSITION IS NULL OR
		@ITEM_DBIDX IS NULL
	BEGIN
		GOTO FAILURE
	END

	COMMIT

	-- 080805 LUJ, 선택된 아이템을 삭제한다
	DELETE
	FROM	TB_ITEM
	WHERE	ITEM_DBIDX = @ITEM_DBIDX

	IF 0 = @@ROWCOUNT
	BEGIN
		GOTO FAILURE
	END

	SELECT	@ITEM_IDX,
		@ITEM_DBIDX,
		@ITEM_POSITION,
		@CHAR_IDX,
		@DOOR_IDX

	RETURN

FAILURE:
	ROLLBACK

	SELECT	@ITEM_IDX,
		0,
		-1,
		@CHAR_IDX,
		@DOOR_IDX	
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_ITEM_PyogukMunpaUpdate]    Script Date: 07/30/2013 14:53:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[MP_ITEM_PyogukMunpaUpdate]
(
		@USER_IDX		int
	,	@MUNPA_IDX		int
	,	@ITEM_DBIDX		int
	,	@ITEM_ITEMIDX		int
	,	@ITEM_DURABILITY	int
	,	@ITEM_POSITION		int
	,	@ITEM_QPOSITION	int
)

as

	Set Nocount on
	Set Xact_Abort on

update TB_ITEM set	CHARACTER_IDX = 0, 
		 	ITEM_POSITION = @ITEM_POSITION, 
			ITEM_QPOSITION = @ITEM_QPOSITION, 
			ITEM_IDX = @ITEM_ITEMIDX, 
			ITEM_DURABILITY = @ITEM_DURABILITY, 
			ITEM_PYOGUKIDX = @USER_IDX,
			ITEM_MUNPAIDX = @MUNPA_IDX
		where ITEM_DBIDX = @ITEM_DBIDX
GO
/****** Object:  StoredProcedure [dbo].[MP_ITEM_OPTION_SELECT]    Script Date: 07/30/2013 14:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
070724 웅주. 플레이어가 보유한 전체 아이템 옵션을 쿼리함

이게 적용되면 다음 프로시저는 필요 없음
- MP_CHARACTER_ITEMOPTIONINFO

*/
CREATE PROCEDURE [dbo].[MP_ITEM_OPTION_SELECT]
(
	@USER_IDX	INT
)
AS
	SET NOCOUNT ON
	
	SELECT	A.OPTION_IDX,
			A.REINFORCE_STRENGTH, 
	        A.REINFORCE_DEXTERITY,
	        A.REINFORCE_VITALITY, 
	        A.REINFORCE_INTELLIGENCE,
	        A.REINFORCE_WISDOM, 
	        A.REINFORCE_LIFE,
	        A.REINFORCE_MANA, 
	        A.REINFORCE_LIFE_RECOVERY,
	        A.REINFORCE_MANA_RECOVERY, 
	        A.REINFORCE_PHYSIC_ATTACK,
	        A.REINFORCE_PHYSIC_DEFENCE, 
	        A.REINFORCE_MAGIC_ATTACK,
	        A.REINFORCE_MAGIC_DEFENCE, 
	        A.REINFORCE_MOVE_SPEED,
	        A.REINFORCE_EVADE, 
	        A.REINFORCE_ACCURACY,
	        A.REINFORCE_CRITICAL_RATE, 
	        A.REINFORCE_CRITICAL_DAMAGE,
	        A.REINFORCE_MADEBY,
	        A.MIX_STRENGTH,
			A.MIX_INTELLIGENCE,
			A.MIX_DEXTERITY,	
			A.MIX_WISDOM,
			A.MIX_VITALITY,
			A.MIX_MADEBY,
	        A.ENCHANT_INDEX,
	        A.ENCHANT_LEVEL,
	        A.ENCHANT_MADEBY
	FROM    TB_ITEM_OPTION2 AS A INNER JOIN TB_ITEM AS B 
	        ON A.ITEM_DBIDX = B.ITEM_DBIDX
	WHERE   (B.CHARACTER_IDX = @USER_IDX)
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_ITEM_OPTION1_INSERT]    Script Date: 07/30/2013 14:53:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
070723 웅주

기존 묵향 코드에서 마법 공격/방어, 크리티컬, 체력/마나 회복이 추가됨

주의: 묵향에서 레어 옵션이란 구분을 제거함

이 프로시저는 다음을 대체함

- MP_ITEM_OPTION_INSERT


수정: 071010 웅주
- 조합 시에 랜덤하게 붙는 수치를 옵션에 저장하도록 함

수정: 071128 웅주
- RM툴 로그를 위해 아이템 DB 인덱스 값을 가져오도록 SELECT 문 마지막에 추가함

*/
CREATE PROCEDURE [dbo].[MP_ITEM_OPTION1_INSERT]
(
	@CHAR_IDX					INT,
	@ITEM_DBIDX					INT,
	@REINFORCE_STRENGTH			INT,
	@REINFORCE_DEXTERITY		INT,
	@REINFORCE_VITALITY			INT,
	@REINFORCE_INTELLIGENCE		INT,
	@REINFORCE_WISDOM			INT,
	@REINFORCE_LIFE				INT,
	@REINFORCE_MANA				INT,
	@REINFORCE_LIFE_RECOVERY	INT,
	@REINFORCE_MANA_RECOVERY	INT,
	@REINFORCE_PHYSIC_ATTACK	INT,
	@REINFORCE_PHYSIC_DEFENCE	INT,
	@REINFORCE_MAGIC_ATTACK		INT,
	@REINFORCE_MAGIC_DEFENCE	INT,
	@REINFORCE_MOVE_SPEED		INT,
	@REINFORCE_EVADE			INT,
	@REINFORCE_ACCURACY			INT,
	@REINFORCE_CRITICAL_RATE	INT,
	@REINFORCE_CRITICAL_DAMAGE	INT,
	@REINFORCE_MADEBY			VARCHAR( 16 ),
	@MIX_STRENGTH				INT,
	@MIX_INTELLIGENCE			INT,
	@MIX_DEXTERITY				INT,
	@MIX_WISDOM					INT,
	@MIX_VITALITY				INT,
	@MIX_MADEBY					VARCHAR( 16 ),
	@ENCHANT_INDEX				INT,
	@ENCHANT_LEVEL				TINYINT,
	@ENCHANT_MADEBY				VARCHAR( 16 )
)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	-- 레코드 삽입
	BEGIN
		INSERT INTO TB_ITEM_OPTION2
				(	ITEM_DBIDX,
					REINFORCE_STRENGTH,
					REINFORCE_DEXTERITY,
					REINFORCE_VITALITY,
					REINFORCE_INTELLIGENCE,
					REINFORCE_WISDOM,
					REINFORCE_LIFE, 
					REINFORCE_MANA,
					REINFORCE_LIFE_RECOVERY,
					REINFORCE_MANA_RECOVERY,
					REINFORCE_PHYSIC_ATTACK, 
					REINFORCE_PHYSIC_DEFENCE,
					REINFORCE_MAGIC_ATTACK,
					REINFORCE_MAGIC_DEFENCE,
					REINFORCE_MOVE_SPEED,
					REINFORCE_EVADE,
					REINFORCE_ACCURACY,
					REINFORCE_CRITICAL_RATE,
					REINFORCE_CRITICAL_DAMAGE,
					REINFORCE_MADEBY,
					MIX_STRENGTH,
					MIX_INTELLIGENCE,
					MIX_DEXTERITY,	
					MIX_WISDOM,		
					MIX_VITALITY,
					MIX_MADEBY,
					ENCHANT_INDEX,
					ENCHANT_LEVEL,
					ENCHANT_MADEBY )
		VALUES	(	@ITEM_DBIDX,
					@REINFORCE_STRENGTH,
					@REINFORCE_DEXTERITY,
					@REINFORCE_VITALITY,
					@REINFORCE_INTELLIGENCE, 
					@REINFORCE_WISDOM,
					@REINFORCE_LIFE,
					@REINFORCE_MANA,
					@REINFORCE_LIFE_RECOVERY,
					@REINFORCE_MANA_RECOVERY, 
					@REINFORCE_PHYSIC_ATTACK,
					@REINFORCE_PHYSIC_DEFENCE,
					@REINFORCE_MAGIC_ATTACK,
					@REINFORCE_MAGIC_DEFENCE,
					@REINFORCE_MOVE_SPEED,
					@REINFORCE_EVADE,
					@REINFORCE_ACCURACY,
					@REINFORCE_CRITICAL_RATE,
					@REINFORCE_CRITICAL_DAMAGE,
					@REINFORCE_MADEBY,
					@MIX_STRENGTH,
					@MIX_INTELLIGENCE,
					@MIX_DEXTERITY,	
					@MIX_WISDOM,		
					@MIX_VITALITY,
					@MIX_MADEBY,
					@ENCHANT_INDEX,
					@ENCHANT_LEVEL,
					@ENCHANT_MADEBY )
	END

	-- 이전 아이템 옵션을 지운다
	BEGIN
		DECLARE @PREV_OPTION_IDX INT
		SELECT @PREV_OPTION_IDX =ITEM_DURABILITY FROM TB_ITEM WHERE ITEM_DBIDX = @ITEM_DBIDX
		
		EXEC MP_ITEM_OPTION_DELETE @PREV_OPTION_IDX
	END
	
	-- 아이템 테이블의 옵션1을 갱신한다
	UPDATE TB_ITEM SET ITEM_DURABILITY = @@IDENTITY WHERE ITEM_DBIDX = @ITEM_DBIDX
	
	SELECT		@CHAR_IDX,
				OPTION_IDX,
				REINFORCE_STRENGTH,
				REINFORCE_DEXTERITY,
				REINFORCE_VITALITY,
				REINFORCE_INTELLIGENCE,
				REINFORCE_WISDOM,
				REINFORCE_LIFE, 
				REINFORCE_MANA,
				REINFORCE_LIFE_RECOVERY,
				REINFORCE_MANA_RECOVERY,
				REINFORCE_PHYSIC_ATTACK, 
				REINFORCE_PHYSIC_DEFENCE,
				REINFORCE_MAGIC_ATTACK,
				REINFORCE_MAGIC_DEFENCE,
				REINFORCE_MOVE_SPEED,
				REINFORCE_EVADE,
				REINFORCE_ACCURACY,
				REINFORCE_CRITICAL_RATE,
				REINFORCE_CRITICAL_DAMAGE,
				REINFORCE_MADEBY,
				MIX_STRENGTH,
				MIX_INTELLIGENCE,
				MIX_DEXTERITY,	
				MIX_WISDOM,		
				MIX_VITALITY,
				MIX_MADEBY,
				ENCHANT_INDEX,
				ENCHANT_LEVEL,
				ENCHANT_MADEBY,
				@ITEM_DBIDX
	FROM		TB_ITEM_OPTION2
	WHERE		(OPTION_IDX = @@IDENTITY)
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_ITEM_SEAL]    Script Date: 07/30/2013 14:53:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
090122 LUJ, 값에 따라 아이템을 봉인/해제시킨다
*/
CREATE    PROC [dbo].[MP_ITEM_SEAL]
(
	@ITEM_DBIDX	INT,
	@SEAL_VALUE	INT
)
AS
	SET NOCOUNT ON

	UPDATE	TB_ITEM
	SET	ITEM_SEAL	= @SEAL_VALUE,
		ITEM_ENDTIME	= GETDATE(),
		ITEM_REMAINTIME = 0
	WHERE	ITEM_DBIDX = @ITEM_DBIDX
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_ShopItemInsert]    Script Date: 07/30/2013 14:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[MP_ShopItemInsert]
(
	@ItemIdx		int,
	@UserIdx	int,
	@ItemNum	int,
	@ItemParam	int
)
as

set nocount on 

declare @ItemCount	int
declare @count		int
declare @realnum	int	-- 실제 insert될 아이템 갯수
declare @i		int

set @ItemCount = @ItemNum
set @count = CEILING(@ItemNum/5.0)
set @i = 0

while( @i < @count )
begin 
	if( @ItemCount >= 5 )
	begin
		set @realnum = 5
	end
	else 
	begin
		if( @ItemIdx between 55400 and 55600 )
			set @realnum = 0
		else
			set @realnum = @ItemCount
	end

	insert into tb_item ( item_idx, item_durability, item_shopidx, item_param )
	values( @ItemIdx, @realnum, @UserIdx, @ItemParam )

	set @ItemCount = @ItemCount - 5
	set @i = @i + 1
end

--------------------------------
declare	@date	smalldatetime
declare	@temp	varchar(10)
set @temp = getdate()
set @date = @temp

if exists( select * from TB_ShopItem where ItemIdx = @ItemIdx and (RegDate >= @date and RegDate < @date+1) )
begin
	update TB_ShopItem set ItemNum = ItemNum+@ItemNum where ItemIdx = @ItemIdx and (RegDate >= @date and RegDate < @date+1) 
end
else
begin
	insert into TB_ShopItem ( ItemIdx, ItemNum, Param1, Param2, RegDate ) values( @ItemIdx, @ItemNum, 0, 0, getdate() )
end
---------------------------------
GO
/****** Object:  StoredProcedure [dbo].[MP_ITEM_UnSealingByGameTime]    Script Date: 07/30/2013 14:53:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MP_ITEM_UnSealingByGameTime]
	(
		@ITEM_DBIDX		int
	,	@TIME			int
	)
	AS
	SET NOCOUNT ON	
	
	UPDATE TB_ITEM
	
	SET
		ITEM_SEAL = 2
	,	ITEM_REMAINTIME = @TIME
	
	WHERE ITEM_DBIDX = @ITEM_DBIDX

	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_ITEM_UnSealingByRealTime]    Script Date: 07/30/2013 14:53:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROC [dbo].[MP_ITEM_UnSealingByRealTime]
	(
		@ITEM_DBIDX		int
	,	@TIME			int
	)
	AS
	SET NOCOUNT ON	
	
	UPDATE TB_ITEM
	
	SET
		ITEM_SEAL = 2
	,	ITEM_ENDTIME = DATEADD(second, @TIME, Getdate())
	
	WHERE ITEM_DBIDX = @ITEM_DBIDX

	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_SHOPITEM_UseInfo]    Script Date: 07/30/2013 14:54:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
ALTER                proc dbo.MP_SHOPITEM_UseInfo
(
		@Character_IDX		int
)

as
Set Nocount On

select  A.ITEM_IDX, A.ITEM_DBIDX, A.ITEM_PARAM, A.BEGIN_TIME, A.REMAIN_TIME,isnull(B.item_position,0)
from TB_SHOPITEMUSEINFO A with(readuncommitted)  
left outer join Tb_item B with(readuncommitted)  on A.item_dbidx= B.item_dbidx
where A.CHARACTER_IDX=@Character_IDX
*/

	CREATE   PROC [dbo].[MP_SHOPITEM_UseInfo]
	(
		@CHARACTER_IDX	int
	)

	AS

	SET NOCOUNT ON

	SELECT 	ITEM_IDX
	,	ITEM_DBIDX
	,	ITEM_PARAM
	,	ITEM_POSITION
	FROM	TB_ITEM
	
	WHERE CHARACTER_IDX = @CHARACTER_IDX
GO
/****** Object:  StoredProcedure [dbo].[MP_ITEM_MoveUpdateStorage]    Script Date: 07/30/2013 14:53:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080410 LUJ, 영역 정보가 바뀌어도 관계없도록 인자로 받도록 함
*/
CREATE proc [dbo].[MP_ITEM_MoveUpdateStorage] -- 표국으로 이동하는 아이템. 인벤 ->표국, 표국->표국
(
		@CharacterIDX 	int
	,	@useridx	int
	,	@FromIdx	int
	,	@FromPos	int
	,	@ToIdx		int
	,	@ToPos		int
	,	@BEGIN_INVEN_POS	INT
	,	@END_INVEN_POS		INT
)
as
	Set Nocount on
	Set Xact_Abort on

	update TB_ITEM set ITEM_POSITION = @FromPos, ITEM_QPOSITION = 0, CHARACTER_IDX  = 0 ,  ITEM_PYOGUKIDX =  @useridx, item_munpaidx = 0 where  ITEM_DBIDX = @FromIdx

	--인벤토리로 가면 캐릭터 인덱스를 셋팅
	if( @ToPos BETWEEN @BEGIN_INVEN_POS AND @END_INVEN_POS ) 
		update TB_ITEM set ITEM_POSITION = @ToPos, character_idx = @CharacterIDX, item_pyogukidx = 0, item_munpaidx = 0 where  ITEM_DBIDX = @ToIdx
	else
		update TB_ITEM set ITEM_POSITION = @ToPos, item_qposition = 0, character_idx = 0,  item_pyogukidx = @useridx, item_munpaidx = 0 where  ITEM_DBIDX = @ToIdx
		
	RETURN
	
/*
-- 080410 LUJ, 이전 코드
ALTER proc dbo.MP_ITEM_MoveUpdateStorage -- 표국으로 이동하는 아이템. 인벤 ->표국, 표국->표국
(
		@CharacterIDX 	int
	,	@useridx	int
	,	@FromIdx	int
	,	@FromPos	int
	,	@ToIdx		int
	,	@ToPos		int
)
as
	Set Nocount on
	Set Xact_Abort on

	update TB_ITEM set ITEM_POSITION = @FromPos, ITEM_QPOSITION = 0, CHARACTER_IDX  = 0 ,  ITEM_PYOGUKIDX =  @useridx, item_munpaidx = 0 where  ITEM_DBIDX = @FromIdx

if ( @ToIdx != 0 )
begin
	if( 0 <= @ToPos and @ToPos < 60 ) --인벤토리로 가면 캐릭터 인덱스를 셋팅
		update TB_ITEM set ITEM_POSITION = @ToPos, character_idx = @CharacterIDX, item_pyogukidx = 0, item_munpaidx = 0 where  ITEM_DBIDX = @ToIdx
	else if ( 60 <= @ToPos and @ToPos < 240 ) -- 표국이면 표국인덱스를 셋팅
		update TB_ITEM set ITEM_POSITION = @ToPos, item_qposition = 0, character_idx = 0,  item_pyogukidx = @useridx, item_munpaidx = 0 where  ITEM_DBIDX = @ToIdx
end
		
	RETURN
*/
GO
/****** Object:  StoredProcedure [dbo].[MP_SHOPITEM_UpdateParam]    Script Date: 07/30/2013 14:54:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE           proc [dbo].[MP_SHOPITEM_UpdateParam] ( @CHARACTERIDX int, @ITEMDBIDX int, @ITEMPARAM int )

as
	Set Nocount on


update TB_ITEM set ITEM_PARAM=@ITEMPARAM
where ITEM_DBIDX=@ITEMDBIDX
GO
/****** Object:  StoredProcedure [dbo].[MP_ITEM_MoveUpdatePetInven]    Script Date: 07/30/2013 14:53:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE    PROC [dbo].[MP_ITEM_MoveUpdatePetInven]
(
	@CharacterIdx	int,
	@UserIdx	int,
	@PetIdx	Int,
	@FromDBIdx	int,
	@FromPos	int,
	@ToDBIdx	int,
	@ToPos	int,
	@Param	tinyint
)
AS
	Set Nocount on

	if( @Param = 0 )		-- 인벤 <-> 펫
	begin
		update dbo.tb_item
		set character_idx = 0, pet_idx = @PetIdx, item_position = @ToPos
		where item_dbidx = @FromDBIdx

		update dbo.tb_item
		set character_idx = @CharacterIdx, pet_idx = 0, item_position = @FromPos
		where item_dbidx = @ToDBIdx
	end
	else if( @Param = 1 )	-- 창고 <-> 펫
	begin
		update dbo.tb_item
		set item_pyogukidx = 0, pet_idx = @PetIdx, item_position = @ToPos
		where item_dbidx = @FromDBIdx

		update dbo.tb_item
		set item_pyogukidx = @UserIdx, pet_idx = 0, item_position = @FromPos
		where item_dbidx = @ToDBIdx
	end
GO
/****** Object:  StoredProcedure [dbo].[MP_ITEM_MoveUpdateShop]    Script Date: 07/30/2013 14:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_ITEM_MoveUpdateShop] -- 아이템몰창고로 이동하는 아이템
(
		@CharacterIDX 	int
	,	@useridx	int
	,	@FromIdx	int
	,	@FromPos	int
	,	@ToIdx		int
	,	@ToPos		int
)
as
	Set Nocount on
	Set Xact_Abort on

update TB_ITEM set ITEM_POSITION = @FromPos, ITEM_QPOSITION = 0, CHARACTER_IDX  = 0 ,  ITEM_PYOGUKIDX =  0, item_munpaidx = 0, ITEM_SHOPIDX = @useridx where  ITEM_DBIDX = @FromIdx

if ( @ToIdx != 0 )
begin
	if( 240 <= @ToPos and @ToPos < 390 ) --아이템몰 창고로 가면 캐릭터인덱스를 셋팅
		update TB_ITEM set ITEM_POSITION = @ToPos, item_qposition = 0, character_idx = 0,  item_pyogukidx = 0, item_munpaidx = 0, ITEM_SHOPIDX = @useridx where  ITEM_DBIDX = @ToIdx
	else if ( 390 <= @ToPos and @ToPos < 430 ) -- 아이템몰 인벤으로 가면 샵인덱스 셋팅
		update TB_ITEM set ITEM_POSITION = @ToPos, character_idx = @CharacterIDX, item_pyogukidx = 0, item_munpaidx = 0, ITEM_SHOPIDX = 0 where  ITEM_DBIDX = @ToIdx
end
GO
/****** Object:  StoredProcedure [dbo].[MP_CONSIGNMENT_SearchIndex]    Script Date: 07/30/2013 14:52:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROC [dbo].[MP_CONSIGNMENT_SearchIndex] 
(
@CharacterIndex int,
@SortType int,
@StartPage int,
@ItemIdx1 int,
@ItemIdx2 int,
@ItemIdx3 int,
@ItemIdx4 int,
@ItemIdx5 int,
@ItemIdx6 int,
@ItemIdx7 int,
@ItemIdx8 int,
@ItemIdx9 int,
@ItemIdx10 int
)
AS 
SET  NOCOUNT  ON 

declare @TOTAL_COUNT int
declare @PER_PAGE int
declare @END_PAGE int
declare @MOD_COUNT int
declare @START_CNT int
declare @END_CNT int


select @TOTAL_COUNT = COUNT(CONSIGNMENT_IDX)
from ( select ROW_NUMBER() over(order by [CONSIGNMENT_IDX] asc) as ROWNUM,
		[CONSIGNMENT_IDX]
		from [dbo].[TB_CONSIGNMENT] with (nolock)
		where [ENDTIME] > getdate() and [CONSIGNMENT_IDX] > 0 and
		(
			ITEM_INDEX = @ItemIdx1 or
			ITEM_INDEX = @ItemIdx2 or
			ITEM_INDEX = @ItemIdx3 or
			ITEM_INDEX = @ItemIdx4 or
			ITEM_INDEX = @ItemIdx5 or
			ITEM_INDEX = @ItemIdx6 or
			ITEM_INDEX = @ItemIdx7 or
			ITEM_INDEX = @ItemIdx8 or
			ITEM_INDEX = @ItemIdx9 or
			ITEM_INDEX = @ItemIdx10
		) ) AS a

set @PER_PAGE = 10
set @END_PAGE = @TOTAL_COUNT / @PER_PAGE
set @MOD_COUNT = @TOTAL_COUNT % @PER_PAGE

if(@MOD_COUNT <> 0)
begin
	set @END_PAGE = @END_PAGE + 1
end

set @START_CNT = (@PER_PAGE * (@StartPage - 1)) + 1
set @END_CNT = @START_CNT + (@PER_PAGE - 1)

if (@SortType = 2) -- eConsignmentSORT_LevelAsc
begin
SELECT  S.[CONSIGNMENT_IDX],
		S.[CHARACTER_NAME],
		S.[REMAINTIME],
		S.[INIT_DURABILITY],
		S.[DEPOSIT],
		S.[COMMISSION],
		S.[PRICE],
		@StartPage,
		@END_PAGE,
		A.ITEM_DBIDX,
		A.ITEM_IDX,
        A.ITEM_DURABILITY,
        A.ITEM_PARAM,
        A.ITEM_SEAL, 
        A.ITEM_REMAINTIME,
        ISNULL( B.REINFORCE_STRENGTH, 0 ),
        ISNULL( B.REINFORCE_DEXTERITY, 0 ), 
        ISNULL( B.REINFORCE_VITALITY, 0 ),
        ISNULL( B.REINFORCE_INTELLIGENCE, 0 ), 
        ISNULL( B.REINFORCE_WISDOM, 0 ),
        ISNULL( B.REINFORCE_LIFE, 0 ),
        ISNULL( B.REINFORCE_MANA, 0 ), 
        ISNULL( B.REINFORCE_LIFE_RECOVERY, 0 ),
        ISNULL( B.REINFORCE_MANA_RECOVERY, 0 ), 
        ISNULL( B.REINFORCE_PHYSIC_ATTACK, 0 ),
        ISNULL( B.REINFORCE_PHYSIC_DEFENCE, 0 ), 
        ISNULL( B.REINFORCE_MAGIC_ATTACK, 0 ),
        ISNULL( B.REINFORCE_MAGIC_DEFENCE, 0 ), 
        ISNULL( B.REINFORCE_MOVE_SPEED, 0 ),
        ISNULL( B.REINFORCE_EVADE, 0 ), 
        ISNULL( B.REINFORCE_ACCURACY, 0 ),
        ISNULL( B.REINFORCE_CRITICAL_RATE, 0 ), 
        ISNULL( B.REINFORCE_CRITICAL_DAMAGE, 0 ),
        ISNULL( B.REINFORCE_MADEBY, '' ),
        ISNULL( B.MIX_STRENGTH, 0 ), 
        ISNULL( B.MIX_INTELLIGENCE, 0 ),
        ISNULL( B.MIX_DEXTERITY, 0 ),
        ISNULL( B.MIX_WISDOM, 0 ),
        ISNULL( B.MIX_VITALITY, 0 ), 
        ISNULL( B.MIX_MADEBY, '' ),
        ISNULL( B.ENCHANT_INDEX, 0 ),
        ISNULL( B.ENCHANT_LEVEL, 0 ), 
        ISNULL( B.ENCHANT_MADEBY, '' ),
		ISNULL( C.KEY1, 0 ),
        CAST( ROUND( ISNULL( C.VALUE1, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY2, 0 ),
        CAST( ROUND( ISNULL( C.VALUE2, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY3, 0 ),
        CAST( ROUND( ISNULL( C.VALUE3, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY4, 0 ),
        CAST( ROUND( ISNULL( C.VALUE4, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY5, 0 ),
        CAST( ROUND( ISNULL( C.VALUE5, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
		@TOTAL_COUNT,
		ISNULL(D.AVERAGE_PRICE, 0)
FROM	(
		select [CONSIGNMENT_IDX],
				[ITEM_DBIDX],
				[ITEM_INDEX],
				[CHARACTER_NAME],
				[USELEVEL],
				[ENCHANT],
				datediff(minute, getdate(), [ENDTIME]) as [REMAINTIME],
				[INIT_DURABILITY],
				[DEPOSIT],
				[COMMISSION],
				[PRICE]
		from ( select ROW_NUMBER() over(order by [USELEVEL] asc) as ROWNUM,
				*
				from [dbo].[TB_CONSIGNMENT] with (nolock)
				where [ENDTIME] > getdate() and [CONSIGNMENT_IDX] > 0 and
				(
					ITEM_INDEX = @ItemIdx1 or
					ITEM_INDEX = @ItemIdx2 or
					ITEM_INDEX = @ItemIdx3 or
					ITEM_INDEX = @ItemIdx4 or
					ITEM_INDEX = @ItemIdx5 or
					ITEM_INDEX = @ItemIdx6 or
					ITEM_INDEX = @ItemIdx7 or
					ITEM_INDEX = @ItemIdx8 or
					ITEM_INDEX = @ItemIdx9 or
					ITEM_INDEX = @ItemIdx10
				) ) AS TEMP
		where ROWNUM between @START_CNT and @END_CNT
		) AS S LEFT OUTER JOIN
		TB_ITEM A ON
		S.ITEM_DBIDX = A.ITEM_DBIDX LEFT OUTER JOIN
		TB_ITEM_DROP_OPTION C  ON 
		S.ITEM_DBIDX = C.ITEM_DBIDX LEFT OUTER JOIN
        TB_ITEM_OPTION2 B  ON
		S.ITEM_DBIDX = B.ITEM_DBIDX LEFT OUTER JOIN
		TB_CONSIGNMENT_AVERAGE D ON
		S.ITEM_INDEX = D.ITEM_INDEX and S.ENCHANT = D.ENCHANT
order by S.[USELEVEL] asc
end
else if (@SortType = 3) -- eConsignmentSORT_LevelDesc
begin
SELECT  S.[CONSIGNMENT_IDX],
		S.[CHARACTER_NAME],
		S.[REMAINTIME],
		S.[INIT_DURABILITY],
		S.[DEPOSIT],
		S.[COMMISSION],
		S.[PRICE],
		@StartPage,
		@END_PAGE,
		A.ITEM_DBIDX,
		A.ITEM_IDX,
        A.ITEM_DURABILITY,
        A.ITEM_PARAM,
        A.ITEM_SEAL, 
        A.ITEM_REMAINTIME,
        ISNULL( B.REINFORCE_STRENGTH, 0 ),
        ISNULL( B.REINFORCE_DEXTERITY, 0 ), 
        ISNULL( B.REINFORCE_VITALITY, 0 ),
        ISNULL( B.REINFORCE_INTELLIGENCE, 0 ), 
        ISNULL( B.REINFORCE_WISDOM, 0 ),
        ISNULL( B.REINFORCE_LIFE, 0 ),
        ISNULL( B.REINFORCE_MANA, 0 ), 
        ISNULL( B.REINFORCE_LIFE_RECOVERY, 0 ),
        ISNULL( B.REINFORCE_MANA_RECOVERY, 0 ), 
        ISNULL( B.REINFORCE_PHYSIC_ATTACK, 0 ),
        ISNULL( B.REINFORCE_PHYSIC_DEFENCE, 0 ), 
        ISNULL( B.REINFORCE_MAGIC_ATTACK, 0 ),
        ISNULL( B.REINFORCE_MAGIC_DEFENCE, 0 ), 
        ISNULL( B.REINFORCE_MOVE_SPEED, 0 ),
        ISNULL( B.REINFORCE_EVADE, 0 ), 
        ISNULL( B.REINFORCE_ACCURACY, 0 ),
        ISNULL( B.REINFORCE_CRITICAL_RATE, 0 ), 
        ISNULL( B.REINFORCE_CRITICAL_DAMAGE, 0 ),
        ISNULL( B.REINFORCE_MADEBY, '' ),
        ISNULL( B.MIX_STRENGTH, 0 ), 
        ISNULL( B.MIX_INTELLIGENCE, 0 ),
        ISNULL( B.MIX_DEXTERITY, 0 ),
        ISNULL( B.MIX_WISDOM, 0 ),
        ISNULL( B.MIX_VITALITY, 0 ), 
        ISNULL( B.MIX_MADEBY, '' ),
        ISNULL( B.ENCHANT_INDEX, 0 ),
        ISNULL( B.ENCHANT_LEVEL, 0 ), 
        ISNULL( B.ENCHANT_MADEBY, '' ),
		ISNULL( C.KEY1, 0 ),
        CAST( ROUND( ISNULL( C.VALUE1, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY2, 0 ),
        CAST( ROUND( ISNULL( C.VALUE2, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY3, 0 ),
        CAST( ROUND( ISNULL( C.VALUE3, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY4, 0 ),
        CAST( ROUND( ISNULL( C.VALUE4, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY5, 0 ),
        CAST( ROUND( ISNULL( C.VALUE5, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
		@TOTAL_COUNT,
		ISNULL(D.AVERAGE_PRICE, 0)
FROM	(
		select [CONSIGNMENT_IDX],
				[ITEM_DBIDX],
				[ITEM_INDEX],
				[CHARACTER_NAME],
				[USELEVEL],
				[ENCHANT],
				datediff(minute, getdate(), [ENDTIME]) as [REMAINTIME],
				[INIT_DURABILITY],
				[DEPOSIT],
				[COMMISSION],
				[PRICE]
		from ( select ROW_NUMBER() over(order by [USELEVEL] desc) as ROWNUM,
				*
				from [dbo].[TB_CONSIGNMENT] with (nolock)
				where [ENDTIME] > getdate() and [CONSIGNMENT_IDX] > 0 and
				(
					ITEM_INDEX = @ItemIdx1 or
					ITEM_INDEX = @ItemIdx2 or
					ITEM_INDEX = @ItemIdx3 or
					ITEM_INDEX = @ItemIdx4 or
					ITEM_INDEX = @ItemIdx5 or
					ITEM_INDEX = @ItemIdx6 or
					ITEM_INDEX = @ItemIdx7 or
					ITEM_INDEX = @ItemIdx8 or
					ITEM_INDEX = @ItemIdx9 or
					ITEM_INDEX = @ItemIdx10
				) ) AS TEMP
		where ROWNUM between @START_CNT and @END_CNT
		) AS S LEFT OUTER JOIN
		TB_ITEM A ON
		S.ITEM_DBIDX = A.ITEM_DBIDX LEFT OUTER JOIN
		TB_ITEM_DROP_OPTION C  ON 
		S.ITEM_DBIDX = C.ITEM_DBIDX LEFT OUTER JOIN
        TB_ITEM_OPTION2 B  ON
		S.ITEM_DBIDX = B.ITEM_DBIDX LEFT OUTER JOIN
		TB_CONSIGNMENT_AVERAGE D ON
		S.ITEM_INDEX = D.ITEM_INDEX and S.ENCHANT = D.ENCHANT
order by S.[USELEVEL] desc
end
else if (@SortType = 4) -- eConsignmentSORT_PriceAsc
begin
SELECT  S.[CONSIGNMENT_IDX],
		S.[CHARACTER_NAME],
		S.[REMAINTIME],
		S.[INIT_DURABILITY],
		S.[DEPOSIT],
		S.[COMMISSION],
		S.[PRICE],
		@StartPage,
		@END_PAGE,
		A.ITEM_DBIDX,
		A.ITEM_IDX,
        A.ITEM_DURABILITY,
        A.ITEM_PARAM,
        A.ITEM_SEAL, 
        A.ITEM_REMAINTIME,
        ISNULL( B.REINFORCE_STRENGTH, 0 ),
        ISNULL( B.REINFORCE_DEXTERITY, 0 ), 
        ISNULL( B.REINFORCE_VITALITY, 0 ),
        ISNULL( B.REINFORCE_INTELLIGENCE, 0 ), 
        ISNULL( B.REINFORCE_WISDOM, 0 ),
        ISNULL( B.REINFORCE_LIFE, 0 ),
        ISNULL( B.REINFORCE_MANA, 0 ), 
        ISNULL( B.REINFORCE_LIFE_RECOVERY, 0 ),
        ISNULL( B.REINFORCE_MANA_RECOVERY, 0 ), 
        ISNULL( B.REINFORCE_PHYSIC_ATTACK, 0 ),
        ISNULL( B.REINFORCE_PHYSIC_DEFENCE, 0 ), 
        ISNULL( B.REINFORCE_MAGIC_ATTACK, 0 ),
        ISNULL( B.REINFORCE_MAGIC_DEFENCE, 0 ), 
        ISNULL( B.REINFORCE_MOVE_SPEED, 0 ),
        ISNULL( B.REINFORCE_EVADE, 0 ), 
        ISNULL( B.REINFORCE_ACCURACY, 0 ),
        ISNULL( B.REINFORCE_CRITICAL_RATE, 0 ), 
        ISNULL( B.REINFORCE_CRITICAL_DAMAGE, 0 ),
        ISNULL( B.REINFORCE_MADEBY, '' ),
        ISNULL( B.MIX_STRENGTH, 0 ), 
        ISNULL( B.MIX_INTELLIGENCE, 0 ),
        ISNULL( B.MIX_DEXTERITY, 0 ),
        ISNULL( B.MIX_WISDOM, 0 ),
        ISNULL( B.MIX_VITALITY, 0 ), 
        ISNULL( B.MIX_MADEBY, '' ),
        ISNULL( B.ENCHANT_INDEX, 0 ),
        ISNULL( B.ENCHANT_LEVEL, 0 ), 
        ISNULL( B.ENCHANT_MADEBY, '' ),
		ISNULL( C.KEY1, 0 ),
        CAST( ROUND( ISNULL( C.VALUE1, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY2, 0 ),
        CAST( ROUND( ISNULL( C.VALUE2, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY3, 0 ),
        CAST( ROUND( ISNULL( C.VALUE3, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY4, 0 ),
        CAST( ROUND( ISNULL( C.VALUE4, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY5, 0 ),
        CAST( ROUND( ISNULL( C.VALUE5, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
		@TOTAL_COUNT,
		ISNULL(D.AVERAGE_PRICE, 0)
FROM	(
		select [CONSIGNMENT_IDX],
				[ITEM_DBIDX],
				[ITEM_INDEX],
				[CHARACTER_NAME],
				[USELEVEL],
				[ENCHANT],
				datediff(minute, getdate(), [ENDTIME]) as [REMAINTIME],
				[INIT_DURABILITY],
				[DEPOSIT],
				[COMMISSION],
				[PRICE]
		from ( select ROW_NUMBER() over(order by [PRICE] asc) as ROWNUM,
				*
				from [dbo].[TB_CONSIGNMENT] with (nolock)
				where [ENDTIME] > getdate() and [CONSIGNMENT_IDX] > 0 and
				(
					ITEM_INDEX = @ItemIdx1 or
					ITEM_INDEX = @ItemIdx2 or
					ITEM_INDEX = @ItemIdx3 or
					ITEM_INDEX = @ItemIdx4 or
					ITEM_INDEX = @ItemIdx5 or
					ITEM_INDEX = @ItemIdx6 or
					ITEM_INDEX = @ItemIdx7 or
					ITEM_INDEX = @ItemIdx8 or
					ITEM_INDEX = @ItemIdx9 or
					ITEM_INDEX = @ItemIdx10
				) ) AS TEMP
		where ROWNUM between @START_CNT and @END_CNT
		) AS S LEFT OUTER JOIN
		TB_ITEM A ON
		S.ITEM_DBIDX = A.ITEM_DBIDX LEFT OUTER JOIN
		TB_ITEM_DROP_OPTION C  ON 
		S.ITEM_DBIDX = C.ITEM_DBIDX LEFT OUTER JOIN
        TB_ITEM_OPTION2 B  ON
		S.ITEM_DBIDX = B.ITEM_DBIDX LEFT OUTER JOIN
		TB_CONSIGNMENT_AVERAGE D ON
		S.ITEM_INDEX = D.ITEM_INDEX and S.ENCHANT = D.ENCHANT
order by S.[PRICE] asc
end
else if (@SortType = 5) -- eConsignmentSORT_PriceDesc
begin
SELECT  S.[CONSIGNMENT_IDX],
		S.[CHARACTER_NAME],
		S.[REMAINTIME],
		S.[INIT_DURABILITY],
		S.[DEPOSIT],
		S.[COMMISSION],
		S.[PRICE],
		@StartPage,
		@END_PAGE,
		A.ITEM_DBIDX,
		A.ITEM_IDX,
        A.ITEM_DURABILITY,
        A.ITEM_PARAM,
        A.ITEM_SEAL, 
        A.ITEM_REMAINTIME,
        ISNULL( B.REINFORCE_STRENGTH, 0 ),
        ISNULL( B.REINFORCE_DEXTERITY, 0 ), 
        ISNULL( B.REINFORCE_VITALITY, 0 ),
        ISNULL( B.REINFORCE_INTELLIGENCE, 0 ), 
        ISNULL( B.REINFORCE_WISDOM, 0 ),
        ISNULL( B.REINFORCE_LIFE, 0 ),
        ISNULL( B.REINFORCE_MANA, 0 ), 
        ISNULL( B.REINFORCE_LIFE_RECOVERY, 0 ),
        ISNULL( B.REINFORCE_MANA_RECOVERY, 0 ), 
        ISNULL( B.REINFORCE_PHYSIC_ATTACK, 0 ),
        ISNULL( B.REINFORCE_PHYSIC_DEFENCE, 0 ), 
        ISNULL( B.REINFORCE_MAGIC_ATTACK, 0 ),
        ISNULL( B.REINFORCE_MAGIC_DEFENCE, 0 ), 
        ISNULL( B.REINFORCE_MOVE_SPEED, 0 ),
        ISNULL( B.REINFORCE_EVADE, 0 ), 
        ISNULL( B.REINFORCE_ACCURACY, 0 ),
        ISNULL( B.REINFORCE_CRITICAL_RATE, 0 ), 
        ISNULL( B.REINFORCE_CRITICAL_DAMAGE, 0 ),
        ISNULL( B.REINFORCE_MADEBY, '' ),
        ISNULL( B.MIX_STRENGTH, 0 ), 
        ISNULL( B.MIX_INTELLIGENCE, 0 ),
        ISNULL( B.MIX_DEXTERITY, 0 ),
        ISNULL( B.MIX_WISDOM, 0 ),
        ISNULL( B.MIX_VITALITY, 0 ), 
        ISNULL( B.MIX_MADEBY, '' ),
        ISNULL( B.ENCHANT_INDEX, 0 ),
        ISNULL( B.ENCHANT_LEVEL, 0 ), 
        ISNULL( B.ENCHANT_MADEBY, '' ),
		ISNULL( C.KEY1, 0 ),
        CAST( ROUND( ISNULL( C.VALUE1, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY2, 0 ),
        CAST( ROUND( ISNULL( C.VALUE2, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY3, 0 ),
        CAST( ROUND( ISNULL( C.VALUE3, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY4, 0 ),
        CAST( ROUND( ISNULL( C.VALUE4, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
        ISNULL( C.KEY5, 0 ),
        CAST( ROUND( ISNULL( C.VALUE5, 0 ), 3, 3 ) AS VARCHAR( 16 ) ),
		@TOTAL_COUNT,
		ISNULL(D.AVERAGE_PRICE, 0)
FROM	(
		select [CONSIGNMENT_IDX],
				[ITEM_DBIDX],
				[ITEM_INDEX],
				[CHARACTER_NAME],
				[USELEVEL],
				[ENCHANT],
				datediff(minute, getdate(), [ENDTIME]) as [REMAINTIME],
				[INIT_DURABILITY],
				[DEPOSIT],
				[COMMISSION],
				[PRICE]
		from ( select ROW_NUMBER() over(order by [PRICE] desc) as ROWNUM,
				*
				from [dbo].[TB_CONSIGNMENT] with (nolock)
				where [ENDTIME] > getdate() and [CONSIGNMENT_IDX] > 0 and
				(
					ITEM_INDEX = @ItemIdx1 or
					ITEM_INDEX = @ItemIdx2 or
					ITEM_INDEX = @ItemIdx3 or
					ITEM_INDEX = @ItemIdx4 or
					ITEM_INDEX = @ItemIdx5 or
					ITEM_INDEX = @ItemIdx6 or
					ITEM_INDEX = @ItemIdx7 or
					ITEM_INDEX = @ItemIdx8 or
					ITEM_INDEX = @ItemIdx9 or
					ITEM_INDEX = @ItemIdx10
				) ) AS TEMP
		where ROWNUM between @START_CNT and @END_CNT
		) AS S LEFT OUTER JOIN
		TB_ITEM A ON
		S.ITEM_DBIDX = A.ITEM_DBIDX LEFT OUTER JOIN
		TB_ITEM_DROP_OPTION C  ON 
		S.ITEM_DBIDX = C.ITEM_DBIDX LEFT OUTER JOIN
        TB_ITEM_OPTION2 B  ON
		S.ITEM_DBIDX = B.ITEM_DBIDX LEFT OUTER JOIN
		TB_CONSIGNMENT_AVERAGE D ON
		S.ITEM_INDEX = D.ITEM_INDEX and S.ENCHANT = D.ENCHANT
order by S.[PRICE] desc
end


set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[MP_ITEM_UpdateRemainTime]    Script Date: 07/30/2013 14:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[MP_ITEM_UpdateRemainTime]
	(
		@ITEM_DBIDX		int
	-- 090303 LYW  : 아이템 봉인상태도 함께 업데이트 한다.
	,	@ITEM_SEAL		tinyint
	,	@REMAIN_TIME	int
	)
	AS
	SET NOCOUNT ON

	UPDATE	TB_ITEM

	-- 090303 LYW  : 아이템 봉인상태도 함께 업데이트 한다.
	SET	ITEM_REMAINTIME = @REMAIN_TIME, ITEM_SEAL = @ITEM_SEAL
	
	WHERE ITEM_DBIDX = @ITEM_DBIDX
	
			
	
		RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_ITEM_Update]    Script Date: 07/30/2013 14:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_ITEM_Update]				-- 아이템 업데이트 프로시저
	(
		@CHARACTER_IDX 	int			-- 캐릭터 인덱스 변수 선언
	,	@ITEM_DBIDX		int			-- 아이템 Database 인덱스 변수 선언
	,	@ITEM_ITEMIDX		int			-- 아이템 인덱스 변수 선언
	,	@ITEM_DURABILITY	int			-- 내구성 ( 현재 아이템 중복 개수로 사용 ) 변수 선언
	,	@ITEM_POSITION		int			-- 인벤토리 상의 아이템 위치 변수 선언
	,	@ITEM_QPOSITION	int			-- 퀵 슬롯 상의 위치 번호 변수 선언
	,	@ITEM_RAREIDX		int			-- 아이템 parameter 변수 선언
	)
	
	as

	Set Nocount on
--	Set Xact_Abort on

	update TB_ITEM 						-- 업데이트 할 대상 테이블을 세팅한다

	set  							-- 업데이트 대상 열을 열거 및 값을 세팅한다
		CHARACTER_IDX = @CHARACTER_IDX		-- 캐릭터 인덱스 세팅
	, 	ITEM_POSITION = @ITEM_POSITION			-- 인벤토리 상의 아이템 위치 값 세팅
	, 	ITEM_QPOSITION = @ITEM_QPOSITION		-- 퀵 슬롯 상의 아이템 위치 값 세팅
	, 	ITEM_IDX = @ITEM_ITEMIDX			-- 아이템 인덱스 세팅
	, 	ITEM_DURABILITY = @ITEM_DURABILITY		-- 내구성 ( 현재 아이템 중복 개수로 사용 ) 세팅
	, 	item_pyogukidx = 0				-- 표국 인덱스 세팅
	, 	item_munpaidx = 0				-- 문파 인덱스 세팅
	, 	ITEM_RAREIDX = @ITEM_RAREIDX			-- 레어 인덱스 세팅]

	where ITEM_DBIDX = @ITEM_DBIDX				-- 조건을 아이템 Database 인덱스 일치로 세팅

	RETURN							-- return 한다
GO
/****** Object:  StoredProcedure [dbo].[MP_ITEM_MoveUpdate]    Script Date: 07/30/2013 14:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080410 LUJ, 영역 정보가 바뀌어도 관계없도록 인자로 받도록 함
*/
CREATE  proc [dbo].[MP_ITEM_MoveUpdate]
/********************************************************************************
Description : [수정] 범위 트랙잭션 처리와 Re-Compile 제거, IF 구문 수정, 하나의 Plan 을 가진다.
Q)인덱스가 잡혀있는 컬럼에 업데이트한다.(인덱스 수준 Updating Not in Place)[새로운 테이블 디자인 고려]

Writer : 	Song. Hyok (hyok81@nate.com)
Date    : 	2005.02.21
*********************************************************************************/
(
		@FromIdx		int
	,	@FromPos		int
	,	@ToIdx		int
	,	@ToPos		int
	, 	@CharacterIDX	int
	,	@UserIdx	int
	,	@MunpaIdx	int
	,	@BEGIN_INVEN_POS	INT
	,	@END_INVEN_POS		INT
	,	@BEGIN_STORAGE_POS	INT
	,	@END_STORAGE_POS	INT
	,	@BEGIN_GUILD_STORAGE_POS	INT
	,	@END_GUILD_STORAGE_POS		INT
	,	@BEGIN_SHOP_ITEM_POS		INT
	,	@END_SHOP_ITEM_POS			INT	
)

as
	Set Nocount on
	SET xact_abort on

	--declare @useridx int
	--declare @munpaidx int


--	select @useridx = user_idx
--	, @munpaidx = character_munpaidx
--	from tb_character with(readuncommitted)  
--	where character_idx = @CharacterIDX

--BEGIN tran 
	
	/*
	-- 080410 LUJ, 쓰지 않는 코드 주석 처리
	update TB_SHOPITEMUSEINFO 
	set character_idx =@CharacterIDX 
	where item_dbidx = @FromIdx 
	and @FromPos BETWEEN 390 and 429
	*/

	--======================================
	update TB_ITEM 
	set 
	ITEM_POSITION = @FromPos
	, item_pyogukidx = 0
	, item_munpaidx = 0
	, item_shopidx = 0
	, character_idx =  @CharacterIDX 
	where  ITEM_DBIDX = @FromIdx

	IF @ToIdx = 0
	BEGIN
		RETURN
	END
		
	--인벤토리로 가면 캐릭터 인덱스를 셋팅	
	IF @ToPos BETWEEN @BEGIN_INVEN_POS AND @END_INVEN_POS
	BEGIN
		update TB_ITEM 
		set ITEM_POSITION = @ToPos
		, character_idx = @CharacterIDX
		, item_pyogukidx = 0
		, item_munpaidx = 0
		, ITEM_SHOPIDX=0
		where  ITEM_DBIDX = @ToIdx 
	END
	--창고로 가면 캐릭터 인덱스를 셋팅
	ELSE IF @ToPos BETWEEN @BEGIN_STORAGE_POS AND @END_STORAGE_POS
	BEGIN
		update TB_ITEM 
		set ITEM_POSITION = @ToPos
		, character_idx = 0
		,  item_pyogukidx = @useridx
		, item_munpaidx = 0
		, ITEM_SHOPIDX=0
		where  ITEM_DBIDX = @ToIdx  
	END
	/*
	-- 080509 LUJ, 유료 아이템 창고 이동을 근본적으로 막음
	--샵아이템인벤토리로 가면 캐릭터 인덱스를 셋팅
	ELSE IF @ToPos BETWEEN @BEGIN_SHOP_ITEM_POS AND @END_SHOP_ITEM_POS
	BEGIN
		update TB_ITEM 
		set ITEM_POSITION = @ToPos
		, character_idx = 0
		, item_pyogukidx = 0
		, item_munpaidx = 0
		, ITEM_SHOPIDX=@useridx
		where  ITEM_DBIDX = @ToIdx 
	END
	*/
	/*
	-- 080410 LUJ, 쓰지 않는 코드 주석 처리
	ELSE IF @ToPos BETWEEN 390 AND 429
	BEGIN
		update TB_ITEM 
		set ITEM_POSITION = @ToPos
		, character_idx = @CharacterIDX
		, item_pyogukidx = 0
		, item_munpaidx = 0
		, ITEM_SHOPIDX=0
		where  ITEM_DBIDX = @ToIdx 
	END
	*/
	--문파인벤토리
	ELSE IF @ToPos BETWEEN @BEGIN_GUILD_STORAGE_POS AND @END_GUILD_STORAGE_POS
	BEGIN
		update TB_ITEM 
		set ITEM_POSITION = @ToPos
		, character_idx = 0
		,  item_pyogukidx = 0
		,  item_munpaidx = @munpaidx
		, ITEM_SHOPIDX=0
		where  ITEM_DBIDX = @ToIdx 
	END
	ELSE IF @ToPos >= @END_GUILD_STORAGE_POS + 1
	BEGIN
		update TB_ITEM 
		set ITEM_POSITION = @ToPos
		, item_param=256
		where  ITEM_DBIDX = @ToIdx
	END
	
	/*
	-- 080410 LUJ, 이전 코드
	update TB_SHOPITEMUSEINFO 
	set character_idx =@CharacterIDX 
	where item_dbidx = @FromIdx 
	and @FromPos BETWEEN 390 and 429

	--======================================
	update TB_ITEM 
	set 
	ITEM_POSITION = @FromPos
	, item_pyogukidx = 0
	, item_munpaidx = 0
	, item_shopidx = 0
	, character_idx =  @CharacterIDX 
	where  ITEM_DBIDX = @FromIdx


	IF @ToIdx = 0
	BEGIN
		RETURN
	END
		
	--인벤토리로 가면 캐릭터 인덱스를 셋팅	
	IF @ToPos BETWEEN 0 AND 89
	BEGIN
		update TB_ITEM 
		set ITEM_POSITION = @ToPos
		, character_idx = @CharacterIDX
		, item_pyogukidx = 0
		, item_munpaidx = 0
		, ITEM_SHOPIDX=0
		where  ITEM_DBIDX = @ToIdx 
	END
	--샵아이템창고로 가면 캐릭터 인덱스를 셋팅
	ELSE IF @ToPos BETWEEN 90 AND 239
	BEGIN
		update TB_ITEM 
		set ITEM_POSITION = @ToPos
		, character_idx = 0
		,  item_pyogukidx = @useridx
		, item_munpaidx = 0
		, ITEM_SHOPIDX=0
		where  ITEM_DBIDX = @ToIdx  
	END
	--샵아이템인벤토리로 가면 캐릭터 인덱스를 셋팅
	ELSE IF @ToPos BETWEEN 240 AND 389
	BEGIN
		update TB_ITEM 
		set ITEM_POSITION = @ToPos
		, character_idx = 0
		, item_pyogukidx = 0
		, item_munpaidx = 0
		, ITEM_SHOPIDX=@useridx
		where  ITEM_DBIDX = @ToIdx 
	END
	ELSE IF @ToPos BETWEEN 390 AND 429
	BEGIN
		update TB_ITEM 
		set ITEM_POSITION = @ToPos
		, character_idx = @CharacterIDX
		, item_pyogukidx = 0
		, item_munpaidx = 0
		, ITEM_SHOPIDX=0
		where  ITEM_DBIDX = @ToIdx 
	END
	--문파인벤토리
	ELSE IF @ToPos BETWEEN 500 AND 559
	BEGIN
		update TB_ITEM 
		set ITEM_POSITION = @ToPos
		, character_idx = 0
		,  item_pyogukidx = 0
		,  item_munpaidx = @munpaidx
		, ITEM_SHOPIDX=0
		where  ITEM_DBIDX = @ToIdx 
	END
	ELSE IF @ToPos >= 560
	BEGIN
		update TB_ITEM 
		set ITEM_POSITION = @ToPos
		, item_param=256
		where  ITEM_DBIDX = @ToIdx
	END
	*/
	RETURN


IF ( @@ERROR <> 0 )
	Rollback
ELSE
	Commit
GO
/****** Object:  StoredProcedure [dbo].[MP_SHOPITEM_RARE_OPTION_Insert]    Script Date: 07/30/2013 14:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE	proc [dbo].[MP_SHOPITEM_RARE_OPTION_Insert]
(
	@CharIdx	int,
	@ItemIdx		int, 
	@ItemPosition	int,
	@item_dbidx	int,
	@Str		int,
	@Dex		int,
	@Vit		int,
	@Wis		int,
	@Life		int,
	@Mana		int,
	@FireAttrRegist	int,
	@WaterAttrRegist	int,
	@TreeAttrRegist	int,
	@GoldAttrRegist	int,
	@EarthAttrRegist	int,
	@PhyAttack	int,
	@FireAttrAttack	int,
	@WaterAttrAttack	int,
	@TreeAttrAttack	int,
	@GoldAttrAttack	int,
	@EarthAttrAttack	int,
	@PhyDefense	int
)
as
	set nocount on

	declare	@rare_dbidx	int

	insert TB_ITEM_RARE
	(
		ITEM_DBIDX, 
		Strength,
		Dexterity,
		Vitality,
		Wisdom,
		LIFE,
		Mana,
		FREGIST,
		WREGIST,
		TREGIST,
		GREGIST,
		EREGIST,
		PHYATTACK,
		FATTACK,
		WATTACK,
		TATTACK,
		GATTACK,
		EATTACK,
		PHYDEFENSE
	)
	values
	(
		@item_dbidx, 
		@Str, 
		@Dex,
		@Vit,
		@Wis,
		@Life,
		@Mana,
		@FireAttrRegist,
		@WaterAttrRegist,
		@TreeAttrRegist,
		@GoldAttrRegist,
		@EarthAttrRegist,
		@PhyAttack,
		@FireAttrAttack,
		@WaterAttrAttack,
		@TreeAttrAttack,
		@GoldAttrAttack,
		@EarthAttrAttack,
		@PhyDefense
	)

	select @rare_dbidx = @@identity

	update TB_ITEM set ITEM_RAREIDX = @rare_dbidx where ITEM_DBIDX = @item_dbidx

	select @CharIdx, @ItemIdx, @ItemPosition,
	* from TB_ITEM_RARE where RARE_DBIDX = @rare_dbidx
GO
/****** Object:  StoredProcedure [dbo].[TP_PetInfoUpdate]    Script Date: 07/30/2013 14:55:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** 개체: 저장 프로시저 dbo.TP_PetInfoUpdate    스크립트 날짜: 2006-06-30 오후 7:58:19 ******/
CREATE proc [dbo].[TP_PetInfoUpdate]
(
		@PetDBIdx		int
	,	@Rest		 	int
	,	@Alive	 		int
	,	@Grade		int
	,	@FriendShip 		int
	,	@Stamina		int
)
as
	set nocount on

	update tb_PetInfo set
		Rest = @Rest,
		Alive = @Alive,
		Grade = @Grade,
		FriendShip = @FriendShip,
		Stamina = @Stamina
	where PetDBIdx = @PetDBIdx
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_PetInfo]    Script Date: 07/30/2013 14:52:39 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE         PROCEDURE [dbo].[MP_CHARACTER_PetInfo]
(
	@UserIdx	int
)
AS
	Set Nocount On
	
--	if exists ( select count(*) from TB_PETINFO where MasterIdx = @CharacterIdx )
--	begin
	declare @PetSummon tinyint
	select @PetSummon = Summon from TB_PETINFO where MasterIdx = @UserIdx
	
	select PetDBIdx, MasterIdx, SummonItemDBIdx, Kind, Grade, Stamina, FriendShip, Alive, Summon, Rest
	from TB_PETINFO where MasterIdx = @UserIdx

	if( @PetSummon = 1 )
	begin
		update TB_PETINFO set Summon = 0, Rest = 0 where MasterIdx = @UserIdx 
	end

--	

--	end
--	else
--	begin
--		select @CharacterIdx, 0
--	end
GO
/****** Object:  StoredProcedure [dbo].[MP_PET_Update]    Script Date: 07/30/2013 14:54:10 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE    PROCEDURE [dbo].[MP_PET_Update]
(
	@UserIdx		int,
	@PetDBIdx		int,
	@PetGrade		int,
	@PetStamina		int,
	@PetFriendShip		int,
	@PetAlive		int,
	@PetSummon		int,
	@PetRest		int
)
AS
	Set Nocount On

	update TB_PETINFO
	set MasterIdx = @UserIdx, Grade = @PetGrade, Stamina = @PetStamina, FriendShip = @PetFriendShip,
	      Alive = @PetAlive, Summon = @PetSummon, Rest = @PetRest
	where PetDBIdx = @PetDBIdx
GO
/****** Object:  StoredProcedure [dbo].[MP_PET_Insert]    Script Date: 07/30/2013 14:54:09 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[MP_PET_Insert]
(
	@CharacterIdx		int,
	@UserIdx		int,
	@SummonItemIdx		int,
	@PetKind		int,
	@PetGrade		int,
	@PetStamina		int,
	@PetFriendShip		int,
	@PetSummonItemDBIdx	int,
	@PetAlive		int,
	@PetSummon		int,
	@PetRest		int
)
AS
	Set Nocount On
	
	declare @PetDBIdx	int

	select @PetDBIdx = PetDBIdx from TB_PETINFO where SummonItemDBIdx = @SummonItemIdx

	if( @PetDBIdx > 0 )
	begin
		select @SummonItemIdx, PetDBIdx, @CharacterIdx, MasterIdx, SummonItemDBIdx, Kind, Grade, Stamina, FriendShip, Alive, Summon, Rest
		from TB_PETINFO where PetDBIdx = @PetDBIdx
		return
	end
	else
	begin
		insert TB_PETINFO (MasterIdx, SummonItemDBIdx, Kind, Grade, Stamina, FriendShip, Alive, Summon, Rest)
		values(@UserIdx, @PetSummonItemDBIdx, @PetKind, @PetGrade, @PetStamina, @PetFriendShip, @PetAlive, @PetSummon, @PetRest)

		
		set @PetDBIdx = @@identity

		select @SummonItemIdx, PetDBIdx, @CharacterIdx, MasterIdx, SummonItemDBIdx, Kind, Grade, Stamina, FriendShip, Alive, Summon, Rest
		from TB_PETINFO where PetDBIdx = @PetDBIdx
		return
	end
GO
/****** Object:  StoredProcedure [dbo].[MP_PET_Delete]    Script Date: 07/30/2013 14:54:06 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[MP_PET_Delete]
(
	@PetDBIdx	int
)
AS
	Set Nocount On
	
	delete TB_PETINFO where PetDBIdx = @PetDBIdx
GO
/****** Object:  StoredProcedure [dbo].[RP_CharacterPyogukInfo]    Script Date: 07/30/2013 14:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 표국 정보 획득
CREATE   proc [dbo].[RP_CharacterPyogukInfo]
(
	@userIdx	int
)
as

	Set Nocount On

	select @useridx, pyoguknum, pyogukmoney from tb_pyoguk with(nolock) where user_idx = @userIdx
GO
/****** Object:  StoredProcedure [dbo].[RP_UpdatePyogukInfo]    Script Date: 07/30/2013 14:54:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[RP_UpdatePyogukInfo]
(
	@UserIdx	int,
	@PyogukNum	int,
	@Money		int
)
as

	set nocount on

	if EXISTS( select null from tb_pyoguk with(nolock) where User_IDX = @UserIdx )
	begin
		update tb_pyoguk set PyogukNum = @PyogukNum, PyogukMoney = @Money
		where User_IDX = @UserIdx
	end
	else
	begin
		insert into tb_pyoguk values(@UserIdx, @PyogukNum, @Money)
	end
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_SaveInfoBeforeLogOut]    Script Date: 07/30/2013 14:52:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     proc [dbo].[MP_CHARACTER_SaveInfoBeforeLogOut]
(
	@dwConnectiongidx int
,	@user_idx  int
	-- 081028 LYW : DB테이블에는 Money가 bigint 인데, 여기 프로시저에서는 int 형으로 처리하고 있다.
	-- 이로 인해, 창고에 일정금액 이상의 돈을 가지고 있을경우, [캐릭터 선택화면]으로 이동이 안되는 현상이 생긴다.
	-- int 를 bigint로 수정 후 테스트, 문제 없음을 확인.
	--,	@pyogukmoney int 
,	@pyogukmoney bigint

)
as
	Set Nocount on
--	Set Xact_abort on

	update tb_pyoguk
	set pyogukMoney = @pyogukmoney
	where user_idx = @user_idx 

	select @dwConnectiongidx
GO
/****** Object:  StoredProcedure [dbo].[MP_PYOGUK_Info]    Script Date: 07/30/2013 14:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[MP_PYOGUK_Info]
(
	@User_IDX	int
)

as

	Set Nocount On

	declare @pyogukmoney decimal
	declare @pyoguknum tinyint

	select @pyoguknum = PyogukNum, @pyogukmoney = PyogukMoney from tb_pyoguk where user_idx = @User_IDX
	if( @pyogukmoney ) < 0
		set @pyogukmoney = 0
	select @pyoguknum , @pyogukmoney
GO
/****** Object:  StoredProcedure [dbo].[MP_Pyoguk_MoneyUpdate]    Script Date: 07/30/2013 14:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_Pyoguk_MoneyUpdate] (@User_idx int, @PyogukMoney decimal )
as
	Set Nocount On


/*
--add
if ( @bType ) = 0 
	update tb_pyoguk set pyogukmoney = pyogukmoney + @ChangeMoney where User_IDX  = @User_idx
--sub
else 
begin
	update tb_pyoguk set pyogukmoney = pyogukmoney - @ChangeMoney where User_IDX  = @User_idx
end
*/

update tb_pyoguk set pyogukmoney = @PyogukMoney where User_IDX  = @User_idx
GO
/****** Object:  StoredProcedure [dbo].[MP_PYOGUK_UpdateInfo]    Script Date: 07/30/2013 14:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_PYOGUK_UpdateInfo]
(
		@User_Idx	int
	,	@PyogukNum	int
	,	@Money		int
)

as 
	Set Nocount on

update tb_pyoguk set PyogukNum = @PyogukNum, PyogukMoney = @Money
		where User_IDX = @User_idx
GO
/****** Object:  StoredProcedure [dbo].[MP_STORAGE_Info]    Script Date: 07/30/2013 14:54:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[MP_STORAGE_Info]
(
	@User_IDX	int
)

as

	Set Nocount On

	declare @pyogukmoney decimal
	declare @pyoguknum tinyint

	select @pyoguknum = PyogukNum, @pyogukmoney = PyogukMoney from tb_pyoguk where user_idx = @User_IDX
	if( @pyogukmoney ) < 0
		set @pyogukmoney = 0
	select @pyoguknum , @pyogukmoney
GO
/****** Object:  StoredProcedure [dbo].[MP_STORAGE_MoneyUpdate]    Script Date: 07/30/2013 14:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_STORAGE_MoneyUpdate] (@User_idx int, @PyogukMoney decimal )
as
	Set Nocount On


/*
--add
if ( @bType ) = 0 
	update tb_pyoguk set pyogukmoney = pyogukmoney + @ChangeMoney where User_IDX  = @User_idx
--sub
else 
begin
	update tb_pyoguk set pyogukmoney = pyogukmoney - @ChangeMoney where User_IDX  = @User_idx
end
*/

update tb_pyoguk set pyogukmoney = @PyogukMoney where User_IDX  = @User_idx
GO
/****** Object:  StoredProcedure [dbo].[MP_STORAGE_UpdateInfo]    Script Date: 07/30/2013 14:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_STORAGE_UpdateInfo]
(
		@User_Idx	int
	,	@PyogukNum	int
	,	@Money		int
)

as 
	Set Nocount on

update tb_pyoguk set PyogukNum = @PyogukNum, PyogukMoney = @Money
		where User_IDX = @User_idx
GO
/****** Object:  StoredProcedure [dbo].[MP_QUEST_Update]    Script Date: 07/30/2013 14:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[MP_QUEST_Update]
(
		@character_idx	int
	,	@quest_idx	int
	,	@quest_state	int
	,	@complete	int
)

as

	Set Nocount on


if (@complete != 0)
	begin
	update tb_quest set quest_state = @quest_state
			where character_idx = @character_idx and quest_idx = @quest_idx
	end
else
	begin
	update tb_quest set quest_state = @quest_state, complete_time = getdate()
			where character_idx = @character_idx and quest_idx = @quest_idx
	end
GO
/****** Object:  StoredProcedure [dbo].[MP_QUEST_TotalInfo]    Script Date: 07/30/2013 14:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[MP_QUEST_TotalInfo]
(
	@character_idx	int
)


as
	Set Nocount on
	select quest_idx, quest_state from tb_quest with(nolock) where character_idx = @character_idx
GO
/****** Object:  StoredProcedure [dbo].[MP_QUESTITEM_Delete]    Script Date: 07/30/2013 14:54:16 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE proc [dbo].[MP_QUESTITEM_Delete]
(
	@CHARACTER_IDX	int,
	@ITEM_IDX		int
)
as
	set nocount on

	delete TB_QUESTITEM where CHARACTER_IDX=@CHARACTER_IDX and ITEM_IDX=@ITEM_IDX
GO
/****** Object:  StoredProcedure [dbo].[MP_QUESTITEM_Load]    Script Date: 07/30/2013 14:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
070920 웅주. 
퀘스트 아이템을 100개 이상 읽을 수 있도록 묵향 프로시저를 적용함
*/
CREATE proc [dbo].[MP_QUESTITEM_Load]
(
	@CHARACTER_IDX		int,
	@QUEST_IDX		int
)
as
	Set Nocount on

		select ITEM_IDX, ITEM_COUNT
		from TB_QUESTITEM with(nolock) where CHARACTER_IDX = @CHARACTER_IDX and QUEST_IDX > @QUEST_IDX
		order by QUEST_IDX
	
	

/*
-- 예전 코드
ALTER proc dbo.MP_QUESTITEM_Load
(
	@CHARACTER_IDX			int
)
as
	Set Nocount on

if not exists    (select null from TB_MAINQUEST with(nolock) where CHARACTER_IDX = @CHARACTER_IDX) 
	begin
		return
	end
else
	begin 
		select ITEM_IDX, ITEM_COUNT
			 from TB_QUESTITEM with(nolock) where CHARACTER_IDX = @CHARACTER_IDX
		return
	end
*/
GO
/****** Object:  StoredProcedure [dbo].[MP_QUESTITEM_Update]    Script Date: 07/30/2013 14:54:17 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- [ 080103 LYW ] : 퀘스트 아이템 업데이트 프로시저를 수정함.
	--
	-- 퀘스트 아이템 업데이트 프로시저는, 플레이어가 퀘스트 아이템을 획득 할 때에만 
	--
	-- 쓰이고 있으므로, 퀘스트 아이템의 증가의 용도로만 사용한다.
	--
	-- 때문에, 이전에 있는 퀘스트 아이템의 수 보다, 작은 수가 넘어온다면,
	--
	-- 업데이트를 하지 않고 그냥 넘겨버린다.
	--
	-- ----------------------------------------------------------------------------
	-- 예) 50개 아이템을 모으면 퀘스트가 완료 조건이 되는 퀘스트가 있다.
	--
	-- A - 아이템 개수를 49개로 세팅한다.
	-- B - 아이템 개수를 50개로 세팅하고 퀘스트 완료 조건으로 세팅한다.
	--
	-- 주어진 예제에서 프로시저 실행이, A - B 의 순서가 아닌 B - A 의 순서가 될 때,
	--
	-- 문제의 발생 요지가 있기에, 현재 아이템 개수 이하의 개수가 들어오면, return 처리를 한다.
	-- ----------------------------------------------------------------------------
	--
	-- 

	CREATE   proc [dbo].[MP_QUESTITEM_Update]
	(
		@CHARACTER_IDX	int,		-- 업데이트 할 캐릭터 인덱스
		@ITEM_IDX		int,		-- 업데이트 할 아이템 인덱스
		@ITEM_COUNT		int,		-- 업데이트 할 아이템 카운트
		@QUEST_IDX		int		-- 업데이트 할 퀘스트 인덱스
	)
	as
	Set Nocount On	-- Transact-SQL 문의 영향을 받은 행 수를 나타내는 수가 반환되지 않도록 설정한다.

	------------------------------------------------------------------------------------------------------
	declare @CUR_COUNT	int			-- 현재 아이템의 개수를 받을 변수를 선언한다.

	select @CUR_COUNT = item_count 			-- 현재 퀘스트 아이템 개수를 받는다.

	from TB_QUESTITEM 				-- 퀘스트 아이템 테이블에서,

	where 	CHARACTER_IDX = @CHARACTER_IDX 	-- 조건을 캐릭터 인덱스, 
	and 	ITEM_IDX = @ITEM_IDX 			-- 아이템 인덱스
	and 	QUEST_IDX = @QUEST_IDX		-- 퀘스트 인덱스의 일치로 한다.

	------------------------------------------------------------------------------------------------------

	IF @ITEM_COUNT <= @CUR_COUNT			-- 인자로 넘어온 아이템 카운트가 현재 아이템 개수 이하면,
	
	return						-- return 처리를 한다.

	------------------------------------------------------------------------------------------------------
	ELSE						-- 인자로 넘어온 아이템 카운트가 현재 아이템 수 보다 많으면,

	update TB_QUESTITEM 	 			-- 퀘스트 아이템 테이블을 업데이트 한다.

	set ITEM_COUNT = @ITEM_COUNT			-- 업데이트 대상은 아이템 카운트 이다.

	where 	CHARACTER_IDX = @CHARACTER_IDX 	-- 조건을 캐릭터 인덱스,
	and 	ITEM_IDX = @ITEM_IDX 			-- 아이템 인덱스,
	and 	QUEST_IDX = @QUEST_IDX		-- 퀘스트 인덱스의 일치로 한다.
GO
/****** Object:  StoredProcedure [dbo].[MP_QUESTITEM_Insert]    Script Date: 07/30/2013 14:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[MP_QUESTITEM_Insert]
(
	@CHARACTER_IDX	int,
	@ITEM_IDX		int,
	@ITEM_COUNT	int,
	@QUEST_IDX		int
)
as
	set nocount on
	Set Xact_Abort on

	insert TB_QUESTITEM
	(
		CHARACTER_IDX,
		ITEM_IDX,
		ITEM_COUNT,
		QUEST_IDX
	)
	values
	(
		@CHARACTER_IDX,
		@ITEM_IDX,
		@ITEM_COUNT,
		@QUEST_IDX
	)


	--select * from TB_QUESTITEM with(nolock) where CHARACTER_IDX=@CHARACTER_IDX  and ITEM_IDX=@ITEM_IDX
GO
/****** Object:  StoredProcedure [dbo].[MP_QUESTITEM_Delete_All]    Script Date: 07/30/2013 14:54:16 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE proc [dbo].[MP_QUESTITEM_Delete_All]
(
	@CHARACTER_IDX	int,
	@QUEST_IDX		int
)
as
	set nocount on

	delete TB_QUESTITEM where CHARACTER_IDX=@CHARACTER_IDX and QUEST_IDX=@QUEST_IDX
GO
/****** Object:  StoredProcedure [dbo].[TP_QUEST_ITEM_SELECT]    Script Date: 07/30/2013 14:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080102 웅주, 추가
*/
CREATE PROCEDURE [dbo].[TP_QUEST_ITEM_SELECT]
(
	@CHAR_IDX	INT,
	@QUEST_IDX	INT
)
AS
	SET NOCOUNT ON
	
	SELECT		TOP 100
				ITEM_IDX,
				ITEM_COUNT,
				QUEST_IDX,
				@CHAR_IDX
	FROM		TB_QUESTITEM WITH(NOLOCK)
	WHERE		CHARACTER_IDX = @CHAR_IDX AND QUEST_IDX > @QUEST_IDX
	ORDER BY	QUEST_IDX
		
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_QUEST_ITEM_DELETE]    Script Date: 07/30/2013 14:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주, 퀘스트 아이템 삭제
*/
CREATE PROCEDURE [dbo].[TP_QUEST_ITEM_DELETE]
(
	@CHAR_IDX	INT,
	@QUEST_IDX	INT,
	@ITEM_IDX	INT
)
AS
	SET NOCOUNT ON
	
	DELETE FROM TB_QUESTITEM
	WHERE   (CHARACTER_IDX = @CHAR_IDX) AND (ITEM_IDX = @ITEM_IDX) AND 
	                (QUEST_IDX = @QUEST_IDX)
	                
	IF 0 = @@ROWCOUNT
	BEGIN
		SELECT 0
		RETURN
	END
	
	SELECT 1, @ITEM_IDX
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_QUEST_ITEM_UPDATE]    Script Date: 07/30/2013 14:55:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주, 퀘스트 아이템 개수 변경
*/
CREATE PROCEDURE [dbo].[TP_QUEST_ITEM_UPDATE]
(
	@CHAR_IDX	INT,
	@QUEST_IDX	INT,
	@ITEM_IDX	INT,
	@SIZE		INT
)
AS
	SET NOCOUNT ON
	
	UPDATE  TB_QUESTITEM
	SET     ITEM_COUNT = @SIZE
	WHERE   (CHARACTER_IDX = @CHAR_IDX) AND
			(ITEM_IDX = @ITEM_IDX) AND 
	        (QUEST_IDX = @QUEST_IDX)
	        
	IF 0 = @@ROWCOUNT
	BEGIN
		SELECT 0
		RETURN
	END
	
	SELECT  1, @ITEM_IDX, @SIZE	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[StoredProcedure2]    Script Date: 07/30/2013 14:54:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StoredProcedure2]
(
	@CHAR_IDX	INT,
	@QUEST_IDX	INT
)
AS
	SET NOCOUNT ON
	
	SELECT		TOP 100
				ITEM_IDX, ITEM_COUNT
	FROM		TB_QUESTITEM WITH(NOLOCK)
	WHERE		CHARACTER_IDX = @CHAR_IDX AND QUEST_IDX > @QUEST_IDX
	ORDER BY	QUEST_IDX
		
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_QUICK_Info]    Script Date: 07/30/2013 14:54:17 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_QUICK_Info]
(
	@CHARACTER_IDX	int
)

as
	Set Nocount On
	Set Xact_Abort On

if not exists ( select null from TB_QUICK where CHARACTER_IDX = @CHARACTER_IDX)
	begin
		select 0, @CHARACTER_IDX
		return
	end
else
	begin 
		select * from TB_QUICK with(nolock) where CHARACTER_IDX = @CHARACTER_IDX
		return
	end
GO
/****** Object:  StoredProcedure [dbo].[MP_QUICK_Update]    Script Date: 07/30/2013 14:54:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_QUICK_Update]
(
	@CHARACTER_IDX	int,
	@SHEET	tinyint,
	@KIND_1	tinyint,
	@DB_IDX_1	int,
	@IDX_1	int,
	@DATA_1	smallint,
	@KIND_2	tinyint,
	@DB_IDX_2	int,
	@IDX_2	int,
	@DATA_2	smallint,
	@KIND_3	tinyint,
	@DB_IDX_3	int,
	@IDX_3	int,
	@DATA_3	smallint,
	@KIND_4	tinyint,
	@DB_IDX_4	int,
	@IDX_4	int,
	@DATA_4	smallint,
	@KIND_5	tinyint,
	@DB_IDX_5	int,
	@IDX_5	int,
	@DATA_5	smallint,
	@KIND_6	tinyint,
	@DB_IDX_6	int,
	@IDX_6	int,
	@DATA_6	smallint,
	@KIND_7	tinyint,
	@DB_IDX_7	int,
	@IDX_7	int,
	@DATA_7	smallint,
	@KIND_8	tinyint,
	@DB_IDX_8	int,
	@IDX_8	int,
	@DATA_8	smallint,
	@KIND_9	tinyint,
	@DB_IDX_9	int,
	@IDX_9	int,
	@DATA_9	smallint,
	@KIND_10	tinyint,
	@DB_IDX_10	int,
	@IDX_10	int,
	@DATA_10	smallint
)

as
	Set Nocount On
	Set Xact_Abort On

if not exists (select * from TB_QUICK where CHARACTER_IDX = @CHARACTER_IDX and SHEET = @SHEET)
begin
	insert	TB_QUICK
	(
		CHARACTER_IDX
	,	SHEET
	,	KIND_1
	,	DB_IDX_1
	,	IDX_1
	,	DATA_1
	,	KIND_2
	,	DB_IDX_2
	,	IDX_2
	,	DATA_2
	,	KIND_3
	,	DB_IDX_3
	,	IDX_3
	,	DATA_3
	,	KIND_4
	,	DB_IDX_4
	,	IDX_4
	,	DATA_4
	,	KIND_5
	,	DB_IDX_5
	,	IDX_5
	,	DATA_5
	,	KIND_6
	,	DB_IDX_6
	,	IDX_6
	,	DATA_6
	,	KIND_7
	,	DB_IDX_7
	,	IDX_7
	,	DATA_7
	,	KIND_8
	,	DB_IDX_8
	,	IDX_8
	,	DATA_8
	,	KIND_9
	,	DB_IDX_9
	,	IDX_9
	,	DATA_9
	,	KIND_10
	,	DB_IDX_10
	,	IDX_10
	,	DATA_10
	)
	values
	(
		@CHARACTER_IDX
	,	@SHEET
	,	@KIND_1
	,	@DB_IDX_1
	,	@IDX_1
	,	@DATA_1
	,	@KIND_2
	,	@DB_IDX_2
	,	@IDX_2
	,	@DATA_2
	,	@KIND_3
	,	@DB_IDX_3
	,	@IDX_3
	,	@DATA_3
	,	@KIND_4
	,	@DB_IDX_4
	,	@IDX_4
	,	@DATA_4
	,	@KIND_5
	,	@DB_IDX_5
	,	@IDX_5
	,	@DATA_5
	,	@KIND_6
	,	@DB_IDX_6
	,	@IDX_6
	,	@DATA_6
	,	@KIND_7
	,	@DB_IDX_7
	,	@IDX_7
	,	@DATA_7
	,	@KIND_8
	,	@DB_IDX_8
	,	@IDX_8
	,	@DATA_8
	,	@KIND_9
	,	@DB_IDX_9
	,	@IDX_9
	,	@DATA_9
	,	@KIND_10
	,	@DB_IDX_10
	,	@IDX_10
	,	@DATA_10
	)
end
else
begin
	update TB_QUICK	set
	
		CHARACTER_IDX	=	@CHARACTER_IDX
	,	SHEET			=	@SHEET
	,	KIND_1			=	@KIND_1
	,	DB_IDX_1		=	@DB_IDX_1
	,	IDX_1			=	@IDX_1
	,	DATA_1		=	@DATA_1
	,	KIND_2			=	@KIND_2
	,	DB_IDX_2		=	@DB_IDX_2
	,	IDX_2			=	@IDX_2
	,	DATA_2		=	@DATA_2
	,	KIND_3			=	@KIND_3
	,	DB_IDX_3		=	@DB_IDX_3
	,	IDX_3			=	@IDX_3
	,	DATA_3		=	@DATA_3
	,	KIND_4			=	@KIND_4
	,	DB_IDX_4		=	@DB_IDX_4
	,	IDX_4			=	@IDX_4
	,	DATA_4		=	@DATA_4
	,	KIND_5			=	@KIND_5
	,	DB_IDX_5		=	@DB_IDX_5
	,	IDX_5			=	@IDX_5
	,	DATA_5		=	@DATA_5
	,	KIND_6			=	@KIND_6
	,	DB_IDX_6		=	@DB_IDX_6
	,	IDX_6			=	@IDX_6
	,	DATA_6		=	@DATA_6
	,	KIND_7			=	@KIND_7
	,	DB_IDX_7		=	@DB_IDX_7
	,	IDX_7			=	@IDX_7
	,	DATA_7		=	@DATA_7
	,	KIND_8			=	@KIND_8
	,	DB_IDX_8		=	@DB_IDX_8
	,	IDX_8			=	@IDX_8
	,	DATA_8		=	@DATA_8
	,	KIND_9			=	@KIND_9
	,	DB_IDX_9		=	@DB_IDX_9
	,	IDX_9			=	@IDX_9
	,	DATA_9		=	@DATA_9
	,	KIND_10		=	@KIND_10
	,	DB_IDX_10		=	@DB_IDX_10
	,	IDX_10			=	@IDX_10
	,	DATA_10		=	@DATA_10
	
	where CHARACTER_IDX = @CHARACTER_IDX and SHEET = @SHEET
end
GO
/****** Object:  StoredProcedure [dbo].[TP_PLAYER_LICENSE_UPDATE]    Script Date: 07/30/2013 14:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_PLAYER_LICENSE_UPDATE]
(
	@CHAR_IDX	INT,
	@AGE		INT,
	@LOCATION	INT,
	@FAVOR		INT,
	@LIKE1		INT,
	@LIKE2		INT,
	@LIKE3		INT,
	@DISLIKE1		INT,
	@DISLIKE2		INT
)
AS
	SET NOCOUNT ON
	
	UPDATE  TB_RESIDENTREGIST
	SET     Age = @AGE,
			Location = @LOCATION,
			Favor = @FAVOR,
			PropensityLike01 = @LIKE1,
			PropensityLike02 = @LIKE2, 
			PropensityLike03 = @LIKE3,
			PropensityDisLike01 = @DISLIKE1,
			PropensityDisLike02 = @DISLIKE2
	WHERE   (PlayerID = @CHAR_IDX)
	
	IF 0 < @@ROWCOUNT
	BEGIN
		SELECT @CHAR_IDX
	END
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_RESIDENTREGIST_SaveInfo]    Script Date: 07/30/2013 14:54:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
--주민등록 정보 저장
CREATE   PROC [dbo].[MP_RESIDENTREGIST_SaveInfo] (@PlayerID int, 
							@NickName varchar(16), 
							@Sex int, 
							@Age int, 
							@Location int, 
							@Favor int, 
							@PropensityLike01 int, 
							@PropensityLike02 int, 
							@PropensityLike03 int, 
							@PropensityDisLike01 int, 
							@PropensityDisLike02 int)
as
	Set Nocount on
	Set Xact_abort on

begin
	-- 레코드가 생성되어 있지 않으면 Insert
	if not exists (select null from TB_RESIDENTREGIST where PlayerID = @PlayerID)
	begin
		insert TB_RESIDENTREGIST
			(
			PlayerID,
			NickName,
			Sex,
			Age,
			Location,
			Favor,
			PropensityLike01,
			PropensityLike02,
			PropensityLike03,
			PropensityDisLike01,
			PropensityDisLike02
			)
		values
			(
			@PlayerID,
			@NickName,
			@Sex,
			@Age,
			@Location,
			@Favor,
			@PropensityLike01,
			@PropensityLike02,
			@PropensityLike03,
			@PropensityDisLike01,
			@PropensityDisLike02
			)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_RESIDENTREGIST_Reset]    Script Date: 07/30/2013 14:54:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE    proc [dbo].[MP_RESIDENTREGIST_Reset]
(
	@ID	int
)
as
	set nocount on
	set xact_abort on

	delete TB_RESIDENTREGIST where  PlayerID=@ID
GO
/****** Object:  StoredProcedure [dbo].[MP_RESIDENTREGIST_LoadInfo]    Script Date: 07/30/2013 14:54:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 주민등록 정보를 DB에서 읽어옴
CREATE PROC [dbo].[MP_RESIDENTREGIST_LoadInfo] (@PlayerID int)
as
	Set Nocount on
	Set Xact_abort on

begin
	-- 레코드가 생성되어 있지 않으면return
	--if not exists (select null from TB_RESIDENTREGIST where PlayerID = @PlayerID)
	--begin
	--	return
	--end
	-- 레코드가 생성되어 있으면 read
	--else 
	--begin
		-- 현재 년도 얻기
		declare @YearCur  int
		set @YearCur = 2007
		select @YearCur = datepart(year, getdate())

		-- 생성 년도 얻기
		-- ..생성 날짜 얻기
		declare @CreateDate smalldatetime
		set @CreateDate = getdate()
		select @CreateDate = CreateDate from TB_RESIDENTREGIST with(nolock) where PlayerID = @PlayerID
		-- ..생성 년도 얻기
		declare @YearCreate int
		set @YearCreate = 2007
		select @YearCreate = datepart(year,  @CreateDate)
		
		-- 생성 후 흐른 년 수
		declare @YearPast int
		set @YearPast = 0
		select @YearPast = @YearCur - @YearCreate

		select NickName, Sex, Age+@YearPast, Location, Favor, PropensityLike01, PropensityLike02, PropensityLike03, 
		          PropensityDisLike01, PropensityDisLike02, Introduction
		from TB_RESIDENTREGIST with(nolock) where PlayerID = @PlayerID
	--end
end

/*
SELECT   *
FROM      TB_CHARACTER
WHERE   (CHARACTER_IDX = 1717)

SELECT   TB_RESIDENTREGIST.Age, TB_CHARACTER.CHARACTER_NAME, 
                TB_RESIDENTREGIST.PropensityLike01, 
                TB_RESIDENTREGIST.PropensityLike02, 
                TB_RESIDENTREGIST.PropensityLike03, 
                TB_RESIDENTREGIST.PropensityDisLike01, 
                TB_RESIDENTREGIST.PropensityDisLike02, 
                TB_RESIDENTREGIST.NickName
FROM      TB_RESIDENTREGIST INNER JOIN
                TB_CHARACTER ON 
                TB_RESIDENTREGIST.PlayerID = TB_CHARACTER.CHARACTER_IDX
WHERE   (TB_RESIDENTREGIST.Age = 44)
*/
GO
/****** Object:  StoredProcedure [dbo].[MP_RESIDENTREGIST_UpdateIntroduction]    Script Date: 07/30/2013 14:54:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
--데이트매칭 자기소개 정보 저장
CREATE   PROC [dbo].[MP_RESIDENTREGIST_UpdateIntroduction] (@PlayerID int, 
								  @Introduction varchar(300))
as
	Set Nocount on
	Set Xact_abort on

begin
	-- 레코드가 생성되어 있지 않으면 return
	if not exists (select null from TB_RESIDENTREGIST where PlayerID = @PlayerID)
		return
	else
	begin
		update TB_RESIDENTREGIST set Introduction = @Introduction where PlayerID = @PlayerID
	end
end
GO
/****** Object:  StoredProcedure [dbo].[TP_PLAYER_LICENSE_SELECT]    Script Date: 07/30/2013 14:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_PLAYER_LICENSE_SELECT]
(
	@CHAR_IDX INT
)
AS
	SET NOCOUNT ON
	
	SELECT  PlayerID,
			Sex,
			Age,
			Location,
			Favor,
			PropensityLike01,
			PropensityLike02,
			PropensityLike03,
			PropensityDisLike01,
			PropensityDisLike02
	FROM    TB_RESIDENTREGIST
	WHERE   (PlayerID = @CHAR_IDX)
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_ITEM_OPTION_DELETE]    Script Date: 07/30/2013 14:53:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080125 웅주,TB_ITEM_DROP_OPTION에서도 값을 지우도록 함
*/
CREATE PROCEDURE [dbo].[MP_ITEM_OPTION_DELETE]
(
	@ITEM_DBIDX	INT
)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON

	DELETE TB_ITEM_OPTION2 WHERE ITEM_DBIDX = @ITEM_DBIDX
	DELETE TB_ITEM_DROP_OPTION WHERE ITEM_DBIDX = @ITEM_DBIDX
	
	RETURN

	
/*
-- 예전 코드
ALTER PROCEDURE dbo.MP_ITEM_OPTION_DELETE
(
	@optionIdx	int,
	@itemdbidx	int
)
as
	set nocount on
	set xact_abort on

if not exists ( select null from tb_Item_option  where option_dbIdx = @optionIdx )
begin
	insert hs_optiondelete
	(
	item_dbidx,
	option_dbidx,
	regdate
	)
	values
	(
	@itemdbidx,
	@optionIdx,
	getdate()
	)
end
	
else
begin
	delete tb_Item_option where item_dbidx = @itemdbidx and option_dbIdx = @optionIdx
end
*/
GO
/****** Object:  StoredProcedure [dbo].[MP_ITEM_DROP_OPTION_INSERT]    Script Date: 07/30/2013 14:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080125 웅주, 아이템을 드롭할 때 랜덤으로 붙는 옵션
080328 LUJ, 프로그램에서 로그 남기도록 처리하고 이를 주석처리 함
*/
CREATE PROCEDURE [dbo].[MP_ITEM_DROP_OPTION_INSERT]
(
	@ITEM_DBIDX	INT,
	@KEY1		INT,
	@VALUE1		FLOAT,
	@KEY2		INT,
	@VALUE2		FLOAT,
	@KEY3		INT,
	@VALUE3		FLOAT,
	@KEY4		INT,
	@VALUE4		FLOAT,
	@KEY5		INT,
	@VALUE5		FLOAT
)
AS
	SET NOCOUNT ON
	
	UPDATE  TB_ITEM_DROP_OPTION
	SET		KEY1	= @KEY1,
			VALUE1	= @VALUE1,
			KEY2	= @KEY2,
			VALUE2	= @VALUE2, 
	        KEY3	= @KEY3,
	        VALUE3	= @VALUE3,
	        KEY4	= @KEY4,
	        VALUE4	= @VALUE4, 
	        KEY5	= @KEY5,
	        VALUE5	= @VALUE5
	WHERE	ITEM_DBIDX = @ITEM_DBIDX
	
	-- 업데이트된 레코드가 없을 경우 삽입해야 한다	
	IF 0 = @@ROWCOUNT
	BEGIN
		INSERT INTO		TB_ITEM_DROP_OPTION
					(ITEM_DBIDX, KEY1, VALUE1, KEY2, VALUE2, KEY3, VALUE3, KEY4, VALUE4, KEY5, VALUE5)
		VALUES			(@ITEM_DBIDX, @KEY1, @VALUE1, @KEY2, @VALUE2, @KEY3, @VALUE3, @KEY4, @VALUE4, @KEY5, @VALUE5)
	END
	
	/*
	080320 LUJ, 로그를 남기지 않아 임시 방편으로 사용한 방법. 이후에는 소스 코드에서 로그를 쓰도록 하자
	080328 LUJ, 프로그램에서 로그 남기도록 처리하고 이를 주석처리 함
	*/
	/*
	INSERT INTO	LUNA_LOGDB.DBO.TB_ITEM_DROP_OPTION_LOG
				( TYPE, ITEM_DBIDX, KEY1, VALUE1, KEY2, VALUE2, KEY3, VALUE3, KEY4, VALUE4, KEY5, VALUE5 )
	VALUES		( 0, @ITEM_DBIDX, @KEY1, @VALUE1, @KEY2, @VALUE2, @KEY3, @VALUE3, @KEY4, @VALUE4, @KEY5, @VALUE5 )
	*/
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_CHAT_LOADINFO]    Script Date: 07/30/2013 14:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------
--
--	NAME 		: MP_CHAT_LOADINFO
--	PURPOSE	: Load all information for chatting.
--
--	PROGRAMMER	: Yongs Lee
--	DATE		: February 20, 2008
--
---------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[MP_CHAT_LOADINFO] AS

SET 	NOCOUNT 	ON	-- SQL 문의 영향을 받은 행 수를 나타내는 수가 반환되지 않습니다. 
SET 	XACT_ABORT 	ON	-- SQL 문에서 런타임 오류가 발생할 경우 전체 트랜잭션이 종료된 후 롤백됩니다.


IF NOT EXISTS ( SELECT NULL FROM TB_CHATTING_INFO )
BEGIN
	RETURN
END

SELECT TOP 100 * FROM TB_CHATTING_INFO

RETURN


DECLARE @NUMBER FLOAT
SET @NUMBER = 0.0134420232131

SELECT ROUND( @NUMBER + 0.001, 3 )

UPDATE	TB_ITEM_DROP_OPTION
SET		VALUE1 = ROUND( VALUE1 + 0.001, 3 ),
		VALUE2 = ROUND( VALUE2 + 0.001, 3 ),
		VALUE3 = ROUND( VALUE3 + 0.001, 3 ),
		VALUE4 = ROUND( VALUE4 + 0.001, 3 ),
		VALUE5 = ROUND( VALUE5 + 0.001, 3 )
GO
/****** Object:  StoredProcedure [dbo].[MP_MOVEPOINT_GetInfo]    Script Date: 07/30/2013 14:53:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE              proc [dbo].[MP_MOVEPOINT_GetInfo]
(
		@Character_IDX		int
)

as
set Nocount On

	select  POINT_DBIDX, SAVE_NAME, MAP_NUM, MAP_POINT
	from TB_SAVEDMOVEPOINT with(readuncommitted) 
	where CHARACTER_IDX= @Character_IDX
GO
/****** Object:  StoredProcedure [dbo].[MP_MOVEPOINT_Insert]    Script Date: 07/30/2013 14:53:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE         proc [dbo].[MP_MOVEPOINT_Insert] ( @CHARACTER_IDX int, @POINTNAME varchar(21), @MAPNUM int, @MAPPOINT int)

as
	Set Nocount on

	declare @POINT_DBIDX int

	insert into TB_SAVEDMOVEPOINT (CHARACTER_IDX, SAVE_NAME, MAP_NUM, MAP_POINT)
	values (@CHARACTER_IDX, @POINTNAME, @MAPNUM, @MAPPOINT)


--	select @POINT_DBIDX = @@identity --다른 범위의 값도 가지고 올수 있습니다.
	select @POINT_DBIDX =SCOPE_IDENTITY() --동일 범위에tj 처러

	select POINT_DBIDX, SAVE_NAME, MAP_NUM, MAP_POINT
	from TB_SAVEDMOVEPOINT with(readuncommitted)  where POINT_DBIDX = @POINT_DBIDX
GO
/****** Object:  StoredProcedure [dbo].[MP_MOVEPOINT_Update]    Script Date: 07/30/2013 14:53:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[MP_MOVEPOINT_Update] ( @CHARACTER_IDX int, @DBIDX int, @POINTNAME varchar(21) )

as
	Set Nocount on
	update TB_SAVEDMOVEPOINT set SAVE_NAME=@POINTNAME  where POINT_DBIDX = @DBIDX
GO
/****** Object:  StoredProcedure [dbo].[MP_MOVEPOINT_Delete]    Script Date: 07/30/2013 14:53:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[MP_MOVEPOINT_Delete] ( @CHARACTER_IDX int, @DBIDX int )

as
	Set Nocount on

	delete TB_SAVEDMOVEPOINT where POINT_DBIDX=@DBIDX
GO
/****** Object:  StoredProcedure [dbo].[TP_SCRIPT_HACK_LOG_INSERT]    Script Date: 07/30/2013 14:55:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
090109 LUJ, 스크립트 해킹으로 의심되는 사용자를 등록한다
*/
CREATE  PROCEDURE [dbo].[TP_SCRIPT_HACK_LOG_INSERT]
(
	@USER_IDX	INT,
	@CHAR_IDX	INT
)
AS
	SET NOCOUNT ON
	
	INSERT	INTO	TB_SCRIPT_HACK_LOG
			( USER_IDX, CHAR_IDX )
	VALUES		( @USER_IDX, @CHAR_IDX )
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_SHOPITEM_Using_JP]    Script Date: 07/30/2013 14:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE           proc [dbo].[MP_SHOPITEM_Using_JP]
(
 @USER_IDX int,
 @CHARACTER_IDX int,
 @ITEM_IDX int, 
 @ITEM_DBIDX int,
 @PARAM int, 
 @STARTTIME int,
 @REMAINTIME int 
)
as
Set Nocount on
	
               if exists (select * from TB_SHOPITEMUSEINFO where (USER_IDX = @USER_IDX) and (CHARACTER_IDX = @CHARACTER_IDX) and (ITEM_IDX = @ITEM_IDX) )
		update TB_SHOPITEMUSEINFO
		set ITEM_DBIDX=@ITEM_DBIDX, ITEM_PARAM=@PARAM, BEGIN_TIME=@STARTTIME, REMAIN_TIME=@REMAINTIME
		where USER_IDX=@USER_IDX and CHARACTER_IDX=@CHARACTER_IDX and ITEM_IDX=@ITEM_IDX
	else
		insert into TB_SHOPITEMUSEINFO (USER_IDX, CHARACTER_IDX, ITEM_IDX, ITEM_DBIDX, ITEM_PARAM, BEGIN_TIME, REMAIN_TIME)
		values (@USER_IDX, @CHARACTER_IDX, @ITEM_IDX, @ITEM_DBIDX, @PARAM, @STARTTIME, @REMAINTIME)
GO
/****** Object:  StoredProcedure [dbo].[MP_SHOPITEM_Using]    Script Date: 07/30/2013 14:54:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_SHOPITEM_Using]
( 
 @CHARACTER_IDX int,
 @ITEM_IDX int, 
 @USER_IDX int,
 @ITEM_DBIDX int,
 @PARAM int, 
 @STARTTIME int,
 @REMAINTIME int 
)
as
Set Nocount on
	
               if exists (select * from TB_SHOPITEMUSEINFO where (CHARACTER_IDX = @CHARACTER_IDX) and (ITEM_IDX = @ITEM_IDX) )
		update TB_SHOPITEMUSEINFO
		set ITEM_DBIDX=@ITEM_DBIDX, USER_IDX = @USER_IDX, ITEM_PARAM=@PARAM, BEGIN_TIME=@STARTTIME, REMAIN_TIME=@REMAINTIME
		where CHARACTER_IDX=@CHARACTER_IDX and ITEM_IDX=@ITEM_IDX
	else
		insert into TB_SHOPITEMUSEINFO (CHARACTER_IDX, USER_IDX, ITEM_IDX, ITEM_DBIDX, ITEM_PARAM, BEGIN_TIME, REMAIN_TIME)
		values (@CHARACTER_IDX, @ITEM_IDX, @USER_IDX, @ITEM_DBIDX, @PARAM, @STARTTIME, @REMAINTIME)
GO
/****** Object:  StoredProcedure [dbo].[MP_SHOPITEM_UpdateUseParam_JP]    Script Date: 07/30/2013 14:54:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE           proc [dbo].[MP_SHOPITEM_UpdateUseParam_JP] ( @USER_IDX int, @CHARACTERIDX int, @ITEMIDX int, @ITEMPARAM int )

as
	Set Nocount on
--	Set Xact_Abort on


update TB_SHOPITEMUSEINFO set ITEM_PARAM=@ITEMPARAM
where USER_IDX=@USER_IDX and CHARACTER_IDX=@CHARACTERIDX and ITEM_IDX=@ITEMIDX
GO
/****** Object:  StoredProcedure [dbo].[mP_shopitem_updateuseinfo]    Script Date: 07/30/2013 14:54:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mP_shopitem_updateuseinfo]
@character_idx int
,@item_dbidx int
,@item_param int
,@remaintime int
as
set nocount on
update tb_shopitemuseinfo 
set ITEM_PARAM=@item_param 
,REMAIN_TIME=@remaintime
 where item_dbidx = @item_dbidx
GO
/****** Object:  StoredProcedure [dbo].[MP_SHOPITEM_UpdateUseParam]    Script Date: 07/30/2013 14:54:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE           proc [dbo].[MP_SHOPITEM_UpdateUseParam] ( @CHARACTERIDX int, @ITEMIDX int, @ITEMPARAM int )

as
	Set Nocount on
--	Set Xact_Abort on


update TB_SHOPITEMUSEINFO set ITEM_PARAM=@ITEMPARAM
where CHARACTER_IDX=@CHARACTERIDX and ITEM_IDX=@ITEMIDX
GO
/****** Object:  StoredProcedure [dbo].[MP_SHOPITEM_Updatetime]    Script Date: 07/30/2013 14:54:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE       proc [dbo].[MP_SHOPITEM_Updatetime] ( @CHARACTERIDX int, @ITEMIDX int, @REMAINTIME int )

as
	Set Nocount on

update TB_SHOPITEMUSEINFO set REMAIN_TIME=@REMAINTIME
	where CHARACTER_IDX=@CHARACTERIDX and ITEM_IDX=@ITEMIDX
GO
/****** Object:  StoredProcedure [dbo].[TP_CharacterShopItemUseInfo]    Script Date: 07/30/2013 14:55:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE      proc [dbo].[TP_CharacterShopItemUseInfo]
(
		@CharIdx	int
)
as
	Set Nocount On

	select top 100	character_idx, item_idx, item_dbidx, item_param, begin_time, remain_time
	from tb_shopitemuseinfo where character_idx = @CharIdx
GO
/****** Object:  StoredProcedure [dbo].[TP_CharacterShopItemUseInfoEdit]    Script Date: 07/30/2013 14:55:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	proc [dbo].[TP_CharacterShopItemUseInfoEdit]
(
	@CharIdx	int,
	@ItemDBIdx	int,
	@ItemParam	int	
)
as
	Set Nocount On 

	update tb_shopitemuseinfo set item_param = @ItemParam where character_idx = @CharIdx and item_dbidx = @ItemDBIdx
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_GetCharacterSlot_JP]    Script Date: 07/30/2013 14:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE                   proc [dbo].[MP_CHARACTER_GetCharacterSlot_JP]
(
	@USER_IDX	int,
	@AuthKey	int
)

as
	Set Nocount On
	Set Xact_Abort On

if not exists (select *  from TB_SHOPITEMUSEINFO where USER_IDX = @USER_IDX and ITEM_IDX = 57543)
begin
	select 	@AuthKey, 0
end

else
begin
	select 	@AuthKey, Item_param
	from TB_SHOPITEMUSEINFO where USER_IDX = @USER_IDX and ITEM_IDX =57543
end
GO
/****** Object:  StoredProcedure [dbo].[mp_siegerecall_load]    Script Date: 07/30/2013 14:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------------------------------ 소환 몬스터(캐터펄트) 관련 db 정보 로드 프로시저
	CREATE  proc [dbo].[mp_siegerecall_load]
	(
		@recallmapidx	smallint
	)

	as

		set nocount on

		select	themeidx
		,	mapidx
		,	recallmapidx
		,	stepidx
		,	addobjidx
		,	comkind
		,	comindex
		,	recallstep
		,	@recallmapidx
	
		from	tb_siegerecall

	return
GO
/****** Object:  StoredProcedure [dbo].[mp_siegerecall_reset]    Script Date: 07/30/2013 14:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------------------------------ 소환 몬스터(캐터펄트) 관련 db 정보 초기화 프로시저
	CREATE      proc [dbo].[mp_siegerecall_reset]
	as
		set nocount on

	update tb_siegerecall set recallstep = 0, comkind = 0
GO
/****** Object:  StoredProcedure [dbo].[MP_SIEGERECALL_KILLCOUNT]    Script Date: 07/30/2013 14:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------------------------------ 소환 몬스터(캐터펄트) 관련 db 정보 추가/업데이트 프로시저
	CREATE      proc [dbo].[MP_SIEGERECALL_KILLCOUNT]
	(
		@mapidx	smallint		-- 맵 인덱스
	)

	as

		set nocount on

	declare	@result		int

	set @result = (select count(*) from TB_SIEGERECALL where recallstep = 4 and recallmapidx = @mapidx)

	select @result

	return
GO
/****** Object:  StoredProcedure [dbo].[mp_siegerecall_insert]    Script Date: 07/30/2013 14:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------------------------------ 소환 몬스터(캐터펄트) 관련 db 정보 추가/업데이트 프로시저
	CREATE    proc [dbo].[mp_siegerecall_insert]
	(
		@themeidx	tinyint		-- 테마 인덱스
	,	@mapidx	smallint		-- 맵 인덱스
	,	@recallmapidx	smallint		-- 몬스터가 소환되는 맵 인덱스
	,	@stepidx	tinyint		-- 소환 스텝 인덱스
	,	@addobjidx	tinyint		-- 소환 스텝의 오브젝트 인덱스
	,	@comkind	tinyint		-- 오브젝트의 명령어 종류
	,	@comindex	tinyint		-- 오브젝트 명령어 인덱스
	,	@recallstep	tinyint		-- 소환 스텝
	,	@recallcount	tinyint		-- 소환 개수
	)

	as

		set nocount on

	declare	@count1		int
	,	@count2		int
	,	@count3		int
	,	@result		int
	,	@doupdate	bit

	set	@count1 = 0 

	set	@count2 = ( select count(*) from tb_siegerecall

	where	themeidx	= @themeidx
	and	mapidx		= @mapidx
--	and	recallmapidx	= @recallmapidx
	and	stepidx		= @stepidx
	and	addobjidx	= @addobjidx
--	and	comkind		= @comkind
--	and	comindex	= @comindex 
	)

	set @result = 0 

	set @doupdate = 0 

	if @count1 >= @count2
		begin
			insert tb_siegerecall
			(
				themeidx
			,	mapidx
			,	recallmapidx
			,	stepidx
			,	addobjidx
			,	comkind
			,	comindex
			,	recallstep
			)
			values
			(
				@themeidx
			,	@mapidx
			,	@recallmapidx
			,	@stepidx
			,	@addobjidx
			,	@comkind
			,	@comindex
			,	@recallstep
			)

		end

	else
		begin
			if( select recallstep from tb_siegerecall
				where 	themeidx	= @themeidx
				and	mapidx		= @mapidx
				and	stepidx		= @stepidx
				and	addobjidx	= @addobjidx ) > @recallstep

				begin
					return 					
				end

			update tb_siegerecall		
			set 	--themeidx	= @themeidx
			--,	mapidx		= @mapidx
				recallmapidx	= @recallmapidx
			,	stepidx		= @stepidx
			,	addobjidx	= @addobjidx
			,	comkind		= @comkind
			,	comindex	= @comindex
			,	recallstep	= @recallstep
	
			where 	themeidx	= @themeidx
			and	mapidx		= @mapidx
			and	stepidx		= @stepidx
			and	addobjidx	= @addobjidx

		end

	set @count3 = (select count(*) from tb_siegerecall where recallstep = 4 and recallmapidx = @recallmapidx)

	if( @recallcount <= @count3 )
		begin
			set @result = 1
		end


	select @result


	return
GO
/****** Object:  StoredProcedure [dbo].[TP_USER_INDEX_SELECT]    Script Date: 07/30/2013 14:55:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 개체: 저장 프로시저 dbo.TP_USER_INDEX_SELECT    스크립트 날짜: 2009-09-16 오후 3:03:41 ******/


/*
071231 웅주, 플레이어 이름으로도 유저 인덱스를 쿼리할 수 있도록 함
090122 LUJ, 이름 부분 검색 지원
*/
CREATE   PROCEDURE [dbo].[TP_USER_INDEX_SELECT]
(
	@CHAR_IDX	INT,
	@CHAR_NAME	VARCHAR( 16 )
)
AS
	SET NOCOUNT ON
	
	-- 090122 LUJ, 이름 부분 검색 지원
	SELECT  USER_IDX
	FROM    TB_CHARACTERCREATEINFO
	WHERE   (CHARACTER_IDX = @CHAR_IDX) OR (CHARACTER_NAME LIKE @CHAR_NAME)
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_CharacterCreateInfoFromMN]    Script Date: 07/30/2013 14:55:04 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- 캐릭정보 획득
CREATE                     proc [dbo].[TP_CharacterCreateInfoFromMN]
(
		@MemberNum	int
)
as
	Set Nocount on


	select 	CHARACTER_IDX,
		USER_IDX,
		CHARACTER_NAME,
		FLAG,
		convert(varchar(5),year(CREATE_DATE)) +'-'+ convert(varchar(3), month(CREATE_DATE)) +'-'+ convert(varchar(3), day(CREATE_DATE)),
		convert(varchar(17), CREATE_DATE, 108),
		CREATE_IP,
		convert(varchar(5),year(DELETE_DATE)) +'-'+ convert(varchar(3), month(DELETE_DATE)) +'-'+ convert(varchar(3), day(DELETE_DATE)),
		convert(varchar(17), DELETE_DATE, 108),
		DELETE_IP,
		convert(varchar(5),year(RECOVER_DATE)) +'-'+ convert(varchar(3), month(RECOVER_DATE)) +'-'+ convert(varchar(3), day(RECOVER_DATE)),
		convert(varchar(17), RECOVER_DATE, 108),
		RECOVER_IP
	from TB_CharacterCreateInfo with(nolock) where USER_IDX = @MemberNum order by FLAG asc
GO
/****** Object:  StoredProcedure [dbo].[MP_ITEM_OPTION_INSERT]    Script Date: 07/30/2013 14:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
070723 웅주

기존 묵향 코드에서 마법 공격/방어, 크리티컬, 체력/마나 회복이 추가됨
주의: 묵향에서 레어 옵션이란 구분을 제거함
이 프로시저는 다음을 대체함

- MP_ITEM_OPTION_INSERT


071010 웅주, 조합 시에 랜덤하게 붙는 수치를 옵션에 저장하도록 함
071128 웅주, RM툴 로그를 위해 아이템 DB 인덱스 값을 가져오도록 SELECT 문 마지막에 추가함
080125 웅주, ITEM_DBIDX를 고유한 키로 사용하며, TB_ITEM.DURABILITY에 옵션 번호를 저장하지 않음. 값도 반환하지 않음
*/
CREATE PROCEDURE [dbo].[MP_ITEM_OPTION_INSERT]
(
	@ITEM_DBIDX					INT,
	@REINFORCE_STRENGTH			INT,
	@REINFORCE_DEXTERITY		INT,
	@REINFORCE_VITALITY			INT,
	@REINFORCE_INTELLIGENCE		INT,
	@REINFORCE_WISDOM			INT,
	@REINFORCE_LIFE				INT,
	@REINFORCE_MANA				INT,
	@REINFORCE_LIFE_RECOVERY	INT,
	@REINFORCE_MANA_RECOVERY	INT,
	@REINFORCE_PHYSIC_ATTACK	INT,
	@REINFORCE_PHYSIC_DEFENCE	INT,
	@REINFORCE_MAGIC_ATTACK		INT,
	@REINFORCE_MAGIC_DEFENCE	INT,
	@REINFORCE_MOVE_SPEED		INT,
	@REINFORCE_EVADE			INT,
	@REINFORCE_ACCURACY			INT,
	@REINFORCE_CRITICAL_RATE	INT,
	@REINFORCE_CRITICAL_DAMAGE	INT,
	@REINFORCE_MADEBY			VARCHAR( 16 ),
	@MIX_STRENGTH				INT,
	@MIX_INTELLIGENCE			INT,
	@MIX_DEXTERITY				INT,
	@MIX_WISDOM					INT,
	@MIX_VITALITY				INT,
	@MIX_MADEBY					VARCHAR( 16 ),
	@ENCHANT_INDEX				INT,
	@ENCHANT_LEVEL				TINYINT,
	@ENCHANT_MADEBY				VARCHAR( 16 )
)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	UPDATE	TB_ITEM_OPTION2
	SET		REINFORCE_STRENGTH			= @REINFORCE_STRENGTH,
			REINFORCE_DEXTERITY			= @REINFORCE_DEXTERITY,
			REINFORCE_VITALITY			= @REINFORCE_VITALITY,
			REINFORCE_INTELLIGENCE		= @REINFORCE_INTELLIGENCE,
			REINFORCE_WISDOM			= @REINFORCE_WISDOM,
			REINFORCE_LIFE				= @REINFORCE_LIFE,
			REINFORCE_MANA				= @REINFORCE_MANA,
			REINFORCE_LIFE_RECOVERY		= @REINFORCE_LIFE_RECOVERY,
			REINFORCE_MANA_RECOVERY		= @REINFORCE_MANA_RECOVERY,
			REINFORCE_PHYSIC_ATTACK		= @REINFORCE_PHYSIC_ATTACK,
			REINFORCE_PHYSIC_DEFENCE	= @REINFORCE_PHYSIC_DEFENCE,
			REINFORCE_MAGIC_ATTACK		= @REINFORCE_MAGIC_ATTACK,
			REINFORCE_MAGIC_DEFENCE		= @REINFORCE_MAGIC_DEFENCE,
			REINFORCE_MOVE_SPEED		= @REINFORCE_MOVE_SPEED,
			REINFORCE_EVADE				= @REINFORCE_EVADE,
			REINFORCE_ACCURACY			= @REINFORCE_ACCURACY,
			REINFORCE_CRITICAL_RATE		= @REINFORCE_CRITICAL_RATE,
			REINFORCE_CRITICAL_DAMAGE	= @REINFORCE_CRITICAL_DAMAGE,
			REINFORCE_MADEBY			= @REINFORCE_MADEBY,
			MIX_STRENGTH				= @MIX_STRENGTH,
			MIX_INTELLIGENCE			= @MIX_INTELLIGENCE,
			MIX_DEXTERITY				= @MIX_DEXTERITY,
			MIX_WISDOM					= @MIX_WISDOM,
			MIX_VITALITY				= @MIX_VITALITY,
			MIX_MADEBY					= @MIX_MADEBY,
			ENCHANT_INDEX				= @ENCHANT_INDEX,
			ENCHANT_LEVEL				= @ENCHANT_LEVEL,
			ENCHANT_MADEBY				= @ENCHANT_MADEBY
	WHERE	ITEM_DBIDX = @ITEM_DBIDX
	
	-- 업데이트된 레코드가 없을 경우 값을 삽입한다
	IF 0 = @@ROWCOUNT
	BEGIN
		INSERT INTO TB_ITEM_OPTION2
				(	ITEM_DBIDX,
					REINFORCE_STRENGTH,
					REINFORCE_DEXTERITY,
					REINFORCE_VITALITY,
					REINFORCE_INTELLIGENCE,
					REINFORCE_WISDOM,
					REINFORCE_LIFE, 
					REINFORCE_MANA,
					REINFORCE_LIFE_RECOVERY,
					REINFORCE_MANA_RECOVERY,
					REINFORCE_PHYSIC_ATTACK, 
					REINFORCE_PHYSIC_DEFENCE,
					REINFORCE_MAGIC_ATTACK,
					REINFORCE_MAGIC_DEFENCE,
					REINFORCE_MOVE_SPEED,
					REINFORCE_EVADE,
					REINFORCE_ACCURACY,
					REINFORCE_CRITICAL_RATE,
					REINFORCE_CRITICAL_DAMAGE,
					REINFORCE_MADEBY,
					MIX_STRENGTH,
					MIX_INTELLIGENCE,
					MIX_DEXTERITY,	
					MIX_WISDOM,		
					MIX_VITALITY,
					MIX_MADEBY,
					ENCHANT_INDEX,
					ENCHANT_LEVEL,
					ENCHANT_MADEBY )
		VALUES	(	@ITEM_DBIDX,
					@REINFORCE_STRENGTH,
					@REINFORCE_DEXTERITY,
					@REINFORCE_VITALITY,
					@REINFORCE_INTELLIGENCE, 
					@REINFORCE_WISDOM,
					@REINFORCE_LIFE,
					@REINFORCE_MANA,
					@REINFORCE_LIFE_RECOVERY,
					@REINFORCE_MANA_RECOVERY, 
					@REINFORCE_PHYSIC_ATTACK,
					@REINFORCE_PHYSIC_DEFENCE,
					@REINFORCE_MAGIC_ATTACK,
					@REINFORCE_MAGIC_DEFENCE,
					@REINFORCE_MOVE_SPEED,
					@REINFORCE_EVADE,
					@REINFORCE_ACCURACY,
					@REINFORCE_CRITICAL_RATE,
					@REINFORCE_CRITICAL_DAMAGE,
					@REINFORCE_MADEBY,
					@MIX_STRENGTH,
					@MIX_INTELLIGENCE,
					@MIX_DEXTERITY,	
					@MIX_WISDOM,		
					@MIX_VITALITY,
					@MIX_MADEBY,
					@ENCHANT_INDEX,
					@ENCHANT_LEVEL,
					@ENCHANT_MADEBY )
	END

	RETURN
	
/*
--080125 웅주, 예전 코드
-- 레코드 삽입
	BEGIN
		INSERT INTO TB_ITEM_OPTION2
				(	ITEM_DBIDX,
					REINFORCE_STRENGTH,
					REINFORCE_DEXTERITY,
					REINFORCE_VITALITY,
					REINFORCE_INTELLIGENCE,
					REINFORCE_WISDOM,
					REINFORCE_LIFE, 
					REINFORCE_MANA,
					REINFORCE_LIFE_RECOVERY,
					REINFORCE_MANA_RECOVERY,
					REINFORCE_PHYSIC_ATTACK, 
					REINFORCE_PHYSIC_DEFENCE,
					REINFORCE_MAGIC_ATTACK,
					REINFORCE_MAGIC_DEFENCE,
					REINFORCE_MOVE_SPEED,
					REINFORCE_EVADE,
					REINFORCE_ACCURACY,
					REINFORCE_CRITICAL_RATE,
					REINFORCE_CRITICAL_DAMAGE,
					REINFORCE_MADEBY,
					MIX_STRENGTH,
					MIX_INTELLIGENCE,
					MIX_DEXTERITY,	
					MIX_WISDOM,		
					MIX_VITALITY,
					MIX_MADEBY,
					ENCHANT_INDEX,
					ENCHANT_LEVEL,
					ENCHANT_MADEBY )
		VALUES	(	@ITEM_DBIDX,
					@REINFORCE_STRENGTH,
					@REINFORCE_DEXTERITY,
					@REINFORCE_VITALITY,
					@REINFORCE_INTELLIGENCE, 
					@REINFORCE_WISDOM,
					@REINFORCE_LIFE,
					@REINFORCE_MANA,
					@REINFORCE_LIFE_RECOVERY,
					@REINFORCE_MANA_RECOVERY, 
					@REINFORCE_PHYSIC_ATTACK,
					@REINFORCE_PHYSIC_DEFENCE,
					@REINFORCE_MAGIC_ATTACK,
					@REINFORCE_MAGIC_DEFENCE,
					@REINFORCE_MOVE_SPEED,
					@REINFORCE_EVADE,
					@REINFORCE_ACCURACY,
					@REINFORCE_CRITICAL_RATE,
					@REINFORCE_CRITICAL_DAMAGE,
					@REINFORCE_MADEBY,
					@MIX_STRENGTH,
					@MIX_INTELLIGENCE,
					@MIX_DEXTERITY,	
					@MIX_WISDOM,		
					@MIX_VITALITY,
					@MIX_MADEBY,
					@ENCHANT_INDEX,
					@ENCHANT_LEVEL,
					@ENCHANT_MADEBY )
	END

	-- 이전 아이템 옵션을 지운다
	BEGIN
		DECLARE @PREV_OPTION_IDX INT
		SELECT @PREV_OPTION_IDX =ITEM_DURABILITY FROM TB_ITEM WHERE ITEM_DBIDX = @ITEM_DBIDX
		
		EXEC MP_ITEM_OPTION_DELETE @PREV_OPTION_IDX
	END
	
	-- 아이템 테이블의 옵션1을 갱신한다
	UPDATE TB_ITEM SET ITEM_DURABILITY = @@IDENTITY WHERE ITEM_DBIDX = @ITEM_DBIDX
	
	SELECT		@CHAR_IDX,
				OPTION_IDX,
				REINFORCE_STRENGTH,
				REINFORCE_DEXTERITY,
				REINFORCE_VITALITY,
				REINFORCE_INTELLIGENCE,
				REINFORCE_WISDOM,
				REINFORCE_LIFE, 
				REINFORCE_MANA,
				REINFORCE_LIFE_RECOVERY,
				REINFORCE_MANA_RECOVERY,
				REINFORCE_PHYSIC_ATTACK, 
				REINFORCE_PHYSIC_DEFENCE,
				REINFORCE_MAGIC_ATTACK,
				REINFORCE_MAGIC_DEFENCE,
				REINFORCE_MOVE_SPEED,
				REINFORCE_EVADE,
				REINFORCE_ACCURACY,
				REINFORCE_CRITICAL_RATE,
				REINFORCE_CRITICAL_DAMAGE,
				REINFORCE_MADEBY,
				MIX_STRENGTH,
				MIX_INTELLIGENCE,
				MIX_DEXTERITY,	
				MIX_WISDOM,		
				MIX_VITALITY,
				MIX_MADEBY,
				ENCHANT_INDEX,
				ENCHANT_LEVEL,
				ENCHANT_MADEBY,
				@ITEM_DBIDX
	FROM		TB_ITEM_OPTION2
	WHERE		(OPTION_IDX = @@IDENTITY)
*/
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARSIZELOAD]    Script Date: 07/30/2013 14:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROCEDURE [dbo].[MP_CHARSIZELOAD]
	(
		@dwPlayerID	int
	)
AS
	Set	Nocount	on
	Set	Xact_abort on

	declare @size	int
	if not exists ( select * from tb_charsize where character_idx = @dwPlayerID )
	begin		
		insert tb_charsize(character_idx, changecount, cur_size, max_size, min_size, lastdate ) values(@dwPlayerID, 0, 100, 100, 100, getdate())
	end

	select CHARACTER_IDX, CHANGECOUNT, CUR_SIZE, MAX_SIZE, MIN_SIZE
	from tb_charsize where character_idx = @dwPlayerID
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARSIZEUPDATE]    Script Date: 07/30/2013 14:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[MP_CHARSIZEUPDATE]
	(
		@dwPlayerID	int,
		@cur_size	int
	)
AS
	SET NOCOUNT ON
	
	
	--delete from TB_OPTION where (CHARACTER_IDX = @dwPlayerID)
	if not exists ( select * from tb_charsize where character_idx = @dwPlayerID )
	begin
		insert tb_charsize(character_idx, changecount, cur_size, max_size, min_size, lastdate ) values(@dwPlayerID, 0, 100, 100, 100, getdate())
	end


	declare @count		int
	declare @max_size	int
	declare @min_size	int

	select @count=changecount, @max_size=max_size, @min_size=min_size from tb_charsize where character_idx = @dwPlayerID

	if (@max_size < @cur_size)
		set @max_size = @cur_size

	if(@cur_size < @min_size)
		set @min_size = @cur_size

	update TB_CHARSIZE
	set
	changecount = @count + 1,
	cur_size = @cur_size,
	max_size = @max_size,
	min_size = @min_size,
	lastdate = getdate()
	where character_idx = @dwPlayerID
GO
/****** Object:  StoredProcedure [dbo].[MP_SIEGEWAR_GuildInfoDelete]    Script Date: 07/30/2013 14:54:29 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE        proc [dbo].[MP_SIEGEWAR_GuildInfoDelete]
(
	@Siegewar_Idx		int,
	@Guild_Idx		int,
	@Mapnum		int
)
as
	set nocount on
	set xact_abort on

	delete TB_SIEGEWAR_GUILDINFO where
		SIEGEWAR_IDX=@Siegewar_Idx and GUILD_IDX=@Guild_Idx and MAPNUM=@Mapnum
GO
/****** Object:  StoredProcedure [dbo].[MP_SIEGEWAR_GuildInfoLoad]    Script Date: 07/30/2013 14:54:30 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE        proc [dbo].[MP_SIEGEWAR_GuildInfoLoad]
(
	@StartDBidx		int,
	@Siegewar_Idx		int,
	@Mapnum		int
)
as
	set nocount on
	set xact_abort on

if exists (select null from TB_SIEGEWAR_GUILDINFO where (GUILD_DBIDX > @StartDBidx) and (SIEGEWAR_IDX=@Siegewar_Idx and MAPNUM=@Mapnum) )
begin
	select top 100 GUILD_DBIDX, GUILD_IDX, GUILD_TYPE  from TB_SIEGEWAR_GUILDINFO
	 where (GUILD_DBIDX > @StartDBIdx) and SIEGEWAR_IDX=@Siegewar_Idx and MAPNUM=@Mapnum
					order by GUILD_DBIDX
				
end
else
	select   0
GO
/****** Object:  StoredProcedure [dbo].[MP_SIEGEWAR_GuildInfoInsert]    Script Date: 07/30/2013 14:54:30 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE         proc [dbo].[MP_SIEGEWAR_GuildInfoInsert]
(
	@Siegewar_Idx			int,
	@Guild_Idx			int,
	@Guild_Type			int,
	@Mapnum			int
)
as
	set nocount on
	set xact_abort on

	insert TB_SIEGEWAR_GUILDINFO
	(
		SIEGEWAR_IDX,
		GUILD_IDX,
		GUILD_TYPE,
		MAPNUM
	)
	values
	(
		@Siegewar_Idx,
		@Guild_Idx,
		@Guild_Type,
		@Mapnum
	)
GO
/****** Object:  StoredProcedure [dbo].[MP_SIEGEWAR_GuildInfoUpdate]    Script Date: 07/30/2013 14:54:30 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE        proc [dbo].[MP_SIEGEWAR_GuildInfoUpdate]
(
	@Siegewar_Idx		int,
	@Guild_Idx		int,
	@Guild_Type		int,
	@Mapnum		int
)
as
	set nocount on
	set xact_abort on

	update TB_SIEGEWAR_GUILDINFO set
		GUILD_TYPE = @Guild_Type
	where SIEGEWAR_IDX=@Siegewar_Idx and GUILD_IDX=@Guild_Idx and MAPNUM=@Mapnum
GO
/****** Object:  StoredProcedure [dbo].[MP_SIEGEWAR_InfoUpdate]    Script Date: 07/30/2013 14:54:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE          proc [dbo].[MP_SIEGEWAR_InfoUpdate]
(
	@Siegewar_Idx		int,
	@Regist_Time		int,
	@Siegewar_Time		int,
	@Level			int,
	@Mapnum		int
)
as
	set nocount on
	set xact_abort on

	update TB_SIEGEWAR_INFO set

		REGIST_TIME = @Regist_Time, 
		SIEGEWAR_TIME = @Siegewar_Time,
		GATE_LEVEL =@Level

	where 
		SIEGEWAR_IDX = @Siegewar_Idx and MAPNUM=@Mapnum
GO
/****** Object:  StoredProcedure [dbo].[MP_SIEGEWAR_InfoLoad]    Script Date: 07/30/2013 14:54:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE          proc [dbo].[MP_SIEGEWAR_InfoLoad]
(
	@Mapnum		int
)
as
	set nocount on
	set xact_abort on

	declare @Count	int
	select @Count = REGIST_TIME from TB_SIEGEWAR_INFO where SIEGEWAR_IDX=9999 and MAPNUM=@Mapnum

	if( @Count = NULL )
	begin
		insert TB_SIEGEWAR_INFO (SIEGEWAR_IDX, REGIST_TIME, SIEGEWAR_TIME, GATE_LEVEL, MAPNUM )
		values ( 9999, 1, 0, 0, @Mapnum )
		insert TB_SIEGEWAR_INFO (SIEGEWAR_IDX, REGIST_TIME, SIEGEWAR_TIME, GATE_LEVEL, MAPNUM )
		values ( 1, 0, 0, 0, @Mapnum )
		select 1, 0, 0, 0
	end
	else
	begin
		select SIEGEWAR_IDX, REGIST_TIME, SIEGEWAR_TIME, GATE_LEVEL from TB_SIEGEWAR_INFO where SIEGEWAR_IDX=@Count and MAPNUM=@Mapnum
	end
GO
/****** Object:  StoredProcedure [dbo].[MP_SIEGEWAR_InfoInsert]    Script Date: 07/30/2013 14:54:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE          proc [dbo].[MP_SIEGEWAR_InfoInsert]
(
	@Siegewar_Idx		int,
	@Regist_Time		int,
	@Siegewar_Time		int,
	@Level			int,
	@Mapnum		int
)
as
	set nocount on
	set xact_abort on

	insert TB_SIEGEWAR_INFO 
	(
		SIEGEWAR_IDX, 
		REGIST_TIME, 
		SIEGEWAR_TIME,
		GATE_LEVEL,
		MAPNUM
	)
	values
	(
		@Siegewar_Idx, 
		@Regist_Time, 
		@Siegewar_Time,
		@Level,
		@Mapnum
	)
GO
/****** Object:  StoredProcedure [dbo].[MP_SIEGEWAR_PROFIT_UpdateGuild]    Script Date: 07/30/2013 14:54:32 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	proc [dbo].[MP_SIEGEWAR_PROFIT_UpdateGuild]
(
	@MapNum	int,
	@GuildIdx	int
)
as
	set nocount on
	set xact_abort on

	if exists(select GuildIdx from TB_SIEGEWAR_PROFITINFO where SWMapNum = @MapNum ) 
		begin
			update TB_SIEGEWAR_PROFITINFO set GuildIdx = @GuildIdx, TaxRate = 0, RegDate = 0 where SWMapNum = @MapNum
			return
		end
	else
		begin
			insert TB_SIEGEWAR_PROFITINFO (SWMapNum, GuildIdx, TaxRate, ProfitMoney, RegDate)
			values(@MapNum, @GuildIdx, 0, 0, 0)
			return
		end
GO
/****** Object:  StoredProcedure [dbo].[MP_SIEGEWAR_PROFIT_InfoLoad]    Script Date: 07/30/2013 14:54:32 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	proc [dbo].[MP_SIEGEWAR_PROFIT_InfoLoad]

as
	set nocount on
	set xact_abort on

	select SWMapNum, GuildIdx, TaxRate, ProfitMoney, RegDate from TB_SIEGEWAR_PROFITINFO
GO
/****** Object:  StoredProcedure [dbo].[MP_SIEGEWAR_PROFIT_UpdateTaxRate]    Script Date: 07/30/2013 14:54:32 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	proc [dbo].[MP_SIEGEWAR_PROFIT_UpdateTaxRate]
(
	@MapNum	int,
	@TaxRate	int,
	@RegDate	int
)
as
	set nocount on
	set xact_abort on

	update TB_SIEGEWAR_PROFITINFO set TaxRate = @TaxRate, RegDate = @RegDate where SWMapNum = @MapNum
GO
/****** Object:  StoredProcedure [dbo].[MP_SIEGEWAR_PROFIT_UpdateProfitMoney]    Script Date: 07/30/2013 14:54:32 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	proc [dbo].[MP_SIEGEWAR_PROFIT_UpdateProfitMoney]
(
	@MapNum	int,
	@Money		bigint,
	@Type		int
)
as
	set nocount on
	set xact_abort on

	declare	@Profit	int
	declare	@Total	int
	
	select @Profit = ProfitMoney from TB_SIEGEWAR_PROFITINFO where SWMapNum = @MapNum

	if( @Type = 0 )
	begin
		set @Total = @Profit + @Money
	end
	else
	begin
		set @Total = @Profit - @Money
		if( @Total < 0 )
		begin
			set @Total = 0
		end
	end

	update TB_SIEGEWAR_PROFITINFO set ProfitMoney = @Total where SWMapNum = @MapNum		
	select @MapNum, @Total
GO
/****** Object:  StoredProcedure [dbo].[mp_siegewarfare_info_load]    Script Date: 07/30/2013 14:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------------------------------ 공성 스케줄 관련 db 정보 로드 프로시저
	CREATE  proc [dbo].[mp_siegewarfare_info_load]

	as
		set nocount on
		set xact_abort on

	select maptype, guildidx, state 

	from tb_siegewarfare_info
GO
/****** Object:  StoredProcedure [dbo].[mp_siegewarfare_info_update]    Script Date: 07/30/2013 14:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------------------------------ 공성 스케줄 관련 db 정보 업데이트 프로시저
	CREATE  proc [dbo].[mp_siegewarfare_info_update]
	(
		@maptype	int
	,	@guildidx	int
	,	@state		int
	)

	as

		set nocount on

	declare @type tinyint		
			
	if not exists ( select * from dbo.tb_siegewarfare_info
	where maptype	= @maptype )
		begin
			insert tb_siegewarfare_info
			(
				maptype
			,	guildidx
			,	state
			)
			values
			(
				@maptype
			,	@guildidx
			,	@state
			)
		end

	update tb_siegewarfare_info

	set	guildidx	= @guildidx
	,	state	= @state

	where	maptype	= @maptype
GO
/****** Object:  StoredProcedure [dbo].[MP_SKILLTREE_Delete]    Script Date: 07/30/2013 14:54:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE proc [dbo].[MP_SKILLTREE_Delete]
(
	@SKILL_DBIDX 	int
)

as

	Set Nocount On

	delete TB_SKILL where SKILL_DBIDX = @SKILL_DBIDX
GO
/****** Object:  StoredProcedure [dbo].[MP_SKILLTREE_Insert]    Script Date: 07/30/2013 14:54:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE        proc [dbo].[MP_SKILLTREE_Insert]
(
		@CHARACTER_IDX	int
	,	@SKILL_IDX		int
	,	@SKILL_LEVEL		int
)

as
	set nocount on
	set xact_abort on

	declare @MaxSkill_idx int


if (@CHARACTER_IDX = 0)
begin
	-- error
	select 0
	return
end


	insert tb_skill
	(
		CHARACTER_IDX,
		SKILL_IDX, 
		SKILL_LEVEL
	)
	values
	(
		@CHARACTER_IDX,
		@SKILL_IDX,
		@SKILL_LEVEL
	)

	select @MaxSkill_idx = @@identity

	select  * from tb_skill where  skill_dbidx = @Maxskill_idx
GO
/****** Object:  StoredProcedure [dbo].[MP_SKILLTREE_Update]    Script Date: 07/30/2013 14:54:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[MP_SKILLTREE_Update]
(
		@SKILL_DBIDX		int
	,	@SKILL_IDX		int
	, 	@SKILL_LEVEL		tinyint
)

as
	Set Nocount On

update TB_SKILL set 

	SKILL_IDX 	= @SKILL_IDX, 
	SKILL_LEVEL 		= @SKILL_LEVEL

	where SKILL_DBIDX = @SKILL_DBIDX
GO
/****** Object:  StoredProcedure [dbo].[TP_SKILL_LEVEL_UPDATE]    Script Date: 07/30/2013 14:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_SKILL_LEVEL_UPDATE]
(
	@CHAR_IDX		INT,
	@SKILL_DBIDX	INT,
	@LEVEL			TINYINT	
)
AS
	SET NOCOUNT ON
	
	UPDATE  TB_SKILL
	SET         SKILL_LEVEL = @LEVEL
	WHERE   (SKILL_DBIDX = @SKILL_DBIDX)
	
	IF 0 < @@ROWCOUNT
	BEGIN
		SELECT  @CHAR_IDX, SKILL_DBIDX, SKILL_IDX, SKILL_LEVEL
		FROM    TB_SKILL
		WHERE	SKILL_DBIDX = @SKILL_DBIDX
		RETURN
	END
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_SKILL_DELETE]    Script Date: 07/30/2013 14:55:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_SKILL_DELETE]
(
	@SKILL_DBIDX INT
)
AS
	SET NOCOUNT ON
	
	DECLARE @CHAR_IDX INT
	DECLARE @SKILL_IDX INT
	
	SELECT  @CHAR_IDX	= CHARACTER_IDX,
			@SKILL_IDX	= SKILL_IDX
			
	FROM      TB_SKILL
	WHERE   (SKILL_DBIDX = @SKILL_DBIDX)
	
	IF @CHAR_IDX IS NULL
		RETURN
		
	DELETE FROM TB_SKILL
	WHERE   (SKILL_DBIDX = @SKILL_DBIDX)
	
	IF 0 < @@ROWCOUNT
		SELECT @CHAR_IDX, @SKILL_DBIDX, @SKILL_IDX
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_SkillInfo]    Script Date: 07/30/2013 14:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MP_CHARACTER_SkillInfo]
(
	@CHARACTER_IDX			int
)
as
	Set Nocount on
	Set Xact_abort on

select * from TB_SKILL where CHARACTER_IDX = @CHARACTER_IDX
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_SkillTreeInfo]    Script Date: 07/30/2013 14:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_CHARACTER_SkillTreeInfo]
(
	@CHARACTER_IDX			int
)
as
	set Nocount on
	set Xact_abort on
	declare @result				int

if not exists ( select null from TB_SKILL where CHARACTER_IDX = @CHARACTER_IDX)
	begin
		select 0, @CHARACTER_IDX
		return
	end
else
	begin 
		select * from TB_SKILL with(nolock) where CHARACTER_IDX = @CHARACTER_IDX
		return
	end
	
	EXEC DBO.MP_CHARACTER_SKILLTREEINFO 1632
GO
/****** Object:  StoredProcedure [dbo].[mp_devbp]    Script Date: 07/30/2013 14:52:50 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE proc [dbo].[mp_devbp]
(
	@SkillIdx	int,
	@Character_Money	int
)
as
	set nocount on

	insert TB_SKILL_RESET_MONEY
	(
SkillIdx,
Character_Money
	)
	values
	(
@SkillIdx,
@Character_Money
	)
GO
/****** Object:  StoredProcedure [dbo].[MP_CONSIGNMENT_CheckDate]    Script Date: 07/30/2013 14:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROC [dbo].[MP_CONSIGNMENT_CheckDate] 
(
@CharacterIndex int
)
AS 
SET  NOCOUNT  ON 

SELECT  [CONSIGNMENT_IDX]
from [dbo].[TB_CONSIGNMENT] with (nolock)
where CHARACTER_IDX = @CharacterIndex and
	getdate() >= ENDTIME





SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[mp_devbp2]    Script Date: 07/30/2013 14:52:50 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mp_devbp2]
(
	@grade		int,
	@skillpoint	int
)
as
	set nocount on

insert dbo.tb_skill_reset_point
(
grade,
skillpoint
)
values
(
@grade,
@skillpoint
)
GO
/****** Object:  StoredProcedure [dbo].[MP_SKILLTREE_SkillPoint_Update_Accumulate]    Script Date: 07/30/2013 14:54:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------	
	-- 071129 LYW - [ 누적 스킬 포인트를 업데이트 하는 프로시저를 추가한다. ]
	---------------------------------------------------------------------------------------	
	CREATE   PROC [dbo].[MP_SKILLTREE_SkillPoint_Update_Accumulate]			-- 누적 스킬 포인트 업데이트 프로시저.
	(
		@CHARACTER_IDX	INT						-- 업데이트 대상의 캐릭터 인덱스.
	,	@FORCE			INT						-- 강제 업데이트 여부를 담을 변수.
	,	@POINT			INT						-- 강제 업데이트 포인트 변수.
	)
	
	AS
	SET NOCOUNT ON

	---------------------------------------------------------------------------------- [ 강제로 누적 포인트를 업데이트 한다. ]
	IF @FORCE = 1	
		BEGIN
		-- 080612 LYW : 업데이트 DB 변경.
--		UPDATE TB_CHARACTER							-- [ TB_CHARACTER ] 테이블을 참조한다.
--		SET CHARACTER_ACCSKILLPOINT = @POINT					-- 인자로 넘어온 포인트로 업데이트 한다.

		UPDATE TB_SKILLPOINT							-- [ TB_SKILLPOINT ] 테이블을 참조하도록 한다.
		SET CUMULATIVE_POINT = @POINT							-- 인자로 넘어온 포인트로 업데이트 한다.


		WHERE CHARACTER_IDX = @CHARACTER_IDX				-- 조건을 CHARACTER_IDX의 일치로 한다.
		RETURN
		END

	--------------------------------------------------------------- [ 강제가 아닌, 일반적으로 누적 스킬 포인트를 업데이트 한다. ]

	DECLARE	@SKILLPOINT		INT					-- 현재 스킬 포인트를 담을 변수 선언.
	,		@ACCPOINT		INT					-- 새로 누적 할 포인트를 담을 변수 선언.
	,		@CURACCPOINT		INT					-- 현재의 누적 포인트 변수 선언.

	-- 080612 LYW : 업데이트 DB 변경.
--	SELECT 	@SKILLPOINT = CHARACTER_SKILLPOINT					-- 현재 스킬 포인트를 받는다.
--	,	@CURACCPOINT = CHARACTER_ACCSKILLPOINT				-- 현재 누적 스킬 포인트를 받는다.
--	FROM	TB_CHARACTER								-- [ TB_CHARACTER ] 테이블을 참조한다.

	SELECT 	@SKILLPOINT 	= SKILL_POINT						-- 현재 스킬 포인트를 받는다.
	,	@CURACCPOINT 	= CUMULATIVE_POINT					-- 현재 누적 스킬 포인트를 받는다.
	FROM	TB_SKILLPOINT								-- [ TB_SKILLPOINT ] 테이블을 참조한다.


	WHERE	CHARACTER_IDX = @CHARACTER_IDX					-- 조건을 CHARACTER_IDX의 일치로 한다.

	SET @ACCPOINT = ( @POINT - @SKILLPOINT )					-- 새로 적용 할 누적 포인트를 구한다.


	--------------------------------------------------------------------------------
	-- * 참고사항*
	--------------------------------------------------------------------------------

	-- 현재 누적 스킬 포인트가 [0]이라면, 아직 캐릭터 레벨업이 없었거나, 

	-- 기존에 생성 된 캐릭터인 경우이다. 기존 캐릭터는 생각하지 않는다.


	IF @CURACCPOINT = 0								-- 현재 스킬 포인트가 [0] 이라면,
		BEGIN									
			-- 080612 LYW : 업데이트 DB 변경.
--			UPDATE TB_CHARACTER						-- [ TB_CHARACTER ] 테이블을 참조한다.
--			SET CHARACTER_ACCSKILLPOINT = @POINT				-- 누적 스킬 포인트를 업데이트 한다.
	
			UPDATE TB_SKILLPOINT						-- [ TB_SKILLPOINT ] 테이블을 참조한다.
			SET CUMULATIVE_POINT = @POINT					-- 누적 스킬 포인트를 업데이트 한다.

			WHERE CHARACTER_IDX = @CHARACTER_IDX			-- 조건을 CHARACTER_IDX의 일치로 한다.
		END
	ELSE										-- 누적 된 스킬 포인트가 있다면,
		BEGIN
			-- 080612 LYW : 업데이트 DB 변경.
--			UPDATE TB_CHARACTER						-- [ TB_CHARACTER ] 테이블을 참조한다.
--			SET CHARACTER_ACCSKILLPOINT = ( @CURACCPOINT + @POINT )	-- 누적 스킬 포인트를 업데이트 한다.

			UPDATE TB_SKILLPOINT						-- [ TB_CHARACTER ] 테이블을 참조한다.
			SET CUMULATIVE_POINT = ( @CURACCPOINT + @POINT )		-- 누적 스킬 포인트를 업데이트 한다.

			WHERE CHARACTER_IDX = @CHARACTER_IDX			-- 조건을 CHARACTER_IDX의 일치로 한다.
		END

	RETURN										-- RETURN 처리한다.
GO
/****** Object:  StoredProcedure [dbo].[MP_SKILLTREE_SkillPoint_Update]    Script Date: 07/30/2013 14:54:34 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE         proc [dbo].[MP_SKILLTREE_SkillPoint_Update]
	(
			@CHARACTER_IDX	int
		,	@SKILL_POINT		int
	)
	
	as
		set nocount on
		set xact_abort on
	
	-- 080612 LYW : 스킬 포인트를 업데이트 할 테이블과 컬럼을 바꾼다.
--	update TB_CHARACTER set 
	
--		CHARACTER_SKILLPOINT = @SKILL_POINT
	
--		where CHARACTER_IDX = @CHARACTER_IDX

	update 	TB_SKILLPOINT

	set	SKILL_POINT = @SKILL_POINT

	where 	CHARACTER_IDX = @CHARACTER_IDX
GO
/****** Object:  StoredProcedure [dbo].[MP_CONSIGNMENT_Average]    Script Date: 07/30/2013 14:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROC [dbo].[MP_CONSIGNMENT_Average] 
(
	@ItemIndex int,
	@Enchant tinyint,
	@Price bigint,
	@Num int
) 
AS 
SET  NOCOUNT  ON 

IF  NOT  EXISTS  (SELECT * FROM [dbo].[TB_CONSIGNMENT_AVERAGE] WITH(READUNCOMMITTED)
	WHERE ITEM_INDEX=@ItemIndex and ENCHANT=@Enchant )
	begin
		insert [dbo].[TB_CONSIGNMENT_AVERAGE]
			([ITEM_INDEX],
			[ENCHANT],
			[ACCUMULATE_PRICE],
			[ACCUMULATE_NUM],
			[AVERAGE_PRICE],
			[RESETDATE] )
		values
			(@ItemIndex,
			@Enchant,
			@Price,
			@Num,
			@Price / @Num,
			getdate() )
	end
ELSE
	begin
		declare @OverDate smalldatetime
		set @OverDate = dateadd(day, -15, getdate())

		declare @AccumPrice bigint
		declare @AccumNum int
		declare @AccumOldPrice bigint
		declare @AccumOldNum int
		declare @ResetDate smalldatetime
		select @AccumOldPrice = [ACCUMULATE_PRICE] * 0.2,
			@AccumOldNum = [ACCUMULATE_NUM] * 0.2,
			@ResetDate = [RESETDATE] 
			from [dbo].[TB_CONSIGNMENT_AVERAGE]
			where ITEM_INDEX=@ItemIndex and ENCHANT=@Enchant

		if(@ResetDate < @OverDate)
			-- 15일경과 평균가 재산출
			begin
			update [dbo].[TB_CONSIGNMENT_AVERAGE]
			set @AccumPrice = [ACCUMULATE_PRICE] = @AccumOldPrice + @Price,
				@AccumNum = [ACCUMULATE_NUM] = @AccumOldNum + @Num,
				[AVERAGE_PRICE] = (@AccumPrice /@AccumNum),
				[RESETDATE] = getdate()
			where ITEM_INDEX=@ItemIndex and ENCHANT=@Enchant
			end
		else
			begin
			update [dbo].[TB_CONSIGNMENT_AVERAGE]
			set @AccumPrice = [ACCUMULATE_PRICE] = [ACCUMULATE_PRICE] + @Price,
				@AccumNum = [ACCUMULATE_NUM] = [ACCUMULATE_NUM] + @Num,
				[AVERAGE_PRICE] = (@AccumPrice / @AccumNum)
			where ITEM_INDEX=@ItemIndex and ENCHANT=@Enchant
			end
	end
GO
/****** Object:  StoredProcedure [dbo].[MP_COOKING_UPDATE]    Script Date: 07/30/2013 14:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[MP_COOKING_UPDATE]
	(
		@dwPlayerID	int,
		@wCookLevel	int,
		@wCookCount	int,
		@wEatCount	int,
		@wFireCount	int
	)
AS
	Set	Nocount	On
	
	delete from TB_COOKING where (CHARACTER_IDX = @dwPlayerID)

	insert TB_COOKING
	(
		CHARACTER_IDX,
		COOK_LEVEL,
		COOK_COUNT,
		EAT_COUNT,
		FIRE_COUNT
	)
	values
	(
		@dwPlayerID,
		@wCookLevel,
		@wCookCount,
		@wEatCount,
		@wFireCount
	)
GO
/****** Object:  StoredProcedure [dbo].[MP_COOKING_LOAD]    Script Date: 07/30/2013 14:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[MP_COOKING_LOAD]
	(
		@dwPlayerID	int
	)
AS
	Set	Nocount	on
	Set	Xact_abort on
	
if not exists (select count(*) from TB_COOKING where CHARACTER_IDX = @dwPlayerID)
	begin
		return
	end
else
	begin
		select COOK_LEVEL, COOK_COUNT, EAT_COUNT, FIRE_COUNT from TB_COOKING where CHARACTER_IDX = @dwPlayerID
		return
	end
GO
/****** Object:  StoredProcedure [dbo].[up_SpeedhackCheck]    Script Date: 07/30/2013 14:55:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 스피드 핵 체크 

CREATE proc [dbo].[up_SpeedhackCheck]
(
		@charno	int
	,	@charname	varchar(30)
	,	@Dist		int
	,	@Delay		int
)

as
	Set Nocount on


	insert tb_speedhack (charno, charname, Distance, SkillDelay, CheckDate)
	values(@charno, @charname, @Dist, @Delay, getdate())
GO
/****** Object:  StoredProcedure [dbo].[TP_QUEST_SUB_SELECT]    Script Date: 07/30/2013 14:55:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TP_QUEST_SUB_SELECT]
(
	@CHAR_IDX	INT,
	@QUEST_IDX		INT
)
AS
	SET NOCOUNT ON

	SELECT 0 AS QUEST_IDX, 0, 0, 0, @CHAR_IDX
	UNION	
	SELECT TOP 99		
		QUEST_IDX,
		SUBQUEST_IDX,
		DATA,
		REGIST_TIME,
		@CHAR_IDX
	FROM TB_SUBQUEST
	 WHERE CHARACTER_IDX = @CHAR_IDX AND QUEST_IDX > @QUEST_IDX
	ORDER BY QUEST_IDX
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_SUBQUEST_Insert]    Script Date: 07/30/2013 14:54:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE proc [dbo].[MP_SUBQUEST_Insert]
(
	@CHARACTER_IDX	int,
	@QUEST_IDX		int,
	@SUBQUEST_IDX	int,
	@DATA		int,
	@REGIST_TIME	int
)
as
	set nocount on

	insert TB_SUBQUEST
	(
		CHARACTER_IDX,
		QUEST_IDX,
		SUBQUEST_IDX,
		DATA,
		REGIST_TIME
	)
	values
	(
		@CHARACTER_IDX,
		@QUEST_IDX,
		@SUBQUEST_IDX,
		@DATA,
		@REGIST_TIME
	)
GO
/****** Object:  StoredProcedure [dbo].[MP_SUBQUEST_Delete]    Script Date: 07/30/2013 14:54:37 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE proc [dbo].[MP_SUBQUEST_Delete]
(
	@CHARACTER_IDX	int,
	@QUEST_IDX		int,
	@SUBQUEST_IDX	int
)
as
	set nocount on

	delete TB_SUBQUEST where CHARACTER_IDX=@CHARACTER_IDX and QUEST_IDX=@QUEST_IDX and SUBQUEST_IDX=@SUBQUEST_IDX
GO
/****** Object:  StoredProcedure [dbo].[MP_SUBQUEST_CheckCount]    Script Date: 07/30/2013 14:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROC [dbo].[MP_SUBQUEST_CheckCount]
	(
		@CHARACTER_IDX 	int
	,	@QUEST_IDX		int
	)
	AS
	SET NOCOUNT ON

	SELECT SUBQUEST_IDX 
	FROM TB_SUBQUEST 
	WHERE CHARACTER_IDX = @CHARACTER_IDX AND QUEST_IDX = @QUEST_IDX

	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_SUBQUEST_Delete_All]    Script Date: 07/30/2013 14:54:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE proc [dbo].[MP_SUBQUEST_Delete_All]
(
	@CHARACTER_IDX	int,
	@QUEST_IDX		int
)
as
	set nocount on

	delete TB_SUBQUEST where CHARACTER_IDX=@CHARACTER_IDX and QUEST_IDX=@QUEST_IDX
GO
/****** Object:  StoredProcedure [dbo].[RP_CharacterSubQuestInfo]    Script Date: 07/30/2013 14:54:49 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE     proc [dbo].[RP_CharacterSubQuestInfo]
(
		@charIdx	int
	,	@questIdx	int
)
as
	Set Nocount on

	select * from tb_subquest with(nolock)
	where character_idx = @charIdx and quest_idx = @questIdx order by subquest_idx
GO
/****** Object:  StoredProcedure [dbo].[MP_SUBQUEST_Update]    Script Date: 07/30/2013 14:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_SUBQUEST_Update]
(
	@CHARACTER_IDX	int,
	@QUEST_IDX		int,
	@SUBQUEST_IDX	int,
	@DATA		int,
	@TIME			int
)
as
	Set Nocount On

update TB_SUBQUEST set 	
	DATA = @DATA,
	REGIST_TIME = @TIME
	where CHARACTER_IDX = @CHARACTER_IDX and QUEST_IDX = @QUEST_IDX and SUBQUEST_IDX = @SUBQUEST_IDX
GO
/****** Object:  StoredProcedure [dbo].[MP_SUBQUEST_Load]    Script Date: 07/30/2013 14:54:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
070920 웅주

서브 퀘스트를 100개 이상 읽을 수 있도록 묵향 프로시저를 적용함
*/
CREATE proc [dbo].[MP_SUBQUEST_Load]
(
	@CHARACTER_IDX			int,
	@QUEST_IDX				int
)
as
	Set Nocount on

--if not exists    (select null from TB_SUBQUEST where CHARACTER_IDX = @CHARACTER_IDX) 
--	begin		
--		return
--	end
--else
--	begin 
		select top 100 QUEST_IDX, SUBQUEST_IDX, DATA, REGIST_TIME
		from TB_SUBQUEST with(nolock)  where CHARACTER_IDX = @CHARACTER_IDX and QUEST_IDX > @QUEST_IDX
		order by QUEST_IDX
		return
--	end
	
/* 
ALTER proc MP_SUBQUEST_Load
(
	@CHARACTER_IDX			int
)
as
	Set Nocount on

if not exists    (select null from TB_SUBQUEST where CHARACTER_IDX = @CHARACTER_IDX) 
	begin		
		return
	end
else
	begin 
		select QUEST_IDX, SUBQUEST_IDX, DATA, REGIST_TIME
			 from TB_SUBQUEST with(nolock)  where CHARACTER_IDX = @CHARACTER_IDX
		return
	end
*/
GO
/****** Object:  StoredProcedure [dbo].[MP_COOKRECIPE_UPDATE]    Script Date: 07/30/2013 14:52:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[MP_COOKRECIPE_UPDATE]
	(
		@dwPlayerID	int,
		@dwKind	int,
		@dwRecipe	int,
		@dwSlot		int,
		@dwRemainTime	int
	)
AS
	Set	Nocount	on
	Set	Xact_abort on


if(@dwKind = 1) 	-- 추가
	begin
	insert TB_COOKRECIPE values(@dwPlayerID, @dwRecipe, @dwSlot, @dwRemainTime)
	end
else if (@dwKind = 2)	-- 삭제
	begin
	delete from TB_COOKRECIPE where CHARACTER_IDX=@dwPlayerID and RECIPEIDX=@dwRecipe and SLOT=@dwSlot
	end
else if(@dwKind = 3)	-- 갱신
	begin
	update TB_COOKRECIPE
	set REMAINTIME = @dwRemainTime
	where CHARACTER_IDX=@dwPlayerID and RECIPEIDX=@dwRecipe and SLOT=@dwSlot
	end
GO
/****** Object:  StoredProcedure [dbo].[MP_COOKRECIPE_LOAD]    Script Date: 07/30/2013 14:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[MP_COOKRECIPE_LOAD]
	(
		@dwPlayerID	int
	)
AS
	Set	Nocount	on
	Set	Xact_abort on

select * from TB_COOKRECIPE
where CHARACTER_IDX = @dwPlayerID and RECIPEIDX > 0
order by SLOT
GO
/****** Object:  StoredProcedure [dbo].[MP_TRIGGER_SELECT]    Script Date: 07/30/2013 14:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE              proc [dbo].[MP_TRIGGER_SELECT]
(
	@OWNER_TYPE INT,
	@OWNER_IDX INT,
	@MAP_IDX INT,
	@START_IDX BIGINT
)
as
	SET NOCOUNT ON
	SET XACT_ABORT ON

	SELECT TOP 100
		SCRIPT_IDX,
		REPEAT_COUNT,
		DATEDIFF( second, '1970-01-01 09:00:00', REG_DATE )	-- MSDN 2005 이상에서는 자정(00:00:00)으로 나와 있으나 현재(09.10.28) 테스트(.Net) 결과 09:00:00 기준.
	FROM TB_TRIGGER
	WHERE	OWNER_TYPE = @OWNER_TYPE AND
		OWNER_IDX = @OWNER_IDX AND
		MAP_IDX = @MAP_IDX AND
		SCRIPT_IDX > @START_IDX
	ORDER BY SCRIPT_IDX
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_TRIGGER_SELECT_COUNT]    Script Date: 07/30/2013 14:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE               proc [dbo].[MP_TRIGGER_SELECT_COUNT]
(
	@SCRIPT_IDX BIGINT,
	@OWNER_TYPE INT,
	@OWNER_IDX INT,
	@MAP_IDX INT
)
as
	SET NOCOUNT ON
	SET XACT_ABORT ON

	-- MSDN 2005 이상에서는 자정(00:00:00)으로 나와 있으나 현재(09.10.28) 테스트(.Net) 결과 09:00:00 기준.
	SELECT	REPEAT_COUNT, DATEDIFF( second, '1970-01-01 09:00:00', REG_DATE )
	FROM	TB_TRIGGER
	WHERE	SCRIPT_IDX = @SCRIPT_IDX AND
		OWNER_IDX = @OWNER_IDX AND
		OWNER_TYPE = @OWNER_TYPE AND
		MAP_IDX = @MAP_IDX
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_TRIGGER_UPDATE_COUNT]    Script Date: 07/30/2013 14:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
090901 LUJ, 트리거의 반복 회수를 갱신한다
*/
CREATE proc [dbo].[MP_TRIGGER_UPDATE_COUNT]
(
	@SCRIPT_IDX INT,
	@MAP_IDX INT,
	@REPEAT_COUNT INT
)
as
	SET NOCOUNT ON
	SET XACT_ABORT ON

	UPDATE TB_TRIGGER
	SET REPEAT_COUNT = @REPEAT_COUNT
	WHERE SCRIPT_IDX = @SCRIPT_IDX AND
		MAP_IDX = @MAP_IDX
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_DUNGEONENTRANCE]    Script Date: 07/30/2013 14:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE           PROCEDURE [dbo].[MP_DUNGEONENTRANCE]
(
	@dwConnectionIndex	int,
	@dwPlayerMapNum	int,
	@dwPlayerIndex		int,
	@dwPartyIndex		int,
	@dwKeyIndex		int,
	@dwItemIndex		int,
	@dwItemSlot		int,
	@dwDungeonMapNum	int,
	@dwDungeonDifficulty	int
)
AS

set nocount on

if not exists (select * from TB_DUNGEON where CHAR_IDX = @dwPlayerIndex and MAP_NUM = @dwDungeonMapNum)
begin
	select 0, @dwConnectionIndex, @dwPlayerMapNum, @dwPlayerIndex, @dwPartyIndex, @dwKeyIndex, @dwItemIndex, @dwItemSlot, 
		@dwDungeonMapNum, @dwDungeonDifficulty, 0, 0, 999999
	return
end


select 0, @dwConnectionIndex, @dwPlayerMapNum, @dwPlayerIndex, @dwPartyIndex, @dwKeyIndex, @dwItemIndex, @dwItemSlot, 
	@dwDungeonMapNum, @dwDungeonDifficulty, TOTAL_VISIT, DAILY_VISIT,  datediff(minute, LAST_VISIT, getdate())
 from TB_DUNGEON where CHAR_IDX = @dwPlayerIndex and MAP_NUM = @dwDungeonMapNum
GO
/****** Object:  StoredProcedure [dbo].[MP_DUNGEONUPDATE]    Script Date: 07/30/2013 14:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MP_DUNGEONUPDATE]
(
	@dwPlayerIndex		int,
	@dwDungeonMapNum	int,
	@wTotalVisit		int,
	@wDailyVisit		int,
	@bRollback			int -- 입장실패 카운트를 감소시키자.
)
AS

set nocount on

if @bRollback = 1
begin
	if exists (select * from TB_DUNGEON where CHAR_IDX = @dwPlayerIndex  and MAP_NUM = @dwDungeonMapNum)
	begin
	update TB_DUNGEON
		set TOTAL_VISIT = TOTAL_VISIT-1, DAILY_VISIT = DAILY_VISIT-1, LAST_VISIT = dateadd("n", -2, getdate())
		where CHAR_IDX = @dwPlayerIndex and MAP_NUM = @dwDungeonMapNum
		return
	end
end
else
begin
	if exists (select * from TB_DUNGEON where CHAR_IDX = @dwPlayerIndex  and MAP_NUM = @dwDungeonMapNum)
	begin
	update TB_DUNGEON
		set TOTAL_VISIT = @wTotalVisit, DAILY_VISIT = @wDailyVisit, LAST_VISIT = getdate()
		where CHAR_IDX = @dwPlayerIndex and MAP_NUM = @dwDungeonMapNum
		return
	end

	begin
	insert TB_DUNGEON ( CHAR_IDX, MAP_NUM, TOTAL_VISIT, DAILY_VISIT, LAST_VISIT )
		values(@dwPlayerIndex,  @dwDungeonMapNum,  @wTotalVisit,  @wDailyVisit,  getdate())	
	end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_TUTORIAL_Load]    Script Date: 07/30/2013 14:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_TUTORIAL_Load]
(
	@CHARACTER_ID	int,
	@TUTORIAL_IDX	int,
	@IS_COMPLETE	tinyint
)
as
	Set	Nocount	on
	Set	Xact_abort on
	
if not exists (select count(*) from TB_TUTORIAL where CHARACTER_ID = @CHARACTER_ID)
	begin
		return
	end
else
	begin
		select TUTORIAL_IDX, IS_COMPLETE from TB_TUTORIAL where CHARACTER_ID = @CHARACTER_ID
		return
	end
GO
/****** Object:  StoredProcedure [dbo].[MP_TUTORIAL_Update]    Script Date: 07/30/2013 14:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_TUTORIAL_Update]
(
	@CHARACTER_ID	int, 
	@TUTORIAL_IDX	int,
	@IS_COMPLETE	tinyint
)
as
	Set	Nocount	On
	
	insert TB_TUTORIAL
	(
		CHARACTER_ID,
		TUTORIAL_IDX,
		IS_COMPLETE
	)
	values
	(
		@CHARACTER_ID,
		@TUTORIAL_IDX,
		@IS_COMPLETE
	)
GO
/****** Object:  StoredProcedure [dbo].[MP_FAMILY_CheckName]    Script Date: 07/30/2013 14:52:52 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 패밀리 정보를 DB에서 읽어옴
CREATE   PROC [dbo].[MP_FAMILY_CheckName] (@Name varchar(16))
as
	Set Nocount on
	Set Xact_abort on

begin
	-- 레코드가 생성되어 있지 않으면 받은 이름을 리턴
	if not exists (select null from TB_FAMILY where [Name] = @Name)
	begin
		select @Name
		return
	end
	-- 레코드가 생성되어 있으면 null 리턴
	else 
	begin
		select null
	end
end
GO
/****** Object:  StoredProcedure [dbo].[TP_FAMILY_DATA_SELECT]    Script Date: 07/30/2013 14:55:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_FAMILY_DATA_SELECT]
(
	@CHAR_IDX	INT
)
AS
	SET NOCOUNT ON
	
	DECLARE @FAMILY_IDX INT
	
	SELECT  @FAMILY_IDX = FamilyID
	FROM    TB_FAMILY_MEMBER
	WHERE   (MemberID = @CHAR_IDX)
	
	SELECT   ID, Name, HonorPoint, NicknameON, @CHAR_IDX AS CHAR_IDX, 
	                BUILD_DATE
	FROM      TB_FAMILY
	WHERE   (ID = @FAMILY_IDX)	
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_FAMILY_DATA_UPDATE]    Script Date: 07/30/2013 14:55:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071231 웅주, 추가
*/
CREATE PROCEDURE [dbo].[TP_FAMILY_DATA_UPDATE]
(
	@FAMILY_INDEX	INT,
	@POINT			INT	
)
AS
	SET NOCOUNT ON
	
	UPDATE	TB_FAMILY
	SET     HonorPoint = @POINT
	WHERE   (ID = @FAMILY_INDEX)
	
	IF 0 < @@ROWCOUNT
	BEGIN
		SELECT @FAMILY_INDEX, @POINT
	END
	ELSE
	BEGIN
		SELECT 0, 0
	END
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_FAMILY_LIST_SELECT]    Script Date: 07/30/2013 14:55:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[TP_FAMILY_LIST_SELECT]
(
	@KEYWORD		VARCHAR( 20 ),
	@IS_DISMISSED	TINYINT	-- 해체된 길드만 검색할 지 여부
)
AS
	SET NOCOUNT ON
	
	SELECT  TOP 100
			A.ID,
			A.Name,
			COUNT( B.MemberID ) AS SIZE,
			A.MasterID
	FROM    TB_FAMILY AS A LEFT JOIN
			TB_FAMILY_MEMBER AS B ON B.FamilyID = A.ID
	WHERE	A.Name LIKE @KEYWORD
	GROUP BY	A.ID,
				A.NAME,
				A.MasterID
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_FAMILY_UPDATE]    Script Date: 07/30/2013 14:55:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/*
071231 웅주, 추가
*/
CREATE PROCEDURE [dbo].[TP_FAMILY_UPDATE]
(
	@FAMILY_IDX INT,
	@POINT		INT
)
AS
	SET NOCOUNT ON
	
	UPDATE  TB_FAMILY
	SET		HonorPoint = @POINT
	WHERE   (ID = @FAMILY_IDX)
	
	IF 0 < @@ROWCOUNT
	BEGIN
		SELECT @FAMILY_IDX, @POINT
	END
	ELSE
	BEGIN
		SELECT 0,0
	END
	
	RETURN 
-- TB_BUFF의 REMAIN_TIME 필드를 BIGINT로 변경
ALTER TABLE DBO.TB_BUFF DROP CONSTRAINT [DF_TB_BUFF_REMAIN_TIME]
ALTER TABLE DBO.TB_BUFF ALTER COLUMN [REMAIN_TIME] BIGINT NOT NULL

-- TB_BUFF에 END_DATE 열을 추가하고 기본값을 NULL로 함
ALTER TABLE DBO.TB_BUFF ADD [END_DATE] DATETIME
CONSTRAINT [DF_TB_BUFF_END_DATE] DEFAULT (null)

SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[MP_FAMILY_LoadInfo]    Script Date: 07/30/2013 14:52:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 패밀리 정보를 DB에서 읽어옴
CREATE   PROC [dbo].[MP_FAMILY_LoadInfo] (@PlayerID int)
as
	Set Nocount on
	Set Xact_abort on

begin
	Declare @_FamilyID int
	Set	@_FamilyID = 0

	-- 레코드가 생성되어 있지 않으면return
	if not exists (select null from TB_FAMILY_MEMBER where MemberID = @PlayerID)
	begin
		return
	end
	-- 레코드가 생성되어 있으면 read
	else 
	begin
		-- 패밀리 ID 얻기
		select @_FamilyID = FamilyID
		from TB_FAMILY_MEMBER with(nolock) 
		where MemberID = @PlayerID

		-- 패밀리 기본 정보
		select [ID], [name], MasterID, HonorPoint, NicknameON
		from TB_FAMILY with(nolock)
		where [ID] = @_FamilyID
	end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_FAMILY_SaveInfo]    Script Date: 07/30/2013 14:52:54 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
--패밀리 정보 저장
CREATE   PROC [dbo].[MP_FAMILY_SaveInfo] 	           	(
							@Name 	varchar(16),
							@MasterID 	int,
							@HonorPoint 	int, 
							@NicknameON	int
							)
as
	Set Nocount on
	Set Xact_abort on

begin
	-- 레코드가 생성되어 있지 않으면 Insert
	if not exists (select null from TB_FAMILY where MasterID = @MasterID)
	begin
		insert TB_FAMILY
			(
			[Name],
			MasterID,
			HonorPoint,
			NicknameON
			)
		values
			(
			@Name,
			@MasterID,
			@HonorPoint,
			@NicknameON
			)

		-- 멤버 테이블에 자신 추가
		declare @ID int
		select @ID = [ID] from TB_FAMILY where MasterID = @MasterID
		exec dbo.MP_FAMILY_MEMBER_SaveInfo @ID, @MasterID, ''

 		-- 저장한 정보를 프로그램에 보내기 위한..
		select [ID], [Name], MasterID, HonorPoint, NicknameON
		from TB_FAMILY 
		where [MasterID] = @MasterID
	end
	-- 레코드가 생성되어 있으면 Update
	else
	begin
		update TB_FAMILY set HonorPoint = @HonorPoint, NicknameON = @NicknameON where [MasterID] = @MasterID
	end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_FAMILY_SaveInfo_HonorPoint]    Script Date: 07/30/2013 14:52:55 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
--패밀리 정보 저장
CREATE   PROC [dbo].[MP_FAMILY_SaveInfo_HonorPoint]     	
							(
							@MasterID	int,
							@HonorPoint	int
							)
as
	Set Nocount on
	Set Xact_abort on

begin
	update TB_FAMILY set HonorPoint = @HonorPoint where MasterID = @MasterID
end
GO
/****** Object:  StoredProcedure [dbo].[MP_FAMILY_LEAVE_SaveInfo]    Script Date: 07/30/2013 14:52:52 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
--패밀리 탈퇴 정보 저장
CREATE   PROC [dbo].[MP_FAMILY_LEAVE_SaveInfo]        	(
								@MemberID 		int,
								@LeaveDate	 	bigint,
								@LeaveKind		int,
								@BreakUp		int
								)
as
	Set Nocount on
	Set Xact_abort on

begin
	-- 레코드가 생성되어 있지 않으면 Insert
	declare @MasterID int
	set @MasterID = 0
	declare @FamilyID int
	set @FamilyID = 0

	if not exists (select null from TB_FAMILY_LEAVE where MemberID = @MemberID)
	begin
		if (@LeaveDate != 0)
		begin
			insert TB_FAMILY_LEAVE
				(
				MemberID,
				LeaveDate,
				LeaveKind
				)
			values
				(
				@MemberID,
				@LeaveDate,
				@LeaveKind
				)
		end
		-- 멤버 테이블에서 멤버 삭제. 멤버ID가 마스터ID로 들어올 때는 LeaveDate 만 저장한다.
		select @MasterID = MasterID from TB_FAMILY where MasterID = @MemberID
		if (@MasterID != @MemberID)
		begin
			delete TB_FAMILY_MEMBER where MemberID = @MemberID
		end
		-- 해체일 경우 멤버와 패밀리 정보 삭제
		if (@BreakUp != 0)
		begin
			select @FamilyID = [ID] from TB_FAMILY where MasterID = @MemberID
			delete TB_FAMILY_MEMBER where FamilyID = @FamilyID
			delete TB_FAMILY where [ID] = @FamilyID
			delete TB_FAMILY_EMBLEM where [ID] = @FamilyID
		end
	end
	-- 레코드가 생성되어 있으면 Update
	else
	begin
		if (@LeaveDate = 0)
			delete TB_FAMILY_LEAVE where MemberID = @MemberID
		else
		begin
			update TB_FAMILY_LEAVE set LeaveDate = @LeaveDate , LeaveKind = @LeaveKind where MemberID = @MemberID
			select @MasterID = MasterID from TB_FAMILY where MasterID = @MemberID
			if (@MasterID != @MemberID)
			begin
				delete TB_FAMILY_MEMBER where MemberID = @MemberID
			end
		end
		-- 해체일 경우 멤버와 패밀리 정보 삭제
		if (@BreakUp != 0)
		begin
			select @FamilyID = [ID] from TB_FAMILY where MasterID = @MemberID
			delete TB_FAMILY_MEMBER where FamilyID = @FamilyID
			delete TB_FAMILY where [ID] = @FamilyID
			delete TB_FAMILY_EMBLEM where [ID] = @FamilyID
		end
	end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_FAMILY_SaveInfo_Emblem]    Script Date: 07/30/2013 14:52:54 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE       proc [dbo].[MP_FAMILY_SaveInfo_Emblem] ( @FamilyID int , @imgData varbinary(1000) )
AS
	Set Nocount on
	Set Xact_Abort on

if not exists ( select null from TB_FAMILY_EMBLEM where [ID] = @FamilyID )
begin
	insert TB_FAMILY_EMBLEM
		(
		[ID], 
		imgData
		)
	values 
		(
		@FamilyID,
		@imgData
		)
end
else
begin
	update TB_FAMILY_EMBLEM set imgData = @imgData where [ID] = @FamilyID
end
GO
/****** Object:  StoredProcedure [dbo].[MP_FAMILY_LoadInfo_Emblem]    Script Date: 07/30/2013 14:52:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_FAMILY_LoadInfo_Emblem] ( @FamilyID int )
as
	Set Nocount On
	Set Xact_Abort On

select [ID], imgData from TB_FAMILY_EMBLEM where [ID] = @FamilyID
GO
/****** Object:  StoredProcedure [dbo].[MP_VEHICLE_LOAD]    Script Date: 07/30/2013 14:54:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
090316 LUJ, 가장 최근에 탑승한 탈 것을 읽는다.
*/
CREATE         PROCEDURE [dbo].[MP_VEHICLE_LOAD]
(
	@CHAR_IDX INT,
	@MAP_IDX INT
)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON

	-- 090316 LUJ, 맵에 존재하는 탈것 정보를 얻지 못할 경우
	--	나중에 그 맵에 다시 돌아가더라도 자동 소환하지
	--	않도록 맵 번호를 초기화시킨다
	IF NOT EXISTS (
		SELECT NULL
		FROM TB_VEHICLE
		WHERE CHAR_IDX = @CHAR_IDX AND MAP_IDX = @MAP_IDX )
	BEGIN
		UPDATE TB_VEHICLE
		SET MAP_IDX = 0
		WHERE CHAR_IDX = @CHAR_IDX

		SELECT 0, 0, 0
		RETURN
	END

	DECLARE @PASSENGER_COUNT INT
	
	SELECT @PASSENGER_COUNT = COUNT( PASSENGER_CHAR_IDX )
	FROM TB_VEHICLE_PASSENGER
	WHERE DRIVER_CHAR_IDX = @CHAR_IDX

	SELECT	TOP 1
		ITEM_IDX,
		ITEM_POSITION,
		ISNULL( @PASSENGER_COUNT, 0 )
	FROM	TB_VEHICLE
	WHERE	CHAR_IDX = @CHAR_IDX AND
		MAP_IDX = @MAP_IDX
	ORDER BY UPDATED_DATE
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_VEHICLE_RESET]    Script Date: 07/30/2013 14:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
090316 LUJ, 초기화를 위해, 맵 서버가 시작될때 관련된 탈것 정보를 지운다.
*/
CREATE  PROCEDURE [dbo].[MP_VEHICLE_RESET]
(
	@MAP_IDX INT
)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON

	-- 090316 LUJ, 자동 소환할 수 없도록 맵 번호를 초기화한다
	UPDATE TB_VEHICLE
	SET MAP_IDX = 0
	WHERE MAP_IDX = @MAP_IDX

	-- 090316 LUJ, 자동 탑승할 수 없도록 지운다
	DELETE
	FROM TB_VEHICLE_PASSENGER
	WHERE MAP_IDX = @MAP_IDX
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_VEHICLE_UPDATE]    Script Date: 07/30/2013 14:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
090316 LUJ, 탈것 정보를 갱신한다.
*/
CREATE      PROCEDURE [dbo].[MP_VEHICLE_UPDATE]
(
	@CHAR_IDX INT,
	@ITEM_IDX INT,
	@ITEM_POSITION INT,
	@MAP_IDX INT	
)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON

	UPDATE	TB_VEHICLE
	SET	MAP_IDX = @MAP_IDX,
		ITEM_POSITION = @ITEM_POSITION,
		UPDATED_DATE = GETDATE()
	WHERE	ITEM_IDX = @ITEM_IDX AND
		CHAR_IDX = @CHAR_IDX

	IF 0 = @@ROWCOUNT
	BEGIN
		INSERT	TB_VEHICLE (
			CHAR_IDX,
			ITEM_POSITION,
			ITEM_IDX,
			MAP_IDX,
			UPDATED_DATE )
		VALUES (
			@CHAR_IDX,
			@ITEM_POSITION,
			@ITEM_IDX,
			@MAP_IDX,
			GETDATE() )		
	END
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_VEHICLE_PASSENGER_LOAD]    Script Date: 07/30/2013 14:54:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
090316 LUJ, 자신이 탑승한 탈것 소유주 정보를 얻는다
*/
CREATE    PROCEDURE [dbo].[MP_VEHICLE_PASSENGER_LOAD]
(
	@CHAR_IDX INT,
	@MAP_IDX INT
)
AS
	SET NOCOUNT ON

	SELECT DRIVER_CHAR_IDX,
		PASSENGER_CHAR_IDX,
		SEAT_IDX,
		MAP_IDX
	FROM TB_VEHICLE_PASSENGER
	WHERE ( DRIVER_CHAR_IDX = @CHAR_IDX OR
		PASSENGER_CHAR_IDX = @CHAR_IDX ) AND
		MAP_IDX = @MAP_IDX
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_VEHICLE_PASSENGER_UPDATE]    Script Date: 07/30/2013 14:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
090316 LUJ, 승객 정보를 삽입한다. 쿼리 호출 회수를 줄이기 위해
	인자를 동시에 처리한다. 현재는 최대 10개
*/
CREATE  proc [dbo].[MP_VEHICLE_PASSENGER_UPDATE]
(
	@DRIVER_CHAR_IDX INT,
	@MAP_IDX INT,
	@SEAT_IDX1 INT = 0,
	@PASSENGER_CHAR_IDX1 INT = 0,
	@SEAT_IDX2 INT = 0,
	@PASSENGER_CHAR_IDX2 INT = 0,
	@SEAT_IDX3 INT = 0,
	@PASSENGER_CHAR_IDX3 INT = 0,
	@SEAT_IDX4 INT = 0,
	@PASSENGER_CHAR_IDX4 INT = 0,
	@SEAT_IDX5 INT = 0,
	@PASSENGER_CHAR_IDX5 INT = 0,
	@SEAT_IDX6 INT = 0,
	@PASSENGER_CHAR_IDX6 INT = 0,
	@SEAT_IDX7 INT = 0,
	@PASSENGER_CHAR_IDX7 INT = 0,
	@SEAT_IDX8 INT = 0,
	@PASSENGER_CHAR_IDX8 INT = 0,
	@SEAT_IDX9 INT = 0,
	@PASSENGER_CHAR_IDX9 INT = 0,
	@SEAT_IDX10 INT = 0,
	@PASSENGER_CHAR_IDX10 INT = 0
)
AS
	SET NOCOUNT ON

	DELETE
	FROM	TB_VEHICLE_PASSENGER
	WHERE	DRIVER_CHAR_IDX = @DRIVER_CHAR_IDX

	IF 0 < @SEAT_IDX1
	BEGIN
		INSERT INTO TB_VEHICLE_PASSENGER (
			DRIVER_CHAR_IDX,
			MAP_IDX,
			SEAT_IDX,
			PASSENGER_CHAR_IDX )
		VALUES (
			@DRIVER_CHAR_IDX,
			@MAP_IDX,
			@SEAT_IDX1,
			@PASSENGER_CHAR_IDX1 )
	END

	IF 0 < @SEAT_IDX2
	BEGIN
		INSERT INTO TB_VEHICLE_PASSENGER (
			DRIVER_CHAR_IDX,
			MAP_IDX,
			SEAT_IDX,
			PASSENGER_CHAR_IDX )
		VALUES (
			@DRIVER_CHAR_IDX,
			@MAP_IDX,
			@SEAT_IDX2,
			@PASSENGER_CHAR_IDX2 )
	END

	IF 0 < @SEAT_IDX3
	BEGIN
		INSERT INTO TB_VEHICLE_PASSENGER (
			DRIVER_CHAR_IDX,
			MAP_IDX,
			SEAT_IDX,
			PASSENGER_CHAR_IDX )
		VALUES (
			@DRIVER_CHAR_IDX,
			@MAP_IDX,
			@SEAT_IDX3,
			@PASSENGER_CHAR_IDX3 )
	END

	IF 0 < @SEAT_IDX4
	BEGIN
		INSERT INTO TB_VEHICLE_PASSENGER (
			DRIVER_CHAR_IDX,
			MAP_IDX,
			SEAT_IDX,
			PASSENGER_CHAR_IDX )
		VALUES (
			@DRIVER_CHAR_IDX,
			@MAP_IDX,
			@SEAT_IDX4,
			@PASSENGER_CHAR_IDX4 )
	END

	IF 0 < @SEAT_IDX5
	BEGIN
		INSERT INTO TB_VEHICLE_PASSENGER (
			DRIVER_CHAR_IDX,
			MAP_IDX,
			SEAT_IDX,
			PASSENGER_CHAR_IDX )
		VALUES (
			@DRIVER_CHAR_IDX,
			@MAP_IDX,
			@SEAT_IDX5,
			@PASSENGER_CHAR_IDX5 )
	END

	IF 0 < @SEAT_IDX6
	BEGIN
		INSERT INTO TB_VEHICLE_PASSENGER (
			DRIVER_CHAR_IDX,
			MAP_IDX,
			SEAT_IDX,
			PASSENGER_CHAR_IDX )
		VALUES (
			@DRIVER_CHAR_IDX,
			@MAP_IDX,
			@SEAT_IDX6,
			@PASSENGER_CHAR_IDX6 )
	END

	IF 0 < @SEAT_IDX7
	BEGIN
		INSERT INTO TB_VEHICLE_PASSENGER (
			DRIVER_CHAR_IDX,
			MAP_IDX,
			SEAT_IDX,
			PASSENGER_CHAR_IDX )
		VALUES (
			@DRIVER_CHAR_IDX,
			@MAP_IDX,
			@SEAT_IDX7,
			@PASSENGER_CHAR_IDX7 )
	END

	IF 0 < @SEAT_IDX8
	BEGIN
		INSERT INTO TB_VEHICLE_PASSENGER (
			DRIVER_CHAR_IDX,
			MAP_IDX,
			SEAT_IDX,
			PASSENGER_CHAR_IDX )
		VALUES (
			@DRIVER_CHAR_IDX,
			@MAP_IDX,
			@SEAT_IDX8,
			@PASSENGER_CHAR_IDX8 )
	END

	IF 0 < @SEAT_IDX9
	BEGIN
		INSERT INTO TB_VEHICLE_PASSENGER (
			DRIVER_CHAR_IDX,
			MAP_IDX,
			SEAT_IDX,
			PASSENGER_CHAR_IDX )
		VALUES (
			@DRIVER_CHAR_IDX,
			@MAP_IDX,
			@SEAT_IDX9,
			@PASSENGER_CHAR_IDX9 )
	END

	IF 0 < @SEAT_IDX10
	BEGIN
		INSERT INTO TB_VEHICLE_PASSENGER (
			DRIVER_CHAR_IDX,
			MAP_IDX,
			SEAT_IDX,
			PASSENGER_CHAR_IDX )
		VALUES (
			@DRIVER_CHAR_IDX,
			@MAP_IDX,
			@SEAT_IDX10,
			@PASSENGER_CHAR_IDX10 )
	END
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_VEHICLE_PASSENGER_REMOVE]    Script Date: 07/30/2013 14:54:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
090316 LUJ, 탑승자를 내리도록 한다
*/
CREATE  PROCEDURE [dbo].[MP_VEHICLE_PASSENGER_REMOVE]
(
	@CHAR_IDX INT
)
AS
	SET NOCOUNT ON

	DELETE
	FROM TB_VEHICLE_PASSENGER
	WHERE PASSENGER_CHAR_IDX = @CHAR_IDX	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_FAMILY_LEAVE_LoadInfo]    Script Date: 07/30/2013 14:52:52 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 패밀리 탈퇴 정보를 DB에서 읽어옴
CREATE   PROC [dbo].[MP_FAMILY_LEAVE_LoadInfo] (@MemberID int)
as
	Set Nocount on
	Set Xact_abort on

begin
	-- 레코드가 생성되어 있지 않으면return
	if not exists (select null from TB_FAMILY_LEAVE where MemberID = @MemberID)
	begin
		return
	end
	-- 레코드가 생성되어 있으면 read
	else 
	begin
		select LeaveDate, LeaveKind
		from TB_FAMILY_LEAVE with(nolock)
		where MemberID = @MemberID
	end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_WANTED_LoadList]    Script Date: 07/30/2013 14:54:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[MP_WANTED_LoadList] (@StartWantedIDX int)

as

	Set Nocount on

select top 100 Wanted_Idx, WantedChr_Idx, WantedChr_Name, Prize, RegistChr_Idx, VolunteerNum
	from tb_wantedinfo with(nolock) where Wanted_Idx > @StartWantedIDX
GO
/****** Object:  StoredProcedure [dbo].[MP_WANTED_InfoByUserLogIn]    Script Date: 07/30/2013 14:54:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE       proc [dbo].[MP_WANTED_InfoByUserLogIn] (@CharacterIDX int)
as

	Set Nocount on

	declare @MyWantIdx int

set @MyWantIdx = 0
select @MyWantIdx = Wanted_idx from tb_wantedinfo where WantedChr_idx = @CharacterIDX 

if not exists ( select null from tb_WantedList where Character_Idx = @CharacterIDX  and bComplete = 0 )
begin
	select @MyWantIdx,
		0,
		0,
		'',
		''
end
else
begin
	select 	@MyWantIdx, 
		Wanted_Idx, 
		WantedChr_Idx, 
		WantedChr_Name, 
		convert(varchar(30), RegistDate, 102) 
	from tb_wantedinfo  
	where Wanted_Idx in 
		( select Wanted_Idx 
		from tb_WantedList 
		where Character_Idx = @CharacterIDX and bComplete = 0) -- 해결이 된것은 wantedinfo 테이블에서 지운다.
end
GO
/****** Object:  StoredProcedure [dbo].[MP_WANTED_DeleteWantedInfo]    Script Date: 07/30/2013 14:54:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_WANTED_DeleteWantedInfo] ( @WantedIDX int )
as
	Set Nocount on

delete tb_wantedinfo where Wanted_Idx = @WantedIDX
GO
/****** Object:  StoredProcedure [dbo].[MP_WANTED_BuyRight]    Script Date: 07/30/2013 14:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE          proc [dbo].[MP_WANTED_BuyRight] (@CharacterIDX int, @WantedIDX int, @Prize decimal)

as

	Set Nocount on
	Set Xact_Abort on
	declare @PlayerName varchar(16)

-- 척살권 최대 갯수 : 100

if exists ( select null from tb_wantedlist where Character_Idx = @CharacterIDX and Wanted_Idx = @WantedIDX and bComplete = 0)
begin
	return
end
if (select count(*) from tb_wantedlist where Character_Idx = @CharacterIDX and bComplete = 0 ) >= 20
begin
	return
end


begin
	update tb_wantedinfo set volunteernum = volunteernum+1, Prize = Prize + @Prize 
	where Wanted_Idx = @WantedIDX

	insert tb_wantedlist
		(
		Character_Idx,
		Wanted_Idx,
		bComplete
		)
	values
		(
		@CharacterIDX,
		@WantedIDX,
		0
		)
end
GO
/****** Object:  StoredProcedure [dbo].[MP_WANTED_OrderList]    Script Date: 07/30/2013 14:54:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_WANTED_OrderList] (@GotoPage int, @OrderType varchar(32), @pagesize int )
as
	Set Nocount On

	declare @TotalNum int
	declare @SQL VARCHAR(400)
	select @TotalNum = count(*) from TB_WANTEDINFO with(nolock)
	set @TotalNum = ceiling((@TotalNum - 1)/@pagesize) + 1


if(@GotoPage = 1)
begin
/*	declare @TotalNum int
	declare @SQL VARCHAR(400)
	declare @pagesize int 
	declare @ordertype varchar(16)
	set @pagesize = 4
	set @ordertype = 'Wanted_idx'
	select @TotalNum = count(*) from TB_WANTEDLIST
	set @TotalNum = ceiling((@TotalNum - 1)/@pagesize) + 1
*/
	set @sql = 'select top  ' + CONVERT(VARCHAR(10), @pagesize)
	set @sql = @sql + ' '
	set @sql = @sql + CONVERT(VARCHAR(10),@TotalNum)
	set @sql = @sql + ', Wanted_idx, WantedChr_Name, Prize, volunteernum from tb_wantedinfo order by '
	set @sql = @sql + CONVERT(VARCHAR(32),(@OrderType))
	set @sql = @sql + ' desc'
	exec (@sql)
end
else
begin
	set @sql = 'select top ' + CONVERT(VARCHAR(10), @pagesize)
	set @sql = @sql + ' '
	set @sql = @sql + CONVERT(VARCHAR(10),@TotalNum)
	set @sql = @sql + ',  Wanted_idx, WantedChr_Name, Prize, volunteernum from tb_wantedinfo '
	set @sql = @sql + 'where Wanted_Idx not  in ( select top '
	set @sql = @sql +  CONVERT(VARCHAR(10),((@GotoPage - 1)*@pagesize))
	set @sql = @sql + ' Wanted_Idx from tb_wantedinfo '
	set @sql = @sql + ' order by '
	set @sql = @sql + CONVERT(VARCHAR(32),(@OrderType))
	set @sql = @sql + ' desc ) order by '
	set @sql = @sql + CONVERT(VARCHAR(32),(@OrderType))
	set @sql = @sql + ' desc' 
	exec (@sql)
end
GO
/****** Object:  StoredProcedure [dbo].[MP_WANTED_GiveUpRight]    Script Date: 07/30/2013 14:54:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     proc [dbo].[MP_WANTED_GiveUpRight] (@CharacterIDX int, @WantedIDX int)

as

	Set Nocount on
	Set Xact_Abort on


	update tb_wantedinfo set VolunteerNum  = VolunteerNum - 1 where  Wanted_Idx = @WantedIDX
	delete tb_wantedlist
	where Character_Idx = @CharacterIDX and Wanted_Idx = @WantedIDX

--update tb_wantedlist set bComplete = 4 where Character_Idx = @CharacterIDX and Wanted_Idx = @WantedIDX
GO
/****** Object:  StoredProcedure [dbo].[MP_FAMILY_LOADINFO_MAPSRV]    Script Date: 07/30/2013 14:52:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[MP_FAMILY_LOADINFO_MAPSRV] ( @CHARACTER_IDX int )

AS

	SET NOCOUNT ON
	SET XACT_ABORT ON

	SELECT FAMILYID FROM TB_FAMILY_MEMBER WHERE MEMBERID = @CHARACTER_IDX
GO
/****** Object:  StoredProcedure [dbo].[MP_FAMILY_MEMBER_LoadInfo]    Script Date: 07/30/2013 14:52:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 패밀리 멤버 정보를 DB에서 읽어옴
CREATE   PROC [dbo].[MP_FAMILY_MEMBER_LoadInfo] (@FamilyID int)
as
	Set Nocount on
	Set Xact_abort on

begin
	-- 레코드가 생성되어 있지 않으면return
	if not exists (select null from TB_FAMILY_MEMBER where FamilyID = @FamilyID)
	begin
		return
	end
	-- 레코드가 생성되어 있으면 read
	else 
	begin
		select MemberID, MemberNickname
		from TB_FAMILY_MEMBER with(nolock)
		where FamilyID = @FamilyID
	end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_FAMILY_MEMBER_SaveInfo]    Script Date: 07/30/2013 14:52:54 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
--패밀리 멤버 정보 저장
CREATE   PROC [dbo].[MP_FAMILY_MEMBER_SaveInfo]        	(
								@FamilyID 		int,
								@MemberID 		int,
								@MemberNickname 	varchar(16)
								)
as
	Set Nocount on
	Set Xact_abort on

begin
	-- 레코드가 생성되어 있지 않으면 Insert
	if not exists (select null from TB_FAMILY_MEMBER where MemberID = @MemberID)
	begin
		insert TB_FAMILY_MEMBER
			(
			FamilyID,
			MemberID,
			MemberNickname
			)
		values
			(
			@FamilyID,
			@MemberID,
			' '
			)
	end
	-- 레코드가 생성되어 있으면 Update
	else
	begin
		update TB_FAMILY_MEMBER set MemberNickname = @MemberNickname where MemberID = @MemberID
	end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_FARM_CROP_SELECT]    Script Date: 07/30/2013 14:52:55 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/*
081017 LUJ, 농장 정보를 일괄로 쿼리함
090520 LUJ, 지역으로 구분해서 읽도록 수정
*/
CREATE    PROC [dbo].[MP_FARM_CROP_SELECT]
(
	@ZONE_IDX 		INT, 
	@LAST_FARM_IDX	INT,
	@LAST_CROP_IDX	INT
)
as
	SET NOCOUNT ON
	SET XACT_ABORT ON

	DECLARE @LAST_IDX INT
	SET @LAST_IDX =  @LAST_FARM_IDX * 10000 + @LAST_CROP_IDX

	-- 패밀리 테이블을 참조해서 패밀리 멤버인지 확인한다.
	-- 농장맵이 꺼져있는 상태에서 패밀리 탈퇴/추방/해체가 발생하면 농장정보에 반영되지 않기 때문에
	-- 농작물의 소유주가 패밀리 멤버가 아니면 읽지 않고 지운다.
	DELETE
	FROM	TB_FARM_CROP
	WHERE	ZONE = @ZONE_IDX AND
		CROPOWNERID NOT IN
		(
			SELECT	MEMBERID
			FROM	TB_FAMILY_MEMBER
		)

	SELECT	TOP 100
		FARM,
		CROP,
		CROPOWNERID,
		CROPKIND,
		CROPSTEP,
		CROPLIFE,
		CROPNEXTSTEPTIME,
		CROPSEEDGRADE,
		FARM * 10000 + CROP AS CROP_IDX
	FROM	TB_FARM_CROP
	WHERE	FARM * 10000 + CROP > @LAST_IDX AND
		ZONE = @ZONE_IDX
	ORDER BY CROP_IDX

	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_FARM_ANIMAL_SELECT]    Script Date: 07/30/2013 14:52:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
081017 LUJ, 가축 정보를 읽는다
090520 LUJ, 지역으로 구분해서 읽도록 수정
*/
CREATE          PROC [dbo].[MP_FARM_ANIMAL_SELECT]
(
	@ZONE_IDX		INT,
	@LAST_FARM_IDX	INT,
	@LAST_ANIMAL_IDX	INT
)
AS 
	SET NOCOUNT ON
	SET XACT_ABORT ON

	DECLARE @LAST_IDX INT
	SET @LAST_IDX =  @LAST_FARM_IDX * 10000 + @LAST_ANIMAL_IDX

	-- 패밀리 테이블을 참조해서 패밀리 멤버인지 확인한다.
	-- 농장맵이 꺼져있는 상태에서 패밀리 탈퇴/추방/해체가 발생하면 농장정보에 반영되지 않기 때문에
	-- 농작물의 소유주가 패밀리 멤버가 아니면 읽지 않고 지운다.
	DELETE
	FROM	TB_FARM_ANIMAL
	WHERE	ZONE = @ZONE_IDX AND
		ANIMALOWNERID NOT IN
		(
			SELECT	MEMBERID
			FROM	TB_FAMILY_MEMBER
		)

	SELECT	TOP 100
		FARM,
		ANIMAL,
		ANIMALOWNERID,
		ANIMALKIND,
		ANIMALSTEP,
		ANIMALLIFE,
		ANIMALNEXTSTEPTIME,
		ANIMALCONTENTMENT,
		ANIMALINTEREST,
		FARM * 10000 + ANIMAL AS ANIMAL_IDX
	FROM	TB_FARM_ANIMAL
	WHERE	FARM * 10000 + ANIMAL > @LAST_IDX AND
		ZONE = @ZONE_IDX
	ORDER BY ANIMAL_IDX
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_FARM_LoadAnimalInfo]    Script Date: 07/30/2013 14:52:56 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- 가축의 정보를 DB에서 읽어옴
CREATE    PROC [dbo].[MP_FARM_LoadAnimalInfo] (@ZONE_INDEX int, @FARM_INDEX int, @ANIMAL_INDEX int)
as
	Set Nocount on
	Set Xact_abort on

begin
	-- 레코드가 생성되어 있지 않으면return
	if not exists (select null from TB_FARM_ANIMAL where Zone = @ZONE_INDEX and Farm = @FARM_INDEX and Animal = @ANIMAL_INDEX)
	begin
		return
	end
	-- 레코드가 생성되어 있으면 read
	else 
	begin
		-- 패밀리 테이블을 참조해서 패밀리 멤버인지 확인한다.
                           -- 농장맵이 꺼져있는 상태에서 패밀리 탈퇴/추방/해체가 발생하면 농장정보에 반영되지 않기 때문에
		-- 농작물의 소유주가 패밀리 멤버가 아니면 읽지 않고 지운다.
                           declare @OwnerID int
		set @OwnerID  = 0
		select @OwnerID = AnimalOwnerID from TB_FARM_ANIMAL with(nolock) where Zone = @ZONE_INDEX and Farm = @FARM_INDEX and Animal = @ANIMAL_INDEX
                           if exists (select null  from TB_FAMILY_MEMBER where MemberID = @OwnerID)
		begin
			select Zone, Farm, Animal, AnimalOwnerID, AnimalKind, AnimalStep, AnimalLife, AnimalNextStepTime, AnimalContentment, AnimalInterest  from TB_FARM_ANIMAL with(nolock) where Zone = @ZONE_INDEX and Farm = @FARM_INDEX and Animal = @ANIMAL_INDEX
		end
		else
		begin
			delete from TB_FARM_ANIMAL where Zone = @ZONE_INDEX and Farm = @FARM_INDEX and Animal = @ANIMAL_INDEX
		end
	end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_FARM_LoadCropInfo]    Script Date: 07/30/2013 14:52:56 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/*
-- 농작물의 정보를 DB에서 읽어옴
ALTER    PROC dbo.MP_FARM_LOADCROPINFO (
	@ZONE_INDEX 		INT, 
	@LAST_CROP_IDX	INT
)
as
	SET NOCOUNT ON
	SET XACT_ABORT ON

	-- 패밀리 테이블을 참조해서 패밀리 멤버인지 확인한다.
	-- 농장맵이 꺼져있는 상태에서 패밀리 탈퇴/추방/해체가 발생하면 농장정보에 반영되지 않기 때문에
	-- 농작물의 소유주가 패밀리 멤버가 아니면 읽지 않고 지운다.
	DELETE
	FROM	TB_FARM_CROP
	WHERE	ZONE = @ZONE_INDEX AND
		CROPOWNERID NOT IN
		(
			SELECT	MEMBERID
			FROM	TB_FAMILY_MEMBER
		)

	SELECT	TOP 100
		FARM,
		CROP,
		CROPOWNERID,
		CROPKIND,
		CROPSTEP,
		CROPLIFE,
		CROPNEXTSTEPTIME,
		CROPSEEDGRADE,
		FARM * 10000 + CROP AS CROP_IDX
	FROM	TB_FARM_CROP
	WHERE	FARM * 10000 + CROP > @LAST_CROP_IDX
	ORDER BY CROP_IDX

	RETURN
*/
-- 081017 LUJ, 이전 코드
-- 농작물의 정보를 DB에서 읽어옴
CREATE    PROC [dbo].[MP_FARM_LoadCropInfo] (@ZONE_INDEX int, @FARM_INDEX int, @CROP_INDEX int)
as
	Set Nocount on
	Set Xact_abort on

begin
	-- 레코드가 생성되어 있지 않으면return
	if not exists (select null from TB_FARM_CROP where Zone = @ZONE_INDEX and Farm = @FARM_INDEX and Crop = @CROP_INDEX)
	begin
		return
	end
	-- 레코드가 생성되어 있으면 read
	else 
	begin
		-- 패밀리 테이블을 참조해서 패밀리 멤버인지 확인한다.
                           -- 농장맵이 꺼져있는 상태에서 패밀리 탈퇴/추방/해체가 발생하면 농장정보에 반영되지 않기 때문에
		-- 농작물의 소유주가 패밀리 멤버가 아니면 읽지 않고 지운다.
                           declare @OwnerID int
		set @OwnerID  = 0
		select @OwnerID = CropOwnerID from TB_FARM_CROP with(nolock) where Zone = @ZONE_INDEX and Farm = @FARM_INDEX and Crop = @CROP_INDEX
                           if exists (select null  from TB_FAMILY_MEMBER where MemberID = @OwnerID)
		begin
			select Zone, Farm, Crop, CropOwnerID, CropKind, CropStep, CropLife, CropNextStepTime, CropSeedGrade  from TB_FARM_CROP with(nolock) where Zone = @ZONE_INDEX and Farm = @FARM_INDEX and Crop = @CROP_INDEX
		end
		else
		begin
			delete from TB_FARM_CROP where Zone = @ZONE_INDEX and Farm = @FARM_INDEX and Crop = @CROP_INDEX
		end
	end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_WANTED_MyList]    Script Date: 07/30/2013 14:54:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[MP_WANTED_MyList] ( @CharacterIDX int, @GotoPage int, @pagesize int )
as
	Set Nocount On
	Set Xact_Abort On
	DECLARE @SQL VARCHAR(400)
	declare @TotalNum int

	select @TotalNum = count(*) from TB_WANTEDLIST where character_idx  = @CharacterIDX  and bComplete = 0
	set @TotalNum = ceiling((@TotalNum - 1)/@pagesize) + 1

if(@GotoPage = 1)
begin
	set @sql = 'select top  ' + CONVERT(VARCHAR(10), @pagesize)
	set @sql = @sql + ' '
	set @sql = @sql + CONVERT(VARCHAR(10),@TotalNum)
	set @sql = @sql + ', Wanted_idx, WantedChr_Name, Prize, volunteernum from tb_wantedinfo where Wanted_Idx in '
	set @sql = @sql + '( select Wanted_idx from tb_wantedlist where character_idx =  '
	set @sql = @sql +  CONVERT(VARCHAR(10), @CharacterIDX)
	set @sql = @sql + ' and  bComplete = 0'
	set @sql = @sql + ' ) order by Wanted_idx desc'
	exec (@sql)
end

else
begin
/*	DECLARE @SQL VARCHAR(400)
	declare @TotalNum int
	declare @pagesize int
	declare @characteridx int
	declare @gotopage int

	set @gotopage = 3
	set @characteridx = 35070
	set @pagesize = 4
	select @TotalNum = count(*) from TB_WANTEDLIST where character_idx  = @CharacterIDX
	set @TotalNum = ceiling((@TotalNum - 1)/@pagesize) + 1
*/ 
	set @sql = 'select top ' + CONVERT(VARCHAR(10), @pagesize)
	set @sql = @sql + ' '
	set @sql = @sql + CONVERT(VARCHAR(10),@TotalNum)
	set @sql = @sql + ',  Wanted_idx, WantedChr_Name, Prize, volunteernum from tb_wantedinfo '
	set @sql = @sql + 'where Wanted_Idx in ( select Wanted_Idx from tb_wantedlist where character_idx = '
	set @sql = @sql + CONVERT(VARCHAR(32),(@CharacterIDX))  
	set @sql = @sql + ' ) and Wanted_Idx not  in ( select top '
	set @sql = @sql +  CONVERT(VARCHAR(10),((@GotoPage - 1)*@pagesize))
	set @sql = @sql + ' Wanted_Idx from tb_wantedinfo where Wanted_Idx in '
	set @sql = @sql + '(select Wanted_Idx from tb_wantedlist '
	set @sql = @sql + 'where character_idx = '
	set @sql = @sql +CONVERT(VARCHAR(32),(@CharacterIDX))
	set @sql = @sql + ' and bComplete = 0'
	set @sql = @sql + ') order by Wanted_idx '
	set @sql = @sql + ' desc ) order by Wanted_idx desc'
	exec (@sql)
end
GO
/****** Object:  StoredProcedure [dbo].[MP_FARM_SetAnimalInfo]    Script Date: 07/30/2013 14:52:57 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 가축 정보를 설정
CREATE     PROC [dbo].[MP_FARM_SetAnimalInfo]	(	
						@ZONE_INDEX int, 
					         	@FARM_INDEX int, 
						@ANIMAL_INDEX int,
						@ANIMAL_OWNER int, 	
						@ANIMAL_KIND int, 
						@ANIMAL_STEP int, 
						@ANIMAL_LIFE int, 
						@ANIMAL_NEXTSTEPTIME int,
						@ANIMAL_CONTENTMENT int,
						@ANIMAL_INTEREST int
						--@ANIMAL_SEEDGRADE int
						)						 
as
	Set Nocount on
	Set Xact_abort on

begin
	if @ANIMAL_LIFE = 0
	begin
		delete from TB_FARM_ANIMAL where Zone = @ZONE_INDEX and Farm = @FARM_INDEX and Animal = @ANIMAL_INDEX
		return
	end

	-- 레코드가 생성되어 있지 않으면 Insert
	if not exists (select null from TB_FARM_ANIMAL where Zone = @ZONE_INDEX and Farm = @FARM_INDEX and Animal = @ANIMAL_INDEX)
	begin
		insert TB_FARM_ANIMAL
			(
			Zone,
			Farm,
			Animal,
			AnimalOwnerID,
			AnimalKind,
			AnimalStep,
			AnimalLife,
			AnimalNextStepTime,
			AnimalContentment,
			AnimalInterest
			--AnimalSeedGrade
			)
		values
			(
			@ZONE_INDEX,
			@FARM_INDEX,
			@ANIMAL_INDEX,
			@ANIMAL_OWNER,
			@ANIMAL_KIND,
			@ANIMAL_STEP,
			@ANIMAL_LIFE,
			@ANIMAL_NEXTSTEPTIME,
			@ANIMAL_CONTENTMENT,
			@ANIMAL_INTEREST
			--@ANIMAL_SEEDGRADE
			)
	end
	-- 레코드가 이미 생성되어 있으면 Update
	else 
	begin
		update TB_FARM_ANIMAL
			set 	AnimalOwnerID = @ANIMAL_OWNER, 
				AnimalKind = @ANIMAL_KIND, 
				AnimalStep = @ANIMAL_STEP,
				AnimalLife = @ANIMAL_LIFE,
				AnimalNextStepTime = @ANIMAL_NEXTSTEPTIME,
				AnimalContentment = @ANIMAL_CONTENTMENT,
				AnimalInterest = @ANIMAL_INTEREST
				--AnimalSeedGrade = @ANIMAL_SEEDGRADE
			where	 Zone = @ZONE_INDEX and 
				Farm = @FARM_INDEX and 
				Animal = @ANIMAL_INDEX
	end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_FARM_SetCropInfo]    Script Date: 07/30/2013 14:52:58 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 농작물의 정보를 설정
CREATE   PROC [dbo].[MP_FARM_SetCropInfo]	(	
						@ZONE_INDEX int, 
					         	@FARM_INDEX int, 
						@CROP_INDEX int,
						@CROP_OWNER int, 	
						@CROP_KIND int, 
						@CROP_STEP int, 
						@CROP_LIFE int, 
						@CROP_NEXTSTEPTIME int,
						@CROP_SEEDGRADE int
						)						 
as
	Set Nocount on
	Set Xact_abort on

begin
	if @CROP_LIFE = 0
	begin
		delete from TB_FARM_CROP where Zone = @ZONE_INDEX and Farm = @FARM_INDEX and Crop = @CROP_INDEX
		return
	end

	-- 레코드가 생성되어 있지 않으면 Insert
	if not exists (select null from TB_FARM_CROP where Zone = @ZONE_INDEX and Farm = @FARM_INDEX and Crop = @CROP_INDEX)
	begin
		insert TB_FARM_CROP
			(
			Zone,
			Farm,
			Crop,
			CropOwnerID,
			CropKind,
			CropStep,
			CropLife,
			CropNextStepTime,
			CropSeedGrade
			)
		values
			(
			@ZONE_INDEX,
			@FARM_INDEX,
			@CROP_INDEX,
			@CROP_OWNER,
			@CROP_KIND,
			@CROP_STEP,
			@CROP_LIFE,
			@CROP_NEXTSTEPTIME,
			@CROP_SEEDGRADE
			)
	end
	-- 레코드가 이미 생성되어 있으면 Update
	else 
	begin
		update TB_FARM_CROP 
			set 	CropOwnerID = @CROP_OWNER, 
				CropKind = @CROP_KIND, 
				CropStep = @CROP_STEP,
				CropLife = @CROP_LIFE,
				CropNextStepTime = @CROP_NEXTSTEPTIME,
				CropSeedGrade = @CROP_SEEDGRADE
			where	 Zone = @ZONE_INDEX and 
				Farm = @FARM_INDEX and 
				Crop = @CROP_INDEX
	end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_FARM_SetFarmState]    Script Date: 07/30/2013 14:52:59 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 농장의 상태를 설정 (구입 및 ...)
CREATE   PROC [dbo].[MP_FARM_SetFarmState] ( @ZONE_INDEX int, 
					             @FARM_INDEX int, 
                               			             @FARM_STATE int, 
					             @FARM_OWNER int, 
					             @GARDEN_GRADE int,
						@HOUSE_GRADE int,
						@WAREHOUSE_GRADE int,
						@ANIMALCAGE_GRADE int,
						@FENCE_GRADE int )
					
as
	Set Nocount on
	Set Xact_abort on

begin
	-- 농장 상태값이 0 이면 삭제
	if (@FARM_STATE = 0)
	begin
		delete TB_FARM_FARM where Zone = @ZONE_INDEX and Farm = @FARM_INDEX
		return
	end

	-- 레코드가 생성되어 있지 않으면 Insert
	if not exists (select null from TB_FARM_FARM where Zone = @ZONE_INDEX and Farm = @FARM_INDEX)
	begin
		insert TB_FARM_FARM
			(
			Zone,
			Farm,
			FarmState,
			FarmOwnerID,
			GardenGrade,
			HouseGrade,
			WarehouseGrade,
			AnimalcageGrade,
			FenceGrade
			)
		values
			(
			@ZONE_INDEX,
			@FARM_INDEX,
			@FARM_STATE,
			@FARM_OWNER,
		             @GARDEN_GRADE,
			@HOUSE_GRADE,
			@WAREHOUSE_GRADE,
			@ANIMALCAGE_GRADE,
			@FENCE_GRADE
			)
	end
	-- 레코드가 이미 생성되어 있으면 Update
	else 
	begin
		update TB_FARM_FARM 
		set 	FarmState = @FARM_STATE, 
			FarmOwnerID = @FARM_OWNER,
			GardenGrade = @GARDEN_GRADE,
			HouseGrade = @HOUSE_GRADE,
			WarehouseGrade = @WAREHOUSE_GRADE,
			AnimalcageGrade = @ANIMALCAGE_GRADE,
			FenceGrade = @FENCE_GRADE
		where	Zone = @ZONE_INDEX and 
			Farm = @FARM_INDEX
	end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_FARM_SetTaxInfo]    Script Date: 07/30/2013 14:52:59 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 농장의 관리비 상태를 설정
CREATE   PROC [dbo].[MP_FARM_SetTaxInfo] ( @ZONE_INDEX int, 
					             @FARM_INDEX int,
						@TAX_ARREARAGE_FREQ int,
                               			             @TAX_PAY_PLAYER_ID int)
					
as
	Set Nocount on
	Set Xact_abort on

begin
	-- 레코드가 생성되어 있지 않으면 Insert
	if not exists (select null from TB_FARM_TAX where Zone = @ZONE_INDEX and Farm = @FARM_INDEX)
	begin
		insert TB_FARM_TAX
			(
			Zone,
			Farm,
			TaxArrearageFreq,
			TaxPayPlayerID
			)
		values
			(
			@ZONE_INDEX,
			@FARM_INDEX,
			@TAX_ARREARAGE_FREQ,
			@TAX_PAY_PLAYER_ID
			)
	end
	-- 레코드가 이미 생성되어 있으면 Update
	else 
	begin
		update TB_FARM_TAX 
		set 	TaxArrearageFreq = @TAX_ARREARAGE_FREQ, 
			TaxPayPlayerID = @TAX_PAY_PLAYER_ID
		where	Zone = @ZONE_INDEX and 
			Farm = @FARM_INDEX
	end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_FARM_LoadTimeDelay]    Script Date: 07/30/2013 14:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 몬스터미터 정보를 DB에서 읽어옴
CREATE PROC [dbo].[MP_FARM_LoadTimeDelay] (@PlayerID int)
as
	Set Nocount on
	Set Xact_abort on

begin
	-- 레코드가 생성되어 있지 않으면return
	--if not exists (select null from TB_FARM_TIMEDELAY where PlayerID = @PlayerID)
	--begin
	--	return
	--end
	-- 레코드가 생성되어 있으면 read
	--else 
	--begin
		select Kind, RemainTime from TB_FARM_TIMEDELAY with(nolock) where PlayerID = @PlayerID
	--end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_FARM_SetTimeDelay]    Script Date: 07/30/2013 14:52:59 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
--몬스터미터 정보 저장
CREATE   PROC [dbo].[MP_FARM_SetTimeDelay] (@PlayerID int, @Kind int, @RemainTime int)
as
	Set Nocount on
	Set Xact_abort on

begin
	-- 레코드가 생성되어 있지 않으면 Insert
	if not exists (select null from TB_FARM_TIMEDELAY where PlayerID = @PlayerID and Kind = @Kind)
	begin
		insert TB_FARM_TIMEDELAY
			(
			PlayerID,
			Kind,
			RemainTime
			)
		values
			(
			@PlayerID,
			@Kind,
			@RemainTime
			)
	end
	-- 레코드가 이미 생성되어 있으면 Update
	else 
	begin
		if @RemainTime = 0
			begin
				delete from TB_FARM_TIMEDELAY where PlayerID = @PlayerID and Kind = @Kind 
			end
		else
			begin
				update TB_FARM_TIMEDELAY set RemainTime = @RemainTime where PlayerID = @PlayerID and Kind = @Kind
			end
	end
end
GO
/****** Object:  StoredProcedure [dbo].[MP_JACKPOT_AddTotalMoney]    Script Date: 07/30/2013 14:53:45 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE	proc [dbo].[MP_JACKPOT_AddTotalMoney]
(
	@MapMoney	bigint
)
as
	set nocount on
	set xact_abort on
	
	declare @TotalMoney bigint

	select @TotalMoney = TotalMoney from TB_JACKPOT where CharacterIdx = 0 and PrizeMoney = 0
	
	set @TotalMoney = @TotalMoney + @MapMoney

	if( @TotalMoney > 999999999 )
	begin
		set @TotalMoney = 999999999
	end

	update TB_JACKPOT set TotalMoney = TotalMoney + @MapMoney, RegDate = getdate() where CharacterIdx = 0 and PrizeMoney = 0

	select @TotalMoney
GO
/****** Object:  StoredProcedure [dbo].[MP_JACKPOT_Prize]    Script Date: 07/30/2013 14:53:46 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE	proc [dbo].[MP_JACKPOT_Prize]
(
	@MapMoney	bigint,
	@CharacterIdx	int,
	@PrizeKind	int,
	@Percent	int,
	@AbsMoney	bigint
)
as
	set nocount on
	set xact_abort on
	
	declare @TotalMoney bigint
	declare @PrizeMoney bigint
	
	select @TotalMoney = TotalMoney from TB_JACKPOT where CharacterIdx = 0 and PrizeMoney = 0

	if( @AbsMoney = 0 )
	begin
		set @PrizeMoney = @TotalMoney * @Percent / 100
	end
	else
	begin
		if( @AbsMoney > @TotalMoney )
		begin
			set @PrizeMoney = @TotalMoney
		end
		else
		begin
			set @PrizeMoney = @AbsMoney
		end
	end
	set @TotalMoney = @TotalMoney - @PrizeMoney + @MapMoney

	if( @TotalMoney > 999999999 )
	begin
		set @TotalMoney = 999999999
	end

	update TB_JACKPOT set TotalMoney = TotalMoney - @PrizeMoney + @MapMoney where CharacterIdx = 0 and PrizeMoney = 0
	insert TB_JACKPOT(TotalMoney, PrizeMoney, CharacterIdx, RegDate) values(0, @PrizeMoney, @CharacterIdx, getdate() )

	select @TotalMoney, @PrizeMoney, @PrizeKind, @CharacterIdx
GO
/****** Object:  StoredProcedure [dbo].[MP_JACKPOT_LoadMoney]    Script Date: 07/30/2013 14:53:45 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE	proc [dbo].[MP_JACKPOT_LoadMoney]
as
	set nocount on
	set xact_abort on

	if exists (select * from TB_JACKPOT where CharacterIdx = 0 and PrizeMoney = 0)
	begin
		select TotalMoney from TB_JACKPOT where CharacterIdx = 0 and PrizeMoney = 0
	end
	else
	begin
		insert TB_JACKPOT (TotalMoney, PrizeMoney, CharacterIdx, RegDate) values(0, 0, 0, getdate())
		select 0
	end
GO
/****** Object:  StoredProcedure [dbo].[MP_FISHINGDATA_LOAD]    Script Date: 07/30/2013 14:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[MP_FISHINGDATA_LOAD]
	(
		@dwPlayerID	int
	)
AS
	Set	Nocount	on
	Set	Xact_abort on
	
if not exists (select count(*) from TB_FISHING where CHARACTER_IDX = @dwPlayerID)
	begin
		return
	end
else
	begin
		select FISHING_LEVEL, FISHING_EXP, FISH_POINT from TB_FISHING where CHARACTER_IDX = @dwPlayerID
		return
	end
GO
/****** Object:  StoredProcedure [dbo].[MP_FISHINGDATA_UPDATE]    Script Date: 07/30/2013 14:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MP_FISHINGDATA_UPDATE]
	(
		@dwPlayerID	int,
		@wLevel		int,
		@dwExp		bigint,
		@dwPoint	bigint
	)
AS
	Set	Nocount	On
	
	delete from TB_FISHING where (CHARACTER_IDX = @dwPlayerID)

	insert TB_FISHING
	(
		CHARACTER_IDX,
		FISHING_LEVEL,
		FISHING_EXP,
		FISH_POINT
	)
	values
	(
		@dwPlayerID,
		@wLevel,
		@dwExp,
		@dwPoint
	)
GO
/****** Object:  StoredProcedure [dbo].[TP_FORBID_CHAT_LOG_SIZE_SELECT]    Script Date: 07/30/2013 14:55:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_FORBID_CHAT_LOG_SIZE_SELECT]
	(
		@BEGIN_DATE VARCHAR( 20 ),
		@END_DATE VARCHAR( 20 ),
		@CHAR_IDX INT,
		@REQUEST_TICK INT
	)
AS
	SET NOCOUNT ON

	DECLARE @YEAR INT
	DECLARE @MONTH INT
	DECLARE @DAY INT
	DECLARE @HOUR INT
	DECLARE @MINUTE	INT
	DECLARE @SECOND INT

	DECLARE @BEGIN DATETIME
	SET @BEGIN = 0

	-- 080327 LUJ, DB陛 檣衝?朝 ?蟾 陳瞼諦曖 離檜? ?橫憮, 衛? 陳瞼? 虜??
	BEGIN
		-- 080327 LUJ, 陳瞼 僥濠?擊 衛/?/蟾 欽嬪煎 ?葬??
		SET @YEAR = 2000 + CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH = CAST( SUBSTRING( @BEGIN_DATE, 3, 2 ) AS INT )
		SET @DAY = CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR = CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE = CAST( SUBSTRING( @BEGIN_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @BEGIN_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB陛 檣衝?朝 ?蟾 陳瞼諦曖 離檜? ?橫憮, 陳瞼? 虜??
		SET @BEGIN = DATEADD( YEAR, @YEAR - DATEPART( YEAR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH, @MONTH - DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY, @DAY	- DATEPART( DAY, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR, @HOUR - DATEPART( HOUR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE, @MINUTE - DATEPART( MINUTE, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND, @SECOND - DATEPART( SECOND, 0 ), @BEGIN )
	END

	DECLARE @END DATETIME
	SET @END = 0

	-- 080327 LUJ, DB陛 檣衝?朝 ?蟾 陳瞼諦曖 離檜? ?橫憮, 謙猿陳瞼? 虜??
	BEGIN
		-- 080327 LUJ, 陳瞼 僥濠?擊 衛/?/蟾 欽嬪煎 ?葬??
		SET @YEAR = 2000 + CAST( SUBSTRING( @END_DATE, 1, 2 ) AS INT )
		SET @MONTH = CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY = CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR = CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE = CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB陛 檣衝?朝 ?蟾 陳瞼諦曖 離檜? ?橫憮, 陳瞼? 虜??
		SET @END = DATEADD( YEAR, @YEAR	- DATEPART( YEAR, 0 ), @END )
		SET @END = DATEADD( MONTH, @MONTH - DATEPART( MONTH, 0 ), @END )
		SET @END = DATEADD( DAY, @DAY - DATEPART( DAY, 0 ), @END )
		SET @END = DATEADD( HOUR, @HOUR	- DATEPART( HOUR, 0 ), @END )
		SET @END = DATEADD( MINUTE, @MINUTE - DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND, @SECOND - DATEPART( SECOND,	0 ), @END )
	END

	IF 0 = @CHAR_IDX
	BEGIN
		SELECT  COUNT( 1 ),
			@REQUEST_TICK,
			@BEGIN_DATE,
			@END_DATE,
			@CHAR_IDX
		FROM    TB_FORBIDCHAT_LIST WITH (NOLOCK)
		WHERE   (REGISTDATE BETWEEN @BEGIN AND @END)
	END
	ELSE
	BEGIN
		SELECT  COUNT( 1 ),
			@REQUEST_TICK,
			@BEGIN_DATE,
			@END_DATE,
			@CHAR_IDX
		FROM    TB_FORBIDCHAT_LIST WITH (NOLOCK)
		WHERE   (REGISTDATE BETWEEN @BEGIN AND @END) AND
			(CHARACTER_IDX = @CHAR_IDX)
	END
	RETURN 

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[TP_FORBID_CHAT_LOG_SELECT]    Script Date: 07/30/2013 14:55:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_FORBID_CHAT_LOG_SELECT]

(
	@BEGIN_DATE VARCHAR( 20 ),
	@END_DATE VARCHAR( 20 ),
	@CHAR_IDX INT,
	@REQUEST_TICK INT,
	@QUERY_SIZE INT
)
AS
	SET NOCOUNT ON

	DECLARE @YEAR	INT
	DECLARE @MONTH	INT
	DECLARE @DAY	INT
	DECLARE @HOUR	INT
	DECLARE @MINUTE	INT
	DECLARE @SECOND INT

	DECLARE @BEGIN DATETIME
	SET @BEGIN = 0

	-- 080327 LUJ,	DB陛 檣衝?朝 ?蟾 陳瞼諦曖 離檜? ?橫憮, 衛? 陳瞼? 虜??
	BEGIN
		-- 080327 LUJ, 陳瞼 僥濠?擊 衛/?/蟾 欽嬪煎 ?葬??
		SET @YEAR = 2000 + CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH = CAST( SUBSTRING( @BEGIN_DATE, 3, 2 ) AS INT )
		SET @DAY = CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR = CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE = CAST( SUBSTRING( @BEGIN_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @BEGIN_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB陛 檣衝?朝 ?蟾 陳瞼諦曖 離檜? ?橫憮, 陳瞼? 虜??
		SET @BEGIN = DATEADD( YEAR, @YEAR - DATEPART( YEAR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH, @MONTH - DATEPART( MONTH, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY, @DAY - DATEPART( DAY, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR, @HOUR - DATEPART( HOUR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE, @MINUTE - DATEPART( MINUTE, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND, @SECOND - DATEPART( SECOND, 0 ), @BEGIN )
	END

	DECLARE @END DATETIME
	SET @END = 0

	-- 080327 LUJ,	DB陛 檣衝?朝 ?蟾 陳瞼諦曖 離檜? ?橫憮, 謙猿陳瞼? 虜??
	BEGIN
		-- 080327 LUJ, 陳瞼 僥濠?擊 衛/?/蟾 欽嬪煎 ?葬??
		SET @YEAR = 2000 + CAST( SUBSTRING( @END_DATE, 1, 2 ) AS INT )
		SET @MONTH = CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY = CAST( SUBSTRING( @END_DATE, 5, 2 ) AS INT )
		SET @HOUR = CAST( SUBSTRING( @END_DATE, 8, 2 ) AS INT )
		SET @MINUTE = CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB陛 檣衝?朝 ?蟾 陳瞼諦曖 離檜? ?橫憮, 陳瞼? 虜??
		SET @END = DATEADD( YEAR, @YEAR	- DATEPART( YEAR, 0 ), @END )
		SET @END = DATEADD( MONTH, @MONTH - DATEPART( MONTH, 0 ), @END )
		SET @END = DATEADD( DAY, @DAY - DATEPART( DAY, 0 ), @END )
		SET @END = DATEADD( HOUR, @HOUR	- DATEPART( HOUR, 0 ), @END )
		SET @END = DATEADD( MINUTE, @MINUTE - DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND, @SECOND - DATEPART( SECOND,	0 ), @END )
	END

	IF 0 = @CHAR_IDX
	BEGIN
		SELECT  TOP 100
			CHARACTER_IDX,
			OPERATOR_NAME,
			REASON,
			CONVERT( VARCHAR( 6 ), REGISTDATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), REGISTDATE, 8 ),
			CONVERT( VARCHAR( 6 ), RELEASEDATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), RELEASEDATE, 8 ),
			@END_DATE,
			@QUERY_SIZE,
			@REQUEST_TICK
		FROM    TB_FORBIDCHAT_LIST WITH (NOLOCK)
		WHERE   (REGISTDATE BETWEEN @BEGIN AND @END)
		ORDER BY REGISTDATE
	END
	ELSE
	BEGIN
		SELECT  TOP 100
			CHARACTER_IDX,
			OPERATOR_NAME,
			REASON,
			CONVERT( VARCHAR( 6 ), REGISTDATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), REGISTDATE, 8 ),
			CONVERT( VARCHAR( 6 ), RELEASEDATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), RELEASEDATE, 8 ),
			@END_DATE,
			@QUERY_SIZE,
			@REQUEST_TICK
		FROM    TB_FORBIDCHAT_LIST WITH (NOLOCK)
		WHERE   (REGISTDATE BETWEEN @BEGIN AND @END) AND
			(CHARACTER_IDX = @CHAR_IDX)
		ORDER BY REGISTDATE
	END
	RETURN 




SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[MP_GM_FORBIDCHAT_LOAD]    Script Date: 07/30/2013 14:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_GM_FORBIDCHAT_LOAD] (@TargetIdx int)

as

	Set Nocount on

	select Character_Idx, DATEDIFF( second, '1970-01-01 09:00:00', ReleaseDate )
	from TB_FORBIDCHAT_LIST
	where Character_Idx = @TargetIdx
	order by RegistDate DESC


	


/****** 偃羹:  StoredProcedure [dbo].[MP_GM_FORBIDCHAT_UPDATE]    蝶?董? 陳瞼: 06/21/2010 20:29:47 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[MP_JOURNAL_Delete]    Script Date: 07/30/2013 14:53:46 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE proc [dbo].[MP_JOURNAL_Delete]
(
	@Character_Idx		int,
	@Journal_Idx		int	
)
as
	Set Nocount On
	Set Xact_Abort On
-- 프로시져 이름은 Delete이지만 실제 목록에서 지워지면 안되니까 bSaved만 0으로 바꿔준다.
update TB_JOURNAL set 
	bSaved = 0
	where Journal_IDX = @Journal_Idx and Character_Idx = @Character_Idx
GO
/****** Object:  StoredProcedure [dbo].[MP_JOURNAL_GetList]    Script Date: 07/30/2013 14:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[MP_JOURNAL_GetList] ( @Character_IDX int )

as
	Set Nocount on
--	Set Xact_Abort on


delete  tb_journal 
where journal_idx in 
	(
	select journal_idx
	from tb_journal with(nolock)
	where character_idx = @Character_IDX and RegDate < (getdate()-7)
	)
select top 100 Journal_IDX, Kind, Param, Param_2, Param_3, bSaved, ParamName, convert(varchar(30), RegDate, 102) 
from tb_journal  with(nolock)
where Character_IDX = @Character_IDX  
order by Journal_Idx desc

/*
DECLARE	@Time			smalldatetime
,		@Index			int
,		@Dist			int

-- 저장된 인덱스와
select @Index = Journal_IDX from tb_journal where Character_IDX = @Character_IDX
-- 저장된 날자를 얻어서
select @Time = RegDate from tb_journal where Character_IDX = @Character_IDX
-- 현재날자와의 차이를 계산한후
set @Dist = datediff(dd, getdate(), @Time)
-- 7일 이상이면 지우고
if(@Dist > 7)
	delete from tb_journal where Character_IDx = @Character_IDX and Journal_IDX = @Index
-- 그 이하면 데이타를 가져온다.
else
(
	select Journal_IDX, Kind, Param, Param_2, Param_3, bSaved, ParamName, convert(varchar(30), RegDate, 102) 
	from tb_journal 
	where Character_IDX = @Character_IDX 
)
*/
GO
/****** Object:  StoredProcedure [dbo].[MP_JOURNAL_InsertLevel]    Script Date: 07/30/2013 14:53:46 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_JOURNAL_InsertLevel] ( @Character_Idx int, @Kind tinyint, @Param int )
as
	Set Nocount on
	Set Xact_Abort on

	insert TB_JOURNAL
	( 
	Character_IDX,
	Kind,
	Param
	)
	values
	(
	@Character_Idx,
	@Kind,
	@Param	
	)
GO
/****** Object:  StoredProcedure [dbo].[MP_JOURNAL_SaveUpdate]    Script Date: 07/30/2013 14:53:47 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_JOURNAL_SaveUpdate]
(	
	@Character_Idx		int,
	@Journal_Idx		int
)
as
	Set Nocount On
	Set Xact_Abort On

update TB_JOURNAL set 
	bSaved = 1
	where Journal_IDX = @Journal_Idx and Character_Idx = @Character_Idx
GO
/****** Object:  StoredProcedure [dbo].[MP_JOURNAL_InsertWanted]    Script Date: 07/30/2013 14:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE  proc [dbo].[MP_JOURNAL_InsertWanted] ( @Character_Idx int, @Kind tinyint, @Param int, @ParamName varchar(16) )
as
	Set Nocount on
	Set Xact_Abort on
--수행중:0, 성공:1, 다른사람이 성공:2, 현상범 캐릭삭제로 인한 실패:3, 다른 캐릭한테죽임당함:20

	insert TB_JOURNAL
	( 
	Character_IDX,
	Kind,
	Param,
	ParamName
	)
	values
	(
	@Character_Idx,
	@Kind,
	@Param,
	@ParamName
	)
GO
/****** Object:  StoredProcedure [dbo].[MP_JOURNAL_InsertQuest]    Script Date: 07/30/2013 14:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE proc [dbo].[MP_JOURNAL_InsertQuest] ( @Character_Idx int, @Kind tinyint, @Param int, @Param_2 int, @Param_3 int )
as
	Set Nocount on
	Set Xact_Abort on

	insert TB_JOURNAL
	( 
	Character_IDX,
	Kind,
	Param,
	Param_2,
	Param_3
	)
	values
	(
	@Character_Idx,
	@Kind,
	@Param,
	@Param_2,
	@Param_3
	)
GO
/****** Object:  StoredProcedure [dbo].[MP_FRIEND_DelFriendID]    Script Date: 07/30/2013 14:53:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_FRIEND_DelFriendID] (@CharacterIDX int, @TargetID int, @bLast bit)
as
	set nocount on
	set xact_abort on

	delete tb_friend where character_idx = @CharacterIDX and friend_idx = @TargetID
	select @bLast, @TargetID
GO
/****** Object:  StoredProcedure [dbo].[MP_FRIEND_DelFriend]    Script Date: 07/30/2013 14:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[MP_FRIEND_DelFriend] (@CharacterIDX int, @Targetname varchar(16))
as
	set nocount on
	set xact_abort on
	declare @friendidx int
if (select count(*) from tb_friend where character_idx = @CharacterIDX and friend_name = @Targetname) = 1
begin

	select @friendidx = friend_idx 
	from tb_friend 
	where character_idx = @CharacterIDX and friend_name = @Targetname

	delete tb_friend where character_idx = @CharacterIDX and friend_name = @Targetname
	select @Targetname, @friendidx 
end
else 
	select 0, 0
GO
/****** Object:  StoredProcedure [dbo].[MP_FRIEND_GetFriendList_backup]    Script Date: 07/30/2013 14:53:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
create  proc [dbo].[MP_FRIEND_GetFriendList_backup] (@Character_idx int, @pagesize int, @GotoPage int) 
as
	set nocount on
	set xact_abort on

	declare @TotalNum int
	DECLARE @SQL VARCHAR(500)

	select @TotalNum = count( Character_IDX ) from tb_friend where Character_IDX = @Character_idx
	set @TotalNum = ceiling((@TotalNum - 1)/@pagesize) + 1

begin
if( @GotoPage) = 1
	begin
	/*	declare @TotalNum int
		DECLARE @SQL VARCHAR(400)
		
		declare @pagesize int
		set @pagesize = 10
		declare @character_idx int 
		set @character_idx = 6473
*/
	
		set @sql = ' select top ' + CONVERT(VARCHAR(10),@pagesize)
		set @sql = @sql + ' character_idx, character_name, 
				character_currentmap, ' + CONVERT(VARCHAR(10),@TotalNum) 
		set @sql = @sql + '  from tb_character where character_idx in 
					( select top '  + CONVERT(VARCHAR(10),@pagesize)
		set @sql = @sql + 	' friend_idx from tb_friend where character_idx = '
		set @sql = @sql +  	CONVERT(VARCHAR(10),@Character_idx ) + ' order by friend_idx ) '

	end
else 
	begin
/*		declare @TotalNum int
		DECLARE @SQL VARCHAR(500)
		
		declare @pagesize int
		declare @gotopage int
		set @pagesize = 10
		declare @character_idx int 
		set @character_idx = 6473
		set @gotopage = 3
		select @TotalNum = count( character_idx  ) from tb_friend where character_idx = @Character_idx
		set @TotalNum = ceiling((@TotalNum - 1)/10) + 1
*/
		set @sql = ' select character_idx, character_name, character_currentmap, ' + CONVERT(VARCHAR(10),@TotalNum) 
		set @sql = @sql + ' from tb_character where character_idx in ( select top ' + CONVERT(VARCHAR(10),@pagesize)
		set @sql = @sql + ' friend_idx from tb_friend where character_idx = ' +  CONVERT(VARCHAR(10),@Character_idx )
		set @sql = @sql + ' and friend_idx not in (SELECT TOP ' + CONVERT(VARCHAR(10),((@GotoPage - 1) * @pagesize)) 
		set @sql = @sql + ' friend_idx  from tb_friend where  character_idx = ' + CONVERT(VARCHAR(10),@Character_idx )
		set @sql = @sql + ' order by friend_idx ) order by friend_idx ) '
	end
exec (@sql)
end
GO
/****** Object:  StoredProcedure [dbo].[MP_AUTONOTELIST_LOAD]    Script Date: 07/30/2013 14:52:19 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_AUTONOTELIST_LOAD]
(
	@character_idx int
)
as
	Set Nocount on

select	top 100 auto_name, convert( char(16), reg_date, 120)
from	tb_autonotelist with(nolock)
where	character_idx = @character_idx and reg_date > ( getdate() - 30 ) order by reg_date desc
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_LoginCheck]    Script Date: 07/30/2013 14:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MP_CHARACTER_LoginCheck]
(
	@USER_IDX 					int
)
as
	Set Nocount on
	Set Xact_Abort on

	declare @count tinyint

	set @count = (select count(User_IDX) from TB_LOGINCHECK where USER_IDX = @USER_IDX)
	if @count = 0
		begin
			insert TB_LOGINCHECK values(@USER_IDX, getdate())
			select @USER_IDX
			return
		end
	else
		begin 
			select 0
			return
		end
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_LoginDelete]    Script Date: 07/30/2013 14:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MP_CHARACTER_LoginDelete]
(
	@USER_IDX					int
)
as
	Set Nocount on
	Set Xact_Abort on
	
	delete TB_LOGINCHECK where USER_IDX = @USER_IDX
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_LoginInit]    Script Date: 07/30/2013 14:52:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MP_CHARACTER_LoginInit]
as
	Set Nocount on
	
	delete TB_LOGINCHECK
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_CreateCharacter_WithDevil]    Script Date: 07/30/2013 14:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
081029 LUJ, 기획팀(송가람) 요청으로 기본 지급 아이템을 다음과 같이 변경함
	기존: 21000289, 21000290, 21000291, 21000292
	변경: 21000583, 21000584
090519 LUJ, 캐릭터 생성 시 기본 단축키를 등록한다
*/
CREATE             proc [dbo].[MP_CHARACTER_CreateCharacter_WithDevil]
(
	@USER_IDX			int
,	@CHARACTER_Strength		smallint
,	@CHARACTER_Dexterity		smallint
,	@CHARACTER_Vitality		smallint
,	@CHARACTER_Intelligence		smallint
,	@CHARACTER_Wisdom		smallint
,	@CHARACTER_NAME		varchar(16)
,	@CHARACTER_FACETYPE		tinyint
,	@CHARACTER_HEADTYPE		tinyint
,	@CHARACTER_MAP		tinyint
,	@CHARACTER_GENDER		tinyint
,	@CHARACTER_RACE		tinyint
,	@CHARACTER_JOB		smallint
, 	@CHARACTER_LOGINPOINT	int
,	@ServerNo			int
,	@IP				varchar(16)
,	@CHARACTER_WEAPON		int
,	@CHARACTER_DRESS		int
)
as
	Set Nocount on
--	Set Xact_Abort on

	declare @presentKind tinyint
	declare @presentItem int

--- 케릭터 예약 이벤트
	declare @userpropid int

---
if((select count(*) from TB_CHARACTER where USER_IDX = @USER_IDX and character_birth > getdate() - 1) >= 5)
	begin
		select 1			-- 캐릭터가 꽉찼음 리턴
		return
	end

if((select count(*) from TB_CHARACTER where USER_IDX = @USER_IDX and CHARACTER_STANDINDEX != 5) > 4)
	begin
		select 1			-- 캐릭터가 꽉찼음 리턴
		return
	end
else if exists ( select * from TB_CHARACTER where CHARACTER_NAME = @CHARACTER_NAME  )
	begin
		select 2
		return 	-- 캐릭이름이 중복됨 리턴
	end
/*
else if exists (select *  from tb_munpa where @CHARACTER_NAME = MunpaName )
begin
	select 3 -- 문파이름 중복
	return
end
*/
/*
--- 케릭터 예약 이벤트
else if exists ( select * from [ES_082].[LunaMember].[dbo].[event20070704_characterName_PRE_GET] where chrName = @CHARACTER_NAME )
begin
	set @userpropid = (select top 1 propid from [ES_082].[LunaMember].[dbo].[event20070704_characterName_PRE_GET] where chrName = @CHARACTER_NAME )
	if ( @userpropid != @USER_IDX )
	begin
		select 2
		return
	end
end
---
*/

--else if @character_name is null
if @character_name is null
		begin 
			select 2			-- 캐릭이름이 null 리턴
			return 
		end
else
	begin
		declare @StandIndex int
		declare @n		int
		select @StandIndex = count(character_idx) from tb_character where user_idx = @USER_IDX
		set @n = 0
		if(@StandIndex != 0) 
			begin
				while(@n < 5)
					begin 
						if exists (select * from tb_character where character_standindex = @n and user_idx = @USER_IDX)
							begin
								Set @n = @n + 1
								continue
							end
						else
							begin
								Set @StandIndex = @n
								break
							end
					end
			end


		--- 090703 ONS 마족 추가시 변경되는 데이터 선언 및 초기화
		DECLARE	@CHARACTER_MAXGRADE		smallint
		DECLARE	@CHARACTER_LEVELUPPOINT	smallint
		DECLARE	@CHARACTER_SKILLPOINT	smallint
		SET		@CHARACTER_MAXGRADE		= 1
		SET		@CHARACTER_LEVELUPPOINT	= 0
		SET		@CHARACTER_SKILLPOINT	= 0
		-- 마족일 경우
		IF 2 = @CHARACTER_RACE 
			BEGIN
				SET 	@CHARACTER_Strength		= 60
				SET 	@CHARACTER_Dexterity		= 40
				SET 	@CHARACTER_Vitality		= 45
				SET 	@CHARACTER_Intelligence 	= 60
				SET 	@CHARACTER_Wisdom 		= 60
				SET	@CHARACTER_WEAPON		= 11007554
				SET	@CHARACTER_DRESS		= 12009347
				SET	@CHARACTER_MAXGRADE		= 40
				SET	@CHARACTER_LEVELUPPOINT	= 39
				SET	@CHARACTER_SKILLPOINT	= 247
				SET	@CHARACTER_MAP		= 96
				SET	@CHARACTER_LOGINPOINT	= 2019
			END

		insert TB_CHARACTER
		(
			USER_IDX
		,	CHARACTER_STANDINDEX
		,	CHARACTER_STR
		,	CHARACTER_DEX		
		,	CHARACTER_VIT		
		,	CHARACTER_INT
		,	CHARACTER_WIS
		,	CHARACTER_NAME	
		,	CHARACTER_FACETYPE	
		,	CHARACTER_HEADTYPE	
		,	CHARACTER_MAP
		,	CHARACTER_GENDER
		,	CHARACTER_STAGE
		,	CHARACTER_JOB
		,	CHARACTER_JOB1
		,	CHARACTER_JOB2
		,	CHARACTER_JOB3
		,	CHARACTER_JOB4
		,	CHARACTER_JOB5
		,	CHARACTER_JOB6
		,	character_loginpoint
		, 	character_Money	
		,	character_weapon
		,	character_dress
		, 	CHARACTER_GRADE
		,	CHARACTER_MAXGRADE
		,	CHARACTER_GRADEUPPOINT
		,	CHARACTER_SKILLPOINT
		)
			values
			(
				@USER_IDX
			,	@StandIndex
			,	@CHARACTER_Strength
			,	@CHARACTER_Dexterity
			,	@CHARACTER_Vitality
			,	@CHARACTER_Intelligence
			,	@CHARACTER_Wisdom
			,	@CHARACTER_NAME		
			,	@CHARACTER_FACETYPE	
			,	@CHARACTER_HEADTYPE	
			,	@CHARACTER_MAP
			,	@CHARACTER_GENDER
			,	@CHARACTER_RACE
			,	1
			,	@CHARACTER_JOB
			,	0
			,	0
			,	0
			,	0
			,	0
			, 	@CHARACTER_LOGINPOINT
			,	0
			,	@CHARACTER_WEAPON
			,	@CHARACTER_DRESS
			, 	@CHARACTER_MAXGRADE
			,	@CHARACTER_MAXGRADE
			,	@CHARACTER_LEVELUPPOINT
			,	@CHARACTER_SKILLPOINT
			)
		declare @Character_idx int
		select @Character_idx = max(Character_idx) from tb_character where @USER_IDX = User_idx
		insert tb_item(character_idx, item_idx, item_position, item_qposition, item_durability)
			values(@Character_idx, @CHARACTER_DRESS, 82, 0, 0)
		insert tb_item(character_idx, item_idx, item_position, item_qposition, item_durability)
			values(@Character_idx, @CHARACTER_WEAPON, 80, 0, 0)
		-- 081029 LUJ, 인벤토리의 기본 지급 아이템을 변경함
		insert tb_item(character_idx, item_idx, item_position, item_qposition, item_durability)
			values(@Character_idx, 21000583, 0, 0, 1)
		-- 081029 LUJ, 인벤토리의 기본 지급 아이템을 변경함
		insert tb_item(character_idx, item_idx, item_position, item_qposition, item_durability)
			values(@Character_idx, 21000584, 1, 0, 1)

		-- 080614 LYW : 스킬 포인트 정보를 캐릭터 테이블에서 빼고, 따로 관리를 시작하기 때문에, 
 		-- 스킬 포인트 테이블에 캐릭터 파트를 추가한다.
 		insert tb_skillpoint(character_idx, skill_point, cumulative_point) 
 		values(@character_idx, @CHARACTER_SKILLPOINT, 0)

		DECLARE @JOB_SHORTCUT_KIND TINYINT
		DECLARE @JOB_SHORTCUT_DBIDX INT
		DECLARE @JOB_SHORTCUT_IDX INT
		DECLARE @JOB_SHORTCUT_DATA SMALLINT

		-- 090519 LUJ, 파이터
		IF 1 = @CHARACTER_JOB
		BEGIN
			SET @JOB_SHORTCUT_KIND = 3
			SET @JOB_SHORTCUT_DBIDX = 3233
			SET @JOB_SHORTCUT_IDX = 1101101
			SET @JOB_SHORTCUT_DATA = 1
		END
		-- 090519 LUJ, 로그
		ELSE IF 2 = @CHARACTER_JOB
		BEGIN
			SET @JOB_SHORTCUT_KIND = 3
			SET @JOB_SHORTCUT_DBIDX = 3246
			SET @JOB_SHORTCUT_IDX = 2101001
			SET @JOB_SHORTCUT_DATA = 1
		END
		-- 090519 LUJ, 메이지
		ELSE IF 3 = @CHARACTER_JOB
		BEGIN
			SET @JOB_SHORTCUT_KIND = 3
			SET @JOB_SHORTCUT_DBIDX = 3237
			SET @JOB_SHORTCUT_IDX = 3200101
			SET @JOB_SHORTCUT_DATA = 1
		END
		ELSE
		BEGIN
			SET @JOB_SHORTCUT_KIND = 0
			SET @JOB_SHORTCUT_DBIDX = 0
			SET @JOB_SHORTCUT_IDX = 0
			SET @JOB_SHORTCUT_DATA = 0
		END

		-- 090519 LUJ, 퀵슬롯을 세팅하고 기본 스킬을 부여한다
		EXEC MP_QUICK_Update
			@character_idx,
			0, -- 시트 번호
			4, 0, 0, 0, -- 1번 슬롯
			@JOB_SHORTCUT_KIND, @JOB_SHORTCUT_DBIDX, @JOB_SHORTCUT_IDX, @JOB_SHORTCUT_DATA, -- 2번 슬롯
			0, 0, 0, 0, -- 3번 슬롯
			4, 2, 2, 0, -- 4번 슬롯
			4, 3, 3, 0, -- 5번 슬롯
			4, 66, 66, 0, -- 6번 슬롯
			0, 0, 0, 0, -- 7번 슬롯
			4, 28, 28, 0, -- 8번 슬롯
			4, 6, 6, 0, -- 9번 슬롯
			4, 1, 1, 0 -- 10번 슬롯

		-- 초보자 가이드 정보 셋팅
		insert tb_mainquest(character_idx, quest_idx, subquest_do, end_param, regist_time)
			values(@Character_idx, 0, 0, 0, 0)

		insert TB_CharacterCreateInfo( character_idx, user_idx, character_name, flag, create_date, create_ip )
				values( @Character_idx, @USER_IDX, @CHARACTER_NAME, 1, getdate(), @IP )
		select 0,	@Character_idx,		@CHARACTER_JOB, @CHARACTER_NAME, @CHARACTER_MAP
		exec LUNA_MEMBERDB.dbo.up_Character_Insert @Character_idx, @USER_IDX, @CHARACTER_NAME, @ServerNo
--		exec [ES_082].[LunaMember].[dbo].[up_Character_Insert] @Character_idx, @USER_IDX, @CHARACTER_NAME, @ServerNo
	end
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_CreateCharacter_UseLocal]    Script Date: 07/30/2013 14:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
081029 LUJ, 기획팀(송가람) 요청으로 기본 지급 아이템을 다음과 같이 변경함
	기존: 21000289, 21000290, 21000291, 21000292
	변경: 21000583, 21000584
090519 LUJ, 캐릭터 생성 시 기본 단축키를 등록한다
090630 ShinJS, 로컬용, 마족 추가로 인해 로컬에서 사용이 불가능하여 이전 프로시저 이름 변경하여 생성
*/
CREATE        proc [dbo].[MP_CHARACTER_CreateCharacter_UseLocal]
(
	@USER_IDX			int
,	@CHARACTER_Strength		smallint
,	@CHARACTER_Dexterity		smallint
,	@CHARACTER_Vitality		smallint
,	@CHARACTER_Intelligence		smallint
,	@CHARACTER_Wisdom		smallint
,	@CHARACTER_NAME		varchar(16)
,	@CHARACTER_FACETYPE		tinyint
,	@CHARACTER_HEADTYPE		tinyint
,	@CHARACTER_MAP		tinyint
,	@CHARACTER_GENDER		tinyint
,	@CHARACTER_RACE		tinyint
,	@CHARACTER_JOB		smallint
, 	@CHARACTER_LOGINPOINT	int
,	@ServerNo			int
,	@IP				varchar(16)
,	@CHARACTER_WEAPON		int
,	@CHARACTER_DRESS		int
)
as
	Set Nocount on
--	Set Xact_Abort on

	declare @presentKind tinyint
	declare @presentItem int

--- 케릭터 예약 이벤트
	declare @userpropid int
---
if((select count(*) from TB_CHARACTER where USER_IDX = @USER_IDX and character_birth > getdate() - 1) >= 5)
	begin
		select 1			-- 캐릭터가 꽉찼음 리턴
		return
	end

if((select count(*) from TB_CHARACTER where USER_IDX = @USER_IDX and CHARACTER_STANDINDEX != 5) > 4)
	begin
		select 1			-- 캐릭터가 꽉찼음 리턴
		return
	end
else if exists ( select * from TB_CHARACTER where CHARACTER_NAME = @CHARACTER_NAME  )
	begin
		select 2
		return 	-- 캐릭이름이 중복됨 리턴
	end
/*
else if exists (select *  from tb_munpa where @CHARACTER_NAME = MunpaName )
begin
	select 3 -- 문파이름 중복
	return
end
*/
/*
--- 케릭터 예약 이벤트
else if exists ( select * from [ES_082].[LunaMember].[dbo].[event20070704_characterName_PRE_GET] where chrName = @CHARACTER_NAME )
begin
	set @userpropid = (select top 1 propid from [ES_082].[LunaMember].[dbo].[event20070704_characterName_PRE_GET] where chrName = @CHARACTER_NAME )
	if ( @userpropid != @USER_IDX )
	begin
		select 2
		return
	end
end
---
*/

--else if @character_name is null
if @character_name is null
		begin 
			select 2			-- 캐릭이름이 null 리턴
			return 
		end
else
	begin
		declare @StandIndex int
		declare @n		int
		select @StandIndex = count(character_idx) from tb_character where user_idx = @USER_IDX
		set @n = 0
		if(@StandIndex != 0) 
			begin
				while(@n < 5)
					begin 
						if exists (select * from tb_character where character_standindex = @n and user_idx = @USER_IDX)
							begin
								Set @n = @n + 1
								continue
							end
						else
							begin
								Set @StandIndex = @n
								break
							end
					end
			end

		insert TB_CHARACTER
		(
			USER_IDX
		,	CHARACTER_STANDINDEX
		,	CHARACTER_STR
		,	CHARACTER_DEX		
		,	CHARACTER_VIT		
		,	CHARACTER_INT
		,	CHARACTER_WIS
		,	CHARACTER_NAME	
		,	CHARACTER_FACETYPE	
		,	CHARACTER_HEADTYPE	
		,	CHARACTER_MAP
		,	CHARACTER_GENDER
		,	CHARACTER_STAGE
		,	CHARACTER_JOB
		,	CHARACTER_JOB1
		,	CHARACTER_JOB2
		,	CHARACTER_JOB3
		,	CHARACTER_JOB4
		,	CHARACTER_JOB5
		,	CHARACTER_JOB6
		,	character_loginpoint
		, 	character_Money	
		,	character_weapon
		,	character_dress
		)
			values
			(
				@USER_IDX
			,	@StandIndex
			,	@CHARACTER_Strength
			,	@CHARACTER_Dexterity
			,	@CHARACTER_Vitality
			,	@CHARACTER_Intelligence
			,	@CHARACTER_Wisdom
			,	@CHARACTER_NAME		
			,	@CHARACTER_FACETYPE	
			,	@CHARACTER_HEADTYPE	
			,	@CHARACTER_MAP
			,	@CHARACTER_GENDER
			,	@CHARACTER_RACE
			,	1
			,	@CHARACTER_JOB
			,	0
			,	0
			,	0
			,	0
			,	0
			, 	@CHARACTER_LOGINPOINT
			,	0
			,	@CHARACTER_WEAPON
			,	@CHARACTER_DRESS
			)
		declare @Character_idx int
		select @Character_idx = max(Character_idx) from tb_character where @USER_IDX = User_idx
		insert tb_item(character_idx, item_idx, item_position, item_qposition, item_durability)
			values(@Character_idx, @CHARACTER_DRESS, 82, 0, 0)
		insert tb_item(character_idx, item_idx, item_position, item_qposition, item_durability)
			values(@Character_idx, @CHARACTER_WEAPON, 80, 0, 0)
		-- 081029 LUJ, 인벤토리의 기본 지급 아이템을 변경함
		insert tb_item(character_idx, item_idx, item_position, item_qposition, item_durability)
			values(@Character_idx, 21000583, 0, 0, 1)
		-- 081029 LUJ, 인벤토리의 기본 지급 아이템을 변경함
		insert tb_item(character_idx, item_idx, item_position, item_qposition, item_durability)
			values(@Character_idx, 21000584, 1, 0, 1)

		-- 080614 LYW : 스킬 포인트 정보를 캐릭터 테이블에서 빼고, 따로 관리를 시작하기 때문에, 
 		-- 스킬 포인트 테이블에 캐릭터 파트를 추가한다.
 		insert tb_skillpoint(character_idx, skill_point, cumulative_point) 
 		values(@character_idx, 0, 0)

		DECLARE @JOB_SHORTCUT_KIND TINYINT
		DECLARE @JOB_SHORTCUT_DBIDX INT
		DECLARE @JOB_SHORTCUT_IDX INT
		DECLARE @JOB_SHORTCUT_DATA SMALLINT

		-- 090519 LUJ, 파이터
		IF 1 = @CHARACTER_JOB
		BEGIN
			SET @JOB_SHORTCUT_KIND = 3
			SET @JOB_SHORTCUT_DBIDX = 3233
			SET @JOB_SHORTCUT_IDX = 1101101
			SET @JOB_SHORTCUT_DATA = 1
		END
		-- 090519 LUJ, 로그
		ELSE IF 2 = @CHARACTER_JOB
		BEGIN
			SET @JOB_SHORTCUT_KIND = 3
			SET @JOB_SHORTCUT_DBIDX = 3246
			SET @JOB_SHORTCUT_IDX = 2101001
			SET @JOB_SHORTCUT_DATA = 1
		END
		-- 090519 LUJ, 메이지
		ELSE IF 3 = @CHARACTER_JOB
		BEGIN
			SET @JOB_SHORTCUT_KIND = 3
			SET @JOB_SHORTCUT_DBIDX = 3237
			SET @JOB_SHORTCUT_IDX = 3200101
			SET @JOB_SHORTCUT_DATA = 1
		END
		ELSE
		BEGIN
			SET @JOB_SHORTCUT_KIND = 0
			SET @JOB_SHORTCUT_DBIDX = 0
			SET @JOB_SHORTCUT_IDX = 0
			SET @JOB_SHORTCUT_DATA = 0
		END

		-- 090519 LUJ, 퀵슬롯을 세팅하고 기본 스킬을 부여한다
		EXEC MP_QUICK_Update
			@character_idx,
			0, -- 시트 번호
			4, 0, 0, 0, -- 1번 슬롯
			@JOB_SHORTCUT_KIND, @JOB_SHORTCUT_DBIDX, @JOB_SHORTCUT_IDX, @JOB_SHORTCUT_DATA, -- 2번 슬롯
			0, 0, 0, 0, -- 3번 슬롯
			4, 2, 2, 0, -- 4번 슬롯
			4, 3, 3, 0, -- 5번 슬롯
			4, 66, 66, 0, -- 6번 슬롯
			0, 0, 0, 0, -- 7번 슬롯
			4, 28, 28, 0, -- 8번 슬롯
			4, 6, 6, 0, -- 9번 슬롯
			4, 1, 1, 0 -- 10번 슬롯

		-- 초보자 가이드 정보 셋팅
		insert tb_mainquest(character_idx, quest_idx, subquest_do, end_param, regist_time)
			values(@Character_idx, 0, 0, 0, 0)

		insert TB_CharacterCreateInfo( character_idx, user_idx, character_name, flag, create_date, create_ip )
				values( @Character_idx, @USER_IDX, @CHARACTER_NAME, 1, getdate(), @IP )
		select 0,	@Character_idx,		@CHARACTER_JOB, @CHARACTER_NAME
		exec LUNA_MEMBERDB.dbo.up_Character_Insert @Character_idx, @USER_IDX, @CHARACTER_NAME, @ServerNo
--		exec [ES_082].[LunaMember].[dbo].[up_Character_Insert] @Character_idx, @USER_IDX, @CHARACTER_NAME, @ServerNo
	end
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_CreateCharacter]    Script Date: 07/30/2013 14:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	proc [dbo].[MP_CHARACTER_CreateCharacter]
(
	@USER_IDX				int
,	@CHARACTER_Strength		smallint
,	@CHARACTER_Dexterity	smallint
,	@CHARACTER_Vitality		smallint
,	@CHARACTER_Intelligence	smallint
,	@CHARACTER_Wisdom		smallint
,	@CHARACTER_NAME			varchar(16)
,	@CHARACTER_FACETYPE		tinyint
,	@CHARACTER_HEADTYPE		tinyint
,	@CHARACTER_MAP			tinyint
,	@CHARACTER_GENDER		tinyint
,	@CHARACTER_RACE			tinyint
,	@CHARACTER_JOB			smallint
, 	@CHARACTER_LOGINPOINT	int
,	@ServerNo				int
,	@IP						varchar(16)
,	@CHARACTER_WEAPON		int
,	@CHARACTER_DRESS		int
)
as
	Set Nocount on

	declare @presentKind tinyint
	declare @presentItem int

-- ?瑞 ?? 陛棟 議葛攪 熱 薯?
if((select count(*) from TB_CHARACTER where USER_IDX = @USER_IDX and character_birth > getdate() - 1) >= 5)
	begin
		select 1			-- 議葛攪陛 粕獺? 葬?
		return
	end


if((select count(*) from TB_CHARACTER where USER_IDX = @USER_IDX and CHARACTER_STANDINDEX != 5) > 4)
begin
	select 1			-- 議葛攪陛 粕獺? 葬?
	return
end

if exists ( select * from TB_CHARACTER where CHARACTER_NAME = @CHARACTER_NAME )
begin
	select 2
	return 	-- 議葛檜?檜 ??脾 葬?
end
/*
declare @StandIndex int
set @StandIndex = 1 + 
(
select top 1 character_standindex
from tb_character
where user_idx = @USER_IDX and character_standindex < 5
order by character_standindex desc
)
if @StandIndex is NULL
begin
	set @StandIndex = 0
end
*/
declare @StandIndex int
declare @n		int
select @StandIndex = count(character_idx) from tb_character where user_idx = @USER_IDX
set @n = 0
if(@StandIndex != 0) 
begin
	while(@n < 5)
	begin 
		if exists (select * from tb_character where character_standindex = @n and user_idx = @USER_IDX)
		begin
			Set @n = @n + 1
			continue
		end
		else
		begin
			Set @StandIndex = @n
			break
		end
	end
end
--- 090703 ONS ?褶 ?陛衛 ??腎朝 等檜攪 摹樹 ? 蟾晦?
DECLARE	@CHARACTER_MAXGRADE		smallint
DECLARE	@CHARACTER_LEVELUPPOINT	smallint
DECLARE	@CHARACTER_SKILLPOINT	smallint
DECLARE	@CHARACTER_POS_X		int
DECLARE	@CHARACTER_POS_Y		int
SET		@CHARACTER_MAXGRADE		= 1
SET		@CHARACTER_LEVELUPPOINT	= 0
SET		@CHARACTER_SKILLPOINT	= 0
SET		@CHARACTER_POS_X		= 45500
SET		@CHARACTER_POS_Y		= 36100

-- ?褶? ?辦
IF 2 = @CHARACTER_RACE 
	BEGIN
		SET	@CHARACTER_DRESS		= 12009347
		SET	@CHARACTER_MAXGRADE		= 40	
		SET	@CHARACTER_LEVELUPPOINT	= 195
		SET	@CHARACTER_SKILLPOINT	= 918
		SET	@CHARACTER_MAP			= 96
		SET	@CHARACTER_LOGINPOINT	= 2019
		SET	@CHARACTER_POS_X		= 14500
		SET	@CHARACTER_POS_Y		= 11800
	END

insert TB_CHARACTER
(
	USER_IDX
,	CHARACTER_STANDINDEX
,	CHARACTER_STR
,	CHARACTER_DEX		
,	CHARACTER_VIT		
,	CHARACTER_INT
,	CHARACTER_WIS
,	CHARACTER_NAME	
,	CHARACTER_FACETYPE	
,	CHARACTER_HEADTYPE	
,	CHARACTER_MAP
,	CHARACTER_GENDER
,	CHARACTER_STAGE
,	CHARACTER_JOB
,	CHARACTER_JOB1
,	CHARACTER_JOB2
,	CHARACTER_JOB3
,	CHARACTER_JOB4
,	CHARACTER_JOB5
,	CHARACTER_JOB6
,	character_loginpoint
, 	character_Money	
,	character_dress
, 	CHARACTER_GRADE
,	CHARACTER_MAXGRADE
,	CHARACTER_GRADEUPPOINT
,	CHARACTER_SKILLPOINT
,	CHARACTER_POS_X
,	CHARACTER_POS_Y
)
	values
	(
		@USER_IDX
	,	@StandIndex
	,	@CHARACTER_Strength
	,	@CHARACTER_Dexterity
	,	@CHARACTER_Vitality
	,	@CHARACTER_Intelligence
	,	@CHARACTER_Wisdom
	,	@CHARACTER_NAME		
	,	@CHARACTER_FACETYPE	
	,	@CHARACTER_HEADTYPE	
	,	@CHARACTER_MAP
	,	@CHARACTER_GENDER
	,	@CHARACTER_RACE
	,	1
	,	@CHARACTER_JOB
	,	0
	,	0
	,	0
	,	0
	,	0
	, 	@CHARACTER_LOGINPOINT
	,	0
	,	@CHARACTER_DRESS
	, 	@CHARACTER_MAXGRADE
	,	@CHARACTER_MAXGRADE
	,	@CHARACTER_LEVELUPPOINT
	,	@CHARACTER_SKILLPOINT
	,	@CHARACTER_POS_X
	,	@CHARACTER_POS_Y
	)

declare @Character_idx int
set @Character_idx = @@identity

--select @Character_idx = max(Character_idx) from tb_character where @USER_IDX = User_idx
insert tb_item(character_idx, item_idx, item_position, item_qposition, item_durability)
	values(@Character_idx, @CHARACTER_DRESS, 82, 0, 0)

if @CHARACTER_JOB = 1
begin
	insert tb_item(character_idx, item_idx, item_position, item_qposition, item_durability)
		values(@Character_idx, 11000001, 0, 0, 0)
	insert tb_item(character_idx, item_idx, item_position, item_qposition, item_durability)
		values(@Character_idx, 11000094, 1, 0, 0)
	insert tb_item(character_idx, item_idx, item_position, item_qposition, item_durability)
		values(@Character_idx, 21000543, 2, 0, 1)
	insert tb_item(character_idx, item_idx, item_position, item_qposition, item_durability)
		values(@Character_idx, 21000544, 3, 0, 1)
	insert tb_item(character_idx, item_idx, item_position, item_qposition, item_durability)
		values(@Character_idx, 21001051, 4, 0, 1)
end
else if @CHARACTER_JOB = 2
begin
	insert tb_item(character_idx, item_idx, item_position, item_qposition, item_durability)
		values(@Character_idx, 11000187, 0, 0, 0)
	insert tb_item(character_idx, item_idx, item_position, item_qposition, item_durability)
		values(@Character_idx, 11000218, 1, 0, 0)
	insert tb_item(character_idx, item_idx, item_position, item_qposition, item_durability)
		values(@Character_idx, 21000543, 2, 0, 1)
	insert tb_item(character_idx, item_idx, item_position, item_qposition, item_durability)
		values(@Character_idx, 21000544, 3, 0, 1)
	insert tb_item(character_idx, item_idx, item_position, item_qposition, item_durability)
		values(@Character_idx, 21001051, 4, 0, 1)
end
else if @CHARACTER_JOB = 3
begin
	insert tb_item(character_idx, item_idx, item_position, item_qposition, item_durability)
		values(@Character_idx, 11000249, 0, 0, 0)
	insert tb_item(character_idx, item_idx, item_position, item_qposition, item_durability)
		values(@Character_idx, 21000543, 2, 0, 1)
	insert tb_item(character_idx, item_idx, item_position, item_qposition, item_durability)
		values(@Character_idx, 21000544, 3, 0, 1)
	insert tb_item(character_idx, item_idx, item_position, item_qposition, item_durability)
		values(@Character_idx, 21001051, 4, 0, 1)
end
else if @CHARACTER_JOB = 4
begin
	insert tb_item(character_idx, item_idx, item_position, item_qposition, item_durability)
		values(@Character_idx, 11007554, 0, 0, 0)
	insert tb_item(character_idx, item_idx, item_position, item_qposition, item_durability)
		values(@Character_idx, 21001551, 1, 0, 1)
	insert tb_item(character_idx, item_idx, item_position, item_qposition, item_durability)
		values(@Character_idx, 21001054, 2, 0, 1)
end

if @CHARACTER_RACE = 0
begin
	insert tb_skill	( CHARACTER_IDX, SKILL_IDX, SKILL_LEVEL )
		values ( @CHARACTER_IDX, 8001601, 1 )
end
else if @CHARACTER_RACE = 1
begin
	insert tb_skill	( CHARACTER_IDX, SKILL_IDX, SKILL_LEVEL )
		values ( @CHARACTER_IDX, 8001701, 1 )
end
else if @CHARACTER_RACE = 2
begin
	insert tb_skill	( CHARACTER_IDX, SKILL_IDX, SKILL_LEVEL )
		values ( @CHARACTER_IDX, 8001501, 1 )
end
	insert tb_skill	( CHARACTER_IDX, SKILL_IDX, SKILL_LEVEL )
		values ( @CHARACTER_IDX, 3204301, 1 )


-- 080614 LYW : 蝶鑒 ?檣? 薑爾? 議葛攪 ?檜??憮 ?堅, 評煎 婦葬? 衛??晦 陽僥?, 
-- 蝶鑒 ?檣? ?檜?? 議葛攪 ??? ?陛??.
insert tb_skillpoint(character_idx, skill_point, cumulative_point) 
values(@character_idx, @CHARACTER_SKILLPOINT, @CHARACTER_SKILLPOINT)

EXEC MP_QUICK_Update
	@character_idx,
	0,				-- 衛? 廓?
	4, 0, 0, 0,		-- 1廓 蝸煜
	0, 0, 0, 0,		-- 2廓 蝸煜
	0, 0, 0, 0,		-- 3廓 蝸煜
	4, 2, 2, 0,		-- 4廓 蝸煜
	4, 3, 3, 0,		-- 5廓 蝸煜
	4, 66, 66, 0,	-- 6廓 蝸煜
	0, 0, 0, 0,		-- 7廓 蝸煜
	4, 28, 28, 0,	-- 8廓 蝸煜
	4, 6, 6, 0,		-- 9廓 蝸煜
	4, 1, 1, 0		-- 10廓 蝸煜

insert TB_CharacterCreateInfo( character_idx, user_idx, character_name, flag, create_date, create_ip )
		values( @Character_idx, @USER_IDX, @CHARACTER_NAME, 1, getdate(), @IP )
select 0,	@Character_idx,		@CHARACTER_JOB, @CHARACTER_NAME, @CHARACTER_MAP

return
GO
/****** Object:  StoredProcedure [dbo].[TP_CHARACTER_INDEX_SELECT]    Script Date: 07/30/2013 14:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 개체: 저장 프로시저 dbo.TP_CHARACTER_INDEX_SELECT    스크립트 날짜: 2009-09-16 오후 3:03:41 ******/

-- 071120 웅주
CREATE PROCEDURE [dbo].[TP_CHARACTER_INDEX_SELECT]
(
	@CHAR_IDX	INT
)
AS
	DECLARE @NAME VARCHAR( 16 )
	
	SELECT  @NAME = CHARACTER_NAME
	FROM      TB_CHARACTER
	WHERE   (CHARACTER_IDX = @CHAR_IDX)

	IF @NAME IS NULL
	BEGIN
		SELECT 0
		RETURN
	END
	
	EXEC DBO.TP_CHARACTER_NAME_SELECT 0, '', @NAME
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_ITEM_Insert_To_Note]    Script Date: 07/30/2013 14:53:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[MP_ITEM_Insert_To_Note]			-- 아이템 추가 프로시저
	(
		@CHARACTER_IDX		int		-- 캐릭터 인덱스 변수 선언
	,	@ITEM_IDX			int		-- 아이템 인덱스 변수 선언
	,	@ITEM_DURABILITY	int		-- 내구성 ( 현재 중복 개수로 사용 ) 변수 선언
	,	@ITEM_SEAL			int
	,	@OBTAIN_MONEY		int
	,	@Kind				int		-- 우편파싱타입
	,	@NameMsgIndex		int
	,	@TitleMsgIndex		int
	,	@Param				varchar(256)
	)
	
	as

	Set Nocount on

	declare @DBReturnValue int

	-- 우편정보
	declare @Note_SendName varchar(16)
	declare @Note_Title	varchar(40)
	declare @Note_Note varchar(300)
	declare @ObtainMoney int
	set @Note_SendName = '<NPC' + CONVERT(VARCHAR(5),@NameMsgIndex) + '>'
	set @Note_Title = '<MSG' + CONVERT(VARCHAR(5),@TitleMsgIndex) + '>'
	set @Note_Note = CONVERT(VARCHAR(10),@Kind) + ', ' + CONVERT(VARCHAR(256),@Param)

	set @ObtainMoney = @OBTAIN_MONEY

	-- 수신자정보
	declare @ReceiveCharName varchar(16)
	select @ReceiveCharName = CHARACTER_NAME
	from [dbo].[TB_CHARACTER] with (nolock)
	where [CHARACTER_IDX] = @CHARACTER_IDX

	-- 아이템생성
	declare @NewDBIdx int
	declare @newItemDBIdx int
	insert [dbo].[TB_ITEM] 
	(
		CHARACTER_IDX				-- 캐릭터 인덱스
	, 	ITEM_IDX					-- 아이템 인덱스
	, 	ITEM_DURABILITY				-- 내구성 ( 현재 중복 개수로 사용 ) 
	, 	ITEM_POSITION				-- 인벤토리 상의 아이템 위치
	, 	ITEM_QPOSITION				-- 퀵 슬롯 상의 아이템 위치
	, 	ITEM_PYOGUKIDX				-- 표국 인덱스
	, 	item_munpaidx				-- 문파 인덱스
	,	ITEM_PARAM					-- 아이템 parameter
	,	ITEM_SEAL					-- 봉인상태
	,	ITEM_REMAINTIME				-- 남은 시간
	)
	values							-- 추가 값을 열거
	(
		@CHARACTER_IDX				-- 캐릭터 인덱스
	, 	@ITEM_IDX					-- 아이템 인덱스
	, 	@ITEM_DURABILITY			-- 내구성( 현재 중복 개수로 사용 )
	, 	0							-- 인벤토리 상의 아이템 위치
	, 	0							-- 퀵 슬롯 상의 아이템 위치
	, 	0							-- 표국 인덱스
	, 	0							-- 문파 인덱스
	,	0							-- 아이템 parameter
	,	@ITEM_SEAL					-- 봉인 상태
	,	0							-- 남은 시간
	)
	select @newItemDBIdx = @@identity
	set @NewDBIdx = @newItemDBIdx

	-------우편발송
	exec @DBReturnValue = [dbo].[MP_NOTE_SENDNOTE] 
		@ReceiveCharName,
		@Note_SendName,
		@Note_Title,
		@Note_Note,
		@newItemDBIdx,
		@OBTAIN_MONEY,
		0,
		1 -- @NoResult (exec로 호출한 프로시저의 리턴값은 필요없다)
	----------------

	select @CHARACTER_IDX, @NewDBIdx, @ITEM_IDX, @ITEM_DURABILITY, @OBTAIN_MONEY
GO
/****** Object:  StoredProcedure [dbo].[MP_CONSIGNMENT_Update]    Script Date: 07/30/2013 14:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROC [dbo].[MP_CONSIGNMENT_Update] 
(
@CharacterIndex int,
@ConsignmentIndex int,
@Kind tinyint, -- 0蛔煙鏃模(by嶸?) 1蛔煙鏃模(by晦除?婁) 2掘殮
@Durability int,
@Seal	int = 0
)
AS 
SET  NOCOUNT  ON 

if not exists (select * from [dbo].[tb_consignment] where [CONSIGNMENT_IDX] = @ConsignmentIndex)
begin
select -1
return
end

declare @DBReturnValue int
declare @Result int

set @DBReturnValue = 0
set @Result = 0

-- 辦?薑爾
declare @Note_SendName varchar(16)
declare @Note_Title	varchar(40)
declare @Note_Note varchar(300)
declare @ObtainMoney int
set @Note_SendName = '<CONSIGN>'
set @Note_Title = '<RECEIPT>' + CONVERT(VARCHAR(16),@ConsignmentIndex)
set @Note_Note = ''
set @ObtainMoney = 0

-- ?衙濠薑爾
declare @SellSoldOut int
declare @SellCharIdx int
declare @SellCharName varchar(16)
declare @SellItemName varchar(30)
declare @SellInitDurability int
declare @SellItemDeposit int
declare @SellItemCommission int
declare @SellItemPrice int
declare @SellItemEnchant int
declare @SellItemIndex int
declare @SellItemDBIdx int
declare @SellEndDate smalldatetime

set @SellSoldOut = 0
select @SellCharIdx = CHARACTER_IDX,
		@SellCharName = CHARACTER_NAME,
		@SellItemName = ITEM_NAME,
		@SellInitDurability = INIT_DURABILITY,
		@SellItemDeposit = DEPOSIT,
		@SellItemCommission = COMMISSION,
		@SellItemPrice = PRICE,
		@SellItemEnchant = ENCHANT,
		@SellItemIndex = ITEM_INDEX,
		@SellItemDBIdx = ITEM_DBIDX,
		@SellEndDate = ENDTIME
from [dbo].[TB_CONSIGNMENT] with (nolock)
where [consignment_idx] = @ConsignmentIndex

if (select count(*) from [dbo].[TB_CHARACTER] where CHARACTER_IDX = @SellCharIdx) = 0
begin
	set @Result = -1
	select @Result
	return
end

-- 議葛攪 檜?擎 議葛攪?檜??憮 嫡??濠. (議葛攪?擎 ??陛棟)
select @SellCharName = character_name
from [dbo].[TB_CHARACTER] with (nolock)
where character_idx  = @SellCharIdx

declare @CurItemDurability int
set @CurItemDurability = 0
if(@SellInitDurability > 0)
begin
	select @CurItemDurability = [ITEM_DURABILITY]
	from [dbo].[TB_ITEM] with (nolock)
	where [ITEM_DBIDX] = @SellItemDBIdx
end

if(@Kind = 0) -- eConsignmentUPDATEKIND_CancelByUser (嶸?鏃模)
	begin
	if(@SellCharIdx <> @CharacterIndex)
		begin
		set @Result = -1
		select @Result
		return
		end

	if(getdate() >= @SellEndDate)
		begin
		set @Result = -1
		select @Result
		return
		end

	set @Result = 2 --eConsignmentDBResult_UserCancel_Ack
	-------辦?嫦歎 (嶸?鏃模)
	set @Note_Note = @Note_Note + CONVERT(VARCHAR(16),@Kind) + ', '
	set @Note_Note = @Note_Note + @SellItemName + ', '
	set @Note_Note = @Note_Note + CONVERT(VARCHAR(16),@SellInitDurability) + ', '
	set @Note_Note = @Note_Note + CONVERT(VARCHAR(10),@CurItemDurability) + ', '
	set @Note_Note = @Note_Note + CONVERT(VARCHAR(10),@SellItemDeposit) + ', '
	set @Note_Note = @Note_Note + CONVERT(VARCHAR(10),@SellItemCommission) + ', '
	set @Note_Note = @Note_Note + CONVERT(VARCHAR(10),@SellItemPrice)
	set @ObtainMoney = ((@SellInitDurability-@CurItemDurability)*@SellItemPrice)
						- ((@SellInitDurability-@CurItemDurability)*@SellItemCommission)

	exec @DBReturnValue = [dbo].[MP_NOTE_SENDNOTE] 
		@SellCharName,
		@Note_SendName,
		@Note_Title,
		@Note_Note,
		@SellItemDBIdx,
		@ObtainMoney,
		0,
		1 -- @NoResult (exec煎 ?轎? ?煎衛?曖 葬?高擎 ?蹂橈?)
	----------------
	delete from [dbo].[TB_CONSIGNMENT] where @ConsignmentIndex = [CONSIGNMENT_IDX]
	select @Result, @SellItemName, @SellItemDBIdx, @SellItemIndex, @CurItemDurability, @SellItemPrice, @ConsignmentIndex
	return
	end

else if(@kind = 1) -- eConsignmentUPDATEKIND_CancelByTime (晦除鏃模)
	begin
	set @Result = 4 --eConsignmentDBResult_TimeCancel_Ack
	-------辦?嫦歎 (晦除鏃模)
	set @Note_Note = @Note_Note + CONVERT(VARCHAR(16),@Kind) + ', '
	set @Note_Note = @Note_Note + @SellItemName + ', '
	set @Note_Note = @Note_Note + CONVERT(VARCHAR(16),@SellInitDurability) + ', '
	set @Note_Note = @Note_Note + CONVERT(VARCHAR(10),@CurItemDurability) + ', '
	set @Note_Note = @Note_Note + CONVERT(VARCHAR(10),@SellItemDeposit) + ', '
	set @Note_Note = @Note_Note + CONVERT(VARCHAR(10),@SellItemCommission) + ', '
	set @Note_Note = @Note_Note + CONVERT(VARCHAR(10),@SellItemPrice)
	set @ObtainMoney = ((@SellInitDurability-@CurItemDurability)*@SellItemPrice)
						- ((@SellInitDurability-@CurItemDurability)*@SellItemCommission)
						+ @SellItemDeposit

	exec @DBReturnValue = [dbo].[MP_NOTE_SENDNOTE] 
		@SellCharName,
		@Note_SendName,
		@Note_Title,
		@Note_Note,
		@SellItemDBIdx,
		@ObtainMoney,
		@SellEndDate,
		1 -- @NoResult (exec煎 ?轎? ?煎衛?曖 葬?高擎 ?蹂橈?)
	----------------
	delete from [dbo].[TB_CONSIGNMENT] where @ConsignmentIndex = [CONSIGNMENT_IDX]
	select @Result, @SellItemName, @SellItemDBIdx, @SellItemIndex, @CurItemDurability, @SellItemPrice, @ConsignmentIndex
	return
	end

else
	begin
	if(getdate() >= @SellEndDate)
		begin
		set @Result = -1
		select @Result
		return
		end

	-- 掘衙濠薑爾
	declare @NewDBIdx int
	set @NewDBIdx = 0
	declare @BuyCharName varchar(16)
	declare @BuyCharMoney bigint

	select @BuyCharName = CHARACTER_NAME,
			@BuyCharMoney = CHARACTER_MONEY
	from [dbo].[TB_CHARACTER] with (nolock)
	where [CHARACTER_IDX] = @CharacterIndex

	-- 掘殮?葬
	if( @Durability > @CurItemDurability )
		begin
		set @Result = -3 --eConsignmentDBResult_DurabilityErr
		select @Result
		return
		end

	-- ?萄羹?
	if(@SellInitDurability = 0)
	begin
		if(@SellItemPrice > @BuyCharMoney)
		begin
			set @Result = -2 --eConsignmentDBResult_PoorMoney
			select @Result
			return
		end
	end
	else
	begin
		if(@Durability*@SellItemPrice > @BuyCharMoney)
		begin
			set @Result = -2 --eConsignmentDBResult_PoorMoney
			select @Result
			return
		end
	end

	if( @Durability = @CurItemDurability )
		begin
		set @SellSoldOut = 1
		delete from [dbo].[TB_CONSIGNMENT] where @ConsignmentIndex = [CONSIGNMENT_IDX]

		-------辦?嫦歎 (?舒掘衙) To 掘衙濠
		set @Note_Note = @Note_Note + CONVERT(VARCHAR(16),@Kind) + ', '
		set @Note_Note = @Note_Note + @SellItemName + ', '
		set @Note_Note = @Note_Note + CONVERT(VARCHAR(16),@SellInitDurability) + ', '
		set @Note_Note = @Note_Note + CONVERT(VARCHAR(16),@Durability) + ', '
		set @Note_Note = @Note_Note + CONVERT(VARCHAR(10),@SellItemDeposit) + ', '
		set @Note_Note = @Note_Note + CONVERT(VARCHAR(10),@SellItemCommission) + ', '
		set @Note_Note = @Note_Note + CONVERT(VARCHAR(10),@SellItemPrice)

		exec @DBReturnValue = [dbo].[MP_NOTE_SENDNOTE] 
			@BuyCharName,
			@Note_SendName,
			@Note_Title,
			@Note_Note,
			@SellItemDBIdx,
			0,
			0,
			1 -- @NoResult (exec煎 ?轎? ?煎衛?曖 葬?高擎 ?蹂橈?)
		----------------

		-------辦?嫦歎 (艙熱?) To ?衙濠
		set @Note_Note = ''
		set @Note_Note = @Note_Note + CONVERT(VARCHAR(16), 3 ) + ', '
		set @Note_Note = @Note_Note + @SellItemName + ', '
		set @Note_Note = @Note_Note + CONVERT(VARCHAR(16),@SellInitDurability) + ', '
		set @Note_Note = @Note_Note + CONVERT(VARCHAR(16),@Durability) + ', '
		set @Note_Note = @Note_Note + CONVERT(VARCHAR(10),@SellItemDeposit) + ', '
		set @Note_Note = @Note_Note + CONVERT(VARCHAR(10),@SellItemCommission) + ', '
		set @Note_Note = @Note_Note + CONVERT(VARCHAR(10),@SellItemPrice)
		if ( @SellInitDurability = 0 )
			begin
			set @ObtainMoney = (@SellItemPrice + @SellItemDeposit) - @SellItemCommission
			end
		else
			begin
			set @ObtainMoney = ((@SellInitDurability * @SellItemPrice) + @SellItemDeposit)
								- (@SellInitDurability * @SellItemCommission)
			end

		exec @DBReturnValue = [dbo].[MP_NOTE_SENDNOTE] 
			@SellCharName,
			@Note_SendName,
			@Note_Title,
			@Note_Note,
			0,
			@ObtainMoney,
			0,
			1 -- @NoResult (exec煎 ?轎? ?煎衛?曖 葬?高擎 ?蹂橈?)
		----------------
		
		end
	else --( @Durability > @CurItemDurability)
		begin
		-- 睡??衙 : 晦襄?衙 ?檜蠱熱? 偵褐
		update [dbo].[TB_ITEM]
		set @CurItemDurability = ITEM_DURABILITY = @CurItemDurability - @Durability
		where @SellItemDBIdx = ITEM_DBIDX
		
		-- 睡??衙 : 辦?嫦歎辨 ?檜蠱??
		declare @newItemDBIdx int

		insert [dbo].[TB_ITEM] 
		(
			CHARACTER_IDX				-- 議葛攪 檣策蝶
		, 	ITEM_IDX					-- ?檜蠱 檣策蝶
		, 	ITEM_DURABILITY				-- 頂掘? ( ?營 ?? 偃熱煎 餌辨 ) 
		, 	ITEM_POSITION				-- 檣漸?葬 鼻曖 ?檜蠱 嬪纂
		, 	ITEM_QPOSITION				-- ? 蝸煜 鼻曖 ?檜蠱 嬪纂
		, 	ITEM_PYOGUKIDX				-- ?措 檣策蝶
		, 	item_munpaidx				-- 僥? 檣策蝶
		,	ITEM_PARAM					-- ?檜蠱 parameter
		,	ITEM_SEAL					-- ?檣鼻?
		,	ITEM_REMAINTIME				-- ?擎 衛除
		)
		values							-- ?陛 高擊 ?剪
		(
			@CharacterIndex				-- 議葛攪 檣策蝶
		, 	@SellItemIndex				-- ?檜蠱 檣策蝶
		, 	@Durability					-- 頂掘?( ?營 ?? 偃熱煎 餌辨 )
		, 	0							-- 檣漸?葬 鼻曖 ?檜蠱 嬪纂
		, 	0							-- ? 蝸煜 鼻曖 ?檜蠱 嬪纂
		, 	0							-- ?措 檣策蝶
		, 	0							-- 僥? 檣策蝶
		,	0							-- ?檜蠱 parameter
		,	@Seal						-- ?檣 鼻?
		,	0							-- ?擎 衛除
		)
		
		select @newItemDBIdx = @@identity
		set @NewDBIdx = @newItemDBIdx

		-------辦?嫦歎 (睡?掘衙) To 掘衙濠
		set @Note_Note = @Note_Note + CONVERT(VARCHAR(16),@Kind) + ', '
		set @Note_Note = @Note_Note + @SellItemName + ', '
		set @Note_Note = @Note_Note + CONVERT(VARCHAR(16),@SellInitDurability) + ', '
		set @Note_Note = @Note_Note + CONVERT(VARCHAR(16),@Durability) + ', '
		set @Note_Note = @Note_Note + CONVERT(VARCHAR(10),@SellItemDeposit) + ', '
		set @Note_Note = @Note_Note + CONVERT(VARCHAR(10),@SellItemCommission) + ', '
		set @Note_Note = @Note_Note + CONVERT(VARCHAR(10),@SellItemPrice)

		exec @DBReturnValue = [dbo].[MP_NOTE_SENDNOTE] 
			@BuyCharName,
			@Note_SendName,
			@Note_Title,
			@Note_Note,
			@newItemDBIdx,
			0,
			0,
			1 -- @NoResult (exec煎 ?轎? ?煎衛?曖 葬?高擎 ?蹂橈?)
		----------------
		end

	-- ??陛 ?檜?? 晦煙
	declare @SellNum int
	declare @SellPrice bigint
	if(@SellInitDurability = 0)
		begin
		set @SellNum = 1
		end
	else
		begin
		set @SellNum = @Durability	
		end

	set @SellPrice = @SellItemPrice * @SellNum
	exec @DBReturnValue = [dbo].[MP_CONSIGNMENT_Average] 
		@SellItemIndex,
		@SellItemEnchant,
		@SellPrice,
		@SellNum
		

	set @Result = 6 --eConsignmentDBResult_Buy_Ack
	select @Result, @SellItemIndex, @SellItemDBIdx, @SellItemName, @Durability, @SellItemPrice, @SellCharIdx, @SellSoldOut, @NewDBIdx, @SellCharName, @ObtainMoney, @ConsignmentIndex
end








SET QUOTED_IDENTIFIER ON
GO
