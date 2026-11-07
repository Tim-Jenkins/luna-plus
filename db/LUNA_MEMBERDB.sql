USE [LUNA_MEMBERDB]
GO
/****** Object:  Table [dbo].[Play_time_static]    Script Date: 07/30/2013 16:05:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Play_time_static](
	[idx] [int] IDENTITY(1,1) NOT NULL,
	[check_time] [datetime] NULL,
	[min5] [int] NULL,
	[min15] [int] NULL,
	[min30] [int] NULL,
	[time1] [int] NULL,
	[time2] [int] NULL,
	[time3] [int] NULL,
	[time4] [int] NULL,
	[time5] [int] NULL,
	[time6] [int] NULL,
	[time7] [int] NULL,
	[time10] [int] NULL,
	[time20] [int] NULL,
	[elsetime] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REF_IPLIST]    Script Date: 07/30/2013 16:05:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REF_IPLIST](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fromip] [varchar](15) NOT NULL,
	[toip] [varchar](15) NOT NULL,
	[fchk] [bigint] NOT NULL,
	[tchk] [bigint] NOT NULL,
	[cnt] [varchar](3) NULL,
	[country] [varchar](40) NULL,
 CONSTRAINT [PK_REF_IPLIST] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_OPERATOR]    Script Date: 07/30/2013 16:05:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_OPERATOR](
	[OperIdx] [int] IDENTITY(1,1) NOT NULL,
	[OperId] [varchar](17) NOT NULL,
	[OperName] [varchar](17) NOT NULL,
	[OperPwd] [varchar](17) NOT NULL,
	[OperPower] [int] NOT NULL,
	[OperRegDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_TB_OPERATOR] PRIMARY KEY CLUSTERED 
(
	[OperIdx] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_OPERATOR_AUTHORITY]    Script Date: 07/30/2013 16:05:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_OPERATOR_AUTHORITY](
	[POWER] [smallint] NOT NULL,
	[TYPE] [int] NOT NULL,
	[ATTRIBUTE] [varchar](16) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_OPERIP]    Script Date: 07/30/2013 16:05:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_OPERIP](
	[IpIdx] [int] IDENTITY(1,1) NOT NULL,
	[IpAdress] [varchar](17) NOT NULL,
	[IpRegDate] [smalldatetime] NULL CONSTRAINT [DF_TB_OPERIP_IpRegDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_TB_OPERIP] PRIMARY KEY CLUSTERED 
(
	[IpIdx] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_Operator_log]    Script Date: 07/30/2013 16:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Operator_log](
	[num] [int] IDENTITY(1,1) NOT NULL,
	[id] [varchar](20) NULL,
	[ip] [varchar](15) NULL,
	[regdate] [datetime] NULL CONSTRAINT [DF_tb_operator_log_regdate]  DEFAULT (getdate())
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_PUNISHCOUNT]    Script Date: 07/30/2013 16:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_PUNISHCOUNT](
	[user_idx] [int] NOT NULL,
	[punish_kind] [smallint] NOT NULL,
	[reg_date] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_PUNISHLIST]    Script Date: 07/30/2013 16:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_PUNISHLIST](
	[user_idx] [int] NOT NULL,
	[punish_kind] [smallint] NOT NULL,
	[punish_time] [int] NOT NULL,
	[reg_date] [smalldatetime] NOT NULL,
 CONSTRAINT [IX_user_idx_punish_kind] UNIQUE NONCLUSTERED 
(
	[user_idx] ASC,
	[punish_kind] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_PermitIP]    Script Date: 07/30/2013 16:05:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_PermitIP](
	[Idx] [int] IDENTITY(1,1) NOT NULL,
	[IP] [varchar](15) NOT NULL,
 CONSTRAINT [PK_TB_PermitIP] PRIMARY KEY CLUSTERED 
(
	[Idx] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_ULD_ULF]    Script Date: 07/30/2013 16:05:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_ULD_ULF](
	[user_idx] [int] NULL,
	[id_loginid] [char](20) NULL,
	[type] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[chr_log_info_plus]    Script Date: 07/30/2013 16:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[chr_log_info_plus](
	[id_idx] [int] IDENTITY(1,1) NOT NULL,
	[id_loginid] [varchar](20) NULL,
	[id_pw_Q] [varchar](150) NOT NULL,
	[id_pw_A] [varchar](150) NOT NULL,
	[id_name] [varchar](20) NOT NULL,
	[id_jumin] [char](14) NOT NULL,
	[id_tel] [varchar](14) NULL,
	[id_hp] [varchar](14) NULL CONSTRAINT [DF_chr_log_info_plus_id_hp]  DEFAULT ('--'),
	[id_zipcode] [char](7) NULL,
	[id_addr1] [varchar](150) NULL,
	[id_addr2] [varchar](150) NULL,
	[id_email] [varchar](100) NOT NULL,
	[id_mailing] [char](2) NOT NULL CONSTRAINT [DF_chr_log_info_plus_id_mailing]  DEFAULT ((0)),
	[id_intro] [text] NOT NULL,
	[id_ip] [varchar](39) NULL,
	[admin_check] [tinyint] NOT NULL CONSTRAINT [DF_chr_log_info_plus_admin_check]  DEFAULT ((0)),
	[id_change] [smallint] NOT NULL CONSTRAINT [DF_chr_log_info_plus_id_change]  DEFAULT ((0)),
	[id_language] [varchar](60) NOT NULL CONSTRAINT [DF_chr_log_info_plus_id_language]  DEFAULT ('kr'),
	[Point_Total] [int] NOT NULL CONSTRAINT [DF_chr_log_info_plus_Point_Total]  DEFAULT ((0)),
	[web_name] [varchar](50) NOT NULL CONSTRAINT [DF_chr_log_info_plus_web_name]  DEFAULT ('n'),
	[CPU] [varchar](100) NOT NULL,
	[VGA] [varchar](100) NOT NULL,
	[OS] [varchar](100) NOT NULL,
	[RAM] [varchar](100) NOT NULL,
	[DX] [varchar](100) NOT NULL,
	[SOUND] [varchar](100) NOT NULL,
	[myphoto] [varchar](30) NULL,
 CONSTRAINT [IX_chr_log_info_plus] UNIQUE NONCLUSTERED 
(
	[id_loginid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[event20080925_LongTimePoint]    Script Date: 07/30/2013 16:05:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[event20080925_LongTimePoint](
	[idx] [int] IDENTITY(1,1) NOT NULL,
	[propid] [int] NULL,
	[login_id] [varchar](50) NULL,
	[xp] [int] NULL,
	[pt] [int] NULL,
	[regdate] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[event20080925_LongTimePoint_LOG]    Script Date: 07/30/2013 16:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[event20080925_LongTimePoint_LOG](
	[login_id] [varchar](50) NULL,
	[serverNo] [tinyint] NULL,
	[chr_name] [varchar](16) NULL,
	[xp] [int] NULL,
	[regdate] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[login_log]    Script Date: 07/30/2013 16:05:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[login_log](
	[login_id] [varchar](16) NOT NULL,
	[server_no] [tinyint] NOT NULL,
	[Start_date] [datetime] NOT NULL CONSTRAINT [DF__login_log__Start__1486F2C8]  DEFAULT (getdate()),
	[END_date] [datetime] NOT NULL CONSTRAINT [DF__login_log__END_d__157B1701]  DEFAULT ('1900-01-01'),
	[IP] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[up_test]    Script Date: 07/30/2013 16:05:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[up_test](
	[id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chr_log_info]    Script Date: 07/30/2013 16:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[chr_log_info](
	[id_idx] [int] NOT NULL,
	[propid] [int] NOT NULL,
	[id_loginid] [varchar](20) NULL,
	[id_passwd] [varchar](50) NULL,
	[sta_num] [tinyint] NOT NULL CONSTRAINT [DF_chr_log_info_crypt_sta_num]  DEFAULT ((1)),
	[id_regdate] [datetime] NOT NULL CONSTRAINT [DF_chr_log_info_crypt_id_regdate]  DEFAULT (getdate()),
	[id_eday] [datetime] NULL CONSTRAINT [DF_chr_log_info_crypt_id_eday]  DEFAULT (getdate()),
	[game_in_date] [datetime] NULL CONSTRAINT [DF_chr_log_info_crypt_game_in_date]  DEFAULT (getdate()),
	[game_out_date] [datetime] NULL CONSTRAINT [DF_chr_log_info_crypt_game_out_date]  DEFAULT (getdate()),
	[total_game_time] [bigint] NOT NULL CONSTRAINT [DF_chr_log_info_crypt_total_game_time]  DEFAULT ((0)),
	[type_num] [tinyint] NOT NULL CONSTRAINT [DF_chr_log_info_crypt_type_num]  DEFAULT ((0)),
	[id_real] [tinyint] NULL CONSTRAINT [DF_chr_log_info_crypt_id_real]  DEFAULT ((0)),
	[n_billtype] [char](10) NULL CONSTRAINT [DF_chr_log_info_crypt_n_billtype]  DEFAULT ('n'),
	[remain_time] [int] NULL CONSTRAINT [DF_chr_log_info_crypt_remain_time]  DEFAULT ((0)),
	[UserLevel] [tinyint] NULL CONSTRAINT [DF_chr_log_info_crypt_UserLevel]  DEFAULT ((6)),
	[id_memberType] [char](1) NULL CONSTRAINT [df_chr_log_info_crypt_memberType]  DEFAULT ('1'),
	[id_sexType] [char](1) NULL CONSTRAINT [DF_chr_log_info_crypt_id_sexType]  DEFAULT ((0)),
	[id_pass_sec] [varchar](4) NULL,
	[id_pass_sec_check] [char](1) NULL CONSTRAINT [DF_chr_log_info_id_pass_sec_check]  DEFAULT ((0)),
	[id_passwd_expiredate] [datetime] NOT NULL CONSTRAINT [DF_chr_log_info_id_passwd_expiredate]  DEFAULT (getdate()),
	[mac] [int] NOT NULL CONSTRAINT [DF__chr_log_inf__mac__2EDAF651]  DEFAULT ((0)),
	[tjFlag] [int] NOT NULL CONSTRAINT [DF__chr_log_i__tjFla__2FCF1A8A]  DEFAULT ((0)),
	[tj] [varchar](255) NULL,
 CONSTRAINT [PK_chr_log_info_crypt] PRIMARY KEY CLUSTERED 
(
	[propid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_chr_log_info_crypt] UNIQUE NONCLUSTERED 
(
	[id_loginid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[MP_CHARACTER_NameCheck]    Script Date: 07/30/2013 16:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE    proc [dbo].[MP_CHARACTER_NameCheck]
(
	@CHARACTER_NAME	varchar(16)
--,	@return int output
)
as
	set nocount on
	set xact_abort on
	declare	@NAME_CHECK1	bit
--	declare	@NAME_CHECK2	bit
--	declare	@NAME_CHECK3	bit

--- 캐릭터 예약 이벤트
	declare @userpropid int
	declare @USER_IDX int

	set @USER_IDX = (select USER_IDX from LUNA_GAMEDB.dbo.TB_CHARACTER where  CHARACTER_NAME = @CHARACTER_NAME and character_standindex != 5)
---------

	set @NAME_CHECK1 = (select count(CHARACTER_NAME) from LUNA_GAMEDB.dbo.TB_CHARACTER where CHARACTER_NAME = @CHARACTER_NAME and character_standindex != 5)
--	set @NAME_CHECK2 = (select count(CHARACTER_NAME) from TB_TABOOCHARACTER_NAME where CHARACTER_NAME = @CHARACTER_NAME)
--	set @NAME_CHECK3 = (select count(CHARACTER_NAME) from TB_CHARACTER_FORTH where CHARACTER_NAME = @CHARACTER_NAME)

if (select count(MunpaName) from LUNA_GAMEDB.dbo.tb_munpa where @CHARACTER_NAME = MunpaName ) >0
	begin
		select 3
--		set @return= 3 -- fail
		return
	end


else	if @NAME_CHECK1 = 0 -- and @NAME_CHECK2 = 0 and @NAME_CHECK3 = 0
		begin

--- 캐릭터 예약 이벤트
			if exists ( select * from [LUNA_MEMBER].[dbo].[event20070704_characterName_PRE_GET] where chrName = @CHARACTER_NAME )
			begin
				set @userpropid = (select top 1 propid  from [LUNA_MEMBER].[dbo].[event20070704_characterName_PRE_GET] where chrName = @CHARACTER_NAME )
				if ( @userpropid != @USER_IDX )
				begin
					select 1
--					set @return=  1 --fail
					return
				end
			end
-----------------------------------------------------------
					select 0
--					set @return= 0 --success
			return
		end
	else
		begin
					select 1
--					set @return= 1 -- fail
			return
		end
GO
/****** Object:  StoredProcedure [dbo].[MP_GMTOOL_UpdateUserLevel]    Script Date: 07/30/2013 16:04:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 개체: 저장 프로시저 dbo.MP_GMTOOL_UpdateUserLevel    스크립트 날짜: 2006-07-26 오후 4:09:33 ******/





