USE [LUNA_LOGDB]
GO
/****** Object:  Table [dbo].[TB_LOGCHEAT]    Script Date: 07/30/2013 16:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_LOGCHEAT](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[Character_Idx] [int] NOT NULL,
	[LogType] [smallint] NOT NULL,
	[Param] [decimal](19, 4) NOT NULL,
	[Item_DBIdx] [int] NOT NULL,
	[Item_Idx] [int] NOT NULL,
	[RegDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_ITEM_LOG_20100708]    Script Date: 07/30/2013 16:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ITEM_LOG_20100708](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[LogType] [smallint] NOT NULL,
	[FromChrName] [varchar](16) NOT NULL,
	[FromChrIdx] [int] NOT NULL,
	[ToChrName] [varchar](16) NOT NULL,
	[ToChrIdx] [int] NOT NULL,
	[FromTotalMoney] [bigint] NOT NULL,
	[ToTotalMoney] [bigint] NOT NULL,
	[ChangeMoney] [bigint] NULL,
	[ItemIdx] [int] NULL,
	[ItemDBIdx] [int] NULL,
	[ItemDur] [int] NULL,
	[ItemFromPos] [int] NULL,
	[ItemToPos] [int] NULL,
	[RegDate] [datetime] NOT NULL CONSTRAINT [DF_TB_ITEM_LOG_RegDate TB_ITEM_LOG_20100708]  DEFAULT (getdate()),
	[ChrExpPoint] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_LOGITEMMONEY]    Script Date: 07/30/2013 16:01:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_LOGITEMMONEY](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[LogType] [smallint] NOT NULL,
	[FromChrName] [varchar](16) NOT NULL,
	[FromChrIdx] [int] NOT NULL,
	[ToChrName] [varchar](16) NOT NULL,
	[ToChrIdx] [int] NOT NULL,
	[FromTotalMoney] [bigint] NOT NULL,
	[ToTotalMoney] [bigint] NOT NULL,
	[ChangeMoney] [bigint] NULL,
	[ItemIdx] [int] NULL,
	[ItemDBIdx] [int] NULL,
	[ItemDur] [int] NULL,
	[ItemFromPos] [int] NULL,
	[ItemToPos] [int] NULL,
	[RegDate] [datetime] NOT NULL,
	[ChrExpPoint] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_LogHacking]    Script Date: 07/30/2013 16:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_LogHacking](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[Character_idx] [int] NOT NULL,
	[CheatKind] [int] NOT NULL,
	[LogDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_SCRIPT_HACK_LOG]    Script Date: 07/30/2013 16:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_SCRIPT_HACK_LOG](
	[LOG_IDX] [int] IDENTITY(1,1) NOT NULL,
	[USER_IDX] [int] NOT NULL,
	[CHAR_IDX] [int] NOT NULL,
	[SCRIPT] [varchar](16) NOT NULL CONSTRAINT [DF_TB_SCRIPT_HACK_LOG_SCRIPT]  DEFAULT (''),
	[MEMO] [varchar](16) NOT NULL CONSTRAINT [DF_TB_SCRIPT_HACK_LOG_MEMO]  DEFAULT (''),
	[DATE] [datetime] NOT NULL CONSTRAINT [DF_TB_SCRIPT_HACK_LOG_DATE]  DEFAULT (getdate())
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_MARRIAGE_LOG]    Script Date: 07/30/2013 16:01:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_MARRIAGE_LOG](
	[Log_Idx] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [int] NOT NULL,
	[PartnerID] [int] NOT NULL,
	[Kind] [int] NOT NULL,
 CONSTRAINT [PK_TB_MARRIAGE_LOG] PRIMARY KEY CLUSTERED 
(
	[Log_Idx] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_MONEYLOG]    Script Date: 07/30/2013 16:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_MONEYLOG](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[CharNo] [int] NOT NULL,
	[LogType] [smallint] NOT NULL,
	[ChangeValue] [bigint] NOT NULL CONSTRAINT [DF_TB_MONEYLOG_ChangeValue]  DEFAULT ((0)),
	[InvenMoney] [bigint] NOT NULL,
	[TargetIdx] [decimal](18, 0) NOT NULL,
	[TargetMoney] [bigint] NOT NULL,
	[LogDate] [datetime] NOT NULL CONSTRAINT [DF_TB_MONEYLOG_LogDate]  DEFAULT (getdate())
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_OPERATOR_LOG]    Script Date: 07/30/2013 16:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_OPERATOR_LOG](
	[INDEX] [int] IDENTITY(1,1) NOT NULL,
	[OPER_ID] [varchar](16) NOT NULL,
	[TYPE] [int] NOT NULL,
	[DATE] [datetime] NOT NULL CONSTRAINT [DF_TB_OPERATOR_LOG_DATE]  DEFAULT (getdate()),
	[KEY1] [varchar](16) NULL,
	[VALUE1] [varchar](16) NULL,
	[KEY2] [varchar](16) NULL,
	[VALUE2] [varchar](16) NULL,
	[KEY3] [varchar](16) NULL,
	[VALUE3] [varchar](16) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_OptionLog]    Script Date: 07/30/2013 16:01:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_OptionLog](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[OPTION_DBIDX] [int] NOT NULL,
	[CHARNO] [int] NOT NULL,
	[Item_DBIdx] [int] NOT NULL,
	[Strength] [int] NOT NULL,
	[Dexterity] [int] NOT NULL,
	[Vitality] [int] NOT NULL,
	[Intelligence] [int] NOT NULL,
	[Wisdom] [int] NOT NULL,
	[LIFE] [int] NOT NULL,
	[Mana] [int] NOT NULL,
	[FIREATTRREGIST] [smallint] NOT NULL,
	[WATERATTRREGIST] [smallint] NOT NULL,
	[TREEATTRREGIST] [smallint] NOT NULL,
	[GOLDATTRREGIST] [smallint] NOT NULL,
	[EARTHATTRREGIST] [smallint] NOT NULL,
	[PHYATTACK] [int] NOT NULL,
	[CRITICAL] [int] NOT NULL,
	[FIREATTRATTACK] [smallint] NOT NULL,
	[WATERATTRATTACK] [smallint] NOT NULL,
	[TREEATTRATTACK] [smallint] NOT NULL,
	[GOLDATTRATTACK] [smallint] NOT NULL,
	[EARTHATTRATTACK] [smallint] NOT NULL,
	[PHYDEFENSE] [int] NOT NULL,
	[RegDate] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_PET_LOG]    Script Date: 07/30/2013 16:01:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_PET_LOG](
	[LOG_IDX] [int] IDENTITY(1,1) NOT NULL,
	[TYPE] [int] NOT NULL,
	[USER_IDX] [int] NOT NULL,
	[PET_IDX] [int] NOT NULL,
	[EXPERIENCE] [int] NOT NULL,
	[FRIENDSHIP] [int] NOT NULL,
	[GRADE] [tinyint] NOT NULL,
	[LEVEL] [tinyint] NOT NULL,
	[KIND] [int] NOT NULL,
	[STATE] [tinyint] NOT NULL,
	[SKILL_SLOT] [tinyint] NOT NULL,
	[DATE] [datetime] NOT NULL CONSTRAINT [DF_TB_PET_LOG_DATE]  DEFAULT (getdate()),
	[MEMO] [varchar](16) NOT NULL CONSTRAINT [DF_TB_PET_LOG_MEMO]  DEFAULT ('')
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_ITEM_LOG_20100802]    Script Date: 07/30/2013 16:00:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ITEM_LOG_20100802](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[LogType] [smallint] NOT NULL,
	[FromChrName] [varchar](16) NOT NULL,
	[FromChrIdx] [int] NOT NULL,
	[ToChrName] [varchar](16) NOT NULL,
	[ToChrIdx] [int] NOT NULL,
	[FromTotalMoney] [bigint] NOT NULL,
	[ToTotalMoney] [bigint] NOT NULL,
	[ChangeMoney] [bigint] NULL,
	[ItemIdx] [int] NULL,
	[ItemDBIdx] [int] NULL,
	[ItemDur] [int] NULL,
	[ItemFromPos] [int] NULL,
	[ItemToPos] [int] NULL,
	[RegDate] [datetime] NOT NULL CONSTRAINT [DF_TB_ITEM_LOG_RegDate TB_ITEM_LOG_20100802]  DEFAULT (getdate()),
	[ChrExpPoint] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_PetLog]    Script Date: 07/30/2013 16:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_PetLog](
	[Idx] [int] IDENTITY(1,1) NOT NULL,
	[LogType] [int] NOT NULL,
	[PetIdx] [int] NOT NULL,
	[PetSummonItemDBIdx] [int] NOT NULL,
	[UserIdx] [int] NOT NULL,
	[CharacterIdx] [int] NOT NULL,
	[Grade] [int] NOT NULL,
	[FriendShip] [int] NOT NULL,
	[Stamina] [int] NOT NULL,
	[Alive] [tinyint] NOT NULL,
	[LogDate] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_QUEST_LOG]    Script Date: 07/30/2013 16:02:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_QUEST_LOG](
	[LOG_IDX] [int] IDENTITY(1,1) NOT NULL,
	[QUEST_MAIN_IDX] [int] NOT NULL,
	[QUEST_SUB_IDX] [int] NOT NULL,
	[CHAR_IDX] [int] NOT NULL,
	[VALUE1] [int] NOT NULL,
	[VALUE2] [smallint] NOT NULL,
	[DATE] [datetime] NOT NULL CONSTRAINT [DF_TB_QUEST_LOG_DATE]  DEFAULT (getdate()),
	[TYPE] [smallint] NOT NULL,
	[MEMO] [varchar](16) NOT NULL,
 CONSTRAINT [PK_TB_QUEST_LOG] PRIMARY KEY NONCLUSTERED 
(
	[LOG_IDX] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_ITEM_LOG_20100803]    Script Date: 07/30/2013 16:00:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ITEM_LOG_20100803](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[LogType] [smallint] NOT NULL,
	[FromChrName] [varchar](16) NOT NULL,
	[FromChrIdx] [int] NOT NULL,
	[ToChrName] [varchar](16) NOT NULL,
	[ToChrIdx] [int] NOT NULL,
	[FromTotalMoney] [bigint] NOT NULL,
	[ToTotalMoney] [bigint] NOT NULL,
	[ChangeMoney] [bigint] NULL,
	[ItemIdx] [int] NULL,
	[ItemDBIdx] [int] NULL,
	[ItemDur] [int] NULL,
	[ItemFromPos] [int] NULL,
	[ItemToPos] [int] NULL,
	[RegDate] [datetime] NOT NULL CONSTRAINT [DF_TB_ITEM_LOG_RegDate TB_ITEM_LOG_20100803]  DEFAULT (getdate()),
	[ChrExpPoint] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_SIEGE_LOG]    Script Date: 07/30/2013 16:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_SIEGE_LOG](
	[LOG_IDX] [int] IDENTITY(1,1) NOT NULL,
	[TYPE] [int] NOT NULL,
	[GUILD_IDX] [int] NOT NULL,
	[CHAR_IDX] [int] NOT NULL,
	[MEMO] [varchar](16) NOT NULL CONSTRAINT [DF_TB_SIEGE_LOG_MEMO]  DEFAULT (''),
	[DATE] [datetime] NOT NULL CONSTRAINT [DF_TB_SIEGE_LOG_DATE]  DEFAULT (getdate())
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_ITEM_LOG_20100809]    Script Date: 07/30/2013 16:00:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ITEM_LOG_20100809](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[LogType] [smallint] NOT NULL,
	[FromChrName] [varchar](16) NOT NULL,
	[FromChrIdx] [int] NOT NULL,
	[ToChrName] [varchar](16) NOT NULL,
	[ToChrIdx] [int] NOT NULL,
	[FromTotalMoney] [bigint] NOT NULL,
	[ToTotalMoney] [bigint] NOT NULL,
	[ChangeMoney] [bigint] NULL,
	[ItemIdx] [int] NULL,
	[ItemDBIdx] [int] NULL,
	[ItemDur] [int] NULL,
	[ItemFromPos] [int] NULL,
	[ItemToPos] [int] NULL,
	[RegDate] [datetime] NOT NULL CONSTRAINT [DF_TB_ITEM_LOG_RegDate TB_ITEM_LOG_20100809]  DEFAULT (getdate()),
	[ChrExpPoint] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_ToolLog]    Script Date: 07/30/2013 16:02:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ToolLog](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[LogType] [int] NOT NULL,
	[LogKind] [int] NOT NULL,
	[OperIdx] [int] NOT NULL,
	[OperName] [varchar](16) NOT NULL,
	[TargetIdx] [int] NOT NULL,
	[TargetName] [varchar](16) NOT NULL,
	[Param1] [int] NULL,
	[Param2] [int] NULL,
	[Param3] [int] NULL,
	[Param4] [int] NULL,
	[LogDate] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_ExpPointLog]    Script Date: 07/30/2013 15:59:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_ExpPointLog](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[LogType] [tinyint] NOT NULL CONSTRAINT [DF_tb_ExpPointLog_LogType]  DEFAULT ((0)),
	[charno] [int] NOT NULL,
	[Grade] [int] NOT NULL,
	[changeValue] [bigint] NOT NULL,
	[KillerKind] [smallint] NOT NULL,
	[KillerIdx] [int] NOT NULL,
	[ExpPoint] [bigint] NOT NULL,
	[AbilPoint] [int] NOT NULL,
	[LogDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_ITEM_LOG_20100810]    Script Date: 07/30/2013 16:00:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ITEM_LOG_20100810](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[LogType] [smallint] NOT NULL,
	[FromChrName] [varchar](16) NOT NULL,
	[FromChrIdx] [int] NOT NULL,
	[ToChrName] [varchar](16) NOT NULL,
	[ToChrIdx] [int] NOT NULL,
	[FromTotalMoney] [bigint] NOT NULL,
	[ToTotalMoney] [bigint] NOT NULL,
	[ChangeMoney] [bigint] NULL,
	[ItemIdx] [int] NULL,
	[ItemDBIdx] [int] NULL,
	[ItemDur] [int] NULL,
	[ItemFromPos] [int] NULL,
	[ItemToPos] [int] NULL,
	[RegDate] [datetime] NOT NULL CONSTRAINT [DF_TB_ITEM_LOG_RegDate TB_ITEM_LOG_20100810]  DEFAULT (getdate()),
	[ChrExpPoint] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_MoneyLogWrong]    Script Date: 07/30/2013 16:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_MoneyLogWrong](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[Logtype] [int] NOT NULL,
	[charno] [int] NOT NULL,
	[changeValue] [bigint] NOT NULL,
	[TotalMoney] [bigint] NOT NULL,
	[PyogukMoney] [bigint] NOT NULL,
	[LogDate] [datetime] NOT NULL,
	[TargetIdx] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_MugongExpLog]    Script Date: 07/30/2013 16:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_MugongExpLog](
	[Logidx] [int] IDENTITY(1,1) NOT NULL,
	[charno] [int] NOT NULL,
	[changeValue] [int] NOT NULL,
	[mIdx] [int] NOT NULL,
	[mDBIdx] [int] NOT NULL,
	[mSung] [int] NOT NULL,
	[mExp] [int] NOT NULL,
	[mPos] [int] NOT NULL,
	[LogDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_ITEM_LOG_20100813]    Script Date: 07/30/2013 16:00:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ITEM_LOG_20100813](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[LogType] [smallint] NOT NULL,
	[FromChrName] [varchar](16) NOT NULL,
	[FromChrIdx] [int] NOT NULL,
	[ToChrName] [varchar](16) NOT NULL,
	[ToChrIdx] [int] NOT NULL,
	[FromTotalMoney] [bigint] NOT NULL,
	[ToTotalMoney] [bigint] NOT NULL,
	[ChangeMoney] [bigint] NULL,
	[ItemIdx] [int] NULL,
	[ItemDBIdx] [int] NULL,
	[ItemDur] [int] NULL,
	[ItemFromPos] [int] NULL,
	[ItemToPos] [int] NULL,
	[RegDate] [datetime] NOT NULL CONSTRAINT [DF_TB_ITEM_LOG_RegDate TB_ITEM_LOG_20100813]  DEFAULT (getdate()),
	[ChrExpPoint] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_characterLog]    Script Date: 07/30/2013 15:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_characterLog](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[charno] [int] NOT NULL,
	[Grade] [int] NOT NULL,
	[Strength] [int] NOT NULL,
	[Dexterity] [int] NOT NULL,
	[Vitality] [int] NOT NULL,
	[Intelligence] [int] NOT NULL,
	[Wisdom] [int] NULL,
	[Point] [int] NOT NULL,
	[LogDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_charrename_log]    Script Date: 07/30/2013 15:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_charrename_log](
	[idx] [int] IDENTITY(1,1) NOT NULL,
	[character_idx] [int] NOT NULL,
	[character_before] [varchar](16) NOT NULL,
	[character_after] [varchar](16) NOT NULL,
	[reg_date] [smalldatetime] NOT NULL CONSTRAINT [DF_tb_charrename_log_reg_date]  DEFAULT (getdate())
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_mugongLog]    Script Date: 07/30/2013 16:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_mugongLog](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[Logtype] [int] NOT NULL,
	[charno] [int] NOT NULL,
	[mugongIdx] [int] NOT NULL,
	[mugongDBIdx] [int] NOT NULL,
	[mugongGrade] [int] NOT NULL,
	[mugongExp] [int] NOT NULL,
	[LogDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_ITEM_LOG_20100927]    Script Date: 07/30/2013 16:01:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ITEM_LOG_20100927](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[LogType] [smallint] NOT NULL,
	[FromChrName] [varchar](16) NOT NULL,
	[FromChrIdx] [int] NOT NULL,
	[ToChrName] [varchar](16) NOT NULL,
	[ToChrIdx] [int] NOT NULL,
	[FromTotalMoney] [bigint] NOT NULL,
	[ToTotalMoney] [bigint] NOT NULL,
	[ChangeMoney] [bigint] NULL,
	[ItemIdx] [int] NULL,
	[ItemDBIdx] [int] NULL,
	[ItemDur] [int] NULL,
	[ItemFromPos] [int] NULL,
	[ItemToPos] [int] NULL,
	[RegDate] [datetime] NOT NULL CONSTRAINT [DF_TB_ITEM_LOG_RegDate TB_ITEM_LOG_20100927]  DEFAULT (getdate()),
	[ChrExpPoint] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_ITEM_LOG_20101021]    Script Date: 07/30/2013 16:01:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ITEM_LOG_20101021](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[LogType] [smallint] NOT NULL,
	[FromChrName] [varchar](16) NOT NULL,
	[FromChrIdx] [int] NOT NULL,
	[ToChrName] [varchar](16) NOT NULL,
	[ToChrIdx] [int] NOT NULL,
	[FromTotalMoney] [bigint] NOT NULL,
	[ToTotalMoney] [bigint] NOT NULL,
	[ChangeMoney] [bigint] NULL,
	[ItemIdx] [int] NULL,
	[ItemDBIdx] [int] NULL,
	[ItemDur] [int] NULL,
	[ItemFromPos] [int] NULL,
	[ItemToPos] [int] NULL,
	[RegDate] [datetime] NOT NULL CONSTRAINT [DF_TB_ITEM_LOG_RegDate TB_ITEM_LOG_20101021]  DEFAULT (getdate()),
	[ChrExpPoint] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_SKILL_LOG]    Script Date: 07/30/2013 16:02:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_SKILL_LOG](
	[LOG_IDX] [int] IDENTITY(1,1) NOT NULL,
	[CHAR_IDX] [int] NOT NULL,
	[SKILL_DBIDX] [int] NOT NULL,
	[SKILL_IDX] [int] NOT NULL,
	[LEVEL] [smallint] NOT NULL,
	[POINT] [int] NULL,
	[DATE] [datetime] NOT NULL CONSTRAINT [DF_TB_SKILL_LOG_DATE]  DEFAULT (getdate()),
	[TYPE] [int] NOT NULL,
	[MEMO] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TB_SKILL_LOG] PRIMARY KEY NONCLUSTERED 
(
	[LOG_IDX] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[MP_SIEGE_CATAPULT_INACTIVE]    Script Date: 07/30/2013 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		이웅주
-- Create date: 2010.11.08
-- Description:	캐터펄트를 해제 상태로 변경한다.
-- =============================================
CREATE PROCEDURE [dbo].[MP_SIEGE_CATAPULT_INACTIVE]
	@MAP TINYINT,
	@POS_X INT,
	@POS_Z INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 	DELETE
	FROM
		TB_SIEGE_CATAPULT
	WHERE
		VALID_DATE > GETDATE() AND
		MAP = @MAP AND
		POS_X = @POS_X AND
		POS_Z = @POS_Z
END
GO
/****** Object:  Table [dbo].[TB_Protocol_Log]    Script Date: 07/30/2013 16:02:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Protocol_Log](
	[Character_idx] [int] NOT NULL,
	[Start_Time] [int] NULL,
	[Last_Time] [int] NULL,
	[Protocol1_Count] [int] NULL,
	[Protocol2_Count] [int] NULL,
	[Protocol3_Count] [int] NULL,
	[Protocol4_Count] [int] NULL,
 CONSTRAINT [PK_TB_Protocol_Log] PRIMARY KEY CLUSTERED 
(
	[Character_idx] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[TP_HOUSING_LOG]    Script Date: 07/30/2013 15:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE       PROCEDURE [dbo].[TP_HOUSING_LOG]
	(
		@dwOwnerIndex		int,
		@szPlayerName		varchar(16),
		@nLogType		int,
		@dwItemDBIndex		int,
		@dwItemIndex		int,
		@dwItemValue		int,
		@dwFurnitureIndex	int,
		@Category		int,
		@Slot			int,
		@szHouseName		varchar(32),
		@dwDecoPoint		int,
		@dwHousePoint		int
	)
AS
	Set	Nocount	On
	

	insert TB_HOUSING_LOG
	(
		OWNER_INDEX,
		CHARNAME,
		LOGTYPE,
		ITEMDB_INDEX,
		ITEM_INDEX,
		ITEM_VALUE,
		FURNITURE_INDEX,
		CATEGORY,
		SLOT,
		HOUSENAME,
		DECO_POINT,
		HOUSE_POINT,
		UPDATETIME
	)
	values
	(
		@dwOwnerIndex,
		@szPlayerName,
		@nLogType,
		@dwItemDBIndex,
		@dwItemIndex,
		@dwItemValue,
		@dwFurnitureIndex,
		@Category,
		@Slot,
		@szHouseName,
		@dwDecoPoint,
		@dwHousePoint,
		getdate()
	)
GO
/****** Object:  Table [dbo].[TB_CONSIGNMENT_LOG]    Script Date: 07/30/2013 15:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_CONSIGNMENT_LOG](
	[LOG_IDX] [int] IDENTITY(1,1) NOT NULL,
	[LOG_TYPE] [smallint] NOT NULL,
	[CHAR_INDEX] [int] NOT NULL,
	[ITEM_DBINDEX] [int] NOT NULL,
	[ITEM_INDEX] [int] NOT NULL,
	[DURABILITY] [int] NOT NULL,
	[UNITPRICE] [bigint] NOT NULL,
	[UPDATEDATE] [datetime] NOT NULL,
	[CONSIGNMENT_IDX] [int] NOT NULL DEFAULT ((0))
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_ITEM_LOG_20100616]    Script Date: 07/30/2013 16:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ITEM_LOG_20100616](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[LogType] [smallint] NOT NULL,
	[FromChrName] [varchar](16) NOT NULL,
	[FromChrIdx] [int] NOT NULL,
	[ToChrName] [varchar](16) NOT NULL,
	[ToChrIdx] [int] NOT NULL,
	[FromTotalMoney] [bigint] NOT NULL,
	[ToTotalMoney] [bigint] NOT NULL,
	[ChangeMoney] [bigint] NULL,
	[ItemIdx] [int] NULL,
	[ItemDBIdx] [int] NULL,
	[ItemDur] [int] NULL,
	[ItemFromPos] [int] NULL,
	[ItemToPos] [int] NULL,
	[RegDate] [datetime] NOT NULL CONSTRAINT [DF_TB_ITEM_LOG_RegDate TB_ITEM_LOG_20100616]  DEFAULT (getdate()),
	[ChrExpPoint] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_AbilityLog]    Script Date: 07/30/2013 15:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_AbilityLog](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[character_idx] [int] NOT NULL,
	[ability_idx] [smallint] NOT NULL,
	[ability_level_to] [tinyint] NOT NULL,
	[ability_exp_from] [int] NOT NULL,
	[ability_exp_to] [int] NOT NULL,
	[logdate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_ITEM_LOG_20100617]    Script Date: 07/30/2013 16:00:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ITEM_LOG_20100617](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[LogType] [smallint] NOT NULL,
	[FromChrName] [varchar](16) NOT NULL,
	[FromChrIdx] [int] NOT NULL,
	[ToChrName] [varchar](16) NOT NULL,
	[ToChrIdx] [int] NOT NULL,
	[FromTotalMoney] [bigint] NOT NULL,
	[ToTotalMoney] [bigint] NOT NULL,
	[ChangeMoney] [bigint] NULL,
	[ItemIdx] [int] NULL,
	[ItemDBIdx] [int] NULL,
	[ItemDur] [int] NULL,
	[ItemFromPos] [int] NULL,
	[ItemToPos] [int] NULL,
	[RegDate] [datetime] NOT NULL CONSTRAINT [DF_TB_ITEM_LOG_RegDate TB_ITEM_LOG_20100617]  DEFAULT (getdate()),
	[ChrExpPoint] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_FAMILY_POINT_LOG]    Script Date: 07/30/2013 15:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_FAMILY_POINT_LOG](
	[LOG_IDX] [int] IDENTITY(1,1) NOT NULL,
	[TYPE] [int] NOT NULL,
	[FAMILY_IDX] [int] NOT NULL,
	[POINT] [int] NOT NULL,
	[MONSTER_EXP] [int] NOT NULL,
	[LOGIN_MEMBER] [int] NOT NULL,
	[DATE] [datetime] NOT NULL CONSTRAINT [DF_TB_FAMILY_POINT_LOG_DATE]  DEFAULT (getdate()),
	[MEMO] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TB_FAMILY_POINT_LOG] PRIMARY KEY NONCLUSTERED 
(
	[LOG_IDX] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_FARM_ANIMAL_LOG]    Script Date: 07/30/2013 15:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_FARM_ANIMAL_LOG](
	[LOG_IDX] [int] IDENTITY(1,1) NOT NULL,
	[TYPE] [int] NOT NULL,
	[FARM_IDX] [int] NOT NULL,
	[ANIMAL_OWNER_IDX] [int] NOT NULL,
	[ANIMAL_IDX] [int] NOT NULL,
	[ANIMAL_KIND] [int] NOT NULL,
	[ANIMAL_STEP] [int] NOT NULL,
	[ANIMAL_LIFE] [int] NOT NULL,
	[ANIMAL_CONTENTMENT] [int] NOT NULL,
	[ANIMAL_INTEREST] [int] NOT NULL,
	[MEMO] [varchar](50) NOT NULL,
	[DATE] [datetime] NOT NULL CONSTRAINT [DF_TB_FARM_ANIMAL_LOG_DATE]  DEFAULT (getdate())
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_ITEM_LOG_20100621]    Script Date: 07/30/2013 16:00:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ITEM_LOG_20100621](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[LogType] [smallint] NOT NULL,
	[FromChrName] [varchar](16) NOT NULL,
	[FromChrIdx] [int] NOT NULL,
	[ToChrName] [varchar](16) NOT NULL,
	[ToChrIdx] [int] NOT NULL,
	[FromTotalMoney] [bigint] NOT NULL,
	[ToTotalMoney] [bigint] NOT NULL,
	[ChangeMoney] [bigint] NULL,
	[ItemIdx] [int] NULL,
	[ItemDBIdx] [int] NULL,
	[ItemDur] [int] NULL,
	[ItemFromPos] [int] NULL,
	[ItemToPos] [int] NULL,
	[RegDate] [datetime] NOT NULL CONSTRAINT [DF_TB_ITEM_LOG_RegDate TB_ITEM_LOG_20100621]  DEFAULT (getdate()),
	[ChrExpPoint] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_FARM_CROP_LOG]    Script Date: 07/30/2013 15:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_FARM_CROP_LOG](
	[LOG_IDX] [int] IDENTITY(1,1) NOT NULL,
	[TYPE] [int] NOT NULL,
	[FARM_IDX] [int] NOT NULL,
	[CROP_OWNER_IDX] [int] NOT NULL,
	[CROP_IDX] [int] NOT NULL,
	[CROP_KIND] [int] NOT NULL,
	[CROP_STEP] [int] NOT NULL,
	[CROP_LIFE] [int] NOT NULL,
	[CROP_SEED_GRADE] [int] NOT NULL,
	[DATE] [datetime] NOT NULL CONSTRAINT [DF_TB_FARM_CROP_LOG_DATE]  DEFAULT (getdate()),
	[MEMO] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TB_FARM_CROP_LOG] PRIMARY KEY NONCLUSTERED 
(
	[LOG_IDX] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_FARM_LOG]    Script Date: 07/30/2013 15:59:45 ******/
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
	[Date] [smalldatetime] NOT NULL CONSTRAINT [DF_TB_FARM_LOG_Date]  DEFAULT (getdate())
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[TP_FAMILY_LOG_INSERT]    Script Date: 07/30/2013 15:58:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
081205 LUJ, 패밀리 로그를 저장한다
*/
CREATE  PROCEDURE [dbo].[TP_FAMILY_LOG_INSERT]
(
	@TYPE		INT,
	@FAMILY_IDX	INT,
	@CHAR_IDX	INT,
	@MEMO		VARCHAR( 16 )
)
AS
	SET NOCOUNT ON
	/*
	INSERT INTO TB_FAMILY_LOG (
		TYPE,
		FAMILY_IDX,
		CHAR_IDX,
		MEMO,
		DATE  )
	VALUES	(
		@TYPE,
		@FAMILY_IDX,
		@CHAR_IDX,
		@MEMO,
		GETDATE() )	
	*/
	RETURN
