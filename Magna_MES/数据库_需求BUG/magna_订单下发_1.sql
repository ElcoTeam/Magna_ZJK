USE [master]
GO
/****** Object:  Database [MagnaDB]    Script Date: 2016/9/21 17:32:23 ******/
CREATE DATABASE [MagnaDB] ON  PRIMARY 
( NAME = N'MagnaDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\MagnaDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MagnaDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\MagnaDB_log.ldf' , SIZE = 3456KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
ALTER DATABASE [MagnaDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MagnaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MagnaDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MagnaDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MagnaDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MagnaDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MagnaDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MagnaDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MagnaDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [MagnaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MagnaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MagnaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MagnaDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MagnaDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MagnaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MagnaDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MagnaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MagnaDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MagnaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MagnaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MagnaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MagnaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MagnaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MagnaDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MagnaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MagnaDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MagnaDB] SET  MULTI_USER 
GO
ALTER DATABASE [MagnaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MagnaDB] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MagnaDB', N'ON'
GO
USE [MagnaDB]
GO
/****** Object:  Table [dbo].[mg_allpart]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_allpart](
	[all_id] [int] NULL,
	[all_no] [nvarchar](50) NULL,
	[all_rateid] [int] NULL,
	[all_ratename] [nvarchar](50) NULL,
	[all_colorid] [int] NULL,
	[all_colorname] [nvarchar](50) NULL,
	[all_metaid] [int] NULL,
	[all_metaname] [nvarchar](50) NULL,
	[all_desc] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_allpart_part_rel]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_allpart_part_rel](
	[all_id] [int] NULL,
	[partid_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_BOM]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mg_BOM](
	[bom_id] [int] NULL,
	[bom_PN] [nvarchar](50) NULL,
	[bom_customerPN] [nvarchar](50) NULL,
	[bom_isCustomerPN] [int] NULL,
	[bom_leve] [int] NULL,
	[bom_materialid] [int] NULL,
	[bom_material] [nvarchar](500) NULL,
	[bom_suppllerid] [int] NULL,
	[bom_suppller] [nvarchar](500) NULL,
	[bom_categoryid] [int] NULL,
	[bom_category] [nvarchar](50) NULL,
	[bom_colorid] [int] NULL,
	[bom_colorname] [varchar](50) NULL,
	[bom_profile] [nvarchar](50) NULL,
	[bom_weight] [int] NULL,
	[bom_desc] [nvarchar](500) NULL,
	[bom_descCH] [varchar](500) NULL,
	[bom_picture] [nvarchar](500) NULL,
	[bom_rescanCode] [varchar](500) NULL,
	[bom_storeid] [int] NULL,
	[bom_storeName] [varchar](50) NULL,
	[bom_name] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mg_classes]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_classes](
	[cl_id] [int] NULL,
	[cl_name] [nvarchar](50) NULL,
	[cl_starttime] [datetime] NULL,
	[cl_endtime] [datetime] NULL,
	[st_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_cusOrder_Allpart_rel]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_cusOrder_Allpart_rel](
	[co_id] [int] NULL,
	[all_id] [int] NULL,
	[co_count] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_CustomerOrder]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_CustomerOrder](
	[co_id] [numeric](18, 0) NULL,
	[co_no] [nvarchar](50) NULL,
	[all_id] [nvarchar](500) NULL,
	[co_count] [int] NULL,
	[co_cutomerid] [int] NULL,
	[co_customer] [nvarchar](500) NULL,
	[co_state] [int] NULL,
	[co_order] [int] NULL,
	[co_createtime] [datetime] NULL,
	[co_isCutted] [int] NULL,
	[co_producing] [int] NULL,
	[co_finish] [int] NULL,
	[co_starttime] [datetime] NULL,
	[co_endtime] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_Department]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mg_Department](
	[dep_id] [int] NULL,
	[dep_name] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mg_FlowLine]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_FlowLine](
	[fl_id] [int] NULL,
	[fl_name] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_ODS]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mg_ODS](
	[ods_id] [int] NULL,
	[step_id] [int] NULL,
	[ods_name] [varchar](5000) NULL,
	[ods_keywords] [varchar](5000) NULL,
	[ods_order] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mg_Operator]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mg_Operator](
	[op_id] [int] NULL,
	[st_id] [int] NULL,
	[op_name] [nvarchar](50) NULL,
	[op_no] [nvarchar](50) NULL,
	[op_pic] [varchar](500) NULL,
	[op_isoperator] [int] NULL,
	[op_mac] [nvarchar](50) NULL,
	[op_sex] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mg_Order]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_Order](
	[or_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[co_no] [nvarchar](50) NULL,
	[or_no] [numeric](18, 0) NOT NULL,
	[all_no] [nvarchar](50) NULL,
	[or_count] [int] NULL,
	[or_starttime] [datetime] NULL,
	[or_endtime] [datetime] NULL,
	[or_state] [int] NULL,
	[or_duringtime] [bigint] NULL,
 CONSTRAINT [PK_mg_Order] PRIMARY KEY CLUSTERED 
(
	[or_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_order_flowline_rel]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_order_flowline_rel](
	[or_id] [int] NULL,
	[fl_id] [int] NULL,
	[fl_starttime] [int] NULL,
	[fl_endtime] [int] NULL,
	[fl_flag] [int] NULL,
	[fl_duringtime] [bigint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_Order_FSD]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mg_Order_FSD](
	[ofsd_pre] [varchar](50) NULL,
	[ofsd_id] [int] NULL,
	[co_id] [int] NULL,
	[part_no] [varchar](50) NULL,
	[ofsd_cdstr] [varchar](50) NULL,
	[ofsd_createdate] [datetime] NULL,
	[ofsd_unproducing] [int] NULL,
	[ofsd_producing] [int] NULL,
	[ofsd_finish] [int] NULL,
	[ofsd_starttime] [datetime] NULL,
	[ofsd_endtime] [datetime] NULL,
	[ofsd_isPLC] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mg_Order_FSDB]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mg_Order_FSDB](
	[ofsdb_pre] [varchar](50) NULL,
	[ofsdb_id] [int] NULL,
	[co_id] [int] NULL,
	[part_no] [varchar](50) NULL,
	[ofsdb_cdstr] [varchar](50) NULL,
	[ofsdb_createdate] [datetime] NULL,
	[ofsdb_unproducing] [int] NULL,
	[ofsdb_producing] [int] NULL,
	[ofsdb_finish] [int] NULL,
	[ofsdb_starttime] [datetime] NULL,
	[ofsdb_endtime] [datetime] NULL,
	[ofsdb_isPLC] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mg_Order_FSDC]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mg_Order_FSDC](
	[ofsdc_pre] [varchar](50) NULL,
	[ofsdc_id] [int] NULL,
	[co_id] [int] NULL,
	[part_no] [varchar](50) NULL,
	[ofsdc_cdstr] [varchar](50) NULL,
	[ofsdc_createdate] [datetime] NULL,
	[ofsdc_unproducing] [int] NULL,
	[ofsdc_producing] [int] NULL,
	[ofsdc_finish] [int] NULL,
	[ofsdc_starttime] [datetime] NULL,
	[ofsdc_endtime] [datetime] NULL,
	[ofsdc_isPLC] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mg_Order_FSP]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mg_Order_FSP](
	[ofsp_pre] [varchar](50) NULL,
	[ofsp_id] [int] NULL,
	[co_id] [int] NULL,
	[part_no] [varchar](50) NULL,
	[ofsp_cdstr] [varchar](50) NULL,
	[ofsp_createdate] [datetime] NULL,
	[ofsp_unproducing] [int] NULL,
	[ofsp_producing] [int] NULL,
	[ofsp_finish] [int] NULL,
	[ofsp_starttime] [datetime] NULL,
	[ofsp_endtime] [datetime] NULL,
	[ofsp_isPLC] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mg_Order_FSPB]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mg_Order_FSPB](
	[ofspb_pre] [varchar](50) NULL,
	[ofspb_id] [int] NULL,
	[co_id] [int] NULL,
	[part_no] [varchar](50) NULL,
	[ofspb_cdstr] [varchar](50) NULL,
	[ofspb_createdate] [datetime] NULL,
	[ofspb_unproducing] [int] NULL,
	[ofspb_producing] [int] NULL,
	[ofspb_finish] [int] NULL,
	[ofspb_starttime] [datetime] NULL,
	[ofspb_endtime] [datetime] NULL,
	[ofspb_isPLC] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mg_Order_FSPC]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mg_Order_FSPC](
	[ofspc_pre] [varchar](50) NULL,
	[ofspc_id] [int] NULL,
	[co_id] [int] NULL,
	[part_no] [varchar](50) NULL,
	[ofspc_cdstr] [varchar](50) NULL,
	[ofspc_createdate] [datetime] NULL,
	[ofspc_unproducing] [int] NULL,
	[ofspc_producing] [int] NULL,
	[ofspc_finish] [int] NULL,
	[ofspc_starttime] [datetime] NULL,
	[ofspc_endtime] [datetime] NULL,
	[ofspc_isPLC] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mg_Order_RSB40]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mg_Order_RSB40](
	[orsb40_pre] [varchar](50) NULL,
	[orsb40_id] [int] NULL,
	[co_id] [int] NULL,
	[part_no] [varchar](50) NULL,
	[orsb40_cdstr] [varchar](50) NULL,
	[orsb40_createdate] [datetime] NULL,
	[orsb40_unproducing] [int] NULL,
	[orsb40_producing] [int] NULL,
	[orsb40_finish] [int] NULL,
	[orsb40_starttime] [datetime] NULL,
	[orsb40_endtime] [datetime] NULL,
	[orsb40_isPLC] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mg_Order_RSB60]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mg_Order_RSB60](
	[orsb60_pre] [varchar](50) NULL,
	[orsb60_id] [int] NULL,
	[co_id] [int] NULL,
	[part_no] [varchar](50) NULL,
	[orsb60_cdstr] [varchar](50) NULL,
	[orsb60_createdate] [datetime] NULL,
	[orsb60_unproducing] [int] NULL,
	[orsb60_producing] [int] NULL,
	[orsb60_finish] [int] NULL,
	[orsb60_starttime] [datetime] NULL,
	[orsb60_endtime] [datetime] NULL,
	[orsb60_isPLC] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mg_Order_RSC]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mg_Order_RSC](
	[orsc_pre] [varchar](50) NULL,
	[orsc_id] [int] NULL,
	[co_id] [int] NULL,
	[part_no] [varchar](50) NULL,
	[orsc_cdstr] [varchar](50) NULL,
	[orsc_createdate] [datetime] NULL,
	[orsc_unproducing] [int] NULL,
	[orsc_producing] [int] NULL,
	[orsc_finish] [int] NULL,
	[orsc_starttime] [datetime] NULL,
	[orsc_endtime] [datetime] NULL,
	[orsc_isPLC] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mg_part]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_part](
	[part_id] [int] NULL,
	[part_no] [nvarchar](50) NULL,
	[part_name] [nvarchar](50) NULL,
	[part_desc] [nvarchar](500) NULL,
	[part_categoryid] [int] NULL,
	[part_Category] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_part_bom_rel]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_part_bom_rel](
	[part_id] [int] NULL,
	[bom_id] [int] NULL,
	[bom_count] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_Position]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mg_Position](
	[posi_id] [int] NULL,
	[posi_name] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mg_Property]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mg_Property](
	[prop_id] [int] NULL,
	[Prop_type] [int] NULL,
	[prop_name] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mg_State]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_State](
	[st_id] [int] NOT NULL,
	[st_name] [nvarchar](50) NOT NULL,
	[st_color] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_station]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mg_station](
	[st_id] [int] NULL,
	[fl_id] [int] NULL,
	[st_no] [nvarchar](50) NULL,
	[st_pretime] [datetime] NULL,
	[st_ispre] [int] NULL,
	[st_name] [nvarchar](50) NULL,
	[st_mac] [varchar](50) NULL,
	[st_typeid] [int] NULL,
	[st_typename] [varchar](50) NULL,
	[st_order] [int] NULL,
	[st_odsfile] [varchar](500) NULL,
	[st_mushifile] [varchar](500) NULL,
	[st_isfirst] [int] NULL,
	[st_isend] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mg_Station_State]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_Station_State](
	[st_id_TV] [int] NOT NULL,
	[st_id] [int] NOT NULL,
	[st_no] [nvarchar](50) NOT NULL,
	[st_state] [int] NOT NULL,
 CONSTRAINT [PK_mg_Station_State] PRIMARY KEY CLUSTERED 
(
	[st_id_TV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_step]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_step](
	[step_id] [int] NULL,
	[step_name] [nvarchar](50) NULL,
	[fl_id] [int] NULL,
	[st_id] [int] NULL,
	[bom_id] [int] NULL,
	[bom_count] [int] NULL,
	[step_clock] [int] NULL,
	[step_desc] [nvarchar](500) NULL,
	[step_pic] [nvarchar](500) NULL,
	[step_plccode] [int] NULL,
	[step_order] [int] NULL,
	[part_id] [int] NULL,
	[step_scanCode] [int] NULL,
	[Step_matchResult] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_step_log]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_step_log](
	[step_id] [int] NULL,
	[step_name] [nvarchar](50) NULL,
	[st_id] [int] NULL,
	[st_name] [nvarchar](50) NULL,
	[bom_id] [int] NULL,
	[bom_name] [nvarchar](50) NULL,
	[bom_count] [int] NULL,
	[step_starttime] [datetime] NULL,
	[step_endtime] [datetime] NULL,
	[step_duringtime] [bigint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_sys_log]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_sys_log](
	[sys_id] [int] IDENTITY(1,1) NOT NULL,
	[op_id] [int] NOT NULL,
	[op_name] [nvarchar](50) NOT NULL,
	[fl_id] [int] NOT NULL,
	[fl_name] [nvarchar](50) NOT NULL,
	[st_id] [int] NOT NULL,
	[st_no] [nvarchar](50) NOT NULL,
	[or_no] [nvarchar](50) NOT NULL,
	[part_no] [nvarchar](50) NOT NULL,
	[step_order] [int] NOT NULL,
	[step_startTime] [datetime] NOT NULL,
	[step_endTime] [datetime] NULL,
	[step_duringtime] [int] NOT NULL,
	[AngleResult] [float] NULL,
	[TorqueResult] [float] NULL,
	[scanCode] [nvarchar](50) NULL,
	[scanResult] [int] NULL,
	[sys_desc] [nvarchar](500) NULL,
 CONSTRAINT [PK_mg_sys_log] PRIMARY KEY CLUSTERED 
(
	[sys_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_User]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mg_User](
	[user_id] [int] NULL,
	[user_pwd] [varchar](50) NULL,
	[user_name] [varchar](50) NULL,
	[user_no] [varchar](50) NULL,
	[user_pic] [varchar](500) NULL,
	[posi_id] [varchar](50) NULL,
	[user_email] [varchar](50) NULL,
	[user_depid] [int] NULL,
	[user_posiid] [int] NULL,
	[user_menuids] [varchar](500) NULL,
	[user_sex] [int] NULL,
	[user_isAdmin] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[View_Station]    Script Date: 2016/9/21 17:32:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Station]
AS
SELECT   dbo.mg_station.st_id, dbo.mg_station.st_no, dbo.mg_station.st_name, dbo.mg_FlowLine.fl_name, 
                CASE dbo.mg_station.st_ispre WHEN 1 THEN '是' WHEN 0 THEN '否' END AS st_pre
FROM      dbo.mg_FlowLine RIGHT OUTER JOIN
                dbo.mg_station ON dbo.mg_FlowLine.fl_id = dbo.mg_station.fl_id

GO
INSERT [dbo].[mg_allpart] ([all_id], [all_no], [all_rateid], [all_ratename], [all_colorid], [all_colorname], [all_metaid], [all_metaname], [all_desc]) VALUES (5, N'B', 3, NULL, 10, NULL, 12, NULL, N'写代码写近视了')
INSERT [dbo].[mg_allpart] ([all_id], [all_no], [all_rateid], [all_ratename], [all_colorid], [all_colorname], [all_metaid], [all_metaname], [all_desc]) VALUES (6, N'C', 1, NULL, 11, NULL, 15, NULL, N'程序员命苦啊')
INSERT [dbo].[mg_allpart] ([all_id], [all_no], [all_rateid], [all_ratename], [all_colorid], [all_colorname], [all_metaid], [all_metaname], [all_desc]) VALUES (4, N'A', 5, NULL, 8, NULL, 12, NULL, N'天天加班，悲催的命')
INSERT [dbo].[mg_allpart_part_rel] ([all_id], [partid_id]) VALUES (4, 10)
INSERT [dbo].[mg_allpart_part_rel] ([all_id], [partid_id]) VALUES (4, 9)
INSERT [dbo].[mg_allpart_part_rel] ([all_id], [partid_id]) VALUES (4, 3)
INSERT [dbo].[mg_allpart_part_rel] ([all_id], [partid_id]) VALUES (4, 7)
INSERT [dbo].[mg_allpart_part_rel] ([all_id], [partid_id]) VALUES (4, 6)
INSERT [dbo].[mg_allpart_part_rel] ([all_id], [partid_id]) VALUES (4, 12)
INSERT [dbo].[mg_allpart_part_rel] ([all_id], [partid_id]) VALUES (4, 11)
INSERT [dbo].[mg_allpart_part_rel] ([all_id], [partid_id]) VALUES (4, 8)
INSERT [dbo].[mg_allpart_part_rel] ([all_id], [partid_id]) VALUES (4, 5)
INSERT [dbo].[mg_allpart_part_rel] ([all_id], [partid_id]) VALUES (5, 2)
INSERT [dbo].[mg_allpart_part_rel] ([all_id], [partid_id]) VALUES (5, 1)
INSERT [dbo].[mg_allpart_part_rel] ([all_id], [partid_id]) VALUES (5, 13)
INSERT [dbo].[mg_allpart_part_rel] ([all_id], [partid_id]) VALUES (5, 14)
INSERT [dbo].[mg_allpart_part_rel] ([all_id], [partid_id]) VALUES (5, 15)
INSERT [dbo].[mg_allpart_part_rel] ([all_id], [partid_id]) VALUES (5, 16)
INSERT [dbo].[mg_allpart_part_rel] ([all_id], [partid_id]) VALUES (5, 17)
INSERT [dbo].[mg_allpart_part_rel] ([all_id], [partid_id]) VALUES (5, 18)
INSERT [dbo].[mg_allpart_part_rel] ([all_id], [partid_id]) VALUES (5, 19)
INSERT [dbo].[mg_BOM] ([bom_id], [bom_PN], [bom_customerPN], [bom_isCustomerPN], [bom_leve], [bom_materialid], [bom_material], [bom_suppllerid], [bom_suppller], [bom_categoryid], [bom_category], [bom_colorid], [bom_colorname], [bom_profile], [bom_weight], [bom_desc], [bom_descCH], [bom_picture], [bom_rescanCode], [bom_storeid], [bom_storeName], [bom_name]) VALUES (5, N'bom-5', N'ert', 1, 20, 25, N'1', 28, N'1', 18, N'1', 22, NULL, N'1321321', 122, N'1432432', N'564465464', N'/UploadImages/BOMImages/flag_20160819033830.png', NULL, 55, NULL, NULL)
INSERT [dbo].[mg_BOM] ([bom_id], [bom_PN], [bom_customerPN], [bom_isCustomerPN], [bom_leve], [bom_materialid], [bom_material], [bom_suppllerid], [bom_suppller], [bom_categoryid], [bom_category], [bom_colorid], [bom_colorname], [bom_profile], [bom_weight], [bom_desc], [bom_descCH], [bom_picture], [bom_rescanCode], [bom_storeid], [bom_storeName], [bom_name]) VALUES (12, N'bom-1', N'8889331254', 1, 21, 27, NULL, 30, NULL, 16, NULL, 24, NULL, N'yyyyy', 12, N'uuuu', N'iiiii', N'/UploadImages/BOMImages/liwu_20160822102612.png', NULL, 51, NULL, NULL)
INSERT [dbo].[mg_BOM] ([bom_id], [bom_PN], [bom_customerPN], [bom_isCustomerPN], [bom_leve], [bom_materialid], [bom_material], [bom_suppllerid], [bom_suppller], [bom_categoryid], [bom_category], [bom_colorid], [bom_colorname], [bom_profile], [bom_weight], [bom_desc], [bom_descCH], [bom_picture], [bom_rescanCode], [bom_storeid], [bom_storeName], [bom_name]) VALUES (9, N'bom-4', N'8888269613', 0, 21, 27, NULL, 29, NULL, 16, NULL, 23, NULL, N'aaaa', 120, N'bbbb', N'cccc', N'/UploadImages/BOMImages/无标题_20160819022818.png', NULL, 54, NULL, NULL)
INSERT [dbo].[mg_BOM] ([bom_id], [bom_PN], [bom_customerPN], [bom_isCustomerPN], [bom_leve], [bom_materialid], [bom_material], [bom_suppllerid], [bom_suppller], [bom_categoryid], [bom_category], [bom_colorid], [bom_colorname], [bom_profile], [bom_weight], [bom_desc], [bom_descCH], [bom_picture], [bom_rescanCode], [bom_storeid], [bom_storeName], [bom_name]) VALUES (10, N'bom-3', N'8888269616', 0, 20, 27, NULL, 28, NULL, 18, NULL, 22, NULL, N'111', 2, N'222', N'3333', N'/UploadImages/BOMImages/1_20160819022959.png', NULL, 53, NULL, NULL)
INSERT [dbo].[mg_BOM] ([bom_id], [bom_PN], [bom_customerPN], [bom_isCustomerPN], [bom_leve], [bom_materialid], [bom_material], [bom_suppllerid], [bom_suppller], [bom_categoryid], [bom_category], [bom_colorid], [bom_colorname], [bom_profile], [bom_weight], [bom_desc], [bom_descCH], [bom_picture], [bom_rescanCode], [bom_storeid], [bom_storeName], [bom_name]) VALUES (11, N'bom-2', N'8888269619', 0, 21, 26, NULL, 30, NULL, 17, NULL, 24, NULL, N'qqqq', 3, N'wwww', N'eeeeee', N'/UploadImages/BOMImages/无标题_20160819023408.png', NULL, 52, NULL, NULL)
INSERT [dbo].[mg_BOM] ([bom_id], [bom_PN], [bom_customerPN], [bom_isCustomerPN], [bom_leve], [bom_materialid], [bom_material], [bom_suppllerid], [bom_suppller], [bom_categoryid], [bom_category], [bom_colorid], [bom_colorname], [bom_profile], [bom_weight], [bom_desc], [bom_descCH], [bom_picture], [bom_rescanCode], [bom_storeid], [bom_storeName], [bom_name]) VALUES (17, N'70107866-01', N'70107866-01', 0, 21, 27, NULL, 29, NULL, 16, NULL, 23, NULL, N'cccc', 1, N'aaaaaa', N'bbbb', N'/UploadImages/BOMImages/flag_20160830043336.png', NULL, 52, NULL, NULL)
INSERT [dbo].[mg_BOM] ([bom_id], [bom_PN], [bom_customerPN], [bom_isCustomerPN], [bom_leve], [bom_materialid], [bom_material], [bom_suppllerid], [bom_suppller], [bom_categoryid], [bom_category], [bom_colorid], [bom_colorname], [bom_profile], [bom_weight], [bom_desc], [bom_descCH], [bom_picture], [bom_rescanCode], [bom_storeid], [bom_storeName], [bom_name]) VALUES (13, N'bom-6', N'65656', 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, N'', 0, N'', N'', N'/image/admin/system_run.png', NULL, 56, NULL, NULL)
INSERT [dbo].[mg_BOM] ([bom_id], [bom_PN], [bom_customerPN], [bom_isCustomerPN], [bom_leve], [bom_materialid], [bom_material], [bom_suppllerid], [bom_suppller], [bom_categoryid], [bom_category], [bom_colorid], [bom_colorname], [bom_profile], [bom_weight], [bom_desc], [bom_descCH], [bom_picture], [bom_rescanCode], [bom_storeid], [bom_storeName], [bom_name]) VALUES (14, N'bom-7', N'', 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, N'', 0, N'', N'', N'/image/admin/system_run.png', NULL, 57, NULL, NULL)
INSERT [dbo].[mg_BOM] ([bom_id], [bom_PN], [bom_customerPN], [bom_isCustomerPN], [bom_leve], [bom_materialid], [bom_material], [bom_suppllerid], [bom_suppller], [bom_categoryid], [bom_category], [bom_colorid], [bom_colorname], [bom_profile], [bom_weight], [bom_desc], [bom_descCH], [bom_picture], [bom_rescanCode], [bom_storeid], [bom_storeName], [bom_name]) VALUES (15, N'70107866-03', N'70107866-03', 0, 21, 25, NULL, 30, NULL, 18, NULL, 24, NULL, N'jjj', 7, N'kkk', N'lll', N'/UploadImages/BOMImages/searchSmall_20160830043449.png', NULL, 52, NULL, NULL)
INSERT [dbo].[mg_BOM] ([bom_id], [bom_PN], [bom_customerPN], [bom_isCustomerPN], [bom_leve], [bom_materialid], [bom_material], [bom_suppllerid], [bom_suppller], [bom_categoryid], [bom_category], [bom_colorid], [bom_colorname], [bom_profile], [bom_weight], [bom_desc], [bom_descCH], [bom_picture], [bom_rescanCode], [bom_storeid], [bom_storeName], [bom_name]) VALUES (16, N'70107866-02', N'70107866-02', 0, 21, 26, NULL, 30, NULL, 17, NULL, 23, NULL, N'ttt', 2, N'yyy', N'uuu', N'/UploadImages/BOMImages/gift_middle_20160830043415.png', NULL, 56, NULL, NULL)
INSERT [dbo].[mg_classes] ([cl_id], [cl_name], [cl_starttime], [cl_endtime], [st_id]) VALUES (6, N'班次名称1', CAST(0x0000A648008C1360 AS DateTime), CAST(0x0000A64801206420 AS DateTime), NULL)
INSERT [dbo].[mg_classes] ([cl_id], [cl_name], [cl_starttime], [cl_endtime], [st_id]) VALUES (7, N'班次名称2', CAST(0x0000A64801206420 AS DateTime), CAST(0x0000A648007B98A0 AS DateTime), NULL)
INSERT [dbo].[mg_cusOrder_Allpart_rel] ([co_id], [all_id], [co_count]) VALUES (6, 4, 5)
INSERT [dbo].[mg_cusOrder_Allpart_rel] ([co_id], [all_id], [co_count]) VALUES (6, 5, 6)
INSERT [dbo].[mg_cusOrder_Allpart_rel] ([co_id], [all_id], [co_count]) VALUES (7, 4, 2)
INSERT [dbo].[mg_cusOrder_Allpart_rel] ([co_id], [all_id], [co_count]) VALUES (7, 5, 3)
INSERT [dbo].[mg_cusOrder_Allpart_rel] ([co_id], [all_id], [co_count]) VALUES (8, 4, 2)
INSERT [dbo].[mg_cusOrder_Allpart_rel] ([co_id], [all_id], [co_count]) VALUES (8, 5, 3)
INSERT [dbo].[mg_cusOrder_Allpart_rel] ([co_id], [all_id], [co_count]) VALUES (5, 5, 4)
INSERT [dbo].[mg_cusOrder_Allpart_rel] ([co_id], [all_id], [co_count]) VALUES (4, 4, 1)
INSERT [dbo].[mg_cusOrder_Allpart_rel] ([co_id], [all_id], [co_count]) VALUES (4, 5, 4)
INSERT [dbo].[mg_cusOrder_Allpart_rel] ([co_id], [all_id], [co_count]) VALUES (2, 4, 3)
INSERT [dbo].[mg_cusOrder_Allpart_rel] ([co_id], [all_id], [co_count]) VALUES (3, 4, 2)
INSERT [dbo].[mg_cusOrder_Allpart_rel] ([co_id], [all_id], [co_count]) VALUES (3, 5, 3)
INSERT [dbo].[mg_CustomerOrder] ([co_id], [co_no], [all_id], [co_count], [co_cutomerid], [co_customer], [co_state], [co_order], [co_createtime], [co_isCutted], [co_producing], [co_finish], [co_starttime], [co_endtime]) VALUES (CAST(2 AS Numeric(18, 0)), N'005', N'1', 1, 60, N'', 0, 2, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[mg_CustomerOrder] ([co_id], [co_no], [all_id], [co_count], [co_cutomerid], [co_customer], [co_state], [co_order], [co_createtime], [co_isCutted], [co_producing], [co_finish], [co_starttime], [co_endtime]) VALUES (CAST(3 AS Numeric(18, 0)), N'001', NULL, 0, 60, N'沃尔沃', 0, 1, NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_CustomerOrder] ([co_id], [co_no], [all_id], [co_count], [co_cutomerid], [co_customer], [co_state], [co_order], [co_createtime], [co_isCutted], [co_producing], [co_finish], [co_starttime], [co_endtime]) VALUES (CAST(4 AS Numeric(18, 0)), N'002', NULL, 0, 60, N'沃尔沃', 0, 4, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[mg_CustomerOrder] ([co_id], [co_no], [all_id], [co_count], [co_cutomerid], [co_customer], [co_state], [co_order], [co_createtime], [co_isCutted], [co_producing], [co_finish], [co_starttime], [co_endtime]) VALUES (CAST(5 AS Numeric(18, 0)), N'003', NULL, 0, 60, N'沃尔沃', 0, 5, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[mg_CustomerOrder] ([co_id], [co_no], [all_id], [co_count], [co_cutomerid], [co_customer], [co_state], [co_order], [co_createtime], [co_isCutted], [co_producing], [co_finish], [co_starttime], [co_endtime]) VALUES (CAST(6 AS Numeric(18, 0)), N'004', NULL, 0, 60, N'沃尔沃', 0, 6, CAST(0x0000A68501001A2B AS DateTime), 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[mg_CustomerOrder] ([co_id], [co_no], [all_id], [co_count], [co_cutomerid], [co_customer], [co_state], [co_order], [co_createtime], [co_isCutted], [co_producing], [co_finish], [co_starttime], [co_endtime]) VALUES (CAST(7 AS Numeric(18, 0)), N'006', NULL, 0, 60, N'沃尔沃', 0, 7, CAST(0x0000A6860097AAD1 AS DateTime), 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[mg_CustomerOrder] ([co_id], [co_no], [all_id], [co_count], [co_cutomerid], [co_customer], [co_state], [co_order], [co_createtime], [co_isCutted], [co_producing], [co_finish], [co_starttime], [co_endtime]) VALUES (CAST(8 AS Numeric(18, 0)), N'007', NULL, 0, 60, N'沃尔沃', 0, 8, CAST(0x0000A68600AE9B3D AS DateTime), 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[mg_Department] ([dep_id], [dep_name]) VALUES (4, N'生产部')
INSERT [dbo].[mg_Department] ([dep_id], [dep_name]) VALUES (2, N'市场部')
INSERT [dbo].[mg_Department] ([dep_id], [dep_name]) VALUES (3, N'人事部')
INSERT [dbo].[mg_Department] ([dep_id], [dep_name]) VALUES (5, N'IT部')
INSERT [dbo].[mg_FlowLine] ([fl_id], [fl_name]) VALUES (1, N'FSC')
INSERT [dbo].[mg_FlowLine] ([fl_id], [fl_name]) VALUES (2, N'FSB')
INSERT [dbo].[mg_FlowLine] ([fl_id], [fl_name]) VALUES (3, N'FS')
INSERT [dbo].[mg_FlowLine] ([fl_id], [fl_name]) VALUES (4, N'RSC')
INSERT [dbo].[mg_FlowLine] ([fl_id], [fl_name]) VALUES (6, N'RSB')
INSERT [dbo].[mg_ODS] ([ods_id], [step_id], [ods_name], [ods_keywords], [ods_order]) VALUES (1, 20, N'1111aa', N'1111aaaaa', NULL)
INSERT [dbo].[mg_ODS] ([ods_id], [step_id], [ods_name], [ods_keywords], [ods_order]) VALUES (2, 20, N'2222bbbb', N'2222bbbbb', NULL)
INSERT [dbo].[mg_ODS] ([ods_id], [step_id], [ods_name], [ods_keywords], [ods_order]) VALUES (3, 20, N'rrrrr', N'342', NULL)
INSERT [dbo].[mg_ODS] ([ods_id], [step_id], [ods_name], [ods_keywords], [ods_order]) VALUES (1, 2, N'1', N'1', NULL)
INSERT [dbo].[mg_Operator] ([op_id], [st_id], [op_name], [op_no], [op_pic], [op_isoperator], [op_mac], [op_sex]) VALUES (1, 0, N'管理员', N'0000000000000000000000000A000001', N'/UploadImages/OperatorImages/lock_20160811015447.png', 1, NULL, 1)
INSERT [dbo].[mg_Operator] ([op_id], [st_id], [op_name], [op_no], [op_pic], [op_isoperator], [op_mac], [op_sex]) VALUES (2, 1, N'操作工-1-1', N'00000000000000000000000000000008', N'/UploadImages/OperatorImages/boat_20160811013829.png', 0, N'', 1)
INSERT [dbo].[mg_Operator] ([op_id], [st_id], [op_name], [op_no], [op_pic], [op_isoperator], [op_mac], [op_sex]) VALUES (3, 1, N'操作工-1-2', N'0000000000000000000000000A000003', N'/UploadImages/OperatorImages/airplane_20160811013702.png', 0, N'000C298461B5', 1)
INSERT [dbo].[mg_Operator] ([op_id], [st_id], [op_name], [op_no], [op_pic], [op_isoperator], [op_mac], [op_sex]) VALUES (4, 1, N'操作工-1-3', N'0000000000000000000000000A000004', N'/UploadImages/OperatorImages/baoyou_20160810050145.png', 0, NULL, 1)
INSERT [dbo].[mg_Operator] ([op_id], [st_id], [op_name], [op_no], [op_pic], [op_isoperator], [op_mac], [op_sex]) VALUES (5, 2, N'操作工-2-1', N'0000000000000000000000000A000005', N'/UploadImages/OperatorImages/ditu_20160811114257.png', 0, NULL, 1)
INSERT [dbo].[mg_Operator] ([op_id], [st_id], [op_name], [op_no], [op_pic], [op_isoperator], [op_mac], [op_sex]) VALUES (6, 2, N'操作员-2-2', N'0000000000000000000000000A000006', N'/image/admin/user_male.png', 0, NULL, 1)
INSERT [dbo].[mg_Operator] ([op_id], [st_id], [op_name], [op_no], [op_pic], [op_isoperator], [op_mac], [op_sex]) VALUES (7, 2, N'操作工-2-3', N'0000000000000000000000000A000007', N'/image/admin/user_male.png', 0, NULL, 1)
INSERT [dbo].[mg_Operator] ([op_id], [st_id], [op_name], [op_no], [op_pic], [op_isoperator], [op_mac], [op_sex]) VALUES (8, 1, N'第一人', N'000000000000000000000000A2222222', N'/UploadImages/OperatorImages/face_20160830020912.png', 0, N'000C298461B5', 1)
INSERT [dbo].[mg_Operator] ([op_id], [st_id], [op_name], [op_no], [op_pic], [op_isoperator], [op_mac], [op_sex]) VALUES (9, 1, N'于澎', N'00000000000000000000000000000009', N'/image/admin/user_male.png', 0, N'3417EB8F7A8B', 1)
INSERT [dbo].[mg_Order_FSD] ([ofsd_pre], [ofsd_id], [co_id], [part_no], [ofsd_cdstr], [ofsd_createdate], [ofsd_unproducing], [ofsd_producing], [ofsd_finish], [ofsd_starttime], [ofsd_endtime], [ofsd_isPLC]) VALUES (N'FS', 1, 3, N'70107866', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, 0)
INSERT [dbo].[mg_Order_FSD] ([ofsd_pre], [ofsd_id], [co_id], [part_no], [ofsd_cdstr], [ofsd_createdate], [ofsd_unproducing], [ofsd_producing], [ofsd_finish], [ofsd_starttime], [ofsd_endtime], [ofsd_isPLC]) VALUES (N'FS', 2, 3, N'70107866', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSD] ([ofsd_pre], [ofsd_id], [co_id], [part_no], [ofsd_cdstr], [ofsd_createdate], [ofsd_unproducing], [ofsd_producing], [ofsd_finish], [ofsd_starttime], [ofsd_endtime], [ofsd_isPLC]) VALUES (N'FS', 3, 3, N'80107866', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSD] ([ofsd_pre], [ofsd_id], [co_id], [part_no], [ofsd_cdstr], [ofsd_createdate], [ofsd_unproducing], [ofsd_producing], [ofsd_finish], [ofsd_starttime], [ofsd_endtime], [ofsd_isPLC]) VALUES (N'FS', 4, 3, N'80107866', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSD] ([ofsd_pre], [ofsd_id], [co_id], [part_no], [ofsd_cdstr], [ofsd_createdate], [ofsd_unproducing], [ofsd_producing], [ofsd_finish], [ofsd_starttime], [ofsd_endtime], [ofsd_isPLC]) VALUES (N'FS', 5, 3, N'80107866', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSD] ([ofsd_pre], [ofsd_id], [co_id], [part_no], [ofsd_cdstr], [ofsd_createdate], [ofsd_unproducing], [ofsd_producing], [ofsd_finish], [ofsd_starttime], [ofsd_endtime], [ofsd_isPLC]) VALUES (N'FS', 6, 2, N'70107866', N'160919', CAST(0x0000A6860106B4BC AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSD] ([ofsd_pre], [ofsd_id], [co_id], [part_no], [ofsd_cdstr], [ofsd_createdate], [ofsd_unproducing], [ofsd_producing], [ofsd_finish], [ofsd_starttime], [ofsd_endtime], [ofsd_isPLC]) VALUES (N'FS', 7, 2, N'70107866', N'160919', CAST(0x0000A6860106B4BC AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSD] ([ofsd_pre], [ofsd_id], [co_id], [part_no], [ofsd_cdstr], [ofsd_createdate], [ofsd_unproducing], [ofsd_producing], [ofsd_finish], [ofsd_starttime], [ofsd_endtime], [ofsd_isPLC]) VALUES (N'FS', 8, 2, N'70107866', N'160919', CAST(0x0000A6860106B4BC AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSD] ([ofsd_pre], [ofsd_id], [co_id], [part_no], [ofsd_cdstr], [ofsd_createdate], [ofsd_unproducing], [ofsd_producing], [ofsd_finish], [ofsd_starttime], [ofsd_endtime], [ofsd_isPLC]) VALUES (N'FS', 9, 4, N'70107866', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSD] ([ofsd_pre], [ofsd_id], [co_id], [part_no], [ofsd_cdstr], [ofsd_createdate], [ofsd_unproducing], [ofsd_producing], [ofsd_finish], [ofsd_starttime], [ofsd_endtime], [ofsd_isPLC]) VALUES (N'FS', 10, 4, N'80107866', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSD] ([ofsd_pre], [ofsd_id], [co_id], [part_no], [ofsd_cdstr], [ofsd_createdate], [ofsd_unproducing], [ofsd_producing], [ofsd_finish], [ofsd_starttime], [ofsd_endtime], [ofsd_isPLC]) VALUES (N'FS', 11, 4, N'80107866', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSD] ([ofsd_pre], [ofsd_id], [co_id], [part_no], [ofsd_cdstr], [ofsd_createdate], [ofsd_unproducing], [ofsd_producing], [ofsd_finish], [ofsd_starttime], [ofsd_endtime], [ofsd_isPLC]) VALUES (N'FS', 12, 4, N'80107866', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSD] ([ofsd_pre], [ofsd_id], [co_id], [part_no], [ofsd_cdstr], [ofsd_createdate], [ofsd_unproducing], [ofsd_producing], [ofsd_finish], [ofsd_starttime], [ofsd_endtime], [ofsd_isPLC]) VALUES (N'FS', 13, 4, N'80107866', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSDB] ([ofsdb_pre], [ofsdb_id], [co_id], [part_no], [ofsdb_cdstr], [ofsdb_createdate], [ofsdb_unproducing], [ofsdb_producing], [ofsdb_finish], [ofsdb_starttime], [ofsdb_endtime], [ofsdb_isPLC]) VALUES (N'FB', 1, 3, N'70107866', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSDB] ([ofsdb_pre], [ofsdb_id], [co_id], [part_no], [ofsdb_cdstr], [ofsdb_createdate], [ofsdb_unproducing], [ofsdb_producing], [ofsdb_finish], [ofsdb_starttime], [ofsdb_endtime], [ofsdb_isPLC]) VALUES (N'FB', 2, 3, N'70107866', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSDB] ([ofsdb_pre], [ofsdb_id], [co_id], [part_no], [ofsdb_cdstr], [ofsdb_createdate], [ofsdb_unproducing], [ofsdb_producing], [ofsdb_finish], [ofsdb_starttime], [ofsdb_endtime], [ofsdb_isPLC]) VALUES (N'FB', 3, 3, N'80107866', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSDB] ([ofsdb_pre], [ofsdb_id], [co_id], [part_no], [ofsdb_cdstr], [ofsdb_createdate], [ofsdb_unproducing], [ofsdb_producing], [ofsdb_finish], [ofsdb_starttime], [ofsdb_endtime], [ofsdb_isPLC]) VALUES (N'FB', 4, 3, N'80107866', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSDB] ([ofsdb_pre], [ofsdb_id], [co_id], [part_no], [ofsdb_cdstr], [ofsdb_createdate], [ofsdb_unproducing], [ofsdb_producing], [ofsdb_finish], [ofsdb_starttime], [ofsdb_endtime], [ofsdb_isPLC]) VALUES (N'FB', 5, 3, N'80107866', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSDB] ([ofsdb_pre], [ofsdb_id], [co_id], [part_no], [ofsdb_cdstr], [ofsdb_createdate], [ofsdb_unproducing], [ofsdb_producing], [ofsdb_finish], [ofsdb_starttime], [ofsdb_endtime], [ofsdb_isPLC]) VALUES (N'FB', 6, 2, N'70107866', N'160919', CAST(0x0000A6860106B4BC AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSDB] ([ofsdb_pre], [ofsdb_id], [co_id], [part_no], [ofsdb_cdstr], [ofsdb_createdate], [ofsdb_unproducing], [ofsdb_producing], [ofsdb_finish], [ofsdb_starttime], [ofsdb_endtime], [ofsdb_isPLC]) VALUES (N'FB', 7, 2, N'70107866', N'160919', CAST(0x0000A6860106B4BC AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSDB] ([ofsdb_pre], [ofsdb_id], [co_id], [part_no], [ofsdb_cdstr], [ofsdb_createdate], [ofsdb_unproducing], [ofsdb_producing], [ofsdb_finish], [ofsdb_starttime], [ofsdb_endtime], [ofsdb_isPLC]) VALUES (N'FB', 8, 2, N'70107866', N'160919', CAST(0x0000A6860106B4BC AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSDB] ([ofsdb_pre], [ofsdb_id], [co_id], [part_no], [ofsdb_cdstr], [ofsdb_createdate], [ofsdb_unproducing], [ofsdb_producing], [ofsdb_finish], [ofsdb_starttime], [ofsdb_endtime], [ofsdb_isPLC]) VALUES (N'FB', 9, 4, N'70107866', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSDB] ([ofsdb_pre], [ofsdb_id], [co_id], [part_no], [ofsdb_cdstr], [ofsdb_createdate], [ofsdb_unproducing], [ofsdb_producing], [ofsdb_finish], [ofsdb_starttime], [ofsdb_endtime], [ofsdb_isPLC]) VALUES (N'FB', 10, 4, N'80107866', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSDB] ([ofsdb_pre], [ofsdb_id], [co_id], [part_no], [ofsdb_cdstr], [ofsdb_createdate], [ofsdb_unproducing], [ofsdb_producing], [ofsdb_finish], [ofsdb_starttime], [ofsdb_endtime], [ofsdb_isPLC]) VALUES (N'FB', 11, 4, N'80107866', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSDB] ([ofsdb_pre], [ofsdb_id], [co_id], [part_no], [ofsdb_cdstr], [ofsdb_createdate], [ofsdb_unproducing], [ofsdb_producing], [ofsdb_finish], [ofsdb_starttime], [ofsdb_endtime], [ofsdb_isPLC]) VALUES (N'FB', 12, 4, N'80107866', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSDB] ([ofsdb_pre], [ofsdb_id], [co_id], [part_no], [ofsdb_cdstr], [ofsdb_createdate], [ofsdb_unproducing], [ofsdb_producing], [ofsdb_finish], [ofsdb_starttime], [ofsdb_endtime], [ofsdb_isPLC]) VALUES (N'FB', 13, 4, N'80107866', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSDC] ([ofsdc_pre], [ofsdc_id], [co_id], [part_no], [ofsdc_cdstr], [ofsdc_createdate], [ofsdc_unproducing], [ofsdc_producing], [ofsdc_finish], [ofsdc_starttime], [ofsdc_endtime], [ofsdc_isPLC]) VALUES (N'FC', 1, 3, N'70107866', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSDC] ([ofsdc_pre], [ofsdc_id], [co_id], [part_no], [ofsdc_cdstr], [ofsdc_createdate], [ofsdc_unproducing], [ofsdc_producing], [ofsdc_finish], [ofsdc_starttime], [ofsdc_endtime], [ofsdc_isPLC]) VALUES (N'FC', 2, 3, N'70107866', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSDC] ([ofsdc_pre], [ofsdc_id], [co_id], [part_no], [ofsdc_cdstr], [ofsdc_createdate], [ofsdc_unproducing], [ofsdc_producing], [ofsdc_finish], [ofsdc_starttime], [ofsdc_endtime], [ofsdc_isPLC]) VALUES (N'FC', 3, 3, N'80107866', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSDC] ([ofsdc_pre], [ofsdc_id], [co_id], [part_no], [ofsdc_cdstr], [ofsdc_createdate], [ofsdc_unproducing], [ofsdc_producing], [ofsdc_finish], [ofsdc_starttime], [ofsdc_endtime], [ofsdc_isPLC]) VALUES (N'FC', 4, 3, N'80107866', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSDC] ([ofsdc_pre], [ofsdc_id], [co_id], [part_no], [ofsdc_cdstr], [ofsdc_createdate], [ofsdc_unproducing], [ofsdc_producing], [ofsdc_finish], [ofsdc_starttime], [ofsdc_endtime], [ofsdc_isPLC]) VALUES (N'FC', 5, 3, N'80107866', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSDC] ([ofsdc_pre], [ofsdc_id], [co_id], [part_no], [ofsdc_cdstr], [ofsdc_createdate], [ofsdc_unproducing], [ofsdc_producing], [ofsdc_finish], [ofsdc_starttime], [ofsdc_endtime], [ofsdc_isPLC]) VALUES (N'FC', 6, 2, N'70107866', N'160919', CAST(0x0000A6860106B4BC AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSDC] ([ofsdc_pre], [ofsdc_id], [co_id], [part_no], [ofsdc_cdstr], [ofsdc_createdate], [ofsdc_unproducing], [ofsdc_producing], [ofsdc_finish], [ofsdc_starttime], [ofsdc_endtime], [ofsdc_isPLC]) VALUES (N'FC', 7, 2, N'70107866', N'160919', CAST(0x0000A6860106B4BC AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSDC] ([ofsdc_pre], [ofsdc_id], [co_id], [part_no], [ofsdc_cdstr], [ofsdc_createdate], [ofsdc_unproducing], [ofsdc_producing], [ofsdc_finish], [ofsdc_starttime], [ofsdc_endtime], [ofsdc_isPLC]) VALUES (N'FC', 8, 2, N'70107866', N'160919', CAST(0x0000A6860106B4BC AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSDC] ([ofsdc_pre], [ofsdc_id], [co_id], [part_no], [ofsdc_cdstr], [ofsdc_createdate], [ofsdc_unproducing], [ofsdc_producing], [ofsdc_finish], [ofsdc_starttime], [ofsdc_endtime], [ofsdc_isPLC]) VALUES (N'FC', 9, 4, N'70107866', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSDC] ([ofsdc_pre], [ofsdc_id], [co_id], [part_no], [ofsdc_cdstr], [ofsdc_createdate], [ofsdc_unproducing], [ofsdc_producing], [ofsdc_finish], [ofsdc_starttime], [ofsdc_endtime], [ofsdc_isPLC]) VALUES (N'FC', 10, 4, N'80107866', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSDC] ([ofsdc_pre], [ofsdc_id], [co_id], [part_no], [ofsdc_cdstr], [ofsdc_createdate], [ofsdc_unproducing], [ofsdc_producing], [ofsdc_finish], [ofsdc_starttime], [ofsdc_endtime], [ofsdc_isPLC]) VALUES (N'FC', 11, 4, N'80107866', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSDC] ([ofsdc_pre], [ofsdc_id], [co_id], [part_no], [ofsdc_cdstr], [ofsdc_createdate], [ofsdc_unproducing], [ofsdc_producing], [ofsdc_finish], [ofsdc_starttime], [ofsdc_endtime], [ofsdc_isPLC]) VALUES (N'FC', 12, 4, N'80107866', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSDC] ([ofsdc_pre], [ofsdc_id], [co_id], [part_no], [ofsdc_cdstr], [ofsdc_createdate], [ofsdc_unproducing], [ofsdc_producing], [ofsdc_finish], [ofsdc_starttime], [ofsdc_endtime], [ofsdc_isPLC]) VALUES (N'FC', 13, 4, N'80107866', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSP] ([ofsp_pre], [ofsp_id], [co_id], [part_no], [ofsp_cdstr], [ofsp_createdate], [ofsp_unproducing], [ofsp_producing], [ofsp_finish], [ofsp_starttime], [ofsp_endtime], [ofsp_isPLC]) VALUES (N'FS', 1, 3, N'70107867', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSP] ([ofsp_pre], [ofsp_id], [co_id], [part_no], [ofsp_cdstr], [ofsp_createdate], [ofsp_unproducing], [ofsp_producing], [ofsp_finish], [ofsp_starttime], [ofsp_endtime], [ofsp_isPLC]) VALUES (N'FS', 2, 3, N'70107867', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSP] ([ofsp_pre], [ofsp_id], [co_id], [part_no], [ofsp_cdstr], [ofsp_createdate], [ofsp_unproducing], [ofsp_producing], [ofsp_finish], [ofsp_starttime], [ofsp_endtime], [ofsp_isPLC]) VALUES (N'FS', 3, 3, N'80107867', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSP] ([ofsp_pre], [ofsp_id], [co_id], [part_no], [ofsp_cdstr], [ofsp_createdate], [ofsp_unproducing], [ofsp_producing], [ofsp_finish], [ofsp_starttime], [ofsp_endtime], [ofsp_isPLC]) VALUES (N'FS', 4, 3, N'80107867', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSP] ([ofsp_pre], [ofsp_id], [co_id], [part_no], [ofsp_cdstr], [ofsp_createdate], [ofsp_unproducing], [ofsp_producing], [ofsp_finish], [ofsp_starttime], [ofsp_endtime], [ofsp_isPLC]) VALUES (N'FS', 5, 3, N'80107867', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSP] ([ofsp_pre], [ofsp_id], [co_id], [part_no], [ofsp_cdstr], [ofsp_createdate], [ofsp_unproducing], [ofsp_producing], [ofsp_finish], [ofsp_starttime], [ofsp_endtime], [ofsp_isPLC]) VALUES (N'FS', 6, 2, N'70107867', N'160919', CAST(0x0000A6860106B4BC AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSP] ([ofsp_pre], [ofsp_id], [co_id], [part_no], [ofsp_cdstr], [ofsp_createdate], [ofsp_unproducing], [ofsp_producing], [ofsp_finish], [ofsp_starttime], [ofsp_endtime], [ofsp_isPLC]) VALUES (N'FS', 7, 2, N'70107867', N'160919', CAST(0x0000A6860106B4BC AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSP] ([ofsp_pre], [ofsp_id], [co_id], [part_no], [ofsp_cdstr], [ofsp_createdate], [ofsp_unproducing], [ofsp_producing], [ofsp_finish], [ofsp_starttime], [ofsp_endtime], [ofsp_isPLC]) VALUES (N'FS', 8, 2, N'70107867', N'160919', CAST(0x0000A6860106B4BC AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSP] ([ofsp_pre], [ofsp_id], [co_id], [part_no], [ofsp_cdstr], [ofsp_createdate], [ofsp_unproducing], [ofsp_producing], [ofsp_finish], [ofsp_starttime], [ofsp_endtime], [ofsp_isPLC]) VALUES (N'FS', 9, 4, N'70107867', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSP] ([ofsp_pre], [ofsp_id], [co_id], [part_no], [ofsp_cdstr], [ofsp_createdate], [ofsp_unproducing], [ofsp_producing], [ofsp_finish], [ofsp_starttime], [ofsp_endtime], [ofsp_isPLC]) VALUES (N'FS', 10, 4, N'80107867', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSP] ([ofsp_pre], [ofsp_id], [co_id], [part_no], [ofsp_cdstr], [ofsp_createdate], [ofsp_unproducing], [ofsp_producing], [ofsp_finish], [ofsp_starttime], [ofsp_endtime], [ofsp_isPLC]) VALUES (N'FS', 11, 4, N'80107867', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSP] ([ofsp_pre], [ofsp_id], [co_id], [part_no], [ofsp_cdstr], [ofsp_createdate], [ofsp_unproducing], [ofsp_producing], [ofsp_finish], [ofsp_starttime], [ofsp_endtime], [ofsp_isPLC]) VALUES (N'FS', 12, 4, N'80107867', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSP] ([ofsp_pre], [ofsp_id], [co_id], [part_no], [ofsp_cdstr], [ofsp_createdate], [ofsp_unproducing], [ofsp_producing], [ofsp_finish], [ofsp_starttime], [ofsp_endtime], [ofsp_isPLC]) VALUES (N'FS', 13, 4, N'80107867', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSPB] ([ofspb_pre], [ofspb_id], [co_id], [part_no], [ofspb_cdstr], [ofspb_createdate], [ofspb_unproducing], [ofspb_producing], [ofspb_finish], [ofspb_starttime], [ofspb_endtime], [ofspb_isPLC]) VALUES (N'FB', 1, 3, N'70107867', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSPB] ([ofspb_pre], [ofspb_id], [co_id], [part_no], [ofspb_cdstr], [ofspb_createdate], [ofspb_unproducing], [ofspb_producing], [ofspb_finish], [ofspb_starttime], [ofspb_endtime], [ofspb_isPLC]) VALUES (N'FB', 2, 3, N'70107867', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSPB] ([ofspb_pre], [ofspb_id], [co_id], [part_no], [ofspb_cdstr], [ofspb_createdate], [ofspb_unproducing], [ofspb_producing], [ofspb_finish], [ofspb_starttime], [ofspb_endtime], [ofspb_isPLC]) VALUES (N'FB', 3, 3, N'80107867', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSPB] ([ofspb_pre], [ofspb_id], [co_id], [part_no], [ofspb_cdstr], [ofspb_createdate], [ofspb_unproducing], [ofspb_producing], [ofspb_finish], [ofspb_starttime], [ofspb_endtime], [ofspb_isPLC]) VALUES (N'FB', 4, 3, N'80107867', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSPB] ([ofspb_pre], [ofspb_id], [co_id], [part_no], [ofspb_cdstr], [ofspb_createdate], [ofspb_unproducing], [ofspb_producing], [ofspb_finish], [ofspb_starttime], [ofspb_endtime], [ofspb_isPLC]) VALUES (N'FB', 5, 3, N'80107867', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSPB] ([ofspb_pre], [ofspb_id], [co_id], [part_no], [ofspb_cdstr], [ofspb_createdate], [ofspb_unproducing], [ofspb_producing], [ofspb_finish], [ofspb_starttime], [ofspb_endtime], [ofspb_isPLC]) VALUES (N'FB', 6, 2, N'70107867', N'160919', CAST(0x0000A6860106B4BC AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSPB] ([ofspb_pre], [ofspb_id], [co_id], [part_no], [ofspb_cdstr], [ofspb_createdate], [ofspb_unproducing], [ofspb_producing], [ofspb_finish], [ofspb_starttime], [ofspb_endtime], [ofspb_isPLC]) VALUES (N'FB', 7, 2, N'70107867', N'160919', CAST(0x0000A6860106B4BC AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSPB] ([ofspb_pre], [ofspb_id], [co_id], [part_no], [ofspb_cdstr], [ofspb_createdate], [ofspb_unproducing], [ofspb_producing], [ofspb_finish], [ofspb_starttime], [ofspb_endtime], [ofspb_isPLC]) VALUES (N'FB', 8, 2, N'70107867', N'160919', CAST(0x0000A6860106B4BC AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSPB] ([ofspb_pre], [ofspb_id], [co_id], [part_no], [ofspb_cdstr], [ofspb_createdate], [ofspb_unproducing], [ofspb_producing], [ofspb_finish], [ofspb_starttime], [ofspb_endtime], [ofspb_isPLC]) VALUES (N'FB', 9, 4, N'70107867', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSPB] ([ofspb_pre], [ofspb_id], [co_id], [part_no], [ofspb_cdstr], [ofspb_createdate], [ofspb_unproducing], [ofspb_producing], [ofspb_finish], [ofspb_starttime], [ofspb_endtime], [ofspb_isPLC]) VALUES (N'FB', 10, 4, N'80107867', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSPB] ([ofspb_pre], [ofspb_id], [co_id], [part_no], [ofspb_cdstr], [ofspb_createdate], [ofspb_unproducing], [ofspb_producing], [ofspb_finish], [ofspb_starttime], [ofspb_endtime], [ofspb_isPLC]) VALUES (N'FB', 11, 4, N'80107867', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSPB] ([ofspb_pre], [ofspb_id], [co_id], [part_no], [ofspb_cdstr], [ofspb_createdate], [ofspb_unproducing], [ofspb_producing], [ofspb_finish], [ofspb_starttime], [ofspb_endtime], [ofspb_isPLC]) VALUES (N'FB', 12, 4, N'80107867', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSPB] ([ofspb_pre], [ofspb_id], [co_id], [part_no], [ofspb_cdstr], [ofspb_createdate], [ofspb_unproducing], [ofspb_producing], [ofspb_finish], [ofspb_starttime], [ofspb_endtime], [ofspb_isPLC]) VALUES (N'FB', 13, 4, N'80107867', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSPC] ([ofspc_pre], [ofspc_id], [co_id], [part_no], [ofspc_cdstr], [ofspc_createdate], [ofspc_unproducing], [ofspc_producing], [ofspc_finish], [ofspc_starttime], [ofspc_endtime], [ofspc_isPLC]) VALUES (N'FC', 1, 3, N'70107867', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSPC] ([ofspc_pre], [ofspc_id], [co_id], [part_no], [ofspc_cdstr], [ofspc_createdate], [ofspc_unproducing], [ofspc_producing], [ofspc_finish], [ofspc_starttime], [ofspc_endtime], [ofspc_isPLC]) VALUES (N'FC', 2, 3, N'70107867', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSPC] ([ofspc_pre], [ofspc_id], [co_id], [part_no], [ofspc_cdstr], [ofspc_createdate], [ofspc_unproducing], [ofspc_producing], [ofspc_finish], [ofspc_starttime], [ofspc_endtime], [ofspc_isPLC]) VALUES (N'FC', 3, 3, N'80107867', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSPC] ([ofspc_pre], [ofspc_id], [co_id], [part_no], [ofspc_cdstr], [ofspc_createdate], [ofspc_unproducing], [ofspc_producing], [ofspc_finish], [ofspc_starttime], [ofspc_endtime], [ofspc_isPLC]) VALUES (N'FC', 4, 3, N'80107867', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSPC] ([ofspc_pre], [ofspc_id], [co_id], [part_no], [ofspc_cdstr], [ofspc_createdate], [ofspc_unproducing], [ofspc_producing], [ofspc_finish], [ofspc_starttime], [ofspc_endtime], [ofspc_isPLC]) VALUES (N'FC', 5, 3, N'80107867', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSPC] ([ofspc_pre], [ofspc_id], [co_id], [part_no], [ofspc_cdstr], [ofspc_createdate], [ofspc_unproducing], [ofspc_producing], [ofspc_finish], [ofspc_starttime], [ofspc_endtime], [ofspc_isPLC]) VALUES (N'FC', 6, 2, N'70107867', N'160919', CAST(0x0000A6860106B4BC AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSPC] ([ofspc_pre], [ofspc_id], [co_id], [part_no], [ofspc_cdstr], [ofspc_createdate], [ofspc_unproducing], [ofspc_producing], [ofspc_finish], [ofspc_starttime], [ofspc_endtime], [ofspc_isPLC]) VALUES (N'FC', 7, 2, N'70107867', N'160919', CAST(0x0000A6860106B4BC AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSPC] ([ofspc_pre], [ofspc_id], [co_id], [part_no], [ofspc_cdstr], [ofspc_createdate], [ofspc_unproducing], [ofspc_producing], [ofspc_finish], [ofspc_starttime], [ofspc_endtime], [ofspc_isPLC]) VALUES (N'FC', 8, 2, N'70107867', N'160919', CAST(0x0000A6860106B4BC AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSPC] ([ofspc_pre], [ofspc_id], [co_id], [part_no], [ofspc_cdstr], [ofspc_createdate], [ofspc_unproducing], [ofspc_producing], [ofspc_finish], [ofspc_starttime], [ofspc_endtime], [ofspc_isPLC]) VALUES (N'FC', 9, 4, N'70107867', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSPC] ([ofspc_pre], [ofspc_id], [co_id], [part_no], [ofspc_cdstr], [ofspc_createdate], [ofspc_unproducing], [ofspc_producing], [ofspc_finish], [ofspc_starttime], [ofspc_endtime], [ofspc_isPLC]) VALUES (N'FC', 10, 4, N'80107867', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSPC] ([ofspc_pre], [ofspc_id], [co_id], [part_no], [ofspc_cdstr], [ofspc_createdate], [ofspc_unproducing], [ofspc_producing], [ofspc_finish], [ofspc_starttime], [ofspc_endtime], [ofspc_isPLC]) VALUES (N'FC', 11, 4, N'80107867', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSPC] ([ofspc_pre], [ofspc_id], [co_id], [part_no], [ofspc_cdstr], [ofspc_createdate], [ofspc_unproducing], [ofspc_producing], [ofspc_finish], [ofspc_starttime], [ofspc_endtime], [ofspc_isPLC]) VALUES (N'FC', 12, 4, N'80107867', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_FSPC] ([ofspc_pre], [ofspc_id], [co_id], [part_no], [ofspc_cdstr], [ofspc_createdate], [ofspc_unproducing], [ofspc_producing], [ofspc_finish], [ofspc_starttime], [ofspc_endtime], [ofspc_isPLC]) VALUES (N'FC', 13, 4, N'80107867', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSB40] ([orsb40_pre], [orsb40_id], [co_id], [part_no], [orsb40_cdstr], [orsb40_createdate], [orsb40_unproducing], [orsb40_producing], [orsb40_finish], [orsb40_starttime], [orsb40_endtime], [orsb40_isPLC]) VALUES (N'B4', 1, 3, N'70107872', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSB40] ([orsb40_pre], [orsb40_id], [co_id], [part_no], [orsb40_cdstr], [orsb40_createdate], [orsb40_unproducing], [orsb40_producing], [orsb40_finish], [orsb40_starttime], [orsb40_endtime], [orsb40_isPLC]) VALUES (N'B4', 2, 3, N'70107872', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSB40] ([orsb40_pre], [orsb40_id], [co_id], [part_no], [orsb40_cdstr], [orsb40_createdate], [orsb40_unproducing], [orsb40_producing], [orsb40_finish], [orsb40_starttime], [orsb40_endtime], [orsb40_isPLC]) VALUES (N'B4', 3, 3, N'80107872', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSB40] ([orsb40_pre], [orsb40_id], [co_id], [part_no], [orsb40_cdstr], [orsb40_createdate], [orsb40_unproducing], [orsb40_producing], [orsb40_finish], [orsb40_starttime], [orsb40_endtime], [orsb40_isPLC]) VALUES (N'B4', 4, 3, N'80107872', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSB40] ([orsb40_pre], [orsb40_id], [co_id], [part_no], [orsb40_cdstr], [orsb40_createdate], [orsb40_unproducing], [orsb40_producing], [orsb40_finish], [orsb40_starttime], [orsb40_endtime], [orsb40_isPLC]) VALUES (N'B4', 5, 3, N'80107872', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSB40] ([orsb40_pre], [orsb40_id], [co_id], [part_no], [orsb40_cdstr], [orsb40_createdate], [orsb40_unproducing], [orsb40_producing], [orsb40_finish], [orsb40_starttime], [orsb40_endtime], [orsb40_isPLC]) VALUES (N'B4', 6, 2, N'70107872', N'160919', CAST(0x0000A6860106B4BC AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSB40] ([orsb40_pre], [orsb40_id], [co_id], [part_no], [orsb40_cdstr], [orsb40_createdate], [orsb40_unproducing], [orsb40_producing], [orsb40_finish], [orsb40_starttime], [orsb40_endtime], [orsb40_isPLC]) VALUES (N'B4', 7, 2, N'70107872', N'160919', CAST(0x0000A6860106B4BC AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSB40] ([orsb40_pre], [orsb40_id], [co_id], [part_no], [orsb40_cdstr], [orsb40_createdate], [orsb40_unproducing], [orsb40_producing], [orsb40_finish], [orsb40_starttime], [orsb40_endtime], [orsb40_isPLC]) VALUES (N'B4', 8, 2, N'70107872', N'160919', CAST(0x0000A6860106B4BC AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSB40] ([orsb40_pre], [orsb40_id], [co_id], [part_no], [orsb40_cdstr], [orsb40_createdate], [orsb40_unproducing], [orsb40_producing], [orsb40_finish], [orsb40_starttime], [orsb40_endtime], [orsb40_isPLC]) VALUES (N'B4', 9, 4, N'70107872', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSB40] ([orsb40_pre], [orsb40_id], [co_id], [part_no], [orsb40_cdstr], [orsb40_createdate], [orsb40_unproducing], [orsb40_producing], [orsb40_finish], [orsb40_starttime], [orsb40_endtime], [orsb40_isPLC]) VALUES (N'B4', 10, 4, N'80107872', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSB40] ([orsb40_pre], [orsb40_id], [co_id], [part_no], [orsb40_cdstr], [orsb40_createdate], [orsb40_unproducing], [orsb40_producing], [orsb40_finish], [orsb40_starttime], [orsb40_endtime], [orsb40_isPLC]) VALUES (N'B4', 11, 4, N'80107872', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSB40] ([orsb40_pre], [orsb40_id], [co_id], [part_no], [orsb40_cdstr], [orsb40_createdate], [orsb40_unproducing], [orsb40_producing], [orsb40_finish], [orsb40_starttime], [orsb40_endtime], [orsb40_isPLC]) VALUES (N'B4', 12, 4, N'80107872', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSB40] ([orsb40_pre], [orsb40_id], [co_id], [part_no], [orsb40_cdstr], [orsb40_createdate], [orsb40_unproducing], [orsb40_producing], [orsb40_finish], [orsb40_starttime], [orsb40_endtime], [orsb40_isPLC]) VALUES (N'B4', 13, 4, N'80107872', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSB60] ([orsb60_pre], [orsb60_id], [co_id], [part_no], [orsb60_cdstr], [orsb60_createdate], [orsb60_unproducing], [orsb60_producing], [orsb60_finish], [orsb60_starttime], [orsb60_endtime], [orsb60_isPLC]) VALUES (N'B6', 1, 3, N'70107873', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSB60] ([orsb60_pre], [orsb60_id], [co_id], [part_no], [orsb60_cdstr], [orsb60_createdate], [orsb60_unproducing], [orsb60_producing], [orsb60_finish], [orsb60_starttime], [orsb60_endtime], [orsb60_isPLC]) VALUES (N'B6', 2, 3, N'70107873', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSB60] ([orsb60_pre], [orsb60_id], [co_id], [part_no], [orsb60_cdstr], [orsb60_createdate], [orsb60_unproducing], [orsb60_producing], [orsb60_finish], [orsb60_starttime], [orsb60_endtime], [orsb60_isPLC]) VALUES (N'B6', 3, 3, N'80107873', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSB60] ([orsb60_pre], [orsb60_id], [co_id], [part_no], [orsb60_cdstr], [orsb60_createdate], [orsb60_unproducing], [orsb60_producing], [orsb60_finish], [orsb60_starttime], [orsb60_endtime], [orsb60_isPLC]) VALUES (N'B6', 4, 3, N'80107873', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSB60] ([orsb60_pre], [orsb60_id], [co_id], [part_no], [orsb60_cdstr], [orsb60_createdate], [orsb60_unproducing], [orsb60_producing], [orsb60_finish], [orsb60_starttime], [orsb60_endtime], [orsb60_isPLC]) VALUES (N'B6', 5, 3, N'80107873', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSB60] ([orsb60_pre], [orsb60_id], [co_id], [part_no], [orsb60_cdstr], [orsb60_createdate], [orsb60_unproducing], [orsb60_producing], [orsb60_finish], [orsb60_starttime], [orsb60_endtime], [orsb60_isPLC]) VALUES (N'B6', 6, 2, N'70107873', N'160919', CAST(0x0000A6860106B4BC AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSB60] ([orsb60_pre], [orsb60_id], [co_id], [part_no], [orsb60_cdstr], [orsb60_createdate], [orsb60_unproducing], [orsb60_producing], [orsb60_finish], [orsb60_starttime], [orsb60_endtime], [orsb60_isPLC]) VALUES (N'B6', 7, 2, N'70107873', N'160919', CAST(0x0000A6860106B4BC AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSB60] ([orsb60_pre], [orsb60_id], [co_id], [part_no], [orsb60_cdstr], [orsb60_createdate], [orsb60_unproducing], [orsb60_producing], [orsb60_finish], [orsb60_starttime], [orsb60_endtime], [orsb60_isPLC]) VALUES (N'B6', 8, 2, N'70107873', N'160919', CAST(0x0000A6860106B4BC AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSB60] ([orsb60_pre], [orsb60_id], [co_id], [part_no], [orsb60_cdstr], [orsb60_createdate], [orsb60_unproducing], [orsb60_producing], [orsb60_finish], [orsb60_starttime], [orsb60_endtime], [orsb60_isPLC]) VALUES (N'B6', 9, 4, N'70107873', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSB60] ([orsb60_pre], [orsb60_id], [co_id], [part_no], [orsb60_cdstr], [orsb60_createdate], [orsb60_unproducing], [orsb60_producing], [orsb60_finish], [orsb60_starttime], [orsb60_endtime], [orsb60_isPLC]) VALUES (N'B6', 10, 4, N'80107873', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSB60] ([orsb60_pre], [orsb60_id], [co_id], [part_no], [orsb60_cdstr], [orsb60_createdate], [orsb60_unproducing], [orsb60_producing], [orsb60_finish], [orsb60_starttime], [orsb60_endtime], [orsb60_isPLC]) VALUES (N'B6', 11, 4, N'80107873', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSB60] ([orsb60_pre], [orsb60_id], [co_id], [part_no], [orsb60_cdstr], [orsb60_createdate], [orsb60_unproducing], [orsb60_producing], [orsb60_finish], [orsb60_starttime], [orsb60_endtime], [orsb60_isPLC]) VALUES (N'B6', 12, 4, N'80107873', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSB60] ([orsb60_pre], [orsb60_id], [co_id], [part_no], [orsb60_cdstr], [orsb60_createdate], [orsb60_unproducing], [orsb60_producing], [orsb60_finish], [orsb60_starttime], [orsb60_endtime], [orsb60_isPLC]) VALUES (N'B6', 13, 4, N'80107873', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSC] ([orsc_pre], [orsc_id], [co_id], [part_no], [orsc_cdstr], [orsc_createdate], [orsc_unproducing], [orsc_producing], [orsc_finish], [orsc_starttime], [orsc_endtime], [orsc_isPLC]) VALUES (N'RC', 1, 3, N'70107874', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSC] ([orsc_pre], [orsc_id], [co_id], [part_no], [orsc_cdstr], [orsc_createdate], [orsc_unproducing], [orsc_producing], [orsc_finish], [orsc_starttime], [orsc_endtime], [orsc_isPLC]) VALUES (N'RC', 2, 3, N'70107874', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSC] ([orsc_pre], [orsc_id], [co_id], [part_no], [orsc_cdstr], [orsc_createdate], [orsc_unproducing], [orsc_producing], [orsc_finish], [orsc_starttime], [orsc_endtime], [orsc_isPLC]) VALUES (N'RC', 3, 3, N'80107874', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSC] ([orsc_pre], [orsc_id], [co_id], [part_no], [orsc_cdstr], [orsc_createdate], [orsc_unproducing], [orsc_producing], [orsc_finish], [orsc_starttime], [orsc_endtime], [orsc_isPLC]) VALUES (N'RC', 4, 3, N'80107874', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSC] ([orsc_pre], [orsc_id], [co_id], [part_no], [orsc_cdstr], [orsc_createdate], [orsc_unproducing], [orsc_producing], [orsc_finish], [orsc_starttime], [orsc_endtime], [orsc_isPLC]) VALUES (N'RC', 5, 3, N'80107874', N'160919', CAST(0x0000A6860106B264 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSC] ([orsc_pre], [orsc_id], [co_id], [part_no], [orsc_cdstr], [orsc_createdate], [orsc_unproducing], [orsc_producing], [orsc_finish], [orsc_starttime], [orsc_endtime], [orsc_isPLC]) VALUES (N'RC', 6, 2, N'70107874', N'160919', CAST(0x0000A6860106B4BC AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSC] ([orsc_pre], [orsc_id], [co_id], [part_no], [orsc_cdstr], [orsc_createdate], [orsc_unproducing], [orsc_producing], [orsc_finish], [orsc_starttime], [orsc_endtime], [orsc_isPLC]) VALUES (N'RC', 7, 2, N'70107874', N'160919', CAST(0x0000A6860106B4BC AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSC] ([orsc_pre], [orsc_id], [co_id], [part_no], [orsc_cdstr], [orsc_createdate], [orsc_unproducing], [orsc_producing], [orsc_finish], [orsc_starttime], [orsc_endtime], [orsc_isPLC]) VALUES (N'RC', 8, 2, N'70107874', N'160919', CAST(0x0000A6860106B4BC AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSC] ([orsc_pre], [orsc_id], [co_id], [part_no], [orsc_cdstr], [orsc_createdate], [orsc_unproducing], [orsc_producing], [orsc_finish], [orsc_starttime], [orsc_endtime], [orsc_isPLC]) VALUES (N'RC', 9, 4, N'70107874', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSC] ([orsc_pre], [orsc_id], [co_id], [part_no], [orsc_cdstr], [orsc_createdate], [orsc_unproducing], [orsc_producing], [orsc_finish], [orsc_starttime], [orsc_endtime], [orsc_isPLC]) VALUES (N'RC', 10, 4, N'80107874', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSC] ([orsc_pre], [orsc_id], [co_id], [part_no], [orsc_cdstr], [orsc_createdate], [orsc_unproducing], [orsc_producing], [orsc_finish], [orsc_starttime], [orsc_endtime], [orsc_isPLC]) VALUES (N'RC', 11, 4, N'80107874', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSC] ([orsc_pre], [orsc_id], [co_id], [part_no], [orsc_cdstr], [orsc_createdate], [orsc_unproducing], [orsc_producing], [orsc_finish], [orsc_starttime], [orsc_endtime], [orsc_isPLC]) VALUES (N'RC', 12, 4, N'80107874', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_Order_RSC] ([orsc_pre], [orsc_id], [co_id], [part_no], [orsc_cdstr], [orsc_createdate], [orsc_unproducing], [orsc_producing], [orsc_finish], [orsc_starttime], [orsc_endtime], [orsc_isPLC]) VALUES (N'RC', 13, 4, N'80107874', N'160919', CAST(0x0000A6860106B840 AS DateTime), 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[mg_part] ([part_id], [part_no], [part_name], [part_desc], [part_categoryid], [part_Category]) VALUES (1, N'80107867', N'前排座椅副驾', N'Textile+PVC,40% Fixed H/R', 48, N'RSB40')
INSERT [dbo].[mg_part] ([part_id], [part_no], [part_name], [part_desc], [part_categoryid], [part_Category]) VALUES (2, N'80107866', N'前排座椅主驾', N'Texile+PVC,40% Fixed H/R', 19, N'RSB40')
INSERT [dbo].[mg_part] ([part_id], [part_no], [part_name], [part_desc], [part_categoryid], [part_Category]) VALUES (3, N'70107874', N'后排座椅坐垫', N'Texile+PVC,60% CTR A/R, Fixed H/R and movable CTR H/R', 47, N'RSB60')
INSERT [dbo].[mg_part] ([part_id], [part_no], [part_name], [part_desc], [part_categoryid], [part_Category]) VALUES (5, N'70107873', N'后排座椅60%靠背', N'PVC+Textile', 46, N'FSL')
INSERT [dbo].[mg_part] ([part_id], [part_no], [part_name], [part_desc], [part_categoryid], [part_Category]) VALUES (12, N'70107866', N'前排座椅主驾', N'textd-dsadsad67d-dsadsa', 19, NULL)
INSERT [dbo].[mg_part] ([part_id], [part_no], [part_name], [part_desc], [part_categoryid], [part_Category]) VALUES (13, N'80107866', N'前排座椅主驾靠背', N'', 43, NULL)
INSERT [dbo].[mg_part] ([part_id], [part_no], [part_name], [part_desc], [part_categoryid], [part_Category]) VALUES (14, N'80107867', N'前排座椅副驾靠背', N'', 49, NULL)
INSERT [dbo].[mg_part] ([part_id], [part_no], [part_name], [part_desc], [part_categoryid], [part_Category]) VALUES (15, N'80107866', N'前排座椅主驾坐垫', N'', 44, NULL)
INSERT [dbo].[mg_part] ([part_id], [part_no], [part_name], [part_desc], [part_categoryid], [part_Category]) VALUES (16, N'80107867', N'前排座椅副驾坐垫', N'', 50, NULL)
INSERT [dbo].[mg_part] ([part_id], [part_no], [part_name], [part_desc], [part_categoryid], [part_Category]) VALUES (17, N'80107872', N'后排座椅40%靠背', N'', 45, NULL)
INSERT [dbo].[mg_part] ([part_id], [part_no], [part_name], [part_desc], [part_categoryid], [part_Category]) VALUES (18, N'80107873', N'后排座椅60%靠背', N'', 46, NULL)
INSERT [dbo].[mg_part] ([part_id], [part_no], [part_name], [part_desc], [part_categoryid], [part_Category]) VALUES (19, N'80107874', N'后排座椅坐垫', N'', 47, NULL)
INSERT [dbo].[mg_part] ([part_id], [part_no], [part_name], [part_desc], [part_categoryid], [part_Category]) VALUES (6, N'70107872', N'后排座椅40%靠背', N'', 45, NULL)
INSERT [dbo].[mg_part] ([part_id], [part_no], [part_name], [part_desc], [part_categoryid], [part_Category]) VALUES (7, N'70107867', N'前排座椅副驾坐垫', N'', 50, NULL)
INSERT [dbo].[mg_part] ([part_id], [part_no], [part_name], [part_desc], [part_categoryid], [part_Category]) VALUES (8, N'70107866', N'前排座椅主驾坐垫', N'', 44, NULL)
INSERT [dbo].[mg_part] ([part_id], [part_no], [part_name], [part_desc], [part_categoryid], [part_Category]) VALUES (9, N'70107867', N'前排座椅副驾靠背', N'', 49, NULL)
INSERT [dbo].[mg_part] ([part_id], [part_no], [part_name], [part_desc], [part_categoryid], [part_Category]) VALUES (10, N'70107866', N'前排座椅主驾靠背', N'', 43, NULL)
INSERT [dbo].[mg_part] ([part_id], [part_no], [part_name], [part_desc], [part_categoryid], [part_Category]) VALUES (11, N'70107867 ', N'前排座椅副驾', N'', 48, NULL)
INSERT [dbo].[mg_part_bom_rel] ([part_id], [bom_id], [bom_count]) VALUES (12, 16, NULL)
INSERT [dbo].[mg_part_bom_rel] ([part_id], [bom_id], [bom_count]) VALUES (6, 15, NULL)
INSERT [dbo].[mg_part_bom_rel] ([part_id], [bom_id], [bom_count]) VALUES (6, 14, NULL)
INSERT [dbo].[mg_part_bom_rel] ([part_id], [bom_id], [bom_count]) VALUES (1, 13, NULL)
INSERT [dbo].[mg_part_bom_rel] ([part_id], [bom_id], [bom_count]) VALUES (5, 12, NULL)
INSERT [dbo].[mg_part_bom_rel] ([part_id], [bom_id], [bom_count]) VALUES (5, 11, NULL)
INSERT [dbo].[mg_part_bom_rel] ([part_id], [bom_id], [bom_count]) VALUES (3, 10, NULL)
INSERT [dbo].[mg_part_bom_rel] ([part_id], [bom_id], [bom_count]) VALUES (3, 9, NULL)
INSERT [dbo].[mg_part_bom_rel] ([part_id], [bom_id], [bom_count]) VALUES (2, 5, NULL)
INSERT [dbo].[mg_part_bom_rel] ([part_id], [bom_id], [bom_count]) VALUES (12, 17, NULL)
INSERT [dbo].[mg_Position] ([posi_id], [posi_name]) VALUES (1, N'系统管理员')
INSERT [dbo].[mg_Position] ([posi_id], [posi_name]) VALUES (2, N'市场专员')
INSERT [dbo].[mg_Position] ([posi_id], [posi_name]) VALUES (3, N'人事专员')
INSERT [dbo].[mg_Position] ([posi_id], [posi_name]) VALUES (4, N'生产跟单员')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (1, 1, N'低配')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (2, 1, N'次低配')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (3, 1, N'中配')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (4, 1, N'次高配')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (5, 1, N'高配')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (6, 1, N'无记忆高配')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (7, 1, N'带记忆高配')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (8, 2, N'黑色')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (9, 2, N'黑/棕')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (10, 2, N'黑/米')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (11, 2, N'米')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (12, 3, N'真皮')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (13, 3, N'头层牛皮')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (14, 3, N'真皮/皮革')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (15, 3, N'纺织物')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (16, 4, N'Plastic')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (17, 4, N'Trim')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (18, 4, N'Foam')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (19, 5, N'FS Drive')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (51, 10, N'料架-1')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (52, 10, N'料架-2')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (53, 10, N'料架-3')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (34, 11, N'40%靠背')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (35, 11, N'60%靠背')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (36, 11, N'Drive')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (37, 11, N'Drive（Left）')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (38, 11, N'Drive（Right）')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (39, 11, N'Passenger')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (40, 11, N'Passenger（Left）')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (41, 11, N'Passenger（Right）')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (42, 11, N'坐垫')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (43, 5, N'FSB Drive')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (44, 5, N'FSC Drive')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (45, 5, N'RSB40')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (46, 5, N'RSB60')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (47, 5, N'RSC')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (54, 10, N'料架-4')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (55, 10, N'料架-5')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (56, 10, N'料架-6')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (57, 10, N'料架-7')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (58, 10, N'料架-8')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (59, 10, N'料架-9')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (20, 6, N'0')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (21, 6, N'1')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (22, 7, N'black')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (23, 7, N'white')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (24, 7, N'yellow')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (25, 8, N'Alcantara')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (26, 8, N'PVC')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (27, 8, N'Leather')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (28, 9, N'供应商-1')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (29, 9, N'供应商-2')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (30, 9, N'供应商-3')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (60, 12, N'吉利.沃尔沃')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (48, 5, N'FS Passenger')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (49, 5, N'FSB Passenger')
INSERT [dbo].[mg_Property] ([prop_id], [Prop_type], [prop_name]) VALUES (50, 5, N'FSC Passenger')
INSERT [dbo].[mg_State] ([st_id], [st_name], [st_color]) VALUES (1, N'正常', N'绿')
INSERT [dbo].[mg_State] ([st_id], [st_name], [st_color]) VALUES (2, N'物料', N'黄')
INSERT [dbo].[mg_State] ([st_id], [st_name], [st_color]) VALUES (3, N'质量', N'紫')
INSERT [dbo].[mg_State] ([st_id], [st_name], [st_color]) VALUES (4, N'维修', N'红')
INSERT [dbo].[mg_station] ([st_id], [fl_id], [st_no], [st_pretime], [st_ispre], [st_name], [st_mac], [st_typeid], [st_typename], [st_order], [st_odsfile], [st_mushifile], [st_isfirst], [st_isend]) VALUES (1, 3, N'FS010-1', NULL, 0, N'Drive（Left）', N'000C298461B5', 37, NULL, 7, NULL, NULL, 1, 0)
INSERT [dbo].[mg_station] ([st_id], [fl_id], [st_no], [st_pretime], [st_ispre], [st_name], [st_mac], [st_typeid], [st_typename], [st_order], [st_odsfile], [st_mushifile], [st_isfirst], [st_isend]) VALUES (2, 3, N'FS10-2', NULL, 1, N'Passenger（Right）', N'aaaaa', 41, NULL, 9, NULL, NULL, NULL, NULL)
INSERT [dbo].[mg_station] ([st_id], [fl_id], [st_no], [st_pretime], [st_ispre], [st_name], [st_mac], [st_typeid], [st_typename], [st_order], [st_odsfile], [st_mushifile], [st_isfirst], [st_isend]) VALUES (3, 3, N'FS010-1', NULL, NULL, N'Passenger（Left）', N'000C298461B5', 40, NULL, 6, N'/UploadImages/StationPDF/magna_生产线模块_20160914021610.sql', N'/UploadImages/StationImages/heart_20160914021606.png', NULL, NULL)
INSERT [dbo].[mg_station] ([st_id], [fl_id], [st_no], [st_pretime], [st_ispre], [st_name], [st_mac], [st_typeid], [st_typename], [st_order], [st_odsfile], [st_mushifile], [st_isfirst], [st_isend]) VALUES (4, 3, N'FS10-2', NULL, NULL, N'Drive（Right）', N'DSADSADSASA', 38, NULL, 8, NULL, NULL, NULL, NULL)
INSERT [dbo].[mg_station] ([st_id], [fl_id], [st_no], [st_pretime], [st_ispre], [st_name], [st_mac], [st_typeid], [st_typename], [st_order], [st_odsfile], [st_mushifile], [st_isfirst], [st_isend]) VALUES (5, 1, N'FSC10', NULL, NULL, N'Drive', N'', 36, NULL, 19, NULL, NULL, NULL, NULL)
INSERT [dbo].[mg_station] ([st_id], [fl_id], [st_no], [st_pretime], [st_ispre], [st_name], [st_mac], [st_typeid], [st_typename], [st_order], [st_odsfile], [st_mushifile], [st_isfirst], [st_isend]) VALUES (6, 1, N'FSC10', NULL, NULL, N'Passenger', N'', 39, NULL, 12, NULL, NULL, NULL, NULL)
INSERT [dbo].[mg_station] ([st_id], [fl_id], [st_no], [st_pretime], [st_ispre], [st_name], [st_mac], [st_typeid], [st_typename], [st_order], [st_odsfile], [st_mushifile], [st_isfirst], [st_isend]) VALUES (7, 2, N'FSB010', NULL, NULL, N'Drive', N'', 36, NULL, 13, NULL, NULL, NULL, NULL)
INSERT [dbo].[mg_station] ([st_id], [fl_id], [st_no], [st_pretime], [st_ispre], [st_name], [st_mac], [st_typeid], [st_typename], [st_order], [st_odsfile], [st_mushifile], [st_isfirst], [st_isend]) VALUES (8, 2, N'FSB010', NULL, NULL, N'Passenger', N'efef', 39, NULL, 14, NULL, NULL, NULL, NULL)
INSERT [dbo].[mg_station] ([st_id], [fl_id], [st_no], [st_pretime], [st_ispre], [st_name], [st_mac], [st_typeid], [st_typename], [st_order], [st_odsfile], [st_mushifile], [st_isfirst], [st_isend]) VALUES (9, 6, N'RSB4010', NULL, NULL, N'40%靠背', N'', 34, NULL, 15, NULL, NULL, NULL, NULL)
INSERT [dbo].[mg_station] ([st_id], [fl_id], [st_no], [st_pretime], [st_ispre], [st_name], [st_mac], [st_typeid], [st_typename], [st_order], [st_odsfile], [st_mushifile], [st_isfirst], [st_isend]) VALUES (10, 6, N'RSB4020', NULL, NULL, N'40%靠背', N'', 34, NULL, 16, NULL, NULL, NULL, NULL)
INSERT [dbo].[mg_station] ([st_id], [fl_id], [st_no], [st_pretime], [st_ispre], [st_name], [st_mac], [st_typeid], [st_typename], [st_order], [st_odsfile], [st_mushifile], [st_isfirst], [st_isend]) VALUES (11, 6, N'RSB6010', NULL, NULL, N'60%靠背', N'', 35, NULL, 10, NULL, NULL, NULL, NULL)
INSERT [dbo].[mg_station] ([st_id], [fl_id], [st_no], [st_pretime], [st_ispre], [st_name], [st_mac], [st_typeid], [st_typename], [st_order], [st_odsfile], [st_mushifile], [st_isfirst], [st_isend]) VALUES (12, 2, N'RSB6020', NULL, NULL, N'60%靠背', N'', 35, NULL, 18, NULL, NULL, NULL, NULL)
INSERT [dbo].[mg_station] ([st_id], [fl_id], [st_no], [st_pretime], [st_ispre], [st_name], [st_mac], [st_typeid], [st_typename], [st_order], [st_odsfile], [st_mushifile], [st_isfirst], [st_isend]) VALUES (13, 4, N'RSC10', NULL, NULL, N'坐垫', N'', 42, NULL, 20, NULL, NULL, NULL, NULL)
INSERT [dbo].[mg_station] ([st_id], [fl_id], [st_no], [st_pretime], [st_ispre], [st_name], [st_mac], [st_typeid], [st_typename], [st_order], [st_odsfile], [st_mushifile], [st_isfirst], [st_isend]) VALUES (14, 4, N'RSC20', NULL, NULL, N'坐垫', N'', 42, NULL, 21, NULL, NULL, NULL, NULL)
INSERT [dbo].[mg_station] ([st_id], [fl_id], [st_no], [st_pretime], [st_ispre], [st_name], [st_mac], [st_typeid], [st_typename], [st_order], [st_odsfile], [st_mushifile], [st_isfirst], [st_isend]) VALUES (15, 3, N'FS20', NULL, NULL, N'Drive（Left）', N'', 37, NULL, 22, NULL, NULL, NULL, NULL)
INSERT [dbo].[mg_station] ([st_id], [fl_id], [st_no], [st_pretime], [st_ispre], [st_name], [st_mac], [st_typeid], [st_typename], [st_order], [st_odsfile], [st_mushifile], [st_isfirst], [st_isend]) VALUES (16, 3, N'FS20', NULL, NULL, N'Passenger（Right）', N'', 41, NULL, 23, NULL, NULL, NULL, NULL)
INSERT [dbo].[mg_station] ([st_id], [fl_id], [st_no], [st_pretime], [st_ispre], [st_name], [st_mac], [st_typeid], [st_typename], [st_order], [st_odsfile], [st_mushifile], [st_isfirst], [st_isend]) VALUES (17, 6, N'RSB67', NULL, NULL, N'AAA', N'BBB', 35, NULL, 24, N'/UploadImages/StationPDF/magna_导出excel模块_20160914113929.sql', N'/UploadImages/StationImages/ditu_20160914113936.png', NULL, NULL)
INSERT [dbo].[mg_station] ([st_id], [fl_id], [st_no], [st_pretime], [st_ispre], [st_name], [st_mac], [st_typeid], [st_typename], [st_order], [st_odsfile], [st_mushifile], [st_isfirst], [st_isend]) VALUES (18, 3, N'aaaa', NULL, NULL, N'432432', N'432432', 36, NULL, 25, N'/UploadImages/StationPDF/magna_操作工模块_20160914021720.sql', N'/UploadImages/StationImages/lock_20160914021727.png', NULL, NULL)
INSERT [dbo].[mg_station] ([st_id], [fl_id], [st_no], [st_pretime], [st_ispre], [st_name], [st_mac], [st_typeid], [st_typename], [st_order], [st_odsfile], [st_mushifile], [st_isfirst], [st_isend]) VALUES (19, 6, N'啊啊啊', NULL, NULL, N'aaa', N'aaa', 35, NULL, 26, N'', N'/image/admin/camera.png', 0, 1)
INSERT [dbo].[mg_station] ([st_id], [fl_id], [st_no], [st_pretime], [st_ispre], [st_name], [st_mac], [st_typeid], [st_typename], [st_order], [st_odsfile], [st_mushifile], [st_isfirst], [st_isend]) VALUES (20, 3, N'fs150', NULL, NULL, N'测试bug', N'ffkfkf', 37, NULL, 27, NULL, NULL, NULL, NULL)
INSERT [dbo].[mg_Station_State] ([st_id_TV], [st_id], [st_no], [st_state]) VALUES (1, 1, N'FS010-1', 4)
INSERT [dbo].[mg_Station_State] ([st_id_TV], [st_id], [st_no], [st_state]) VALUES (2, 2, N'22222222222', 3)
INSERT [dbo].[mg_Station_State] ([st_id_TV], [st_id], [st_no], [st_state]) VALUES (4, 3, N'4444444', 8)
INSERT [dbo].[mg_step] ([step_id], [step_name], [fl_id], [st_id], [bom_id], [bom_count], [step_clock], [step_desc], [step_pic], [step_plccode], [step_order], [part_id], [step_scanCode], [Step_matchResult]) VALUES (1, N'FS-ST1-DL', 3, 1, 12, 0, 0, N'', N'/image/admin/Dashboard.png', 1, 1, 5, NULL, NULL)
INSERT [dbo].[mg_step] ([step_id], [step_name], [fl_id], [st_id], [bom_id], [bom_count], [step_clock], [step_desc], [step_pic], [step_plccode], [step_order], [part_id], [step_scanCode], [Step_matchResult]) VALUES (2, N'FS-ST2-DR', 3, 4, 11, 0, 0, N'', N'/image/admin/Dashboard.png', 2, 2, 5, NULL, NULL)
INSERT [dbo].[mg_step] ([step_id], [step_name], [fl_id], [st_id], [bom_id], [bom_count], [step_clock], [step_desc], [step_pic], [step_plccode], [step_order], [part_id], [step_scanCode], [Step_matchResult]) VALUES (5, N'FSB-ST1-D', 2, 7, 14, 0, 0, N'', N'/image/admin/Dashboard.png', 5, 5, 6, NULL, NULL)
INSERT [dbo].[mg_step] ([step_id], [step_name], [fl_id], [st_id], [bom_id], [bom_count], [step_clock], [step_desc], [step_pic], [step_plccode], [step_order], [part_id], [step_scanCode], [Step_matchResult]) VALUES (7, N'FSC-ST1-D', 1, 5, 0, 0, 0, N'', N'/image/admin/Dashboard.png', 7, 7, 7, NULL, NULL)
INSERT [dbo].[mg_step] ([step_id], [step_name], [fl_id], [st_id], [bom_id], [bom_count], [step_clock], [step_desc], [step_pic], [step_plccode], [step_order], [part_id], [step_scanCode], [Step_matchResult]) VALUES (8, N'FSC-ST1-P', 1, 6, 0, 0, 0, N'', N'/image/admin/Dashboard.png', 8, 8, 10, NULL, NULL)
INSERT [dbo].[mg_step] ([step_id], [step_name], [fl_id], [st_id], [bom_id], [bom_count], [step_clock], [step_desc], [step_pic], [step_plccode], [step_order], [part_id], [step_scanCode], [Step_matchResult]) VALUES (11, N'RSB60-ST1-1', 5, 11, 13, 0, 0, N'', N'/image/admin/Dashboard.png', 11, 11, 1, NULL, NULL)
INSERT [dbo].[mg_step] ([step_id], [step_name], [fl_id], [st_id], [bom_id], [bom_count], [step_clock], [step_desc], [step_pic], [step_plccode], [step_order], [part_id], [step_scanCode], [Step_matchResult]) VALUES (14, N'FS20-1', 3, 15, 12, 1, 0, N'', N'/image/admin/Dashboard.png', 14, 14, 5, NULL, NULL)
INSERT [dbo].[mg_step] ([step_id], [step_name], [fl_id], [st_id], [bom_id], [bom_count], [step_clock], [step_desc], [step_pic], [step_plccode], [step_order], [part_id], [step_scanCode], [Step_matchResult]) VALUES (15, N'FS-DL-M-1', 3, 1, 16, 1, 0, N'', N'/image/admin/Dashboard.png', 2, 15, 11, NULL, NULL)
INSERT [dbo].[mg_step] ([step_id], [step_name], [fl_id], [st_id], [bom_id], [bom_count], [step_clock], [step_desc], [step_pic], [step_plccode], [step_order], [part_id], [step_scanCode], [Step_matchResult]) VALUES (17, N'', 3, 16, 10, 55, 0, N'', N'/image/admin/Dashboard.png', 76, 17, 3, NULL, NULL)
INSERT [dbo].[mg_step] ([step_id], [step_name], [fl_id], [st_id], [bom_id], [bom_count], [step_clock], [step_desc], [step_pic], [step_plccode], [step_order], [part_id], [step_scanCode], [Step_matchResult]) VALUES (22, N'fdfdf', 3, 1, 0, 0, 20, N'ceshi', N'/image/admin/Dashboard.png', 0, 23, 12, NULL, NULL)
INSERT [dbo].[mg_step] ([step_id], [step_name], [fl_id], [st_id], [bom_id], [bom_count], [step_clock], [step_desc], [step_pic], [step_plccode], [step_order], [part_id], [step_scanCode], [Step_matchResult]) VALUES (23, N'dfdfdfd', 3, 1, 0, 0, 15, N'ceshi2', N'/image/admin/Dashboard.png', 0, 24, 12, NULL, NULL)
INSERT [dbo].[mg_step] ([step_id], [step_name], [fl_id], [st_id], [bom_id], [bom_count], [step_clock], [step_desc], [step_pic], [step_plccode], [step_order], [part_id], [step_scanCode], [Step_matchResult]) VALUES (3, N'FS-ST1-PL', 3, 3, 12, 0, 0, N'', N'/image/admin/Dashboard.png', 3, 3, 3, NULL, NULL)
INSERT [dbo].[mg_step] ([step_id], [step_name], [fl_id], [st_id], [bom_id], [bom_count], [step_clock], [step_desc], [step_pic], [step_plccode], [step_order], [part_id], [step_scanCode], [Step_matchResult]) VALUES (4, N'FS-ST2-PR', 3, 2, 11, 0, 0, N'', N'/image/admin/Dashboard.png', 4, 4, 3, NULL, NULL)
INSERT [dbo].[mg_step] ([step_id], [step_name], [fl_id], [st_id], [bom_id], [bom_count], [step_clock], [step_desc], [step_pic], [step_plccode], [step_order], [part_id], [step_scanCode], [Step_matchResult]) VALUES (6, N'FSB-ST1-P', 2, 8, 15, 0, 0, N'', N'/image/admin/Dashboard.png', 6, 6, 9, NULL, NULL)
INSERT [dbo].[mg_step] ([step_id], [step_name], [fl_id], [st_id], [bom_id], [bom_count], [step_clock], [step_desc], [step_pic], [step_plccode], [step_order], [part_id], [step_scanCode], [Step_matchResult]) VALUES (9, N'RSB40-ST1-1', 6, 9, 5, 0, 0, N'', N'/image/admin/Dashboard.png', 9, 9, 2, NULL, NULL)
INSERT [dbo].[mg_step] ([step_id], [step_name], [fl_id], [st_id], [bom_id], [bom_count], [step_clock], [step_desc], [step_pic], [step_plccode], [step_order], [part_id], [step_scanCode], [Step_matchResult]) VALUES (10, N'RSB40-ST2-1', 6, 10, 5, 0, 0, N'', N'/image/admin/Dashboard.png', 10, 10, 2, NULL, NULL)
INSERT [dbo].[mg_step] ([step_id], [step_name], [fl_id], [st_id], [bom_id], [bom_count], [step_clock], [step_desc], [step_pic], [step_plccode], [step_order], [part_id], [step_scanCode], [Step_matchResult]) VALUES (12, N'RSB60-ST2-1', 5, 12, 13, 0, 0, N'', N'/image/admin/Dashboard.png', 12, 12, 1, NULL, NULL)
INSERT [dbo].[mg_step] ([step_id], [step_name], [fl_id], [st_id], [bom_id], [bom_count], [step_clock], [step_desc], [step_pic], [step_plccode], [step_order], [part_id], [step_scanCode], [Step_matchResult]) VALUES (13, N'RSC-ST-1', 4, 13, 0, 0, 0, N'', N'/image/admin/Dashboard.png', 13, 13, 8, NULL, NULL)
INSERT [dbo].[mg_step] ([step_id], [step_name], [fl_id], [st_id], [bom_id], [bom_count], [step_clock], [step_desc], [step_pic], [step_plccode], [step_order], [part_id], [step_scanCode], [Step_matchResult]) VALUES (16, N'FS-DR-M-2', 3, 4, 16, 2, 0, N'', N'/image/admin/Dashboard.png', 5, 16, 11, NULL, NULL)
INSERT [dbo].[mg_step] ([step_id], [step_name], [fl_id], [st_id], [bom_id], [bom_count], [step_clock], [step_desc], [step_pic], [step_plccode], [step_order], [part_id], [step_scanCode], [Step_matchResult]) VALUES (18, N'70107866-fs010-1-1', 3, 1, 17, 3, 6, N'443243432432', N'/UploadImages/StepImages/logo_20160831103440.png', 45, 18, 12, NULL, NULL)
INSERT [dbo].[mg_step] ([step_id], [step_name], [fl_id], [st_id], [bom_id], [bom_count], [step_clock], [step_desc], [step_pic], [step_plccode], [step_order], [part_id], [step_scanCode], [Step_matchResult]) VALUES (19, N'70107866-FS010-1-2', 3, 1, 0, 2, 3, N'ttttt', N'/UploadImages/StepImages/searchSmall_20160831104014.png', 4, 19, 12, NULL, NULL)
INSERT [dbo].[mg_step] ([step_id], [step_name], [fl_id], [st_id], [bom_id], [bom_count], [step_clock], [step_desc], [step_pic], [step_plccode], [step_order], [part_id], [step_scanCode], [Step_matchResult]) VALUES (21, N'hehehe', 3, 1, 0, 0, 0, N'', N'/image/admin/Dashboard.png', 0, 21, 12, NULL, NULL)
SET IDENTITY_INSERT [dbo].[mg_sys_log] ON 

INSERT [dbo].[mg_sys_log] ([sys_id], [op_id], [op_name], [fl_id], [fl_name], [st_id], [st_no], [or_no], [part_no], [step_order], [step_startTime], [step_endTime], [step_duringtime], [AngleResult], [TorqueResult], [scanCode], [scanResult], [sys_desc]) VALUES (1, 8, N'第一人', 3, N'FS', 1, N'FS010-1', N'FS701078661608230001', N'70107866', 1, CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), 0, 0, 0, N'String 0', 2, N'')
SET IDENTITY_INSERT [dbo].[mg_sys_log] OFF
INSERT [dbo].[mg_User] ([user_id], [user_pwd], [user_name], [user_no], [user_pic], [posi_id], [user_email], [user_depid], [user_posiid], [user_menuids], [user_sex], [user_isAdmin]) VALUES (1, N'1', N'admin', NULL, NULL, NULL, N'renpeng.jiang@elco.cn', 5, 1, N'm1,m1_1,m1_2,m1_3,m1_4,m2,m2_1,m2_2,m2_3,m3,m3_1,m3_2,m3_3,m3_4,m4,m4_1,m4_2,m5,m5_1,m5_2,m5_3', 1, 1)
INSERT [dbo].[mg_User] ([user_id], [user_pwd], [user_name], [user_no], [user_pic], [posi_id], [user_email], [user_depid], [user_posiid], [user_menuids], [user_sex], [user_isAdmin]) VALUES (2, N'1', N'haha', NULL, NULL, NULL, N'321312321', 5, 1, N'm1,m1_1,m1_2,m1_3,m1_4,m4,m4_1,m4_2,m5,m5_1,m5_2,m5_3', 1, 0)
INSERT [dbo].[mg_User] ([user_id], [user_pwd], [user_name], [user_no], [user_pic], [posi_id], [user_email], [user_depid], [user_posiid], [user_menuids], [user_sex], [user_isAdmin]) VALUES (3, N'1', N'aaabbbxxxx', NULL, NULL, NULL, N'ttttt', 4, 4, N'm2,m2_1,m2_2,m2_3,m5,m5_1,m5_2,m5_3', 0, 1)
ALTER TABLE [dbo].[mg_CustomerOrder] ADD  CONSTRAINT [DF_mg_CustomerOrder_co_count]  DEFAULT ((0)) FOR [co_count]
GO
ALTER TABLE [dbo].[mg_CustomerOrder] ADD  CONSTRAINT [DF_mg_CustomerOrder_co_customer]  DEFAULT (N'沃尔沃') FOR [co_customer]
GO
ALTER TABLE [dbo].[mg_CustomerOrder] ADD  CONSTRAINT [DF_mg_CustomerOrder_co_state]  DEFAULT ((0)) FOR [co_state]
GO
ALTER TABLE [dbo].[mg_Order] ADD  CONSTRAINT [DF_mg_Order_or_state]  DEFAULT ((0)) FOR [or_state]
GO
ALTER TABLE [dbo].[mg_sys_log] ADD  CONSTRAINT [DF_mg_sys_log_step_duringtime]  DEFAULT ((0)) FOR [step_duringtime]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0：未生成；1：已生成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mg_CustomerOrder', @level2type=N'COLUMN',@level2name=N'co_state'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0：未生产；1：生产中；2：完成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mg_Order', @level2type=N'COLUMN',@level2name=N'or_state'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0：不匹配；1：匹配' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mg_sys_log', @level2type=N'COLUMN',@level2name=N'scanResult'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mg_User', @level2type=N'COLUMN',@level2name=N'user_pwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mg_User', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mg_User', @level2type=N'COLUMN',@level2name=N'user_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mg_User', @level2type=N'COLUMN',@level2name=N'user_pic'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工位号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mg_User', @level2type=N'COLUMN',@level2name=N'posi_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mg_User', @level2type=N'COLUMN',@level2name=N'user_email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属部门id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mg_User', @level2type=N'COLUMN',@level2name=N'user_depid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单可见权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mg_User', @level2type=N'COLUMN',@level2name=N'user_menuids'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "mg_FlowLine"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 107
               Right = 180
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "mg_station"
            Begin Extent = 
               Top = 6
               Left = 218
               Bottom = 145
               Right = 367
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Station'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Station'
GO
USE [master]
GO
ALTER DATABASE [MagnaDB] SET  READ_WRITE 
GO
