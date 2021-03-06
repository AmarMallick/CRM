USE [master]
GO
/****** Object:  Database [StaffingDB2.0]    Script Date: 11/08/2016 17:06:45 ******/
CREATE DATABASE [StaffingDB2.0] ON  PRIMARY 
( NAME = N'StaffingDB2.0', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\StaffingDB2.0.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StaffingDB2.0_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\StaffingDB2.0_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StaffingDB2.0] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StaffingDB2.0].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StaffingDB2.0] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [StaffingDB2.0] SET ANSI_NULLS OFF
GO
ALTER DATABASE [StaffingDB2.0] SET ANSI_PADDING OFF
GO
ALTER DATABASE [StaffingDB2.0] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [StaffingDB2.0] SET ARITHABORT OFF
GO
ALTER DATABASE [StaffingDB2.0] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [StaffingDB2.0] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [StaffingDB2.0] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [StaffingDB2.0] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [StaffingDB2.0] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [StaffingDB2.0] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [StaffingDB2.0] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [StaffingDB2.0] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [StaffingDB2.0] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [StaffingDB2.0] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [StaffingDB2.0] SET  DISABLE_BROKER
GO
ALTER DATABASE [StaffingDB2.0] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [StaffingDB2.0] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [StaffingDB2.0] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [StaffingDB2.0] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [StaffingDB2.0] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [StaffingDB2.0] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [StaffingDB2.0] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [StaffingDB2.0] SET  READ_WRITE
GO
ALTER DATABASE [StaffingDB2.0] SET RECOVERY FULL
GO
ALTER DATABASE [StaffingDB2.0] SET  MULTI_USER
GO
ALTER DATABASE [StaffingDB2.0] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [StaffingDB2.0] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'StaffingDB2.0', N'ON'
GO
USE [StaffingDB2.0]
GO
/****** Object:  Table [dbo].[PayCycle]    Script Date: 11/08/2016 17:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayCycle](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NULL,
	[PayDate] [datetime2](7) NOT NULL,
	[StatusId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PayCycle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectSettings]    Script Date: 11/08/2016 17:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectSettings](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CR_Grouped] [int] NOT NULL,
	[CR_Tolerance] [decimal](18, 2) NOT NULL,
	[VT_MaxDiffInInvoceTerms] [int] NOT NULL,
	[VT_MaxDiffInPayTerms] [int] NOT NULL,
	[VT_UnAcceptDiffInvoiceterms] [int] NOT NULL,
	[VT_UnAcceptDiffPayTerms] [int] NOT NULL,
	[VT_InvoiceTermsBtMaxNUnAccept] [decimal](18, 2) NOT NULL,
	[VT_PayTermsBtMaxNUnAccept] [decimal](18, 2) NOT NULL,
	[VT_Invoice_Tolerance] [decimal](18, 2) NOT NULL,
	[VT_Payterms_Tolerance] [decimal](18, 2) NOT NULL,
	[CPT_MaxInvoiceTerms] [int] NOT NULL,
	[CPT_MaxPayTerms] [int] NOT NULL,
	[CPT_UnAcceptPayTerms] [int] NOT NULL,
	[CPT_PayTermsAboveMaxNbelowUnAccept] [int] NOT NULL,
	[CPT_Invoice_Tolerance_C2C] [int] NOT NULL,
	[CPT_Payterms_Tolerance_C2C] [int] NOT NULL,
	[CPT_Invoice_Tolerance_EMP] [int] NOT NULL,
	[CPT_Payterms_Tolerance_EMP] [int] NOT NULL,
	[WM_C2CMargin] [money] NOT NULL,
	[WM_EmployeeTolerance] [decimal](18, 2) NOT NULL,
	[WM_Tolerance_Period] [int] NOT NULL,
	[WM_NoofHours] [int] NOT NULL,
	[WM_MinMargin] [int] NOT NULL,
	[WM_MaxMargin] [int] NOT NULL,
	[WM_Tolerance] [decimal](18, 2) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NULL,
 CONSTRAINT [PK__ProjectS__3214EC073118447E] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ProjectSettings] ON
INSERT [dbo].[ProjectSettings] ([Id], [CR_Grouped], [CR_Tolerance], [VT_MaxDiffInInvoceTerms], [VT_MaxDiffInPayTerms], [VT_UnAcceptDiffInvoiceterms], [VT_UnAcceptDiffPayTerms], [VT_InvoiceTermsBtMaxNUnAccept], [VT_PayTermsBtMaxNUnAccept], [VT_Invoice_Tolerance], [VT_Payterms_Tolerance], [CPT_MaxInvoiceTerms], [CPT_MaxPayTerms], [CPT_UnAcceptPayTerms], [CPT_PayTermsAboveMaxNbelowUnAccept], [CPT_Invoice_Tolerance_C2C], [CPT_Payterms_Tolerance_C2C], [CPT_Invoice_Tolerance_EMP], [CPT_Payterms_Tolerance_EMP], [WM_C2CMargin], [WM_EmployeeTolerance], [WM_Tolerance_Period], [WM_NoofHours], [WM_MinMargin], [WM_MaxMargin], [WM_Tolerance], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, 3, CAST(25.00 AS Decimal(18, 2)), 30, 30, 45, 45, CAST(25.00 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 45, 60, 60, 30, 3, 3, 3, 3, 0.0100, CAST(25.00 AS Decimal(18, 2)), 3, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), 1, NULL, CAST(0x0700354418AF77380B AS DateTime2), NULL, CAST(0x0700354418AF77380B AS DateTime2))
SET IDENTITY_INSERT [dbo].[ProjectSettings] OFF
/****** Object:  Table [dbo].[LOVItem]    Script Date: 11/08/2016 17:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOVItem](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](512) NULL,
	[SortOrder] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_LOV] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LOVItem] ON
INSERT [dbo].[LOVItem] ([Id], [ItemName], [Description], [SortOrder], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'Company', NULL, 0, 1, NULL, CAST(0x07D0D47D8377F83B0B AS DateTime2), NULL, CAST(0x07D0D47D8377F83B0B AS DateTime2))
INSERT [dbo].[LOVItem] ([Id], [ItemName], [Description], [SortOrder], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'Country', NULL, 0, 1, NULL, CAST(0x07A0C4311F7CFA3B0B AS DateTime2), NULL, CAST(0x07A0C4311F7CFA3B0B AS DateTime2))
INSERT [dbo].[LOVItem] ([Id], [ItemName], [Description], [SortOrder], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'State', NULL, 0, 1, NULL, CAST(0x07E085F9237CFA3B0B AS DateTime2), NULL, CAST(0x07E085F9237CFA3B0B AS DateTime2))
INSERT [dbo].[LOVItem] ([Id], [ItemName], [Description], [SortOrder], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'ContactType', NULL, 0, 1, NULL, CAST(0x0710F37DA691FF3B0B AS DateTime2), NULL, CAST(0x0710F37DA691FF3B0B AS DateTime2))
INSERT [dbo].[LOVItem] ([Id], [ItemName], [Description], [SortOrder], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, N'ConsultantType', NULL, 0, 1, NULL, CAST(0x0750BEBA9857083C0B AS DateTime2), NULL, CAST(0x0750BEBA9857083C0B AS DateTime2))
INSERT [dbo].[LOVItem] ([Id], [ItemName], [Description], [SortOrder], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (6, N'ConsultantClasification', NULL, 0, 1, NULL, CAST(0x0740BB246863083C0B AS DateTime2), NULL, CAST(0x0740BB246863083C0B AS DateTime2))
INSERT [dbo].[LOVItem] ([Id], [ItemName], [Description], [SortOrder], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (7, N'Employment Type', NULL, 0, 1, NULL, CAST(0x07C01FA3C264083C0B AS DateTime2), NULL, CAST(0x07C01FA3C264083C0B AS DateTime2))
INSERT [dbo].[LOVItem] ([Id], [ItemName], [Description], [SortOrder], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, N'Legal Status', NULL, 0, 1, NULL, CAST(0x07E08CB32668083C0B AS DateTime2), NULL, CAST(0x07E08CB32668083C0B AS DateTime2))
SET IDENTITY_INSERT [dbo].[LOVItem] OFF
/****** Object:  Table [dbo].[PaymentSettings]    Script Date: 11/08/2016 17:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentSettings](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PayrollStartDate] [datetime2](7) NOT NULL,
	[PayCycle] [int] NOT NULL,
	[NoOfDays] [int] NULL,
	[PayPendingWeeks] [int] NOT NULL,
	[TotalTimeSheetsPending] [int] NOT NULL,
	[MaxNegativeBalance] [money] NOT NULL,
	[HoldLastPayCheck] [bit] NULL,
	[MinimumFutureBalance] [money] NOT NULL,
	[WhomToTreatBalanceBordering] [money] NOT NULL,
	[Client_TotalNumberofMaxPenInvoices] [int] NOT NULL,
	[Client_MaxPendingAmount] [money] NOT NULL,
	[Client_MaxAgeofInvoice] [int] NOT NULL,
	[CashFlow] [int] NOT NULL,
	[IsCitizenWaitPayment] [bit] NULL,
	[IsCorpWaitPayment] [bit] NULL,
	[CitizenMaxUnpaidPayment] [money] NOT NULL,
	[CorpMinimumAging] [int] NOT NULL,
	[CorpMaxVendorAging] [int] NOT NULL,
	[CorpMaxUnpaidPayment] [money] NOT NULL,
	[CorpTypePrefence] [int] NOT NULL,
	[CitizenTypePrefence] [int] NULL,
	[IsActive] [int] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[Modifieddate] [datetime2](7) NULL,
 CONSTRAINT [PK__PaymentS__3214EC07278EDA44] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PaymentSettings] ON
INSERT [dbo].[PaymentSettings] ([Id], [PayrollStartDate], [PayCycle], [NoOfDays], [PayPendingWeeks], [TotalTimeSheetsPending], [MaxNegativeBalance], [HoldLastPayCheck], [MinimumFutureBalance], [WhomToTreatBalanceBordering], [Client_TotalNumberofMaxPenInvoices], [Client_MaxPendingAmount], [Client_MaxAgeofInvoice], [CashFlow], [IsCitizenWaitPayment], [IsCorpWaitPayment], [CitizenMaxUnpaidPayment], [CorpMinimumAging], [CorpMaxVendorAging], [CorpMaxUnpaidPayment], [CorpTypePrefence], [CitizenTypePrefence], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [Modifieddate]) VALUES (1, CAST(0x07000000000073300B AS DateTime2), 2, 14, 4, 1, 6000.0000, 1, 5000.0000, 5000.0000, 2, 20000.0000, 15, 70, 0, 0, 10000.0000, -10, 30, 9600.0000, 2, 1, 1, NULL, CAST(0x07B05D91B0B4EC380B AS DateTime2), NULL, CAST(0x07B05D91B0B4EC380B AS DateTime2))
SET IDENTITY_INSERT [dbo].[PaymentSettings] OFF
/****** Object:  Table [dbo].[Menu]    Script Date: 11/08/2016 17:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DisplayName] [nvarchar](50) NULL,
	[ParentId] [bigint] NULL,
	[LinkUrl] [nvarchar](128) NOT NULL,
	[ImageUrl] [nvarchar](128) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[DisplayOrder] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Menu] ON
INSERT [dbo].[Menu] ([Id], [Name], [DisplayName], [ParentId], [LinkUrl], [ImageUrl], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DisplayOrder]) VALUES (3, N'Dashboard', N'Dashboard', 1, N'Home/Index', N'Images/dashboard.png', 1, N'rakesh.n@anblicks.com', CAST(0x075044CD2F82043C0B AS DateTime2), N'rakesh.n@anblicks.com', CAST(0x075044CD2F82043C0B AS DateTime2), 0)
INSERT [dbo].[Menu] ([Id], [Name], [DisplayName], [ParentId], [LinkUrl], [ImageUrl], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DisplayOrder]) VALUES (6, N'Client Management', N'Manage Clients', 1, N'Client/Index', N'Images/client.png', 1, N'rakesh.n@anblicks.com', CAST(0x070000000000F93B0B AS DateTime2), N'rakesh.n@anblicks.com', CAST(0x07A02751DBA6F93B0B AS DateTime2), 3)
INSERT [dbo].[Menu] ([Id], [Name], [DisplayName], [ParentId], [LinkUrl], [ImageUrl], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DisplayOrder]) VALUES (7, N'Vendor Management', N'Manage Vendors', 1, N'Vendor/Index', N'Images/vendor.png', 1, N'rakesh.n@anblicks.com', CAST(0x070000000000F93B0B AS DateTime2), N'rakesh.n@anblicks.com', CAST(0x07B050C429A7F93B0B AS DateTime2), 4)
INSERT [dbo].[Menu] ([Id], [Name], [DisplayName], [ParentId], [LinkUrl], [ImageUrl], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DisplayOrder]) VALUES (8, N'Consultant Management', N'Manage Consultants', 1, N'Consultant/Index', N'Images/consultant.png', 1, N'rakesh.n@anblicks.com', CAST(0x070000000000F93B0B AS DateTime2), N'rakesh.n@anblicks.com', CAST(0x077097A217A7F93B0B AS DateTime2), 5)
INSERT [dbo].[Menu] ([Id], [Name], [DisplayName], [ParentId], [LinkUrl], [ImageUrl], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DisplayOrder]) VALUES (9, N'Admin', N'Admin', 1, N'Admin/Index', N'Images/admin1.png', 1, N'rakesh.n@anblicks.com', CAST(0x070000000000F93B0B AS DateTime2), N'rakesh.n@anblicks.com', CAST(0x0790316D9FA4F93B0B AS DateTime2), 2)
INSERT [dbo].[Menu] ([Id], [Name], [DisplayName], [ParentId], [LinkUrl], [ImageUrl], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DisplayOrder]) VALUES (10, N'LOVs Management', N'Manage Masters', 9, N'Admin/Masters', N'Images/Master.png', 1, N'rakesh.n@anblicks.com', CAST(0x070000000000FA3B0B AS DateTime2), N'rakesh.n@anblicks.com', CAST(0x07709B6A5D63FA3B0B AS DateTime2), 2)
INSERT [dbo].[Menu] ([Id], [Name], [DisplayName], [ParentId], [LinkUrl], [ImageUrl], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DisplayOrder]) VALUES (16, N'Menu Management', N'Manage Menus', 9, N'Menu/Index', N'Images/master.png', 1, N'rakesh.n@anblicks.com', CAST(0x0754881AB29D013C0B AS DateTime2), N'rakesh.n@anblicks.com', CAST(0x0754881AB29D013C0B AS DateTime2), 0)
INSERT [dbo].[Menu] ([Id], [Name], [DisplayName], [ParentId], [LinkUrl], [ImageUrl], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DisplayOrder]) VALUES (18, N'Payment Settings', N'Payment Settings', 9, N'Admin/PaymentSettings', N'Images/vendor.png', 1, N'rakesh.n@anblicks.com', CAST(0x07588255229E013C0B AS DateTime2), N'rakesh.n@anblicks.com', CAST(0x07588255229E013C0B AS DateTime2), 0)
INSERT [dbo].[Menu] ([Id], [Name], [DisplayName], [ParentId], [LinkUrl], [ImageUrl], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DisplayOrder]) VALUES (19, N'Project Management', N'Manage Projects', 1, N'Project/Index', N'Images/vendor.png', 1, N'rakesh.n@anblicks.com', CAST(0x07A98150F39F013C0B AS DateTime2), N'rakesh.n@anblicks.com', CAST(0x07A98150F39F013C0B AS DateTime2), 6)
INSERT [dbo].[Menu] ([Id], [Name], [DisplayName], [ParentId], [LinkUrl], [ImageUrl], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DisplayOrder]) VALUES (20, N'Project Settings', N'Project Settings', 9, N'Admin/ProjectSettings', N'Images/vendor.png', 1, N'rakesh.n@anblicks.com', CAST(0x0790F3EBCD7B043C0B AS DateTime2), N'rakesh.n@anblicks.com', CAST(0x0790F3EBCD7B043C0B AS DateTime2), 0)
INSERT [dbo].[Menu] ([Id], [Name], [DisplayName], [ParentId], [LinkUrl], [ImageUrl], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DisplayOrder]) VALUES (21, N'Reports', N'Reports', 1, N'Report/Index', N'Images/master.png', 1, N'rakesh.n@anblicks.com', CAST(0x07B0B40F4271043C0B AS DateTime2), N'rakesh.n@anblicks.com', CAST(0x07B0B40F4271043C0B AS DateTime2), 7)
SET IDENTITY_INSERT [dbo].[Menu] OFF
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/08/2016 17:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 11/08/2016 17:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AddressLine1] [nvarchar](256) NOT NULL,
	[AddressLine2] [nvarchar](256) NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[ZipCode] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON
INSERT [dbo].[Address] ([Id], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZipCode], [Fax], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'daasd', N'asddasds', N'Hyderabad', N'Mizoram', N'India', N'500081', NULL, 1, NULL, CAST(0x0710459C1878F83B0B AS DateTime2), NULL, CAST(0x0710459C1878F83B0B AS DateTime2))
INSERT [dbo].[Address] ([Id], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZipCode], [Fax], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'Hyderabad', NULL, N'Hyderabad', N'Odisha', N'India', N'500081', NULL, 1, NULL, CAST(0x0720B1B0E998FD3B0B AS DateTime2), NULL, CAST(0x0720B1B0E998FD3B0B AS DateTime2))
INSERT [dbo].[Address] ([Id], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZipCode], [Fax], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, N'wdewas', N'dasd', N'dsdsa', N'Manipur', N'India', NULL, NULL, 1, NULL, CAST(0x0780A806E581FE3B0B AS DateTime2), NULL, CAST(0x0780A806E581FE3B0B AS DateTime2))
INSERT [dbo].[Address] ([Id], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZipCode], [Fax], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (6, N'hyd', N'hyd', N'SR Nagar', N'Odisha', N'India', N'4646', NULL, 1, NULL, CAST(0x0730C9961659043C0B AS DateTime2), NULL, CAST(0x0730C9961659043C0B AS DateTime2))
INSERT [dbo].[Address] ([Id], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZipCode], [Fax], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (7, N'khjkljklj', N'kljlk', N'jklklj', N'Odisha', N'India', N'454', NULL, 1, NULL, CAST(0x076085907596043C0B AS DateTime2), NULL, CAST(0x076085907596043C0B AS DateTime2))
INSERT [dbo].[Address] ([Id], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZipCode], [Fax], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, N'564564', N'564', N'tyrytry', N'Jharkhand', N'India', NULL, NULL, 1, NULL, CAST(0x0780D5A77F96043C0B AS DateTime2), NULL, CAST(0x0780D5A77F96043C0B AS DateTime2))
INSERT [dbo].[Address] ([Id], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZipCode], [Fax], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (9, N'sadkljklj', N'jkljlkjlkj', N'hyderabad', N'Mizoram', N'India', N'25123123', NULL, 1, NULL, CAST(0x07B0F058AA4C073C0B AS DateTime2), NULL, CAST(0x07B0F058AA4C073C0B AS DateTime2))
SET IDENTITY_INSERT [dbo].[Address] OFF
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/08/2016 17:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201609060605259_InitialCreate', N'Staffing.Web.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FDB36147E1FB0FF20E8691B522B97B5E802BB45E6245BB0E6823AEDF656D012ED08952855A2D204C37ED91EF693F617762851375E74B115DB19060CB578F89DC3C38FE42179987FFFFE67FCF6C1F78C7B1CC56E4026E6C168DF3430B103C725CB8999D0C58BD7E6DB37DF7E333E73FC07E3632E77C4E4A0268927E61DA5E1B165C5F61DF6513CF25D3B0AE260414776E05BC809ACC3FDFD9FAC83030B0384095886317E9F10EAFA38FD013FA701B1714813E45D060EF662FE1D4A6629AA71857C1C87C8C6137346D16201D68D7EC7F351266E1A279E8BC09419F616A681080928A260E8F18718CF681490E52C840FC8BB7D0C31C82D901763DE80E352BC6B5BF60F595BACB2620E6527310DFC9E800747DC3996587D25179B85F3C07D67E066FAC85A9DBA70625E3838FDF43EF0C001A2C2E3A91731E1897959A83889C32B4C4779C55106791E01DCD720FA3CAA22EE199DEBED15643A1CEDB3FFF68C69E2D124C21382131A216FCFB849E69E6BFF861F6F83CF984C8E0EE68BA3D72F5F21E7E8D58FF8E865B5A5D05690AB7D804F375110E2086CC38BA2FDA661D5EB5962C5A25AA54EE615E01230CF342ED1C33B4C96F40E46CCE16BD338771FB0937FE1E4FA405C184650894609FCBC4A3C0FCD3D5C945B8D3AD9FF1BB41EBE7C3588D62B74EF2ED3AE17F4C3C089605CBDC75E5A1ADFB96136BC6AFDFD898B9D4781CF7ED7F995957E9A054964B3C6045A915B142D31AD5B37B64AF276A234831A9ED639EAEE539B592AD35B29CA1AB4CA48C8556C7A34E4F63EADDECE8C3B0943E8BC945ACC234D8453AC5623A1FA9E51152AC973D0953C041AF57F9E0BCF7CE47A034C861DB44020B270231F17ADFC3900EA21D2DBE61B14C7301738BFA2F8AEC174F8E700A6CFB09D444051E0911F3EB9B69BBB80E0ABC49F33E66F4ED7605D73FB353847360DA233C26AAD8DF72EB03F07093D23CE29A2F803B57340F6F3D6F5BB030C62CE896DE3383E073263671A409C9D035E107A74D81B8ECD50DB0E46A61E727D753422CCA59F72D13222514B485189464C15993499FA2E58BAA49BA9B9A8DED44CA2D5542ED6D75406D6CD522EA937341568B533931A2CD64B7B68F8602F85DDFD686FBDC55B371754DC38831912FF82098E601A736E10A53822650F749937B6112CA4DDC7943EF9DA946AFA88BC6468552B8D867412187E34A4B0BB3F1A5233E1F3BDEBB0A8A4C316281706F84EF2EADD55FB98132CDBF470A83573D3CA373307E886CB491C07B69B8E02C5E1173FBAA8DB0F319CD17E8E91B5463C0B818601D15DB6E4C117689B2992EA9A9C620F536C9CD8D9E1E014C53672643742839C1E86E52BAAC2B0F24CA46EDC0F924E603A8E5825C43641318C5497507958B8C47643E4B57A49A8D97109636D2F748825A738C484296CF54417E5EA23106640A147E894360F8DAD0AE39A89A8895A757DDE16C296FD2E9D4C6C84932DB1B386973C7E7B1262367B6C03E46C76491703B4C779DB2028DFAB742580B871D935820A3B260D417948B51182D63DB60582D65DF2EC089A6D51BBF6BFB05FDD357AD637CA9B5FD61BDDB5056ED6FCB163D4CC624FA843A1068E647A9ECE59217EA08ACD19D8C9F767310F75458A30F019A6F5239B32DE55C6A156338848A226C092682DA0FC2250029206540FE3F2B3BC46EB7814D103363F776B84E573BF005BE1808C5DBD10AD08EAAF4D457276DA7D142D2BD82091BCD366A182A320843879D51BDEC129BA7359D9315D62E13ED170A561BC331A1CD412B96A9C943766702FE5D46CF7922A20EB1392ADE525217CD278296FCCE05EE21C6D77922228E81116ACE5A2FA123ED060CB4F3A8AD5A6281B5B59A214FF30B6341955E34B14862E595632ACF8176396A5574D5FCCFAA71DF9198665C78AECA3C2DA42130D22B4C44229A8064BCFDD28A6A788A23962E73C53C797C4946BAB66FACF5556974FB913F375209766FFE637AB8AEBFBDA622B47231CE41C9AE8B390263D475710405DDD60296FC84391E2E87E1A78894FF41196BE76768157AD9F7D9111C69660BF144149EE92E2DCBAEF3BF58C3C2A86EAA5228259BDA7F4103A7FE7F167D5E3BA98548F921F51555174C7565BEB395D28D3AFB7C430B17F67B5223CCDC8E2B9295500FEA9274625BD4102AB947547AD67A05431EB25DD118534932AA450D4C3CA6A3249CDC86AC14A781A8FAA25BA6B90D347AAE872697764452249155A51BC02B6C266B1AC3BAA22D7A40AAC28EE8E5D269E88B3E80EAF5DDACDCBEA8B57B6C15D6FF5D2603CCD9438CCE257B9C7AF02553EF7C4E237F51218FFBE9374D2EEF256A75376B0B11E9D3418FAB9A776055E9F7A1AEFEDF598B57BEDDAF4DE74AFAFC7EB47DA27A586B4CB13450AEDC56E4FD8D58DF90EABFD318DB4E5CA444C23772310EA31A6D81F3181D1EC8B37F55CCC26F25CE012117781639AE57298B0237C2D3CC7D99DA731561C3B9E6287AA7B1F53EFB30DA465917B14D97728929324D6783E52824AE7CF17C4C10F13F3CFB4D6717A94C1FE957EDE332EE20FC4FD9240C16D9460E32F39E9739874FAE67DD68E3E7EE8EED58B3F3E6555F78CEB0846CCB1B12FF872951EAE3F89E8654D56750D6B567E28F17C0754ED0D8212551810AB3F3998BB7490E706B995DFF9E8E1FBBEA6299F14AC85A878363014DE202ED43D0B58054BFB24C0819F347D12D0AFB1EA2702AB98A67D1EE092FE60E2E380EED3505E738B4B8D6253B4892929F5736B72F55A9996DB5E9BA41CECB506BA9C67DD036E8D5CEA1598F1CCD290075B1D1559C683616F93DA4F9E5ABC2BD9C4659EC7769388379937DC7033F4BF4A17DE81043745C2CEF6938237CD35DD41EE8E6756F64BFDDD31B2F134AEED27F86E9A6CBA63DE1D275BAF34DE1DE3DAB6D6CF2D33ADF312BAF5A45C39BF487321A33A0B6E4BBACD0ECE61873F0F8004594499BD955467793565A8B6282C45F44AF5E965A26269E0487A258966B5FDDACA17FCC6C6729966B59AA4CC26DD7CFE6FD4CD659A756B521DB7912EAC4C3654A570B7CC634D7950CF293DB8D692966CF4B698B5F176FD3965030FE294DAE8D1DC113F9FE4DF415C32E4D0E991EC2B5FF7C2DA59F90B8BB07EC7EEB284607F6F9160BBB66A1632176411E48BB760512E229CD05C628A1C58524F22EA2E904DA1989D31A78FBDD3733B76D331C7CE05B94E6898506832F6E75EEDC08B05014DFAD38CE6BACDE3EB30FDBB25433401CC74D9D9FC35F939713DA7B0FB5C7126A48160D1053FD1657D49D9C9EEF2B140BA0A484720EEBE2228BAC57EE801587C4D66E81EAF621BD0EF1D5E22FBB13C01D481B47744DDEDE353172D23E4C71CA3AC0F3F81C38EFFF0E63FAB859FE368540000, N'6.1.3-40302')
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/08/2016 17:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers] 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3b6ff7cb-d48a-4c32-8728-817ffd00ae61', N'amarnath@anblicks.com', 0, N'ACbFVWI9IdwfeBUn47chiY2sKextTv0EBebGs5OluTGK8KKidthcBarm9Qpyxf+j6w==', N'16b9a00e-db25-46be-992c-fa3f2d951cd6', NULL, 0, 0, NULL, 1, 0, N'amarnath@anblicks.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'db938b17-f762-4d8f-a688-d1f03af883a6', N'rakesh.n@anblicks.com', 0, N'ANEvgPmPXqF3Mn4+c0gwsZS7iScIvUBaB36KGpclpHQaFNVnuhxHLtPtauA8SYDNUw==', N'c66c9560-8956-4b57-b9f5-0e500f169b04', NULL, 0, 0, NULL, 1, 0, N'rakesh.n@anblicks.com')
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/08/2016 17:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles] 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/08/2016 17:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/08/2016 17:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOVItemValue]    Script Date: 11/08/2016 17:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOVItemValue](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ItemValue] [nvarchar](128) NOT NULL,
	[ItemId] [bigint] NOT NULL,
	[ParentId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_LOVItemValue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LOVItemValue] ON
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'Client', 1, NULL, 1, NULL, CAST(0x07B029E7A877F83B0B AS DateTime2), NULL, CAST(0x07B029E7A877F83B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'Vendor', 1, NULL, 1, NULL, CAST(0x07905A10B077F83B0B AS DateTime2), NULL, CAST(0x07905A10B077F83B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'India', 2, NULL, 1, NULL, CAST(0x07408466497CFA3B0B AS DateTime2), NULL, CAST(0x07408466497CFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'USA', 2, NULL, 1, NULL, CAST(0x07902A03577CFA3B0B AS DateTime2), NULL, CAST(0x07902A03577CFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, N'Orissa', 3, 3, 1, NULL, CAST(0x07D0BC40D27DFA3B0B AS DateTime2), NULL, CAST(0x07D0BC40D27DFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (6, N'Andhra Pradesh', 3, 3, 1, NULL, CAST(0x071099A32F7EFA3B0B AS DateTime2), NULL, CAST(0x071099A32F7EFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (7, N'Arunachal Pradesh', 3, 3, 1, NULL, CAST(0x07500C6C367EFA3B0B AS DateTime2), NULL, CAST(0x07500C6C367EFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, N'Assam', 3, 3, 1, NULL, CAST(0x07C069DD3D7EFA3B0B AS DateTime2), NULL, CAST(0x07C069DD3D7EFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (9, N'Bihar', 3, 3, 1, NULL, CAST(0x07C0C503437EFA3B0B AS DateTime2), NULL, CAST(0x07C0C503437EFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (10, N'Chhattisgarh', 3, 3, 1, NULL, CAST(0x07B059C9587EFA3B0B AS DateTime2), NULL, CAST(0x07B059C9587EFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (11, N'Goa', 3, 3, 1, NULL, CAST(0x0750DEAC647EFA3B0B AS DateTime2), NULL, CAST(0x0750DEAC647EFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (12, N'Gujarat', 3, 3, 1, NULL, CAST(0x07B0AB85687EFA3B0B AS DateTime2), NULL, CAST(0x07B0AB85687EFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (13, N'Haryana', 3, 3, 1, NULL, CAST(0x07D0D4826D7EFA3B0B AS DateTime2), NULL, CAST(0x07D0D4826D7EFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (14, N'Himachal Pradesh', 3, 3, 1, NULL, CAST(0x07B03EED727EFA3B0B AS DateTime2), NULL, CAST(0x07B03EED727EFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (15, N'Jammu and Kashmir', 3, 3, 1, NULL, CAST(0x075000D6787EFA3B0B AS DateTime2), NULL, CAST(0x075000D6787EFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (16, N'Jharkhand', 3, 3, 1, NULL, CAST(0x078006097E7EFA3B0B AS DateTime2), NULL, CAST(0x078006097E7EFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (17, N'Karnataka', 3, 3, 1, NULL, CAST(0x0760F633837EFA3B0B AS DateTime2), NULL, CAST(0x0760F633837EFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (18, N'Kerala', 3, 3, 1, NULL, CAST(0x0750ECB0D97EFA3B0B AS DateTime2), NULL, CAST(0x0750ECB0D97EFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (19, N'Madhya Pradesh', 3, 3, 1, NULL, CAST(0x07F0D4B3E47EFA3B0B AS DateTime2), NULL, CAST(0x07F0D4B3E47EFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (20, N'Maharashtra', 3, 3, 1, NULL, CAST(0x07F0C01BF07EFA3B0B AS DateTime2), NULL, CAST(0x07F0C01BF07EFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (21, N'Manipur', 3, 3, 1, NULL, CAST(0x0750397CF87EFA3B0B AS DateTime2), NULL, CAST(0x0750397CF87EFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (22, N'Meghalaya', 3, 3, 1, NULL, CAST(0x0780F98AFE7EFA3B0B AS DateTime2), NULL, CAST(0x0780F98AFE7EFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (23, N'Mizoram', 3, 3, 1, NULL, CAST(0x07B0377F057FFA3B0B AS DateTime2), NULL, CAST(0x07B0377F057FFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (24, N'Nagaland', 3, 3, 1, NULL, CAST(0x07C02AB70B7FFA3B0B AS DateTime2), NULL, CAST(0x07C02AB70B7FFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (25, N'Odisha', 3, 3, 1, NULL, CAST(0x07D0961F187FFA3B0B AS DateTime2), NULL, CAST(0x07D0961F187FFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (26, N'Punjab', 3, 3, 1, NULL, CAST(0x07B047101E7FFA3B0B AS DateTime2), NULL, CAST(0x07B047101E7FFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (27, N'Rajasthan', 3, 3, 1, NULL, CAST(0x07308B83237FFA3B0B AS DateTime2), NULL, CAST(0x07308B83237FFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (28, N'Sikkim', 3, 3, 1, NULL, CAST(0x07B0DE1D297FFA3B0B AS DateTime2), NULL, CAST(0x07B0DE1D297FFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (29, N'Tamil Nadu', 3, 3, 1, NULL, CAST(0x07204CB6307FFA3B0B AS DateTime2), NULL, CAST(0x07204CB6307FFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (30, N'Telangana', 3, 3, 1, NULL, CAST(0x07704CF1367FFA3B0B AS DateTime2), NULL, CAST(0x07704CF1367FFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (31, N'Tripura', 3, 3, 1, NULL, CAST(0x0790C6A23B7FFA3B0B AS DateTime2), NULL, CAST(0x0790C6A23B7FFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (32, N'Uttar Pradesh', 3, 3, 1, NULL, CAST(0x07B0B1C7427FFA3B0B AS DateTime2), NULL, CAST(0x07B0B1C7427FFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (33, N'Uttarakhand', 3, 3, 1, NULL, CAST(0x0770E8E8487FFA3B0B AS DateTime2), NULL, CAST(0x0770E8E8487FFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (34, N'West Bengal', 3, 3, 1, NULL, CAST(0x077081674F7FFA3B0B AS DateTime2), NULL, CAST(0x077081674F7FFA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (35, N'Virginia', 3, 4, 1, NULL, CAST(0x075073B89480FA3B0B AS DateTime2), NULL, CAST(0x075073B89480FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (36, N'North Dakota', 3, 4, 1, NULL, CAST(0x0750BD99A580FA3B0B AS DateTime2), NULL, CAST(0x0750BD99A580FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (37, N'New Mexico', 3, 4, 1, NULL, CAST(0x0730E5F6AE80FA3B0B AS DateTime2), NULL, CAST(0x0730E5F6AE80FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (38, N'Illinois', 3, 4, 1, NULL, CAST(0x07705F76FC80FA3B0B AS DateTime2), NULL, CAST(0x07705F76FC80FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (39, N'Pennsylvania', 3, 4, 1, NULL, CAST(0x07705F76FC80FA3B0B AS DateTime2), NULL, CAST(0x07705F76FC80FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (40, N'Mississippi', 3, 4, 1, NULL, CAST(0x07705F76FC80FA3B0B AS DateTime2), NULL, CAST(0x07705F76FC80FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (41, N'California', 3, 4, 1, NULL, CAST(0x07705F76FC80FA3B0B AS DateTime2), NULL, CAST(0x07705F76FC80FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (42, N'Delaware', 3, 4, 1, NULL, CAST(0x07705F76FC80FA3B0B AS DateTime2), NULL, CAST(0x07705F76FC80FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (43, N'Wisconsin', 3, 4, 1, NULL, CAST(0x07B0FB76FC80FA3B0B AS DateTime2), NULL, CAST(0x07B0FB76FC80FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (44, N'Washington', 3, 4, 1, NULL, CAST(0x07B0FB76FC80FA3B0B AS DateTime2), NULL, CAST(0x07B0FB76FC80FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (45, N'Alabama', 3, 4, 1, NULL, CAST(0x07B0FB76FC80FA3B0B AS DateTime2), NULL, CAST(0x07B0FB76FC80FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (46, N'Georgia', 3, 4, 1, NULL, CAST(0x07B0FB76FC80FA3B0B AS DateTime2), NULL, CAST(0x07B0FB76FC80FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (47, N'Minnesota', 3, 4, 1, NULL, CAST(0x0740313A4681FA3B0B AS DateTime2), NULL, CAST(0x0740313A4681FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (48, N'Nevada', 3, 4, 1, NULL, CAST(0x0740313A4681FA3B0B AS DateTime2), NULL, CAST(0x0740313A4681FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (49, N'Florida', 3, 4, 1, NULL, CAST(0x0740313A4681FA3B0B AS DateTime2), NULL, CAST(0x0740313A4681FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (50, N'Alaska', 3, 4, 1, NULL, CAST(0x0740313A4681FA3B0B AS DateTime2), NULL, CAST(0x0740313A4681FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (51, N'Colorado', 3, 4, 1, NULL, CAST(0x0740313A4681FA3B0B AS DateTime2), NULL, CAST(0x0740313A4681FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (52, N'West Virginia', 3, 4, 1, NULL, CAST(0x0740313A4681FA3B0B AS DateTime2), NULL, CAST(0x0740313A4681FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (53, N'Arkansas', 3, 4, 1, NULL, CAST(0x0740313A4681FA3B0B AS DateTime2), NULL, CAST(0x0740313A4681FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (54, N'New Hampshire', 3, 4, 1, NULL, CAST(0x0770A63A4681FA3B0B AS DateTime2), NULL, CAST(0x0770A63A4681FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (55, N'Tennessee', 3, 4, 1, NULL, CAST(0x0770A63A4681FA3B0B AS DateTime2), NULL, CAST(0x0770A63A4681FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (56, N'Oklahoma', 3, 4, 1, NULL, CAST(0x07106D1D7A81FA3B0B AS DateTime2), NULL, CAST(0x07106D1D7A81FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (57, N'Iowa', 3, 4, 1, NULL, CAST(0x07106D1D7A81FA3B0B AS DateTime2), NULL, CAST(0x07106D1D7A81FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (58, N'Arizona', 3, 4, 1, NULL, CAST(0x0750091E7A81FA3B0B AS DateTime2), NULL, CAST(0x0750091E7A81FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (59, N'Michigan', 3, 4, 1, NULL, CAST(0x0750091E7A81FA3B0B AS DateTime2), NULL, CAST(0x0750091E7A81FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (60, N'Louisiana', 3, 4, 1, NULL, CAST(0x0750091E7A81FA3B0B AS DateTime2), NULL, CAST(0x0750091E7A81FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (61, N'Utah', 3, 4, 1, NULL, CAST(0x0750091E7A81FA3B0B AS DateTime2), NULL, CAST(0x0750091E7A81FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (62, N'Oregon', 3, 4, 1, NULL, CAST(0x0750091E7A81FA3B0B AS DateTime2), NULL, CAST(0x0750091E7A81FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (63, N'Kansas', 3, 4, 1, NULL, CAST(0x0750091E7A81FA3B0B AS DateTime2), NULL, CAST(0x0750091E7A81FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (64, N'Wyoming', 3, 4, 1, NULL, CAST(0x0750091E7A81FA3B0B AS DateTime2), NULL, CAST(0x0750091E7A81FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (65, N'Kentucky', 3, 4, 1, NULL, CAST(0x07F06B69C281FA3B0B AS DateTime2), NULL, CAST(0x07F06B69C281FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (66, N'Indiana', 3, 4, 1, NULL, CAST(0x07F06B69C281FA3B0B AS DateTime2), NULL, CAST(0x07F06B69C281FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (67, N'Idaho', 3, 4, 1, NULL, CAST(0x07F06B69C281FA3B0B AS DateTime2), NULL, CAST(0x07F06B69C281FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (68, N'North Carolina', 3, 4, 1, NULL, CAST(0x07F06B69C281FA3B0B AS DateTime2), NULL, CAST(0x07F06B69C281FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (69, N'Montana', 3, 4, 1, NULL, CAST(0x0720E169C281FA3B0B AS DateTime2), NULL, CAST(0x0720E169C281FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (70, N'South Dakota', 3, 4, 1, NULL, CAST(0x0720E169C281FA3B0B AS DateTime2), NULL, CAST(0x0720E169C281FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (71, N'New York', 3, 4, 1, NULL, CAST(0x0720E169C281FA3B0B AS DateTime2), NULL, CAST(0x0720E169C281FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (72, N'Massachusetts', 3, 4, 1, NULL, CAST(0x0720E169C281FA3B0B AS DateTime2), NULL, CAST(0x0720E169C281FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (73, N'Rhode Island', 3, 4, 1, NULL, CAST(0x0720E169C281FA3B0B AS DateTime2), NULL, CAST(0x0720E169C281FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (74, N'Maine', 3, 4, 1, NULL, CAST(0x07F0F3670482FA3B0B AS DateTime2), NULL, CAST(0x07F0F3670482FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (75, N'Nebraska', 3, 4, 1, NULL, CAST(0x07F0F3670482FA3B0B AS DateTime2), NULL, CAST(0x07F0F3670482FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (76, N'Hawaii', 3, 4, 1, NULL, CAST(0x072069680482FA3B0B AS DateTime2), NULL, CAST(0x072069680482FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (77, N'Ohio', 3, 4, 1, NULL, CAST(0x072069680482FA3B0B AS DateTime2), NULL, CAST(0x072069680482FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (78, N'Vermont', 3, 4, 1, NULL, CAST(0x072069680482FA3B0B AS DateTime2), NULL, CAST(0x072069680482FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (79, N'New Jersey', 3, 4, 1, NULL, CAST(0x072069680482FA3B0B AS DateTime2), NULL, CAST(0x072069680482FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (80, N'Missouri', 3, 4, 1, NULL, CAST(0x072069680482FA3B0B AS DateTime2), NULL, CAST(0x072069680482FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (81, N'South Carolina', 3, 4, 1, NULL, CAST(0x072069680482FA3B0B AS DateTime2), NULL, CAST(0x072069680482FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (82, N'Texas', 3, 4, 1, NULL, CAST(0x072069680482FA3B0B AS DateTime2), NULL, CAST(0x072069680482FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (83, N'Connecticut', 3, 4, 1, NULL, CAST(0x072058851182FA3B0B AS DateTime2), NULL, CAST(0x072058851182FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (84, N'Maryland', 3, 4, 1, NULL, CAST(0x072058851182FA3B0B AS DateTime2), NULL, CAST(0x072058851182FA3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (85, N'HR', 4, NULL, 1, NULL, CAST(0x075015B9E591FF3B0B AS DateTime2), NULL, CAST(0x075015B9E591FF3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (86, N'Legal', 4, NULL, 1, NULL, CAST(0x079017F0EE91FF3B0B AS DateTime2), NULL, CAST(0x079017F0EE91FF3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (87, N'Recruiter', 4, NULL, 1, NULL, CAST(0x07C08C25FB91FF3B0B AS DateTime2), NULL, CAST(0x07C08C25FB91FF3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (88, N'Sales', 4, NULL, 1, NULL, CAST(0x07106120FF91FF3B0B AS DateTime2), NULL, CAST(0x07106120FF91FF3B0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (89, N'FullTime', 5, NULL, 1, NULL, CAST(0x074029D7B257083C0B AS DateTime2), NULL, CAST(0x074029D7B257083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (90, N'1099', 5, NULL, 1, NULL, CAST(0x07B0D51ABC57083C0B AS DateTime2), NULL, CAST(0x07B0D51ABC57083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (91, N'Corp To Corp', 5, NULL, 1, NULL, CAST(0x07509738CE57083C0B AS DateTime2), NULL, CAST(0x07509738CE57083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (92, N'Business Analist', 6, NULL, 1, NULL, CAST(0x0720AA8C9063083C0B AS DateTime2), NULL, CAST(0x0720AA8C9063083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (93, N'Data Warehousing', 6, NULL, 1, NULL, CAST(0x07709B0BD563083C0B AS DateTime2), NULL, CAST(0x07709B0BD563083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (94, N'Dot Net', 6, NULL, 1, NULL, CAST(0x07F009CEDD63083C0B AS DateTime2), NULL, CAST(0x07F009CEDD63083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (95, N'Front End Developer', 6, NULL, 1, NULL, CAST(0x07109BE3E963083C0B AS DateTime2), NULL, CAST(0x07109BE3E963083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (96, N'Hadoop', 6, NULL, 1, NULL, CAST(0x07D06C83EF63083C0B AS DateTime2), NULL, CAST(0x07D06C83EF63083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (97, N'Java', 6, NULL, 1, NULL, CAST(0x07606A9AF563083C0B AS DateTime2), NULL, CAST(0x07606A9AF563083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (98, N'JD Edward', 6, NULL, 1, NULL, CAST(0x0760C722FC63083C0B AS DateTime2), NULL, CAST(0x0760C722FC63083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (99, N'MB', 6, NULL, 1, NULL, CAST(0x07E07D5C0464083C0B AS DateTime2), NULL, CAST(0x07E07D5C0464083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (100, N'Oracle Apps', 6, NULL, 1, NULL, CAST(0x075090300864083C0B AS DateTime2), NULL, CAST(0x075090300864083C0B AS DateTime2))
GO
print 'Processed 100 total records'
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (101, N'Oracle PlSql', 6, NULL, 1, NULL, CAST(0x07801F4A1164083C0B AS DateTime2), NULL, CAST(0x07801F4A1164083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (102, N'PeopleSoft', 6, NULL, 1, NULL, CAST(0x07F08C711664083C0B AS DateTime2), NULL, CAST(0x07F08C711664083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (103, N'ProjectManger', 6, NULL, 1, NULL, CAST(0x07D0F3792164083C0B AS DateTime2), NULL, CAST(0x07D0F3792164083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (104, N'QA', 6, NULL, 1, NULL, CAST(0x075028462364083C0B AS DateTime2), NULL, CAST(0x075028462364083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (105, N'SalesForce', 6, NULL, 1, NULL, CAST(0x07B024852D64083C0B AS DateTime2), NULL, CAST(0x07B024852D64083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (106, N'SAN', 6, NULL, 1, NULL, CAST(0x0730FE503564083C0B AS DateTime2), NULL, CAST(0x0730FE503564083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (107, N'SAP', 6, NULL, 1, NULL, CAST(0x0730CD5B3864083C0B AS DateTime2), NULL, CAST(0x0730CD5B3864083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (108, N'Solution Architect', 6, NULL, 1, NULL, CAST(0x07C059524364083C0B AS DateTime2), NULL, CAST(0x07C059524364083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (109, N'SQL', 6, NULL, 1, NULL, CAST(0x0760D4254B64083C0B AS DateTime2), NULL, CAST(0x0760D4254B64083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (110, N'System Administrator', 6, NULL, 1, NULL, CAST(0x07E0170A5364083C0B AS DateTime2), NULL, CAST(0x07E0170A5364083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (111, N'WAS Admin', 6, NULL, 1, NULL, CAST(0x07506F645E64083C0B AS DateTime2), NULL, CAST(0x07506F645E64083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (112, N'Web Developer', 6, NULL, 1, NULL, CAST(0x0710FB6E6264083C0B AS DateTime2), NULL, CAST(0x0710FB6E6264083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (113, N'WPS', 6, NULL, 1, NULL, CAST(0x0770B7A06964083C0B AS DateTime2), NULL, CAST(0x0770B7A06964083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (114, N'Hire', 7, NULL, 1, NULL, CAST(0x07000C0DD264083C0B AS DateTime2), NULL, CAST(0x07000C0DD264083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (115, N'Eligible To Pay', 7, NULL, 1, NULL, CAST(0x07D081A1D964083C0B AS DateTime2), NULL, CAST(0x07D081A1D964083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (116, N'Citizen', 8, NULL, 1, NULL, CAST(0x07B0EEAF3968083C0B AS DateTime2), NULL, CAST(0x07B0EEAF3968083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (117, N'EAD', 8, NULL, 1, NULL, CAST(0x0770374B4068083C0B AS DateTime2), NULL, CAST(0x0770374B4068083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (118, N'GC', 8, NULL, 1, NULL, CAST(0x07F0E3E54668083C0B AS DateTime2), NULL, CAST(0x07F0E3E54668083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (119, N'H1B', 8, NULL, 1, NULL, CAST(0x0700044F4E68083C0B AS DateTime2), NULL, CAST(0x0700044F4E68083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (120, N'OPT', 8, NULL, 1, NULL, CAST(0x07B01E005568083C0B AS DateTime2), NULL, CAST(0x07B01E005568083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (121, N'L2', 8, NULL, 1, NULL, CAST(0x07C01C395E68083C0B AS DateTime2), NULL, CAST(0x07C01C395E68083C0B AS DateTime2))
INSERT [dbo].[LOVItemValue] ([Id], [ItemValue], [ItemId], [ParentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (122, N'TN', 8, NULL, 1, NULL, CAST(0x07D0AE246268083C0B AS DateTime2), NULL, CAST(0x07D0AE246268083C0B AS DateTime2))
SET IDENTITY_INSERT [dbo].[LOVItemValue] OFF
/****** Object:  StoredProcedure [dbo].[spMenuUpdate]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- CREATED BY        : Rakesh Narayan	                       
-- CREATED DATE      : 12 October 2016                          
-- FUNCTIONALITY     : TO update data into dbo.Menu Table                    
-- MODIFIED BY       :                          
-- LAST MODIFIED DATE:                        
-- QC/CHECKED BY     :                          
-- MODIFIED BY       : 
-- =============================================
CREATE Procedure [dbo].[spMenuUpdate] (
	@Id bigint
	,@Name nvarchar(50)
    ,@DisplayName nvarchar(50)
    ,@ParentId bigint
    ,@LinkUrl nvarchar(128)
    ,@ImageUrl nvarchar(128)
    ,@IsActive bit
    ,@CreatedBy nvarchar(128)
    ,@CreatedDate datetime
    ,@ModifiedBy nvarchar(128)
    ,@ModifiedDate datetime
	,@DisplayOrder int
) As
Update [dbo].[Menu] Set
    [Name]=@Name
    ,[DisplayName]=@DisplayName
    ,[ParentId]=@ParentId
    ,[LinkUrl]=@LinkUrl
    ,[ImageUrl]=@ImageUrl
    ,[IsActive]=@IsActive
    ,[CreatedBy]=@CreatedBy
    ,[CreatedDate]=@CreatedDate
    ,[ModifiedBy]=@ModifiedBy
    ,[ModifiedDate]=@ModifiedDate
	,[DisplayOrder]=@DisplayOrder
Where [Id]=@Id
GO
/****** Object:  StoredProcedure [dbo].[spMenuInsert]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- CREATED BY        : Rakesh Narayan	                       
-- CREATED DATE      : 12 October 2016                          
-- FUNCTIONALITY     : TO insert data into dbo.Menu Table                    
-- MODIFIED BY       :                          
-- LAST MODIFIED DATE:                        
-- QC/CHECKED BY     :                          
-- MODIFIED BY       : 
-- =============================================
CREATE Procedure [dbo].[spMenuInsert] (
	@Id bigint output
	,@Name nvarchar(50)
    ,@DisplayName nvarchar(50)
    ,@ParentId bigint
    ,@LinkUrl nvarchar(128)
    ,@ImageUrl nvarchar(128)
    ,@IsActive bit
    ,@CreatedBy nvarchar(128)
    ,@CreatedDate datetime2
    ,@ModifiedBy nvarchar(128)
    ,@ModifiedDate datetime2
	,@DisplayOrder int
) As
INSERT INTO [dbo].[Menu]
           ([Name]
           ,[DisplayName]
           ,[ParentId]
           ,[LinkUrl]
           ,[ImageUrl]
           ,[IsActive]
           ,[CreatedBy]
           ,[CreatedDate]
           ,[ModifiedBy]
           ,[ModifiedDate]
		   ,[DisplayOrder])
     VALUES
           (
			@Name
           ,@DisplayName
           ,@ParentId
           ,@LinkUrl
           ,@ImageUrl
           ,@IsActive
           ,@CreatedBy
           ,@CreatedDate
           ,@ModifiedBy
           ,@ModifiedDate
		   ,@DisplayOrder
		   )
Set @Id=IDENT_CURRENT('Menu')
GO
/****** Object:  StoredProcedure [dbo].[spMenuDelete]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rakesh Narayan
-- Create date: 13 October 2016
-- Description:	To delete records from Menu Table
-- =============================================
CREATE PROCEDURE [dbo].[spMenuDelete]
	@Id bigint
AS
BEGIN
	DELETE FROM [DBO].[Menu] Where [Id]=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[spGetSideBarMenu]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spGetSideBarMenu](@rootUrl nvarchar(50)) As
declare @menuStr nvarchar(max)='<ul class="sidebar-menu">
        <li class="header">MAIN NAVIGATION</li>'
declare @cnt int=0;
declare @Id bigint, @Name nvarchar(128), @ParentId bigint, @DisplayName nvarchar(128), @LinkUrl nvarchar(128), @ImageUrl nvarchar(128)
declare @IdChild bigint, @NameChild nvarchar(128), @ParentIdChild bigint
Select @cnt=count(*) From [Menu] Where IsActive=1 and Coalesce(ParentId,0)>0
declare CurParent Cursor FOR 
	Select Id, Name, ParentId, DisplayName, LinkUrl, ImageUrl From [Menu] Where IsActive=1 and Coalesce(ParentId,0)>0 Order By ParentId,DisplayOrder
Open CurParent
Fetch CurParent Into @Id, @Name, @ParentId, @DisplayName, @LinkUrl, @ImageUrl
While @@FETCH_STATUS=0
Begin
	--Print CAST(@Id as NVARCHAR) + @Name + CAST(@cnt as NVARCHAR)
	Set @menuStr = @menuStr + '<li class="treeview"><a href="' + @rootUrl + @LinkUrl + '"><i class="fa fa-pie-chart"></i><span>'+ @DisplayName +'</span>'
	Set @cnt = @cnt - 1
	If @cnt=0 BREAK
	IF EXISTS(Select Id From [Menu] Where IsActive=1 and Coalesce(ParentId,0)=@Id)
	BEGIN
		Set @menuStr = @menuStr + '<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span></a>'
		Set @menuStr = @menuStr + '<ul class="treeview-menu">'
		declare CurChild Cursor FOR 
			Select Id, Name, ParentId, DisplayName, LinkUrl, ImageUrl From [Menu] Where IsActive=1 and Coalesce(ParentId,0)=@Id Order By DisplayOrder
		Open CurChild
		Fetch CurChild Into @IdChild, @NameChild, @ParentIdChild, @DisplayName, @LinkUrl, @ImageUrl
		While @@FETCH_STATUS=0
		Begin
			--Print '--------' + CAST(@Id as NVARCHAR) + @NameChild + CAST(@cnt as NVARCHAR)
			Set @menuStr = @menuStr + '<li><a href="'+ @rootUrl + @LinkUrl +'"><i class="fa fa-circle-o"></i> '+ @DisplayName +'</a></li>'
			Set @cnt = @cnt - 1
			If @cnt=0 BREAK
			Fetch CurChild Into @IdChild, @NameChild, @ParentIdChild, @DisplayName, @LinkUrl, @ImageUrl
		End
		Set @menuStr = @menuStr + '</ul>'
		Set @menuStr = @menuStr + '</li>'
		Close CurChild
		Deallocate CurChild
	END
	Fetch CurParent Into @Id, @Name, @ParentId, @DisplayName, @LinkUrl, @ImageUrl
End
Close CurParent
Deallocate CurParent
Set @menuStr=@menuStr+'</ul>'
Select @menuStr as MenuString
ENDBLK:
GO
/****** Object:  Table [dbo].[Requisition]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requisition](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RequisitionDate] [datetime2](7) NOT NULL,
	[RequisitionBy] [nvarchar](128) NULL,
	[Description] [nvarchar](512) NULL,
	[RequisitionType] [bigint] NULL,
	[TotalAmount] [money] NULL,
	[StatusId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Requisition] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PayDate] [datetime2](7) NOT NULL,
	[PayAmount] [money] NOT NULL,
	[PayMode] [bigint] NOT NULL,
	[PayDetails] [nvarchar](128) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuActivity]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuActivity](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MenuId] [bigint] NOT NULL,
	[MenuActivityId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_MenuActivity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](512) NULL,
	[Website] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[TaxId] [nvarchar](50) NULL,
	[ContactNo] [nvarchar](50) NOT NULL,
	[RelationTypeId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Company] ON
INSERT [dbo].[Company] ([Id], [Name], [Description], [Website], [Email], [TaxId], [ContactNo], [RelationTypeId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (7, N'Wipro', NULL, N'Venk@wipro.com', N'Venk@wipro.com', NULL, N'9776412290', 1, 1, NULL, CAST(0x0720B1B0E998FD3B0B AS DateTime2), NULL, CAST(0x0720B1B0E998FD3B0B AS DateTime2))
INSERT [dbo].[Company] ([Id], [Name], [Description], [Website], [Email], [TaxId], [ContactNo], [RelationTypeId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, N'dfgsdgd', NULL, N'fgdfg', N'fgfdg@f.vom', NULL, N'3424234234', 1, 1, NULL, CAST(0x0780A806E581FE3B0B AS DateTime2), NULL, CAST(0x0780A806E581FE3B0B AS DateTime2))
INSERT [dbo].[Company] ([Id], [Name], [Description], [Website], [Email], [TaxId], [ContactNo], [RelationTypeId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (11, N'tryrytrytrytr', NULL, N'hfghfghfg', N'dfsd@dsfd.ghjgh', NULL, N'5654654646', 1, 1, NULL, CAST(0x0780D5A77F96043C0B AS DateTime2), NULL, CAST(0x0780D5A77F96043C0B AS DateTime2))
INSERT [dbo].[Company] ([Id], [Name], [Description], [Website], [Email], [TaxId], [ContactNo], [RelationTypeId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (12, N'Vsoft', NULL, N'Www.vsofy.com', N'asdas@vsft.com', NULL, N'5645645645', 2, 1, NULL, CAST(0x07705458AA4C073C0B AS DateTime2), NULL, CAST(0x07705458AA4C073C0B AS DateTime2))
SET IDENTITY_INSERT [dbo].[Company] OFF
/****** Object:  Table [dbo].[Budget]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Budget](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CostCenterId] [bigint] NOT NULL,
	[DepartmentId] [bigint] NOT NULL,
	[AccountId] [bigint] NULL,
	[SubAccountId] [bigint] NULL,
	[FromDate] [datetime2](7) NOT NULL,
	[ToDate] [datetime2](7) NULL,
	[BudgetAmount] [money] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Budget] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[EmailId] [nvarchar](128) NOT NULL,
	[ContactNo] [nvarchar](50) NOT NULL,
	[LegalStatusId] [bigint] NOT NULL,
	[SSN] [nvarchar](50) NULL,
	[WorkPhone] [nvarchar](50) NULL,
	[HomePhone] [nvarchar](50) NULL,
	[VisaExpirationDate] [datetime2](7) NULL,
	[TotalExperience] [float] NOT NULL,
	[EmploymentTypeId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Document]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TypeId] [bigint] NULL,
	[OriginalName] [nvarchar](50) NOT NULL,
	[FullPath] [nvarchar](512) NOT NULL,
	[UploadedDate] [datetime2](7) NOT NULL,
	[IsSigned] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Document] ON
INSERT [dbo].[Document] ([Id], [TypeId], [OriginalName], [FullPath], [UploadedDate], [IsSigned], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (11, 1, N'amar.xls', N'D:\MVCStaffingNew\Staffing.Web\Staffing.Web\Uploads\amar.xls', CAST(0x0760F94A945D063C0B AS DateTime2), 1, 1, NULL, CAST(0x0760F94A945D063C0B AS DateTime2), NULL, CAST(0x0760F94A945D063C0B AS DateTime2))
INSERT [dbo].[Document] ([Id], [TypeId], [OriginalName], [FullPath], [UploadedDate], [IsSigned], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (12, 1, N'Blank.txt', N'D:\StaffingMVC\Staffing.Web\Staffing.Web\Uploads\Blank.txt', CAST(0x07C0E521D567063C0B AS DateTime2), 1, 1, NULL, CAST(0x07C0E521D567063C0B AS DateTime2), NULL, CAST(0x07C0E521D567063C0B AS DateTime2))
INSERT [dbo].[Document] ([Id], [TypeId], [OriginalName], [FullPath], [UploadedDate], [IsSigned], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (15, 2, N'favicon.ico', N'D:\MVCStaffingNew\Staffing.Web\Staffing.Web\Uploads\favicon.ico', CAST(0x0750E4EEBD55073C0B AS DateTime2), 1, 1, NULL, CAST(0x0750E4EEBD55073C0B AS DateTime2), NULL, CAST(0x0750E4EEBD55073C0B AS DateTime2))
SET IDENTITY_INSERT [dbo].[Document] OFF
/****** Object:  Table [dbo].[CompanyDocument]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyDocument](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CompanyId] [bigint] NOT NULL,
	[DocumentId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_CompanyDocument] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CompanyDocument] ON
INSERT [dbo].[CompanyDocument] ([Id], [CompanyId], [DocumentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, 7, 11, 1, NULL, CAST(0x0760F94A945D063C0B AS DateTime2), NULL, CAST(0x0760F94A945D063C0B AS DateTime2))
INSERT [dbo].[CompanyDocument] ([Id], [CompanyId], [DocumentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, 8, 12, 1, NULL, CAST(0x07C0E521D567063C0B AS DateTime2), NULL, CAST(0x07C0E521D567063C0B AS DateTime2))
INSERT [dbo].[CompanyDocument] ([Id], [CompanyId], [DocumentId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, 12, 15, 1, NULL, CAST(0x0750E4EEBD55073C0B AS DateTime2), NULL, CAST(0x0750E4EEBD55073C0B AS DateTime2))
SET IDENTITY_INSERT [dbo].[CompanyDocument] OFF
/****** Object:  Table [dbo].[CompanyContact]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyContact](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CompanyId] [bigint] NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](128) NOT NULL,
	[ContactNo] [nvarchar](50) NOT NULL,
	[TypeId] [bigint] NULL,
	[IsPrimary] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_CompanyContact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CompanyContact] ON
INSERT [dbo].[CompanyContact] ([Id], [CompanyId], [Name], [Email], [ContactNo], [TypeId], [IsPrimary], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (6, 11, N'sadasd', N'asd@.com', N'456465', 86, 1, 1, NULL, CAST(0x07B080921397043C0B AS DateTime2), NULL, CAST(0x07B080921397043C0B AS DateTime2))
INSERT [dbo].[CompanyContact] ([Id], [CompanyId], [Name], [Email], [ContactNo], [TypeId], [IsPrimary], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (11, 11, N'amar', N'amar@dsa.com', N'8125292502', 85, 1, 1, NULL, CAST(0x0790CAE4E773063C0B AS DateTime2), NULL, CAST(0x0790CAE4E773063C0B AS DateTime2))
INSERT [dbo].[CompanyContact] ([Id], [CompanyId], [Name], [Email], [ContactNo], [TypeId], [IsPrimary], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (12, 7, N'amar', N'amar@dsa.com', N'1234567890', 86, 0, 1, NULL, CAST(0x0750B9F1FE78063C0B AS DateTime2), NULL, CAST(0x0750B9F1FE78063C0B AS DateTime2))
INSERT [dbo].[CompanyContact] ([Id], [CompanyId], [Name], [Email], [ContactNo], [TypeId], [IsPrimary], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (13, 8, N'PSG Raju', N'psg@anblicks.com', N'7845965896', 85, 1, 1, NULL, CAST(0x0790E8C5E57B0E3C0B AS DateTime2), NULL, CAST(0x0790E8C5E57B0E3C0B AS DateTime2))
SET IDENTITY_INSERT [dbo].[CompanyContact] OFF
/****** Object:  Table [dbo].[CompanyAddress]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyAddress](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CompanyId] [bigint] NOT NULL,
	[AddressId] [bigint] NOT NULL,
	[IsPrimary] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_CompanyAddress_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CompanyAddress] ON
INSERT [dbo].[CompanyAddress] ([Id], [CompanyId], [AddressId], [IsPrimary], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (12, 7, 4, 0, 1, NULL, CAST(0x0720B1B0E998FD3B0B AS DateTime2), NULL, CAST(0x0720B1B0E998FD3B0B AS DateTime2))
INSERT [dbo].[CompanyAddress] ([Id], [CompanyId], [AddressId], [IsPrimary], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (13, 8, 5, 0, 1, NULL, CAST(0x0780A806E581FE3B0B AS DateTime2), NULL, CAST(0x0780A806E581FE3B0B AS DateTime2))
INSERT [dbo].[CompanyAddress] ([Id], [CompanyId], [AddressId], [IsPrimary], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (16, 11, 8, 0, 1, NULL, CAST(0x0780D5A77F96043C0B AS DateTime2), NULL, CAST(0x0780D5A77F96043C0B AS DateTime2))
INSERT [dbo].[CompanyAddress] ([Id], [CompanyId], [AddressId], [IsPrimary], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (17, 12, 9, 0, 1, NULL, CAST(0x07B0F058AA4C073C0B AS DateTime2), NULL, CAST(0x07B0F058AA4C073C0B AS DateTime2))
SET IDENTITY_INSERT [dbo].[CompanyAddress] OFF
/****** Object:  Table [dbo].[EmployeeFromVendor]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeFromVendor](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NULL,
	[VendorId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_EmployeeFromVendor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeFinanceDeal]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeFinanceDeal](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[FromHours] [int] NOT NULL,
	[ToHours] [int] NOT NULL,
	[TypeId] [bigint] NOT NULL,
	[DealValue] [money] NOT NULL,
	[IsPercent] [bit] NOT NULL,
	[AdditionalAmount] [money] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_EmployeeFinanceDeal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeFinanceBenefit]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeFinanceBenefit](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[TypeId] [bigint] NOT NULL,
	[MinHoursWorked] [int] NOT NULL,
	[BenefitAmount] [money] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_EmployeeFinanceBenefit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeDocumentDetail]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeDocumentDetail](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[DocumentId] [bigint] NULL,
	[StatusId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_EmployeeDocumentDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeBalancePay]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeBalancePay](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[TotalInvoiceRaised] [money] NULL,
	[TotalInvoiceReceived] [money] NULL,
	[TotalAmountPaid] [money] NULL,
	[Balance] [money] NULL,
	[FutureBalance] [money] NULL,
	[BalanceAfterPayRoll] [money] NULL,
	[ActualPay] [money] NULL,
	[PromiseToPay] [money] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_EmployeeBalancePay] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeAddress]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeAddress](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[AddressId] [bigint] NOT NULL,
	[IsPrimary] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_EmployeeAddress_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillPaymentDocument]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillPaymentDocument](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PaymentId] [bigint] NOT NULL,
	[DocumentId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_BillPaymentDocument] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoicePaymentDocument]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoicePaymentDocument](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PaymentId] [bigint] NOT NULL,
	[DocumentId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_InvoicePaymentDocument] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeSkills]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeSkills](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[SkillId] [bigint] NOT NULL,
	[IsPrimary] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_EmployeeSkills_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeSalary]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeSalary](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[BaseSalary] [money] NOT NULL,
	[HotSkillsSalary] [money] NOT NULL,
	[PerDiemPayment] [money] NOT NULL,
	[Deduction] [money] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_EmployeeSalary] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeQualificationDetail]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeQualificationDetail](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[QualificationId] [bigint] NOT NULL,
	[SpecializationId] [bigint] NULL,
	[CampusId] [bigint] NULL,
	[OtherCampus] [nvarchar](256) NULL,
	[PassingYear] [int] NOT NULL,
	[IsFullTime] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_EmployeeQualificationDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayRoll]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayRoll](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PayCycleId] [bigint] NULL,
	[EmployeeId] [bigint] NOT NULL,
	[Basic] [money] NOT NULL,
	[HotSkillsSalary] [money] NOT NULL,
	[PerDiemPayment] [money] NOT NULL,
	[Deduction] [money] NOT NULL,
	[VariablePay] [money] NOT NULL,
	[Federal] [money] NOT NULL,
	[State] [money] NOT NULL,
	[Other] [money] NOT NULL,
	[PaidAmount] [money] NULL,
	[StatusId] [bigint] NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[IsEdited] [bit] NOT NULL,
	[IsReconciled] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PayRoll] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuActivityPermission]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuActivityPermission](
	[MenuActivityId] [bigint] NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_MenuActivityPermission] PRIMARY KEY CLUSTERED 
(
	[MenuActivityId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequisitionDetails]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequisitionDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RequisitionId] [bigint] NULL,
	[ItemDescription] [nvarchar](128) NULL,
	[ItemTypeId] [bigint] NULL,
	[UnitPrice] [money] NULL,
	[Quantity] [float] NULL,
	[CostCenterId] [bigint] NULL,
	[DepartmentId] [bigint] NULL,
	[AccountId] [bigint] NULL,
	[SubAccountId] [bigint] NULL,
	[StatusId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_RequisitionDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequisitionApproval]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequisitionApproval](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RequisitionId] [bigint] NOT NULL,
	[ApproverId] [bigint] NOT NULL,
	[ReceivedDate] [datetime2](7) NOT NULL,
	[ApprovalDate] [datetime2](7) NULL,
	[StatusId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_RequisitionApproval] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spDeleteCompanyContactByContactId]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- CREATED BY :Amar	                       
-- CREATED DATE : 25 October 2016                          
-- FUNCTIONALITY :TO Delete CompanyContact By Contact ID                    
-- MODIFIED BY :                          
-- LAST MODIFIED DATE :                        
-- QC/CHECKED BY :                          
-- MODIFIED BY : 
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteCompanyContactByContactId]
	@ContactId int
AS
BEGIN

	

delete CompanyContact where CompanyContact.Id=@ContactId

END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteCompanyByCompanyId]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- CREATED BY :Amar	                       
-- CREATED DATE : 25 October 2016                          
-- FUNCTIONALITY :TO Delete Company Details By Company ID                    
-- MODIFIED BY :                          
-- LAST MODIFIED DATE :                        
-- QC/CHECKED BY :                          
-- MODIFIED BY : 
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteCompanyByCompanyId] 
	@CompanyId int
AS
BEGIN

	

delete CompanyContact where CompanyContact.CompanyId=@CompanyId
delete CompanyAddress where CompanyAddress.CompanyId=@CompanyId
delete Company where Company.Id=@CompanyId

END
GO
/****** Object:  StoredProcedure [dbo].[spCompanyDocumentSet]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- CREATED BY :Amar	                       
-- CREATED DATE : 14 October 2016                          
-- FUNCTIONALITY :TO insert and update companyDocument                    
-- MODIFIED BY :                          
-- LAST MODIFIED DATE :                        
-- QC/CHECKED BY :                          
-- MODIFIED BY : 
-- =============================================
CREATE PROCEDURE [dbo].[spCompanyDocumentSet]-- 0,1,"Deal2.png","D:\\MVCStaffingNew\\Staffing.Web\\Staffing.Web\\Uploads\\Deal2.png",1,1,8
@Id int,
@TypeId int,
@OriginalName varchar(50),
@FullPath varchar(512),
@IsSigned bit,
@IsActive bit,
@CompanyId int



AS
BEGIN

if Exists(Select [id] From CompanyDocument Where [CompanyId]=@CompanyId)
begin
	declare @DocumentId int
	select @DocumentId= DocumentId     from CompanyDocument where [CompanyId]=@CompanyId
	
	update Document set TypeId=TypeId,OriginalName=@OriginalName,FullPath=@FullPath,IsSigned=@IsSigned,IsActive=@IsActive  Where Id=@DocumentId
	
	
end
	else
	begin
	insert into Document(TypeId,OriginalName,FullPath,IsSigned,IsActive)
	values(@TypeId,@OriginalName,@FullPath,@IsSigned,@IsActive)
	
	set @DocumentId= SCOPE_IDENTITY();
	select @DocumentId,@CompanyId
	
	insert into CompanyDocument(CompanyId,DocumentId) values (@CompanyId,@DocumentId)
	
	end
	
END
GO
/****** Object:  StoredProcedure [dbo].[spCompanyDetailsSet]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- CREATED BY :Amar	                       
-- CREATED DATE : 14 October 2016                          
-- FUNCTIONALITY :TO Get Company Details By Company ID                    
-- MODIFIED BY :                          
-- LAST MODIFIED DATE :                        
-- QC/CHECKED BY :                          
-- MODIFIED BY : 
-- =============================================
CREATE PROCEDURE [dbo].[spCompanyDetailsSet]
    @Id int,
	@Name varchar(max),
	@WebSite varchar(max),
	@EmailId varchar(max),
	@WorkPhone varchar(max),
	@Fax varchar(max),
	@Address1 varchar(max),
	@Address2 varchar(max),
	@City varchar(max),
	@State varchar(max),
	@Country varchar(max),
	@ZipCode varchar(max),
	@RelatiTypeID int
	
	
AS
BEGIN
declare	@CompanyId int
declare @AddressId int
	IF @Id=0
	begin
	insert into Company(Name,[Website],[Email],[ContactNo],[RelationTypeId])
	 values(@Name,@WebSite,@EmailId,@WorkPhone,@RelatiTypeID)

	set @CompanyId=  SCOPE_IDENTITY();
	
	insert into Address(AddressLine1,AddressLine2,City,[State],Country,ZipCode,Fax) 
	values(@Address1,@Address2,@City,@State,@Country,@ZipCode,@Fax)
	set @AddressId=  SCOPE_IDENTITY();
	insert into CompanyAddress(CompanyId,AddressId)values (@CompanyId,@AddressId)
	end
	ELSE
	Begin
	update Company set Name=@Name,Website=@WebSite,Email=@EmailId,ContactNo=@WorkPhone where Company.Id=@Id
	 Select @AddressId = AddressId   from CompanyAddress where CompanyAddress.CompanyId=@Id
	 
	 update Address set AddressLine1=@Address1,AddressLine2=@Address2,City=@City,State=@State,Country=@Country, ZipCode=@ZipCode,Fax=@Fax where Address.Id=@AddressId
	 End
	 

END
GO
/****** Object:  StoredProcedure [dbo].[spCompanyContactSet]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- CREATED BY :Amar	                       
-- CREATED DATE : 20 October 2016                          
-- FUNCTIONALITY :TO Get CompanyContact Details By  ID                    
-- MODIFIED BY :                          
-- LAST MODIFIED DATE :                        
-- QC/CHECKED BY :                          
-- MODIFIED BY : 
-- =============================================
CREATE PROCEDURE [dbo].[spCompanyContactSet]-- 1,3,'Amar','asd.com',123456789,85,1
@Id int ,
@CompanyId int,
@Name nvarchar(128),
@Email nvarchar(128),
@ContactNo nvarchar(50),
@TypeId int,
@IsPrimary bit
AS
BEGIN

if(@Id<>0)
begin
	update CompanyContact set CompanyId=@CompanyId,Name=@Name,Email=@Email,ContactNo=@ContactNo,TypeId=@TypeId,IsPrimary=@IsPrimary where Id=@Id
	end
	
	else
	begin
	insert into CompanyContact(CompanyId,Name,Email,ContactNo,TypeId,IsPrimary)
	select @CompanyId,@Name,@Email,@ContactNo,@TypeId,@IsPrimary
	end
	
END
GO
/****** Object:  Table [dbo].[Project]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](256) NULL,
	[ClientId] [bigint] NULL,
	[EndClient] [nvarchar](50) NULL,
	[ContactPersonId] [bigint] NULL,
	[ConsultantId] [bigint] NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[DurationInMonths] [smallint] NOT NULL,
	[EndDate] [datetime2](7) NULL,
	[ClientRatePerHour] [money] NOT NULL,
	[VendorRatePerHour] [money] NULL,
	[AdministrativeChargePerHour] [money] NULL,
	[DurationInHours] [smallint] NULL,
	[IsProjectHoursRestricted] [bit] NOT NULL,
	[WeeklyDurationInHours] [tinyint] NULL,
	[IsProjectWeeklyHoursRestristed] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BillNumber] [nvarchar](20) NOT NULL,
	[BillTypeId] [bigint] NULL,
	[ProjectId] [bigint] NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[VendorId] [bigint] NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[BillReceivedDate] [datetime2](7) NULL,
	[WorkedHours] [float] NULL,
	[VendorRate] [money] NULL,
	[BillAmount] [money] NULL,
	[BillPaidDate] [datetime2](7) NULL,
	[StatusId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [datetime2](7) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [datetime2](7) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[InvoiceNumber] [nvarchar](20) NOT NULL,
	[ProjectId] [bigint] NULL,
	[EmployeeId] [bigint] NULL,
	[RaisedDate] [datetime2](7) NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[DueDate] [datetime2](7) NULL,
	[TotalWorkedHours] [float] NOT NULL,
	[TotalAmount] [money] NOT NULL,
	[StatusId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeProjectRate]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeProjectRate](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[ProjectId] [bigint] NOT NULL,
	[DealId] [bigint] NULL,
	[FromHours] [int] NOT NULL,
	[ToHours] [int] NOT NULL,
	[RatePerHour] [money] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_EmployeeProjectRate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectLocation]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectLocation](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProjectId] [bigint] NOT NULL,
	[AddressId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProjectLocation_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectDocument]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectDocument](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProjectId] [bigint] NOT NULL,
	[DocumentId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProjectDocument] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSheet]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSheet](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](50) NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[ProjectId] [bigint] NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[Notes] [nvarchar](512) NULL,
	[StatusId] [bigint] NULL,
	[UploadedDate] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_TimeSheet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSheetEntry]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSheetEntry](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TimeSheetId] [bigint] NOT NULL,
	[TimeSheetDate] [datetime2](7) NOT NULL,
	[WorkedHours] [float] NOT NULL,
	[ChangedHours] [float] NULL,
	[ClientRatePerHour] [money] NULL,
	[EmployeeRatePerHour] [money] NULL,
	[StatusId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_TimeSheetEntry] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSheetDocument]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSheetDocument](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TimeSheetId] [bigint] NOT NULL,
	[DocumentId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_TimeSheetDocument] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSheetAlert]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSheetAlert](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TimeSheetId] [bigint] NOT NULL,
	[EmailSentDate] [datetime2](7) NULL,
	[EmailTo] [nvarchar](128) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_TimeSheetAlert] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayRollTimeSheetDetail]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayRollTimeSheetDetail](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PayRollId] [bigint] NULL,
	[TimeSheetId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PayRollTimeSheetDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoicePayment]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoicePayment](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[InvoiceId] [bigint] NOT NULL,
	[PaymentId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_InvoicePayment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceFollowUpDetail]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceFollowUpDetail](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[InvoiceId] [bigint] NOT NULL,
	[FollowUpDate] [datetime2](7) NOT NULL,
	[FollowUpDescription] [nvarchar](512) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_InvoiceFollowUpDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillPayment]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillPayment](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BillId] [bigint] NOT NULL,
	[PaymentId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_BillPayment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillTimeSheetDetails]    Script Date: 11/08/2016 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillTimeSheetDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BillId] [bigint] NOT NULL,
	[TimeSheetId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_BillTimeSheetDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_PayCycle_IsActive]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[PayCycle] ADD  CONSTRAINT [DF_PayCycle_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_PayCycle_CreatedDate]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[PayCycle] ADD  CONSTRAINT [DF_PayCycle_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_PayCycle_ModifiedDate]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[PayCycle] ADD  CONSTRAINT [DF_PayCycle_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF__ProjectSe__IsAct__33008CF0]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[ProjectSettings] ADD  CONSTRAINT [DF__ProjectSe__IsAct__33008CF0]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF__ProjectSe__Creat__33F4B129]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[ProjectSettings] ADD  CONSTRAINT [DF__ProjectSe__Creat__33F4B129]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF__ProjectSe__Modif__34E8D562]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[ProjectSettings] ADD  CONSTRAINT [DF__ProjectSe__Modif__34E8D562]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_LOV_SortOrder]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[LOVItem] ADD  CONSTRAINT [DF_LOV_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
/****** Object:  Default [DF_LOV_IsActive]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[LOVItem] ADD  CONSTRAINT [DF_LOV_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_LOV_CreatedDate]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[LOVItem] ADD  CONSTRAINT [DF_LOV_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_LOV_ModifiedDate]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[LOVItem] ADD  CONSTRAINT [DF_LOV_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF__PaymentSe__HoldL__297722B6]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[PaymentSettings] ADD  CONSTRAINT [DF__PaymentSe__HoldL__297722B6]  DEFAULT ((1)) FOR [HoldLastPayCheck]
GO
/****** Object:  Default [DF__PaymentSe__IsCit__2A6B46EF]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[PaymentSettings] ADD  CONSTRAINT [DF__PaymentSe__IsCit__2A6B46EF]  DEFAULT ((0)) FOR [IsCitizenWaitPayment]
GO
/****** Object:  Default [DF__PaymentSe__IsCor__2B5F6B28]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[PaymentSettings] ADD  CONSTRAINT [DF__PaymentSe__IsCor__2B5F6B28]  DEFAULT ((0)) FOR [IsCorpWaitPayment]
GO
/****** Object:  Default [DF__PaymentSe__IsAct__2C538F61]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[PaymentSettings] ADD  CONSTRAINT [DF__PaymentSe__IsAct__2C538F61]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF__PaymentSe__Creat__2D47B39A]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[PaymentSettings] ADD  CONSTRAINT [DF__PaymentSe__Creat__2D47B39A]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF__PaymentSe__Modif__2E3BD7D3]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[PaymentSettings] ADD  CONSTRAINT [DF__PaymentSe__Modif__2E3BD7D3]  DEFAULT (getdate()) FOR [Modifieddate]
GO
/****** Object:  Default [DF_Menu_ParentId]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_ParentId]  DEFAULT ((0)) FOR [ParentId]
GO
/****** Object:  Default [DF_Menu_LinkUrl]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_LinkUrl]  DEFAULT (N'#') FOR [LinkUrl]
GO
/****** Object:  Default [DF_Menu_ImageUrl]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_ImageUrl]  DEFAULT (N'#') FOR [ImageUrl]
GO
/****** Object:  Default [DF_Menu_IsActive]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_Menu_CreatedDate]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_Menu_ModifiedDate]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF__Menu__DisplayOrd__2A363CC5]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF__Menu__DisplayOrd__2A363CC5]  DEFAULT ((0)) FOR [DisplayOrder]
GO
/****** Object:  Default [DF_Address_IsActive]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[Address] ADD  CONSTRAINT [DF_Address_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_Address_CreatedDate]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[Address] ADD  CONSTRAINT [DF_Address_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_Address_ModifiedDate]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[Address] ADD  CONSTRAINT [DF_Address_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_LOVItemValue_IsActive]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[LOVItemValue] ADD  CONSTRAINT [DF_LOVItemValue_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_LOVItemValue_CreatedDate]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[LOVItemValue] ADD  CONSTRAINT [DF_LOVItemValue_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_LOVItemValue_ModifiedDate]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[LOVItemValue] ADD  CONSTRAINT [DF_LOVItemValue_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_Requisition_RequisitionDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Requisition] ADD  CONSTRAINT [DF_Requisition_RequisitionDate]  DEFAULT (getdate()) FOR [RequisitionDate]
GO
/****** Object:  Default [DF_Requisition_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Requisition] ADD  CONSTRAINT [DF_Requisition_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_Requisition_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Requisition] ADD  CONSTRAINT [DF_Requisition_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_Requisition_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Requisition] ADD  CONSTRAINT [DF_Requisition_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_Payment_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Payment_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_Payment_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Payment_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_Payment_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Payment_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_MenuPermission_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[MenuActivity] ADD  CONSTRAINT [DF_MenuPermission_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_MenuPermission_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[MenuActivity] ADD  CONSTRAINT [DF_MenuPermission_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_MenuPermission_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[MenuActivity] ADD  CONSTRAINT [DF_MenuPermission_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_Company_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [DF_Company_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_Company_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [DF_Company_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_Company_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [DF_Company_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_Budget_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Budget] ADD  CONSTRAINT [DF_Budget_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_Budget_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Budget] ADD  CONSTRAINT [DF_Budget_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_Budget_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Budget] ADD  CONSTRAINT [DF_Budget_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_Employee_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_Employee_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_Employee_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_Document_UploadedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Document] ADD  CONSTRAINT [DF_Document_UploadedDate]  DEFAULT (getdate()) FOR [UploadedDate]
GO
/****** Object:  Default [DF_Document_IsMSASigned]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Document] ADD  CONSTRAINT [DF_Document_IsMSASigned]  DEFAULT ((0)) FOR [IsSigned]
GO
/****** Object:  Default [DF_Document_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Document] ADD  CONSTRAINT [DF_Document_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_Document_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Document] ADD  CONSTRAINT [DF_Document_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_Document_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Document] ADD  CONSTRAINT [DF_Document_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_CompanyDocument_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[CompanyDocument] ADD  CONSTRAINT [DF_CompanyDocument_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_CompanyDocument_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[CompanyDocument] ADD  CONSTRAINT [DF_CompanyDocument_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_CompanyDocument_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[CompanyDocument] ADD  CONSTRAINT [DF_CompanyDocument_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_CompanyContact_IsPrimary]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[CompanyContact] ADD  CONSTRAINT [DF_CompanyContact_IsPrimary]  DEFAULT ((0)) FOR [IsPrimary]
GO
/****** Object:  Default [DF_CompanyContact_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[CompanyContact] ADD  CONSTRAINT [DF_CompanyContact_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_CompanyContact_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[CompanyContact] ADD  CONSTRAINT [DF_CompanyContact_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_CompanyContact_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[CompanyContact] ADD  CONSTRAINT [DF_CompanyContact_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_CompanyAddress_IsPrimary]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[CompanyAddress] ADD  CONSTRAINT [DF_CompanyAddress_IsPrimary]  DEFAULT ((0)) FOR [IsPrimary]
GO
/****** Object:  Default [DF_CompanyAddress_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[CompanyAddress] ADD  CONSTRAINT [DF_CompanyAddress_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_CompanyAddress_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[CompanyAddress] ADD  CONSTRAINT [DF_CompanyAddress_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_CompanyAddress_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[CompanyAddress] ADD  CONSTRAINT [DF_CompanyAddress_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_EmployeeFromVendor_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeFromVendor] ADD  CONSTRAINT [DF_EmployeeFromVendor_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_EmployeeFromVendor_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeFromVendor] ADD  CONSTRAINT [DF_EmployeeFromVendor_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeeFromVendor_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeFromVendor] ADD  CONSTRAINT [DF_EmployeeFromVendor_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_EmployeeFinanceDeal_IsPercent]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeFinanceDeal] ADD  CONSTRAINT [DF_EmployeeFinanceDeal_IsPercent]  DEFAULT ((0)) FOR [IsPercent]
GO
/****** Object:  Default [DF_EmployeeFinanceDeal_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeFinanceDeal] ADD  CONSTRAINT [DF_EmployeeFinanceDeal_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_EmployeeFinanceDeal_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeFinanceDeal] ADD  CONSTRAINT [DF_EmployeeFinanceDeal_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeeFinanceDeal_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeFinanceDeal] ADD  CONSTRAINT [DF_EmployeeFinanceDeal_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_EmployeeFinanceBenefit_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeFinanceBenefit] ADD  CONSTRAINT [DF_EmployeeFinanceBenefit_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_EmployeeFinanceBenefit_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeFinanceBenefit] ADD  CONSTRAINT [DF_EmployeeFinanceBenefit_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeeFinanceBenefit_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeFinanceBenefit] ADD  CONSTRAINT [DF_EmployeeFinanceBenefit_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_EmployeeDocumentDetails_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeDocumentDetail] ADD  CONSTRAINT [DF_EmployeeDocumentDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_EmployeeDocumentDetails_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeDocumentDetail] ADD  CONSTRAINT [DF_EmployeeDocumentDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeeDocumentDetails_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeDocumentDetail] ADD  CONSTRAINT [DF_EmployeeDocumentDetails_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_EmployeeBalancePay_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeBalancePay] ADD  CONSTRAINT [DF_EmployeeBalancePay_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_EmployeeBalancePay_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeBalancePay] ADD  CONSTRAINT [DF_EmployeeBalancePay_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeeBalancePay_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeBalancePay] ADD  CONSTRAINT [DF_EmployeeBalancePay_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_EmployeeAddress_IsPrimary]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeAddress] ADD  CONSTRAINT [DF_EmployeeAddress_IsPrimary]  DEFAULT ((0)) FOR [IsPrimary]
GO
/****** Object:  Default [DF_EmployeeAddress_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeAddress] ADD  CONSTRAINT [DF_EmployeeAddress_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_EmployeeAddress_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeAddress] ADD  CONSTRAINT [DF_EmployeeAddress_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeeAddress_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeAddress] ADD  CONSTRAINT [DF_EmployeeAddress_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_BillPaymentDocument_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[BillPaymentDocument] ADD  CONSTRAINT [DF_BillPaymentDocument_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_BillPaymentDocument_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[BillPaymentDocument] ADD  CONSTRAINT [DF_BillPaymentDocument_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_BillPaymentDocument_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[BillPaymentDocument] ADD  CONSTRAINT [DF_BillPaymentDocument_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_InvoicePaymentDocument_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[InvoicePaymentDocument] ADD  CONSTRAINT [DF_InvoicePaymentDocument_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_InvoicePaymentDocument_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[InvoicePaymentDocument] ADD  CONSTRAINT [DF_InvoicePaymentDocument_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_InvoicePaymentDocument_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[InvoicePaymentDocument] ADD  CONSTRAINT [DF_InvoicePaymentDocument_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_EmployeeSkills_IsPrimary]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeSkills] ADD  CONSTRAINT [DF_EmployeeSkills_IsPrimary]  DEFAULT ((0)) FOR [IsPrimary]
GO
/****** Object:  Default [DF_EmployeeSkills_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeSkills] ADD  CONSTRAINT [DF_EmployeeSkills_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_EmployeeSkills_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeSkills] ADD  CONSTRAINT [DF_EmployeeSkills_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeeSkills_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeSkills] ADD  CONSTRAINT [DF_EmployeeSkills_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_EmployeeSalary_HotSkillsSalary]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeSalary] ADD  CONSTRAINT [DF_EmployeeSalary_HotSkillsSalary]  DEFAULT ((0)) FOR [HotSkillsSalary]
GO
/****** Object:  Default [DF_EmployeeSalary_PerDiemPayment]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeSalary] ADD  CONSTRAINT [DF_EmployeeSalary_PerDiemPayment]  DEFAULT ((0)) FOR [PerDiemPayment]
GO
/****** Object:  Default [DF_EmployeeSalary_Deduction]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeSalary] ADD  CONSTRAINT [DF_EmployeeSalary_Deduction]  DEFAULT ((0)) FOR [Deduction]
GO
/****** Object:  Default [DF_EmployeeSalary_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeSalary] ADD  CONSTRAINT [DF_EmployeeSalary_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_EmployeeSalary_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeSalary] ADD  CONSTRAINT [DF_EmployeeSalary_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeeSalary_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeSalary] ADD  CONSTRAINT [DF_EmployeeSalary_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_EmployeeQualificationDetails_IsFullTime]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeQualificationDetail] ADD  CONSTRAINT [DF_EmployeeQualificationDetails_IsFullTime]  DEFAULT ((1)) FOR [IsFullTime]
GO
/****** Object:  Default [DF_EmployeeQualificationDetails_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeQualificationDetail] ADD  CONSTRAINT [DF_EmployeeQualificationDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_EmployeeQualificationDetails_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeQualificationDetail] ADD  CONSTRAINT [DF_EmployeeQualificationDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeeQualificationDetails_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeQualificationDetail] ADD  CONSTRAINT [DF_EmployeeQualificationDetails_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_PayRoll_Basic]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[PayRoll] ADD  CONSTRAINT [DF_PayRoll_Basic]  DEFAULT ((0)) FOR [Basic]
GO
/****** Object:  Default [DF_PayRoll_HotSkillsSalary]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[PayRoll] ADD  CONSTRAINT [DF_PayRoll_HotSkillsSalary]  DEFAULT ((0)) FOR [HotSkillsSalary]
GO
/****** Object:  Default [DF_PayRoll_PerDiemPayment]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[PayRoll] ADD  CONSTRAINT [DF_PayRoll_PerDiemPayment]  DEFAULT ((0)) FOR [PerDiemPayment]
GO
/****** Object:  Default [DF_PayRoll_Deduction]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[PayRoll] ADD  CONSTRAINT [DF_PayRoll_Deduction]  DEFAULT ((0)) FOR [Deduction]
GO
/****** Object:  Default [DF_PayRoll_VariablePay]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[PayRoll] ADD  CONSTRAINT [DF_PayRoll_VariablePay]  DEFAULT ((0)) FOR [VariablePay]
GO
/****** Object:  Default [DF_PayRoll_Federal]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[PayRoll] ADD  CONSTRAINT [DF_PayRoll_Federal]  DEFAULT ((0)) FOR [Federal]
GO
/****** Object:  Default [DF_PayRoll_State]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[PayRoll] ADD  CONSTRAINT [DF_PayRoll_State]  DEFAULT ((0)) FOR [State]
GO
/****** Object:  Default [DF_PayRoll_Other]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[PayRoll] ADD  CONSTRAINT [DF_PayRoll_Other]  DEFAULT ((0)) FOR [Other]
GO
/****** Object:  Default [DF_PayRoll_PaidAmount]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[PayRoll] ADD  CONSTRAINT [DF_PayRoll_PaidAmount]  DEFAULT ((0)) FOR [PaidAmount]
GO
/****** Object:  Default [DF_PayRoll_IsApproved]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[PayRoll] ADD  CONSTRAINT [DF_PayRoll_IsApproved]  DEFAULT ((0)) FOR [IsApproved]
GO
/****** Object:  Default [DF_PayRoll_IsEdited]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[PayRoll] ADD  CONSTRAINT [DF_PayRoll_IsEdited]  DEFAULT ((0)) FOR [IsEdited]
GO
/****** Object:  Default [DF_PayRoll_IsReconciled]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[PayRoll] ADD  CONSTRAINT [DF_PayRoll_IsReconciled]  DEFAULT ((0)) FOR [IsReconciled]
GO
/****** Object:  Default [DF_PayRoll_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[PayRoll] ADD  CONSTRAINT [DF_PayRoll_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_PayRoll_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[PayRoll] ADD  CONSTRAINT [DF_PayRoll_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_PayRoll_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[PayRoll] ADD  CONSTRAINT [DF_PayRoll_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_MenuActivityPermission_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[MenuActivityPermission] ADD  CONSTRAINT [DF_MenuActivityPermission_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_MenuActivityPermission_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[MenuActivityPermission] ADD  CONSTRAINT [DF_MenuActivityPermission_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_MenuActivityPermission_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[MenuActivityPermission] ADD  CONSTRAINT [DF_MenuActivityPermission_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_RequisitionDetails_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[RequisitionDetails] ADD  CONSTRAINT [DF_RequisitionDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_RequisitionDetails_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[RequisitionDetails] ADD  CONSTRAINT [DF_RequisitionDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_RequisitionDetails_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[RequisitionDetails] ADD  CONSTRAINT [DF_RequisitionDetails_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_RequisitionApproval_ReceivedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[RequisitionApproval] ADD  CONSTRAINT [DF_RequisitionApproval_ReceivedDate]  DEFAULT (getdate()) FOR [ReceivedDate]
GO
/****** Object:  Default [DF_RequisitionApproval_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[RequisitionApproval] ADD  CONSTRAINT [DF_RequisitionApproval_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_RequisitionApproval_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[RequisitionApproval] ADD  CONSTRAINT [DF_RequisitionApproval_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_RequisitionApproval_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[RequisitionApproval] ADD  CONSTRAINT [DF_RequisitionApproval_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_Project_IsProjectHoursRestricted]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Project] ADD  CONSTRAINT [DF_Project_IsProjectHoursRestricted]  DEFAULT ((0)) FOR [IsProjectHoursRestricted]
GO
/****** Object:  Default [DF_Project_IsProjectWeeklyHoursRestristed]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Project] ADD  CONSTRAINT [DF_Project_IsProjectWeeklyHoursRestristed]  DEFAULT ((0)) FOR [IsProjectWeeklyHoursRestristed]
GO
/****** Object:  Default [DF_Project_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Project] ADD  CONSTRAINT [DF_Project_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_Project_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Project] ADD  CONSTRAINT [DF_Project_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_Project_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Project] ADD  CONSTRAINT [DF_Project_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_Bill_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF_Bill_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_Bill_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF_Bill_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_Bill_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF_Bill_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_Invoice_TotalWorkedHours]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Invoice] ADD  CONSTRAINT [DF_Invoice_TotalWorkedHours]  DEFAULT ((0)) FOR [TotalWorkedHours]
GO
/****** Object:  Default [DF_Invoice_TotalAmount]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Invoice] ADD  CONSTRAINT [DF_Invoice_TotalAmount]  DEFAULT ((0)) FOR [TotalAmount]
GO
/****** Object:  Default [DF_Invoice_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Invoice] ADD  CONSTRAINT [DF_Invoice_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_Invoice_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Invoice] ADD  CONSTRAINT [DF_Invoice_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_Invoice_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Invoice] ADD  CONSTRAINT [DF_Invoice_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_EmployeeProjectRate_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeProjectRate] ADD  CONSTRAINT [DF_EmployeeProjectRate_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeeProjectRate_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeProjectRate] ADD  CONSTRAINT [DF_EmployeeProjectRate_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_ProjectLocation_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[ProjectLocation] ADD  CONSTRAINT [DF_ProjectLocation_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_ProjectLocation_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[ProjectLocation] ADD  CONSTRAINT [DF_ProjectLocation_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_ProjectLocation_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[ProjectLocation] ADD  CONSTRAINT [DF_ProjectLocation_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_ProjectDocument_IsActive_1]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[ProjectDocument] ADD  CONSTRAINT [DF_ProjectDocument_IsActive_1]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_ProjectDocument_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[ProjectDocument] ADD  CONSTRAINT [DF_ProjectDocument_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_ProjectDocument_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[ProjectDocument] ADD  CONSTRAINT [DF_ProjectDocument_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_TimeSheet_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[TimeSheet] ADD  CONSTRAINT [DF_TimeSheet_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_TimeSheet_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[TimeSheet] ADD  CONSTRAINT [DF_TimeSheet_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_TimeSheet_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[TimeSheet] ADD  CONSTRAINT [DF_TimeSheet_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_TimeSheetEntry_WorkedHours]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[TimeSheetEntry] ADD  CONSTRAINT [DF_TimeSheetEntry_WorkedHours]  DEFAULT ((0)) FOR [WorkedHours]
GO
/****** Object:  Default [DF_TimeSheetEntry_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[TimeSheetEntry] ADD  CONSTRAINT [DF_TimeSheetEntry_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_TimeSheetEntry_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[TimeSheetEntry] ADD  CONSTRAINT [DF_TimeSheetEntry_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_TimeSheetEntry_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[TimeSheetEntry] ADD  CONSTRAINT [DF_TimeSheetEntry_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_TimeSheetDocument_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[TimeSheetDocument] ADD  CONSTRAINT [DF_TimeSheetDocument_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_TimeSheetDocument_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[TimeSheetDocument] ADD  CONSTRAINT [DF_TimeSheetDocument_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_TimeSheetDocument_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[TimeSheetDocument] ADD  CONSTRAINT [DF_TimeSheetDocument_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_TimeSheetAlert_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[TimeSheetAlert] ADD  CONSTRAINT [DF_TimeSheetAlert_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_TimeSheetAlert_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[TimeSheetAlert] ADD  CONSTRAINT [DF_TimeSheetAlert_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_TimeSheetAlert_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[TimeSheetAlert] ADD  CONSTRAINT [DF_TimeSheetAlert_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_PayRollTimeSheetDetail_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[PayRollTimeSheetDetail] ADD  CONSTRAINT [DF_PayRollTimeSheetDetail_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_PayRollTimeSheetDetail_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[PayRollTimeSheetDetail] ADD  CONSTRAINT [DF_PayRollTimeSheetDetail_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_PayRollTimeSheetDetail_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[PayRollTimeSheetDetail] ADD  CONSTRAINT [DF_PayRollTimeSheetDetail_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_InvoicePayment_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[InvoicePayment] ADD  CONSTRAINT [DF_InvoicePayment_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_InvoicePayment_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[InvoicePayment] ADD  CONSTRAINT [DF_InvoicePayment_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_InvoicePayment_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[InvoicePayment] ADD  CONSTRAINT [DF_InvoicePayment_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_InvoiceFollowUpDetail_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[InvoiceFollowUpDetail] ADD  CONSTRAINT [DF_InvoiceFollowUpDetail_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_InvoiceFollowUpDetail_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[InvoiceFollowUpDetail] ADD  CONSTRAINT [DF_InvoiceFollowUpDetail_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_InvoiceFollowUpDetail_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[InvoiceFollowUpDetail] ADD  CONSTRAINT [DF_InvoiceFollowUpDetail_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_BillPayment_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[BillPayment] ADD  CONSTRAINT [DF_BillPayment_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_BillPayment_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[BillPayment] ADD  CONSTRAINT [DF_BillPayment_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_BillPayment_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[BillPayment] ADD  CONSTRAINT [DF_BillPayment_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_BillTimeSheetDetails_IsActive]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[BillTimeSheetDetails] ADD  CONSTRAINT [DF_BillTimeSheetDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_BillTimeSheetDetails_CreatedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[BillTimeSheetDetails] ADD  CONSTRAINT [DF_BillTimeSheetDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_BillTimeSheetDetails_ModifiedDate]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[BillTimeSheetDetails] ADD  CONSTRAINT [DF_BillTimeSheetDetails_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_LOVItemValue_LOVItem]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[LOVItemValue]  WITH CHECK ADD  CONSTRAINT [FK_LOVItemValue_LOVItem] FOREIGN KEY([ItemId])
REFERENCES [dbo].[LOVItem] ([Id])
GO
ALTER TABLE [dbo].[LOVItemValue] CHECK CONSTRAINT [FK_LOVItemValue_LOVItem]
GO
/****** Object:  ForeignKey [FK_LOVItemValue_LOVItemValue]    Script Date: 11/08/2016 17:06:47 ******/
ALTER TABLE [dbo].[LOVItemValue]  WITH CHECK ADD  CONSTRAINT [FK_LOVItemValue_LOVItemValue] FOREIGN KEY([ParentId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[LOVItemValue] CHECK CONSTRAINT [FK_LOVItemValue_LOVItemValue]
GO
/****** Object:  ForeignKey [FK_Requisition_LOVItemValue]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Requisition]  WITH CHECK ADD  CONSTRAINT [FK_Requisition_LOVItemValue] FOREIGN KEY([RequisitionType])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[Requisition] CHECK CONSTRAINT [FK_Requisition_LOVItemValue]
GO
/****** Object:  ForeignKey [FK_Requisition_LOVItemValue1]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Requisition]  WITH CHECK ADD  CONSTRAINT [FK_Requisition_LOVItemValue1] FOREIGN KEY([StatusId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[Requisition] CHECK CONSTRAINT [FK_Requisition_LOVItemValue1]
GO
/****** Object:  ForeignKey [FK_Payment_LOVItemValue]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_LOVItemValue] FOREIGN KEY([PayMode])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_LOVItemValue]
GO
/****** Object:  ForeignKey [FK_MenuActivity_LOVItemValue]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[MenuActivity]  WITH CHECK ADD  CONSTRAINT [FK_MenuActivity_LOVItemValue] FOREIGN KEY([MenuActivityId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[MenuActivity] CHECK CONSTRAINT [FK_MenuActivity_LOVItemValue]
GO
/****** Object:  ForeignKey [FK_MenuActivity_Menu]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[MenuActivity]  WITH CHECK ADD  CONSTRAINT [FK_MenuActivity_Menu] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Menu] ([Id])
GO
ALTER TABLE [dbo].[MenuActivity] CHECK CONSTRAINT [FK_MenuActivity_Menu]
GO
/****** Object:  ForeignKey [FK_Company_LOVItemValue]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_LOVItemValue] FOREIGN KEY([RelationTypeId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_LOVItemValue]
GO
/****** Object:  ForeignKey [FK_LOV_Company]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_LOV_Company] FOREIGN KEY([RelationTypeId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_LOV_Company]
GO
/****** Object:  ForeignKey [FK_Budget_LOVItemValue]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Budget]  WITH CHECK ADD  CONSTRAINT [FK_Budget_LOVItemValue] FOREIGN KEY([CostCenterId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[Budget] CHECK CONSTRAINT [FK_Budget_LOVItemValue]
GO
/****** Object:  ForeignKey [FK_Budget_LOVItemValue1]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Budget]  WITH CHECK ADD  CONSTRAINT [FK_Budget_LOVItemValue1] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[Budget] CHECK CONSTRAINT [FK_Budget_LOVItemValue1]
GO
/****** Object:  ForeignKey [FK_Budget_LOVItemValue2]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Budget]  WITH CHECK ADD  CONSTRAINT [FK_Budget_LOVItemValue2] FOREIGN KEY([AccountId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[Budget] CHECK CONSTRAINT [FK_Budget_LOVItemValue2]
GO
/****** Object:  ForeignKey [FK_Budget_LOVItemValue3]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Budget]  WITH CHECK ADD  CONSTRAINT [FK_Budget_LOVItemValue3] FOREIGN KEY([SubAccountId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[Budget] CHECK CONSTRAINT [FK_Budget_LOVItemValue3]
GO
/****** Object:  ForeignKey [FK_Employee_LOVItemValue]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_LOVItemValue] FOREIGN KEY([EmploymentTypeId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_LOVItemValue]
GO
/****** Object:  ForeignKey [FK_Employee_LOVItemValue1]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_LOVItemValue1] FOREIGN KEY([LegalStatusId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_LOVItemValue1]
GO
/****** Object:  ForeignKey [FK_Document_LOVItemValue]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_LOVItemValue] FOREIGN KEY([TypeId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_LOVItemValue]
GO
/****** Object:  ForeignKey [FK_CompanyDocument_Company]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[CompanyDocument]  WITH CHECK ADD  CONSTRAINT [FK_CompanyDocument_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[CompanyDocument] CHECK CONSTRAINT [FK_CompanyDocument_Company]
GO
/****** Object:  ForeignKey [FK_CompanyDocument_Document]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[CompanyDocument]  WITH CHECK ADD  CONSTRAINT [FK_CompanyDocument_Document] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Document] ([Id])
GO
ALTER TABLE [dbo].[CompanyDocument] CHECK CONSTRAINT [FK_CompanyDocument_Document]
GO
/****** Object:  ForeignKey [FK_CompanyContact_Company]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[CompanyContact]  WITH CHECK ADD  CONSTRAINT [FK_CompanyContact_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[CompanyContact] CHECK CONSTRAINT [FK_CompanyContact_Company]
GO
/****** Object:  ForeignKey [FK_CompanyContact_LOVItemValue]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[CompanyContact]  WITH CHECK ADD  CONSTRAINT [FK_CompanyContact_LOVItemValue] FOREIGN KEY([TypeId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[CompanyContact] CHECK CONSTRAINT [FK_CompanyContact_LOVItemValue]
GO
/****** Object:  ForeignKey [FK_CompanyAddress_Address]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[CompanyAddress]  WITH CHECK ADD  CONSTRAINT [FK_CompanyAddress_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[CompanyAddress] CHECK CONSTRAINT [FK_CompanyAddress_Address]
GO
/****** Object:  ForeignKey [FK_CompanyAddress_Company]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[CompanyAddress]  WITH CHECK ADD  CONSTRAINT [FK_CompanyAddress_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[CompanyAddress] CHECK CONSTRAINT [FK_CompanyAddress_Company]
GO
/****** Object:  ForeignKey [FK_EmployeeFromVendor_Company]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeFromVendor]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeFromVendor_Company] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[EmployeeFromVendor] CHECK CONSTRAINT [FK_EmployeeFromVendor_Company]
GO
/****** Object:  ForeignKey [FK_EmployeeFromVendor_EmployeeFromVendor]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeFromVendor]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeFromVendor_EmployeeFromVendor] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[EmployeeFromVendor] CHECK CONSTRAINT [FK_EmployeeFromVendor_EmployeeFromVendor]
GO
/****** Object:  ForeignKey [FK_EmployeeFinanceDeal_Employee]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeFinanceDeal]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeFinanceDeal_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[EmployeeFinanceDeal] CHECK CONSTRAINT [FK_EmployeeFinanceDeal_Employee]
GO
/****** Object:  ForeignKey [FK_EmployeeFinanceDeal_LOVItemValue]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeFinanceDeal]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeFinanceDeal_LOVItemValue] FOREIGN KEY([TypeId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[EmployeeFinanceDeal] CHECK CONSTRAINT [FK_EmployeeFinanceDeal_LOVItemValue]
GO
/****** Object:  ForeignKey [FK_EmployeeFinanceBenefit_Employee]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeFinanceBenefit]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeFinanceBenefit_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[EmployeeFinanceBenefit] CHECK CONSTRAINT [FK_EmployeeFinanceBenefit_Employee]
GO
/****** Object:  ForeignKey [FK_EmployeeFinanceBenefit_LOVItemValue]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeFinanceBenefit]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeFinanceBenefit_LOVItemValue] FOREIGN KEY([TypeId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[EmployeeFinanceBenefit] CHECK CONSTRAINT [FK_EmployeeFinanceBenefit_LOVItemValue]
GO
/****** Object:  ForeignKey [FK_EmployeeDocumentDetail_Document]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeDocumentDetail]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDocumentDetail_Document] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Document] ([Id])
GO
ALTER TABLE [dbo].[EmployeeDocumentDetail] CHECK CONSTRAINT [FK_EmployeeDocumentDetail_Document]
GO
/****** Object:  ForeignKey [FK_EmployeeDocumentDetail_Employee]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeDocumentDetail]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDocumentDetail_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[EmployeeDocumentDetail] CHECK CONSTRAINT [FK_EmployeeDocumentDetail_Employee]
GO
/****** Object:  ForeignKey [FK_EmployeeDocumentDetail_LOVItemValue1]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeDocumentDetail]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDocumentDetail_LOVItemValue1] FOREIGN KEY([StatusId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[EmployeeDocumentDetail] CHECK CONSTRAINT [FK_EmployeeDocumentDetail_LOVItemValue1]
GO
/****** Object:  ForeignKey [FK_EmployeeBalancePay_Employee]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeBalancePay]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeBalancePay_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[EmployeeBalancePay] CHECK CONSTRAINT [FK_EmployeeBalancePay_Employee]
GO
/****** Object:  ForeignKey [FK_EmployeeAddress_Address]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeAddress]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeAddress_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[EmployeeAddress] CHECK CONSTRAINT [FK_EmployeeAddress_Address]
GO
/****** Object:  ForeignKey [FK_EmployeeAddress_Employee]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeAddress]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeAddress_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[EmployeeAddress] CHECK CONSTRAINT [FK_EmployeeAddress_Employee]
GO
/****** Object:  ForeignKey [FK_BillPaymentDocument_Document]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[BillPaymentDocument]  WITH CHECK ADD  CONSTRAINT [FK_BillPaymentDocument_Document] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Document] ([Id])
GO
ALTER TABLE [dbo].[BillPaymentDocument] CHECK CONSTRAINT [FK_BillPaymentDocument_Document]
GO
/****** Object:  ForeignKey [FK_BillPaymentDocument_Payment]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[BillPaymentDocument]  WITH CHECK ADD  CONSTRAINT [FK_BillPaymentDocument_Payment] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Payment] ([Id])
GO
ALTER TABLE [dbo].[BillPaymentDocument] CHECK CONSTRAINT [FK_BillPaymentDocument_Payment]
GO
/****** Object:  ForeignKey [FK_InvoicePaymentDocument_Document]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[InvoicePaymentDocument]  WITH CHECK ADD  CONSTRAINT [FK_InvoicePaymentDocument_Document] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Document] ([Id])
GO
ALTER TABLE [dbo].[InvoicePaymentDocument] CHECK CONSTRAINT [FK_InvoicePaymentDocument_Document]
GO
/****** Object:  ForeignKey [FK_InvoicePaymentDocument_Payment]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[InvoicePaymentDocument]  WITH CHECK ADD  CONSTRAINT [FK_InvoicePaymentDocument_Payment] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Payment] ([Id])
GO
ALTER TABLE [dbo].[InvoicePaymentDocument] CHECK CONSTRAINT [FK_InvoicePaymentDocument_Payment]
GO
/****** Object:  ForeignKey [FK_EmployeeSkills_Employee]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeSkills]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSkills_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[EmployeeSkills] CHECK CONSTRAINT [FK_EmployeeSkills_Employee]
GO
/****** Object:  ForeignKey [FK_EmployeeSkills_LOVItemValue]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeSkills]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSkills_LOVItemValue] FOREIGN KEY([SkillId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[EmployeeSkills] CHECK CONSTRAINT [FK_EmployeeSkills_LOVItemValue]
GO
/****** Object:  ForeignKey [FK_EmployeeSalary_Employee]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeSalary]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSalary_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[EmployeeSalary] CHECK CONSTRAINT [FK_EmployeeSalary_Employee]
GO
/****** Object:  ForeignKey [FK_EmployeeQualificationDetail_Employee]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeQualificationDetail]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeQualificationDetail_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[EmployeeQualificationDetail] CHECK CONSTRAINT [FK_EmployeeQualificationDetail_Employee]
GO
/****** Object:  ForeignKey [FK_EmployeeQualificationDetail_LOVItemValue]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeQualificationDetail]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeQualificationDetail_LOVItemValue] FOREIGN KEY([QualificationId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[EmployeeQualificationDetail] CHECK CONSTRAINT [FK_EmployeeQualificationDetail_LOVItemValue]
GO
/****** Object:  ForeignKey [FK_EmployeeQualificationDetail_LOVItemValue1]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeQualificationDetail]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeQualificationDetail_LOVItemValue1] FOREIGN KEY([SpecializationId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[EmployeeQualificationDetail] CHECK CONSTRAINT [FK_EmployeeQualificationDetail_LOVItemValue1]
GO
/****** Object:  ForeignKey [FK_EmployeeQualificationDetail_LOVItemValue2]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeQualificationDetail]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeQualificationDetail_LOVItemValue2] FOREIGN KEY([CampusId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[EmployeeQualificationDetail] CHECK CONSTRAINT [FK_EmployeeQualificationDetail_LOVItemValue2]
GO
/****** Object:  ForeignKey [FK_PayRoll_Employee]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[PayRoll]  WITH CHECK ADD  CONSTRAINT [FK_PayRoll_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[PayRoll] CHECK CONSTRAINT [FK_PayRoll_Employee]
GO
/****** Object:  ForeignKey [FK_PayRoll_LOVItemValue]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[PayRoll]  WITH CHECK ADD  CONSTRAINT [FK_PayRoll_LOVItemValue] FOREIGN KEY([StatusId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[PayRoll] CHECK CONSTRAINT [FK_PayRoll_LOVItemValue]
GO
/****** Object:  ForeignKey [FK_PayRoll_PayCycle]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[PayRoll]  WITH CHECK ADD  CONSTRAINT [FK_PayRoll_PayCycle] FOREIGN KEY([PayCycleId])
REFERENCES [dbo].[PayCycle] ([Id])
GO
ALTER TABLE [dbo].[PayRoll] CHECK CONSTRAINT [FK_PayRoll_PayCycle]
GO
/****** Object:  ForeignKey [FK_MenuActivityPermission_AspNetUsers]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[MenuActivityPermission]  WITH CHECK ADD  CONSTRAINT [FK_MenuActivityPermission_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[MenuActivityPermission] CHECK CONSTRAINT [FK_MenuActivityPermission_AspNetUsers]
GO
/****** Object:  ForeignKey [FK_MenuActivityPermission_MenuActivityPermission]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[MenuActivityPermission]  WITH CHECK ADD  CONSTRAINT [FK_MenuActivityPermission_MenuActivityPermission] FOREIGN KEY([MenuActivityId])
REFERENCES [dbo].[MenuActivity] ([Id])
GO
ALTER TABLE [dbo].[MenuActivityPermission] CHECK CONSTRAINT [FK_MenuActivityPermission_MenuActivityPermission]
GO
/****** Object:  ForeignKey [FK_RequisitionDetails_LOVItemValue]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[RequisitionDetails]  WITH CHECK ADD  CONSTRAINT [FK_RequisitionDetails_LOVItemValue] FOREIGN KEY([ItemTypeId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[RequisitionDetails] CHECK CONSTRAINT [FK_RequisitionDetails_LOVItemValue]
GO
/****** Object:  ForeignKey [FK_RequisitionDetails_LOVItemValue1]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[RequisitionDetails]  WITH CHECK ADD  CONSTRAINT [FK_RequisitionDetails_LOVItemValue1] FOREIGN KEY([CostCenterId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[RequisitionDetails] CHECK CONSTRAINT [FK_RequisitionDetails_LOVItemValue1]
GO
/****** Object:  ForeignKey [FK_RequisitionDetails_LOVItemValue2]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[RequisitionDetails]  WITH CHECK ADD  CONSTRAINT [FK_RequisitionDetails_LOVItemValue2] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[RequisitionDetails] CHECK CONSTRAINT [FK_RequisitionDetails_LOVItemValue2]
GO
/****** Object:  ForeignKey [FK_RequisitionDetails_LOVItemValue3]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[RequisitionDetails]  WITH CHECK ADD  CONSTRAINT [FK_RequisitionDetails_LOVItemValue3] FOREIGN KEY([AccountId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[RequisitionDetails] CHECK CONSTRAINT [FK_RequisitionDetails_LOVItemValue3]
GO
/****** Object:  ForeignKey [FK_RequisitionDetails_LOVItemValue4]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[RequisitionDetails]  WITH CHECK ADD  CONSTRAINT [FK_RequisitionDetails_LOVItemValue4] FOREIGN KEY([SubAccountId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[RequisitionDetails] CHECK CONSTRAINT [FK_RequisitionDetails_LOVItemValue4]
GO
/****** Object:  ForeignKey [FK_RequisitionDetails_LOVItemValue5]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[RequisitionDetails]  WITH CHECK ADD  CONSTRAINT [FK_RequisitionDetails_LOVItemValue5] FOREIGN KEY([StatusId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[RequisitionDetails] CHECK CONSTRAINT [FK_RequisitionDetails_LOVItemValue5]
GO
/****** Object:  ForeignKey [FK_RequisitionDetails_Requisition]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[RequisitionDetails]  WITH CHECK ADD  CONSTRAINT [FK_RequisitionDetails_Requisition] FOREIGN KEY([RequisitionId])
REFERENCES [dbo].[Requisition] ([Id])
GO
ALTER TABLE [dbo].[RequisitionDetails] CHECK CONSTRAINT [FK_RequisitionDetails_Requisition]
GO
/****** Object:  ForeignKey [FK_RequisitionApproval_Employee]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[RequisitionApproval]  WITH CHECK ADD  CONSTRAINT [FK_RequisitionApproval_Employee] FOREIGN KEY([ApproverId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[RequisitionApproval] CHECK CONSTRAINT [FK_RequisitionApproval_Employee]
GO
/****** Object:  ForeignKey [FK_RequisitionApproval_LOVItemValue]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[RequisitionApproval]  WITH CHECK ADD  CONSTRAINT [FK_RequisitionApproval_LOVItemValue] FOREIGN KEY([StatusId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[RequisitionApproval] CHECK CONSTRAINT [FK_RequisitionApproval_LOVItemValue]
GO
/****** Object:  ForeignKey [FK_RequisitionApproval_Requisition]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[RequisitionApproval]  WITH CHECK ADD  CONSTRAINT [FK_RequisitionApproval_Requisition] FOREIGN KEY([RequisitionId])
REFERENCES [dbo].[Requisition] ([Id])
GO
ALTER TABLE [dbo].[RequisitionApproval] CHECK CONSTRAINT [FK_RequisitionApproval_Requisition]
GO
/****** Object:  ForeignKey [FK_Project_Company]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_Company] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_Company]
GO
/****** Object:  ForeignKey [FK_Project_CompanyContact]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_CompanyContact] FOREIGN KEY([ContactPersonId])
REFERENCES [dbo].[CompanyContact] ([Id])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_CompanyContact]
GO
/****** Object:  ForeignKey [FK_Project_Employee]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_Employee] FOREIGN KEY([ConsultantId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_Employee]
GO
/****** Object:  ForeignKey [FK_Bill_Company]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Company] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Company]
GO
/****** Object:  ForeignKey [FK_Bill_Employee]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Employee]
GO
/****** Object:  ForeignKey [FK_Bill_LOVItemValue]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_LOVItemValue] FOREIGN KEY([BillTypeId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_LOVItemValue]
GO
/****** Object:  ForeignKey [FK_Bill_LOVItemValue1]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_LOVItemValue1] FOREIGN KEY([StatusId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_LOVItemValue1]
GO
/****** Object:  ForeignKey [FK_Bill_Project]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Project]
GO
/****** Object:  ForeignKey [FK_Invoice_Employee]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Employee]
GO
/****** Object:  ForeignKey [FK_Invoice_LOVItemValue]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_LOVItemValue] FOREIGN KEY([StatusId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_LOVItemValue]
GO
/****** Object:  ForeignKey [FK_Invoice_Project]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Project]
GO
/****** Object:  ForeignKey [FK_EmployeeProjectRate_Employee]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeProjectRate]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeProjectRate_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[EmployeeProjectRate] CHECK CONSTRAINT [FK_EmployeeProjectRate_Employee]
GO
/****** Object:  ForeignKey [FK_EmployeeProjectRate_EmployeeFinanceDeal]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeProjectRate]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeProjectRate_EmployeeFinanceDeal] FOREIGN KEY([DealId])
REFERENCES [dbo].[EmployeeFinanceDeal] ([Id])
GO
ALTER TABLE [dbo].[EmployeeProjectRate] CHECK CONSTRAINT [FK_EmployeeProjectRate_EmployeeFinanceDeal]
GO
/****** Object:  ForeignKey [FK_EmployeeProjectRate_Project]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[EmployeeProjectRate]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeProjectRate_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[EmployeeProjectRate] CHECK CONSTRAINT [FK_EmployeeProjectRate_Project]
GO
/****** Object:  ForeignKey [FK_ProjectLocation_Address]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[ProjectLocation]  WITH CHECK ADD  CONSTRAINT [FK_ProjectLocation_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[ProjectLocation] CHECK CONSTRAINT [FK_ProjectLocation_Address]
GO
/****** Object:  ForeignKey [FK_ProjectLocation_Project]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[ProjectLocation]  WITH CHECK ADD  CONSTRAINT [FK_ProjectLocation_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[ProjectLocation] CHECK CONSTRAINT [FK_ProjectLocation_Project]
GO
/****** Object:  ForeignKey [FK_ProjectDocument_Document]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[ProjectDocument]  WITH CHECK ADD  CONSTRAINT [FK_ProjectDocument_Document] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Document] ([Id])
GO
ALTER TABLE [dbo].[ProjectDocument] CHECK CONSTRAINT [FK_ProjectDocument_Document]
GO
/****** Object:  ForeignKey [FK_ProjectDocument_Project]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[ProjectDocument]  WITH CHECK ADD  CONSTRAINT [FK_ProjectDocument_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[ProjectDocument] CHECK CONSTRAINT [FK_ProjectDocument_Project]
GO
/****** Object:  ForeignKey [FK_TimeSheet_Employee]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[TimeSheet]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheet_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[TimeSheet] CHECK CONSTRAINT [FK_TimeSheet_Employee]
GO
/****** Object:  ForeignKey [FK_TimeSheet_LOVItemValue]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[TimeSheet]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheet_LOVItemValue] FOREIGN KEY([StatusId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[TimeSheet] CHECK CONSTRAINT [FK_TimeSheet_LOVItemValue]
GO
/****** Object:  ForeignKey [FK_TimeSheet_Project]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[TimeSheet]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheet_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[TimeSheet] CHECK CONSTRAINT [FK_TimeSheet_Project]
GO
/****** Object:  ForeignKey [FK_TimeSheetEntry_LOVItemValue]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[TimeSheetEntry]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheetEntry_LOVItemValue] FOREIGN KEY([StatusId])
REFERENCES [dbo].[LOVItemValue] ([Id])
GO
ALTER TABLE [dbo].[TimeSheetEntry] CHECK CONSTRAINT [FK_TimeSheetEntry_LOVItemValue]
GO
/****** Object:  ForeignKey [FK_TimeSheetEntry_TimeSheet]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[TimeSheetEntry]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheetEntry_TimeSheet] FOREIGN KEY([TimeSheetId])
REFERENCES [dbo].[TimeSheet] ([Id])
GO
ALTER TABLE [dbo].[TimeSheetEntry] CHECK CONSTRAINT [FK_TimeSheetEntry_TimeSheet]
GO
/****** Object:  ForeignKey [FK_TimeSheetDocument_Document]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[TimeSheetDocument]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheetDocument_Document] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Document] ([Id])
GO
ALTER TABLE [dbo].[TimeSheetDocument] CHECK CONSTRAINT [FK_TimeSheetDocument_Document]
GO
/****** Object:  ForeignKey [FK_TimeSheetDocument_TimeSheet]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[TimeSheetDocument]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheetDocument_TimeSheet] FOREIGN KEY([TimeSheetId])
REFERENCES [dbo].[TimeSheet] ([Id])
GO
ALTER TABLE [dbo].[TimeSheetDocument] CHECK CONSTRAINT [FK_TimeSheetDocument_TimeSheet]
GO
/****** Object:  ForeignKey [FK_TimeSheetAlert_TimeSheet]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[TimeSheetAlert]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheetAlert_TimeSheet] FOREIGN KEY([TimeSheetId])
REFERENCES [dbo].[TimeSheet] ([Id])
GO
ALTER TABLE [dbo].[TimeSheetAlert] CHECK CONSTRAINT [FK_TimeSheetAlert_TimeSheet]
GO
/****** Object:  ForeignKey [FK_PayRollTimeSheetDetail_PayRoll]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[PayRollTimeSheetDetail]  WITH CHECK ADD  CONSTRAINT [FK_PayRollTimeSheetDetail_PayRoll] FOREIGN KEY([PayRollId])
REFERENCES [dbo].[PayRoll] ([Id])
GO
ALTER TABLE [dbo].[PayRollTimeSheetDetail] CHECK CONSTRAINT [FK_PayRollTimeSheetDetail_PayRoll]
GO
/****** Object:  ForeignKey [FK_PayRollTimeSheetDetail_TimeSheet]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[PayRollTimeSheetDetail]  WITH CHECK ADD  CONSTRAINT [FK_PayRollTimeSheetDetail_TimeSheet] FOREIGN KEY([TimeSheetId])
REFERENCES [dbo].[TimeSheet] ([Id])
GO
ALTER TABLE [dbo].[PayRollTimeSheetDetail] CHECK CONSTRAINT [FK_PayRollTimeSheetDetail_TimeSheet]
GO
/****** Object:  ForeignKey [FK_InvoicePayment_Invoice]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[InvoicePayment]  WITH CHECK ADD  CONSTRAINT [FK_InvoicePayment_Invoice] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoice] ([Id])
GO
ALTER TABLE [dbo].[InvoicePayment] CHECK CONSTRAINT [FK_InvoicePayment_Invoice]
GO
/****** Object:  ForeignKey [FK_InvoicePayment_Payment]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[InvoicePayment]  WITH CHECK ADD  CONSTRAINT [FK_InvoicePayment_Payment] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Payment] ([Id])
GO
ALTER TABLE [dbo].[InvoicePayment] CHECK CONSTRAINT [FK_InvoicePayment_Payment]
GO
/****** Object:  ForeignKey [FK_InvoiceFollowUpDetail_Invoice]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[InvoiceFollowUpDetail]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceFollowUpDetail_Invoice] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoice] ([Id])
GO
ALTER TABLE [dbo].[InvoiceFollowUpDetail] CHECK CONSTRAINT [FK_InvoiceFollowUpDetail_Invoice]
GO
/****** Object:  ForeignKey [FK_BillPayment_Bill]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[BillPayment]  WITH CHECK ADD  CONSTRAINT [FK_BillPayment_Bill] FOREIGN KEY([BillId])
REFERENCES [dbo].[Bill] ([Id])
GO
ALTER TABLE [dbo].[BillPayment] CHECK CONSTRAINT [FK_BillPayment_Bill]
GO
/****** Object:  ForeignKey [FK_BillPayment_Payment]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[BillPayment]  WITH CHECK ADD  CONSTRAINT [FK_BillPayment_Payment] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Payment] ([Id])
GO
ALTER TABLE [dbo].[BillPayment] CHECK CONSTRAINT [FK_BillPayment_Payment]
GO
/****** Object:  ForeignKey [FK_BillTimeSheetDetails_Bill]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[BillTimeSheetDetails]  WITH CHECK ADD  CONSTRAINT [FK_BillTimeSheetDetails_Bill] FOREIGN KEY([BillId])
REFERENCES [dbo].[Bill] ([Id])
GO
ALTER TABLE [dbo].[BillTimeSheetDetails] CHECK CONSTRAINT [FK_BillTimeSheetDetails_Bill]
GO
/****** Object:  ForeignKey [FK_BillTimeSheetDetails_TimeSheet]    Script Date: 11/08/2016 17:06:48 ******/
ALTER TABLE [dbo].[BillTimeSheetDetails]  WITH CHECK ADD  CONSTRAINT [FK_BillTimeSheetDetails_TimeSheet] FOREIGN KEY([TimeSheetId])
REFERENCES [dbo].[TimeSheet] ([Id])
GO
ALTER TABLE [dbo].[BillTimeSheetDetails] CHECK CONSTRAINT [FK_BillTimeSheetDetails_TimeSheet]
GO