GO
/****** Object:  Table [dbo].[TB_GUILD_SCORE_LOG]    Script Date: 07/30/2013 15:59:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_GUILD_SCORE_LOG](
	[LOG_IDX] [int] IDENTITY(1,1) NOT NULL,
	[TYPE] [int] NOT NULL,
	[GUILD_IDX] [int] NOT NULL,
	[SCORE] [int] NOT NULL,
	[DATE] [datetime] NOT NULL CONSTRAINT [DF_TB_GUILD_SCORE_LOG_DATE]  DEFAULT (getdate()),
	[MEMO] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TB_GUILD_SCORE_LOG] PRIMARY KEY NONCLUSTERED 
(
	[LOG_IDX] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[up_ItemMoneyLog]    Script Date: 07/30/2013 15:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080114 웅주, 오늘날짜에 해당하는 테이블에 로그를 저장한다
*/
CREATE  PROCEDURE [dbo].[up_ItemMoneyLog] (
	@FROMCHRIDX		INT, 
	@FROMCHRNAME	VARCHAR(16), 
	@TOCHRIDX		INT, 
	@TOCHRNAME		VARCHAR(16), 
	@LOGTYPE		SMALLINT,
	@FROMTOTALMONEY BIGINT,
	@TOTOTALMONEY	BIGINT,
	@CHANGEMONEY	BIGINT,
	@ITEMIDX		INT,
	@ITEMDBIDX		INT,
	@ITEMFROMPOS	INT,
	@ITEMTOPOS		INT,
	@ITEMDUR		INT,
	@CHREXPPOINT	INT
)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON

	--RETURN

	DECLARE @TABLE VARCHAR( 20 )
	SET @TABLE = 'TB_ITEM_LOG_' + CONVERT( VARCHAR( 8 ), GETDATE(), 112 )
	
	DECLARE @SQL VARCHAR( 1000 )

	SET @SQL = 'insert ' + @TABLE +
				' ( LogType, FromChrName, FromChrIdx, ToChrName, ToChrIdx, FromTotalMoney, ToTotalMoney, ChangeMoney,' +
				'	ItemIdx, ItemDBIdx, ItemFromPos, ItemToPos, ItemDur, ChrExpPoint ) VALUES (' +
				CAST( @LogType			AS VARCHAR( 20 ) ) + ',' +
				'''' + @FromChrName	+ ''',' +
				CAST( @FromChrIdx		AS VARCHAR( 20 ) ) + ',' +
				'''' + @ToChrName	+ ''',' +
				CAST( @ToChrIdx			AS VARCHAR( 20 ) ) + ',' +
				CAST( @FromTotalMoney	AS VARCHAR( 20 ) ) + ',' +
				CAST( @ToTotalMoney		AS VARCHAR( 20 ) ) + ',' +
				CAST( @ChangeMoney		AS VARCHAR( 20 ) ) + ',' +
				CAST( @ItemIdx			AS VARCHAR( 20 ) ) + ',' +
				CAST( @ItemDBIdx		AS VARCHAR( 20 ) ) + ',' +
				CAST( @ItemFromPos		AS VARCHAR( 20 ) ) + ',' +
				CAST( @ItemToPos		AS VARCHAR( 20 ) ) + ',' +
				CAST( @ItemDur			AS VARCHAR( 20 ) ) + ',' +
				CAST( @ChrExpPoint		AS VARCHAR( 20 ) ) + ')'
	EXEC( @SQL )
	RETURN
	

/*
080114 이전
ALTER PROC dbo.up_ItemMoneyLog (	@FromChrIdx int, 
					@FromChrName varchar(16), 
					@ToChrIdx int, 
					@ToChrName varchar(16), 
					@LogType smallint,
					@FromTotalMoney bigint,
					@ToTotalMoney bigint,
					@ChangeMoney bigint,
					@ItemIdx int,
					@ItemDBIdx int,
					@ItemFromPos int,
					@ItemToPos int,
					@ItemDur int,
					@ChrExpPoint int
				)
as

	Set Nocount on
	Set Xact_Abort on

insert tb_logitemmoney 
( 
LogType,
FromChrName,
FromChrIdx,
ToChrName,
ToChrIdx,
FromTotalMoney,
ToTotalMoney,
ChangeMoney,
ItemIdx,
ItemDBIdx,
ItemFromPos,
ItemToPos,
ItemDur,
RegDate,
ChrExpPoint
)
values
(
@LogType,
@FromChrName,
@FromChrIdx,
@ToChrName,
@ToChrIdx,
@FromTotalMoney,
@ToTotalMoney,
@ChangeMoney,
@ItemIdx,
@ItemDBIdx,
@ItemFromPos,
@ItemToPos,
@ItemDur,
getdate(),
@ChrExpPoint
)

return
*/
GO
/****** Object:  Table [dbo].[TB_GUILD_WAREHOUSE_LOG]    Script Date: 07/30/2013 15:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_GUILD_WAREHOUSE_LOG](
	[LOG_IDX] [int] IDENTITY(1,1) NOT NULL,
	[GUILD_IDX] [int] NOT NULL,
	[CHAR_IDX] [int] NOT NULL,
	[ITEM_IDX] [int] NOT NULL,
	[ITEM_DBIDX] [int] NOT NULL,
	[ITEM_DURABILITY] [int] NOT NULL,
	[ITEM_FROM_POSITION] [int] NOT NULL,
	[ITEM_TO_POSITION] [int] NOT NULL,
	[MONEY] [bigint] NOT NULL,
	[TYPE] [int] NOT NULL,
	[DATE] [datetime] NOT NULL CONSTRAINT [DF_TB_GUILD_WAREHOUSE_LOG_DATE]  DEFAULT (getdate()),
	[MEMO] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TB_GUILD_WAREHOUSE_LOG] PRIMARY KEY NONCLUSTERED 
(
	[LOG_IDX] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_FISHING_LOG]    Script Date: 07/30/2013 15:59:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_FISHING_LOG](
	[CharacterIdx] [int] NOT NULL,
	[LogType] [smallint] NOT NULL,
	[DiffPoint] [bigint] NULL,
	[BuyItemIdx] [int] NULL,
	[UseFish] [int] NULL,
	[LogDate] [datetime] NULL CONSTRAINT [DF_TB_FISHING_LOG_Date]  DEFAULT (getdate()),
	[TotalPOint] [bigint] NULL,
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[EXPERIENCE] [bigint] NOT NULL CONSTRAINT [DF__TB_FISHIN__EXPER__4E0988E7]  DEFAULT ((0)),
	[LEVEL] [int] NOT NULL CONSTRAINT [DF__TB_FISHIN__LEVEL__4EFDAD20]  DEFAULT ((0))
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_GuildLog]    Script Date: 07/30/2013 15:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_GuildLog](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[LogType] [int] NOT NULL,
	[GuildIdx] [int] NOT NULL,
	[Charno] [int] NOT NULL,
	[Param1] [int] NOT NULL,
	[Param2] [int] NOT NULL,
	[RegDate] [datetime] NOT NULL CONSTRAINT [DF_TB_GuildLog_RegDate]  DEFAULT (getdate())
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_ITEM_DROP_OPTION_LOG]    Script Date: 07/30/2013 16:00:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ITEM_DROP_OPTION_LOG](
	[LOG_IDX] [int] IDENTITY(1,1) NOT NULL,
	[TYPE] [int] NOT NULL,
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
	[VALUE5] [float] NOT NULL,
	[DATE] [datetime] NOT NULL CONSTRAINT [DF_TB_ITEM_DROP_OPTION_LOG_DATE]  DEFAULT (getdate()),
	[MEMO] [varchar](50) NOT NULL CONSTRAINT [DF_TB_ITEM_DROP_OPTION_LOG_MEMO]  DEFAULT ('')
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_GAMEROOM_POINT_LOG]    Script Date: 07/30/2013 15:59:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_GAMEROOM_POINT_LOG](
	[LOG_IDX] [int] IDENTITY(1,1) NOT NULL,
	[TYPE] [int] NOT NULL,
	[USER_IDX] [int] NOT NULL,
	[POINT] [int] NOT NULL,
	[DATE] [datetime] NOT NULL CONSTRAINT [DF_TB_GAMEROOM_POINT_LOG_DATE]  DEFAULT (getdate()),
 CONSTRAINT [PK_TB_GAMEROOM_POINT_LOG_IDX] PRIMARY KEY CLUSTERED 
(
	[LOG_IDX] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_ITEM_OPTION_LOG]    Script Date: 07/30/2013 16:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ITEM_OPTION_LOG](
	[LOG_IDX] [int] IDENTITY(1,1) NOT NULL,
	[CHAR_IDX] [int] NOT NULL,
	[ITEM_DBIDX] [int] NOT NULL,
	[REINFORCE_STRENGTH] [int] NOT NULL,
	[REINFORCE_DEXTERITY] [int] NOT NULL,
	[REINFORCE_VITALITY] [int] NOT NULL,
	[REINFORCE_INTELLIGENCE] [int] NOT NULL,
	[REINFORCE_WISDOM] [int] NOT NULL,
	[REINFORCE_LIFE] [int] NOT NULL,
	[REINFORCE_MANA] [int] NOT NULL,
	[REINFORCE_LIFE_RECOVERY] [int] NOT NULL,
	[REINFORCE_MANA_RECOVERY] [int] NOT NULL,
	[REINFORCE_PHYSIC_ATTACK] [int] NOT NULL,
	[REINFORCE_PHYSIC_DEFENCE] [int] NOT NULL,
	[REINFORCE_MAGIC_ATTACK] [int] NOT NULL,
	[REINFORCE_MAGIC_DEFENCE] [int] NOT NULL,
	[REINFORCE_MOVE_SPEED] [int] NOT NULL,
	[REINFORCE_EVADE] [int] NOT NULL,
	[REINFORCE_ACCURACY] [int] NOT NULL,
	[REINFORCE_CRITICAL_RATE] [int] NOT NULL,
	[REINFORCE_CRITICAL_DAMAGE] [int] NOT NULL,
	[MIX_STRENGTH] [int] NOT NULL,
	[MIX_INTELLIGENCE] [int] NOT NULL,
	[MIX_DEXTERITY] [int] NOT NULL,
	[MIX_WISDOM] [int] NOT NULL,
	[MIX_VITALITY] [int] NOT NULL,
	[ENCHANT_INDEX] [int] NOT NULL,
	[ENCHANT_LEVEL] [tinyint] NOT NULL,
	[TYPE] [int] NOT NULL,
	[DATE] [datetime] NOT NULL CONSTRAINT [DF_TB_ITEM_OPTION_LOG_DATE]  DEFAULT (getdate()),
	[MEMO] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TB_ITEM_OPTION_LOG] PRIMARY KEY NONCLUSTERED 
(
	[LOG_IDX] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_ITEM_SHOP_LOG]    Script Date: 07/30/2013 16:01:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ITEM_SHOP_LOG](
	[LOG_IDX] [int] IDENTITY(1,1) NOT NULL,
	[TYPE] [int] NOT NULL,
	[USER_IDX] [int] NOT NULL,
	[USER_ID] [varchar](16) NOT NULL,
	[ITEM_IDX] [int] NOT NULL,
	[ITEM_DBIDX] [int] NOT NULL,
	[SIZE] [int] NOT NULL,
	[DATE] [datetime] NOT NULL CONSTRAINT [DF_TB_ITEM_SHOP_LOG_DATE]  DEFAULT (getdate())
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_ITEM_LOG_20101111]    Script Date: 07/30/2013 16:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ITEM_LOG_20101111](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[LogType] [smallint] NOT NULL,
	[FromChrName] [varchar](16) NOT NULL,
	[FromChrIdx] [int] NOT NULL,
	[ToChrName] [varchar](16) NOT NULL,
	[ToChrIdx] [int] NOT NULL,
	[FromTotalMoney] [bigint] NOT NULL,
	[ToTotalMoney] [bigint] NOT NULL,
	[ChangeMoney] [bigint] NULL,
	[ItemIdx] [int] NULL,
	[ItemDBIdx] [int] NULL,
	[ItemDur] [int] NULL,
	[ItemFromPos] [int] NULL,
	[ItemToPos] [int] NULL,
	[RegData] [datetime] NOT NULL CONSTRAINT [DF_TB_ITEM_LOG_20101111_RegData]  DEFAULT (getdate()),
	[ChrExpPoint] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_ITEM_LOG_20101125]    Script Date: 07/30/2013 16:01:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ITEM_LOG_20101125](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[LogType] [smallint] NOT NULL,
	[FromChrName] [varchar](16) NOT NULL,
	[FromChrIdx] [int] NOT NULL,
	[ToChrName] [varchar](16) NOT NULL,
	[ToChrIdx] [int] NOT NULL,
	[FromTotalMoney] [bigint] NOT NULL,
	[ToTotalMoney] [bigint] NOT NULL,
	[ChangeMoney] [bigint] NULL,
	[ItemIdx] [int] NULL,
	[ItemDBIdx] [int] NULL,
	[ItemDur] [int] NULL,
	[ItemFromPos] [int] NULL,
	[ItemToPos] [int] NULL,
	[RegData] [datetime] NOT NULL CONSTRAINT [DF_TB_ITEM_LOG_20101112_RegData]  DEFAULT (getdate()),
	[ChrExpPoint] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[wslee]    Script Date: 07/30/2013 16:02:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wslee](
	[RowNumber] [int] IDENTITY(1,1) NOT NULL,
	[EventClass] [int] NULL,
	[TextData] [ntext] NULL,
	[NTUserName] [nvarchar](128) NULL,
	[ClientProcessID] [int] NULL,
	[ApplicationName] [nvarchar](128) NULL,
	[LoginName] [nvarchar](128) NULL,
	[SPID] [int] NULL,
	[Duration] [bigint] NULL,
	[StartTime] [datetime] NULL,
	[Reads] [bigint] NULL,
	[Writes] [bigint] NULL,
	[CPU] [int] NULL,
	[ObjectID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RowNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_JOB_LOG]    Script Date: 07/30/2013 16:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_JOB_LOG](
	[LOG_IDX] [int] IDENTITY(1,1) NOT NULL,
	[CHAR_IDX] [int] NOT NULL,
	[CLASS_IDX] [int] NOT NULL,
	[JOB_GRADE] [int] NOT NULL,
	[JOB_IDX] [int] NOT NULL,
	[DATE] [datetime] NOT NULL CONSTRAINT [DF_TB_JOB_LOG_DATE]  DEFAULT (getdate()),
	[MEMO] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TB_JOB_LOG] PRIMARY KEY NONCLUSTERED 
(
	[LOG_IDX] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[TP_COOKING_LOG]    Script Date: 07/30/2013 15:58:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 요리기본로그 프로시저
CREATE      PROCEDURE [dbo].[TP_COOKING_LOG]
	(
		@dwPlayerID	int,
		@nKind		int,
		@dwItemIdx	int,
		@dwBeforeValue	int,
		@dwDiffValue	int,
		@dwAfterValue	int
	)
AS
	Set	Nocount	On
	
	insert TB_COOKING_LOG
	(
		CHARACTER_IDX,
		KIND,
		ITEMIDX,
		BEFOREVALUE,
		DIFFVALUE,
		AFTERVALUE,
		LASTDATE
	)
	values
	(
		@dwPlayerID,
		@nKind,
		@dwItemIdx,
		@dwBeforeValue,
		@dwDiffValue,
		@dwAfterValue,
		getdate()
	)
GO
/****** Object:  StoredProcedure [dbo].[TP_COOKRECIPE_LOG]    Script Date: 07/30/2013 15:58:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 요리레시피로그 프로시저
CREATE     PROCEDURE [dbo].[TP_COOKRECIPE_LOG]
	(
		@dwPlayerID	int,
		@dwRecipeIdx	int,
		@dwSlot		int,
		@dwKind	int,
		@dwRemainTime	int
	)
AS
	Set	Nocount	On
	
	insert TB_COOKRECIPE_LOG
	(
		CHARACTER_IDX,
		RECIPE_IDX,
		SLOT,
		KIND,
		REMAINTIME,
		LASTDATE
	)
	values
	(
		@dwPlayerID,
		@dwRecipeIdx,
		@dwSlot,
		@dwKind,
		@dwRemainTime,
		getdate()
	)
GO
/****** Object:  StoredProcedure [dbo].[MP_ITEM_COUNT_SELECT]    Script Date: 07/30/2013 15:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--	Lee Ungju, (c)Eya Soft
--	10/03/09
CREATE PROCEDURE [dbo].[MP_ITEM_COUNT_SELECT]
(
	@BEGIN VARCHAR(MAX) = '100307',
	@END VARCHAR(MAX) = '100309',
	@ITEM_IDX INT = 1,
	-- log type
	--	001: player discarded an item
	--	200: player bought an item from NPC
	--	300: player sold an item to NPC
	--	301: player used an item
	--	500: players exchanged an item each other	
	@LOG_TYPE INT = 4,
	-- change database name as your environment
	@DATABASE_GROUP VARCHAR(MAX) = '[korea.test.log],[Malaysia.test.log]'
)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @YEAR INT
	DECLARE @MONTH INT
	DECLARE @DAY INT
	DECLARE @BEGIN_DATE	DATETIME
	SET @BEGIN_DATE = 0
	DECLARE @END_DATE DATETIME
	SET @END_DATE = 0

	-- begin date string is converted to date format
	BEGIN
		SET @YEAR= 2000 + CAST(SUBSTRING(@BEGIN, 1, 2)AS INT)
		SET @MONTH = CAST(SUBSTRING(@BEGIN, 3, 2)AS INT)
		SET @DAY = CAST(SUBSTRING(@BEGIN, 5, 2)AS INT)
		SET @BEGIN_DATE = DATEADD(YEAR,@YEAR - DATEPART(YEAR,0), @BEGIN_DATE)
		SET @BEGIN_DATE = DATEADD(MONTH,@MONTH - DATEPART(MONTH,0), @BEGIN_DATE)
		SET @BEGIN_DATE = DATEADD(DAY,@DAY - DATEPART(DAY,0), @BEGIN_DATE)
	END

	-- end date string is converted to date format
	BEGIN
		SET @YEAR = 2000 + CAST(SUBSTRING(@END, 1, 2)AS INT)
		SET @MONTH = CAST(SUBSTRING(@END, 3, 2)AS INT)
		SET @DAY = CAST(SUBSTRING(@END, 5, 2)AS INT)
		
		SET @END_DATE = DATEADD(YEAR,@YEAR - DATEPART(YEAR,0), @END_DATE)
		SET @END_DATE = DATEADD(MONTH,@MONTH - DATEPART(MONTH,0), @END_DATE)
		SET @END_DATE = DATEADD(DAY,@DAY - DATEPART(DAY,0), @END_DATE)
	END

	-- temporary table is create
	BEGIN
		IF EXISTS (SELECT NULL FROM SYSOBJECTS WHERE NAME = 'TB_TEMP_ITEM_LOG')
		BEGIN
			TRUNCATE TABLE #TB_TEMP_ITEM_LOG
		END
		ELSE
		BEGIN
			CREATE TABLE #TB_TEMP_ITEM_LOG (
				[DATABASE] [VARCHAR](100),
				[ITEM_IDX] [INT],
				[QUANTITY] [INT],
				[COUNT] [INT],
				[DATE] [DATETIME]
			)
			ON [PRIMARY]
			
			CREATE CLUSTERED INDEX [IX_TB_TEMP_ITEM_LOG_IDX]
			ON #TB_TEMP_ITEM_LOG([ITEM_IDX])
			ON [PRIMARY]
		END

	END

	DECLARE @NEXT_POSITION INT
	SET @NEXT_POSITION = 1

	WHILE 0 < @NEXT_POSITION
	BEGIN
		SET @NEXT_POSITION = CHARINDEX(',', @DATABASE_GROUP, 0)

		-- data base name is extracted by text
		DECLARE @DATABASE VARCHAR(MAX)
		SET @DATABASE = SUBSTRING(
			@DATABASE_GROUP,
			0,
			CASE
				WHEN 0 = @NEXT_POSITION
				THEN LEN(@DATABASE_GROUP) + 1
				ELSE @NEXT_POSITION
			END)
		SET @DATABASE_GROUP = SUBSTRING(
			@DATABASE_GROUP,
			@NEXT_POSITION + 1,
			LEN(@DATABASE_GROUP))

		DECLARE @COUNT INT
		SET @COUNT = DATEDIFF(DAY, @BEGIN_DATE, @END_DATE )
		DECLARE @DATE DATETIME
		SET @DATE = @BEGIN_DATE

		WHILE(0 <= @COUNT)
		BEGIN
			DECLARE @PARTED_DAY INT
			SET @PARTED_DAY = DATEPART(DAY, @DATE)
		
			-- table name is built
			DECLARE @TABLE VARCHAR(MAX)
			SET @TABLE =
				'TB_ITEM_LOG_' +
				DATENAME(YEAR, @DATE) +
				DATENAME(MONTH, @DATE) +
				CASE
					WHEN 10 > @PARTED_DAY
					THEN '0' + CONVERT(VARCHAR(1), @PARTED_DAY)
					ELSE CONVERT(VARCHAR(2), @PARTED_DAY)
				END

			IF EXISTS (SELECT NULL FROM SYSOBJECTS WHERE NAME = @TABLE)
			BEGIN
				DECLARE @QUERY NVARCHAR(MAX)
				SET @QUERY =
					N'INSERT #TB_TEMP_ITEM_LOG ' +
					N'([DATABASE], ITEM_IDX, QUANTITY, COUNT, DATE) ' +
					N'SELECT @PARAMETER_DATABASE, ITEMIDX, SUM(ITEMDUR), COUNT(ITEMIDX), @PARAMETER_DATE ' +
					N'FROM ' + @DATABASE + '.[DBO].' + @TABLE + ' WITH (NOLOCK) ' +
					N'WHERE LOGTYPE = @PARAMETER_LOGTYPE AND ITEMIDX = @PARAMETER_ITEMIDX ' +
					N'GROUP BY ITEMIDX'

				DECLARE @PARAMETER NVARCHAR(MAX)
				SET @PARAMETER = N'@PARAMETER_DATABASE VARCHAR(100), @PARAMETER_DATE DATETIME, @PARAMETER_LOGTYPE INT, @PARAMETER_ITEMIDX INT'

				EXEC SP_EXECUTESQL
					@QUERY,
					@PARAMETER,
					@PARAMETER_DATABASE = @DATABASE,
					@PARAMETER_LOGTYPE = @LOG_TYPE,
					@PARAMETER_DATE = @BEGIN_DATE,
					@PARAMETER_ITEMIDX = @ITEM_IDX
			END

			SET @COUNT 	= @COUNT - 1
			SET @DATE = DATEADD(DAY, 1, @DATE)
		END
	END	

	SELECT
		[DATABASE],
		ITEM_IDX,
		SUM(QUANTITY) AS QUANTITY,
		SUM(COUNT) AS COUNT
	FROM #TB_TEMP_ITEM_LOG
	GROUP BY
		ITEM_IDX,
		[DATABASE]
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[spGrantExectoAllStoredProcs]    Script Date: 07/30/2013 15:58:25 ******/
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
/****** Object:  Table [dbo].[TB_ITEM_LOG_20100307]    Script Date: 07/30/2013 16:00:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ITEM_LOG_20100307](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[LogType] [smallint] NOT NULL,
	[FromChrName] [varchar](16) NOT NULL,
	[FromChrIdx] [int] NOT NULL,
	[ToChrName] [varchar](16) NOT NULL,
	[ToChrIdx] [int] NOT NULL,
	[FromTotalMoney] [bigint] NOT NULL,
	[ToTotalMoney] [bigint] NOT NULL,
	[ChangeMoney] [bigint] NULL,
	[ItemIdx] [int] NULL,
	[ItemDBIdx] [int] NULL,
	[ItemDur] [int] NULL,
	[ItemFromPos] [int] NULL,
	[ItemToPos] [int] NULL,
	[RegDate] [datetime] NOT NULL CONSTRAINT [DF_TB_ITEM_LOG_RegDate TB_ITEM_LOG_20100307]  DEFAULT (getdate()),
	[ChrExpPoint] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_ITEM_LOG_20100309]    Script Date: 07/30/2013 16:00:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ITEM_LOG_20100309](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[LogType] [smallint] NOT NULL,
	[FromChrName] [varchar](16) NOT NULL,
	[FromChrIdx] [int] NOT NULL,
	[ToChrName] [varchar](16) NOT NULL,
	[ToChrIdx] [int] NOT NULL,
	[FromTotalMoney] [bigint] NOT NULL,
	[ToTotalMoney] [bigint] NOT NULL,
	[ChangeMoney] [bigint] NULL,
	[ItemIdx] [int] NULL,
	[ItemDBIdx] [int] NULL,
	[ItemDur] [int] NULL,
	[ItemFromPos] [int] NULL,
	[ItemToPos] [int] NULL,
	[RegDate] [datetime] NOT NULL CONSTRAINT [DF_TB_ITEM_LOG_RegDate TB_ITEM_LOG_20100309]  DEFAULT (getdate()),
	[ChrExpPoint] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[TP_ITEM_GLOBAL_LOG_SELECT]    Script Date: 07/30/2013 15:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080721 LUJ, 	아이템 로그 테이블이 부하 감소를 위해 일별로 분리되어 있다. 
		빠른 일별 검색을 위해 임시 테이블을 만들고, 결과 100개를 담는다
080812 LUJ, 	플레이어 인덱스가 TOCHRIDX에도 있으므로 함께 검색하도록 함
*/
CREATE                PROCEDURE [dbo].[TP_ITEM_GLOBAL_LOG_SELECT]
(
	@BEGIN			VARCHAR( 20 ),
	@END			VARCHAR( 20 ),
	@REQUEST_TICK		INT,
	@CHAR_IDX		INT,
	@LOG_TYPE		INT,
	@ITEM_IDX		INT,
	@ITEM_DBIDX		INT,
	@QUERY_SIZE		INT
)
AS
	SET NOCOUNT ON

	BEGIN TRANSACTION

	-- 080721 LUJ, 문자열을 날짜로 바꿀 때 사용하는 임시 변수
	DECLARE @YEAR		INT
	DECLARE @MONTH	INT
	DECLARE @DAY		INT
	DECLARE @HOUR		INT
	DECLARE @MINUTE	INT
	DECLARE @SECOND	INT
	
	DECLARE @BEGIN_DATE	DATETIME
	DECLARE @END_DATE	DATETIME
	SET @BEGIN_DATE 	= 0
	SET @END_DATE 		= 0

	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--		예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--		사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--		( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--		이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN, 1, 2 )	AS INT )
		SET @MONTH	=	CAST( SUBSTRING( @BEGIN, 3, 2 )	AS INT )
		SET @DAY	= 	CAST( SUBSTRING( @BEGIN, 5, 2 )	AS INT )
		SET @HOUR	=	CAST( SUBSTRING( @BEGIN, 8, 2 )	AS INT )
		SET @MINUTE	= 	CAST( SUBSTRING( @BEGIN, 11, 2 )	AS INT )
		SET @SECOND	= 	CAST( SUBSTRING( @BEGIN, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN_DATE = DATEADD( YEAR,	@YEAR		- DATEPART( YEAR,	0 ), @BEGIN_DATE )
		SET @BEGIN_DATE = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN_DATE )
		SET @BEGIN_DATE = DATEADD( DAY,	@DAY		- DATEPART( DAY,	0 ), @BEGIN_DATE )
		SET @BEGIN_DATE = DATEADD( HOUR,	@HOUR		- DATEPART( HOUR,	0 ), @BEGIN_DATE )
		SET @BEGIN_DATE = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN_DATE )
		SET @BEGIN_DATE = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN_DATE )
	END
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END, 1, 2 )	AS INT )
		SET @MONTH	=	CAST( SUBSTRING( @END, 3, 2 )	AS INT )
		SET @DAY	= 	CAST( SUBSTRING( @END, 5, 2 )	AS INT )
		SET @HOUR	=	CAST( SUBSTRING( @END, 8, 2 )	AS INT )
		SET @MINUTE	= 	CAST( SUBSTRING( @END, 11, 2 ) 	AS INT )
		SET @SECOND	= 	CAST( SUBSTRING( @END, 14, 2 ) 	AS INT )
	
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END_DATE = DATEADD( YEAR,	@YEAR		- DATEPART( YEAR,	0 ), @END_DATE )
		SET @END_DATE = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END_DATE )
		SET @END_DATE = DATEADD( DAY,		@DAY		- DATEPART( DAY,	0 ), @END_DATE )
		SET @END_DATE = DATEADD( HOUR,	@HOUR		- DATEPART( HOUR,	0 ), @END_DATE )
		SET @END_DATE = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END_DATE )
		SET @END_DATE = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END_DATE )
	END

	-- 080721 LUJ, 해당 월의 일자 수를 알아낸다
	DECLARE @COUNT INT
	SET @COUNT = DATEDIFF( DAY, @BEGIN_DATE, @END_DATE  )
	
	-- 080721 LUJ, 한달을 넘을 수 없음
	IF 30 < @COUNT
	BEGIN
		SET @COUNT = 30
	END
	
	-- 080721 LUJ, 쿼리가 임시로 담길 테이블을 생성한다
	BEGIN
		-- 080721 LUJ, 테이블이 이미 있는 경우 삭제한다
		IF EXISTS ( SELECT NULL FROM SYSOBJECTS WHERE NAME = 'TB_TEMP_ITEM_LOG' )
		BEGIN
			TRUNCATE TABLE #TB_TEMP_ITEM_LOG
		END
		ELSE
		BEGIN
			CREATE TABLE #TB_TEMP_ITEM_LOG (
				[COUNT] [int] NULL,
				[LOGIDX] [int] NULL ,
				[LogType] [smallint] NULL ,
				[FromChrName] [varchar] (16) NULL ,
				[FromChrIdx] [int] NULL ,
				[ToChrName] [varchar] (16) NULL ,
				[ToChrIdx] [int] NULL ,
				[FromTotalMoney] [bigint] NULL ,
				[ToTotalMoney] [bigint] NULL ,
				[ChangeMoney] [bigint] NULL ,
				[ItemIdx] [int] NULL ,
				[ItemDBIdx] [int] NULL ,
				[ItemDur] [int] NULL ,
				[ItemFromPos] [int] NULL ,
				[ItemToPos] [int] NULL ,
				[RegDate] [datetime] NULL ,
			) ON [PRIMARY]
			
			CREATE  CLUSTERED  INDEX [IX_TB_TEMP_ITEM_LOG_IDX] ON #TB_TEMP_ITEM_LOG([REGDATE]) ON [PRIMARY]
		END

	END

	-- 080721 LUJ, 0이 아닌 값을 써서 조건문을 구성한다.
	DECLARE @CONDITION VARCHAR( 1000 )
	BEGIN
		SET @CONDITION = ''
	
		IF 0 <> @CHAR_IDX
		BEGIN
			-- 080812 LUJ, 플레이어 인덱스가 TOCHRIDX에도 있으므로 함께 검색하도록 함
			SET @CONDITION = @CONDITION + ' (FROMCHRIDX = ' + CONVERT( VARCHAR( 20 ), @CHAR_IDX ) + ' OR TOCHRIDX = ' + CONVERT( VARCHAR( 20 ), @CHAR_IDX ) + ')AND'
		END
		
		IF 0 <> @LOG_TYPE
		BEGIN
			SET @CONDITION = @CONDITION + ' LOGTYPE = ' + CONVERT( VARCHAR( 20 ), @LOG_TYPE ) + ' AND'
		END
		
		IF 0 <> @ITEM_IDX
		BEGIN
			SET @CONDITION = @CONDITION + ' ITEMIDX = ' + CONVERT( VARCHAR( 20 ), @ITEM_IDX ) + ' AND'
		END

		IF 0 <> @ITEM_DBIDX
		BEGIN
			SET @CONDITION = @CONDITION + ' ITEMDBIDX = ' + CONVERT( VARCHAR( 20 ), @ITEM_DBIDX ) + ' AND'
		END
	END
	
	DECLARE @DATE	DATETIME
	SET @DATE = @BEGIN_DATE

	-- 080721 LUJ,	DO~WHILE문처럼 실행시키고자 무한 루프 사용.
	--		루프 하단의 @COUNT를 체크하여 루프를 빠져나가도록 함
	WHILE( 0 <= @COUNT )
	BEGIN
		DECLARE @PARTED_DAY INT
		SET @PARTED_DAY = DATEPART( DAY, @DATE )
	
		-- 080721 LUJ, 테이블 명 조립
		DECLARE @TABLE VARCHAR( 30 )
		SET @TABLE = 	'TB_ITEM_LOG_' +
				DATENAME( YEAR, @DATE ) +
				DATENAME( MONTH, @DATE ) +
				CASE
					WHEN 10 > @PARTED_DAY	THEN 	'0' + CONVERT( VARCHAR( 1 ), @PARTED_DAY )
					ELSE	CONVERT( VARCHAR( 2 ), @PARTED_DAY )
				END
	
		-- 080721 LUJ, 테이블이 없으면 처리하지 않는다
		IF EXISTS ( SELECT NULL FROM SYSOBJECTS WHERE NAME = @TABLE )
		BEGIN
			DECLARE @QUERY NVARCHAR( 2000 )
			SET @QUERY = 	N' INSERT #TB_TEMP_ITEM_LOG ' +
					N' ( COUNT, LOGIDX, LOGTYPE, FROMCHRNAME, FROMCHRIDX, TOCHRNAME, TOCHRIDX, FROMTOTALMONEY, TOTOTALMONEY,' +
					N' CHANGEMONEY, ITEMIDX, ITEMDBIDX, ITEMDUR, ITEMFROMPOS, ITEMTOPOS, REGDATE )' +
					N' SELECT TOP 100 ' + CONVERT( VARCHAR( 30 ), @COUNT ) + ',  LOGIDX, LOGTYPE, FROMCHRNAME, FROMCHRIDX, TOCHRNAME, TOCHRIDX, FROMTOTALMONEY, TOTOTALMONEY,' +
					N' CHANGEMONEY, ITEMIDX, ITEMDBIDX, ITEMDUR, ITEMFROMPOS, ITEMTOPOS, REGDATE' +
					N' FROM ' + @TABLE + ' WITH (NOLOCK)' +
					N' WHERE ' + @CONDITION + 
					N' REGDATE > @BEGIN_DATE_IN'  +
					N' ORDER BY REGDATE'

			DECLARE @PARAMETER NVARCHAR( 1000 )
			SET @PARAMETER = N'@BEGIN_DATE_IN DATETIME'

			EXEC SP_EXECUTESQL
				@QUERY,
				@PARAMETER,
				@BEGIN_DATE_IN = @BEGIN_DATE
		END

		DECLARE @RECORD_SIZE	INT
		SELECT @RECORD_SIZE = COUNT( 1 )
		FROM	#TB_TEMP_ITEM_LOG

		IF 100 < @RECORD_SIZE
		BEGIN
			BREAK
		END

		SET @COUNT 	= @COUNT - 1
		SET @DATE	= DATEADD( DAY, 1, @DATE )
	END

	SELECT TOP 100
		LOGIDX,
		LOGTYPE,
		FROMCHRIDX,
		FROMCHRNAME,
		FROMTOTALMONEY,
		TOCHRIDX,
		TOCHRNAME,
		TOTOTALMONEY,
		CHANGEMONEY,
		ITEMIDX,
		ITEMDBIDX,
		ITEMDUR,
		ITEMFROMPOS,
		ITEMTOPOS,
		CONVERT( VARCHAR( 6 ), REGDATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), REGDATE, 8 ),
		@END,
		@ITEM_IDX,
		@ITEM_DBIDX,
		@CHAR_IDX,
		@LOG_TYPE,
		@QUERY_SIZE,
		@REQUEST_TICK,
		[COUNT]
	FROM 	#TB_TEMP_ITEM_LOG
	ORDER BY REGDATE
	
	-- 080721 LUJ, 반드시 맨 나중에 실행되어야 한다
	--DROP TABLE #TB_TEMP_ITEM_LOG

	ROLLBACK

	RETURN
