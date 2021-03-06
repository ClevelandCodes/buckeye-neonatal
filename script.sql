USE [master]
GO
/****** Object:  Database [NEO-natal]    Script Date: 6/27/2016 2:48:05 PM ******/
CREATE DATABASE [NEO-natal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NEO-natal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\NEO-natal.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NEO-natal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\NEO-natal_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NEO-natal] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NEO-natal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NEO-natal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NEO-natal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NEO-natal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NEO-natal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NEO-natal] SET ARITHABORT OFF 
GO
ALTER DATABASE [NEO-natal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NEO-natal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NEO-natal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NEO-natal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NEO-natal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NEO-natal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NEO-natal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NEO-natal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NEO-natal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NEO-natal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NEO-natal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NEO-natal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NEO-natal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NEO-natal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NEO-natal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NEO-natal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NEO-natal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NEO-natal] SET RECOVERY FULL 
GO
ALTER DATABASE [NEO-natal] SET  MULTI_USER 
GO
ALTER DATABASE [NEO-natal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NEO-natal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NEO-natal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NEO-natal] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [NEO-natal] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NEO-natal', N'ON'
GO
USE [NEO-natal]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 6/27/2016 2:48:06 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/27/2016 2:48:06 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/27/2016 2:48:06 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/27/2016 2:48:06 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/27/2016 2:48:06 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/27/2016 2:48:06 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CommunityHealthWorker]    Script Date: 6/27/2016 2:48:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CommunityHealthWorker](
	[communityHealthWorkerID] [int] NOT NULL,
	[loginName] [varchar](100) NOT NULL,
	[passWord] [varchar](50) NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [int] NOT NULL,
	[jobTitle] [varchar](100) NOT NULL,
	[organization] [varchar](100) NOT NULL,
	[Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_CommunityHealthWorker] PRIMARY KEY CLUSTERED 
(
	[communityHealthWorkerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mothers_Data]    Script Date: 6/27/2016 2:48:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mothers_Data](
	[mothersId] [int] NOT NULL,
	[communityHealthWorkerID] [int] NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[dOb] [date] NOT NULL,
	[address] [varchar](200) NOT NULL,
	[zip] [int] NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[dueDate] [date] NOT NULL,
 CONSTRAINT [PK_Mothers_Data] PRIMARY KEY CLUSTERED 
(
	[mothersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Survey]    Script Date: 6/27/2016 2:48:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Survey](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[mothersId] [int] NOT NULL,
	[communityHealthWorkerID] [int] NOT NULL,
	[address] [varchar](100) NULL,
	[zip] [int] NOT NULL,
	[race] [int] NOT NULL,
	[firstChild] [int] NULL,
	[prematureBirth] [int] NULL,
	[visitObgyn] [int] NULL,
	[age] [int] NULL,
	[stress] [int] NULL,
	[smoke] [int] NULL,
	[familySmoke] [int] NULL,
	[alcohol] [int] NULL,
	[familyAlcohol] [int] NULL,
	[drugs] [int] NULL,
	[familyDrugs] [int] NULL,
	[safeOwnHome] [int] NULL,
	[safeNeighborhood] [int] NULL,
	[chronicIllness] [int] NULL,
	[transportation] [int] NULL,
	[homeInternet] [int] NULL,
	[mobileInternet] [int] NULL,
	[diet] [int] NULL,
	[govAssistance] [int] NULL,
	[income] [int] NULL,
	[education] [int] NULL,
	[riskScore] [float] NULL,
 CONSTRAINT [PK_Survey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 6/27/2016 2:48:06 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 6/27/2016 2:48:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 6/27/2016 2:48:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 6/27/2016 2:48:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 6/27/2016 2:48:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 6/27/2016 2:48:06 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[CommunityHealthWorker]  WITH CHECK ADD  CONSTRAINT [FK_CommunityHealthWorker_AspNetUsers_Cascade] FOREIGN KEY([Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CommunityHealthWorker] CHECK CONSTRAINT [FK_CommunityHealthWorker_AspNetUsers_Cascade]
GO
ALTER TABLE [dbo].[Mothers_Data]  WITH CHECK ADD  CONSTRAINT [FK_Mothers_Data_CommunityHealthWorker_Cascade] FOREIGN KEY([communityHealthWorkerID])
REFERENCES [dbo].[CommunityHealthWorker] ([communityHealthWorkerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Mothers_Data] CHECK CONSTRAINT [FK_Mothers_Data_CommunityHealthWorker_Cascade]
GO
ALTER TABLE [dbo].[Survey]  WITH CHECK ADD  CONSTRAINT [FK_Survey_CommunityHealthWorker1] FOREIGN KEY([communityHealthWorkerID])
REFERENCES [dbo].[CommunityHealthWorker] ([communityHealthWorkerID])
GO
ALTER TABLE [dbo].[Survey] CHECK CONSTRAINT [FK_Survey_CommunityHealthWorker1]
GO
ALTER TABLE [dbo].[Survey]  WITH CHECK ADD  CONSTRAINT [FK_Survey_Mothers_Data] FOREIGN KEY([mothersId])
REFERENCES [dbo].[Mothers_Data] ([mothersId])
GO
ALTER TABLE [dbo].[Survey] CHECK CONSTRAINT [FK_Survey_Mothers_Data]
GO
USE [master]
GO
ALTER DATABASE [NEO-natal] SET  READ_WRITE 
GO
