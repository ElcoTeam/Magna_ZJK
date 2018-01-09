USE [master]
GO
/****** Object:  Database [MagnaDB]    Script Date: 2016/8/12 16:56:02 ******/
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
/****** Object:  Table [dbo].[mg_allpart]    Script Date: 2016/8/12 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_allpart](
	[all_id] [int] IDENTITY(1,1) NOT NULL,
	[all_no] [nvarchar](50) NULL,
	[all_rateid] [int] NULL,
	[all_ratename] [nvarchar](50) NULL,
	[all_colorid] [int] NULL,
	[all_colorname] [nvarchar](50) NULL,
	[all_metaid] [int] NULL,
	[all_metaname] [nvarchar](50) NULL,
	[all_desc] [nvarchar](50) NULL,
 CONSTRAINT [PK_mg_allpart] PRIMARY KEY CLUSTERED 
(
	[all_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_allpart_part_rel]    Script Date: 2016/8/12 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_allpart_part_rel](
	[all_id] [int] NOT NULL,
	[partid_id] [int] NOT NULL,
 CONSTRAINT [PK_mg_allpart_part_rel] PRIMARY KEY CLUSTERED 
(
	[all_id] ASC,
	[partid_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_BOM]    Script Date: 2016/8/12 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_BOM](
	[bom_id] [int] NULL,
	[bom_name] [nvarchar](50) NULL,
	[bom_no] [nvarchar](50) NULL,
	[bom_leve] [int] NULL,
	[bom_desc] [nvarchar](500) NULL,
	[bom_picture] [nvarchar](500) NULL,
	[bom_material] [nvarchar](500) NULL,
	[bom_profile] [nvarchar](50) NULL,
	[bom_weight] [int] NULL,
	[bom_suppller] [nvarchar](500) NULL,
	[bom_category] [nvarchar](50) NULL,
	[bom_comments] [nvarchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_classes]    Script Date: 2016/8/12 16:56:02 ******/
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
/****** Object:  Table [dbo].[mg_CustomerOrder]    Script Date: 2016/8/12 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_CustomerOrder](
	[co_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[co_no] [nvarchar](50) NULL,
	[all_id] [nvarchar](500) NULL,
	[co_count] [int] NULL,
	[co_customer] [nvarchar](500) NULL,
	[co_state] [int] NOT NULL,
 CONSTRAINT [PK_mg_CustomerOrder] PRIMARY KEY CLUSTERED 
(
	[co_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_Department]    Script Date: 2016/8/12 16:56:02 ******/
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
/****** Object:  Table [dbo].[mg_FlowLine]    Script Date: 2016/8/12 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_FlowLine](
	[fl_id] [int] NULL,
	[fl_name] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_Operator]    Script Date: 2016/8/12 16:56:02 ******/
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
/****** Object:  Table [dbo].[mg_Order]    Script Date: 2016/8/12 16:56:02 ******/
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
/****** Object:  Table [dbo].[mg_order_flowline_rel]    Script Date: 2016/8/12 16:56:02 ******/
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
/****** Object:  Table [dbo].[mg_Order_FS]    Script Date: 2016/8/12 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_Order_FS](
	[os_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[or_no] [numeric](18, 0) NULL,
	[part_no] [nvarchar](50) NULL,
	[part_type] [nvarchar](50) NULL,
	[os_settime] [datetime] NULL,
	[os_starttime] [datetime] NULL,
	[os_endtime] [datetime] NULL,
	[os_duringtime] [bigint] NULL,
	[os_state] [int] NULL,
	[co_no] [nvarchar](50) NULL,
 CONSTRAINT [PK_mg_Order_FS] PRIMARY KEY CLUSTERED 
(
	[os_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_Order_FSB]    Script Date: 2016/8/12 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_Order_FSB](
	[os_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[or_no] [numeric](18, 0) NULL,
	[part_no] [nvarchar](50) NULL,
	[part_type] [nvarchar](50) NULL,
	[os_settime] [datetime] NULL,
	[os_starttime] [datetime] NULL,
	[os_endtime] [datetime] NULL,
	[os_duringtime] [bigint] NULL,
	[os_state] [int] NULL,
	[co_no] [nvarchar](50) NULL,
 CONSTRAINT [PK_mg_Order_FSB] PRIMARY KEY CLUSTERED 
(
	[os_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_Order_FSBL]    Script Date: 2016/8/12 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_Order_FSBL](
	[os_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[or_no] [numeric](18, 0) NULL,
	[part_no] [nvarchar](50) NULL,
	[os_starttime] [datetime] NULL,
	[os_endtime] [datetime] NULL,
	[os_duringtime] [bigint] NULL,
	[os_state] [int] NULL,
	[co_no] [nvarchar](50) NULL,
	[part_type] [nvarchar](50) NULL,
 CONSTRAINT [PK_mg_Order_FSBL] PRIMARY KEY CLUSTERED 
(
	[os_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_Order_FSBR]    Script Date: 2016/8/12 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_Order_FSBR](
	[os_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[or_no] [numeric](18, 0) NULL,
	[part_no] [nvarchar](50) NULL,
	[os_starttime] [datetime] NULL,
	[os_endtime] [datetime] NULL,
	[os_duringtime] [bigint] NULL,
	[os_state] [int] NULL,
	[co_no] [nvarchar](50) NULL,
	[part_type] [nvarchar](50) NULL,
 CONSTRAINT [PK_mg_Order_FSBR] PRIMARY KEY CLUSTERED 
(
	[os_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_Order_FSC]    Script Date: 2016/8/12 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_Order_FSC](
	[os_id] [numeric](18, 0) NOT NULL,
	[or_no] [numeric](18, 0) NULL,
	[part_no] [nvarchar](50) NULL,
	[part_type] [nvarchar](50) NULL,
	[os_settime] [datetime] NULL,
	[os_starttime] [datetime] NULL,
	[os_endtime] [datetime] NULL,
	[os_duringtime] [bigint] NULL,
	[os_state] [int] NULL,
	[co_no] [nvarchar](50) NULL,
 CONSTRAINT [PK_mg_Order_FSC] PRIMARY KEY CLUSTERED 
(
	[os_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_Order_FSCL]    Script Date: 2016/8/12 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_Order_FSCL](
	[os_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[or_no] [numeric](18, 0) NULL,
	[part_no] [nvarchar](50) NULL,
	[os_starttime] [datetime] NULL,
	[os_endtime] [datetime] NULL,
	[os_duringtime] [bigint] NULL,
	[os_state] [int] NULL,
	[co_no] [nvarchar](50) NULL,
	[part_type] [nvarchar](50) NULL,
 CONSTRAINT [PK_mg_Order_FSCL] PRIMARY KEY CLUSTERED 
(
	[os_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_Order_FSCR]    Script Date: 2016/8/12 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_Order_FSCR](
	[os_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[or_no] [numeric](18, 0) NULL,
	[part_no] [nvarchar](50) NULL,
	[os_starttime] [datetime] NULL,
	[os_endtime] [datetime] NULL,
	[os_duringtime] [bigint] NULL,
	[os_state] [int] NULL,
	[co_no] [nvarchar](50) NULL,
	[part_type] [nvarchar](50) NULL,
 CONSTRAINT [PK_mg_Order_FSCR] PRIMARY KEY CLUSTERED 
(
	[os_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_Order_FSL]    Script Date: 2016/8/12 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_Order_FSL](
	[os_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[or_no] [numeric](18, 0) NULL,
	[part_no] [nvarchar](50) NULL,
	[os_starttime] [datetime] NULL,
	[os_endtime] [datetime] NULL,
	[os_duringtime] [bigint] NULL,
	[os_state] [int] NULL,
	[co_no] [nvarchar](50) NULL,
	[part_type] [nvarchar](50) NULL,
 CONSTRAINT [PK_mg_Order_FSL] PRIMARY KEY CLUSTERED 
(
	[os_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_Order_FSR]    Script Date: 2016/8/12 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_Order_FSR](
	[os_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[or_no] [numeric](18, 0) NULL,
	[part_no] [nvarchar](50) NULL,
	[os_starttime] [datetime] NULL,
	[os_endtime] [datetime] NULL,
	[os_duringtime] [bigint] NULL,
	[os_state] [int] NULL,
	[co_no] [nvarchar](50) NULL,
	[part_type] [nvarchar](50) NULL,
 CONSTRAINT [PK_mg_Order_FSR] PRIMARY KEY CLUSTERED 
(
	[os_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_Order_RSB]    Script Date: 2016/8/12 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_Order_RSB](
	[os_id] [numeric](18, 0) NOT NULL,
	[or_no] [numeric](18, 0) NULL,
	[part_no] [nvarchar](50) NULL,
	[part_type] [nvarchar](50) NULL,
	[os_settime] [datetime] NULL,
	[os_starttime] [datetime] NULL,
	[os_endtime] [datetime] NULL,
	[os_duringtime] [bigint] NULL,
	[os_state] [int] NULL,
	[co_no] [nvarchar](50) NULL,
 CONSTRAINT [PK_mg_Order_RSB] PRIMARY KEY CLUSTERED 
(
	[os_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_Order_RSB40]    Script Date: 2016/8/12 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_Order_RSB40](
	[os_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[or_no] [numeric](18, 0) NULL,
	[part_no] [nvarchar](50) NULL,
	[os_starttime] [datetime] NULL,
	[os_endtime] [datetime] NULL,
	[os_duringtime] [bigint] NULL,
	[os_state] [int] NULL,
	[co_no] [nvarchar](50) NULL,
	[part_type] [nvarchar](50) NULL,
 CONSTRAINT [PK_mg_Order_RSB40] PRIMARY KEY CLUSTERED 
(
	[os_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_Order_RSB60]    Script Date: 2016/8/12 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_Order_RSB60](
	[os_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[or_no] [numeric](18, 0) NULL,
	[part_no] [nvarchar](50) NULL,
	[os_starttime] [datetime] NULL,
	[os_endtime] [datetime] NULL,
	[os_duringtime] [bigint] NULL,
	[os_state] [int] NULL,
	[co_no] [nvarchar](50) NULL,
	[part_type] [nvarchar](50) NULL,
 CONSTRAINT [PK_mg_Order_RSB60] PRIMARY KEY CLUSTERED 
(
	[os_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_Order_RSC]    Script Date: 2016/8/12 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_Order_RSC](
	[os_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[or_no] [numeric](18, 0) NULL,
	[part_no] [nvarchar](50) NULL,
	[os_starttime] [datetime] NULL,
	[os_endtime] [datetime] NULL,
	[os_duringtime] [bigint] NULL,
	[os_state] [int] NULL,
	[co_no] [nvarchar](50) NULL,
	[part_type] [nvarchar](50) NULL,
 CONSTRAINT [PK_mg_Order_RSC] PRIMARY KEY CLUSTERED 
(
	[os_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_Order_stationInfo]    Script Date: 2016/8/12 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_Order_stationInfo](
	[os_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[or_no] [numeric](18, 0) NULL,
	[part_no] [nvarchar](50) NULL,
	[os_starttime] [datetime] NULL,
	[os_endtime] [datetime] NULL,
	[os_duringtime] [bigint] NULL,
	[os_state] [int] NULL,
	[co_no] [nvarchar](50) NULL,
	[part_type] [nvarchar](50) NULL,
 CONSTRAINT [PK_Table_1mg_Order_stationInfo] PRIMARY KEY CLUSTERED 
(
	[os_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_Order_stationInfo1]    Script Date: 2016/8/12 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_Order_stationInfo1](
	[os_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[or_no] [numeric](18, 0) NULL,
	[part_no] [nvarchar](50) NULL,
	[os_starttime] [datetime] NULL,
	[os_endtime] [datetime] NULL,
	[os_duringtime] [bigint] NULL,
	[os_state] [int] NULL,
	[co_no] [nvarchar](50) NULL,
	[part_type] [nvarchar](50) NULL,
 CONSTRAINT [PK_mg_Order_stationInfo1] PRIMARY KEY CLUSTERED 
(
	[os_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_OrderFlag]    Script Date: 2016/8/12 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_OrderFlag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[WorkName] [nvarchar](50) NULL,
 CONSTRAINT [PK_mg_OrderFlag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_OrderRead]    Script Date: 2016/8/12 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_OrderRead](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[WorkName] [nvarchar](50) NULL,
 CONSTRAINT [PK_mg_OrderRead] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_OrderWrite]    Script Date: 2016/8/12 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_OrderWrite](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[WorkName] [nvarchar](50) NULL,
 CONSTRAINT [PK_mg_OrderWrite] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_part]    Script Date: 2016/8/12 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_part](
	[part_id] [int] IDENTITY(1,1) NOT NULL,
	[part_no] [nvarchar](50) NULL,
	[part_name] [nvarchar](50) NULL,
	[part_desc] [nvarchar](500) NULL,
	[part_tpye] [nvarchar](50) NULL,
 CONSTRAINT [PK_mg_part] PRIMARY KEY CLUSTERED 
(
	[part_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_part_bom_rel]    Script Date: 2016/8/12 16:56:02 ******/
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
/****** Object:  Table [dbo].[mg_Position]    Script Date: 2016/8/12 16:56:02 ******/
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
/****** Object:  Table [dbo].[mg_State]    Script Date: 2016/8/12 16:56:02 ******/
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
/****** Object:  Table [dbo].[mg_station]    Script Date: 2016/8/12 16:56:02 ******/
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
	[st_mac] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mg_Station_State]    Script Date: 2016/8/12 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_Station_State](
	[st_id_TV] [int] NOT NULL,
	[st_id] [int] NOT NULL,
	[st_no] [nvarchar](50) NOT NULL,
	[st_state] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_step]    Script Date: 2016/8/12 16:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mg_step](
	[step_id] [int] NULL,
	[step_name] [nvarchar](50) NULL,
	[st_id] [int] NULL,
	[bom_id] [int] NULL,
	[bom_count] [int] NULL,
	[step_clock] [int] NULL,
	[step_desc] [nvarchar](500) NULL,
	[Step_pic] [nvarchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mg_step_log]    Script Date: 2016/8/12 16:56:02 ******/
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
/****** Object:  Table [dbo].[mg_User]    Script Date: 2016/8/12 16:56:02 ******/
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
/****** Object:  View [dbo].[View_Station]    Script Date: 2016/8/12 16:56:02 ******/
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
SET IDENTITY_INSERT [dbo].[mg_allpart] ON 

INSERT [dbo].[mg_allpart] ([all_id], [all_no], [all_rateid], [all_ratename], [all_colorid], [all_colorname], [all_metaid], [all_metaname], [all_desc]) VALUES (1, N'701080220102', NULL, N'低配', NULL, N'黑色', NULL, N'化纤', N'')
INSERT [dbo].[mg_allpart] ([all_id], [all_no], [all_rateid], [all_ratename], [all_colorid], [all_colorname], [all_metaid], [all_metaname], [all_desc]) VALUES (3, N'2222', NULL, N'33', NULL, N'44', NULL, N'44', N'')
SET IDENTITY_INSERT [dbo].[mg_allpart] OFF
INSERT [dbo].[mg_allpart_part_rel] ([all_id], [partid_id]) VALUES (1, 1)
INSERT [dbo].[mg_allpart_part_rel] ([all_id], [partid_id]) VALUES (1, 3)
INSERT [dbo].[mg_allpart_part_rel] ([all_id], [partid_id]) VALUES (1, 5)
INSERT [dbo].[mg_allpart_part_rel] ([all_id], [partid_id]) VALUES (1, 6)
INSERT [dbo].[mg_allpart_part_rel] ([all_id], [partid_id]) VALUES (1, 7)
INSERT [dbo].[mg_BOM] ([bom_id], [bom_name], [bom_no], [bom_leve], [bom_desc], [bom_picture], [bom_material], [bom_profile], [bom_weight], [bom_suppller], [bom_category], [bom_comments]) VALUES (5, N'Bom1', N'1', 1, N'1', N'bom1.jpg', N'1', N'1', 1, N'1', N'1', N'1')
INSERT [dbo].[mg_BOM] ([bom_id], [bom_name], [bom_no], [bom_leve], [bom_desc], [bom_picture], [bom_material], [bom_profile], [bom_weight], [bom_suppller], [bom_category], [bom_comments]) VALUES (8, N'Bom2', N'8', 8, N'8', N'bom3.jpg', N'8', N'8', 8, N'8', N'8', N'8')
INSERT [dbo].[mg_classes] ([cl_id], [cl_name], [cl_starttime], [cl_endtime], [st_id]) VALUES (6, N'班次名称1', CAST(0x0000A648008C1360 AS DateTime), CAST(0x0000A64801206420 AS DateTime), NULL)
INSERT [dbo].[mg_classes] ([cl_id], [cl_name], [cl_starttime], [cl_endtime], [st_id]) VALUES (7, N'班次名称2', CAST(0x0000A64801206420 AS DateTime), CAST(0x0000A648007B98A0 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[mg_CustomerOrder] ON 

INSERT [dbo].[mg_CustomerOrder] ([co_id], [co_no], [all_id], [co_count], [co_customer], [co_state]) VALUES (CAST(1 AS Numeric(18, 0)), N'2016080501', N'1', 10, N'沃尔沃', 0)
INSERT [dbo].[mg_CustomerOrder] ([co_id], [co_no], [all_id], [co_count], [co_customer], [co_state]) VALUES (CAST(2 AS Numeric(18, 0)), N'2016080502', N'1', 1, N'', 0)
SET IDENTITY_INSERT [dbo].[mg_CustomerOrder] OFF
INSERT [dbo].[mg_Department] ([dep_id], [dep_name]) VALUES (4, N'生产部')
INSERT [dbo].[mg_Department] ([dep_id], [dep_name]) VALUES (2, N'市场部')
INSERT [dbo].[mg_Department] ([dep_id], [dep_name]) VALUES (3, N'人事部')
INSERT [dbo].[mg_Department] ([dep_id], [dep_name]) VALUES (5, N'IT部')
INSERT [dbo].[mg_FlowLine] ([fl_id], [fl_name]) VALUES (1, N'FSC(前排座垫)')
INSERT [dbo].[mg_FlowLine] ([fl_id], [fl_name]) VALUES (2, N'FCB(前排靠背)')
INSERT [dbo].[mg_FlowLine] ([fl_id], [fl_name]) VALUES (3, N'FS(前排组合)')
INSERT [dbo].[mg_Operator] ([op_id], [st_id], [op_name], [op_no], [op_pic], [op_isoperator], [op_mac], [op_sex]) VALUES (1, 0, N'管理员', N'0000000000000000000000000A000001', N'/UploadImages/OperatorImages/lock_20160811015447.png', 1, NULL, 1)
INSERT [dbo].[mg_Operator] ([op_id], [st_id], [op_name], [op_no], [op_pic], [op_isoperator], [op_mac], [op_sex]) VALUES (2, 1, N'操作工-1-1', N'0000000000000000000000000A000002', N'/UploadImages/OperatorImages/boat_20160811013829.png', 0, N'', 1)
INSERT [dbo].[mg_Operator] ([op_id], [st_id], [op_name], [op_no], [op_pic], [op_isoperator], [op_mac], [op_sex]) VALUES (3, 1, N'操作工-1-2', N'0000000000000000000000000A000003', N'/UploadImages/OperatorImages/airplane_20160811013702.png', 0, N'000C298461B5', 1)
INSERT [dbo].[mg_Operator] ([op_id], [st_id], [op_name], [op_no], [op_pic], [op_isoperator], [op_mac], [op_sex]) VALUES (4, 1, N'操作工-1-3', N'0000000000000000000000000A000004', N'/UploadImages/OperatorImages/baoyou_20160810050145.png', 0, NULL, 1)
INSERT [dbo].[mg_Operator] ([op_id], [st_id], [op_name], [op_no], [op_pic], [op_isoperator], [op_mac], [op_sex]) VALUES (5, 2, N'操作工-2-1', N'0000000000000000000000000A000005', N'/UploadImages/OperatorImages/ditu_20160811114257.png', 0, NULL, 1)
INSERT [dbo].[mg_Operator] ([op_id], [st_id], [op_name], [op_no], [op_pic], [op_isoperator], [op_mac], [op_sex]) VALUES (6, 2, N'操作员-2-2', N'0000000000000000000000000A000006', N'/image/admin/user_male.png', 0, NULL, 1)
INSERT [dbo].[mg_Operator] ([op_id], [st_id], [op_name], [op_no], [op_pic], [op_isoperator], [op_mac], [op_sex]) VALUES (7, 2, N'操作工-2-3', N'0000000000000000000000000A000007', N'/image/admin/user_male.png', 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[mg_Order_FSBL] ON 

INSERT [dbo].[mg_Order_FSBL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSBL')
INSERT [dbo].[mg_Order_FSBL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSBL')
INSERT [dbo].[mg_Order_FSBL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSBL')
INSERT [dbo].[mg_Order_FSBL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSBL')
INSERT [dbo].[mg_Order_FSBL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSBL')
INSERT [dbo].[mg_Order_FSBL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSBL')
INSERT [dbo].[mg_Order_FSBL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSBL')
INSERT [dbo].[mg_Order_FSBL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSBL')
INSERT [dbo].[mg_Order_FSBL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSBL')
INSERT [dbo].[mg_Order_FSBL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(10 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSBL')
SET IDENTITY_INSERT [dbo].[mg_Order_FSBL] OFF
SET IDENTITY_INSERT [dbo].[mg_Order_FSBR] ON 

INSERT [dbo].[mg_Order_FSBR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSBR')
INSERT [dbo].[mg_Order_FSBR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSBR')
INSERT [dbo].[mg_Order_FSBR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSBR')
INSERT [dbo].[mg_Order_FSBR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSBR')
INSERT [dbo].[mg_Order_FSBR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSBR')
INSERT [dbo].[mg_Order_FSBR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSBR')
INSERT [dbo].[mg_Order_FSBR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSBR')
INSERT [dbo].[mg_Order_FSBR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSBR')
INSERT [dbo].[mg_Order_FSBR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSBR')
INSERT [dbo].[mg_Order_FSBR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(10 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSBR')
SET IDENTITY_INSERT [dbo].[mg_Order_FSBR] OFF
SET IDENTITY_INSERT [dbo].[mg_Order_FSCL] ON 

INSERT [dbo].[mg_Order_FSCL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSCL')
INSERT [dbo].[mg_Order_FSCL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSCL')
INSERT [dbo].[mg_Order_FSCL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSCL')
INSERT [dbo].[mg_Order_FSCL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSCL')
INSERT [dbo].[mg_Order_FSCL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSCL')
INSERT [dbo].[mg_Order_FSCL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSCL')
INSERT [dbo].[mg_Order_FSCL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSCL')
INSERT [dbo].[mg_Order_FSCL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSCL')
INSERT [dbo].[mg_Order_FSCL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSCL')
INSERT [dbo].[mg_Order_FSCL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(10 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSCL')
SET IDENTITY_INSERT [dbo].[mg_Order_FSCL] OFF
SET IDENTITY_INSERT [dbo].[mg_Order_FSCR] ON 

INSERT [dbo].[mg_Order_FSCR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSCR')
INSERT [dbo].[mg_Order_FSCR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSCR')
INSERT [dbo].[mg_Order_FSCR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSCR')
INSERT [dbo].[mg_Order_FSCR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSCR')
INSERT [dbo].[mg_Order_FSCR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSCR')
INSERT [dbo].[mg_Order_FSCR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSCR')
INSERT [dbo].[mg_Order_FSCR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSCR')
INSERT [dbo].[mg_Order_FSCR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSCR')
INSERT [dbo].[mg_Order_FSCR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSCR')
INSERT [dbo].[mg_Order_FSCR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(10 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSCR')
SET IDENTITY_INSERT [dbo].[mg_Order_FSCR] OFF
SET IDENTITY_INSERT [dbo].[mg_Order_FSL] ON 

INSERT [dbo].[mg_Order_FSL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSL')
INSERT [dbo].[mg_Order_FSL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSL')
INSERT [dbo].[mg_Order_FSL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSL')
INSERT [dbo].[mg_Order_FSL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSL')
INSERT [dbo].[mg_Order_FSL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSL')
INSERT [dbo].[mg_Order_FSL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSL')
INSERT [dbo].[mg_Order_FSL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSL')
INSERT [dbo].[mg_Order_FSL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSL')
INSERT [dbo].[mg_Order_FSL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSL')
INSERT [dbo].[mg_Order_FSL] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(10 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107866', NULL, NULL, NULL, 0, N'0001', N'FSL')
SET IDENTITY_INSERT [dbo].[mg_Order_FSL] OFF
SET IDENTITY_INSERT [dbo].[mg_Order_FSR] ON 

INSERT [dbo].[mg_Order_FSR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSR')
INSERT [dbo].[mg_Order_FSR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSR')
INSERT [dbo].[mg_Order_FSR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSR')
INSERT [dbo].[mg_Order_FSR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSR')
INSERT [dbo].[mg_Order_FSR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSR')
INSERT [dbo].[mg_Order_FSR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSR')
INSERT [dbo].[mg_Order_FSR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSR')
INSERT [dbo].[mg_Order_FSR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSR')
INSERT [dbo].[mg_Order_FSR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSR')
INSERT [dbo].[mg_Order_FSR] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(10 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70107873', NULL, NULL, NULL, 0, N'0001', N'FSR')
SET IDENTITY_INSERT [dbo].[mg_Order_FSR] OFF
SET IDENTITY_INSERT [dbo].[mg_Order_RSB40] ON 

INSERT [dbo].[mg_Order_RSB40] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108022', NULL, NULL, NULL, 0, N'0001', N'RSB40')
INSERT [dbo].[mg_Order_RSB40] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108022', NULL, NULL, NULL, 0, N'0001', N'RSB40')
INSERT [dbo].[mg_Order_RSB40] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108022', NULL, NULL, NULL, 0, N'0001', N'RSB40')
INSERT [dbo].[mg_Order_RSB40] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108022', NULL, NULL, NULL, 0, N'0001', N'RSB40')
INSERT [dbo].[mg_Order_RSB40] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108022', NULL, NULL, NULL, 0, N'0001', N'RSB40')
INSERT [dbo].[mg_Order_RSB40] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108022', NULL, NULL, NULL, 0, N'0001', N'RSB40')
INSERT [dbo].[mg_Order_RSB40] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108022', NULL, NULL, NULL, 0, N'0001', N'RSB40')
INSERT [dbo].[mg_Order_RSB40] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108022', NULL, NULL, NULL, 0, N'0001', N'RSB40')
INSERT [dbo].[mg_Order_RSB40] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108022', NULL, NULL, NULL, 0, N'0001', N'RSB40')
INSERT [dbo].[mg_Order_RSB40] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(10 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108022', NULL, NULL, NULL, 0, N'0001', N'RSB40')
SET IDENTITY_INSERT [dbo].[mg_Order_RSB40] OFF
SET IDENTITY_INSERT [dbo].[mg_Order_RSB60] ON 

INSERT [dbo].[mg_Order_RSB60] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108034', NULL, NULL, NULL, 0, N'0001', N'RSB60')
INSERT [dbo].[mg_Order_RSB60] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108034', NULL, NULL, NULL, 0, N'0001', N'RSB60')
INSERT [dbo].[mg_Order_RSB60] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108034', NULL, NULL, NULL, 0, N'0001', N'RSB60')
INSERT [dbo].[mg_Order_RSB60] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108034', NULL, NULL, NULL, 0, N'0001', N'RSB60')
INSERT [dbo].[mg_Order_RSB60] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108034', NULL, NULL, NULL, 0, N'0001', N'RSB60')
INSERT [dbo].[mg_Order_RSB60] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108034', NULL, NULL, NULL, 0, N'0001', N'RSB60')
INSERT [dbo].[mg_Order_RSB60] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108034', NULL, NULL, NULL, 0, N'0001', N'RSB60')
INSERT [dbo].[mg_Order_RSB60] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108034', NULL, NULL, NULL, 0, N'0001', N'RSB60')
INSERT [dbo].[mg_Order_RSB60] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108034', NULL, NULL, NULL, 0, N'0001', N'RSB60')
INSERT [dbo].[mg_Order_RSB60] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(10 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108034', NULL, NULL, NULL, 0, N'0001', N'RSB60')
SET IDENTITY_INSERT [dbo].[mg_Order_RSB60] OFF
SET IDENTITY_INSERT [dbo].[mg_Order_RSC] ON 

INSERT [dbo].[mg_Order_RSC] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108030', NULL, NULL, NULL, 0, N'0001', N'RSC')
INSERT [dbo].[mg_Order_RSC] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108030', NULL, NULL, NULL, 0, N'0001', N'RSC')
INSERT [dbo].[mg_Order_RSC] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108030', NULL, NULL, NULL, 0, N'0001', N'RSC')
INSERT [dbo].[mg_Order_RSC] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108030', NULL, NULL, NULL, 0, N'0001', N'RSC')
INSERT [dbo].[mg_Order_RSC] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108030', NULL, NULL, NULL, 0, N'0001', N'RSC')
INSERT [dbo].[mg_Order_RSC] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108030', NULL, NULL, NULL, 0, N'0001', N'RSC')
INSERT [dbo].[mg_Order_RSC] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108030', NULL, NULL, NULL, 0, N'0001', N'RSC')
INSERT [dbo].[mg_Order_RSC] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108030', NULL, NULL, NULL, 0, N'0001', N'RSC')
INSERT [dbo].[mg_Order_RSC] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108030', NULL, NULL, NULL, 0, N'0001', N'RSC')
INSERT [dbo].[mg_Order_RSC] ([os_id], [or_no], [part_no], [os_starttime], [os_endtime], [os_duringtime], [os_state], [co_no], [part_type]) VALUES (CAST(10 AS Numeric(18, 0)), CAST(701080220102 AS Numeric(18, 0)), N'70108030', NULL, NULL, NULL, 0, N'0001', N'RSC')
SET IDENTITY_INSERT [dbo].[mg_Order_RSC] OFF
SET IDENTITY_INSERT [dbo].[mg_OrderFlag] ON 

INSERT [dbo].[mg_OrderFlag] ([ID], [Address], [WorkName]) VALUES (1, N'MagnaOrder.FSB.FSBL_Flag', N'FSBL')
INSERT [dbo].[mg_OrderFlag] ([ID], [Address], [WorkName]) VALUES (2, N'MagnaOrder.FSB.FSBR_Flag', N'FSBR')
INSERT [dbo].[mg_OrderFlag] ([ID], [Address], [WorkName]) VALUES (3, N'MagnaOrder.FSC.FSCL_Flag', N'FSCL')
INSERT [dbo].[mg_OrderFlag] ([ID], [Address], [WorkName]) VALUES (4, N'MagnaOrder.FSC.FSCR_Flag', N'FSCR')
INSERT [dbo].[mg_OrderFlag] ([ID], [Address], [WorkName]) VALUES (5, N'MagnaOrder.RSB.RSB40_Flag', N'RSB40')
INSERT [dbo].[mg_OrderFlag] ([ID], [Address], [WorkName]) VALUES (6, N'MagnaOrder.RSB.RSB60_Flag', N'RSB60')
INSERT [dbo].[mg_OrderFlag] ([ID], [Address], [WorkName]) VALUES (7, N'MagnaOrder.RSC.RSC_Flag', N'RSC')
INSERT [dbo].[mg_OrderFlag] ([ID], [Address], [WorkName]) VALUES (8, N'MagnaOrder.FS.FSL_Flag', N'FSL')
INSERT [dbo].[mg_OrderFlag] ([ID], [Address], [WorkName]) VALUES (9, N'MagnaOrder.FS.FSR_Flag', N'FSR')
SET IDENTITY_INSERT [dbo].[mg_OrderFlag] OFF
SET IDENTITY_INSERT [dbo].[mg_OrderRead] ON 

INSERT [dbo].[mg_OrderRead] ([ID], [Address], [WorkName]) VALUES (1, N'MagnaOrder.FSB.FSBL_Read', N'FSBL')
INSERT [dbo].[mg_OrderRead] ([ID], [Address], [WorkName]) VALUES (2, N'MagnaOrder.FSB.FSBR_Read', N'FSBR')
INSERT [dbo].[mg_OrderRead] ([ID], [Address], [WorkName]) VALUES (3, N'MagnaOrder.FSC.FSCL_Read', N'FSCL')
INSERT [dbo].[mg_OrderRead] ([ID], [Address], [WorkName]) VALUES (4, N'MagnaOrder.FSC.FSCR_Read', N'FSCR')
INSERT [dbo].[mg_OrderRead] ([ID], [Address], [WorkName]) VALUES (5, N'MagnaOrder.RSB.RSB40_Read', N'RSB40')
INSERT [dbo].[mg_OrderRead] ([ID], [Address], [WorkName]) VALUES (6, N'MagnaOrder.RSB.RSB60_Read', N'RSB60')
INSERT [dbo].[mg_OrderRead] ([ID], [Address], [WorkName]) VALUES (7, N'MagnaOrder.RSC.RSC_Read', N'RSC')
INSERT [dbo].[mg_OrderRead] ([ID], [Address], [WorkName]) VALUES (8, N'MagnaOrder.FS.FSL_Read', N'FSL')
INSERT [dbo].[mg_OrderRead] ([ID], [Address], [WorkName]) VALUES (9, N'MagnaOrder.FS.FSR_Read', N'FSR')
SET IDENTITY_INSERT [dbo].[mg_OrderRead] OFF
SET IDENTITY_INSERT [dbo].[mg_OrderWrite] ON 

INSERT [dbo].[mg_OrderWrite] ([ID], [Address], [WorkName]) VALUES (1, N'MagnaOrder.FSB.FSBL_Write', N'FSBL')
INSERT [dbo].[mg_OrderWrite] ([ID], [Address], [WorkName]) VALUES (2, N'MagnaOrder.FSB.FSBR_Write', N'FSBR')
INSERT [dbo].[mg_OrderWrite] ([ID], [Address], [WorkName]) VALUES (3, N'MagnaOrder.FSC.FSCL_Write', N'FSCL')
INSERT [dbo].[mg_OrderWrite] ([ID], [Address], [WorkName]) VALUES (4, N'MagnaOrder.FSC.FSCR_Write', N'FSCR')
INSERT [dbo].[mg_OrderWrite] ([ID], [Address], [WorkName]) VALUES (5, N'MagnaOrder.RSB.RSB40_Write', N'RSB40')
INSERT [dbo].[mg_OrderWrite] ([ID], [Address], [WorkName]) VALUES (6, N'MagnaOrder.RSB.RSB60_Write', N'RSB60')
INSERT [dbo].[mg_OrderWrite] ([ID], [Address], [WorkName]) VALUES (7, N'MagnaOrder.RSC.RSC_Write', N'RSC')
INSERT [dbo].[mg_OrderWrite] ([ID], [Address], [WorkName]) VALUES (8, N'MagnaOrder.FS.FSL_Write', N'FSL')
INSERT [dbo].[mg_OrderWrite] ([ID], [Address], [WorkName]) VALUES (9, N'MagnaOrder.FS.FSR_Write', N'FSR')
SET IDENTITY_INSERT [dbo].[mg_OrderWrite] OFF
SET IDENTITY_INSERT [dbo].[mg_part] ON 

INSERT [dbo].[mg_part] ([part_id], [part_no], [part_name], [part_desc], [part_tpye]) VALUES (1, N'70108022', N'40%靠背-低配', N'Textile+PVC,40% Fixed H/R', N'RSB40')
INSERT [dbo].[mg_part] ([part_id], [part_no], [part_name], [part_desc], [part_tpye]) VALUES (2, N'70108024', N'40%靠背-次低配', N'Texile+PVC,40% Fixed H/R', N'RSB40')
INSERT [dbo].[mg_part] ([part_id], [part_no], [part_name], [part_desc], [part_tpye]) VALUES (3, N'70108034', N'60%靠背-低配', N'Texile+PVC,60% CTR A/R, Fixed H/R and movable CTR H/R', N'RSB60')
INSERT [dbo].[mg_part] ([part_id], [part_no], [part_name], [part_desc], [part_tpye]) VALUES (5, N'70107866', N'驾驶座-低配', N'PVC+Textile', N'FSL')
INSERT [dbo].[mg_part] ([part_id], [part_no], [part_name], [part_desc], [part_tpye]) VALUES (6, N'70107873', N'乘客座-低配', N'PVC+Textile', N'FSR')
INSERT [dbo].[mg_part] ([part_id], [part_no], [part_name], [part_desc], [part_tpye]) VALUES (7, N'70108030', N'后排坐垫-低配', N'Texile', N'RSC')
SET IDENTITY_INSERT [dbo].[mg_part] OFF
INSERT [dbo].[mg_Position] ([posi_id], [posi_name]) VALUES (1, N'系统管理员')
INSERT [dbo].[mg_Position] ([posi_id], [posi_name]) VALUES (2, N'市场专员')
INSERT [dbo].[mg_Position] ([posi_id], [posi_name]) VALUES (3, N'人事专员')
INSERT [dbo].[mg_Position] ([posi_id], [posi_name]) VALUES (4, N'生产跟单员')
INSERT [dbo].[mg_State] ([st_id], [st_name], [st_color]) VALUES (1, N'正常', N'绿')
INSERT [dbo].[mg_State] ([st_id], [st_name], [st_color]) VALUES (2, N'物料', N'黄')
INSERT [dbo].[mg_State] ([st_id], [st_name], [st_color]) VALUES (3, N'质量', N'紫')
INSERT [dbo].[mg_State] ([st_id], [st_name], [st_color]) VALUES (4, N'维修', N'红')
INSERT [dbo].[mg_station] ([st_id], [fl_id], [st_no], [st_pretime], [st_ispre], [st_name], [st_mac]) VALUES (1, 1, N'FS010-1', NULL, 0, N'前排座椅装配工位FS010-1', N'000C298461B5')
INSERT [dbo].[mg_station] ([st_id], [fl_id], [st_no], [st_pretime], [st_ispre], [st_name], [st_mac]) VALUES (2, 1, N'FS010-2', NULL, 1, N'前排座椅装配工位FS010-2', NULL)
INSERT [dbo].[mg_Station_State] ([st_id_TV], [st_id], [st_no], [st_state]) VALUES (1, 1, N'FS010-1', 4)
INSERT [dbo].[mg_step] ([step_id], [step_name], [st_id], [bom_id], [bom_count], [step_clock], [step_desc], [Step_pic]) VALUES (51, N'1', 2, 8, 1, 1, N'1', N'test2.jpg')
INSERT [dbo].[mg_step] ([step_id], [step_name], [st_id], [bom_id], [bom_count], [step_clock], [step_desc], [Step_pic]) VALUES (52, N'2', 3, 5, 2, 2, N'2', N'test1.jpg')
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
ALTER TABLE [dbo].[mg_Order_FS] ADD  CONSTRAINT [DF_mg_Order_FS_os_state]  DEFAULT ((0)) FOR [os_state]
GO
ALTER TABLE [dbo].[mg_Order_FSB] ADD  CONSTRAINT [DF_mg_Order_FSB_os_state]  DEFAULT ((0)) FOR [os_state]
GO
ALTER TABLE [dbo].[mg_Order_FSBL] ADD  CONSTRAINT [DF_mg_Order_FSBL_os_state]  DEFAULT ((0)) FOR [os_state]
GO
ALTER TABLE [dbo].[mg_Order_FSBR] ADD  CONSTRAINT [DF_mg_Order_FSBR_os_state]  DEFAULT ((0)) FOR [os_state]
GO
ALTER TABLE [dbo].[mg_Order_FSC] ADD  CONSTRAINT [DF_mg_Order_FSC_os_state]  DEFAULT ((0)) FOR [os_state]
GO
ALTER TABLE [dbo].[mg_Order_FSCL] ADD  CONSTRAINT [DF_mg_Order_FSCL_os_state]  DEFAULT ((0)) FOR [os_state]
GO
ALTER TABLE [dbo].[mg_Order_FSCR] ADD  CONSTRAINT [DF_mg_Order_FSCR_os_state]  DEFAULT ((0)) FOR [os_state]
GO
ALTER TABLE [dbo].[mg_Order_FSL] ADD  CONSTRAINT [DF_mg_Order_FSL_os_state]  DEFAULT ((0)) FOR [os_state]
GO
ALTER TABLE [dbo].[mg_Order_FSR] ADD  CONSTRAINT [DF_mg_Order_FSR_os_state]  DEFAULT ((0)) FOR [os_state]
GO
ALTER TABLE [dbo].[mg_Order_RSB] ADD  CONSTRAINT [DF_mg_Order_RSB_os_state]  DEFAULT ((0)) FOR [os_state]
GO
ALTER TABLE [dbo].[mg_Order_RSB40] ADD  CONSTRAINT [DF_mg_Order_RSB40_os_state]  DEFAULT ((0)) FOR [os_state]
GO
ALTER TABLE [dbo].[mg_Order_RSB60] ADD  CONSTRAINT [DF_mg_Order_RSB60_os_state]  DEFAULT ((0)) FOR [os_state]
GO
ALTER TABLE [dbo].[mg_Order_RSC] ADD  CONSTRAINT [DF_mg_Order_RSC_os_state]  DEFAULT ((0)) FOR [os_state]
GO
ALTER TABLE [dbo].[mg_Order_stationInfo] ADD  CONSTRAINT [DF_mg_Order_stationInfo_os_state]  DEFAULT ((0)) FOR [os_state]
GO
ALTER TABLE [dbo].[mg_Order_stationInfo1] ADD  CONSTRAINT [DF_mg_Order_stationInfo1_os_state]  DEFAULT ((0)) FOR [os_state]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0：未生成；1：已生成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mg_CustomerOrder', @level2type=N'COLUMN',@level2name=N'co_state'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0：未生产；1：生产中；2：完成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mg_Order', @level2type=N'COLUMN',@level2name=N'or_state'
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