GO
/****** Object:  Table [dbo].[TB_ITEM_LOG_20100308]    Script Date: 07/30/2013 16:00:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ITEM_LOG_20100308](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[LogType] [smallint] NOT NULL,
	[FromChrName] [varchar](16) NOT NULL,
	[FromChrIdx] [int] NOT NULL,
	[ToChrName] [varchar](16) NOT NULL,
	[ToChrIdx] [int] NOT NULL,
	[FromTotalMoney] [bigint] NOT NULL,
	[ToTotalMoney] [bigint] NOT NULL,
	[ChangeMoney] [bigint] NULL,
	[ItemIdx] [int] NULL,
	[ItemDBIdx] [int] NULL,
	[ItemDur] [int] NULL,
	[ItemFromPos] [int] NULL,
	[ItemToPos] [int] NULL,
	[RegDate] [datetime] NOT NULL CONSTRAINT [DF_TB_ITEM_LOG_RegDate TB_ITEM_LOG_20100308]  DEFAULT (getdate()),
	[ChrExpPoint] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[TP_ITEM_LOG_SELECT]    Script Date: 07/30/2013 15:58:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주, 쿼리에 필요한 키를 줄임
071206 웅주, 테이블의 인덱스에 맞게 쿼리함
080114 웅주, 동적 SQL을 조립하여 쿼리하도록 함
080327 LUJ, 언어에 따라 다른 날짜 표시 형식에 무관하게 쿼리할 날짜를 생성할 수 있도록 함
080404 LUJ, 속도 개선을 동적 SQL 사용에 SP_EXECUTESQL 사용
			최대 쿼리 개수를 전송함	
*/
CREATE  PROCEDURE [dbo].[TP_ITEM_LOG_SELECT]
(
	@CHAR_IDX		INT,
	@ITEM_DBIDX		INT,
	@ITEM_IDX		INT,
	@BEGIN_DATE		VARCHAR( 20 ),
	@END_DATE		VARCHAR( 20 ),
	@REQUEST_TICK	INT,
	@QUERY_SIZE		INT	
)
AS
	--검색 키가 최소화되고 줄어들고 정렬을 하지 않아 보다 빠르나,
	--중복되는 결과가 나올 수 있다. 이는 클라이언트 측에서 
	--유니크한 로그인덱스를 구분하도록 하여 해결할 수 있다	
	
	SET NOCOUNT ON
	
	DECLARE @YEAR	INT
	DECLARE @MONTH	INT
	DECLARE @DAY	INT
	DECLARE @HOUR	INT
	DECLARE @MINUTE	INT
	DECLARE @SECOND INT
	
	DECLARE @BEGIN DATETIME
	SET @BEGIN = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--				예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--				사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--				( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--				이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,		@YEAR	- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,		@DAY	- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,		@HOUR	- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR	- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY	- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR	- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END

	-- 테이블 명 조립
	DECLARE @TABLE VARCHAR( 30 )
	SET @TABLE = 'TB_ITEM_LOG_20' + SUBSTRING( @BEGIN_DATE, 1, 2 ) + SUBSTRING( @BEGIN_DATE, 3, 2 ) + SUBSTRING( @BEGIN_DATE, 5, 2 )

	--DECLARE @INDEX	VARCHAR( 20 )
	DECLARE @SQL		NVARCHAR( 1000 )
	DECLARE @PARAMETER	NVARCHAR( 1000 )
	
	IF 0 < @CHAR_IDX
	-- 080404 LUJ, 쿼리 속도 개선을 위해 SP_EXECUTESQL 사용
	BEGIN		
		SET @SQL		=	N'SELECT TOP 100 LOGIDX, LOGTYPE, FROMCHRIDX, FROMCHRNAME, FROMTOTALMONEY, TOCHRIDX, TOCHRNAME, ' +
							N'TOTOTALMONEY, CHANGEMONEY, ITEMIDX, ITEMDBIDX, ITEMDUR, ITEMFROMPOS, ITEMTOPOS, ' +
							N'CONVERT( VARCHAR( 6 ), REGDATE, 12 ) + '' '' + CONVERT( VARCHAR( 8 ), REGDATE, 8 ), ' +
							N'@END_DATE_IN, @CHAR_IDX_IN, 0, 0, @REQUEST_TICK_IN, @QUERY_SIZE_IN FROM ' + @TABLE + N' ' +
							N'WHERE ( TOCHRIDX = @CHAR_IDX_IN OR FROMCHRIDX = @CHAR_IDX_IN ) AND ' +
							N'(REGDATE BETWEEN @BEGIN_IN AND @END_IN) ORDER BY REGDATE'
		SET @PARAMETER	=	N'@CHAR_IDX_IN INT, @END_DATE_IN VARCHAR( 20 ), @REQUEST_TICK_IN INT, @BEGIN_IN DATETIME, @END_IN DATETIME, @QUERY_SIZE_IN INT'
		
		EXECUTE
			SP_EXECUTESQL
			@SQL,
			@PARAMETER,
			@CHAR_IDX_IN		= @CHAR_IDX,
			@END_DATE_IN		= @END_DATE,
			@REQUEST_TICK_IN	= @REQUEST_TICK,
			@BEGIN_IN			= @BEGIN,
			@END_IN				= @END,
			@QUERY_SIZE_IN		= @QUERY_SIZE
	END
	ELSE IF 0 < @ITEM_DBIDX
	-- 080404 LUJ, 쿼리 속도 개선을 위해 SP_EXECUTESQL 사용
	BEGIN
		SET @SQL		=	N'SELECT TOP 100 LOGIDX, LOGTYPE, FROMCHRIDX, FROMCHRNAME, FROMTOTALMONEY, TOCHRIDX, TOCHRNAME, ' +
							N'TOTOTALMONEY, CHANGEMONEY, ITEMIDX, ITEMDBIDX, ITEMDUR, ITEMFROMPOS, ITEMTOPOS, ' +
							N'CONVERT( VARCHAR( 6 ), REGDATE, 12 ) + '' '' + CONVERT( VARCHAR( 8 ), REGDATE, 8 ), ' +
							N'@END_DATE_IN, 0, @ITEM_DBIDX_IN, 0, @REQUEST_TICK_IN, @QUERY_SIZE_IN FROM ' + @TABLE + N' ' +
							N'WHERE ( ITEMDBIDX = @ITEM_DBIDX_IN ) AND ' +
							N'(REGDATE BETWEEN @BEGIN_IN AND @END_IN) ORDER BY REGDATE'
		SET @PARAMETER	=	N'@ITEM_DBIDX_IN INT, @END_DATE_IN VARCHAR( 20 ), @REQUEST_TICK_IN INT, @BEGIN_IN DATETIME, @END_IN DATETIME, @QUERY_SIZE_IN INT'
		
		EXECUTE
			SP_EXECUTESQL
			@SQL,
			@PARAMETER,
			@ITEM_DBIDX_IN		= @ITEM_DBIDX,
			@END_DATE_IN		= @END_DATE,
			@REQUEST_TICK_IN	= @REQUEST_TICK,
			@BEGIN_IN			= @BEGIN,
			@END_IN				= @END,
			@QUERY_SIZE_IN		= @QUERY_SIZE
	END
	ELSE IF 0 < @ITEM_IDX
	-- 080404 LUJ, 쿼리 속도 개선을 위해 SP_EXECUTESQL 사용
	BEGIN
		SET @SQL		=	N'SELECT TOP 100 LOGIDX, LOGTYPE, FROMCHRIDX, FROMCHRNAME, FROMTOTALMONEY, TOCHRIDX, TOCHRNAME, ' +
							N'TOTOTALMONEY, CHANGEMONEY, ITEMIDX, ITEMDBIDX, ITEMDUR, ITEMFROMPOS, ITEMTOPOS, ' +
							N'CONVERT( VARCHAR( 6 ), REGDATE, 12 ) + '' '' + CONVERT( VARCHAR( 8 ), REGDATE, 8 ), ' +
							N'@END_DATE_IN, 0, 0, @ITEM_IDX_IN, @REQUEST_TICK_IN, @QUERY_SIZE_IN FROM ' + @TABLE + N' ' +
							N'WHERE ( ITEMIDX = @ITEM_IDX_IN ) AND ' +
							N'(REGDATE BETWEEN @BEGIN_IN AND @END_IN) ORDER BY REGDATE'
		SET @PARAMETER	=	N'@ITEM_IDX_IN INT, @END_DATE_IN VARCHAR( 20 ), @REQUEST_TICK_IN INT, @BEGIN_IN DATETIME, @END_IN DATETIME, @QUERY_SIZE_IN INT'
		
		EXECUTE
			SP_EXECUTESQL
			@SQL,
			@PARAMETER,
			@ITEM_IDX_IN = @ITEM_IDX,
			@END_DATE_IN = @END_DATE,
			@REQUEST_TICK_IN = @REQUEST_TICK,
			@BEGIN_IN = @BEGIN,
			@END_IN				= @END,
			@QUERY_SIZE_IN		= @QUERY_SIZE	
	END
	ELSE
	-- 080404 LUJ, 쿼리 속도 개선을 위해 SP_EXECUTESQL 사용
	BEGIN
		SET @SQL		=	N'SELECT TOP 100 LOGIDX, LOGTYPE, FROMCHRIDX, FROMCHRNAME, FROMTOTALMONEY, TOCHRIDX, TOCHRNAME, ' +
							N'TOTOTALMONEY, CHANGEMONEY, ITEMIDX, ITEMDBIDX, ITEMDUR, ITEMFROMPOS, ITEMTOPOS, ' +
							N'CONVERT( VARCHAR( 6 ), REGDATE, 12 ) + '' '' + CONVERT( VARCHAR( 8 ), REGDATE, 8 ), ' +
							N'@END_DATE_IN, 0, 0, @ITEM_IDX_IN, @REQUEST_TICK_IN, @QUERY_SIZE_IN FROM ' + @TABLE + N' ' +
							N'WHERE (REGDATE BETWEEN @BEGIN_IN AND @END_IN) ORDER BY REGDATE'
		SET @PARAMETER	=	N'@ITEM_IDX_IN INT, @END_DATE_IN VARCHAR( 20 ), @REQUEST_TICK_IN INT, @BEGIN_IN DATETIME, @END_IN DATETIME, @QUERY_SIZE_IN INT'
		
		EXECUTE
			SP_EXECUTESQL
			@SQL,
			@PARAMETER,
			@ITEM_IDX_IN = @ITEM_IDX,
			@END_DATE_IN = @END_DATE,
			@REQUEST_TICK_IN = @REQUEST_TICK,
			@BEGIN_IN = @BEGIN,
			@END_IN				= @END,
			@QUERY_SIZE_IN		= @QUERY_SIZE	
	END
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_ITEM_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주, 날짜를 비교하지 않고 쿼리할 수 있도록 로그 인덱스 범위를 알아냄
071210 웅주, 클러스터 인덱스인 날짜를 이용해 시간 단위까지 검색하도록 함
080115 웅주, 동적 SQL을 조립하여 쿼리하도록 함
080327 LUJ, 언어에 따라 다른 날짜 표시 형식에 무관하게 쿼리할 날짜를 생성할 수 있도록 함
080404 LUJ, 속도 개선을 동적 SQL 사용에 SP_EXECUTESQL 사용
*/
CREATE  PROCEDURE [dbo].[TP_ITEM_LOG_SIZE_SELECT]
(
	@CHAR_IDX		INT,
	@ITEM_DBIDX		INT,
	@ITEM_IDX		INT,
	@BEGIN_DATE		VARCHAR( 20 ),
	@END_DATE		VARCHAR( 20 ),
	@REQUEST_TICK	INT
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
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--				예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--				사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--				( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--				이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,		@YEAR	- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,		@DAY	- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,		@HOUR	- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR	- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY	- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR	- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END
		
	-- 테이블 명 조립
	DECLARE @TABLE VARCHAR( 30 )
	SET @TABLE = N'TB_ITEM_LOG_20' + SUBSTRING( @BEGIN_DATE, 1, 2 ) + SUBSTRING( @BEGIN_DATE, 3, 2 ) + SUBSTRING( @BEGIN_DATE, 5, 2 )
	
	DECLARE @SQL		NVARCHAR( 1000 )
	DECLARE @PARAMETER	NVARCHAR( 1000 )
	--DECLARE @INDEX	VARCHAR( 20 )
	
	IF @CHAR_IDX > 0
	BEGIN
		SET @SQL		= N'SELECT COUNT( * ), @CHAR_IDX_IN, 0, 0, @BEGIN_DATE_IN, @END_DATE_IN, @REQUEST_TICK_IN FROM ' + @TABLE + N' WHERE (REGDATE BETWEEN @BEGIN_IN AND @END_IN) AND (TOCHRIDX = @CHAR_IDX_IN OR FROMCHRIDX = @CHAR_IDX_IN)'
		SET @PARAMETER	= N'@CHAR_IDX_IN INT, @BEGIN_DATE_IN VARCHAR( 20 ), @END_DATE_IN VARCHAR( 20 ), @REQUEST_TICK_IN INT, @BEGIN_IN DATETIME, @END_IN DATETIME'
		
		-- 080404 LUJ,	레코드 개수를 동적 SQL로 가져온다. EXEC()는 인자를 받아오지 못하지만 SP_EXECUTESQL은 받아올 수도 있다.
		--				참조: http://support.microsoft.com/kb/262499		
		EXECUTE
			SP_EXECUTESQL
			@SQL,
			@PARAMETER,
			@CHAR_IDX_IN = @CHAR_IDX,
			@BEGIN_DATE_IN = @BEGIN_DATE,
			@END_DATE_IN = @END_DATE,
			@REQUEST_TICK_IN = @REQUEST_TICK,
			@BEGIN_IN = @BEGIN,
			@END_IN = @END
	END
	ELSE IF @ITEM_IDX > 0
	BEGIN
		SET @SQL		= N'SELECT COUNT( * ), 0, 0, @ITEM_IDX_IN, @BEGIN_DATE_IN, @END_DATE_IN, @REQUEST_TICK_IN FROM ' + @TABLE + N' WHERE (REGDATE BETWEEN @BEGIN_IN AND @END_IN) AND (ITEMIDX = @ITEM_IDX_IN)'
		SET @PARAMETER	= N'@ITEM_IDX_IN INT, @BEGIN_DATE_IN VARCHAR( 20 ), @END_DATE_IN VARCHAR( 20 ), @REQUEST_TICK_IN INT, @BEGIN_IN DATETIME, @END_IN DATETIME'
		
		-- 080404 LUJ,	레코드 개수를 동적 SQL로 가져온다. EXEC()는 인자를 받아오지 못하지만 SP_EXECUTESQL은 받아올 수도 있다.
		--				참조: http://support.microsoft.com/kb/262499		
		EXECUTE
			SP_EXECUTESQL
			@SQL,
			@PARAMETER,
			@ITEM_IDX_IN = @ITEM_IDX,
			@BEGIN_DATE_IN = @BEGIN_DATE,
			@END_DATE_IN = @END_DATE,
			@REQUEST_TICK_IN = @REQUEST_TICK,
			@BEGIN_IN = @BEGIN,
			@END_IN = @END
	END
	ELSE IF @ITEM_DBIDX > 0
	BEGIN
		SET @SQL		= N'SELECT COUNT( * ), 0, @ITEM_DBIDX_IN, 0, @BEGIN_DATE_IN, @END_DATE_IN, @REQUEST_TICK_IN FROM ' + @TABLE + N' WHERE (REGDATE BETWEEN @BEGIN_IN AND @END_IN) AND (ITEMDBIDX = @ITEM_DBIDX_IN)'
		SET @PARAMETER	= N'@ITEM_DBIDX_IN INT, @BEGIN_DATE_IN VARCHAR( 20 ), @END_DATE_IN VARCHAR( 20 ), @REQUEST_TICK_IN INT, @BEGIN_IN DATETIME, @END_IN DATETIME'
		
		-- 080404 LUJ,	레코드 개수를 동적 SQL로 가져온다. EXEC()는 인자를 받아오지 못하지만 SP_EXECUTESQL은 받아올 수도 있다.
		--				참조: http://support.microsoft.com/kb/262499		
		EXECUTE
			SP_EXECUTESQL
			@SQL,
			@PARAMETER,
			@ITEM_DBIDX_IN = @ITEM_DBIDX,
			@BEGIN_DATE_IN = @BEGIN_DATE,
			@END_DATE_IN = @END_DATE,
			@REQUEST_TICK_IN = @REQUEST_TICK,
			@BEGIN_IN = @BEGIN,
			@END_IN = @END
	END
	ELSE
	BEGIN
		SET @SQL		= N'SELECT COUNT( * ), 0, @ITEM_DBIDX_IN, 0, @BEGIN_DATE_IN, @END_DATE_IN, @REQUEST_TICK_IN FROM ' + @TABLE + N' WHERE (REGDATE BETWEEN @BEGIN_IN AND @END_IN)'
		SET @PARAMETER	= N'@ITEM_DBIDX_IN INT, @BEGIN_DATE_IN VARCHAR( 20 ), @END_DATE_IN VARCHAR( 20 ), @REQUEST_TICK_IN INT, @BEGIN_IN DATETIME, @END_IN DATETIME'
		
		-- 080404 LUJ,	레코드 개수를 동적 SQL로 가져온다. EXEC()는 인자를 받아오지 못하지만 SP_EXECUTESQL은 받아올 수도 있다.
		--				참조: http://support.microsoft.com/kb/262499		
		EXECUTE
			SP_EXECUTESQL
			@SQL,
			@PARAMETER,
			@ITEM_DBIDX_IN = @ITEM_DBIDX,
			@BEGIN_DATE_IN = @BEGIN_DATE,
			@END_DATE_IN = @END_DATE,
			@REQUEST_TICK_IN = @REQUEST_TICK,
			@BEGIN_IN = @BEGIN,
			@END_IN = @END
	END	
	RETURN
GO
/****** Object:  Table [dbo].[TB_AUTONOTE_LOG]    Script Date: 07/30/2013 15:59:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_AUTONOTE_LOG](
	[LOGIDX] [int] IDENTITY(1,1) NOT NULL,
	[LOGTYPE] [smallint] NOT NULL,
	[FROMCHRIDX] [int] NOT NULL,
	[FROMCHRNAME] [varchar](16) NOT NULL,
	[TOCHRIDX] [int] NOT NULL,
	[TOCHRNAME] [varchar](16) NOT NULL,
	[REGDATE] [datetime] NOT NULL CONSTRAINT [DF_TB_AUTONOTE_LOG_RegDate]  DEFAULT (getdate())
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_HOUSING_LOG]    Script Date: 07/30/2013 16:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_HOUSING_LOG](
	[LOG_IDX] [int] IDENTITY(1,1) NOT NULL,
	[OWNER_INDEX] [int] NOT NULL,
	[CHARNAME] [varchar](16) NOT NULL,
	[LOGTYPE] [smallint] NOT NULL,
	[ITEMDB_INDEX] [int] NOT NULL,
	[ITEM_INDEX] [int] NOT NULL,
	[ITEM_VALUE] [int] NOT NULL,
	[FURNITURE_INDEX] [int] NOT NULL,
	[CATEGORY] [int] NOT NULL,
	[SLOT] [int] NOT NULL,
	[HOUSENAME] [varchar](32) NOT NULL,
	[DECO_POINT] [int] NOT NULL,
	[HOUSE_POINT] [int] NOT NULL,
	[UPDATETIME] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_COOKING_LOG]    Script Date: 07/30/2013 15:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_COOKING_LOG](
	[LOG_IDX] [int] IDENTITY(1,1) NOT NULL,
	[CHARACTER_IDX] [int] NOT NULL,
	[KIND] [int] NOT NULL,
	[ITEMIDX] [int] NOT NULL,
	[BEFOREVALUE] [int] NOT NULL,
	[DIFFVALUE] [int] NOT NULL,
	[AFTERVALUE] [int] NOT NULL,
	[LASTDATE] [datetime] NOT NULL CONSTRAINT [DF_TB_COOKING_LOG_LASTDATE]  DEFAULT (getdate())
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_COOKRECIPE_LOG]    Script Date: 07/30/2013 15:59:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_COOKRECIPE_LOG](
	[LOG_IDX] [int] IDENTITY(1,1) NOT NULL,
	[CHARACTER_IDX] [int] NOT NULL,
	[RECIPE_IDX] [int] NOT NULL,
	[SLOT] [int] NOT NULL,
	[KIND] [int] NOT NULL,
	[REMAINTIME] [int] NOT NULL,
	[LASTDATE] [datetime] NOT NULL CONSTRAINT [DF_TB_COOKRECIPE_LOG_LASTDATE]  DEFAULT (getdate())
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[TP_QUEST_ITEM_DELETE]    Script Date: 07/30/2013 15:58:55 ******/
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
/****** Object:  StoredProcedure [dbo].[TP_QUEST_ITEM_UPDATE]    Script Date: 07/30/2013 15:58:55 ******/
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
/****** Object:  Table [dbo].[TB_ITEM_LOG_20100609]    Script Date: 07/30/2013 16:00:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ITEM_LOG_20100609](
	[LogIdx] [int] IDENTITY(1,1) NOT NULL,
	[LogType] [smallint] NOT NULL,
	[FromChrName] [varchar](16) NOT NULL,
	[FromChrIdx] [int] NOT NULL,
	[ToChrName] [varchar](16) NOT NULL,
	[ToChrIdx] [int] NOT NULL,
	[FromTotalMoney] [bigint] NOT NULL,
	[ToTotalMoney] [bigint] NOT NULL,
	[ChangeMoney] [bigint] NULL,
	[ItemIdx] [int] NULL,
	[ItemDBIdx] [int] NULL,
	[ItemDur] [int] NULL,
	[ItemFromPos] [int] NULL,
	[ItemToPos] [int] NULL,
	[RegDate] [datetime] NOT NULL CONSTRAINT [DF_TB_ITEM_LOG_RegDate TB_ITEM_LOG_20100609]  DEFAULT (getdate()),
	[ChrExpPoint] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[TP_SCRIPT_HACK_LOG_INSERT]    Script Date: 07/30/2013 15:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
090109 LUJ, 스크립트 체크 로그를 작성한다
*/
CREATE PROCEDURE [dbo].[TP_SCRIPT_HACK_LOG_INSERT]
(
	@USER_IDX	INT,
	@CHAR_IDX	INT,
	@SCRIPT		VARCHAR( 16 ) = '',
	@MEMO		VARCHAR( 16 ) = ''
)
AS
	SET NOCOUNT ON
	RETURN
	--INSERT	INTO	TB_SCRIPT_HACK_LOG
	--				( USER_IDX, CHAR_IDX, SCRIPT, MEMO )
	--VALUES			( @USER_IDX, @CHAR_IDX, @SCRIPT, @MEMO )
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_SCRIPT_HACK_LOG_SELECT]    Script Date: 07/30/2013 15:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
090122 LUJ, 스크립트 변조 로그를 쿼리한다
*/
CREATE     PROCEDURE [dbo].[TP_SCRIPT_HACK_LOG_SELECT]
(
	@BEGIN_DATE		VARCHAR( 20 ),
	@END_DATE		VARCHAR( 20 ),
	@REQUEST_TICK	INT,
	@QUERY_SIZE		INT
)
AS
	SET NOCOUNT ON
	
	DECLARE @YEAR	INT
	DECLARE @MONTH	INT
	DECLARE @DAY	INT
	DECLARE @HOUR	INT
	DECLARE @MINUTE	INT
	DECLARE @SECOND	INT
	
	DECLARE @BEGIN SMALLDATETIME
	SET @BEGIN = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--		예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--		사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--		( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--		이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=	CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 	CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=	CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 	CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 	CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,	@YEAR		- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,		@DAY		- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,	@HOUR		- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END SMALLDATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--		사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=	CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 	CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=	CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 	CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND	= 	CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,		@YEAR		- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,		@DAY		- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,		@HOUR		- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END

	SELECT	TOP 100
			@REQUEST_TICK,			
			LOG_IDX,
			USER_IDX,
			CHAR_IDX,
			SCRIPT,
			MEMO,
			CONVERT( VARCHAR( 6 ), [DATE], 12 ) + ' ' + CONVERT( VARCHAR( 8 ), [DATE], 8 ),
			@END_DATE,
			@QUERY_SIZE
	FROM		TB_SCRIPT_HACK_LOG WITH (NOLOCK)
	WHERE  	 ([DATE] BETWEEN @BEGIN AND @END)
	ORDER BY 	[DATE]

	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_SCRIPT_HACK_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
090122 LUJ, 스크립트 변조 로그 개수 검색
*/
CREATE   PROCEDURE [dbo].[TP_SCRIPT_HACK_LOG_SIZE_SELECT]
(
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 ),
	@REQUEST_TICK	INT
)
AS
	SET NOCOUNT ON
	
	DECLARE @YEAR		INT
	DECLARE @MONTH	INT
	DECLARE @DAY		INT
	DECLARE @HOUR		INT
	DECLARE @MINUTE	INT
	DECLARE @SECOND	 INT
	
	DECLARE @BEGIN SMALLDATETIME
	SET @BEGIN = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--				예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--				사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--				( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--				이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,		@YEAR	- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,		@DAY	- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,		@HOUR	- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END SMALLDATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=	CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 	CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=	CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 	CAST( SUBSTRING( @END_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 	CAST( SUBSTRING( @END_DATE, 14, 2 ) 	AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR		- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY		- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR		- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END
	
	SELECT  COUNT( * ),
		@REQUEST_TICK,
		@BEGIN_DATE,
		@END_DATE
	FROM	TB_SCRIPT_HACK_LOG WITH (NOLOCK)
	WHERE	([DATE] BETWEEN @BEGIN AND @END)
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_SKILL_LOG_INSERT]    Script Date: 07/30/2013 15:59:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_SKILL_LOG_INSERT]
(
	@CHAR_IDX		INT,
	@SKILL_POINT	INT,
	@SKILL_DBIDX	INT,
	@SKILL_LEVEL	SMALLINT,
	@SKILL_IDX		INT,
	@TYPE			INT,
	@MEMO			VARCHAR( 20 )
)
AS
	SET NOCOUNT ON
	
	INSERT INTO TB_SKILL_LOG (
				CHAR_IDX,
				SKILL_DBIDX,
				SKILL_IDX,
				[LEVEL],
				POINT,
				TYPE,
				MEMO )
	VALUES		( @CHAR_IDX,
				@SKILL_DBIDX,
				@SKILL_IDX,
				@SKILL_LEVEL,
				@SKILL_POINT,
				@TYPE,
				@MEMO )
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_SKILL_LOG_SELECT]    Script Date: 07/30/2013 15:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주, 쿼리에 필요한 키를 줄임
071211 웅주, 클러스터 키를 DATE로 바꾸고 이에 맞게 쿼리
080327 LUJ, 언어에 따라 다른 날짜 표시 형식에 무관하게 쿼리할 날짜를 생성할 수 있도록 함
080404 LUJ, 최대 쿼리 개수를 전송함	
*/
CREATE  PROCEDURE [dbo].[TP_SKILL_LOG_SELECT]
(
	@CHAR_IDX	INT,
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 ),
	@QUERY_SIZE	INT
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
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--				예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--				사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--				( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--				이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,		@YEAR	- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,		@DAY	- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,		@HOUR	- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR	- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY	- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR	- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END
	
	SELECT	TOP 100
			LOG_IDX,
			TYPE,
			SKILL_DBIDX,
			SKILL_IDX,
			[LEVEL],
			POINT,
			CONVERT( VARCHAR( 6 ), DATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), DATE, 8 ),
			MEMO,
			@CHAR_IDX,
			@END_DATE,
			@QUERY_SIZE
	FROM    TB_SKILL_LOG WITH (NOLOCK)
	WHERE   (DATE BETWEEN @BEGIN AND @END) AND
			(CHAR_IDX = @CHAR_IDX)
	ORDER BY DATE
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_SKILL_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주, 날짜를 비교하지 않고 쿼리할 수 있도록 로그 인덱스 범위를 알아냄
071211 웅주, 클러스터 키를 DATE로 바꾸고 이에 맞게 쿼리
*/
CREATE  PROCEDURE [dbo].[TP_SKILL_LOG_SIZE_SELECT]
(
	@CHAR_IDX	INT,
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 )
)
AS
	SET NOCOUNT ON
	
	DECLARE @TEXT VARCHAR( 20 )
	
	SET @TEXT = '20' +
		SUBSTRING( @BEGIN_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @BEGIN_DATE, 3, 2 ) + '-' +
		SUBSTRING( @BEGIN_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @BEGIN_DATE, 8, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 11, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 14, 2 )

	DECLARE @BEGIN DATETIME	
	SET @BEGIN = CAST( @TEXT AS DATETIME )
	
	SET @TEXT = '20' +
		SUBSTRING( @END_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @END_DATE, 3, 2 ) + '-' +
		SUBSTRING( @END_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @END_DATE, 8, 2 ) + ':' +
		SUBSTRING( @END_DATE, 11, 2 ) + ':' +
		SUBSTRING( @END_DATE, 14, 2 )

	DECLARE @END DATETIME	
	SET @END = CAST( @TEXT AS DATETIME )
	
	SELECT  COUNT( * ),
			CHAR_IDX,
			--MIN( LOG_IDX ),
			--MAX( LOG_IDX )
			@BEGIN_DATE,
			@END_DATE
	FROM	TB_SKILL_LOG WITH (NOLOCK)
	WHERE	(DATE BETWEEN @BEGIN AND @END) AND
			(CHAR_IDX = @CHAR_IDX)
			--(DATE >= @BEGIN) AND
			--(DATE <= @END)
	GROUP BY CHAR_IDX
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_CONSIGN_LOG_SELECT]    Script Date: 07/30/2013 15:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_CONSIGN_LOG_SELECT]
(
	@BEGIN_DATE VARCHAR( 20 ),
	@END_DATE VARCHAR( 20 ),
	@CHAR_IDX INT,
	@ITEM_DBIDX INT,
	@CONSIGN_IDX INT,
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

	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 시작 날짜를 만든다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 시/분/초 단위로 분리한다
		SET @YEAR = 2000 + CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH = CAST( SUBSTRING( @BEGIN_DATE, 3, 2 ) AS INT )
		SET @DAY = CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR = CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE = CAST( SUBSTRING( @BEGIN_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @BEGIN_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR, @YEAR - DATEPART( YEAR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH, @MONTH - DATEPART( MONTH, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY, @DAY - DATEPART( DAY, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR, @HOUR - DATEPART( HOUR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE, @MINUTE - DATEPART( MINUTE, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND, @SECOND - DATEPART( SECOND, 0 ), @BEGIN )
	END

	DECLARE @END DATETIME
	SET @END = 0

	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 종료날짜를 만든다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 시/분/초 단위로 분리한다
		SET @YEAR = 2000 + CAST( SUBSTRING( @END_DATE, 1, 2 ) AS INT )
		SET @MONTH = CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY = CAST( SUBSTRING( @END_DATE, 5, 2 ) AS INT )
		SET @HOUR = CAST( SUBSTRING( @END_DATE, 8, 2 ) AS INT )
		SET @MINUTE = CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 날짜를 만든다
		SET @END = DATEADD( YEAR, @YEAR	- DATEPART( YEAR, 0 ), @END )
		SET @END = DATEADD( MONTH, @MONTH - DATEPART( MONTH, 0 ), @END )
		SET @END = DATEADD( DAY, @DAY - DATEPART( DAY, 0 ), @END )
		SET @END = DATEADD( HOUR, @HOUR	- DATEPART( HOUR, 0 ), @END )
		SET @END = DATEADD( MINUTE, @MINUTE - DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND, @SECOND - DATEPART( SECOND,	0 ), @END )
	END

	DECLARE @MONEY_BASE BIGINT
	SET @MONEY_BASE = 100000

	IF 0 = @CHAR_IDX and 0 = @ITEM_DBIDX and 0 = @CONSIGN_IDX
	BEGIN
		SELECT  TOP 100
			@REQUEST_TICK,
			LOG_IDX,
			LOG_TYPE,
			CHAR_INDEX,
			ITEM_DBINDEX,
			ITEM_INDEX,
			DURABILITY,
			@MONEY_BASE,
			CONVERT(VARCHAR, UNITPRICE / @MONEY_BASE),
			CONVERT(VARCHAR, UNITPRICE % @MONEY_BASE),
			CONVERT( VARCHAR( 6 ), UPDATEDATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), UPDATEDATE, 8 ),
			@END_DATE,
			@CHAR_IDX,
			@QUERY_SIZE,
			@ITEM_DBIDX,
			CONSIGNMENT_IDX
		FROM	TB_CONSIGNMENT_LOG WITH (NOLOCK)
		WHERE   UPDATEDATE BETWEEN @BEGIN AND @END
		ORDER BY LOG_IDX
	END
	else if 0 < @ITEM_DBIDX
		BEGIN
		SELECT  TOP 100
			@REQUEST_TICK,
			LOG_IDX,
			LOG_TYPE,
			CHAR_INDEX,
			ITEM_DBINDEX,
			ITEM_INDEX,
			DURABILITY,
			@MONEY_BASE,
			CONVERT(VARCHAR, UNITPRICE / @MONEY_BASE),
			CONVERT(VARCHAR, UNITPRICE % @MONEY_BASE),
			CONVERT(VARCHAR(6), UPDATEDATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), UPDATEDATE, 8 ),
			@END_DATE,
			@CHAR_IDX,
			@QUERY_SIZE,
			@ITEM_DBIDX,
			CONSIGNMENT_IDX
		FROM	TB_CONSIGNMENT_LOG WITH (NOLOCK)
		WHERE   ( UPDATEDATE BETWEEN @BEGIN AND @END ) AND
			(ITEM_DBINDEX = @ITEM_DBIDX)
		ORDER BY LOG_IDX
	end
	else if 0 < @CONSIGN_IDX
		BEGIN
		SELECT  TOP 100
			@REQUEST_TICK,
			LOG_IDX,
			LOG_TYPE,
			CHAR_INDEX,
			ITEM_DBINDEX,
			ITEM_INDEX,
			DURABILITY,
			@MONEY_BASE,
			CONVERT(VARCHAR, UNITPRICE / @MONEY_BASE),
			CONVERT(VARCHAR, UNITPRICE % @MONEY_BASE),
			CONVERT(VARCHAR(6), UPDATEDATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), UPDATEDATE, 8 ),
			@END_DATE,
			@CHAR_IDX,
			@QUERY_SIZE,
			@ITEM_DBIDX,
			CONSIGNMENT_IDX
		FROM	TB_CONSIGNMENT_LOG WITH (NOLOCK)
		WHERE   ( UPDATEDATE BETWEEN @BEGIN AND @END ) AND
			(CONSIGNMENT_IDX = @CONSIGN_IDX)
		ORDER BY LOG_IDX
	end
	ELSE
	BEGIN
		SELECT  TOP 100
			@REQUEST_TICK,
			LOG_IDX,
			LOG_TYPE,
			CHAR_INDEX,
			ITEM_DBINDEX,
			ITEM_INDEX,
			DURABILITY,
			@MONEY_BASE,
			CONVERT(VARCHAR, UNITPRICE / @MONEY_BASE),
			CONVERT(VARCHAR, UNITPRICE % @MONEY_BASE),
			CONVERT(VARCHAR(6), UPDATEDATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), UPDATEDATE, 8 ),
			@END_DATE,
			@CHAR_IDX,
			@QUERY_SIZE,
			@ITEM_DBIDX,
			CONSIGNMENT_IDX
		FROM	TB_CONSIGNMENT_LOG WITH (NOLOCK)
		WHERE   ( UPDATEDATE BETWEEN @BEGIN AND @END ) AND
			(CHAR_INDEX = @CHAR_IDX)
		ORDER BY LOG_IDX
	END
	RETURN 


/****** Object:  StoredProcedure [dbo].[TP_CONSIGN_LOG_SIZE_SELECT]    Script Date: 06/10/2010 19:26:22 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[TP_CONSIGN_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_CONSIGN_LOG_SIZE_SELECT]
(
	@BEGIN_DATE VARCHAR( 20 ),
	@END_DATE VARCHAR( 20 ),
	@CHAR_IDX INT,
	@ITEM_DBIDX INT,
	@CONSIGN_IDX INT,
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

	-- 080327 LUJ, DB가 인식하는 최초 날짜와의 차이를 얻어서, 시작 날짜를 만든다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 시/분/초 단위로 분리한다
		SET @YEAR = 2000 + CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH = CAST( SUBSTRING( @BEGIN_DATE, 3, 2 ) AS INT )
		SET @DAY = CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR = CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE = CAST( SUBSTRING( @BEGIN_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @BEGIN_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR, @YEAR - DATEPART( YEAR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH, @MONTH - DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY, @DAY	- DATEPART( DAY, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR, @HOUR - DATEPART( HOUR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE, @MINUTE - DATEPART( MINUTE, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND, @SECOND - DATEPART( SECOND, 0 ), @BEGIN )
	END

	DECLARE @END DATETIME
	SET @END = 0

	-- 080327 LUJ, DB가 인식하는 최초 날짜와의 차이를 얻어서, 종료날짜를 만든다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 시/분/초 단위로 분리한다
		SET @YEAR = 2000 + CAST( SUBSTRING( @END_DATE, 1, 2 ) AS INT )
		SET @MONTH = CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY = CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR = CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE = CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 날짜를 만든다
		SET @END = DATEADD( YEAR, @YEAR	- DATEPART( YEAR, 0 ), @END )
		SET @END = DATEADD( MONTH, @MONTH - DATEPART( MONTH, 0 ), @END )
		SET @END = DATEADD( DAY, @DAY - DATEPART( DAY, 0 ), @END )
		SET @END = DATEADD( HOUR, @HOUR	- DATEPART( HOUR, 0 ), @END )
		SET @END = DATEADD( MINUTE, @MINUTE - DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND, @SECOND - DATEPART( SECOND,	0 ), @END )
	END

	IF 0 = @CHAR_IDX and 0 = @ITEM_DBIDX and 0 = @CONSIGN_IDX
	BEGIN
		SELECT  COUNT( 1 ),
			@REQUEST_TICK,
			@BEGIN_DATE,
			@END_DATE,
			@CHAR_IDX,
			@ITEM_DBIDX,
			@CONSIGN_IDX
		FROM    TB_CONSIGNMENT_LOG WITH (NOLOCK)
		WHERE   (UPDATEDATE BETWEEN @BEGIN AND @END)
	END
	else if 0<@ITEM_DBIDX
	BEGIN
		SELECT  COUNT( 1 ),
			@REQUEST_TICK,
			@BEGIN_DATE,
			@END_DATE,
			@CHAR_IDX,
			@ITEM_DBIDX,
			@CONSIGN_IDX
		FROM    TB_CONSIGNMENT_LOG WITH (NOLOCK)
		WHERE   (UPDATEDATE BETWEEN @BEGIN AND @END) AND
			(ITEM_DBINDEX = @ITEM_DBIDX)
	END
	else if 0<@CONSIGN_IDX
	BEGIN
		SELECT  COUNT( 1 ),
			@REQUEST_TICK,
			@BEGIN_DATE,
			@END_DATE,
			@CHAR_IDX,
			@ITEM_DBIDX,
			@CONSIGN_IDX
		FROM    TB_CONSIGNMENT_LOG WITH (NOLOCK)
		WHERE   (UPDATEDATE BETWEEN @BEGIN AND @END) AND
			(CONSIGNMENT_IDX = @CONSIGN_IDX)
	END
	ELSE
	BEGIN
		SELECT  COUNT( 1 ),
			@REQUEST_TICK,
			@BEGIN_DATE,
			@END_DATE,
			@CHAR_IDX,
			@ITEM_DBIDX,
			@CONSIGN_IDX
		FROM    TB_CONSIGNMENT_LOG WITH (NOLOCK)
		WHERE   (UPDATEDATE BETWEEN @BEGIN AND @END) AND
			(CHAR_INDEX = @CHAR_IDX)
	END
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_CONSIGNMENT_LOG]    Script Date: 07/30/2013 15:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 판매대행로그 프로시저
CREATE      PROCEDURE [dbo].[TP_CONSIGNMENT_LOG]
	(
		@dwConsignmentIdx int,
		@dwPlayerID		int,
		@nKind			int,
		@dwItemDBIdx	int,
		@dwItemIdx		int,
		@dwDurability	int,
		@dwUnitPrice	int
	)
AS
	Set	Nocount	On
	
	insert TB_CONSIGNMENT_LOG
	(
		CONSIGNMENT_IDX,
		CHAR_INDEX,
		LOG_TYPE,
		ITEM_DBINDEX,
		ITEM_INDEX,
		DURABILITY,
		UNITPRICE,
		UPDATEDATE
	)
	values
	(
		@dwConsignmentIdx,
		@dwPlayerID,
		@nKind,
		@dwItemDBIdx,
		@dwItemIdx,
		@dwDurability,
		@dwUnitPrice,
		getdate()
	)
GO
/****** Object:  StoredProcedure [dbo].[TP_FAMILY_POINT_LOG_INSERT]    Script Date: 07/30/2013 15:58:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_FAMILY_POINT_LOG_INSERT]
(
	@FAMILY_IDX	INT,
	@POINT		INT,
	@MONSTER_EXP	INT,
	@LOGIN_MEMBER	INT,
	@TYPE			INT,
	@MEMO			VARCHAR( 16 )
)
AS
	SET NOCOUNT ON
	
	INSERT INTO TB_FAMILY_POINT_LOG
	                (FAMILY_IDX, POINT, MONSTER_EXP, LOGIN_MEMBER, TYPE, MEMO)
	VALUES   (@FAMILY_IDX, @POINT, @MONSTER_EXP, @LOGIN_MEMBER, @TYPE, @MEMO)
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_FAMILY_POINT_LOG_SELECT]    Script Date: 07/30/2013 15:58:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
0711 웅주
071129 웅주, 쿼리에 필요한 키 개수를 줄임
071211 웅주, DATE를 클러스터드 인덱스로 바꾸고 이에 맞게 쿼리
*/
CREATE  PROCEDURE [dbo].[TP_FAMILY_POINT_LOG_SELECT]
(
	@FAMILY_IDX	INT,
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 ),
	--@BEGIN_LOG_IDX	INT,
	--@END_LOG_IDX	INT,
	@QUERY_SIZE		INT
)
AS
	SET NOCOUNT ON
	
	DECLARE @TEXT VARCHAR( 20 )
	
	SET @TEXT = '20' +
		SUBSTRING( @BEGIN_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @BEGIN_DATE, 3, 2 ) + '-' +
		SUBSTRING( @BEGIN_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @BEGIN_DATE, 8, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 11, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 14, 2 )

	DECLARE @BEGIN DATETIME	
	SET @BEGIN = CAST( @TEXT AS DATETIME )
	
	SET @TEXT = '20' +
		SUBSTRING( @END_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @END_DATE, 3, 2 ) + '-' +
		SUBSTRING( @END_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @END_DATE, 8, 2 ) + ':' +
		SUBSTRING( @END_DATE, 11, 2 ) + ':' +
		SUBSTRING( @END_DATE, 14, 2 )

	DECLARE @END DATETIME	
	SET @END = CAST( @TEXT AS DATETIME )
	
	SELECT	TOP 100
			LOG_IDX,
			POINT,
			TYPE,
			--DATE,
			CONVERT( VARCHAR( 6 ), DATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), DATE, 8 ),
			MEMO,
			--@END_LOG_IDX,
			@FAMILY_IDX,
			@END_DATE
	FROM    TB_FAMILY_POINT_LOG WITH (NOLOCK)
	WHERE   (DATE BETWEEN @BEGIN AND @END) AND
			(FAMILY_IDX = @FAMILY_IDX)
			--(LOG_IDX > @BEGIN_LOG_IDX)
	--ORDER BY LOG_IDX
			
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_FAMILY_POINT_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:58:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주, 날짜를 비교하지 않고 쿼리할 수 있도록 로그 인덱스 범위를 알아냄
071211 웅주, DATE를 클러스터드 인덱스로 바꾸고 이에 맞게 쿼리
*/
CREATE  PROCEDURE [dbo].[TP_FAMILY_POINT_LOG_SIZE_SELECT]
(
	@FAMILY_IDX	INT,
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 )
)
AS
	SET NOCOUNT ON
	
	DECLARE @TEXT VARCHAR( 20 )
	
	SET @TEXT = '20' +
		SUBSTRING( @BEGIN_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @BEGIN_DATE, 3, 2 ) + '-' +
		SUBSTRING( @BEGIN_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @BEGIN_DATE, 8, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 11, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 14, 2 )

	DECLARE @BEGIN DATETIME	
	SET @BEGIN = CAST( @TEXT AS DATETIME )
	
	SET @TEXT = '20' +
		SUBSTRING( @END_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @END_DATE, 3, 2 ) + '-' +
		SUBSTRING( @END_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @END_DATE, 8, 2 ) + ':' +
		SUBSTRING( @END_DATE, 11, 2 ) + ':' +
		SUBSTRING( @END_DATE, 14, 2 )

	DECLARE @END DATETIME	
	SET @END = CAST( @TEXT AS DATETIME )
	
	SELECT  COUNT( * ),
			FAMILY_IDX,
			--MIN( LOG_IDX ),
			--MAX( LOG_IDX )
			@BEGIN_DATE,
			@END_DATE
	FROM	TB_FAMILY_POINT_LOG	WITH (NOLOCK)
	WHERE	(DATE BETWEEN @BEGIN AND @END) AND
			(FAMILY_IDX = @FAMILY_IDX)
			--(DATE >= @BEGIN) AND
			--(DATE <= @END)
	GROUP BY FAMILY_IDX
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_FARM_ANIMAL_LOG_INSERT]    Script Date: 07/30/2013 15:58:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[TP_FARM_ANIMAL_LOG_INSERT]
(
	@FARM_IDX	INT,
	@ANIMAL_OWNER_IDX	INT,
	@ANIMAL_IDX	INT,
	@ANIMAL_KIND	INT,
	@ANIMAL_STEP	INT,
	@ANIMAL_LIFE	INT,
	@ANIMAL_CONTENTMENT	INT,
	@ANIMAL_INTEREST	INT,
	@TYPE		INT,
	@MEMO		VARCHAR( 16 )
)
AS
	SET NOCOUNT ON
	
	INSERT INTO TB_FARM_ANIMAL_LOG (
			FARM_IDX,
			ANIMAL_OWNER_IDX,
			ANIMAL_IDX,
			ANIMAL_KIND,
			ANIMAL_STEP,
			ANIMAL_LIFE, 
			ANIMAL_CONTENTMENT,
			ANIMAL_INTEREST,
			TYPE,
			MEMO)
	VALUES   (
			@FARM_IDX,
			@ANIMAL_OWNER_IDX,
			@ANIMAL_IDX, @ANIMAL_KIND, @ANIMAL_STEP, 
	                	@ANIMAL_LIFE, @ANIMAL_CONTENTMENT, @ANIMAL_INTEREST,
			@TYPE, @MEMO)
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_FARM_ANIMAL_LOG_SELECT]    Script Date: 07/30/2013 15:58:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080630 LUJ, 농장 가축 로그
*/
CREATE  PROCEDURE [dbo].[TP_FARM_ANIMAL_LOG_SELECT]
(
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 ),
	@FARM_IDX	INT,
	@REQUEST_TICK	INT,
	@QUERY_SIZE	INT
)
AS
	SET NOCOUNT ON
	
	DECLARE @YEAR		INT
	DECLARE @MONTH	INT
	DECLARE @DAY		INT
	DECLARE @HOUR		INT
	DECLARE @MINUTE	INT
	DECLARE @SECOND	 INT
	
	DECLARE @BEGIN DATETIME
	SET @BEGIN = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--				예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--				사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--				( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--				이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,		@YEAR	- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,		@DAY	- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,		@HOUR	- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR	- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY	- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR	- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END
	
	IF 0 < @FARM_IDX
	BEGIN
		SELECT	TOP 100
				LOG_IDX,
				TYPE,
				FARM_IDX,
				MEMO,
				CONVERT( VARCHAR( 6 ), DATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), DATE, 8 ),
				ANIMAL_OWNER_IDX,
				ANIMAL_IDX,
				ANIMAL_KIND,
				ANIMAL_STEP,
				ANIMAL_LIFE,
				ANIMAL_CONTENTMENT,
				ANIMAL_INTEREST,
				@END_DATE,
				@REQUEST_TICK AS REQUEST_TICK,
				@FARM_IDX,
				@QUERY_SIZE
		FROM    TB_FARM_ANIMAL_LOG WITH (NOLOCK)
		WHERE  (DATE BETWEEN @BEGIN AND @END) AND
			(FARM_IDX = @FARM_IDX)
		ORDER BY DATE
	END
	ELSE
	BEGIN
		SELECT	TOP 100
				LOG_IDX,
				TYPE,
				FARM_IDX,
				MEMO,
				CONVERT( VARCHAR( 6 ), DATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), DATE, 8 ),
				ANIMAL_OWNER_IDX,
				ANIMAL_IDX,
				ANIMAL_KIND,
				ANIMAL_STEP,
				ANIMAL_LIFE,
				ANIMAL_CONTENTMENT,
				ANIMAL_INTEREST,
				@END_DATE,
				@REQUEST_TICK AS REQUEST_TICK,
				@FARM_IDX,
				@QUERY_SIZE
		FROM    TB_FARM_ANIMAL_LOG WITH (NOLOCK)
		WHERE  (DATE BETWEEN @BEGIN AND @END)
	END
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_FARM_ANIMAL_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:58:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080630 LUJ, 농장 가축 로그 개수를 얻어온다
*/
CREATE PROCEDURE [dbo].[TP_FARM_ANIMAL_LOG_SIZE_SELECT]
(
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 ),
	@REQUEST_TICK	INT,
	@FARM_IDX	INT
)
AS
	SET NOCOUNT ON
	
	DECLARE @YEAR		INT
	DECLARE @MONTH	INT
	DECLARE @DAY		INT
	DECLARE @HOUR		INT
	DECLARE @MINUTE	INT
	DECLARE @SECOND 	INT
	
	DECLARE @BEGIN DATETIME
	SET @BEGIN = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--				예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--				사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--				( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--				이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=	CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	=	CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=	CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	=	CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 	CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,	@YEAR		- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,	@DAY		- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,	@HOUR		- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=	CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 	CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=	CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 	CAST( SUBSTRING( @END_DATE, 11, 2 ) 	AS INT )
		SET @SECOND	= 	CAST( SUBSTRING( @END_DATE, 14, 2 ) 	AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR		- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY		- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR		- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END
			
	IF 0 < @FARM_IDX
	BEGIN
		SELECT  COUNT( * ) AS SIZE,
			@BEGIN_DATE AS BEGIN_DATE,
			CONVERT( VARCHAR( 6 ), @END, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), @END, 8 ) AS END_DATE,
			@REQUEST_TICK AS REQUEST_TICK,
			@FARM_IDX AS FARM_IDX
		FROM	TB_FARM_ANIMAL_LOG WITH (NOLOCK)
		WHERE	(DATE BETWEEN @BEGIN AND @END) AND
			FARM_IDX = @FARM_IDX
	END
	ELSE
	BEGIN
		SELECT  COUNT( * ) AS SIZE,
			@BEGIN_DATE AS BEGIN_DATE,
			CONVERT( VARCHAR( 6 ), @END, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), @END, 8 ) AS END_DATE,
			@REQUEST_TICK AS REQUEST_TICK,
			@FARM_IDX AS FARM_IDX
		FROM	TB_FARM_ANIMAL_LOG WITH (NOLOCK)
		WHERE	(DATE BETWEEN @BEGIN AND @END)
	END
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_FARM_CROP_LOG_INSERT]    Script Date: 07/30/2013 15:58:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_FARM_CROP_LOG_INSERT]
(
	@FARM_IDX	INT,
	@CROP_OWNER_IDX	INT,
	@CROP_IDX	INT,
	@CROP_KIND	INT,
	@CROP_STEP	INT,
	@CROP_LIFE	INT,
	@CROP_SEED_GRADE	INT,
	@TYPE		INT,
	@MEMO		VARCHAR( 16 )
)
AS
	SET NOCOUNT ON
	
	INSERT INTO TB_FARM_CROP_LOG (
			FARM_IDX,
			CROP_OWNER_IDX,
			CROP_IDX,
			CROP_KIND,
			CROP_STEP,
			CROP_LIFE, 
			CROP_SEED_GRADE,
			TYPE,
			MEMO)
	VALUES   (
			@FARM_IDX,
			@CROP_OWNER_IDX,
			@CROP_IDX, @CROP_KIND, @CROP_STEP, 
	                @CROP_LIFE, @CROP_SEED_GRADE, @TYPE, @MEMO)
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_FARM_CROP_LOG_SELECT]    Script Date: 07/30/2013 15:58:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주, 쿼리에 필요한 키를 줄이도록 함
071211 웅주, DATE를 클러스터드 인덱스로 바꾸고 이에 맞게 쿼리
080327 LUJ, 언어에 따라 다른 날짜 표시 형식에 무관하게 쿼리할 날짜를 생성할 수 있도록 함
080404 LUJ, 최대 쿼리 개수를 전송함	
*/
CREATE  PROCEDURE [dbo].[TP_FARM_CROP_LOG_SELECT]
(
	@FARM_IDX	INT,
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 ),
	@QUERY_SIZE	INT
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
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--				예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--				사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--				( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--				이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,		@YEAR	- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,		@DAY	- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,		@HOUR	- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR	- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY	- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR	- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END
	
	SELECT	TOP 100
			LOG_IDX,
			CROP_OWNER_IDX,
			CROP_IDX,
			CROP_KIND,
			CROP_STEP,
			CROP_LIFE,
			CROP_SEED_GRADE,
			TYPE,
			CONVERT( VARCHAR( 6 ), DATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), DATE, 8 ),
			MEMO,
			@FARM_IDX,
			@END_DATE,
			@QUERY_SIZE	
	FROM    TB_FARM_CROP_LOG WITH (NOLOCK)
	WHERE   (DATE BETWEEN @BEGIN AND @END) AND
			(FARM_IDX = @FARM_IDX)
	ORDER BY DATE
		
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_FARM_CROP_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:58:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주, 날짜를 비교하지 않고 쿼리할 수 있도록 로그 인덱스 범위를 알아냄
071211 웅주, DATE를 클러스터드 인덱스로 바꾸고 이에 맞게 쿼리
*/
CREATE  PROCEDURE [dbo].[TP_FARM_CROP_LOG_SIZE_SELECT]
(
	@FARM_IDX	INT,
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 )
)
AS
	SET NOCOUNT ON
	
	DECLARE @TEXT VARCHAR( 20 )
	
	SET @TEXT = '20' +
		SUBSTRING( @BEGIN_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @BEGIN_DATE, 3, 2 ) + '-' +
		SUBSTRING( @BEGIN_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @BEGIN_DATE, 8, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 11, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 14, 2 )

	DECLARE @BEGIN DATETIME	
	SET @BEGIN = CAST( @TEXT AS DATETIME )
	
	SET @TEXT = '20' +
		SUBSTRING( @END_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @END_DATE, 3, 2 ) + '-' +
		SUBSTRING( @END_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @END_DATE, 8, 2 ) + ':' +
		SUBSTRING( @END_DATE, 11, 2 ) + ':' +
		SUBSTRING( @END_DATE, 14, 2 )

	DECLARE @END DATETIME	
	SET @END = CAST( @TEXT AS DATETIME )
	
	SELECT  COUNT( * ),
			FARM_IDX,
			--MIN( LOG_IDX ),
			--MAX( LOG_IDX )
			@BEGIN_DATE,
			@END_DATE
	FROM	TB_FARM_CROP_LOG WITH (NOLOCK)
	WHERE	(DATE BETWEEN @BEGIN AND @END) AND
			(FARM_IDX = @FARM_IDX)
			--(DATE >= @BEGIN) AND
			--(DATE <= @END)
	GROUP BY FARM_IDX
				
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_FARM_LOG_SELECT]    Script Date: 07/30/2013 15:58:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080401 LUJ, 농장 로그를 일자별로 쿼리한다
080404 LUJ, 최대 쿼리 개수를 전송함	
*/
CREATE  PROCEDURE [dbo].[TP_FARM_LOG_SELECT]
(
	@BEGIN_DATE		VARCHAR( 20 ),
	@END_DATE		VARCHAR( 20 ),
	@REQUEST_TICK	INT,
	@QUERY_SIZE		INT
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
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--				예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--				사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--				( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--				이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,		@YEAR	- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,		@DAY	- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,		@HOUR	- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR	- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY	- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR	- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END
	
	SELECT	TOP 100
			LOG_IDX,
			ZONE,
			FARM,
			KIND,
			PLAYERID,
			VALUE01,
			VALUE02,
			CONVERT( VARCHAR( 6 ), DATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), DATE, 8 ) AS BEGIN_DATE,
			@END_DATE,
			@REQUEST_TICK AS REQUEST_TICK,
			@QUERY_SIZE
	FROM    TB_FARM_LOG WITH (NOLOCK)
	WHERE   (DATE BETWEEN @BEGIN AND @END)
	ORDER BY DATE
			
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_FARM_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080401 LUJ, 농장 로그 개수를 얻어온다
080402 LUJ, 쿼리 가능한 최대 개수를 설정한다
080404 LUJ, 쿼리 가능 최대 개수 제거(속도 저하 요인)
*/
CREATE  PROCEDURE [dbo].[TP_FARM_LOG_SIZE_SELECT]
(
	@BEGIN_DATE		VARCHAR( 20 ),
	@END_DATE		VARCHAR( 20 ),
	@REQUEST_TICK	INT
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
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--				예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--				사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--				( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--				이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,		@YEAR	- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,		@DAY	- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,		@HOUR	- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR	- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY	- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR	- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END
		
	SELECT  COUNT( * ) AS SIZE,
			@BEGIN_DATE AS BEGIN_DATE,
			CONVERT( VARCHAR( 6 ), @END, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), @END, 8 ) AS END_DATE,
			@REQUEST_TICK AS REQUEST_TICK
	FROM	TB_FARM_LOG WITH (NOLOCK)
	WHERE	(DATE BETWEEN @BEGIN AND @END)
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_FISH_LOG_SELECT]    Script Date: 07/30/2013 15:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080523 LUJ, 낚시 로그
080808 LUJ, 경험치와 레벨을 추가
*/
CREATE   PROCEDURE [dbo].[TP_FISH_LOG_SELECT]
(
	@BEGIN_DATE		VARCHAR( 20 ),
	@END_DATE		VARCHAR( 20 ),
	@REQUEST_TICK	INT,
	@CHAR_IDX		INT,
	@QUERY_SIZE		INT
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
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--				예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--				사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--				( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--				이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,		@YEAR	- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,		@DAY	- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,		@HOUR	- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR	- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY	- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR	- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END
	
	IF 0 < @CHAR_IDX
	BEGIN
		SELECT	TOP 100
				LOGIDX,
				LOGTYPE,
				CHARACTERIDX,
				DIFFPOINT,
				TOTALPOINT,
				BUYITEMIDX,
				USEFISH,
				CONVERT( VARCHAR( 6 ), LOGDATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), LOGDATE, 8 ),
				@END_DATE,
				@REQUEST_TICK AS REQUEST_TICK,
				@CHAR_IDX,
				@QUERY_SIZE,
				-- 080808 LUJ, 경험치와 레벨을 추가
				EXPERIENCE,
				[LEVEL]
		FROM    TB_FISHING_LOG WITH (NOLOCK)
		WHERE   (LOGDATE BETWEEN @BEGIN AND @END) AND
				(CHARACTERIDX = @CHAR_IDX)
		ORDER BY LOGDATE
	END
	ELSE
	BEGIN
		SELECT	TOP 100
				LOGIDX,
				LOGTYPE,
				CHARACTERIDX,
				DIFFPOINT,
				TOTALPOINT,
				BUYITEMIDX,
				USEFISH,
				CONVERT( VARCHAR( 6 ), LOGDATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), LOGDATE, 8 ),
				@END_DATE,
				@REQUEST_TICK AS REQUEST_TICK,
				@CHAR_IDX,
				@QUERY_SIZE,
				-- 080808 LUJ, 경험치와 레벨을 추가
				EXPERIENCE,
				[LEVEL]
		FROM    TB_FISHING_LOG WITH (NOLOCK)
		WHERE   (LOGDATE BETWEEN @BEGIN AND @END)
		ORDER BY LOGDATE
	END
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_FISH_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:58:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080523 LUJ, 낚시 로그 개수를 얻어온다
*/
CREATE PROCEDURE [dbo].[TP_FISH_LOG_SIZE_SELECT]
(
	@BEGIN_DATE		VARCHAR( 20 ),
	@END_DATE		VARCHAR( 20 ),
	@REQUEST_TICK	INT,
	@CHAR_IDX		INT
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
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--				예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--				사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--				( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--				이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,		@YEAR	- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,		@DAY	- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,		@HOUR	- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR	- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY	- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR	- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END
			
	IF 0 < @CHAR_IDX
	BEGIN
		SELECT  COUNT( * ) AS SIZE,
				@BEGIN_DATE AS BEGIN_DATE,
				CONVERT( VARCHAR( 6 ), @END, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), @END, 8 ) AS END_DATE,
				@REQUEST_TICK AS REQUEST_TICK,
				@CHAR_IDX AS CHARACTERIDX
		FROM	TB_FISHING_LOG WITH (NOLOCK)
		WHERE	(LOGDATE BETWEEN @BEGIN AND @END) AND
				CHARACTERIDX = @CHAR_IDX
	END
	ELSE
	BEGIN
		SELECT  COUNT( * ) AS SIZE,
				@BEGIN_DATE AS BEGIN_DATE,
				CONVERT( VARCHAR( 6 ), @END, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), @END, 8 ) AS END_DATE,
				@REQUEST_TICK AS REQUEST_TICK,
				@CHAR_IDX AS CHARACTERIDX
		FROM	TB_FISHING_LOG WITH (NOLOCK)
		WHERE	(LOGDATE BETWEEN @BEGIN AND @END)
	END
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[UP_Fishing_log_insert]    Script Date: 07/30/2013 15:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080808 LUJ, 경험치와 레벨을 추가
*/
CREATE     PROCEDURE [dbo].[UP_Fishing_log_insert]
(
	@dwPlayerID		int,
	@cLogType		smallint,
	@dwDiffPoint	bigint,
	@dwTotalPoint	bigint,
	@dwBuyItem		int,
	@dwUseFish		int,
	-- 080808 LUJ,  경험치와 레벨을 추가
	@dwExperience	bigint ,
	@dwLevel		int
)

AS
	SET NOCOUNT ON
	
	insert TB_FISHING_LOG
	(
		CHARACTERIDX,
		LOGTYPE,
		DIFFPOINT,
		TOTALPOINT,
		BUYITEMIDX,
		USEFISH,
		LOGDATE,
		-- 080808 LUJ,  경험치와 레벨을 추가
		EXPERIENCE,
		[LEVEL]
	)
	values
	(
		@dwPlayerID,
		@cLogType,
		@dwDiffPoint,
		@dwTotalPoint,
		@dwBuyItem,
		@dwUseFish,
		getdate(),
		-- 080808 LUJ,  경험치와 레벨을 추가
		@dwExperience,
		@dwLevel
	)
GO
/****** Object:  StoredProcedure [dbo].[TP_GUILD_SCORE_LOG_SELECT]    Script Date: 07/30/2013 15:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주, 쿼리에 필요한 키를 줄임
071211 웅주, DATE를 클러스터드 인덱스로 바꾸고 이에 맞게 쿼리
080327 LUJ, 언어에 따라 다른 날짜 표시 형식에 무관하게 쿼리할 날짜를 생성할 수 있도록 함
080404 LUJ, 최대 쿼리 개수를 전송함	
*/
CREATE  PROCEDURE [dbo].[TP_GUILD_SCORE_LOG_SELECT]
(
	@GUILD_IDX	INT,
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 ),
	@QUERY_SIZE	INT
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
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--				예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--				사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--				( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--				이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,		@YEAR	- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,		@DAY	- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,		@HOUR	- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR	- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY	- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR	- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END
	
	SELECT	TOP 100
			LOG_IDX,
			SCORE,
			TYPE,
			CONVERT( VARCHAR( 6 ), DATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), DATE, 8 ),
			MEMO,
			@GUILD_IDX,
			@END_DATE,
			@QUERY_SIZE
	FROM    TB_GUILD_SCORE_LOG WITH (NOLOCK)
	WHERE   (DATE BETWEEN @BEGIN AND @END) AND
			(GUILD_IDX = @GUILD_IDX)
	ORDER BY DATE
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_GUILD_SCORE_LOG_INSERT]    Script Date: 07/30/2013 15:58:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*/
CREATE  PROCEDURE [dbo].[TP_GUILD_SCORE_LOG_INSERT]
(
	@GUILD_IDX	INT,
	@SCORE		FLOAT,
	@TYPE		INT,
	@MEMO		VARCHAR( 16 )
)
AS
	SET NOCOUNT ON
	
	INSERT INTO TB_GUILD_SCORE_LOG
	                (GUILD_IDX, SCORE, TYPE, MEMO)
	VALUES   (@GUILD_IDX, @SCORE, @TYPE, @MEMO)
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_GUILD_SCORE_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주, 날짜를 비교하지 않고 쿼리할 수 있도록 로그 인덱스 범위를 알아냄
071211 웅주, DATE를 클러스터드 인덱스로 바꾸고 이에 맞게 쿼리
*/
CREATE  PROCEDURE [dbo].[TP_GUILD_SCORE_LOG_SIZE_SELECT]
(
	@GUILD_IDX	INT,
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 )
)
AS
	SET NOCOUNT ON
	
	DECLARE @TEXT VARCHAR( 20 )
	
	SET @TEXT = '20' +
		SUBSTRING( @BEGIN_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @BEGIN_DATE, 3, 2 ) + '-' +
		SUBSTRING( @BEGIN_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @BEGIN_DATE, 8, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 11, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 14, 2 )

	DECLARE @BEGIN DATETIME	
	SET @BEGIN = CAST( @TEXT AS DATETIME )
	
	SET @TEXT = '20' +
		SUBSTRING( @END_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @END_DATE, 3, 2 ) + '-' +
		SUBSTRING( @END_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @END_DATE, 8, 2 ) + ':' +
		SUBSTRING( @END_DATE, 11, 2 ) + ':' +
		SUBSTRING( @END_DATE, 14, 2 )

	DECLARE @END DATETIME	
	SET @END = CAST( @TEXT AS DATETIME )
	
	SELECT  COUNT( * ),
			GUILD_IDX,
			--MIN( LOG_IDX ),
			--MAX( LOG_IDX )
			@BEGIN_DATE,
			@END_DATE
	FROM	TB_GUILD_SCORE_LOG WITH (NOLOCK)
	WHERE	(DATE BETWEEN @BEGIN AND @END) AND
			(GUILD_IDX = @GUILD_IDX)
			--(DATE >= @BEGIN) AND
			--(DATE <= @END)
	GROUP BY GUILD_IDX
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_GUILD_WAREHOUSE_LOG_INSERT]    Script Date: 07/30/2013 15:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_GUILD_WAREHOUSE_LOG_INSERT]
(
	@CHAR_IDX			INT,
	@GUILD_IDX			INT,
	@ITEM_FROM_POS		INT,
	@ITEM_TO_POS		INT,
	@ITEM_IDX			INT,
	@ITEM_DBIDX			INT,
	@ITEM_DURABILITY	INT,
	@MONEY				BIGINT,
	@TYPE				INT,
	@MEMO				VARCHAR( 20 )
)
AS
	SET NOCOUNT ON
	
	INSERT INTO TB_GUILD_WAREHOUSE_LOG( 
				GUILD_IDX,
				CHAR_IDX,
				ITEM_IDX,
				ITEM_DBIDX,
				ITEM_DURABILITY, 
	            ITEM_FROM_POSITION,
	            ITEM_TO_POSITION,
	            MONEY,
	            TYPE,
	            MEMO )
	VALUES		(
				@GUILD_IDX,
				@CHAR_IDX,
				@ITEM_IDX,
				@ITEM_DBIDX,
				@ITEM_DURABILITY,
				@ITEM_FROM_POS,
				@ITEM_TO_POS,
				@MONEY,
				@TYPE,
				@MEMO )
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_GUILD_WAREHOUSE_LOG_SELECT]    Script Date: 07/30/2013 15:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주, 쿼리에 필요한 키를 줄임
071211 웅주, 클러스터 인덱스를 DATE로 바꾸고 이에 맞제 쿼리 수정
080327 LUJ, 언어에 따라 다른 날짜 표시 형식에 무관하게 쿼리할 날짜를 생성할 수 있도록 함
080404 LUJ, 최대 쿼리 개수를 전송함	
*/
CREATE  PROCEDURE [dbo].[TP_GUILD_WAREHOUSE_LOG_SELECT]
(
	@GUILD_IDX	INT,
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 ),
	@QUERY_SIZE	INT
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
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--				예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--				사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--				( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--				이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,		@YEAR	- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,		@DAY	- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,		@HOUR	- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR	- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY	- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR	- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END
		
	SELECT	TOP 100
			LOG_IDX,
			CHAR_IDX,
			ITEM_IDX,
			ITEM_DBIDX,
			ITEM_DURABILITY,
			ITEM_TO_POSITION,
			ITEM_FROM_POSITION,
			MONEY,
			TYPE,
			CONVERT( VARCHAR( 6 ), DATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), DATE, 8 ),
			MEMO,
			@END_DATE,
			@GUILD_IDX,
			@QUERY_SIZE
	FROM	TB_GUILD_WAREHOUSE_LOG WITH (NOLOCK)
	WHERE	(DATE BETWEEN @BEGIN AND @END) AND
			(GUILD_IDX = @GUILD_IDX)
	ORDER BY DATE
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_GUILD_WAREHOUSE_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주, 날짜를 비교하지 않고 쿼리할 수 있도록 로그 인덱스 범위를 알아냄
071211 웅주, 로그 테이블의 클러스터 인덱스를 DATE로 변경하고 이에 맞게 쿼리
*/
CREATE  PROCEDURE [dbo].[TP_GUILD_WAREHOUSE_LOG_SIZE_SELECT]
(
	@GUILD_IDX	INT,
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 )
)
AS
	SET NOCOUNT ON
	
	DECLARE @TEXT VARCHAR( 20 )
	
	SET @TEXT = '20' +
		SUBSTRING( @BEGIN_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @BEGIN_DATE, 3, 2 ) + '-' +
		SUBSTRING( @BEGIN_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @BEGIN_DATE, 8, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 11, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 14, 2 )

	DECLARE @BEGIN DATETIME	
	SET @BEGIN = CAST( @TEXT AS DATETIME )
	
	SET @TEXT = '20' +
		SUBSTRING( @END_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @END_DATE, 3, 2 ) + '-' +
		SUBSTRING( @END_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @END_DATE, 8, 2 ) + ':' +
		SUBSTRING( @END_DATE, 11, 2 ) + ':' +
		SUBSTRING( @END_DATE, 14, 2 )

	DECLARE @END DATETIME	
	SET @END = CAST( @TEXT AS DATETIME )
	
	SELECT  COUNT( * ),
			GUILD_IDX,
			@BEGIN_DATE,
			@END_DATE
	FROM	TB_GUILD_WAREHOUSE_LOG WITH (NOLOCK)
	WHERE	(DATE BETWEEN @BEGIN AND @END) AND
			(GUILD_IDX = @GUILD_IDX)
	GROUP BY GUILD_IDX
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_GUILD_LOG_SELECT]    Script Date: 07/30/2013 15:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주, 쿼리에 필요한 키를 줄임
071213 웅주, 클러스터 인덱스를 DATE로 바꾸고 이에 맞제 쿼리 수정
080327 LUJ, 언어에 따라 다른 날짜 표시 형식에 무관하게 쿼리할 날짜를 생성할 수 있도록 함
080404 LUJ, 최대 쿼리 개수를 전송함	
*/
CREATE  PROCEDURE [dbo].[TP_GUILD_LOG_SELECT]
(
	@GUILD_IDX	INT,
	@CHAR_IDX INT, -- unused
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 ),
	@QUERY_SIZE	INT
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
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--				예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--				사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--				( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--				이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,		@YEAR	- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,		@DAY	- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,		@HOUR	- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR	- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY	- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR	- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END
	
	SELECT	TOP 100
			LogIdx,
			LogType,
			Charno,
			Param1,
			Param2,
			CONVERT( VARCHAR( 6 ), REGDATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), REGDATE, 8 ),
			@GUILD_IDX,
			@END_DATE,
			@QUERY_SIZE
	FROM	TB_GUILDLOG WITH (NOLOCK)
	WHERE   (REGDATE BETWEEN @BEGIN AND @END) AND
			(GuildIdx = @GUILD_IDX)
	ORDER BY REGDATE
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_GUILD_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:58:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주, 날짜를 비교하지 않고 쿼리할 수 있도록 로그 인덱스 범위를 알아냄
071213 웅주, 클러스터 인덱스를 DATE로 바꾸고 이에 맞제 쿼리 수정
*/
CREATE  PROCEDURE [dbo].[TP_GUILD_LOG_SIZE_SELECT]
(
	@GUILD_IDX	INT,
	@REQUEST_TICK INT,
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 )
)
AS
	SET NOCOUNT ON
	
	DECLARE @TEXT VARCHAR( 20 )
	
	SET @TEXT = '20' +
		SUBSTRING( @BEGIN_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @BEGIN_DATE, 3, 2 ) + '-' +
		SUBSTRING( @BEGIN_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @BEGIN_DATE, 8, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 11, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 14, 2 )

	DECLARE @BEGIN DATETIME	
	SET @BEGIN = CAST( @TEXT AS DATETIME )
	
	SET @TEXT = '20' +
		SUBSTRING( @END_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @END_DATE, 3, 2 ) + '-' +
		SUBSTRING( @END_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @END_DATE, 8, 2 ) + ':' +
		SUBSTRING( @END_DATE, 11, 2 ) + ':' +
		SUBSTRING( @END_DATE, 14, 2 )
		
	DECLARE @END DATETIME	
	SET @END = CAST( @TEXT AS DATETIME )	
	
	SELECT  COUNT( * ),
			GUILDIDX,
			@BEGIN_DATE,
			@END_DATE,
			--MIN( LogIdx ),
			--MAX( LogIdx ),
			0
	FROM	TB_GUILDLOG WITH (NOLOCK)
	WHERE	(REGDATE BETWEEN @BEGIN AND @END) AND
			(GuildIdx = @GUILD_IDX)
	GROUP BY GUILDIDX
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[Up_GuildLog]    Script Date: 07/30/2013 15:59:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE	proc [dbo].[Up_GuildLog]
(
	@Charno	int,
	@GuildIdx	int,
	@LogType	int,
	@Param1	int,
	@Param2	int
)
as
	set nocount on