CREATE      proc [dbo].[MP_GMTOOL_UpdateUserLevel]
(
		@Server		varchar(4)
	,	@CharName	varchar(30)
	,	@statenum	varchar(4)
)

as
	set nocount on
	set xact_abort on

	declare @sql varchar(1000)
	declare	@param		varchar(500)

	set @param = 'declare @temp int'
	set @sql = 'update a set sta_num = '+@statenum+' from chr_log_info a'
	set @sql = @sql+' inner join chr_info_'+@Server+' b'
	set @sql = @sql+ ' on a.propid=b.propid'
	set @sql = @sql+' where b.chr_name='''+@CharName+''''


	exec (@sql)

	select @@rowcount
GO
/****** Object:  StoredProcedure [dbo].[MP_GUILD_CHANGE_MASTER]    Script Date: 07/30/2013 16:04:47 ******/
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
	
							
	IF EXISTS ( SELECT  *
				FROM      TB_GUILD
				WHERE   (ACCESS_CHAR_IDX = @EX_MASTER_IDX) )
		RETURN
		
	-- 이전 마스터의 랭크를 바꾸고	
	UPDATE  TB_CHARACTER
	SET     CHARACTER_MUNPAJIKCHEK = @EX_MASTER_RANK
	WHERE   CHARACTER_IDX = @EX_MASTER_IDX
	
	IF @@ROWCOUNT = 0
		RETURN
	
	-- 직책 정보 수정
	UPDATE  TB_CHARACTER
	SET     CHARACTER_MUNPAJIKCHEK = @MASTER_RANK
	WHERE   (CHARACTER_IDX = @CHAR_IDX) AND (CHARACTER_MUNPAIDX = @GUILD_IDX)
	
	IF @@ROWCOUNT = 0
	BEGIN
		ROLLBACK
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
		RETURN
	
	SELECT @CHAR_IDX	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_ITEM_DROP_OPTION_INSERT]    Script Date: 07/30/2013 16:04:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080125 웅주, 아이템을 드롭할 때 랜덤으로 붙는 옵션
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
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_ITEM_OPTION_INSERT]    Script Date: 07/30/2013 16:04:49 ******/
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
/****** Object:  StoredProcedure [dbo].[MP_REMAINTIME_Update]    Script Date: 07/30/2013 16:04:50 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 개체: 저장 프로시저 dbo.MP_REMAINTIME_Update    스크립트 날짜: 2006-07-26 오후 4:09:33 ******/


CREATE proc [dbo].[MP_REMAINTIME_Update]
(
	@USERIDX		int,
	@REMAINTIME		int
)
as
	Set Nocount On

update char_log_info set
	remain_time=@REMAINTIME
	where propid=@USERIDX
GO
/****** Object:  StoredProcedure [dbo].[MP_USER_SexKind]    Script Date: 07/30/2013 16:04:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- 몬스터미터 정보를 DB에서 읽어옴
CREATE   PROC [dbo].[MP_USER_SexKind] (@UserID int)
as
	Set Nocount on
	Set Xact_abort on

begin
	-- 레코드가 생성되어 있지 않으면return
	if not exists (select null from chr_log_info where propid = @UserID)
	begin
		return
	end
	-- 레코드가 생성되어 있으면 read
	else 
	begin
		select id_sexType from chr_log_info with(nolock) where propid = @UserID
	end
end
GO
/****** Object:  StoredProcedure [dbo].[RP_SearchCharacterSimpleInfo]    Script Date: 07/30/2013 16:04:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 개체: 저장 프로시저 dbo.RP_SearchCharacterSimpleInfo    스크립트 날짜: 2006-07-26 오후 4:09:33 ******/
CREATE proc [dbo].[RP_SearchCharacterSimpleInfo]
(
	@ServerNo	varchar(1),
	@MemberNo	varchar(20)
)
as
	set nocount on
	set xact_abort on


	declare @sql varchar(2000)	

	set @sql = 'select '+@ServerNo+', charno, chr_name, convert(varchar(30), create_date, 120) from chr_info_'+@ServerNo
	set @sql = @sql + ' where propid = '+@MemberNo

	exec (@sql)
GO
/****** Object:  StoredProcedure [dbo].[RP_SearchMemberNumFromID]    Script Date: 07/30/2013 16:04:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** 개체: 저장 프로시저 dbo.RP_SearchMemberNumFromID    스크립트 날짜: 2006-07-26 오후 4:09:33 ******/


-- 계정으로
CREATE    proc [dbo].[RP_SearchMemberNumFromID]
(
	@id	varchar(20)
)

as
	Set Nocount on
	Set Xact_Abort on

	select propid from chr_log_info where id_loginid = @id
GO
/****** Object:  StoredProcedure [dbo].[RP_SearchMemberNumFromID_JP]    Script Date: 07/30/2013 16:04:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** 개체: 저장 프로시저 dbo.RP_SearchMemberNumFromID_JP    스크립트 날짜: 2006-07-26 오후 4:09:33 ******/




-- 계정으로
CREATE      proc [dbo].[RP_SearchMemberNumFromID_JP]
(
	@id	varchar(20)
)

as
	Set Nocount on
	Set Xact_Abort on

	select num from Mem_Login where uid = @id
GO
/****** Object:  StoredProcedure [dbo].[RP_SearchUserInfoByCharName]    Script Date: 07/30/2013 16:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 개체: 저장 프로시저 dbo.RP_SearchUserInfoByCharName    스크립트 날짜: 2006-07-26 오후 4:09:33 ******/



-- 캐릭터 이름으로 검색
CREATE         proc [dbo].[RP_SearchUserInfoByCharName]
(
		@server		varchar(1)
	,	@name		varchar(20)
)

as
	Set Nocount on
	Set Xact_Abort on

	declare @sql		varchar(2000)

	set @sql = 'declare @MemberNo int'
	set @sql = @sql + ' select @MemberNo = propid from chr_info_'+@server+' where chr_name = '''+@name+''''
	set @sql = @sql + ' exec RP_SearchUserInfoByMemberNo '+@server+', @MemberNo'

	exec (@sql)
GO
/****** Object:  StoredProcedure [dbo].[RP_SearchUserInfoById]    Script Date: 07/30/2013 16:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 개체: 저장 프로시저 dbo.RP_SearchUserInfoById    스크립트 날짜: 2006-07-26 오후 4:09:33 ******/



-- 계정으로 검색
CREATE    proc [dbo].[RP_SearchUserInfoById]
(
		@server		int
	,	@id		varchar(20)
)

as
	Set Nocount on
	Set Xact_Abort on

	declare	@MemberNo int

	select @MemberNo = propid from chr_log_info where id_loginid = @id

	exec RP_SearchUserInfoByMemberNo	 @server, @MemberNo
GO
/****** Object:  StoredProcedure [dbo].[TP_ChangeUserLevel]    Script Date: 07/30/2013 16:04:55 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** 개체: 저장 프로시저 dbo.TP_ChangeUserLevel    스크립트 날짜: 2006-07-26 오후 4:09:33 ******/

CREATE   proc [dbo].[TP_ChangeUserLevel]
(
	@UserIdx	int,
	@UserLevel	int
)
as
	set nocount on
	set xact_abort on

	update chr_log_info set userlevel = @UserLevel where propid = @UserIdx
	
	select @UserIdx, @UserLevel
GO
/****** Object:  StoredProcedure [dbo].[TP_ChangeUserLevel_JP]    Script Date: 07/30/2013 16:04:55 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** 개체: 저장 프로시저 dbo.TP_ChangeUserLevel_JP    스크립트 날짜: 2006-07-26 오후 4:09:33 ******/



CREATE     proc [dbo].[TP_ChangeUserLevel_JP]
(
	@UserIdx	int,
	@UserLevel	int
)
as
	set nocount on
	set xact_abort on

	update Mem_Login set mem_lvl = @UserLevel where num = @UserIdx
	
	select @UserIdx, @UserLevel
GO
/****** Object:  StoredProcedure [dbo].[TP_FAMILY_UPDATE]    Script Date: 07/30/2013 16:04:55 ******/
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
/****** Object:  StoredProcedure [dbo].[TP_ITEM_INSERT]    Script Date: 07/30/2013 16:04:56 ******/
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
	
	SELECT CHARACTER_IDX, ITEM_DBIDX, ITEM_IDX, ITEM_POSITION, ITEM_DURABILITY, ITEM_SEAL, @TYPE
	FROM TB_ITEM
	WHERE ITEM_DBIDX = @@IDENTITY;
						
	RETURN
GO
/****** Object:  Table [dbo].[Chr_Log_Info_static]    Script Date: 07/30/2013 16:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Chr_Log_Info_static](
	[chr_log_info_static_idx] [int] IDENTITY(1,1) NOT NULL,
	[id] [varchar](16) NULL,
	[name] [char](15) NULL,
	[reg_date] [datetime] NULL,
	[type_num] [tinyint] NULL,
	[addr1] [varchar](150) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[TP_SearchPetMemberNumFromID]    Script Date: 07/30/2013 16:04:59 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** 개체: 저장 프로시저 dbo.TP_SearchPetMemberNumFromID    스크립트 날짜: 2006-07-26 오후 4:09:33 ******/
-- 계정으로
CREATE    proc [dbo].[TP_SearchPetMemberNumFromID]
(
	@id	varchar(20)
)

as
	Set Nocount on
	Set Xact_Abort on

	select propid from chr_log_info where id_loginid = @id
GO
/****** Object:  StoredProcedure [dbo].[mysp_UpdateMemberOTP]    Script Date: 07/30/2013 16:04:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<OmgNeil>
-- Create date: <2008.09.01>
-- Description:	<UpDateOTP>
-- =============================================
CREATE PROCEDURE [dbo].[mysp_UpdateMemberOTP]
	

@id_loginid				varchar(20),
@id_passwd				varchar(20),
@id_passwd_expiredate			datetime,
@Rtn_Code				int output,
@ProPID				int
		


AS
BEGIN

	SET @Rtn_Code = 0

	IF EXISTS (SELECT id_loginid FROM dbo.chr_log_info WITH (NOLOCK) WHERE id_loginid= @id_loginid)
		BEGIN


			UPDATE chr_log_info SET id_passwd = @id_passwd , id_passwd_expiredate = DATEADD (minute , 60, getdate() )
			WHERE id_loginid= @id_loginid

			IF @@ERROR = 0 AND @@ROWCOUNT = 1
				BEGIN
					SET @Rtn_Code = 1
					RETURN
				END
			ELSE
				BEGIN
					SET @Rtn_Code = 0
					RETURN
				END
		END
	ELSE
		BEGIN

			Insert Into chr_log_info ([propid],[id_loginid],[id_passwd],[UserLevel],[id_sexType],[id_passwd_expiredate]) values ( @ProPID,@id_loginid,@id_passwd,6,0,DATEADD (minute , 60, getdate() ) )

			IF @@ERROR = 0 AND @@ROWCOUNT = 1
				BEGIN
					SET @Rtn_Code = 1
					RETURN
				END
			ELSE
				BEGIN
					SET @Rtn_Code = 0
					RETURN
				END


		END




END
GO
/****** Object:  StoredProcedure [dbo].[output_ip]    Script Date: 07/30/2013 16:04:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 개체: 저장 프로시저 dbo.output_ip    스크립트 날짜: 2006-07-26 오후 4:09:34 ******/

CREATE proc [dbo].[output_ip] 
(
@ip varchar(20)
,@num1 int output
,@num2 int output
,@num3 int output
,@num4 int output
)
as
--*****************************************************************
--		  ip 대역 분리
--
--				create by shlee
--				create date : 2006.01.26
--				modify by
--				modify date :    	
--*****************************************************************
declare @len int
declare @tmp_len int



--set @ip='2.6.190.60'
--select @ip

	set @len=len(@ip)
	set @tmp_len=charindex('.',@ip)
	set @num1=convert(int,left(@ip,@tmp_len-1))
	set @ip=right(@ip,@len-@tmp_len)

	set @len=len(@ip)
	set @tmp_len=charindex('.',@ip)
	set @num2=convert(int,left(@ip,@tmp_len-1))
	set @ip=right(@ip,@len-@tmp_len)

	set @len=len(@ip)
	set @tmp_len=charindex('.',@ip)
	set @num3=convert(int,left(@ip,@tmp_len-1))
	set @ip=right(@ip,@len-@tmp_len)

	set @num4=convert(int,@ip)

	--select @num1,@num2,@num3,@num4
GO
/****** Object:  StoredProcedure [dbo].[TP_USER_DATA_UPDATE]    Script Date: 07/30/2013 16:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 071121 웅주
CREATE PROCEDURE [dbo].[TP_USER_DATA_UPDATE]
(
	@USER_IDX	INT,
	@LEVEL		TINYINT
)
AS
	SET NOCOUNT ON
	
	UPDATE  chr_log_info
	SET		UserLevel = @LEVEL
	WHERE   (propid = @USER_IDX)
	
	IF 0 = @@ROWCOUNT
	BEGIN
		SELECT 0
		RETURN
	END
	
	SELECT	@USER_IDX, @LEVEL	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_USER_NAME_SELECT]    Script Date: 07/30/2013 16:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[TP_USER_NAME_SELECT]
(
	@USER_IDX	INT,
	@CHAR_IDX	INT
)
AS
	SET NOCOUNT ON
	
	SELECT   @CHAR_IDX, propid, id_loginid
	FROM      chr_log_info
	WHERE   (propid = @USER_IDX)
	
	RETURN
GO
/****** Object:  Table [dbo].[Chr_info_0]    Script Date: 07/30/2013 16:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Chr_info_0](
	[CharNo] [int] NOT NULL,
	[propid] [int] NULL,
	[login_id] [varchar](20) NOT NULL,
	[chr_name] [varchar](50) NOT NULL,
	[create_date] [datetime] NOT NULL CONSTRAINT [DF_Chr_info_0_create_date]  DEFAULT (getdate())
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Game_Login_Count]    Script Date: 07/30/2013 16:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Game_Login_Count](
	[IP] [varchar](15) NOT NULL,
	[COUNT] [smallint] NOT NULL CONSTRAINT [DF_Game_Login_Count_COUNT]  DEFAULT ((1)),
	[DATE] [datetime] NOT NULL CONSTRAINT [DF_Game_Login_Count_FAILED_DATE]  DEFAULT (getdate()),
 CONSTRAINT [IX_IP] UNIQUE CLUSTERED 
(
	[IP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Game_Login_ip_block]    Script Date: 07/30/2013 16:05:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Game_Login_ip_block](
	[idx] [int] IDENTITY(1,1) NOT NULL,
	[ip] [varchar](15) NOT NULL,
	[regdate] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoginTable]    Script Date: 07/30/2013 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoginTable](
	[user_id] [varchar](16) NOT NULL,
	[propid] [int] NULL,
	[ip] [varchar](50) NULL,
	[kind] [int] NULL,
	[billtype] [char](10) NULL,
	[type] [int] NULL,
	[Login_date] [datetime] NULL CONSTRAINT [DF_LoginTable_Login_date]  DEFAULT (getdate()),
	[Agent_no] [tinyint] NOT NULL CONSTRAINT [DF_LoginTable_Agent_no]  DEFAULT ((0)),
	[Auth_Key] [varchar](16) NOT NULL CONSTRAINT [DF_LoginTable_Auth_Key]  DEFAULT ((0)),
 CONSTRAINT [PK_LoginTable] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Play_time_log]    Script Date: 07/30/2013 16:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Play_time_log](
	[idx] [int] IDENTITY(1,1) NOT NULL,
	[play_date] [datetime] NULL,
	[id_loginid] [varchar](50) NULL,
	[usetime] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[up_event20080425_attend_check]    Script Date: 07/30/2013 16:05:01 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[up_event20080425_attend_check]
(
	@a	int,
	@b	int
)
 AS

return
GO
/****** Object:  StoredProcedure [dbo].[ref_chk_ip]    Script Date: 07/30/2013 16:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 개체: 저장 프로시저 dbo.ref_chk_ip    스크립트 날짜: 2006-07-26 오후 4:09:34 ******/




CREATE    proc [dbo].[ref_chk_ip]
(
@ip 	varchar(20),
@cnt	varchar(3) output
)
as
--*****************************************************************
--		ip 대역 조회
--
--				create by shlee
--				create date : 2006.01.26
--				modify by
--				modify date :    	
--*****************************************************************
declare @i1 int
declare @i2 int
declare @i3 int
declare @i4 int

declare @ichk1 bigint
declare @ichk2 bigint
--declare @cnt varchar(3)

exec output_ip @ip,@i1 output ,@i2 output ,@i3 output ,@i4 output 

set @ichk1=@i1*256*256
set @ichk2=@ichk1*256+@i2*256*256+@i3*256+@i4

select @cnt=cnt from ref_iplist
where fchk<=@ichk2 and tchk>=@ichk2

if @cnt is null set @cnt='XXX'

--select @cnt
GO
/****** Object:  StoredProcedure [dbo].[TP_OPERATOR_INSERT]    Script Date: 07/30/2013 16:04:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080109 웅주, 새로운 운영자를 등록한다
*/
CREATE PROCEDURE [dbo].[TP_OPERATOR_INSERT]
(
	@ID			VARCHAR( 16 ),
	@NAME		VARCHAR( 16 ),
	@PASSWORD	VARCHAR( 16 ),
	@RANK		INT
)
AS
	SET NOCOUNT ON
	
	INSERT INTO TB_OPERATOR
	(OperId, OperName, OperPower, OperPwd, OperRegDate)
	VALUES
	(@ID, @NAME, @RANK, @PASSWORD, GETDATE() )
	
	SELECT	OPERIDX,
			OPERPOWER,
			OPERID,
			OPERNAME,			
			--OPERREGDATE
			CONVERT( VARCHAR( 6 ), OPERREGDATE, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), OPERREGDATE, 8 )
	FROM	TB_OPERATOR
	WHERE	@@IDENTITY = OPERIDX
		
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_OPERATOR_UPDATE]    Script Date: 07/30/2013 16:04:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080109 웅주, 운영자 정보를 바꾼다
*/
CREATE  PROCEDURE [dbo].[TP_OPERATOR_UPDATE]
(
	@IDX		INT,
	@RANK		INT
)
AS
	SET NOCOUNT ON
	
	UPDATE  TB_OPERATOR
	SET     OperPower	= @RANK
	WHERE   (OperIdx = @IDX)
	
	IF 0 = @@ROWCOUNT
	BEGIN
		SELECT 0
		RETURN
	END
	
	SELECT @IDX, @RANK
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_PASSWORD_UPDATE]    Script Date: 07/30/2013 16:04:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080109 웅주, 운영자의 접속 암호를 바꾼다
*/
CREATE PROCEDURE [dbo].[TP_PASSWORD_UPDATE]
(
	@ID				VARCHAR( 16 ),
	@OLD_PASSWORD	VARCHAR( 16 ),
	@NEW_PASSWORD	VARCHAR( 16 )
)
AS
	SET NOCOUNT ON
	
	UPDATE  TB_OPERATOR
	SET		OperPwd = @NEW_PASSWORD
	WHERE   (OperId = @ID) AND (OperPwd = @OLD_PASSWORD)

	IF 0 = @@ROWCOUNT
		SELECT 0
	ELSE
		SELECT 1	
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[RP_OperatorInfo]    Script Date: 07/30/2013 16:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 개체: 저장 프로시저 dbo.RP_OperatorInfo    스크립트 날짜: 2006-07-26 오후 4:09:33 ******/





-- 운영자 목록 가져오기
create      proc [dbo].[RP_OperatorInfo]
(
	@startIdx	int,
	@operIdx	int -- 자기자신은 제외한다.
)
as
	set nocount on
	set xact_abort on

	select 	@operIdx,
		operIdx, 
		operid, 
		opername, 
		operpwd, 		
		operpower, 
		convert(varchar(5),year(operregdate)) +'-'+ 
		convert(varchar(3), month(operregdate)) +'-'+ 
		convert(varchar(3), day(operregdate)),
		convert(varchar(17), operregdate, 108)
	from tb_operator where operidx > @startidx
	order by operidx asc
GO
/****** Object:  StoredProcedure [dbo].[RP_OperatorLoginCheck]    Script Date: 07/30/2013 16:04:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080108 웅주, 쿼리 결과를 변경함
*/
-- 운영자 접속 체크
CREATE   proc [dbo].[RP_OperatorLoginCheck]
(
	@OperId		varchar(17),
	@OperPwd	varchar(17),
	@IpAdress	varchar(17)
)
as
	set nocount on
	set xact_abort on	

	declare @count int
	declare @ipIdx int
	declare @adress varchar(17)
	declare @RegDate smalldatetime

	select @ipIdx = IpIdx, @adress = ipadress, @RegDate = IpRegDate from tb_operip 
	where ipadress = @ipadress -- 아이피 체크
	
	if( @adress is null )
	begin
		select 1
		return-- 등록되지 않은 아이피
	end

	select @count = count(*) from tb_operator 
	where Operid = @OperId -- 등록된 아이디 인지 체크

	if( @count = 0 )
	begin
		select 2
		return-- 등록되지 않은 아이디
	end

	select @count = count(*) from tb_operator 
	where Operid = @OperId and OperPwd = @OperPwd -- 비밀번호 체크

	if( @count = 0 )
	begin
		select 3
		return-- 비밀번호가 잘못된 경우
	end
	
	DECLARE @AUTHORITY_VERSION	VARCHAR( 16 )

	IF EXISTS
	(
		SELECT 	NULL
		FROM 	SYSOBJECTS
		WHERE 	NAME = 'TB_OPERATOR_AUTHORITY'
	)
	BEGIN
		-- 081021 LUJ, 권한이 0인 경우 ATTRIBUTE는 버전 정보를 의미한다
		--		UPDATE혹은 INSERT될 때마다 1씩 증가한다
		SELECT	@AUTHORITY_VERSION	= ATTRIBUTE
		FROM	TB_OPERATOR_AUTHORITY
		WHERE	POWER = 0
	END	

	-- 접속 성공
	select 	0, 
		OperID, 
		OperName, 
		@IpAdress,
		CONVERT( VARCHAR( 6 ), OperRegDate, 12 ) + ' ' + CONVERT( VARCHAR( 8 ), OperRegDate, 8 ),
		OperPower,
		ISNULL( 	@AUTHORITY_VERSION, 0 )
	from tb_operator
	where Operid = @OperId
GO
/****** Object:  StoredProcedure [dbo].[TP_OPERATOR_AUTHORITY_SELECT]    Script Date: 07/30/2013 16:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080109 錠輿, 掏擊 蘭葬棻
*/
CREATE PROCEDURE [dbo].[TP_OPERATOR_AUTHORITY_SELECT]
(
	@NEXT_TYPE	INT
)
AS
	SET NOCOUNT ON
	
	SELECT	TOP 100
			POWER,
			TYPE,
			ATTRIBUTE,
			( TYPE * 100 + POWER ) AS [INDEX]
	FROM 		TB_OPERATOR_AUTHORITY
	WHERE		( TYPE * 100 + POWER > @NEXT_TYPE )
	ORDER BY	[INDEX]

	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_OPERATOR_AUTHORITY_UPDATE]    Script Date: 07/30/2013 16:04:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
081021 LUJ, 螃溯檜攪曖 掏 薑爾蒂 滲唳棻
*/
CREATE  PROCEDURE [dbo].[TP_OPERATOR_AUTHORITY_UPDATE]
(
	@TYPE		INT,
	@POWER1	SMALLINT	= 0,
	@ATTRIBUTE1	VARCHAR( 16 )	= '',
	@POWER2	SMALLINT	= 0,
	@ATTRIBUTE2	VARCHAR( 16 )	= '',
	@POWER3	SMALLINT	= 0,
	@ATTRIBUTE3	VARCHAR( 16 )	= '',
	@POWER4	SMALLINT	= 0,
	@ATTRIBUTE4	VARCHAR( 16 )	= '',
	@POWER5	SMALLINT	= 0,
	@ATTRIBUTE5	VARCHAR( 16 )	= '',
	@POWER6	SMALLINT	= 0,
	@ATTRIBUTE6	VARCHAR( 16 )	= ''
)
AS
	SET NOCOUNT ON

BEGIN TRAN

	DELETE
	FROM	TB_OPERATOR_AUTHORITY
	WHERE	TYPE = @TYPE	AND
		(	POWER = @POWER1 OR
			POWER = @POWER2 OR
			POWER = @POWER3 OR
			POWER = @POWER4 OR
			POWER = @POWER5 OR
			POWER = @POWER6 )

	IF '' <> @ATTRIBUTE1
	BEGIN
		INSERT	TB_OPERATOR_AUTHORITY( TYPE, POWER, ATTRIBUTE )
		VALUES	( @TYPE, @POWER1, @ATTRIBUTE1 )
	END

	IF '' <> @ATTRIBUTE2 
	BEGIN
		INSERT	TB_OPERATOR_AUTHORITY( TYPE, POWER, ATTRIBUTE )
		VALUES	( @TYPE, @POWER2, @ATTRIBUTE2 )
	END

	IF '' <> @ATTRIBUTE3 
	BEGIN	
		INSERT	TB_OPERATOR_AUTHORITY( TYPE, POWER, ATTRIBUTE )
		VALUES	( @TYPE, @POWER3, @ATTRIBUTE3 )
	END

	IF '' <> @ATTRIBUTE4 
	BEGIN
		INSERT	TB_OPERATOR_AUTHORITY( TYPE, POWER, ATTRIBUTE )
		VALUES	( @TYPE, @POWER4, @ATTRIBUTE4 )
	END

	IF '' <> @ATTRIBUTE5
	BEGIN
		INSERT	TB_OPERATOR_AUTHORITY( TYPE, POWER, ATTRIBUTE )
		VALUES	( @TYPE, @POWER5, @ATTRIBUTE5 )
	END

	IF '' <> @ATTRIBUTE6
	BEGIN	
		INSERT	TB_OPERATOR_AUTHORITY( TYPE, POWER, ATTRIBUTE )
		VALUES	( @TYPE, @POWER6, @ATTRIBUTE6 )
	END

COMMIT

	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_OPERATOR_AUTHORITY_VERSION_INCREASE]    Script Date: 07/30/2013 16:04:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
081021 LUJ, 幗瞪擊 隸陛衛鑑棻
*/
CREATE  PROCEDURE [dbo].[TP_OPERATOR_AUTHORITY_VERSION_INCREASE]
(
	@POWER	SMALLINT,
	@TYPE		INT	
)
AS
	SET NOCOUNT ON
	
	DECLARE @ATTRIBUTE VARCHAR( 16 )

	SELECT	@ATTRIBUTE = ATTRIBUTE
	FROM	TB_OPERATOR_AUTHORITY
	WHERE	@POWER = @POWER AND @TYPE = TYPE

	IF @ATTRIBUTE IS NULL
	BEGIN
		INSERT	TB_OPERATOR_AUTHORITY
			(	POWER,
				TYPE,
				ATTRIBUTE )
		VALUES	(	@POWER,
				@TYPE,
				'0' )

		SET @ATTRIBUTE = '0'
	END

	DECLARE @VERSION INT
	SET @VERSION = CAST( @ATTRIBUTE AS INT )
	SET @VERSION = @VERSION + 1
	
	UPDATE	TB_OPERATOR_AUTHORITY
	SET	ATTRIBUTE = CAST( @VERSION AS VARCHAR( 16 ) )
	WHERE	@POWER = @POWER AND @TYPE = TYPE

	SELECT @VERSION
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_OPERATOR_IP_DELETE]    Script Date: 07/30/2013 16:04:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080109 웅주, 운영자가 접속 가능한 IP를 삭제한다
*/
CREATE PROCEDURE [dbo].[TP_OPERATOR_IP_DELETE]
(
	@IP VARCHAR( 16 )
)
AS
	SET NOCOUNT ON
	
	DELETE
	FROM	TB_OPERIP
	WHERE	(IpAdress = @IP)
	
	IF 0 = @@ROWCOUNT
		SELECT 0
	ELSE
		SELECT @IP
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_OPERATOR_IP_INSERT]    Script Date: 07/30/2013 16:04:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080109 웅주, 운영자가 접속 가능한 IP를 추가한ㄷ
*/
CREATE PROCEDURE [dbo].[TP_OPERATOR_IP_INSERT]
(
	@IP VARCHAR( 16 )
)
AS
	SET NOCOUNT ON
	
	DELETE
	FROM	TB_OPERIP
	WHERE	(IpAdress = @IP)
	
	INSERT INTO TB_OPERIP
	(IpAdress, IpRegDate)
	VALUES
	(@IP, GETDATE())	
	
	SELECT @IP
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[RP_IpAdressInfo]    Script Date: 07/30/2013 16:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 개체: 저장 프로시저 dbo.RP_IpAdressInfo    스크립트 날짜: 2006-07-26 오후 4:09:33 ******/



-- 등록 ip 목록 불러오기
create    proc [dbo].[RP_IpAdressInfo]
(
	@startIdx	int
)

as
	set nocount on
	set xact_abort on

	select 	ipidx, 
		ipadress, 
		convert(varchar(5),year(ipregdate)) +'-'+ 
		convert(varchar(3), month(ipregdate)) +'-'+ 
		convert(varchar(3), day(ipregdate)),
		convert(varchar(17), ipregdate, 108)
	from tb_operip where ipidx > @startIdx
GO
/****** Object:  StoredProcedure [dbo].[RP_DeleteIp]    Script Date: 07/30/2013 16:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 개체: 저장 프로시저 dbo.RP_DeleteIp    스크립트 날짜: 2006-07-26 오후 4:09:33 ******/

-- ip 삭제
create  proc [dbo].[RP_DeleteIp]
(
	@ipIdx	int
)
as
	set nocount on
	set xact_abort on

	delete tb_operip where ipIdx = @ipIdx
GO
/****** Object:  StoredProcedure [dbo].[RP_InsertIpAdress]    Script Date: 07/30/2013 16:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 개체: 저장 프로시저 dbo.RP_InsertIpAdress    스크립트 날짜: 2006-07-26 오후 4:09:33 ******/


-- IP Adress 등록
CREATE   proc [dbo].[RP_InsertIpAdress]
(
	@adress	varchar(17)
)
as
	set nocount on
	set xact_abort on

	declare @count int

	select @count = count(*) from tb_operip where IpAdress = @adress

if( @count != 0 )
	begin
		select 1	-- 이미 등록된 아이피
		return
	end

	insert tb_operip( ipadress, ipregdate)
	values (@adress, GetDate())
	
	select 0
	return
GO
/****** Object:  StoredProcedure [dbo].[Up_Ip_CheckIn]    Script Date: 07/30/2013 16:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 개체: 저장 프로시저 dbo.Up_Ip_CheckIn    스크립트 날짜: 2006-07-26 오후 4:09:33 ******/



create    proc [dbo].[Up_Ip_CheckIn]
(
	@strIP	varchar(17),
	@Key	int
)
as

	set nocount on
	set xact_abort on

	select count(*), @Key from tb_OperIp
	where ipadress = @strIP
GO
/****** Object:  StoredProcedure [dbo].[MP_PUNISHCOUNT_ADD]    Script Date: 07/30/2013 16:04:50 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE proc [dbo].[MP_PUNISHCOUNT_ADD]
(
	@user_idx int,
	@punish_kind smallint,
	@period smallint
)
as
	Set Nocount on

insert tb_punishcount
(
	user_idx,
	punish_kind,
	reg_date
)
values
(
	@user_idx,
	@punish_kind,
	getdate()
)

declare @count int
select @count = count(*) from tb_punishcount with(nolock) 
where user_idx = @user_idx and punish_kind = @punish_kind and reg_date > getdate() - @period

select @punish_kind, @count
GO
/****** Object:  StoredProcedure [dbo].[MP_PUNISHLIST_ADD]    Script Date: 07/30/2013 16:04:50 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE proc [dbo].[MP_PUNISHLIST_ADD]
(
	@user_idx int,
	@punish_kind smallint,
	@punish_time int
)
as
	Set Nocount on

if  exists ( select null from tb_punishlist where user_idx = @user_idx and punish_kind = @punish_kind )
	begin
		update tb_punishlist
		set punish_time = @punish_time, reg_date = getdate()
		where user_idx = @user_idx and punish_kind = @punish_kind
	end
else
	begin
		insert tb_punishlist
		(
			user_idx,
			punish_kind,
			punish_time,
			reg_date
		)
		values
		(
			@user_idx,
			@punish_kind,
			@punish_time,
			getdate()
		)
	end
GO
/****** Object:  StoredProcedure [dbo].[MP_PUNISHLIST_LOAD]    Script Date: 07/30/2013 16:04:50 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE proc [dbo].[MP_PUNISHLIST_LOAD]
(
	@user_idx int
)
as
	Set Nocount on

select punish_kind, DATEDIFF( second, getdate(), DATEADD( second, punish_time, reg_date )  )
from tb_punishlist with(nolock)
where user_idx = @user_idx
GO
/****** Object:  StoredProcedure [dbo].[up_GameLoginAdult_FREE]    Script Date: 07/30/2013 16:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
080111 웅주, 1시간에 60회 접속 시도한 경우 해당 IP를 블럭한다
*/

CREATE         PROC [dbo].[up_GameLoginAdult_FREE]     
/*        
작성자 : 김혜진
수정일 : 2004.07.29. 오후6:37  
수정내용 : 클베신청자들과 18세이상 로그인

090310 LUJ, 성공 반환 시 로그인 아이디를 함께 반환하도록 함
*/        
(        
  @id_loginid varchar(16),       --아뒤  
  @id_passwd varchar(16),      --패스  
  @ip varchar(16),                  --아이피  
  @kind  char(1), --서버 코드        
  @AuthKey  varchar(16), --게임고유번호        
  @MaxUser	int, --서버군 유저 제한
  @ageyear  int, --제한나이
  @agentnum tinyint,
  @securityPW varchar(4)                                     -- 추가 인자로 보안 비밀 번호를 받는다.
)        
AS        
SET NOCOUNT ON -- 결과 안내가 레코드 수로 반환하지 않는다(ON/OFF)        
--SET XACT_ABORT ON --런타임 오류가 발생할 경우 전체 트랜잭션이 종료된 후 롤백됩니다        
/*
-- 080111 웅주, 1시간에 60회 접속 시도한 경우 해당 IP를 블럭한다
IF NOT EXISTS
(
	SELECT NULL FROM Game_Login_Ip_block WHERE IP = @IP
)
BEGIN
	DECLARE @DATE	DATETIME
	DECLARE @COUNT	SMALLINT
	
	SELECT @DATE = [DATE], @COUNT = [COUNT] FROM Game_Login_Count WHERE @IP = IP
	
	-- 값이 없는 경우 삽입
	IF @DATE IS NULL
	BEGIN
		INSERT Game_Login_Count ( IP ) VALUES ( @IP )
	END
	-- 30분 경과 시 값을 초기화한다
	ELSE IF 30 < DATEDIFF( MINUTE, @DATE, GETDATE() )
	BEGIN
		UPDATE Game_Login_Count	SET [DATE] = GETDATE(), [COUNT] = 1 WHERE IP = @IP
	END
	-- 시도 회수가 30회 경과 시 차단한다
	ELSE IF 30 <= @COUNT
	BEGIN
		INSERT Game_Login_ip_block ( IP, REGDATE, TRY_COUNT ) VALUES( @IP, GETDATE(), @COUNT )
	END
	ELSE
	-- 모든 조건에 해당되지 않은 경우 값만 증가시킨다
	BEGIN
		UPDATE Game_Login_Count	SET [COUNT] = [COUNT] + 1 WHERE IP = @IP
	END
END
*/	       
DECLARE   @UserLevel tinyint  
DECLARE @propid varchar(15) --id 고유 값        
DECLARE @billtype char(10) -- 결제 타입        
DECLARE @nopay char(1) --타입이 b로 시작하면 무조건 통과 평생 무료 아이디  
DECLARE @eday datetime --개인 만료 기간        
DECLARE @p_eday datetime --pc방 만료 날짜  
DECLARE @p_idx int --pc방 고유값        
DECLARE @timeremain int --개인 남은 시간        
DECLARE @p_time int --피씨방의 남은 시간  
DECLARE @p_id varchar(20)--피씨방 아이디  
DECLARE @state_num int -- 유저 상태 탈퇴??? 제제???        
DECLARE @eeday datetime --날짜를 반환 할 수 없을때 임으로 하루 전날을 리턴해 준다.  
DECLARE @lev int --게임 레벨 나중에 쓴다 나중에 ... 나중에.. 유저가 로그 아웃 할때 레벨을 받아서 저장 한다...제발. 저장하자 그래야 웹게임에도 응용 할 수 있다.        
DECLARE @nalja varchar(10) --login_log 날짜 별로 저장        
DECLARE @SQL varchar(4000) --LOGIN_LOG 테이블을 만들기 위한 병수 구병수 유병수  
DECLARE @PC_IP int       --PC방 아이피  
DECLARE @kind2 int      --받은 서버명 그대로 넘겨줌  
DECLARE @free_time int --하루 1시간 사용 합니다.        
DECLARE @remain_free  INT--무료 한시간 중 남은 시간.  
DECLARE @game_in_date datetime -- 마지막 로그 아웃 한 시간  
DECLARE @UserCount int -- 현재 서버군의 총인원      
DECLARE @age int --나이 
DECLARE @age_mon int --나이 
DECLARE @age_day int
DECLARE @security_pw         varchar(4)       -- 유저의 보안 비밀 번호를 담을 변수 선언
DECLARE @use_sec_pass     bit                    -- 보안 비밀 번호의 사용 여부를 담을 변수 선언

SET @kind2= cast(@kind as int)        
SET @eeday = dateadd(d, -1, getdate())        
SET @nalja=(select convert(varchar(4), datepart(yyyy, getdate()))+convert(varchar(4), datepart(mm, getdate()))+convert(varchar(4), datepart(dd, getdate())))        
/* 
IF NOT EXISTS (SELECT 1 FROM TB_PermitIP with(nolock) WHERE IP = @ip)              
begin    
 declare @err varchar(3)    
 exec ref_chk_ip @ip,@err output    
 if( @err = 'CN')--- or @err = 'TW' )    
 begin    
  select 999, @kind2, 0, 0, 0, 0, @AuthKey, 0 
  return    
 end     
end
*/

--IF NOT EXISTS (SELECT 1 FROM chr_log_info  with(nolock) WHERE id_loginid = @id_loginid)        
--BEGIN        
--       --로그인여부/서버코드/propid/결제(eday,time,결제요망)/eday/time/체험판사용유저/게임고유넘버(@AuthKey)  
--       SELECT  2,@kind2, 0, 0,  0, 0,@AuthKey,@UserLevel --없는 아이디 입니다.        
--       RETURN        
-- END        

  
--if not 1 = ( select pwdcompare( cast(@id_passwd as varbinary(100)), id_passwd ) from chr_log_info where id_loginid = @id_loginid )  
    
IF NOT EXISTS (SELECT 1 From chr_log_info  with(nolock) Where id_loginid = @id_loginid and id_passwd = @id_passwd)        
BEGIN        
      SELECT  3, @kind2, 0, 0,  0, 0,@AuthKey,@UserLevel --비밀번호가 틀립니다.        
      RETURN        
END   
/*
select @use_sec_pass = id_pass_sec_check from chr_log_info where  id_loginid = @id_loginid             -- 보안 비밀 번호를 받는다.
select @security_pw = id_pass_sec from chr_log_info where  id_loginid = @id_loginid                               -- 보안 비밀 번호 사용 여부를 받는다.
     
-- 실제로 유저의 정보에 따른, 보안 비밀번호 체크 루틴.
if @use_sec_pass = 1                                                                                                  -- 보안 비밀번호를 사용한다면,
begin
             if @security_pw is null                                                                                     -- 혹시라도, 비밀번호 등록이 안되어 있으면,
             begin
             select 10, @kind2, 0, 0,  0, 0,@AuthKey,@UserLevel                                                     -- 비밀번호 재등록 에러 메시지를 리턴한다.
             return
             end
else
             if @security_pw <> @securityPW                                                                     -- 비밀번호가 일치 하지 않는다면,
             begin 
             select 9, @kind2, 0, 0,  0, 0,@AuthKey,@UserLevel                                         --보안 비밀번호가 틀리다는 에러 메시지를 리턴한다.
             return
             end
end
        
  */      
Select @propid=propid,@state_num=sta_num, @eday=id_eday, @timeremain=remain_time, @billtype=n_billtype,@UserLevel=UserLevel From chr_log_info (nolock) Where id_loginid = @id_loginid  
/*
IF EXISTS (SELECT 1 FROM Game_Login_ip_block with(nolock) WHERE ip = @ip)                
     BEGIN          
          SELECT 5, @kind2, @propid, 0, 0, 0,@AuthKey,@UserLevel        --ip게임 블럭 유저          

          RETURN          
     END     
-- 090710 LUJ, 이미 로그인되어있는 상태인지 검사한다. 0은 테스트 서버, 그외 번호는 리얼 서버
BEGIN
	DECLARE @LOGIN_SERVER INT

	IF 0 = @kind2
	BEGIN
		SELECT @LOGIN_SERVER = KIND
		FROM LOGINTABLE WITH( NOLOCK )
		WHERE USER_ID = @ID_LOGINID AND 0 = KIND
	END
	ELSE
	BEGIN
		SELECT @LOGIN_SERVER = KIND
		FROM LOGINTABLE WITH( NOLOCK )
		WHERE USER_ID = @ID_LOGINID AND 0 < KIND
	END

	IF @LOGIN_SERVER IS NOT NULL
	BEGIN
		SELECT 4, @kind2, @PROPID, 0, 0, 0, @AUTHKEY, @USERLEVEL
		RETURN
	END
END
*/
/*
IF EXISTS (Select 1 From LoginTable  with(nolock) Where user_id = @id_loginid)         
BEGIN        
 Select @kind2=kind From LoginTable  with(nolock) Where user_id =@id_loginid        
 SELECT 4, @kind2, @propid, 0, 0, 0,@AuthKey,@UserLevel  --이미 게임에 접속 중입니다.         
 RETURN        
END        
*/
/*        
IF @state_num <> 4 --클베참가자만 제한  state_num=4 인사람들이 클베참가자 
   BEGIN
       SELECT 14,@kind2, @propid, 0,  0, 0,@AuthKey,@UserLevel 
       RETURN     
   END
 */
/*****************************************************************************************************/

/*
select @age=year(getdate())-cast('19'+left(id_jumin,2) as integer) from chr_log_info_plus  with(nolock) where id_loginid=@id_loginid
select @age_mon=convert(char,substring(id_jumin,3,2)),@age_day=convert(char,substring(id_jumin,3,2))  from chr_log_info_plus  with(nolock) where id_loginid=@id_loginid

--생일안지난 사람들 한살뺌 만나이계산 
IF    convert(datetime,getdate())  <   convert(datetime,  cast (year(getdate()) as char) +cast(@age_mon as char)+cast(@age_day as char) )
       BEGIN
       set @age=@age-1
       END  

IF @age < @ageyear --만나이체크가 넘겨온나이보다 작으면  
       BEGIN
          SELECT 15,@kind2, @propid, 0,  0, 0,@AuthKey,@UserLevel 
          RETURN
      END
*/
/***************************************************************************************/
IF @state_num = 6 --블럭 타입들        
BEGIN        
 SELECT 5,@kind2, @propid, 0,  0, 0,@AuthKey,@UserLevel --게임 블럭 유저        
 RETURN        
END        

---KES PUNISH
declare @punish_time smalldatetime
select @punish_time = DATEADD( second, punish_time, reg_date ) from tb_punishlist where user_idx = @propid and punish_kind = 0
--set @punish_time = getdate()-1	--테스트코드
if @@rowcount > 0
begin
	if @punish_time > getdate()
	begin
		SELECT 11,@kind2, @propid, 0, DATEDIFF( minute, getdate(), @punish_time ), 0,@AuthKey,@UserLevel
		return
	end
end
------------------------

IF @state_num = 9 --14세미만 임시가입 (12,13세들 부모동의 받지않은 사람들)       
BEGIN        
 SELECT 6,@kind2, @propid, 0,  0, 0,@AuthKey,@UserLevel --14세미만 임시가입        
 RETURN        
END        

select @UserCount = count(*) from logintable  with(nolock) where kind = @kind2
IF @UserCount >= @MaxUser -- 인원 제한
BEGIN        
 SELECT 8, @kind2, @propid, 0,  0, 0,@AuthKey,@UserLevel --인원제한 
 RETURN        
END   

        
IF @state_num = 8 --블럭 타입들        
BEGIN        
 SELECT 50,@kind2, @propid, 0,  0, 0,@AuthKey,@UserLevel --회원 탈퇴        
 RETURN        
END        
  
/*IF NOT EXISTS (Select 1 From Chr_log_info  Where id_real=1 and  id_loginid=@id_loginid) 
     BEGIN
	SELECT 16,@kind2, @propid, 0,  0, 0,@AuthKey,@UserLevel --실명인증한자 만이 접속 가능합니다.
	RETURN
    END */
  
  
SELECT  @propid=propid, @eday=id_eday, @timeremain = remain_time, @billtype = n_billtype,@game_in_date=game_in_date  FROM chr_log_info with(nolock) WHERE id_loginid = @id_loginid         
SET @nopay = (Select substring(n_billtype,1,1) From chr_log_info with(nolock) Where id_loginid = @id_loginid)        

 BEGIN TRAN          
/* insert LoginTable(user_id,propid,ip,kind,billtype,type,Agent_no, Auth_Key) values(@id_loginid,@propid,@ip,@kind,@billtype,0,@agentnum,@AuthKey)         
    --------------------------------------------------------------------------------------------------------------------------------------        
    SET @SQL='insert login_log_'+@nalja+' (login_id,type,status,time,today,today_day,ip,propid,kind,billtype) '        
    SET @SQL=@SQL+' values('''+@id_loginid+''',0,4,getdate(), DATEPART(yyyy,  getdate())*1000000+DATEPART(mm, getdate())*10000+DATEPART(dd,  getdate())*100+datepart(hh,getdate()),DATEPART(yyyy,  getdate())*10000+DATEPART(mm, getdate())*100+DATEPART(dd,  getdate()),'''+@ip+''','+@propid+','+@kind+','''+@billtype+''') '        
    exec (@SQL)         
    --------------------------------------------------------------------------------------------------------------------------------------    
*/    
   update chr_log_info set game_in_date =getdate() where id_loginid=@id_loginid   --최근 로그인 시간  

--===ADD 05.04.26  
	declare @Start_date datetime  
	set @Start_date = getdate()  
	insert into login_log (login_id,ip,server_no,Start_date,END_date) values(@id_loginid,@ip,@kind,@Start_date,@Start_date)  
	--3.LoginTable 에 인서트  
	INSERT INTO LoginTable(user_id, propid, ip, kind, billtype, type, agent_no, auth_key,login_date) VALUES  
	    (@id_loginid, @propid, @ip, @kind, @billtype, 0, @agentnum, @AuthKey,@Start_date)           
  
  
 IF @@ERROR > 0        
      BEGIN        
        ROLLBACK TRAN        
          SELECT 7, @kind2, @propid, 0,  0, 0,@AuthKey,@UserLevel,@agentnum   --실패 
        RETURN        
     END  
        
ELSE        
     BEGIN        
        COMMIT TRAN         
       	-- 090310 LUJ, 중국측 피로도 시스템을 위해 
        SELECT 1, @kind2, @propid, @billtype,  @timeremain, 0,@AuthKey,@UserLevel,@agentnum, @id_loginid
      RETURN        
     END

RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_PERMISSION_DELETE]    Script Date: 07/30/2013 16:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071209 웅주, 접속 허용 목록에서 IP를 삭제한다
*/
CREATE PROCEDURE [dbo].[TP_PERMISSION_DELETE]
(
	@IP	VARCHAR( 20 )
)
AS
	SET NOCOUNT ON
	
	DELETE FROM TB_PermitIP
	WHERE   (IP = @IP)
	
	IF 0 < @@ROWCOUNT
	BEGIN
		SELECT 1
		RETURN
	END
	
	SELECT 0
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_PERMISSION_INSERT]    Script Date: 07/30/2013 16:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071209 웅주, 접속 허용 목록에서 IP를 삭제한다
*/
CREATE PROCEDURE [dbo].[TP_PERMISSION_INSERT]
(
	@IP	VARCHAR( 20 )
)
AS
	SET NOCOUNT ON
	
	IF EXISTS (
		SELECT	NULL
		FROM	TB_PermitIP
		WHERE	IP = @IP	
	)
	BEGIN
		SELECT 0
		RETURN
	END
	
	INSERT INTO TB_PermitIP
	                (IP)
	VALUES   (@IP)
	
	IF @@IDENTITY IS NOT NULL
	BEGIN
		SELECT 1
	END
	
	SELECT 0	
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[MP_Check_PermitIP]    Script Date: 07/30/2013 16:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 개체: 저장 프로시저 dbo.MP_Check_PermitIP    스크립트 날짜: 2006-07-26 오후 4:09:33 ******/




create     proc [dbo].[MP_Check_PermitIP]
(
	@strIP	varchar(16)
)
as

	set nocount on

	select count(*) from TB_PermitIP where IP = @strIP
GO
/****** Object:  StoredProcedure [dbo].[RP_SearchUserInfoByIdCard]    Script Date: 07/30/2013 16:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 개체: 저장 프로시저 dbo.RP_SearchUserInfoByIdCard    스크립트 날짜: 2006-07-26 오후 4:09:33 ******/


-- 주민번호로 검색
CREATE    proc [dbo].[RP_SearchUserInfoByIdCard]
(
		@server		int
	,	@card1		varchar(20)
	,	@card2		varchar(20)
)

as
	Set Nocount on
	Set Xact_Abort on

	declare	@MemberNo int

	select @MemberNo = propid from chr_log_info 
	where id_loginid in (select id_loginid from chr_log_info_plus where id_jumin = @card1+'-'+@card2)

	exec RP_SearchUserInfoByMemberNo	 @server, @MemberNo
GO
/****** Object:  StoredProcedure [dbo].[RP_SearchUserInfoByMemberNo]    Script Date: 07/30/2013 16:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 개체: 저장 프로시저 dbo.RP_SearchUserInfoByMemberNo    스크립트 날짜: 2006-07-26 오후 4:09:33 ******/






CREATE        proc [dbo].[RP_SearchUserInfoByMemberNo]
(
		@server		int
	,	@memberno	int
)

as
	Set Nocount on
	Set Xact_Abort on

	declare 		@logindate	smalldatetime	-- 최근 접속 시간
		,	@logoutdate	smalldatetime	-- 최근 접속종료시간
		, 	@totaltime	int		-- 총접속 시간
		,	@flag		int		-- 접속여부
		,	@count		int		-- 계정의 생성 캐릭 수



	-- 접속여부 체크
	if exists (select * from logintable where propid = @memberno)
	begin
		set @flag = 1
	end
	else
	begin
		set @flag = 0
	end
	--

	-- 최근 접속 시간 및 종료 시간 획득
	 select @logindate = game_in_date, @logoutdate = game_out_date from chr_log_info
	 where propid = @memberno

	-- 총 접속 시간 계산
	-- 대책을 마련할것...
	set @totaltime = 0

	select 	@flag,
		a.propid, 
		a.id_loginid, 
		a.id_passwd, 
		b.id_name, 
		b.id_jumin, 
		b.id_tel, 
		b.id_email, 
		convert(varchar(30), a.id_regdate, 120),
		convert(varchar(30), @logindate, 120),
		convert(varchar(30), @logoutdate, 120),
		@totaltime,
		a.userlevel,
		@server
	from chr_log_info a
	inner join chr_log_info_plus b on a.id_loginid = b.id_loginid
	where a.propid = @memberno
GO
/****** Object:  StoredProcedure [dbo].[TP_USER_SELECT]    Script Date: 07/30/2013 16:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071224 錠輿, 纔檜綰 蝶警擊 瞳啪 紫煙 堅, 碳蹂 薑溺 薯剪(0.0146->0.00328)
071231 錠輿, 嶸盪 檣策蝶蒂 匐儀 褻勒縑 
090122 LUJ, 僥濠翮 睡碟 匐儀 雖錳
*/
CREATE   PROCEDURE [dbo].[TP_USER_SELECT]
(
	@INDEX	INT,
	@ID		VARCHAR( 20 ),
	@NAME	VARCHAR( 20 )	-- MAX_NAME_LENGTH爾棻 醴撿棻
)
AS
	SET NOCOUNT ON
	
	IF 0 < @INDEX
	BEGIN
		SELECT	TOP 20
				propid,
				id_loginid
		FROM	chr_log_info
		WHERE	propid = @INDEX
		RETURN
	END
	ELSE IF 0 < DATALENGTH( @ID )
	BEGIN
		-- 090122 LUJ, 僥濠翮 睡碟 匐儀 雖錳
		SELECT	TOP 20
			propid,
			id_loginid
		FROM	chr_log_info
		WHERE	id_loginid LIKE @ID
	END
	ELSE IF 0 < DATALENGTH( @NAME )
	BEGIN
		-- 090122 LUJ, 僥濠翮 睡碟 匐儀 雖錳
		SELECT  TOP 20
			C.propid,
			C.id_loginid
		FROM    chr_log_info C INNER JOIN
		        chr_log_info_plus P ON C.id_loginid = P.id_loginid
		WHERE	P.id_name LIKE @NAME
	END
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[TP_USER_DATA_SELECT]    Script Date: 07/30/2013 16:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
071224 웅주, 쿼리 튜닝(0.0593 -> 0.0131)
080102 웅주, ID로도 쿼리할 수 있도록 함
080103 웅주, 유저 인덱스로만 쿼리하도록 함
*/
CREATE  PROCEDURE [dbo].[TP_USER_DATA_SELECT]
(
	@USER_IDX	INT,
	@USER_ID	VARCHAR( 20 )
)
AS
	SET NOCOUNT ON
	
	DECLARE @NAME	VARCHAR( 16 )
	DECLARE @AGENT	INT
	DECLARE @IP		VARCHAR( 50 )
	
	SELECT	@AGENT = AGENT_NO,
			@IP = IP
	FROM	LOGINTABLE
	WHERE	USER_ID = @USER_ID
	
	SELECT	@NAME = ID_NAME
	FROM	CHR_LOG_INFO_PLUS
	WHERE	ID_LOGINID IN
	(
		SELECT	ID_LOGINID
		FROM	CHR_LOG_INFO
		WHERE	PROPID = @USER_IDX
	)
	
	SELECT	PROPID,
			ID_LOGINID,
			ISNULL( @NAME, '' ),
			ID_REGDATE,
			GAME_OUT_DATE,
			TOTAL_GAME_TIME,
			USERLEVEL,
			ISNULL( @IP, '' ),
			ISNULL( @AGENT, '' )
	FROM	CHR_LOG_INFO
	WHERE	PROPID = @USER_IDX
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[up_event_From_Game_insert]    Script Date: 07/30/2013 16:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[up_event_From_Game_insert]
@propid	     int,          
@chrname  varchar( 16 ),  
@server	    tinyint  

as

set nocount on

declare @login_id varchar( 20 )
select @login_id = id_loginid from chr_log_info
where propid = @propid    

if exists(select * from dbo.event20080925_LongTimePoint with(nolock) where login_id = @login_id)  
begin  
	update dbo.event20080925_LongTimePoint set xp = xp + 1, pt = pt + 1  
	where login_id = @login_id  
end    
else  
begin  
	insert into dbo.event20080925_LongTimePoint(propid,login_id,xp,pt,regdate)
	values(@propid,@login_id,1,1,getdate())  
end

insert into dbo.event20080925_LongTimePoint_LOG(login_id,serverNo,chr_name,xp,regdate)
values(@login_id,@server,@chrName,1,getdate())
GO
/****** Object:  StoredProcedure [dbo].[TP_SearchUserIPTime]    Script Date: 07/30/2013 16:04:59 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** 개체: 저장 프로시저 dbo.TP_SearchUserIPTime    스크립트 날짜: 2006-07-26 오후 4:09:33 ******/

CREATE      proc [dbo].[TP_SearchUserIPTime]
(
	@ServerNum	int,
	@UserID		varchar(20)
)

as
	Set Nocount on

	select top 1 * from login_log where login_id = @UserID order by start_date desc
GO
/****** Object:  StoredProcedure [dbo].[up_Agent_Down]    Script Date: 07/30/2013 16:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 개체: 저장 프로시저 dbo.up_Agent_Down    스크립트 날짜: 2006-07-26 오후 4:09:34 ******/

CREATE   PROC [dbo].[up_Agent_Down]
/*
작성일 : 2004.10.12 오후 4:11
작성자 : 이상원
수정 : 해당 서버 전체 로그아웃 처리
*/
(  
@kind  char(2),    --서버 구분 1/2/3/...
@agent_no char(2)
)  
AS
SET NOCOUNT ON   

DECLARE @nalja varchar(10)  
DECLARE @SQL1 varchar(455)  
DECLARE @SQL2 varchar(455)  
   
BEGIN  
/*
-- login_log 저장        
SET @nalja=(select convert(varchar(4),year(getdate()))+convert(varchar(4),month(getdate()))+convert(varchar(4),day(getdate())))        
SET @SQL1='insert login_log_'+@nalja+'(login_id,type,status,time,today,today_day,ip,propid,kind) '        
SET @SQL2=' select user_id,0,2,getdate(),DATEPART(yyyy,  getdate())*1000000+DATEPART(mm, getdate())*10000+DATEPART(dd,  getdate())*100+datepart(hh,getdate()),DATEPART(yyyy,  getdate())*10000+DATEPART(mm, getdate())*100+DATEPART(dd,  getdate()),ip,propid,k
ind from logintable where kind='+@kind+' and agent_no='+@agent_no        
      
exec (@SQL1+@SQL2)         
*/       
update dbo.login_log set end_date = getdate()    
from login_log A   
inner join logintable B   
on A.start_date = B.login_date and A.login_id = b.[user_id] and A.server_no = B.kind  
where B.kind = @kind and B.agent_no = @agent_no
         
-- Logintable 에 데이타 삭제        
Delete FROM Logintable         
where kind=@kind and agent_no=@agent_no  


END
GO
/****** Object:  StoredProcedure [dbo].[up_GameLogout]    Script Date: 07/30/2013 16:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 개체: 저장 프로시저 dbo.up_GameLogout    스크립트 날짜: 2006-07-26 오후 4:09:34 ******/





--exec up_GameLogout_test 104387




CREATE        PROC [dbo].[up_GameLogout]
(        
/*
작성자 : 김현수(sizz@esofnet.com)
요약 : 코룸 게임 로그아웃 빼끼기
작성일 : 2004.01.20. 오전 10 : 18
수정사항 : 상용화 V. 0.2
*/
@propid varchar(20),
@KIND INT = 0
)        
AS        

SET NOCOUNT ON         

DECLARE @login_id varchar(20)      --아이디
DECLARE @ip char(15)      --접속 아이피
DECLARE @type int      --결제타입에 따라서 다른 로그아웃 처리
DECLARE @USE_TIME int      --사용한 시간(개인,1시간무료 및 PC방 시간제)

DECLARE @nalja varchar(10)      --날짜 (2004106)
DECLARE @play_time int      --플레이시간   

DECLARE @SQL varchar(4000)      --쿼리 작성용 변수       

DECLARE @utime int


DECLARE @PC_ID varchar(20)	--PC방 아이디

DECLARE @cur_day  char(10) --'현재시간 


--넘어온 유저 고유값에 해당하는 아이디를 가져온다
Set @login_id = (Select id_loginid From chr_log_info with(nolock) where propid=@propid)

/*@type
0 - 무조건 공짜

1 - PC방 IP  PC_ip_ing/pc_ranky
2 - 개인 기간
3 - PC방 시간 pc_ranky/Time_PC
4 - 개인 시간  Time_User
9 - 무료 1시간
*/

set @type=0

--해당 아이디가 LoginTable에 존재한다면 (즉, 게임에 접속중이라면)
IF EXISTS (SELECT 1 FROM LoginTable with(nolock) WHERE user_id = @login_id)
     BEGIN	
          --접속 아이피, 접속한 서버, 과금 타입, 플레이한 시간을 가져온다
         --SELECT @ip=ip, @kind=kind, @type=type, @USE_TIME=DATEDIFF(ss,Login_Date,getdate()) 
	SELECT @USE_TIME=DATEDIFF(ss,Login_Date,getdate()) 
              FROM LoginTable with(nolock) 
              WHERE user_id = @login_id
	BEGIN TRAN
	
	UPDATE LOGIN_LOG
	SET END_DATE = GETDATE()
	WHERE LOGIN_ID  = @LOGIN_ID AND
		START_DATE IN
	(
		SELECT LOGIN_DATE
		FROM LOGINTABLE WITH(READUNCOMMITTED)
		WHERE USER_ID = @LOGIN_ID
	)
    --2. 나간 시간 저장하기	
	UPDATE chr_log_info 
              SET game_out_date=getdate(), total_game_time=total_game_time+@USE_TIME 
              WHERE id_loginid=@login_id

               --개인날짜별  플레이시간 저장(통계)---------------------------	
               SET @play_time =(SELECT datediff(mi,game_in_date,game_out_date) FROM chr_log_info with(nolock) WHERE id_loginid=@login_id)

              SET @cur_day = (SELECT convert(char(10),getdate(),112)) 

               IF EXISTS (SELECT 1 FROM play_time_log with(nolock) WHERE id_loginid=@login_id and play_date=@cur_day)
                    BEGIN
                         UPDATE play_time_log 
                         SET usetime=usetime + @play_time 
                         WHERE id_loginid=@login_id and play_date=@cur_day
                    END
               ELSE
                    BEGIN
                         INSERT INTO play_time_log (play_Date,id_loginid,usetime) VALUES(@cur_day,@login_id,@play_time)
                    END

               -- 3. Logintable 에 데이타 삭제
	 DELETE FROM LoginTable 
               WHERE user_id = @login_id  

               /*공통 처리사항 */
	 IF @@error > 0
	      BEGIN
	           ROLLBACK TRAN
	           RETURN 0
	      END
	 ELSE
	      BEGIN
	           COMMIT TRAN
         RETURN 1
	      END		
     END
GO
/****** Object:  StoredProcedure [dbo].[TP_SearchUserLoginChk]    Script Date: 07/30/2013 16:04:59 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** 개체: 저장 프로시저 dbo.TP_SearchUserLoginChk    스크립트 날짜: 2006-07-26 오후 4:09:33 ******/

/****** 개체: 저장 프로시저 dbo.TP_SearchUserLoginChk    스크립트 날짜: 2006-06-30 오후 7:58:19 ******/

CREATE      proc [dbo].[TP_SearchUserLoginChk]
(
	@Useridx		int
)

as
	Set Nocount on

	select count(propid) from logintable where propid = @Useridx
GO
/****** Object:  StoredProcedure [dbo].[RP_SearchUserInfoByMemberNo_JP]    Script Date: 07/30/2013 16:04:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 개체: 저장 프로시저 dbo.RP_SearchUserInfoByMemberNo_JP    스크립트 날짜: 2006-07-26 오후 4:09:33 ******/








CREATE          proc [dbo].[RP_SearchUserInfoByMemberNo_JP]
(
		@server		int
	,	@memberno	int
)

as
	Set Nocount on
	Set Xact_Abort on

	declare 		@logindate	smalldatetime	-- 최근 접속 시간
		,	@logoutdate	smalldatetime	-- 최근 접속종료시간
		, 	@totaltime	int		-- 총접속 시간
		,	@flag		int		-- 접속여부
		,	@count		int		-- 계정의 생성 캐릭 수



	-- 접속여부 체크
	if exists (select * from logintable where propid = @memberno)
	begin
		set @flag = 1
	end
	else
	begin
		set @flag = 0
	end
	--

	-- 최근 접속 시간 및 종료 시간 획득
	 select @logindate = game_in_date, @logoutdate = game_out_date from chr_log_info
	 where propid = @memberno

	-- 총 접속 시간 계산
	-- 대책을 마련할것...
	set @totaltime = 0

	select 	@flag,
		num,
		uid,
		pwd,
		name_chn,
		name_hir,
		'',
		'',
		'',
		'',
		'',
		0,
		mem_lvl,
		@server
	from Mem_Login where num = @memberno
GO
