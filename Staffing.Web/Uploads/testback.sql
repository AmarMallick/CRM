USE [master]
GO
/****** Object:  Database [JobPortalDatabase]    Script Date: 04/29/2016 11:56:49 ******/
CREATE DATABASE [JobPortalDatabase] ON  PRIMARY 
( NAME = N'JobPortalDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\JobPortalDatabase.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'JobPortalDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\JobPortalDatabase_log.LDF' , SIZE = 504KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [JobPortalDatabase] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JobPortalDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JobPortalDatabase] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [JobPortalDatabase] SET ANSI_NULLS OFF
GO
ALTER DATABASE [JobPortalDatabase] SET ANSI_PADDING OFF
GO
ALTER DATABASE [JobPortalDatabase] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [JobPortalDatabase] SET ARITHABORT OFF
GO
ALTER DATABASE [JobPortalDatabase] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [JobPortalDatabase] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [JobPortalDatabase] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [JobPortalDatabase] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [JobPortalDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [JobPortalDatabase] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [JobPortalDatabase] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [JobPortalDatabase] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [JobPortalDatabase] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [JobPortalDatabase] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [JobPortalDatabase] SET  ENABLE_BROKER
GO
ALTER DATABASE [JobPortalDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [JobPortalDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [JobPortalDatabase] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [JobPortalDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [JobPortalDatabase] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [JobPortalDatabase] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [JobPortalDatabase] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [JobPortalDatabase] SET  READ_WRITE
GO
ALTER DATABASE [JobPortalDatabase] SET RECOVERY FULL
GO
ALTER DATABASE [JobPortalDatabase] SET  MULTI_USER
GO
ALTER DATABASE [JobPortalDatabase] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [JobPortalDatabase] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'JobPortalDatabase', N'ON'
GO
USE [JobPortalDatabase]
GO
/****** Object:  Table [dbo].[Company_Details]    Script Date: 04/29/2016 11:56:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company_Details](
	[Company_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Company_Name] [varchar](50) NOT NULL,
	[Company_Description] [varchar](50) NULL,
	[Company_Location] [varchar](50) NULL,
	[Contact_Person] [varchar](50) NULL,
	[Contact_Number] [bigint] NULL,
	[Company_Url] [varchar](50) NULL,
	[Created_By] [varchar](50) NULL,
	[Created_Date] [date] NULL,
	[Modified_By] [varchar](50) NULL,
	[Modified_Date] [date] NULL,
 CONSTRAINT [PK_Company_Details] PRIMARY KEY CLUSTERED 
(
	[Company_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 04/29/2016 11:56:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[DisplayName] [nchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job_Details]    Script Date: 04/29/2016 11:56:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Job_Details](
	[Job_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Company_Id] [bigint] NOT NULL,
	[Job_Position] [varchar](50) NULL,
	[Job_Experience] [varchar](50) NULL,
	[Job_Designation] [varchar](50) NULL,
	[Job_Description] [varchar](50) NULL,
	[Created_By] [varchar](50) NULL,
	[Created_Date] [date] NULL,
	[Modified_By] [varchar](50) NULL,
	[Modified_Date] [date] NULL,
	[Is_Approved] [int] NULL,
	[Eligibility] [varchar](50) NULL,
 CONSTRAINT [PK_Job_Details] PRIMARY KEY CLUSTERED 
(
	[Job_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Get_JobDetailsByJobId]    Script Date: 04/29/2016 11:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_Get_JobDetailsByJobId]																																				
@Job_Id bigint 
as 
begin
select JD.Job_Id,JD.Company_Id,JD.Job_Position,JD.Job_Experience,JD.Job_Designation,JD.Job_Description,JD.Created_By,JD.Created_Date,
JD.Modified_By,JD.Modified_Date,CD.Company_Name,CD.Company_Description,CD.Company_Location,CD.Contact_Person,CD.Contact_Number,
CD.Company_Url,CD.Created_By,CD.Created_Date,CD.Modified_By,CD.Modified_Date

 from Job_Details as JD join Company_Details as CD on JD.Company_Id=CD.Company_Id where JD.Job_Id=@Job_Id
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Get_AllJobDetails]    Script Date: 04/29/2016 11:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_Get_AllJobDetails]																																				
as 
begin
select JD.Job_Id,JD.Company_Id,JD.Job_Position,JD.Job_Experience,JD.Job_Designation,JD.Job_Description,JD.Created_By,JD.Created_Date,
JD.Modified_By,JD.Modified_Date,CD.Company_Name,CD.Company_Description,CD.Company_Location,CD.Contact_Person,CD.Contact_Number,
CD.Company_Url,CD.Created_By,CD.Created_Date,CD.Modified_By,CD.Modified_Date

 from Job_Details as JD join Company_Details as CD on JD.Company_Id=CD.Company_Id 
end
GO
/****** Object:  ForeignKey [FK_Job_Details_Company_Details]    Script Date: 04/29/2016 11:56:50 ******/
ALTER TABLE [dbo].[Job_Details]  WITH CHECK ADD  CONSTRAINT [FK_Job_Details_Company_Details] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Company_Details] ([Company_Id])
GO
ALTER TABLE [dbo].[Job_Details] CHECK CONSTRAINT [FK_Job_Details_Company_Details]
GO