insert tb_guildlog
(
LogType,
GuildIdx,
Charno,
Param1,
Param2
)
values
(
@LogType,
@GuildIdx,
@Charno,
@Param1,
@Param2
)
GO
/****** Object:  StoredProcedure [dbo].[TP_ITEM_DROP_OPTION_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080325 LUJ, 드롭 옵션 로그 개수를 알아냄. 최대 500건만 조회 가능하도록 함
080327 LUJ, 언어에 따라 다른 날짜 표시 형식에 무관하게 쿼리할 날짜를 생성할 수 있도록 함
*/
CREATE PROCEDURE [dbo].[TP_ITEM_DROP_OPTION_LOG_SIZE_SELECT]
(
	@ITEM_DBIDX	INT,
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 )
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
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--				예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--				사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--				( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--				이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,		@YEAR	- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,		@DAY	- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,		@HOUR	- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR	- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY	- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR	- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END	
	
	SELECT  COUNT( 1 ),
			ITEM_DBIDX,
			@BEGIN_DATE,
			@END_DATE
	FROM    TB_ITEM_DROP_OPTION_LOG WITH (NOLOCK)
	WHERE   (DATE BETWEEN @BEGIN AND @END) AND
			(ITEM_DBIDX = @ITEM_DBIDX)
	GROUP BY ITEM_DBIDX	
		
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_ITEM_DROP_OPTION_LOG_SELECT]    Script Date: 07/30/2013 15:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080325 LUJ, 드롭 옵션 로그를 쿼리한다
080327 LUJ, 언어에 따라 다른 날짜 표시 형식에 무관하게 쿼리할 날짜를 생성할 수 있도록 함
080404 LUJ, 최대 쿼리 개수를 전송함	
*/
CREATE  PROCEDURE [dbo].[TP_ITEM_DROP_OPTION_LOG_SELECT]
(
	@ITEM_DBIDX	INT,
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 ),
	@QUERY_SIZE	INT
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
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--				예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--				사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--				( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--				이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,		@YEAR	- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,		@DAY	- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,		@HOUR	- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR	- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY	- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR	- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END
	
	SELECT	TOP 100
			LOG_IDX,
			ITEM_DBIDX,
			TYPE,
			CONVERT( VARCHAR( 6 ), DATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), DATE, 8 ),
			MEMO,
			KEY1,
			VALUE1,
			KEY2,
			VALUE2,
			KEY3,
			VALUE3,
			KEY4,
			VALUE4,
			KEY5,
			VALUE5,			
			@END_DATE,
			@QUERY_SIZE
	FROM	TB_ITEM_DROP_OPTION_LOG	WITH (NOLOCK)
	WHERE	(DATE BETWEEN @BEGIN AND @END) AND
			(ITEM_DBIDX = @ITEM_DBIDX)
	ORDER BY	DATE
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_GAMEROOM_POINT_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[TP_GAMEROOM_POINT_LOG_SIZE_SELECT]
(
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE VARCHAR( 20 ),
	@USER_IDX INT,
	@REQUEST_TICK INT	
)
AS
	SET NOCOUNT ON
	
	DECLARE @TEXT VARCHAR( 20 )
	
	SET @TEXT = '20' +
		SUBSTRING( @BEGIN_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @BEGIN_DATE, 3, 2 ) + '-' +
		SUBSTRING( @BEGIN_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @BEGIN_DATE, 8, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 11, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 14, 2 )

	DECLARE @BEGIN DATETIME	
	SET @BEGIN = CAST( @TEXT AS DATETIME )
	
	SET @TEXT = '20' +
		SUBSTRING( @END_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @END_DATE, 3, 2 ) + '-' +
		SUBSTRING( @END_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @END_DATE, 8, 2 ) + ':' +
		SUBSTRING( @END_DATE, 11, 2 ) + ':' +
		SUBSTRING( @END_DATE, 14, 2 )

	DECLARE @END DATETIME	
	SET @END = CAST( @TEXT AS DATETIME )

	IF @USER_IDX = 0
	BEGIN
		SELECT  COUNT( * ),
				USER_IDX,
				@BEGIN_DATE,
				@END_DATE,
				@REQUEST_TICK
		FROM	TB_GAMEROOM_POINT_LOG WITH (NOLOCK)
		WHERE	(DATE BETWEEN @BEGIN AND @END)
		GROUP BY USER_IDX
	END
	ELSE
	BEGIN
		SELECT  COUNT( * ),
				USER_IDX,
				@BEGIN_DATE,
				@END_DATE,
				@REQUEST_TICK
		FROM	TB_GAMEROOM_POINT_LOG WITH (NOLOCK)
		WHERE	(DATE BETWEEN @BEGIN AND @END) AND
				(USER_IDX = @USER_IDX)
		GROUP BY USER_IDX
	END
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_GAMEROOM_POINT_LOG_SELECT]    Script Date: 07/30/2013 15:58:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[TP_GAMEROOM_POINT_LOG_SELECT]
(
	@BEGIN_DATE VARCHAR( 20 ),
	@END_DATE VARCHAR( 20 ),
	@USER_IDX INT,
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
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--				예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--				사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--				( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--				이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,		@YEAR	- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,		@DAY	- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,		@HOUR	- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR	- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY	- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR	- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END

	IF 0 = @USER_IDX
	BEGIN
		SELECT TOP 100
			@REQUEST_TICK,
			LOG_IDX,
			USER_IDX,
			TYPE,
			POINT,
			CONVERT( VARCHAR( 6 ), DATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), DATE, 8 ),
			@USER_IDX,
			@END_DATE,
			@QUERY_SIZE	
		FROM    TB_GAMEROOM_POINT_LOG WITH (NOLOCK)
		WHERE   (DATE BETWEEN @BEGIN AND @END)
		ORDER BY DATE
	END
	ELSE
	BEGIN
		SELECT TOP 100
			@REQUEST_TICK,
			LOG_IDX,
			USER_IDX,
			TYPE,
			POINT,
			CONVERT( VARCHAR( 6 ), DATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), DATE, 8 ),
			@USER_IDX,
			@END_DATE,
			@QUERY_SIZE	
		FROM    TB_GAMEROOM_POINT_LOG WITH (NOLOCK)
		WHERE   (DATE BETWEEN @BEGIN AND @END) AND
				(USER_IDX = @USER_IDX)
		ORDER BY DATE
	END
		
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_GAMEROOM_POINT_LOG_INSERT]    Script Date: 07/30/2013 15:58:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
081205 LUJ, 패밀리 로그를 저장한다
*/
CREATE  PROCEDURE [dbo].[TP_GAMEROOM_POINT_LOG_INSERT]
(
	@TYPE INT,
	@USER_IDX INT,
	@POINT INT
)
AS
	SET NOCOUNT ON
	INSERT INTO TB_GAMEROOM_POINT_LOG
	(
		TYPE,
		USER_IDX,
		POINT
	)
	VALUES
	(
		@TYPE,
		@USER_IDX,
		@POINT		
	)	

	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_ITEM_OPTION_LOG_INSERT]    Script Date: 07/30/2013 15:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_ITEM_OPTION_LOG_INSERT]
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
	@MIX_STRENGTH				INT,
	@MIX_INTELLIGENCE			INT,
	@MIX_DEXTERITY				INT,
	@MIX_WISDOM					INT,
	@MIX_VITALITY				INT,	
	@ENCHANT_INDEX				INT,
	@ENCHANT_LEVEL				TINYINT,
	@TYPE						INT,
	@MEMO						VARCHAR( 20 )
)
AS
	SET NOCOUNT ON	
	SET XACT_ABORT ON
	
	-- 레코드 삽입
	BEGIN
		INSERT INTO TB_ITEM_OPTION_LOG
				(	CHAR_IDX,
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
					MIX_STRENGTH,
					MIX_INTELLIGENCE,
					MIX_DEXTERITY,	
					MIX_WISDOM,		
					MIX_VITALITY,
					ENCHANT_INDEX,
					ENCHANT_LEVEL,
					TYPE,
					MEMO )
		VALUES	(	@CHAR_IDX,
					@ITEM_DBIDX,
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
					@MIX_STRENGTH,
					@MIX_INTELLIGENCE,
					@MIX_DEXTERITY,	
					@MIX_WISDOM,		
					@MIX_VITALITY,
					@ENCHANT_INDEX,
					@ENCHANT_LEVEL,
					@TYPE,
					@MEMO )
	END
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_ITEM_OPTION_LOG_SELECT]    Script Date: 07/30/2013 15:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주, 쿼리에 필요한 키를 줄임
071211 웅주, 클러스터 키를 DATE로 바꾸고 이에 맞게 쿼리
080327 LUJ, 언어에 따라 다른 날짜 표시 형식에 무관하게 쿼리할 날짜를 생성할 수 있도록 함
080404 LUJ, 최대 쿼리 개수를 전송함	
*/
CREATE  PROCEDURE [dbo].[TP_ITEM_OPTION_LOG_SELECT]
(
	@ITEM_DBIDX	INT,
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 ),
	@QUERY_SIZE	INT
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
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--				예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--				사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--				( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--				이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,		@YEAR	- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,		@DAY	- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,		@HOUR	- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR	- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY	- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR	- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END
	
	SELECT	TOP 100
			LOG_IDX,
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
			REINFORCE_CRITICAL_RATE,
			REINFORCE_CRITICAL_DAMAGE,
			REINFORCE_MOVE_SPEED,
			REINFORCE_EVADE,
			REINFORCE_ACCURACY,
			MIX_STRENGTH,
			MIX_INTELLIGENCE,
			MIX_DEXTERITY,
			MIX_WISDOM,
			MIX_VITALITY,
			ENCHANT_INDEX,
			ENCHANT_LEVEL,
			TYPE,
			CONVERT( VARCHAR( 6 ), DATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), DATE, 8 ),
			MEMO,
			@ITEM_DBIDX,
			@END_DATE,
			@QUERY_SIZE
	FROM    TB_ITEM_OPTION_LOG WITH (NOLOCK)
	WHERE   (DATE BETWEEN @BEGIN AND @END) AND
			(ITEM_DBIDX = @ITEM_DBIDX)			
	ORDER BY DATE
	
	SET ROWCOUNT 0
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_ITEM_OPTION_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주, 날짜를 비교하지 않고 쿼리할 수 있도록 로그 인덱스 범위를 알아냄
071211 웅주, 클러스터 키를 DATE로 바꾸고 이에 맞게 쿼리
*/
CREATE  PROCEDURE [dbo].[TP_ITEM_OPTION_LOG_SIZE_SELECT]
(
	@ITEM_DBIDX	INT,
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 )
)
AS
	SET NOCOUNT ON
	
	DECLARE @TEXT VARCHAR( 20 )
	
	SET @TEXT = '20' +
		SUBSTRING( @BEGIN_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @BEGIN_DATE, 3, 2 ) + '-' +
		SUBSTRING( @BEGIN_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @BEGIN_DATE, 8, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 11, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 14, 2 )

	DECLARE @BEGIN DATETIME	
	SET @BEGIN = CAST( @TEXT AS DATETIME )
	
	SET @TEXT = '20' +
		SUBSTRING( @END_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @END_DATE, 3, 2 ) + '-' +
		SUBSTRING( @END_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @END_DATE, 8, 2 ) + ':' +
		SUBSTRING( @END_DATE, 11, 2 ) + ':' +
		SUBSTRING( @END_DATE, 14, 2 )

	DECLARE @END DATETIME	
	SET @END = CAST( @TEXT AS DATETIME )
	
	SELECT  COUNT( 1 ),
			ITEM_DBIDX,
			--MIN( LOG_IDX ),
			--MAX( LOG_IDX )
			@BEGIN_DATE,
			@END_DATE
	FROM    TB_ITEM_OPTION_LOG WITH (NOLOCK)
	WHERE   (DATE BETWEEN @BEGIN AND @END) AND
			(ITEM_DBIDX = @ITEM_DBIDX)
			--(DATE >= @BEGIN) AND
			--(DATE <= @END)
	GROUP BY ITEM_DBIDX
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_ITEM_SHOP_LOG_INSERT]    Script Date: 07/30/2013 15:58:49 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
/*
081013 LUJ, 유료 아이템 구입 로그 삽입
*/
CREATE proc [dbo].[TP_ITEM_SHOP_LOG_INSERT]
(
	@USER_IDX		INT,
	@USER_NAME		VARCHAR( 16 ),
	@ITEM_DBIDX		INT,
	@ITEM_IDX		INT,
	@ITEM_QUANTITY		INT,
	-- 081013 LUJ, 로그 종류
	@TYPE			INT
)
as
	SET NOCOUNT ON

	INSERT INTO DBO.TB_ITEM_SHOP_LOG (
			TYPE,
			USER_IDX,
			USER_ID,
			ITEM_DBIDX,
			ITEM_IDX,
			SIZE )
	VALUES	(
			@TYPE,
			@USER_IDX,
			@USER_NAME,
			@ITEM_DBIDX,
			@ITEM_IDX,
			@ITEM_QUANTITY )
GO
/****** Object:  StoredProcedure [dbo].[TP_ITEM_SHOP_LOG_SELECT]    Script Date: 07/30/2013 15:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080404 LUJ, 유료 아이템 로그를 검색한다
080404 LUJ, 최대 쿼리 개수를 전송함	
*/
CREATE PROCEDURE [dbo].[TP_ITEM_SHOP_LOG_SELECT]
(
	@BEGIN_DATE		VARCHAR( 20 ),
	@END_DATE		VARCHAR( 20 ),
	@REQUEST_TICK	INT,
	@USER_IDX		INT,
	@QUERY_SIZE		INT
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
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--				예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--				사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--				( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--				이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,		@YEAR	- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,		@DAY	- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,		@HOUR	- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR	- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY	- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR	- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END
	
	IF 0 < @USER_IDX
	BEGIN
		SELECT	TOP 100
				LOG_IDX,
				TYPE,
				USER_IDX,
				USER_ID,
				ITEM_IDX,
				ITEM_DBIDX,
				SIZE,
				CONVERT( VARCHAR( 6 ), DATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), DATE, 8 ),
				@END_DATE,
				@REQUEST_TICK AS REQUEST_TICK,
				@USER_IDX,
				@QUERY_SIZE
		FROM    TB_ITEM_SHOP_LOG WITH (NOLOCK)
		WHERE   (DATE BETWEEN @BEGIN AND @END) AND
				(USER_IDX = @USER_IDX)
		ORDER BY DATE
	END
	ELSE
	BEGIN
		SELECT	TOP 100
				LOG_IDX,
				TYPE,
				USER_IDX,
				USER_ID,
				ITEM_IDX,
				ITEM_DBIDX,
				SIZE,
				CONVERT( VARCHAR( 6 ), DATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), DATE, 8 ),
				@END_DATE,
				@REQUEST_TICK AS REQUEST_TICK,
				@USER_IDX,
				@QUERY_SIZE
		FROM    TB_ITEM_SHOP_LOG WITH (NOLOCK)
		WHERE   (DATE BETWEEN @BEGIN AND @END)
		ORDER BY DATE
	END
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_ITEM_SHOP_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080404 LUJ, 유료 아이템 로그 개수를 얻어온다
*/
CREATE PROCEDURE [dbo].[TP_ITEM_SHOP_LOG_SIZE_SELECT]
(
	@BEGIN_DATE		VARCHAR( 20 ),
	@END_DATE		VARCHAR( 20 ),
	@REQUEST_TICK	INT,
	@USER_IDX		INT
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
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--				예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--				사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--				( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--				이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,		@YEAR	- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,		@DAY	- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,		@HOUR	- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR	- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY	- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR	- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END
			
	IF 0 < @USER_IDX
	BEGIN
		SELECT  COUNT( * ) AS SIZE,
				@BEGIN_DATE AS BEGIN_DATE,
				CONVERT( VARCHAR( 6 ), @END, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), @END, 8 ) AS END_DATE,
				@REQUEST_TICK AS REQUEST_TICK,
				@USER_IDX AS USER_IDX
		FROM	TB_ITEM_SHOP_LOG WITH (NOLOCK)
		WHERE	(DATE BETWEEN @BEGIN AND @END) AND
				USER_IDX = @USER_IDX
	END
	ELSE
	BEGIN
		SELECT  COUNT( * ) AS SIZE,
				@BEGIN_DATE AS BEGIN_DATE,
				CONVERT( VARCHAR( 6 ), @END, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), @END, 8 ) AS END_DATE,
				@REQUEST_TICK AS REQUEST_TICK,
				@USER_IDX AS USER_IDX
		FROM	TB_ITEM_SHOP_LOG WITH (NOLOCK)
		WHERE	(DATE BETWEEN @BEGIN AND @END)
	END
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_JOB_LOG_INSERT]    Script Date: 07/30/2013 15:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_JOB_LOG_INSERT]
(
	@CHAR_IDX	INT,
	@CLASS_IDX	INT,
	@JOB_GRADE	INT,
	@JOB_IDX	INT,	
	@MEMO		VARCHAR( 20 )
)
AS	
	SET NOCOUNT ON
	INSERT INTO TB_JOB_LOG
	                (CHAR_IDX, CLASS_IDX, JOB_GRADE, JOB_IDX, MEMO)
	VALUES   (@CHAR_IDX, @CLASS_IDX, @JOB_GRADE, @JOB_IDX, @MEMO)
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_JOB_LOG_SELECT]    Script Date: 07/30/2013 15:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주, 쿼리에 필요한 키를 줄임
071211 웅주, DATE를 클러스터드 인덱스로 바꾸고 이에 맞게 쿼리
080327 LUJ, 언어에 따라 다른 날짜 표시 형식에 무관하게 쿼리할 날짜를 생성할 수 있도록 함
080404 LUJ, 최대 쿼리 개수를 전송함	
*/
CREATE  PROCEDURE [dbo].[TP_JOB_LOG_SELECT]
(
	@CHAR_IDX	INT,
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 ),
	@QUERY_SIZE	INT
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
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--				예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--				사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--				( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--				이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,		@YEAR	- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,		@DAY	- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,		@HOUR	- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR	- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY	- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR	- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END
	
	SELECT	TOP 100
			LOG_IDX,
			CLASS_IDX,
			JOB_GRADE,
			JOB_IDX,
			CONVERT( VARCHAR( 6 ), DATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), DATE, 8 ),
			MEMO,
			@CHAR_IDX,
			@END_DATE,
			@QUERY_SIZE
	FROM    TB_JOB_LOG WITH (NOLOCK)
	WHERE   (DATE BETWEEN @BEGIN AND @END) AND
			(CHAR_IDX = @CHAR_IDX)
	ORDER BY DATE
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_JOB_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주, 날짜를 비교하지 않고 쿼리할 수 있도록 로그 인덱스 범위를 알아냄
071211 웅주, DATE를 클러스터드 인덱스로 바꾸고 이에 맞게 쿼리
*/
CREATE  PROCEDURE [dbo].[TP_JOB_LOG_SIZE_SELECT]
(
	@CHAR_IDX	INT,
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 )
)
AS
	SET NOCOUNT ON
	
	DECLARE @TEXT VARCHAR( 20 )
	
	SET @TEXT = '20' +
		SUBSTRING( @BEGIN_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @BEGIN_DATE, 3, 2 ) + '-' +
		SUBSTRING( @BEGIN_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @BEGIN_DATE, 8, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 11, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 14, 2 )

	DECLARE @BEGIN DATETIME	
	SET @BEGIN = CAST( @TEXT AS DATETIME )
	
	SET @TEXT = '20' +
		SUBSTRING( @END_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @END_DATE, 3, 2 ) + '-' +
		SUBSTRING( @END_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @END_DATE, 8, 2 ) + ':' +
		SUBSTRING( @END_DATE, 11, 2 ) + ':' +
		SUBSTRING( @END_DATE, 14, 2 )

	DECLARE @END DATETIME	
	SET @END = CAST( @TEXT AS DATETIME )
	
	SELECT  COUNT( * ),
			CHAR_IDX,
			--MIN( LOG_IDX ),
			--MAX( LOG_IDX )
			@BEGIN_DATE,
			@END_DATE
	FROM	TB_JOB_LOG WITH (NOLOCK)
	WHERE	(DATE BETWEEN @BEGIN AND @END) AND
			(CHAR_IDX = @CHAR_IDX)			
	GROUP BY CHAR_IDX
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[UP_CHEATE_Log]    Script Date: 07/30/2013 15:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE  proc [dbo].[UP_CHEATE_Log]
(
	@Character_Idx	int,
	@LogType	smallint,
	@Param		money,
	@ItemIdx		int,
	@ItemDBIdx	int
)

as
	Set Nocount on
	Set Xact_Abort on

-- 080511 LUJ, 테이블이 존재하지 않아 아무 일도 처리하지 않도록 함
return

insert tb_logcheat
(
character_idx,
logtype,
Param,
Item_DBIdx,
Item_Idx
)
values
(
@Character_Idx,
@LogType,
@Param,
@ItemDBIdx,
@ItemIdx
)
GO
/****** Object:  StoredProcedure [dbo].[TP_ITEM_LOG_EXTRACT]    Script Date: 07/30/2013 15:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 080114 웅주, TB_ITEMMONEYLOG에서 해당 날짜의 로그를 추출해서 별도의 테이블에 저장한다.
-- 입력양식은 YYYYMMDD
CREATE   PROCEDURE [dbo].[TP_ITEM_LOG_EXTRACT]
(
	@BEGIN_DATE	VARCHAR( 20 )
)
AS

	SET NOCOUNT ON
	
	DECLARE @BEGIN DATETIME
	SET @BEGIN = CAST((  '20' + SUBSTRING( @BEGIN_DATE, 3, 2 ) + '-' + SUBSTRING( @BEGIN_DATE, 5, 2 ) + '-' + SUBSTRING( @BEGIN_DATE, 7, 2 ) + ' 00:00:00' )AS DATETIME )
	
	DECLARE @END DATETIME 
	SET @END = CAST( ( '20' + SUBSTRING( @BEGIN_DATE, 3, 2 ) + '-' + SUBSTRING( @BEGIN_DATE, 5, 2 ) + '-' + SUBSTRING( @BEGIN_DATE, 7, 2 ) + ' 23:59:59' ) AS DATETIME )
	
	SELECT @BEGIN, @END
	DECLARE @MIN_IDX INT
	DECLARE @MAX_IDX INT
	
	SELECT	@MAX_IDX = MAX( LOGIDX ),
			@MIN_IDX = MIN( LOGIDX )
	FROM	TB_LOGITEMMONEY
	WHERE	REGDATE BETWEEN @BEGIN AND @END

	SELECT @MAX_IDX

	IF @MAX_IDX IS NULL
		RETURN
	
	SELECT 2	

	DECLARE @TABLE VARCHAR( 50 )
	SET @TABLE = 'dbo.TB_ITEM_LOG_' + @BEGIN_DATE
	
	DECLARE @SQL VARCHAR( 1000 )
	SET @SQL = 'SELECT * INTO ' + @TABLE + ' FROM TB_LOGITEMMONEY WHERE LOGIDX >= ' + CAST( @MIN_IDX AS VARCHAR( 20 ) ) + ' AND LOGIDX <= ' + CAST( @MAX_IDX AS VARCHAR( 20 ) )

	SELECT @SQL
	
	EXEC( @SQL )
		
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_PLAYER_ITEM_LOG_SELECT]    Script Date: 07/30/2013 15:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주, 쿼리에 필요한 키를 줄임
071206 웅주, 테이블의 인덱스에 맞게 쿼리
*/
CREATE  PROCEDURE [dbo].[TP_PLAYER_ITEM_LOG_SELECT]
(
	@CHAR_IDX	INT,
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 )
	--@BEGIN_LOG_IDX	INT,
	--@END_LOG_IDX	INT,
	--@QUERY_SIZE		INT
)
AS
	SET NOCOUNT ON
	
	DECLARE @TEXT VARCHAR( 20 )
	
	SET @TEXT = '20' +
		SUBSTRING( @BEGIN_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @BEGIN_DATE, 3, 2 ) + '-' +
		SUBSTRING( @BEGIN_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @BEGIN_DATE, 8, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 11, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 14, 2 )

	DECLARE @BEGIN DATETIME	
	SET @BEGIN = CAST( @TEXT AS DATETIME )
	
	SET @TEXT = '20' +
		SUBSTRING( @END_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @END_DATE, 3, 2 ) + '-' +
		SUBSTRING( @END_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @END_DATE, 8, 2 ) + ':' +
		SUBSTRING( @END_DATE, 11, 2 ) + ':' +
		SUBSTRING( @END_DATE, 14, 2 )

	DECLARE @END DATETIME	
	SET @END = CAST( @TEXT AS DATETIME )

	/*
	검색 키가 최소화되고 줄어들고 정렬을 하지 않아 보다 빠르나,
	중복되는 결과가 나올 수 있다. 이는 클라이언트 측에서 
	유니크한 로그인덱스를 구분하도록 하여 해결할 수 있다	
	*/
	SELECT	TOP 100
			LogIdx,
			LogType,
			FromChrIdx,
			FromChrName,
			FromTotalMoney,
			ToChrIdx,
			ToChrName,
			ToTotalMoney,
			ChangeMoney,
			ItemIdx,
			ItemDBIdx,
			ItemDur,
			ItemFromPos, 
	        ItemToPos,
	        CONVERT( VARCHAR( 6 ), REGDATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), REGDATE, 8 ),
	        @END_DATE,
	        @CHAR_IDX	        
	FROM    TB_LOGITEMMONEY WITH (NOLOCK)
	WHERE	( RegDate BETWEEN @BEGIN AND @END) AND
			( ToChrIdx = @CHAR_IDX OR FromChrIdx = @CHAR_IDX)
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_PLAYER_ITEM_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주, 날짜를 비교하지 않고 쿼리할 수 있도록 로그 인덱스 범위를 알아냄
071210 웅주, 클러스터 인덱스인 날짜를 이용해 시간 단위까지 검색하도록 함
*/
CREATE  PROCEDURE [dbo].[TP_PLAYER_ITEM_LOG_SIZE_SELECT]
(
	@CHAR_IDX	INT,
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 )
)
AS
	SET NOCOUNT ON
	
	DECLARE @TEXT VARCHAR( 20 )
	
	SET @TEXT = '20' +
		SUBSTRING( @BEGIN_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @BEGIN_DATE, 3, 2 ) + '-' +
		SUBSTRING( @BEGIN_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @BEGIN_DATE, 8, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 11, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 14, 2 )

	DECLARE @BEGIN DATETIME	
	SET @BEGIN = CAST( @TEXT AS DATETIME )
	
	SET @TEXT = '20' +
		SUBSTRING( @END_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @END_DATE, 3, 2 ) + '-' +
		SUBSTRING( @END_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @END_DATE, 8, 2 ) + ':' +
		SUBSTRING( @END_DATE, 11, 2 ) + ':' +
		SUBSTRING( @END_DATE, 14, 2 )

	DECLARE @END DATETIME	
	SET @END = CAST( @TEXT AS DATETIME )
	
	SELECT  COUNT(1),
			@CHAR_IDX,
			@BEGIN_DATE,
			@END_DATE
	FROM    TB_LOGITEMMONEY WITH (NOLOCK)
	WHERE   (RegDate BETWEEN @BEGIN AND @END) AND
			(FromChrIdx = @CHAR_IDX OR ToChrIdx = @CHAR_IDX)
		
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_MARRIAGE_LOG_INSERT]    Script Date: 07/30/2013 15:58:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_MARRIAGE_LOG_INSERT]
(
	@PlayerID	int,
	@PartnerID	int,
	@Kind		int
)
AS
	SET NOCOUNT ON
	
	INSERT INTO TB_MARRIAGE_LOG 
			(
			PlayerID,
			PartnerID,
			Kind
			)
	VALUES   
			(
			@PlayerID,
			@PartnerID,
			@Kind
			)
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_MONEY_LOG_SELECT]    Script Date: 07/30/2013 15:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
09406 LUJ, 돈 로그 검색
*/
CREATE   PROCEDURE [dbo].[TP_MONEY_LOG_SELECT]
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

	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 시작 날짜를 만든다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 시/분/초 단위로 분리한다
		SET @YEAR = 2000 + CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH = CAST( SUBSTRING( @BEGIN_DATE, 3, 2 ) AS INT )
		SET @DAY = CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR = CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE = CAST( SUBSTRING( @BEGIN_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @BEGIN_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR, @YEAR - DATEPART( YEAR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH, @MONTH - DATEPART( MONTH, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY, @DAY - DATEPART( DAY, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR, @HOUR - DATEPART( HOUR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE, @MINUTE - DATEPART( MINUTE, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND, @SECOND - DATEPART( SECOND, 0 ), @BEGIN )
	END

	DECLARE @END DATETIME
	SET @END = 0

	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻엉矩서, 종료짜를 만든다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 시/분/초 단위로 분리한다
		SET @YEAR = 2000 + CAST( SUBSTRING( @END_DATE, 1, 2 ) AS INT )
		SET @MONTH = CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY = CAST( SUBSTRING( @END_DATE, 5, 2 ) AS INT )
		SET @HOUR = CAST( SUBSTRING( @END_DATE, 8, 2 ) AS INT )
		SET @MINUTE = CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 날짜를 만든다
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
			LOGIDX,
			LOGTYPE,
			CHANGEVALUE,
			CHARNO,
			INVENMONEY,
			TARGETIDX,
			TARGETMONEY,
			CONVERT( VARCHAR( 6 ), LOGDATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), LOGDATE, 8 ),
			@CHAR_IDX,
			@END_DATE,
			@QUERY_SIZE,
			@REQUEST_TICK
		FROM	TB_MONEYLOG WITH (NOLOCK)
		WHERE   LOGDATE BETWEEN @BEGIN AND @END
		ORDER BY LOGDATE
	END
	ELSE
	BEGIN
		SELECT  TOP 100
			LOGIDX,
			LOGTYPE,
			CHANGEVALUE,
			CHARNO,
			INVENMONEY,
			TARGETIDX,
			TARGETMONEY,
			CONVERT( VARCHAR( 6 ), LOGDATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), LOGDATE, 8 ),
			@CHAR_IDX,
			@END_DATE,
			@QUERY_SIZE,
			@REQUEST_TICK
		FROM	TB_MONEYLOG WITH (NOLOCK)
		WHERE   ( LOGDATE BETWEEN @BEGIN AND @END ) AND
			CHARNO = @CHAR_IDX
		ORDER BY LOGDATE
	END
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_MONEY_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:58:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
090406 LUJ, 돈 로그 개수를 얻어온다
*/
CREATE    PROCEDURE [dbo].[TP_MONEY_LOG_SIZE_SELECT]
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

	-- 080327 LUJ, DB가 인식하는 최초 날짜와의 차이를 얻어서, 시작 날짜를 만든다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 시/분/초 단위로 분리한다
		SET @YEAR = 2000 + CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH = CAST( SUBSTRING( @BEGIN_DATE, 3, 2 ) AS INT )
		SET @DAY = CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR = CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE = CAST( SUBSTRING( @BEGIN_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @BEGIN_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR, @YEAR - DATEPART( YEAR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH, @MONTH - DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY, @DAY	- DATEPART( DAY, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR, @HOUR - DATEPART( HOUR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE, @MINUTE - DATEPART( MINUTE, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND, @SECOND - DATEPART( SECOND, 0 ), @BEGIN )
	END

	DECLARE @END DATETIME
	SET @END = 0

	-- 080327 LUJ, DB가 인식하는 최초 날짜와의 차이를 얻엉矩서, 종료날짜를 만든다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 시/분/초 단위로 분리한다
		SET @YEAR = 2000 + CAST( SUBSTRING( @END_DATE, 1, 2 ) AS INT )
		SET @MONTH = CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY = CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR = CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE = CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 날짜를 만든다
		SET @END = DATEADD( YEAR, @YEAR	- DATEPART( YEAR, 0 ), @END )
		SET @END = DATEADD( MONTH, @MONTH - DATEPART( MONTH, 0 ), @END )
		SET @END = DATEADD( DAY, @DAY - DATEPART( DAY, 0 ), @END )
		SET @END = DATEADD( HOUR, @HOUR	- DATEPART( HOUR, 0 ), @END )
		SET @END = DATEADD( MINUTE, @MINUTE - DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND, @SECOND - DATEPART( SECOND,	0 ), @END )
	END

	IF 0 = @CHAR_IDX
	BEGIN
		SELECT  COUNT( CHARNO ),
			@REQUEST_TICK,
			@BEGIN_DATE,
			@END_DATE,
			@CHAR_IDX
		FROM    TB_MONEYLOG WITH (NOLOCK)
		WHERE   (LOGDATE BETWEEN @BEGIN AND @END)
	END
	ELSE
	BEGIN
		SELECT  COUNT( CHARNO ),
			@REQUEST_TICK,
			@BEGIN_DATE,
			@END_DATE,
			@CHAR_IDX
		FROM    TB_MONEYLOG WITH (NOLOCK)
		WHERE   (LOGDATE BETWEEN @BEGIN AND @END) AND
			(CHARNO = @CHAR_IDX)
	END
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[Up_MoneyLog]    Script Date: 07/30/2013 15:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[Up_MoneyLog] 
	( @LogType smallint, @CharNo int, @InvenMoney bigint, @ChangeValue bigint,
	 @TargetID int, @TargetMoney bigint )
as
	Set Nocount on
--	Set Xact_Abort on

insert tb_moneylog
(
LogType,
CharNo,
InvenMoney,
ChangeValue,
TargetIdx,
TargetMoney
)
values
(
@LogType,
@CharNo,
@InvenMoney,
@ChangeValue,
@TargetID,
@TargetMoney
)
GO
/****** Object:  StoredProcedure [dbo].[TP_OPERATOR_LOG_SELECT]    Script Date: 07/30/2013 15:58:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주, 쿼리에 필요한 키를 줄임
071211 웅주, DATE를 클러스터드 인덱스로 바꾸고 이에 맞게 쿼리
080327 LUJ, 언어에 따라 다른 날짜 표시 형식에 무관하게 쿼리할 날짜를 생성할 수 있도록 함
080404 LUJ, 최대 쿼리 개수를 전송함	
*/
CREATE  PROCEDURE [dbo].[TP_OPERATOR_LOG_SELECT]
(
	@BEGIN_DATE		VARCHAR( 20 ),
	@END_DATE		VARCHAR( 20 ),
	@REQUEST_TICK	INT,
	@QUERY_SIZE		INT
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
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--				예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--				사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--				( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--				이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,		@YEAR	- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,		@DAY	- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,		@HOUR	- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR	- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY	- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR	- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END
	
	SELECT	TOP 100
			[INDEX],
			TYPE,
			OPER_ID,
			CONVERT( VARCHAR( 6 ), DATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), DATE, 8 ),
			KEY1,
			VALUE1,
			KEY2,
			VALUE2,
			KEY3,
			VALUE3,
			@END_DATE,
			@REQUEST_TICK,
			@QUERY_SIZE
	FROM    TB_OPERATOR_LOG WITH (NOLOCK)
	WHERE   (DATE BETWEEN @BEGIN AND @END)
	ORDER BY DATE
			
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_OPERATOR_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:58:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080111 웅주, 추가
*/
CREATE PROCEDURE [dbo].[TP_OPERATOR_LOG_SIZE_SELECT]
(
	--@OPER_ID		VARCHAR( 16 ),
	@BEGIN_DATE		VARCHAR( 20 ),
	@END_DATE		VARCHAR( 20 ),
	@REQUEST_TICK	INT
)
AS
	SET NOCOUNT ON
	
	DECLARE @TEXT VARCHAR( 20 )
	
	SET @TEXT = '20' +
		SUBSTRING( @BEGIN_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @BEGIN_DATE, 3, 2 ) + '-' +
		SUBSTRING( @BEGIN_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @BEGIN_DATE, 8, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 11, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 14, 2 )

	DECLARE @BEGIN DATETIME	
	SET @BEGIN = CAST( @TEXT AS DATETIME )
	
	SET @TEXT = '20' +
		SUBSTRING( @END_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @END_DATE, 3, 2 ) + '-' +
		SUBSTRING( @END_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @END_DATE, 8, 2 ) + ':' +
		SUBSTRING( @END_DATE, 11, 2 ) + ':' +
		SUBSTRING( @END_DATE, 14, 2 )
	
	DECLARE @END DATETIME	
	SET @END = CAST( @TEXT AS DATETIME )
	
	SELECT  COUNT( * ),
			--OPER_ID,
			@BEGIN_DATE,
			@END_DATE,
			@REQUEST_TICK
	FROM	TB_OPERATOR_LOG WITH (NOLOCK)
	WHERE	(DATE BETWEEN @BEGIN AND @END)-- AND
			--(OPER_ID = @OPER_ID)
	--GROUP BY OPER_ID
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[UP_ItemRareOptionLog]    Script Date: 07/30/2013 15:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE          proc [dbo].[UP_ItemRareOptionLog]
(
		@Charno	int
	,	@RareOptionIdx	int
	,	@ItemDBIdx	int
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


	insert tb_OptionLog
		(
			CHARNO,
			OPTION_DBIDX,
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
			@Charno,
			@RareOptionIdx,
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
			99999,
			@FireAttrAttack,
			@WaterAttrAttack,
			@TreeAttrAttack,
			@GoldAttrAttack,
			@EarthAttrAttack,
			@PhyDefense
		)
GO
/****** Object:  StoredProcedure [dbo].[UP_ItemOptionLog]    Script Date: 07/30/2013 15:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE         proc [dbo].[UP_ItemOptionLog]
(
		@Charno	int
	,	@OptionDBIdx	int
	,	@ItemDBIdx	int
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


	insert tb_OptionLog
		(
			CHARNO,
			OPTION_DBIDX,
			ITEM_DBIDX, 
			Strength,
			Dexterity,
			Vitality,
			Intelligence,
			Wisdom	,
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
			@Charno,
			@OptionDBIdx,
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
GO
/****** Object:  StoredProcedure [dbo].[TP_PET_LOG_SELECT]    Script Date: 07/30/2013 15:58:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080716 LUJ, 펫 로그를 쿼리
*/
CREATE     PROCEDURE [dbo].[TP_PET_LOG_SELECT]
(
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 ),
	@USER_IDX	INT,
	@PET_IDX	INT,
	@REQUEST_TICK	INT,
	@QUERY_SIZE	INT
)
AS
	SET NOCOUNT ON
	
	DECLARE @YEAR		INT
	DECLARE @MONTH	INT
	DECLARE @DAY		INT
	DECLARE @HOUR		INT
	DECLARE @MINUTE	INT
	DECLARE @SECOND	INT
	
	DECLARE @BEGIN DATETIME
	SET @BEGIN = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--		예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--		사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--		( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--		이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=	CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 	CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=	CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 	CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 	CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,	@YEAR		- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,	@DAY		- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,	@HOUR		- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=	CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 	CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=	CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 	CAST( SUBSTRING( @END_DATE, 11, 2 ) 	AS INT )
		SET @SECOND	= 	CAST( SUBSTRING( @END_DATE, 14, 2 ) 	AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR		- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY		- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR		- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END
	
	IF 0 < @PET_IDX
	BEGIN
		SELECT	TOP 100
			LOG_IDX,
			TYPE,
			CONVERT( VARCHAR( 6 ), DATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), DATE, 8 ),
			MEMO,
			PET_IDX,
			EXPERIENCE,
			FRIENDSHIP,
			GRADE,
			[LEVEL],
			KIND,
			STATE,
			SKILL_SLOT,
			@END_DATE,
			@USER_IDX,
			@PET_IDX,
			@QUERY_SIZE,
			@REQUEST_TICK
		FROM    TB_PET_LOG WITH (NOLOCK)
		WHERE	( DATE BETWEEN @BEGIN AND @END ) AND
			( PET_IDX = @PET_IDX )
		ORDER BY DATE
	END
	ELSE
	BEGIN
		SELECT	TOP 100
			LOG_IDX,
			TYPE,
			CONVERT( VARCHAR( 6 ), DATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), DATE, 8 ),
			MEMO,
			PET_IDX,
			EXPERIENCE,
			FRIENDSHIP,
			GRADE,
			[LEVEL],
			KIND,
			STATE,
			SKILL_SLOT,
			@END_DATE,
			@USER_IDX,
			@PET_IDX,
			@QUERY_SIZE,
			@REQUEST_TICK
		FROM    TB_PET_LOG WITH (NOLOCK)
		WHERE	( DATE BETWEEN @BEGIN AND @END ) AND
			( USER_IDX = @USER_IDX )
		ORDER BY DATE
	END
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_PET_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080716 LUJ, 펫 로그 개수를 얻어낸다
*/
CREATE   PROCEDURE [dbo].[TP_PET_LOG_SIZE_SELECT]
(
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 ),
	@REQUEST_TICK	INT,
	@USER_IDX	INT,
	@PET_IDX	INT
)
AS
	SET NOCOUNT ON
	
	DECLARE @YEAR		INT
	DECLARE @MONTH	INT
	DECLARE @DAY		INT
	DECLARE @HOUR		INT
	DECLARE @MINUTE	INT
	DECLARE @SECOND	INT
	
	DECLARE @BEGIN DATETIME
	SET @BEGIN = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--		예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--		사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--		( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--		이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=	CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 	CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=	CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 	CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 	CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,	@YEAR		- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,	@DAY		- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,	@HOUR		- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=	CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 	CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=	CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 	CAST( SUBSTRING( @END_DATE, 11, 2 ) 	AS INT )
		SET @SECOND	= 	CAST( SUBSTRING( @END_DATE, 14, 2 ) 	AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR		- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY		- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR		- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END

	IF 0 < @PET_IDX
	BEGIN
		SELECT  COUNT( * ),
			@REQUEST_TICK,
			@BEGIN_DATE,
			@END_DATE,
			@USER_IDX,
			@PET_IDX
		FROM	TB_PET_LOG WITH (NOLOCK)
		WHERE	(DATE BETWEEN @BEGIN AND @END) AND
			(PET_IDX = @PET_IDX)
		GROUP BY PET_IDX
	END
	ELSE
	BEGIN
		SELECT  COUNT( * ),
			@REQUEST_TICK,
			@BEGIN_DATE,
			@END_DATE,
			@USER_IDX,
			@PET_IDX
		FROM	TB_PET_LOG WITH (NOLOCK)
		WHERE	(DATE BETWEEN @BEGIN AND @END) AND
			(USER_IDX = @USER_IDX)
		GROUP BY USER_IDX
	END
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[Up_PetLog]    Script Date: 07/30/2013 15:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE       proc [dbo].[Up_PetLog]
(
	@Logtype		int,
	@PetIdx			int,
	@PetSummonItemDBIdx	int,
	@UserIdx		int,
	@CharacterIdx		int,
	@Grade			int,
	@FriendShip		int,
	@Stamina		int,
	@Alive			int
)

as
	Set Nocount on

	insert TB_PetLog
	(
		Logtype, 
		PetIdx,
		PetSummonItemDBIdx,
		UserIdx,
		CharacterIdx,
		Grade,
		FriendShip,
		Stamina,
		Alive,
		LogDate
	) 
	values
	(
		@Logtype,
		@PetIdx,
		@PetSummonItemDBIdx,
		@UserIdx,
		@CharacterIdx,
		@Grade,
		@FriendShip,
		@Stamina,
		@Alive,
		getdate()
	)
GO
/****** Object:  StoredProcedure [dbo].[TP_QUEST_LOG_INSERT]    Script Date: 07/30/2013 15:58:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 071130 웅주 작성
CREATE PROCEDURE [dbo].[TP_QUEST_LOG_INSERT]
(
	@CHAR_IDX		INT,
	@QUEST_MAIN_IDX	INT,
	@QUEST_SUB_IDX	INT,
	@VALUE1			INT,
	@VALUE2			SMALLINT,
	@TYPE			SMALLINT,
	@MEMO			VARCHAR( 16 )
)
AS
	SET NOCOUNT ON
	
	INSERT INTO TB_QUEST_LOG
		(	CHAR_IDX,
			QUEST_MAIN_IDX,
			QUEST_SUB_IDX,
			VALUE1,
			VALUE2,
			TYPE,
			MEMO )
	VALUES	(
		@CHAR_IDX,
		@QUEST_MAIN_IDX,
		@QUEST_SUB_IDX,
		@VALUE1,
		@VALUE2,
		@TYPE,
		@MEMO )
	
	RETURN 



	
	DECLARE @COUNT INT
	SET @COUNT = 0
	
	WHILE @COUNT < 10000
	BEGIN
		EXEC TP_QUEST_LOG_INSERT 813, 0, 1, 1, 2, 101, 'ehei'
		SET @COUNT = @COUNT + 1
	END
GO
/****** Object:  StoredProcedure [dbo].[TP_QUEST_LOG_SELECT]    Script Date: 07/30/2013 15:58:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주 작성
071210 웅주, 클러스터 키를 DATE로 변경하고 이에 맞게 쿼리하도록 함
080327 LUJ, 언어에 따라 다른 날짜 표시 형식에 무관하게 쿼리할 날짜를 생성할 수 있도록 함
080404 LUJ, 최대 쿼리 개수를 전송함	
*/
CREATE  PROCEDURE [dbo].[TP_QUEST_LOG_SELECT]
(
	@CHAR_IDX	INT,
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 ),
	@QUERY_SIZE	INT
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
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--				예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--				사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--				( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--				이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,		@YEAR	- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,		@DAY	- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,		@HOUR	- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR	- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY	- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR	- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END
		
	SELECT	TOP 100
			LOG_IDX,
			QUEST_MAIN_IDX,
			QUEST_SUB_IDX,
			VALUE1,
			VALUE2,
			TYPE,
			CONVERT( VARCHAR( 6 ), DATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), DATE, 8 ),
			MEMO,
			@END_DATE,
			@CHAR_IDX,
			@QUERY_SIZE
	FROM    TB_QUEST_LOG WITH (NOLOCK)
	WHERE	(DATE BETWEEN @BEGIN AND @END) AND
			(CHAR_IDX = @CHAR_IDX)
	ORDER BY DATE
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_QUEST_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:58:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주, 추가
071210 클러스터 키를 DATE로 변경하고 이에 맞게 쿼리를 수정함
*/
CREATE  PROCEDURE [dbo].[TP_QUEST_LOG_SIZE_SELECT]
(
	@CHAR_IDX	INT,	
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 )
)
AS
	SET NOCOUNT ON
	
	DECLARE @TEXT VARCHAR( 20 )
	
	SET @TEXT = '20' +
		SUBSTRING( @BEGIN_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @BEGIN_DATE, 3, 2 ) + '-' +
		SUBSTRING( @BEGIN_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @BEGIN_DATE, 8, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 11, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 14, 2 )

	DECLARE @BEGIN DATETIME	
	SET @BEGIN = CAST( @TEXT AS DATETIME )
	
	SET @TEXT = '20' +
		SUBSTRING( @END_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @END_DATE, 3, 2 ) + '-' +
		SUBSTRING( @END_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @END_DATE, 8, 2 ) + ':' +
		SUBSTRING( @END_DATE, 11, 2 ) + ':' +
		SUBSTRING( @END_DATE, 14, 2 )

	DECLARE @END DATETIME	
	SET @END = CAST( @TEXT AS DATETIME )
	
	SELECT  COUNT(*),
			CHAR_IDX,
			@BEGIN_DATE,
			@END_DATE
	FROM    TB_QUEST_LOG WITH (NOLOCK)
	WHERE   (DATE BETWEEN @BEGIN AND @END) AND
			(CHAR_IDX = @CHAR_IDX)
	GROUP BY CHAR_IDX
		
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_SIEGE_LOG_SELECT]    Script Date: 07/30/2013 15:58:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
081027 LUJ, 공성 로그 
*/
CREATE   PROCEDURE [dbo].[TP_SIEGE_LOG_SELECT]
(
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 ),
	@REQUEST_TICK	INT,
	@QUERY_SIZE	INT
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
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--				예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--				사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--				( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--				이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,		@YEAR	- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,		@DAY	- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,		@HOUR	- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR	- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY	- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR	- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END
	
	SELECT	TOP 100
		LOG_IDX,
		TYPE,
		GUILD_IDX,
		CHAR_IDX,
		MEMO,
		CONVERT( VARCHAR( 6 ), [DATE], 12 ) + ' ' + CONVERT( VARCHAR( 8 ), [DATE], 8 ),
		@END_DATE,
		@QUERY_SIZE,
		@REQUEST_TICK
	FROM	TB_SIEGE_LOG WITH (NOLOCK)
	WHERE   ([DATE] BETWEEN @BEGIN AND @END)
	ORDER BY [DATE]
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_SIEGE_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:58:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
081027 LUJ, 공성 로그 개수 검색
*/
CREATE  PROCEDURE [dbo].[TP_SIEGE_LOG_SIZE_SELECT]
(
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 ),
	@REQUEST_TICK	INT
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
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--				예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--				사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--				( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--				이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,		@YEAR	- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,		@DAY	- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,		@HOUR	- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR	- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY	- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR	- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END
	
	SELECT  COUNT( * ),
		@REQUEST_TICK,
		@BEGIN_DATE,
		@END_DATE
	FROM	TB_SIEGE_LOG WITH (NOLOCK)
	WHERE	([DATE] BETWEEN @BEGIN AND @END)
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_SIEGE_LOG_INSERT]    Script Date: 07/30/2013 15:58:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
081027 LUJ, 공성 로그를 저장한다
*/
CREATE PROCEDURE [dbo].[TP_SIEGE_LOG_INSERT]
(
	@TYPE		INT,
	@GUILD_IDX	INT,
	@CHAR_IDX	INT,
	@MEMO		VARCHAR( 16 )
)
AS
	SET NOCOUNT ON
	
	INSERT INTO TB_SIEGE_LOG (
		TYPE,
		GUILD_IDX,
		CHAR_IDX,
		MEMO  )
	VALUES	(
		@TYPE,
		@GUILD_IDX,
		@CHAR_IDX,
		@MEMO )
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[Up_ToolLog]    Script Date: 07/30/2013 15:59:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROC [dbo].[Up_ToolLog](	@LogType	int, 
				@LogKind	int,
				@OperIdx	int, 
				@OperName	varchar(16), 
				@TargetIdx	int,
				@TargetName	varchar(16),
				@Param1	int,
				@Param2	int,
				@Param3	int,
				@Param4	int	)
as

	Set Nocount on
	Set Xact_Abort on

insert TB_ToolLog
( 
LogType,
LogKind,
OperIdx,
OperName,
TargetIdx,
TargetName,
Param1,
Param2,
Param3,
Param4,
LogDate
)
values
(
@LogType,
@LogKind,
@OperIdx,
@OperName,
@TargetIdx,
@TargetName,
@Param1,
@Param2,
@Param3,
@Param4,
getdate()
)
GO
/****** Object:  StoredProcedure [dbo].[up_ExpPointLog]    Script Date: 07/30/2013 15:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[up_ExpPointLog]
(
		@Logtype	tinyint
	,	@charno	int
	,	@Grade		int

-- 080605 LYW : 경험치 확장(__int32 -> __int64) 에 따른 데이터 타입 수정.
--	,	@Value		int
--	,	@ExpPoint	int
	,	@Value		bigint
	,	@ExpPoint	bigint

	,	@MurderKind	smallint
	,	@MurderIdx	int
	,	@AbilPoint	int
)

as
	Set Nocount on
--	Set Xact_Abort on

	insert tb_ExpPointLog
		(
		LogType,
		charno, 
		Grade, 
		changeValue, 
		exppoint, 
		KillerKind, 
		KillerIdx, 
		abilpoint, 
		logDate
		) 
	values 
		(
		@Logtype,
		@charno, 
		@Grade, 
		@value, 
		@ExpPoint,
		@MurderKind,  
		@MurderIdx, 
		@AbilPoint, 
		getdate()
		)
GO
/****** Object:  StoredProcedure [dbo].[TP_EXP_LOG_SELECT]    Script Date: 07/30/2013 15:58:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 LUJ, 하나의 키로 검색할 수 있도록 개선함
071211 LUJ, 클러스터 키를 DATE로 바꾸고 이에 맞게 쿼리
080327 LUJ, 언어에 따라 다른 날짜 표시 형식에 무관하게 쿼리할 날짜를 생성할 수 있도록 함
080404 LUJ, 최대 쿼리 개수를 전송함	
*/
CREATE  PROC [dbo].[TP_EXP_LOG_SELECT]
(	
	@CHAR_IDX	INT,
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 ),
	@QUERY_SIZE	INT	
)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @YEAR	INT
	DECLARE @MONTH	INT
	DECLARE @DAY	INT
	DECLARE @HOUR	INT
	DECLARE @MINUTE	INT
	DECLARE @SECOND INT
	
	DECLARE @BEGIN DATETIME
	SET @BEGIN = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--				예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--				사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--				( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--				이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,		@YEAR	- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,		@DAY	- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,		@HOUR	- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR	- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY	- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR	- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END
	
	SELECT	TOP 100
			logidx,
			logtype,
			Grade,
			changevalue,
			KillerKind,
			KillerIdx,
			exppoint,
			CONVERT( VARCHAR( 6 ), LOGDATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), LOGDATE, 8 ),
			@CHAR_IDX,
			@END_DATE,
			@QUERY_SIZE,
			AbilPoint
	from	tb_exppointlog WITH (NOLOCK)
	where	(LOGDATE BETWEEN @BEGIN AND @END) AND
			charno = @CHAR_IDX
	ORDER BY LOGDATE
	
	RETURN


/*
-- 080327 이전 쿼리

DECLARE @TEXT VARCHAR( 20 )
	
	SET @TEXT = '20' +
		SUBSTRING( @BEGIN_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @BEGIN_DATE, 3, 2 ) + '-' +
		SUBSTRING( @BEGIN_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @BEGIN_DATE, 8, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 11, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 14, 2 )

	DECLARE @BEGIN DATETIME	
	SET @BEGIN = CAST( @TEXT AS DATETIME )
	
	SET @TEXT = '20' +
		SUBSTRING( @END_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @END_DATE, 3, 2 ) + '-' +
		SUBSTRING( @END_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @END_DATE, 8, 2 ) + ':' +
		SUBSTRING( @END_DATE, 11, 2 ) + ':' +
		SUBSTRING( @END_DATE, 14, 2 )

	DECLARE @END DATETIME	
	SET @END = CAST( @TEXT AS DATETIME )
	
	select	TOP 100
			logidx,
			logtype,
			Grade,
			changevalue,
			KillerKind,
			KillerIdx,
			exppoint,
			CONVERT( VARCHAR( 6 ), LOGDATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), LOGDATE, 8 ),
			--LOGDATE,
			--@END_LOG_IDX,
			@CHAR_IDX,
			@END_DATE
	from tb_exppointlog WITH (NOLOCK)
	where	(LOGDATE BETWEEN @BEGIN AND @END) AND
			charno = @CHAR_IDX
			--logidx > @BEGIN_LOG_IDX			
*/
GO
/****** Object:  StoredProcedure [dbo].[TP_EXP_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:58:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주 수정: 하나의 키로 검색할 수 있도록 개선함
071211 웅주, 클러스터 키를 DATE로 바꾸고 이에 맞게 쿼리
*/
CREATE  PROCEDURE [dbo].[TP_EXP_LOG_SIZE_SELECT]
(
	@CharIdx	int,
	@BEGIN_DATE	varchar(20),
	@END_DATE	varchar(20)
)
AS
	Set Nocount on
	Set Xact_Abort on

	DECLARE @TEXT VARCHAR( 20 )
	
	SET @TEXT = '20' +
		SUBSTRING( @BEGIN_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @BEGIN_DATE, 3, 2 ) + '-' +
		SUBSTRING( @BEGIN_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @BEGIN_DATE, 8, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 11, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 14, 2 )

	DECLARE @BEGIN DATETIME	
	SET @BEGIN = CAST( @TEXT AS DATETIME )
	
	SET @TEXT = '20' +
		SUBSTRING( @END_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @END_DATE, 3, 2 ) + '-' +
		SUBSTRING( @END_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @END_DATE, 8, 2 ) + ':' +
		SUBSTRING( @END_DATE, 11, 2 ) + ':' +
		SUBSTRING( @END_DATE, 14, 2 )

	DECLARE @END DATETIME	
	SET @END = CAST( @TEXT AS DATETIME )
		
	SELECT  COUNT( * ),
			Charno,
			--MIN( LogIdx ),
			--MAX( LogIdx )
			@BEGIN_DATE,
			@END_DATE
	FROM    tb_ExpPointLog WITH (NOLOCK)
	where	(LOGDATE BETWEEN @BEGIN AND @END) AND
			(charno = @CharIdx)
			-- and LogDate >= @SDate and LogDate <= @EDate
	GROUP BY charno
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[up_WrongMoneyLog]    Script Date: 07/30/2013 15:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 돈 관련 로그
CREATE  proc [dbo].[up_WrongMoneyLog]
(
		@Logtype	int
	,	@charno	int
	,	@Value		bigint
	,	@Tmoney	bigint	-- 인벤 소지금
	,	@Pmoney	bigint	-- 표국 소지금
	,	@targetIdx	int
)

as
	Set Nocount on
	Set Xact_Abort on

	insert tb_MoneyLogWrong(Logtype, charno, changeValue, TotalMoney, PyogukMoney, TargetIdx, LogDate) 
	values (@Logtype, @charno, @Value, @Tmoney, @Pmoney, @targetIdx, getDate())
GO
/****** Object:  StoredProcedure [dbo].[up_MungongExpLog]    Script Date: 07/30/2013 15:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 무공 경험치 관련 로그

CREATE proc [dbo].[up_MungongExpLog]
(
		@charno	int
	,	@value		int
	,	@mugongIdx	int
	,	@mugongDBIdx	int
	,	@mugongSung	int
	,	@mugongExp	int
	,	@mugongPos	int
)

as
	Set Nocount on
--	Set Xact_Abort on

	insert tb_MugongExpLog(charno, changeValue, mIdx, mDBIdx, mSung, mExp, mPos, logdate) 
	values (@charno, @value, @mugongIdx, @mugongDBIdx, @mugongSung, @mugongExp, @mugongPos, getdate())
GO
/****** Object:  StoredProcedure [dbo].[up_CharacterLog]    Script Date: 07/30/2013 15:59:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 캐릭터 정보 로그
CREATE  proc [dbo].[up_CharacterLog]
(
		@charno	int
	,	@Grade		int
	,	@Strength	int
	,	@Dexterity		int
	,	@Vitality		int
	,	@Intelligence	int
	,	@Wisdom	int
	,	@Point		int
)

as
	Set Nocount on
	Set Xact_Abort on

	insert tb_characterlog(charno, Grade, Strength, Dexterity, Vitality, Intelligence, Wisdom, point, logdate) 
	values (@charno, @Grade, @Strength, @Dexterity, @Vitality, @Intelligence, @Wisdom, @point, getdate())
GO
/****** Object:  StoredProcedure [dbo].[TP_STAT_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:59:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주, 날짜를 비교하지 않고 쿼리할 수 있도록 로그 인덱스 범위를 알아냄
071211 웅주, 클러스터 키를 DATE로 바꾸고 이에 맞게 쿼리
*/
CREATE  PROCEDURE [dbo].[TP_STAT_LOG_SIZE_SELECT]
(
	@CHAR_IDX	INT,
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 )
)
AS
	SET NOCOUNT ON
	
	DECLARE @TEXT VARCHAR( 20 )
	
	SET @TEXT = '20' +
		SUBSTRING( @BEGIN_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @BEGIN_DATE, 3, 2 ) + '-' +
		SUBSTRING( @BEGIN_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @BEGIN_DATE, 8, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 11, 2 ) + ':' +
		SUBSTRING( @BEGIN_DATE, 14, 2 )

	DECLARE @BEGIN DATETIME	
	SET @BEGIN = CAST( @TEXT AS DATETIME )
	
	SET @TEXT = '20' +
		SUBSTRING( @END_DATE, 1, 2 ) + '-' + 
		SUBSTRING( @END_DATE, 3, 2 ) + '-' +
		SUBSTRING( @END_DATE, 5, 2 ) + ' ' +
		SUBSTRING( @END_DATE, 8, 2 ) + ':' +
		SUBSTRING( @END_DATE, 11, 2 ) + ':' +
		SUBSTRING( @END_DATE, 14, 2 )

	DECLARE @END DATETIME	
	SET @END = CAST( @TEXT AS DATETIME )
	
	SELECT  COUNT( charno ),
			CHARNO,
			--MIN( LogIdx ),
			--MAX( LogIdx )
			@BEGIN_DATE,
			@END_DATE
	FROM    tb_characterLog WITH (NOLOCK)
	WHERE   (LOGDATE BETWEEN @BEGIN AND @END) AND
			(charno = @CHAR_IDX)
			--(LogDate >= @BEGIN) AND
			--(LogDate <= @END)
	GROUP BY CHARNO
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_STAT_LOG_SELECT]    Script Date: 07/30/2013 15:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071129 웅주, 쿼리에 필요한 키를 줄임
071211 웅주, 클러스터 키를 DATE로 바꾸고 이에 맞게 쿼리
080327 LUJ, 언어에 따라 다른 날짜 표시 형식에 무관하게 쿼리할 날짜를 생성할 수 있도록 함
080404 LUJ, 최대 쿼리 개수를 전송함	
*/
CREATE  PROCEDURE [dbo].[TP_STAT_LOG_SELECT]
(
	@CHAR_IDX	INT,
	@BEGIN_DATE	VARCHAR( 20 ),
	@END_DATE	VARCHAR( 20 ),
	@QUERY_SIZE	INT
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
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 시작 날짜를 만든다
	--				예를 들어 현재 환경에서 DB가 인식하는 최초 날짜는 1900-01-01이고, 
	--				사용자가 입력한 쿼리 시작 날짜는 2008-03-31이라 하자. 그리고
	--				( 2008 - 1900 )값을 년으로, ( 3 - 1 )을 월로, ( 31 - 1 )을 기준날짜에 더해준다	
	--				이러면 로케일에 관계없이 쿼리할 날짜를 정확히 얻을 수 있다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @BEGIN_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @BEGIN_DATE, 11, 2 )	AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @BEGIN_DATE, 14, 2 )	AS INT )
		
		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR,		@YEAR	- DATEPART( YEAR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY,		@DAY	- DATEPART( DAY,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR,		@HOUR	- DATEPART( HOUR,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @BEGIN )
	END
	
	DECLARE @END DATETIME
	SET @END = 0
	
	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 종료 날짜를 만든다
	--				사용 이유는 시작 날짜 생성의 주석을 참조하자
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 년/월/일/시/분/초 단위로 분리한다
		SET @YEAR	= 2000 +	CAST( SUBSTRING( @END_DATE, 1, 2 )	AS INT )
		SET @MONTH	=			CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY	= 			CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR	=			CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE	= 			CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND	= 			CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어내서, 날짜를 만든다
		SET @END = DATEADD( YEAR,	@YEAR	- DATEPART( YEAR,	0 ), @END )
		SET @END = DATEADD( MONTH,	@MONTH	- DATEPART( MONTH,	0 ), @END )
		SET @END = DATEADD( DAY,	@DAY	- DATEPART( DAY,	0 ), @END )
		SET @END = DATEADD( HOUR,	@HOUR	- DATEPART( HOUR,	0 ), @END )
		SET @END = DATEADD( MINUTE,	@MINUTE	- DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND,	@SECOND	- DATEPART( SECOND,	0 ), @END )
	END
	
	SELECT  TOP 100
			LogIdx,
			Grade,
			Strength,
			Dexterity,
			Vitality,
			Intelligence,
			Wisdom,
			Point,
			CONVERT( VARCHAR( 6 ), LOGDATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), LOGDATE, 8 ),
			@CHAR_IDX,
			@END_DATE,
			@QUERY_SIZE
	FROM      tb_characterLog WITH (NOLOCK)
	WHERE   (LOGDATE BETWEEN @BEGIN AND @END) AND
			(charno = @CHAR_IDX)
	ORDER BY LOGDATE
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[UP_charrename_log_insert]    Script Date: 07/30/2013 15:59:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UP_charrename_log_insert] 
(
	@character_idx INT ,
	@character_before varchar(16),
	@character_after varchar(16)
)
AS
SET NOCOUNT ON 
	
	INSERT INTO dbo.tb_charrename_log 
	(
		character_idx,
		character_before,
		character_after
	)
	VALUES
	(
		@character_idx,
		@character_before,
		@character_after
	)
GO
/****** Object:  StoredProcedure [dbo].[up_MugongLog]    Script Date: 07/30/2013 15:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[up_MugongLog]
(
		@logtype	int
	,	@charno	int
	,	@mugongidx	int
	,	@mugongDBidx	int
	,	@grade		int
	,	@exp		int
)

as
	Set Nocount on
	Set Xact_Abort on

	insert tb_mugongLog(logtype, charno, mugongIdx, mugongDBIdx, mugongGrade, mugongExp, logdate) 
	values (@logtype, @charno, @mugongidx, @mugongDBidx, @grade, @exp, getdate())
GO
/****** Object:  StoredProcedure [dbo].[MP_Protocol_Log]    Script Date: 07/30/2013 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MP_Protocol_Log]
(
	@Character_idx	int,
	@Time			int,
	@Protocol_1		int,
	@Protocol_2		int,
	@Protocol_3		int,
	@Protocol_4		int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT EXISTS ( SELECT NULL FROM dbo.TB_Protocol_Log WHERE Character_Idx = @Character_Idx )
	BEGIN
		INSERT	TB_Protocol_Log
		(
		Character_Idx,
		Start_Time,
		Last_Time,
		Protocol1_Count,
		Protocol2_Count,
		Protocol3_Count,
		Protocol4_Count
		)
		VALUES
		(
		@Character_Idx,
		@Time,
		@Time,
		@Protocol_1,
		@Protocol_2,
		@Protocol_3,
		@Protocol_4
		)
	END
	ELSE
	BEGIN
		UPDATE	TB_Protocol_Log
		SET
		Last_Time = @Time,
		Protocol1_Count = Protocol1_Count + @Protocol_1,
		Protocol2_Count = Protocol2_Count + @Protocol_2,
		Protocol3_Count = Protocol3_Count + @Protocol_3,
		Protocol4_Count = Protocol4_Count + @Protocol_4
		WHERE
		Character_Idx = @Character_Idx
	END

END
GO
/****** Object:  StoredProcedure [dbo].[TP_AUTONOTE_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:58:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_AUTONOTE_LOG_SIZE_SELECT]
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

	-- 080327 LUJ, DB가 인식하는 최초 날짜와의 차이를 얻어서, 시작 날짜를 만든다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 시/분/초 단위로 분리한다
		SET @YEAR = 2000 + CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH = CAST( SUBSTRING( @BEGIN_DATE, 3, 2 ) AS INT )
		SET @DAY = CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR = CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE = CAST( SUBSTRING( @BEGIN_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @BEGIN_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR, @YEAR - DATEPART( YEAR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH, @MONTH - DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY, @DAY	- DATEPART( DAY, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR, @HOUR - DATEPART( HOUR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE, @MINUTE - DATEPART( MINUTE, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND, @SECOND - DATEPART( SECOND, 0 ), @BEGIN )
	END

	DECLARE @END DATETIME
	SET @END = 0

	-- 080327 LUJ, DB가 인식하는 최초 날짜와의 차이를 얻어서, 종료날짜를 만든다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 시/분/초 단위로 분리한다
		SET @YEAR = 2000 + CAST( SUBSTRING( @END_DATE, 1, 2 ) AS INT )
		SET @MONTH = CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY = CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR = CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE = CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 날짜를 만든다
		SET @END = DATEADD( YEAR, @YEAR	- DATEPART( YEAR, 0 ), @END )
		SET @END = DATEADD( MONTH, @MONTH - DATEPART( MONTH, 0 ), @END )
		SET @END = DATEADD( DAY, @DAY - DATEPART( DAY, 0 ), @END )
		SET @END = DATEADD( HOUR, @HOUR	- DATEPART( HOUR, 0 ), @END )
		SET @END = DATEADD( MINUTE, @MINUTE - DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND, @SECOND - DATEPART( SECOND,	0 ), @END )
	END

	IF 0 = @CHAR_IDX
	BEGIN
		SELECT  COUNT( LOGTYPE ),
			@REQUEST_TICK,
			@BEGIN_DATE,
			@END_DATE,
			@CHAR_IDX
		FROM    TB_AUTONOTE_LOG WITH (NOLOCK)
		WHERE   (REGDATE BETWEEN @BEGIN AND @END)
	END
	ELSE
	BEGIN
		SELECT  COUNT( LOGTYPE ),
			@REQUEST_TICK,
			@BEGIN_DATE,
			@END_DATE,
			@CHAR_IDX
		FROM    TB_AUTONOTE_LOG WITH (NOLOCK)
		WHERE   (REGDATE BETWEEN @BEGIN AND @END) AND
			(FROMCHRIDX = @CHAR_IDX OR TOCHRIDX = @CHAR_IDX)
	END
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_AUTONOTE_LOG_SELECT]    Script Date: 07/30/2013 15:58:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_AUTONOTE_LOG_SELECT]

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

	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 시작 날짜를 만든다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 시/분/초 단위로 분리한다
		SET @YEAR = 2000 + CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH = CAST( SUBSTRING( @BEGIN_DATE, 3, 2 ) AS INT )
		SET @DAY = CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR = CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE = CAST( SUBSTRING( @BEGIN_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @BEGIN_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR, @YEAR - DATEPART( YEAR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH, @MONTH - DATEPART( MONTH, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY, @DAY - DATEPART( DAY, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR, @HOUR - DATEPART( HOUR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE, @MINUTE - DATEPART( MINUTE, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND, @SECOND - DATEPART( SECOND, 0 ), @BEGIN )
	END

	DECLARE @END DATETIME
	SET @END = 0

	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 종료날짜를 만든다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 시/분/초 단위로 분리한다
		SET @YEAR = 2000 + CAST( SUBSTRING( @END_DATE, 1, 2 ) AS INT )
		SET @MONTH = CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY = CAST( SUBSTRING( @END_DATE, 5, 2 ) AS INT )
		SET @HOUR = CAST( SUBSTRING( @END_DATE, 8, 2 ) AS INT )
		SET @MINUTE = CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 날짜를 만든다
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
			LOGIDX,
			LOGTYPE,
			FROMCHRIDX,
			FROMCHRNAME,
			TOCHRIDX,
			TOCHRNAME,
			CONVERT( VARCHAR( 6 ), REGDATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), REGDATE, 8 ),
			@END_DATE,
			@QUERY_SIZE,
			@REQUEST_TICK
		FROM	TB_AUTONOTE_LOG WITH (NOLOCK)
		WHERE   REGDATE BETWEEN @BEGIN AND @END
		ORDER BY REGDATE
	END
	ELSE
	BEGIN
		SELECT  TOP 100
			LOGIDX,
			LOGTYPE,
			FROMCHRIDX,
			FROMCHRNAME,
			TOCHRIDX,
			TOCHRNAME,
			CONVERT( VARCHAR( 6 ), REGDATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), REGDATE, 8 ),
			@END_DATE,
			@QUERY_SIZE,
			@REQUEST_TICK
		FROM	TB_AUTONOTE_LOG WITH (NOLOCK)
		WHERE   ( REGDATE BETWEEN @BEGIN AND @END ) AND
			(FROMCHRIDX = @CHAR_IDX OR TOCHRIDX = @CHAR_IDX)
		ORDER BY REGDATE
	END
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[UP_AUTONOTELOG]    Script Date: 07/30/2013 15:59:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UP_AUTONOTELOG]
	(
		@LOGTYPE SMALLINT,
		@FROMCHRIDX INT,
		@FROMCHRNAME VARCHAR(16),
		@TOCHRIDX INT,
		@TOCHRNAME VARCHAR(16)
	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	INSERT TB_AUTONOTE_LOG(LOGTYPE, FROMCHRIDX, FROMCHRNAME, TOCHRIDX, TOCHRNAME, REGDATE)
	VALUES (@LOGTYPE, @FROMCHRIDX, @FROMCHRNAME, @TOCHRIDX, @TOCHRNAME, GETDATE())
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_HOUSE_LOG_SELECT]    Script Date: 07/30/2013 15:58:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_HOUSE_LOG_SELECT]
(
	@BEGIN_DATE VARCHAR( 20 ),
	@END_DATE VARCHAR( 20 ),
	@USER_IDX INT,
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

	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 시작 날짜를 만든다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 시/분/초 단위로 분리한다
		SET @YEAR = 2000 + CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH = CAST( SUBSTRING( @BEGIN_DATE, 3, 2 ) AS INT )
		SET @DAY = CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR = CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE = CAST( SUBSTRING( @BEGIN_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @BEGIN_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR, @YEAR - DATEPART( YEAR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH, @MONTH - DATEPART( MONTH, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY, @DAY - DATEPART( DAY, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR, @HOUR - DATEPART( HOUR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE, @MINUTE - DATEPART( MINUTE, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND, @SECOND - DATEPART( SECOND, 0 ), @BEGIN )
	END

	DECLARE @END DATETIME
	SET @END = 0

	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 종료날짜를 만든다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 시/분/초 단위로 분리한다
		SET @YEAR = 2000 + CAST( SUBSTRING( @END_DATE, 1, 2 ) AS INT )
		SET @MONTH = CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY = CAST( SUBSTRING( @END_DATE, 5, 2 ) AS INT )
		SET @HOUR = CAST( SUBSTRING( @END_DATE, 8, 2 ) AS INT )
		SET @MINUTE = CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 날짜를 만든다
		SET @END = DATEADD( YEAR, @YEAR	- DATEPART( YEAR, 0 ), @END )
		SET @END = DATEADD( MONTH, @MONTH - DATEPART( MONTH, 0 ), @END )
		SET @END = DATEADD( DAY, @DAY - DATEPART( DAY, 0 ), @END )
		SET @END = DATEADD( HOUR, @HOUR	- DATEPART( HOUR, 0 ), @END )
		SET @END = DATEADD( MINUTE, @MINUTE - DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND, @SECOND - DATEPART( SECOND,	0 ), @END )
	END

	IF 0 = @USER_IDX
	BEGIN
		SELECT  TOP 100
			@REQUEST_TICK,
			LOG_IDX,
			OWNER_INDEX,
			CHARNAME,
			LOGTYPE,
			ITEM_INDEX,
			ITEMDB_INDEX,
			FURNITURE_INDEX,
			SLOT,
			HOUSENAME,
			DECO_POINT,
			HOUSE_POINT,
			CONVERT( VARCHAR( 6 ), UPDATETIME, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), UPDATETIME, 8 ),
			@END_DATE,
			@USER_IDX,
			@QUERY_SIZE
		FROM	TB_HOUSING_LOG WITH (NOLOCK)
		WHERE   UPDATETIME BETWEEN @BEGIN AND @END
		ORDER BY UPDATETIME
	END
	ELSE
	BEGIN
		SELECT  TOP 100
			@REQUEST_TICK,
			LOG_IDX,
			OWNER_INDEX,
			CHARNAME,
			LOGTYPE,
			ITEM_INDEX,
			ITEMDB_INDEX,
			FURNITURE_INDEX,
			SLOT,
			HOUSENAME,
			DECO_POINT,
			HOUSE_POINT,
			CONVERT( VARCHAR( 6 ), UPDATETIME, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), UPDATETIME, 8 ),
			@END_DATE,
			@USER_IDX,
			@QUERY_SIZE
		FROM	TB_HOUSING_LOG WITH (NOLOCK)
		WHERE   ( UPDATETIME BETWEEN @BEGIN AND @END ) AND
			(OWNER_INDEX = @USER_IDX)
		ORDER BY UPDATETIME
	END
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_HOUSE_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:58:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_HOUSE_LOG_SIZE_SELECT]
(
	@BEGIN_DATE VARCHAR( 20 ),
	@END_DATE VARCHAR( 20 ),
	@USER_IDX INT,
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

	-- 080327 LUJ, DB가 인식하는 최초 날짜와의 차이를 얻어서, 시작 날짜를 만든다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 시/분/초 단위로 분리한다
		SET @YEAR = 2000 + CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH = CAST( SUBSTRING( @BEGIN_DATE, 3, 2 ) AS INT )
		SET @DAY = CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR = CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE = CAST( SUBSTRING( @BEGIN_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @BEGIN_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR, @YEAR - DATEPART( YEAR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH, @MONTH - DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY, @DAY	- DATEPART( DAY, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR, @HOUR - DATEPART( HOUR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE, @MINUTE - DATEPART( MINUTE, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND, @SECOND - DATEPART( SECOND, 0 ), @BEGIN )
	END

	DECLARE @END DATETIME
	SET @END = 0

	-- 080327 LUJ, DB가 인식하는 최초 날짜와의 차이를 얻어서, 종료날짜를 만든다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 시/분/초 단위로 분리한다
		SET @YEAR = 2000 + CAST( SUBSTRING( @END_DATE, 1, 2 ) AS INT )
		SET @MONTH = CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY = CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR = CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE = CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 날짜를 만든다
		SET @END = DATEADD( YEAR, @YEAR	- DATEPART( YEAR, 0 ), @END )
		SET @END = DATEADD( MONTH, @MONTH - DATEPART( MONTH, 0 ), @END )
		SET @END = DATEADD( DAY, @DAY - DATEPART( DAY, 0 ), @END )
		SET @END = DATEADD( HOUR, @HOUR	- DATEPART( HOUR, 0 ), @END )
		SET @END = DATEADD( MINUTE, @MINUTE - DATEPART( MINUTE,	0 ), @END )
		SET @END = DATEADD( SECOND, @SECOND - DATEPART( SECOND,	0 ), @END )
	END

	IF 0 = @USER_IDX
	BEGIN
		SELECT  COUNT( 1 ),
			@REQUEST_TICK,
			@BEGIN_DATE,
			@END_DATE,
			@USER_IDX
		FROM    TB_HOUSING_LOG WITH (NOLOCK)
		WHERE   (UPDATETIME BETWEEN @BEGIN AND @END)
	END
	ELSE
	BEGIN
		SELECT  COUNT( 1 ),
			@REQUEST_TICK,
			@BEGIN_DATE,
			@END_DATE,
			@USER_IDX
		FROM    TB_HOUSING_LOG WITH (NOLOCK)
		WHERE   (UPDATETIME BETWEEN @BEGIN AND @END) AND
			(OWNER_INDEX = @USER_IDX)
	END
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_COOK_LOG_SELECT]    Script Date: 07/30/2013 15:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_COOK_LOG_SELECT]

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

	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 시작 날짜를 만든다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 시/분/초 단위로 분리한다
		SET @YEAR = 2000 + CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH = CAST( SUBSTRING( @BEGIN_DATE, 3, 2 ) AS INT )
		SET @DAY = CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR = CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE = CAST( SUBSTRING( @BEGIN_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @BEGIN_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR, @YEAR - DATEPART( YEAR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH, @MONTH - DATEPART( MONTH, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY, @DAY - DATEPART( DAY, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR, @HOUR - DATEPART( HOUR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE, @MINUTE - DATEPART( MINUTE, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND, @SECOND - DATEPART( SECOND, 0 ), @BEGIN )
	END

	DECLARE @END DATETIME
	SET @END = 0

	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 종료날짜를 만든다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 시/분/초 단위로 분리한다
		SET @YEAR = 2000 + CAST( SUBSTRING( @END_DATE, 1, 2 ) AS INT )
		SET @MONTH = CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY = CAST( SUBSTRING( @END_DATE, 5, 2 ) AS INT )
		SET @HOUR = CAST( SUBSTRING( @END_DATE, 8, 2 ) AS INT )
		SET @MINUTE = CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 날짜를 만든다
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
			@REQUEST_TICK,
			LOG_IDX,
			CHARACTER_IDX,
			KIND,
			ITEMIDX,
			BEFOREVALUE,
			DIFFVALUE,
			AFTERVALUE,
			CONVERT( VARCHAR( 6 ), LASTDATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), LASTDATE, 8 ),
			@END_DATE,
			@CHAR_IDX,
			@QUERY_SIZE
		FROM	TB_COOKING_LOG WITH (NOLOCK)
		WHERE   LASTDATE BETWEEN @BEGIN AND @END
		ORDER BY LASTDATE
	END
	ELSE
	BEGIN
		SELECT  TOP 100
			@REQUEST_TICK,
			LOG_IDX,
			CHARACTER_IDX,
			KIND,
			ITEMIDX,
			BEFOREVALUE,
			DIFFVALUE,
			AFTERVALUE,
			CONVERT( VARCHAR( 6 ), LASTDATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), LASTDATE, 8 ),
			@END_DATE,
			@CHAR_IDX,
			@QUERY_SIZE
		FROM	TB_COOKING_LOG WITH (NOLOCK)
		WHERE   ( LASTDATE BETWEEN @BEGIN AND @END ) AND
			(CHARACTER_IDX = @CHAR_IDX)
		ORDER BY LASTDATE
	END
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_COOK_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_COOK_LOG_SIZE_SELECT]
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

	-- 080327 LUJ, DB가 인식하는 최초 날짜와의 차이를 얻어서, 시작 날짜를 만든다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 시/분/초 단위로 분리한다
		SET @YEAR = 2000 + CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH = CAST( SUBSTRING( @BEGIN_DATE, 3, 2 ) AS INT )
		SET @DAY = CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR = CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE = CAST( SUBSTRING( @BEGIN_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @BEGIN_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR, @YEAR - DATEPART( YEAR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH, @MONTH - DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY, @DAY	- DATEPART( DAY, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR, @HOUR - DATEPART( HOUR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE, @MINUTE - DATEPART( MINUTE, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND, @SECOND - DATEPART( SECOND, 0 ), @BEGIN )
	END

	DECLARE @END DATETIME
	SET @END = 0

	-- 080327 LUJ, DB가 인식하는 최초 날짜와의 차이를 얻어서, 종료날짜를 만든다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 시/분/초 단위로 분리한다
		SET @YEAR = 2000 + CAST( SUBSTRING( @END_DATE, 1, 2 ) AS INT )
		SET @MONTH = CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY = CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR = CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE = CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 날짜를 만든다
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
		FROM    TB_COOKING_LOG WITH (NOLOCK)
		WHERE   (LASTDATE BETWEEN @BEGIN AND @END)
	END
	ELSE
	BEGIN
		SELECT  COUNT( 1 ),
			@REQUEST_TICK,
			@BEGIN_DATE,
			@END_DATE,
			@CHAR_IDX
		FROM    TB_COOKING_LOG WITH (NOLOCK)
		WHERE   (LASTDATE BETWEEN @BEGIN AND @END) AND
			(CHARACTER_IDX = @CHAR_IDX)
	END
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_RECIPE_LOG_SIZE_SELECT]    Script Date: 07/30/2013 15:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_RECIPE_LOG_SIZE_SELECT]
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

	-- 080327 LUJ, DB가 인식하는 최초 날짜와의 차이를 얻어서, 시작 날짜를 만든다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 시/분/초 단위로 분리한다
		SET @YEAR = 2000 + CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH = CAST( SUBSTRING( @BEGIN_DATE, 3, 2 ) AS INT )
		SET @DAY = CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR = CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE = CAST( SUBSTRING( @BEGIN_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @BEGIN_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR, @YEAR - DATEPART( YEAR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH, @MONTH - DATEPART( MONTH,	0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY, @DAY	- DATEPART( DAY, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR, @HOUR - DATEPART( HOUR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE, @MINUTE - DATEPART( MINUTE, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND, @SECOND - DATEPART( SECOND, 0 ), @BEGIN )
	END

	DECLARE @END DATETIME
	SET @END = 0

	-- 080327 LUJ, DB가 인식하는 최초 날짜와의 차이를 얻어서, 종료날짜를 만든다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 시/분/초 단위로 분리한다
		SET @YEAR = 2000 + CAST( SUBSTRING( @END_DATE, 1, 2 ) AS INT )
		SET @MONTH = CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY = CAST( SUBSTRING( @END_DATE, 5, 2 )	AS INT )
		SET @HOUR = CAST( SUBSTRING( @END_DATE, 8, 2 )	AS INT )
		SET @MINUTE = CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 날짜를 만든다
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
		FROM    TB_COOKRECIPE_LOG WITH (NOLOCK)
		WHERE   (LASTDATE BETWEEN @BEGIN AND @END)
	END
	ELSE
	BEGIN
		SELECT  COUNT( 1 ),
			@REQUEST_TICK,
			@BEGIN_DATE,
			@END_DATE,
			@CHAR_IDX
		FROM    TB_COOKRECIPE_LOG WITH (NOLOCK)
		WHERE   (LASTDATE BETWEEN @BEGIN AND @END) AND
			(CHARACTER_IDX = @CHAR_IDX)
	END
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_RECIPE_LOG_SELECT]    Script Date: 07/30/2013 15:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TP_RECIPE_LOG_SELECT]

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

	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 시작 날짜를 만든다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 시/분/초 단위로 분리한다
		SET @YEAR = 2000 + CAST( SUBSTRING( @BEGIN_DATE, 1, 2 )	AS INT )
		SET @MONTH = CAST( SUBSTRING( @BEGIN_DATE, 3, 2 ) AS INT )
		SET @DAY = CAST( SUBSTRING( @BEGIN_DATE, 5, 2 )	AS INT )
		SET @HOUR = CAST( SUBSTRING( @BEGIN_DATE, 8, 2 )	AS INT )
		SET @MINUTE = CAST( SUBSTRING( @BEGIN_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @BEGIN_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 날짜를 만든다
		SET @BEGIN = DATEADD( YEAR, @YEAR - DATEPART( YEAR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MONTH, @MONTH - DATEPART( MONTH, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( DAY, @DAY - DATEPART( DAY, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( HOUR, @HOUR - DATEPART( HOUR, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( MINUTE, @MINUTE - DATEPART( MINUTE, 0 ), @BEGIN )
		SET @BEGIN = DATEADD( SECOND, @SECOND - DATEPART( SECOND, 0 ), @BEGIN )
	END

	DECLARE @END DATETIME
	SET @END = 0

	-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 종료날짜를 만든다
	BEGIN
		-- 080327 LUJ, 날짜 문자열을 시/분/초 단위로 분리한다
		SET @YEAR = 2000 + CAST( SUBSTRING( @END_DATE, 1, 2 ) AS INT )
		SET @MONTH = CAST( SUBSTRING( @END_DATE, 3, 2 )	AS INT )
		SET @DAY = CAST( SUBSTRING( @END_DATE, 5, 2 ) AS INT )
		SET @HOUR = CAST( SUBSTRING( @END_DATE, 8, 2 ) AS INT )
		SET @MINUTE = CAST( SUBSTRING( @END_DATE, 11, 2 ) AS INT )
		SET @SECOND = CAST( SUBSTRING( @END_DATE, 14, 2 ) AS INT )

		-- 080327 LUJ,	DB가 인식하는 최초 날짜와의 차이를 얻어서, 날짜를 만든다
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
			@REQUEST_TICK,
			LOG_IDX,
			CHARACTER_IDX,
			RECIPE_IDX,
			SLOT,
			KIND,
			REMAINTIME,
			CONVERT( VARCHAR( 6 ), LASTDATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), LASTDATE, 8 ),
			@END_DATE,
			@CHAR_IDX,
			@QUERY_SIZE
		FROM	TB_COOKRECIPE_LOG WITH (NOLOCK)
		WHERE   LASTDATE BETWEEN @BEGIN AND @END
		ORDER BY LASTDATE
	END
	ELSE
	BEGIN
		SELECT  TOP 100
			@REQUEST_TICK,
			LOG_IDX,
			CHARACTER_IDX,
			RECIPE_IDX,
			SLOT,
			KIND,
			REMAINTIME,
			CONVERT( VARCHAR( 6 ), LASTDATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), LASTDATE, 8 ),
			@END_DATE,
			@CHAR_IDX,
			@QUERY_SIZE
		FROM	TB_COOKRECIPE_LOG WITH (NOLOCK)
		WHERE   ( LASTDATE BETWEEN @BEGIN AND @END ) AND
			(CHARACTER_IDX = @CHAR_IDX)
		ORDER BY LASTDATE
	END
	RETURN
GO
