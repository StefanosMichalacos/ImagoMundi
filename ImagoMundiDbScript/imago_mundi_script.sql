USE [master]
GO
/****** Object:  Database [ImagoMundi]    Script Date: 16/5/2019 1:57:41 πμ ******/
CREATE DATABASE [ImagoMundi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ImagoMundi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ImagoMundi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ImagoMundi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ImagoMundi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ImagoMundi] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ImagoMundi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ImagoMundi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ImagoMundi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ImagoMundi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ImagoMundi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ImagoMundi] SET ARITHABORT OFF 
GO
ALTER DATABASE [ImagoMundi] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ImagoMundi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ImagoMundi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ImagoMundi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ImagoMundi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ImagoMundi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ImagoMundi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ImagoMundi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ImagoMundi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ImagoMundi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ImagoMundi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ImagoMundi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ImagoMundi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ImagoMundi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ImagoMundi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ImagoMundi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ImagoMundi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ImagoMundi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ImagoMundi] SET  MULTI_USER 
GO
ALTER DATABASE [ImagoMundi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ImagoMundi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ImagoMundi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ImagoMundi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ImagoMundi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ImagoMundi] SET QUERY_STORE = OFF
GO
USE [ImagoMundi]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 16/5/2019 1:57:44 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 16/5/2019 1:57:44 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 16/5/2019 1:57:45 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 16/5/2019 1:57:46 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 16/5/2019 1:57:46 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 16/5/2019 1:57:47 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 16/5/2019 1:57:47 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](70) NULL,
	[City] [nvarchar](70) NULL,
	[State] [nvarchar](70) NULL,
	[SrteetAddress] [nvarchar](100) NULL,
	[Zip] [nvarchar](5) NULL,
	[Discriminator] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 16/5/2019 1:57:48 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 16/5/2019 1:57:48 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[OrderId] [int] NULL,
	[Quantity] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ProductSKU] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 16/5/2019 1:57:48 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[ContinentId] [int] NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 16/5/2019 1:57:49 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[Percentage] [real] NOT NULL,
 CONSTRAINT [PK_Discounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Globes]    Script Date: 16/5/2019 1:57:49 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Globes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Sales] [int] NOT NULL,
	[Price] [real] NOT NULL,
	[DiscountId] [int] NOT NULL,
	[TaxId] [int] NOT NULL,
	[ImageId] [int] NOT NULL,
	[SizeId] [int] NOT NULL,
	[MaterialId] [int] NOT NULL,
	[Keywords] [nvarchar](max) NOT NULL,
	[SKU] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Globes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 16/5/2019 1:57:50 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Maps]    Script Date: 16/5/2019 1:57:50 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maps](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Sales] [int] NOT NULL,
	[Price] [real] NOT NULL,
	[DiscountId] [int] NOT NULL,
	[TaxId] [int] NOT NULL,
	[ImageId] [int] NOT NULL,
	[MapTypeId] [int] NOT NULL,
	[SizeId] [int] NOT NULL,
	[CountryId] [int] NOT NULL,
	[MaterialId] [int] NOT NULL,
	[Keywords] [nvarchar](max) NOT NULL,
	[SKU] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Maps] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MapTypes]    Script Date: 16/5/2019 1:57:52 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MapTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MapTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 16/5/2019 1:57:52 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Materials] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 16/5/2019 1:57:53 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[TotalPrice] [real] NOT NULL,
	[StatusId] [int] NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[PaymentType] [nvarchar](max) NOT NULL,
	[DiscountId] [int] NOT NULL,
	[AppUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 16/5/2019 1:57:53 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Sizes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Taxes]    Script Date: 16/5/2019 1:57:54 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Taxes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[Percentage] [real] NOT NULL,
 CONSTRAINT [PK_Taxes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190408190907_initial', N'2.1.8-servicing-32085')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190408191610_two', N'2.1.8-servicing-32085')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190414092451_usertest', N'2.1.8-servicing-32085')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190414093247_usertest2', N'2.1.8-servicing-32085')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190414094523_usertest3', N'2.1.8-servicing-32085')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190415160937_controllers1504', N'2.1.8-servicing-32085')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190415162850_imageid', N'2.1.8-servicing-32085')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190416180927_data_annotiation', N'2.1.8-servicing-32085')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190417114751_sizetype', N'2.1.8-servicing-32085')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190417164155_displaynames', N'2.1.8-servicing-32085')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190421103032_AppUser', N'2.1.8-servicing-32085')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190421120840_AppUserChanges', N'2.1.8-servicing-32085')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190421121426_order-cart-rework', N'2.1.8-servicing-32085')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190421123812_cart-orderid', N'2.1.8-servicing-32085')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190421141205_ProductBaseUpdate', N'2.1.8-servicing-32085')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190430141134_CustomUserData', N'2.1.8-servicing-32085')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190430181358_app-db-context-identity-user', N'2.1.8-servicing-32085')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190501225306_CustomUserData_new', N'2.1.8-servicing-32085')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190503175546_cart-order-guid-4', N'2.1.8-servicing-32085')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190503184846_sku', N'2.1.8-servicing-32085')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190503190044_sku-2', N'2.1.8-servicing-32085')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190506172740_remove-continents', N'2.1.8-servicing-32085')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190506174424_remove-continents-2', N'2.1.8-servicing-32085')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190508154606_remove_status.cs', N'2.1.8-servicing-32085')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190513190829_user-role-relation', N'2.1.8-servicing-32085')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190513194742_remove-user-role-fk', N'2.1.8-servicing-32085')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Description]) VALUES (N'1', N'Administrator', N'Admin', NULL, N'One who rules them all')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Description]) VALUES (N'2', N'Owner', N'Owner', NULL, N'The owner')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Description]) VALUES (N'3', N'Manager', N'Manager', NULL, N'The manager')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Description]) VALUES (N'4', N'Customer', N'Customer', NULL, N'The sucker')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId]) VALUES (N'Google', N'117773522367516191120', N'Google', N'526463fb-f1b2-46ae-b1ba-f77ec2881173')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'526463fb-f1b2-46ae-b1ba-f77ec2881173', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6741c459-5c31-4fa8-8372-0543f3b905df', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0ce26eb0-1783-452e-89fd-cd53d0934852', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c92584ef-48ce-4281-9b9a-15f668fca75a', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0b3e1f0c-98c9-415f-8ddb-82a63a56ae84', N'4')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5c239438-f8e5-4194-bdb7-f9a63844bcf4', N'4')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7b247efd-0be7-4135-8d2d-24151ad45520', N'4')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'873c8ed0-3ad8-40bc-90f4-044c482e7846', N'4')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName], [City], [State], [SrteetAddress], [Zip], [Discriminator]) VALUES (N'0b3e1f0c-98c9-415f-8ddb-82a63a56ae84', N'pelatis@gmail.com', N'PELATIS@GMAIL.COM', N'pelatis@gmail.com', N'PELATIS@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEFfj1wpuDUpehL7vZF9qN99CeSFIrLflofKvWFHwK8wlwzKgwEEnk+aGqvWQ1RsShw==', N'NL7WMSY2ZG4S2SHKT5PQ22MMMOGOJPEY', N'e0df2f9d-b83d-4afd-a2db-686bfac97c91', NULL, 0, 0, NULL, 1, 0, N'Pelaths', N'Pelatakou', N'Limasol', N'Cyprus', N'Anapauseos', N'11111', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName], [City], [State], [SrteetAddress], [Zip], [Discriminator]) VALUES (N'0ce26eb0-1783-452e-89fd-cd53d0934852', N'stefanosmichalacos@hotmail.com', N'STEFANOS', N'stefanosmichalacos@hotmail.com', N'STEFANOSMICHALACOS@HOTMAIL.COM', 0, N'AQAAAAEAACcQAAAAENoqA9LoybMWhbcDmmTwvncVsIH6+GOStKrFtnM9Yl6TK6cLohKpdsdSy/SGbssuEw==', N'UTITYR5DF2I2RHNS5KRXYHDFBQFUKJAW', N'66acd983-7139-464a-8eb3-d447534200a6', NULL, 0, 0, NULL, 1, 0, N'Stefanos', N'Michalakos', N'athens', N'Greece', N'syrou 20', N'11361', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName], [City], [State], [SrteetAddress], [Zip], [Discriminator]) VALUES (N'15f2c1d9-33e0-404c-943e-6d9fb76dcce3', N'email@email.com', N'EMAIL@EMAIL.COM', N'email@email.com', N'EMAIL@EMAIL.COM', 0, N'AQAAAAEAACcQAAAAEJ2cfKE7A4UwrCnMY/ktUqhKuS/z2udhmeP+Wi4WankqipKbsdQEp3jSlrg2fHbHCg==', N'PTI4FP5FEE4QQMODURNJQYM7ORAMOMXI', N'6365a53e-a6eb-498f-82e9-01a3261914b6', N'123123123', 0, 0, NULL, 1, 0, N'nikos', N'kamzelas', N'marousi', N'attikh', N'xlohs', N'19199', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName], [City], [State], [SrteetAddress], [Zip], [Discriminator]) VALUES (N'526463fb-f1b2-46ae-b1ba-f77ec2881173', N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEPoN0H+2zofIXPJ8RfJVuG/7Tfuq2FwmCbHLcDhxCC1PubKR2biW/k0ofT5p++5Ptg==', N'KCADTRWCJBTXDLS3YSEMEFOHMZUEX66L', N'9705a4d2-1ec6-421a-a331-b10d7c873c57', NULL, 0, 0, NULL, 1, 0, N'Admin', N'Administrator', N'Administratorvile', N'California', N'Something', N'12345', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName], [City], [State], [SrteetAddress], [Zip], [Discriminator]) VALUES (N'53050440-c447-4666-af89-de38cf6bcadd', N'SDASDASD@dmskmsk.gr', N'SDASDASD@DMSKMSK.GR', N'SDASDASD@dmskmsk.gr', N'SDASDASD@DMSKMSK.GR', 0, N'AQAAAAEAACcQAAAAEB5k/suyZ6UaA61a86wkEpWljTg8u0MBgowyKAIXNlgZ2S8Ji7jd0GcDIUJlWgyGAA==', N'J7UOTBE4XJFWFZS7CUPIYAPDUBRPZ6L5', N'd4069a93-094d-465c-a2ee-b7508a5d95ea', NULL, 0, 0, NULL, 1, 0, N'SDSADSA', N'DASDSA', N'SDASD', N'SDAD', N'SDASDAS', N'12132', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName], [City], [State], [SrteetAddress], [Zip], [Discriminator]) VALUES (N'55cb34ab-8691-4b9d-814f-00f465ac7d18', N'pelatis1@gmail.com', N'PELATIS1@GMAIL.COM', N'pelatis1@gmail.com', N'PELATIS1@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEEnkrNJlNWtXH+gVpPRRj9axmH9dUh6tbqXHxUOVth/piKgmYTWJPwis5Vo58a7SVg==', N'DC7GR63TO2ZX5TXECWMHA75QZBH2TSUF', N'f3f9bac7-97cc-4e5e-8c64-663c3c6b1960', NULL, 0, 0, NULL, 1, 0, N'Nikolaosa', N'Kamzelas', N'Marousi', N'Attiki', N'Chlois 40', N'15125', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName], [City], [State], [SrteetAddress], [Zip], [Discriminator]) VALUES (N'5c239438-f8e5-4194-bdb7-f9a63844bcf4', N'y@y.y', N'Y@Y.Y', N'y@y.y', N'Y@Y.Y', 0, N'AQAAAAEAACcQAAAAEMINWVfZ4PGJRmAvv7R8pa6pBn+abjd7kk4Qwxr2IUvMlsxHGGyngrp6y5LMpGpowA==', N'4BAKZLNSQ7U3FGXWSOZRE7UYX7VVALBW', N'f01c3e22-5484-4709-ab3c-f51cd3d8f590', NULL, 0, 0, NULL, 1, 0, N'y', N'y', N'y', N'y', N'y', N'22222', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName], [City], [State], [SrteetAddress], [Zip], [Discriminator]) VALUES (N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'stefanosmichalacos@gmail.com', N'STEFANOSMICHALACOS@GMAIL.COM', N'stefanosmichalacos@gmail.com', N'STEFANOSMICHALACOS@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEE8P/b3Nu0JAyD2Es5+kFAuAkETjoMgWqiq5VgP8icTIA27aEoJSqx8Wd3t3JqcXrQ==', N'V4JM4B2IQUHOP5AIK5DHMHEL25MWEVL2', N'fee5f92e-f975-4a45-995b-2d4c7c82b7ee', NULL, 0, 0, NULL, 1, 0, N'Stefanos', N'Michalakos', N'Athens', N'Greece', N'Syrou 20', N'11361', N'IdentityUser')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName], [City], [State], [SrteetAddress], [Zip], [Discriminator]) VALUES (N'6741c459-5c31-4fa8-8372-0543f3b905df', N'kamzelasn@gmail.com', N'KAMZELASN@GMAIL.COM', N'kamzelasn@gmail.com', N'KAMZELASN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBgjQ9BhXRo0b3R7/K2MQfVv0PGXXWs48Gw6kizpqIH2DvS/UK3fok5C10e6tjRkzg==', N'A72BG2YXUJ6JDK6TBJGXGMQDPK7VIUFL', N'9d4428c3-7f31-4dbd-81a4-ebc65b6f60fc', NULL, 0, 0, NULL, 1, 0, N'Nikolaos', N'Kamzelas', N'Nea Ionia', N'Greece', N'Irakliou 173', N'14231', N'IdentityUser')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName], [City], [State], [SrteetAddress], [Zip], [Discriminator]) VALUES (N'7b247efd-0be7-4135-8d2d-24151ad45520', N'testuser@gmail.com', N'TESTUSER@GMAIL.COM', N'testuser@gmail.com', N'TESTUSER@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEAGELHT88MVm7vCGPR7FTD3W7VA5gbYTxrt4u8rw3fMQdTxpzfnCAbVFyHhjvKFKMQ==', N'25PU3HMDCCPENJY4V6XRMDPYUTVS4NRE', N'325df660-46d9-4265-bab5-40e5b184f0a9', NULL, 0, 0, NULL, 1, 0, N'Tester', N'Customer', N'Something', N'India', N'NO', N'98373', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName], [City], [State], [SrteetAddress], [Zip], [Discriminator]) VALUES (N'873c8ed0-3ad8-40bc-90f4-044c482e7846', N't@g.f', N'T@G.F', N't@g.f', N'T@G.F', 0, N'AQAAAAEAACcQAAAAELHQ73ewCdc6YEM7K0idFcqkH4ZT6/yN6z9iAGi2iFI6s56cbjqBvgkyIN1wzxH/Rw==', N'DPCDILFSFMIJE22CFHU2SCT4VHK66ITB', N'847351d0-cf59-4346-851a-43a35ed3035b', NULL, 0, 0, NULL, 1, 0, N't', N't', N't', N'tt', N't', N'11111', N'IdentityUser')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName], [City], [State], [SrteetAddress], [Zip], [Discriminator]) VALUES (N'c92584ef-48ce-4281-9b9a-15f668fca75a', N'cmillas1993@gmail.com', N'CMILLAS1993@GMAIL.COM', N'cmillas1993@gmail.com', N'CMILLAS1993@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEGElCT6v9b9p0KzPrp2P838V+wYorksd+9v2Nj4OT4/PCMTahkZMXZm5koZNysrzDQ==', N'2RORWS3P3IOVF5EVGJ7V4VFK2CB5ZTZY', N'6527ab34-cb0a-43ad-b2d4-3f3be315d747', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, N'IdentityUser')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName], [City], [State], [SrteetAddress], [Zip], [Discriminator]) VALUES (N'de4b26c4-201f-4c78-898e-c1aa6da4e026', N'kliarisvangelis@gmail.com', N'KLIARISVANGELIS@GMAIL.COM', N'kliarisvangelis@gmail.com', N'KLIARISVANGELIS@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBHtXrTSYdyEHUbSaTiMn3aKyJIVntfuaZs5YKBYOY4X9JdwMZSKCq+s3xcaB7ZU/A==', N'GQKMTPEB7JWNJ773URZADA52NWKFMJZ4', N'470e2f23-f522-4e41-a77d-b9ee76155184', NULL, 0, 0, NULL, 1, 0, N'vagelis', N'kliaris', N'sofades', N'karditsa', N'omonoias', N'43300', NULL)
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [OrderId], [Quantity], [UserId], [ProductSKU]) VALUES (198, N'G-4-6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', NULL, CAST(N'2019-05-14T19:56:08.3855576' AS DateTime2), CAST(N'2019-05-14T21:31:06.6980724' AS DateTime2), N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', 82, 3, N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'G-4')
SET IDENTITY_INSERT [dbo].[Carts] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [ContinentId]) VALUES (1, N'Greece', N'A sunny country', CAST(N'2019-04-09T13:42:45.8046972' AS DateTime2), CAST(N'2019-05-07T15:01:43.4595542' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', 2)
INSERT [dbo].[Countries] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [ContinentId]) VALUES (2, N'United Kingdom', N'A rainy country', CAST(N'2019-04-09T13:42:45.8046972' AS DateTime2), CAST(N'2019-05-14T22:17:00.2517826' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', 2)
INSERT [dbo].[Countries] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [ContinentId]) VALUES (3, N'China', N'A large country', CAST(N'2019-04-09T15:14:02.5559052' AS DateTime2), CAST(N'2019-04-09T15:14:02.5560030' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', 4)
INSERT [dbo].[Countries] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [ContinentId]) VALUES (4, N'India', N'A smelly country', CAST(N'2019-04-15T16:53:14.1118683' AS DateTime2), CAST(N'2019-04-15T16:53:14.1118690' AS DateTime2), N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', 4)
INSERT [dbo].[Countries] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [ContinentId]) VALUES (8, N'Spain', N'Bull and flamenco country', CAST(N'2019-04-16T15:44:05.3305934' AS DateTime2), CAST(N'2019-04-16T15:44:05.3305937' AS DateTime2), N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', 2)
INSERT [dbo].[Countries] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [ContinentId]) VALUES (9, N'France', N'Wine and baguette country', CAST(N'2019-04-16T15:44:29.1198497' AS DateTime2), CAST(N'2019-04-16T15:44:29.1198504' AS DateTime2), N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', 2)
INSERT [dbo].[Countries] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [ContinentId]) VALUES (10, N'Germany', N'Efficient country with cars', CAST(N'2019-04-16T15:44:51.3530543' AS DateTime2), CAST(N'2019-04-16T15:44:51.3530549' AS DateTime2), N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', 2)
INSERT [dbo].[Countries] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [ContinentId]) VALUES (11, N'Italy', N'Spaghetti country', CAST(N'2019-04-16T15:45:10.0072099' AS DateTime2), CAST(N'2019-04-16T15:45:10.0072102' AS DateTime2), N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', 2)
INSERT [dbo].[Countries] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [ContinentId]) VALUES (12, N'Ireland', N'Dance and beer country', CAST(N'2019-04-16T15:45:28.5811487' AS DateTime2), CAST(N'2019-04-16T15:45:28.5811490' AS DateTime2), N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', 2)
INSERT [dbo].[Countries] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [ContinentId]) VALUES (13, N'Mexico', N'Taco country', CAST(N'2019-04-16T15:45:49.8382428' AS DateTime2), CAST(N'2019-04-16T15:45:49.8382435' AS DateTime2), N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', 5)
INSERT [dbo].[Countries] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [ContinentId]) VALUES (14, N'United States', N'Dumb country', CAST(N'2019-04-16T15:46:24.4611499' AS DateTime2), CAST(N'2019-04-16T15:46:24.4611503' AS DateTime2), N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', 5)
INSERT [dbo].[Countries] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [ContinentId]) VALUES (15, N'Canada', N'A polite country', CAST(N'2019-04-16T15:46:57.9203115' AS DateTime2), CAST(N'2019-04-16T15:46:57.9203122' AS DateTime2), N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', 5)
INSERT [dbo].[Countries] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [ContinentId]) VALUES (19, N'(Europe)', N'Whole of Europe', CAST(N'2019-05-02T16:52:22.9641846' AS DateTime2), CAST(N'2019-05-02T16:58:49.9961036' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', 2)
INSERT [dbo].[Countries] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [ContinentId]) VALUES (20, N'(Asia)', N'Whole of Asia', CAST(N'2019-05-02T16:52:42.1682303' AS DateTime2), CAST(N'2019-05-02T16:59:57.4728301' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', 4)
INSERT [dbo].[Countries] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [ContinentId]) VALUES (21, N'(North America)', N'Whole of North America', CAST(N'2019-05-02T16:52:54.9557265' AS DateTime2), CAST(N'2019-05-02T16:59:44.7342530' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', 5)
INSERT [dbo].[Countries] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [ContinentId]) VALUES (22, N'(South America)', N'Whole of South America', CAST(N'2019-05-02T16:53:06.0393997' AS DateTime2), CAST(N'2019-05-02T16:59:34.1585151' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', 7)
INSERT [dbo].[Countries] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [ContinentId]) VALUES (23, N'(Africa)', N'Whole of Africa', CAST(N'2019-05-02T16:53:15.3917259' AS DateTime2), CAST(N'2019-05-02T16:59:25.2286054' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', 8)
INSERT [dbo].[Countries] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [ContinentId]) VALUES (24, N'(Oceania)', N'Whole of Oceania', CAST(N'2019-05-02T16:53:27.8188407' AS DateTime2), CAST(N'2019-05-02T16:59:18.0890989' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', 9)
INSERT [dbo].[Countries] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [ContinentId]) VALUES (25, N'(Antarctica)', N'Whole of Antarctica', CAST(N'2019-05-02T16:53:46.8836474' AS DateTime2), CAST(N'2019-05-02T16:59:10.2814187' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', 10)
INSERT [dbo].[Countries] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [ContinentId]) VALUES (26, N'(World)', N'Whole world', CAST(N'2019-05-02T16:53:59.8905870' AS DateTime2), CAST(N'2019-05-02T16:58:58.8739052' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', 11)
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[Discounts] ON 

INSERT [dbo].[Discounts] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Percentage]) VALUES (1, N'Student 10%', N'Discount for university students', CAST(N'2019-04-09T13:55:04.4967758' AS DateTime2), CAST(N'2019-04-15T16:59:41.8246655' AS DateTime2), N'00000000-0000-0000-0000-000000000000', N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', 0.1)
INSERT [dbo].[Discounts] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Percentage]) VALUES (2, N'No discount ', N'Zero percentage discount for products', CAST(N'2019-05-02T16:59:35.2417124' AS DateTime2), CAST(N'2019-05-02T16:59:35.2417898' AS DateTime2), N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', 0)
INSERT [dbo].[Discounts] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Percentage]) VALUES (3, N'40%', N'Elderly Discount', CAST(N'2019-05-02T17:38:26.7829326' AS DateTime2), CAST(N'2019-05-02T17:38:26.7830484' AS DateTime2), N'c92584ef-48ce-4281-9b9a-15f668fca75a', N'c92584ef-48ce-4281-9b9a-15f668fca75a', 0.4)
SET IDENTITY_INSERT [dbo].[Discounts] OFF
SET IDENTITY_INSERT [dbo].[Globes] ON 

INSERT [dbo].[Globes] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Quantity], [Sales], [Price], [DiscountId], [TaxId], [ImageId], [SizeId], [MaterialId], [Keywords], [SKU]) VALUES (4, N'Small glass globe', N'Small glass something globe', CAST(N'2019-04-17T12:12:47.9842723' AS DateTime2), CAST(N'2019-04-17T12:12:47.9843643' AS DateTime2), N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', 43, 10, 10, 1, 1, 57, 2, 5, N' Globe Glass ', N'G-4')
INSERT [dbo].[Globes] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Quantity], [Sales], [Price], [DiscountId], [TaxId], [ImageId], [SizeId], [MaterialId], [Keywords], [SKU]) VALUES (5, N'Small wooden globe', N'Small wooden globe', CAST(N'2019-04-17T12:14:16.8915108' AS DateTime2), CAST(N'2019-04-17T12:14:16.8915112' AS DateTime2), N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', 60, 10, 10, 1, 1, 60, 2, 1, N' Globe Wood Wooden ', N'G-5')
INSERT [dbo].[Globes] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Quantity], [Sales], [Price], [DiscountId], [TaxId], [ImageId], [SizeId], [MaterialId], [Keywords], [SKU]) VALUES (6, N'Large glass globe', N'Large glass globe political', CAST(N'2019-04-17T12:14:58.8049787' AS DateTime2), CAST(N'2019-04-17T12:14:58.8049794' AS DateTime2), N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', 665, 0, 10000, 1, 1, 57, 3, 5, N' Globe Glass Large ', N'G-6')
INSERT [dbo].[Globes] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Quantity], [Sales], [Price], [DiscountId], [TaxId], [ImageId], [SizeId], [MaterialId], [Keywords], [SKU]) VALUES (7, N'Chicago Ash Wood Antique', N'A political wooden globe from the 50''s', CAST(N'2019-05-02T17:13:47.3929384' AS DateTime2), CAST(N'2019-05-02T17:14:05.1327677' AS DateTime2), N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', 6, 2, 3500, 2, 1, 53, 3, 3, N' Globe Political Wooden Ash Antique Large ', N'G-7')
INSERT [dbo].[Globes] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Quantity], [Sales], [Price], [DiscountId], [TaxId], [ImageId], [SizeId], [MaterialId], [Keywords], [SKU]) VALUES (8, N'Office globe with led light', N'Office political globe with led light. The best gift for children. Give them the chance to know the wold.', CAST(N'2019-05-02T17:18:58.2502414' AS DateTime2), CAST(N'2019-05-02T17:18:58.2502416' AS DateTime2), N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', 12, 35, 40, 2, 1, 62, 2, 18, N' Political Globe Plastic Led ', N'G-8')
INSERT [dbo].[Globes] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Quantity], [Sales], [Price], [DiscountId], [TaxId], [ImageId], [SizeId], [MaterialId], [Keywords], [SKU]) VALUES (9, N'German Terrestrial Globe ', N'A metal globe made in Germany at the early 1700''s', CAST(N'2019-05-02T17:39:39.3916523' AS DateTime2), CAST(N'2019-05-02T17:39:39.3916524' AS DateTime2), N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', 98, 8, 5000, 2, 1, 56, 3, 19, N' German Terrestrial Globe Metal Globe ', N'G-9')
SET IDENTITY_INSERT [dbo].[Globes] OFF
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (3, N'africa_physical_map_blank_large.jpg', NULL, CAST(N'2019-04-16T22:35:43.0900000' AS DateTime2), CAST(N'2019-04-16T22:35:43.0900000' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/africa_physical_map_blank_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (4, N'antarctica_physical_map_blank_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/antarctica_physical_map_blank_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (5, N'asia_physical_map_blank_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/asia_physical_map_blank_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (6, N'australia_physical_map_blank_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/australia_physical_map_blank_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (7, N'belize_simple_map_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/belize_simple_map_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (8, N'canada_simple_map_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/canada_simple_map_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (9, N'china_physical_map_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/china_physical_map_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (10, N'china_simple_map_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/china_simple_map_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (11, N'europe_physical_map_blank_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/europe_physical_map_blank_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (12, N'france_physical_map_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/france_physical_map_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (13, N'france_simple_map_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/france_simple_map_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (14, N'germany_physical_map_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/germany_physical_map_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (15, N'germany_simple_map_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/germany_simple_map_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (16, N'india_physical_map_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/india_physical_map_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (17, N'india_simple_map_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/india_simple_map_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (18, N'ireland_physical_map_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/ireland_physical_map_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (19, N'ireland_simple_map_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/ireland_simple_map_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (20, N'italy_physical_map_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/italy_physical_map_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (21, N'italy_simple_map_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/italy_simple_map_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (22, N'mexico_physical_map_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), CAST(N'2019-04-16T22:36:46.4333333' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/mexico_physical_map_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (23, N'mexico_simple_map_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/mexico_simple_map_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (24, N'north_america_physical_map_blank_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/north_america_physical_map_blank_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (25, N'south_america_physical_map_blank_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/south_america_physical_map_blank_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (26, N'spain_physical_map_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/spain_physical_map_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (27, N'spain_simple_map_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/spain_simple_map_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (28, N'uk_physical_map_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/uk_physical_map_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (29, N'uk_simple_map_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/uk_simple_map_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (30, N'united_states_physical_map_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/united_states_physical_map_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (31, N'usa_simple_map_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/usa_simple_map_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (32, N'usa_topographic_map_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/usa_topographic_map_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (33, N'world_equirectangular_blank_physical_map_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/world_equirectangular_blank_physical_map_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (34, N'world_physical_map_blank_mercator_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/world_physical_map_blank_mercator_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (35, N'world_physical_map_mercator_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/world_physical_map_mercator_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (36, N'world_political_map_robinson_large.jpg', NULL, CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), CAST(N'2019-04-16T22:36:46.4366667' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/world_political_map_robinson_large.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (53, N'5413169022_43bd1bea40_b.jpg', NULL, CAST(N'2019-04-16T23:17:56.9766667' AS DateTime2), CAST(N'2019-04-16T23:17:56.9766667' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/globes/5413169022_43bd1bea40_b.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (55, N'Fitz_globe_(2710799656).jpg', NULL, CAST(N'2019-04-16T23:17:56.9766667' AS DateTime2), CAST(N'2019-04-16T23:17:56.9766667' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/globes/Fitz_globe_(2710799656).jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (56, N'German_terrestrial_globe,_circa_1725_1.jpg', NULL, CAST(N'2019-04-16T23:17:56.9766667' AS DateTime2), CAST(N'2019-04-16T23:17:56.9766667' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/globes/German_terrestrial_globe,_circa_1725_1.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (57, N'Glass_globe.jpg', NULL, CAST(N'2019-04-16T23:17:56.9766667' AS DateTime2), CAST(N'2019-04-16T23:17:56.9766667' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/globes/Glass_globe.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (58, N'Globe-Old-World-Globe-Earth-World-1674102.jpg', NULL, CAST(N'2019-04-16T23:17:56.9766667' AS DateTime2), CAST(N'2019-04-16T23:17:56.9766667' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/globes/Globe-Old-World-Globe-Earth-World-1674102.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (59, N'globe.jpg', NULL, CAST(N'2019-04-16T23:17:56.9766667' AS DateTime2), CAST(N'2019-04-16T23:17:56.9766667' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/globes/globe.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (60, N'terrestrial_globe_world_map_earth-620728.jpg', NULL, CAST(N'2019-04-16T23:17:56.9766667' AS DateTime2), CAST(N'2019-04-16T23:17:56.9766667' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/globes/terrestrial_globe_world_map_earth-620728.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (62, N'earth_960430.jpg', NULL, CAST(N'2019-04-16T23:21:14.1733333' AS DateTime2), CAST(N'2019-04-16T23:21:14.1733333' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/globes/earth_960430.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (148, N'USDA_Hardiness_zone_map.jpg', NULL, CAST(N'2019-05-02T17:42:52.0507416' AS DateTime2), CAST(N'2019-05-02T17:42:52.0507420' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', N'/images/maps/USDA_Hardiness_zone_map.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (149, N'Sfera-42-desk-bar-globe.jpg', N'The best Globe ever made!', CAST(N'2019-05-02T17:44:49.4257137' AS DateTime2), CAST(N'2019-05-02T17:44:49.4257139' AS DateTime2), N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'/images/globes/Sfera-42-desk-bar-globe.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Path]) VALUES (165, N'1027px-USDA_Hardiness_zone_map.jpg', N'USDA Plant Hardness Zone Map', CAST(N'2019-05-02T19:41:13.2792572' AS DateTime2), CAST(N'2019-05-02T19:41:13.2793720' AS DateTime2), N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'/images/maps/1027px-USDA_Hardiness_zone_map.jpg')
SET IDENTITY_INSERT [dbo].[Images] OFF
SET IDENTITY_INSERT [dbo].[Maps] ON 

INSERT [dbo].[Maps] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Quantity], [Sales], [Price], [DiscountId], [TaxId], [ImageId], [MapTypeId], [SizeId], [CountryId], [MaterialId], [Keywords], [SKU]) VALUES (8, N'Physical Map of China A3', N'A beautiful deluxe physical map of China in A3 paper size', CAST(N'2019-04-17T13:29:10.4763317' AS DateTime2), CAST(N'2019-05-13T13:42:34.1450272' AS DateTime2), N'a2418aa6-f045-4a4e-9d7a-4d39382484b1', N'6741c459-5c31-4fa8-8372-0543f3b905df', 3, 2, 35, 1, 1, 9, 2, 4, 3, 17, N' Map Physical China A3 Deluxe paper ', N'M-8')
INSERT [dbo].[Maps] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Quantity], [Sales], [Price], [DiscountId], [TaxId], [ImageId], [MapTypeId], [SizeId], [CountryId], [MaterialId], [Keywords], [SKU]) VALUES (9, N'India political', N'Something political', CAST(N'2019-04-17T18:25:34.3851452' AS DateTime2), CAST(N'2019-04-17T18:26:01.9241676' AS DateTime2), N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', 1, 0, 10, 1, 1, 17, 1, 1, 4, 16, N' Map India Political ', N'M-9')
INSERT [dbo].[Maps] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Quantity], [Sales], [Price], [DiscountId], [TaxId], [ImageId], [MapTypeId], [SizeId], [CountryId], [MaterialId], [Keywords], [SKU]) VALUES (10, N'Germany political', N'Another political map', CAST(N'2019-04-17T18:31:12.6540993' AS DateTime2), CAST(N'2019-04-17T18:31:12.6541000' AS DateTime2), N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', 0, 0, 20, 1, 1, 15, 1, 4, 10, 17, N' Map Germany Political ', N'M-10')
INSERT [dbo].[Maps] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Quantity], [Sales], [Price], [DiscountId], [TaxId], [ImageId], [MapTypeId], [SizeId], [CountryId], [MaterialId], [Keywords], [SKU]) VALUES (11, N'Large USA physical', N'Physical map of the United States of America', CAST(N'2019-04-17T18:32:58.6851420' AS DateTime2), CAST(N'2019-05-13T13:43:07.6468450' AS DateTime2), N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', N'6741c459-5c31-4fa8-8372-0543f3b905df', 1, 0, 100, 1, 1, 32, 2, 5, 14, 17, N' Map USA Physical A2 Large ', N'M-11')
INSERT [dbo].[Maps] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Quantity], [Sales], [Price], [DiscountId], [TaxId], [ImageId], [MapTypeId], [SizeId], [CountryId], [MaterialId], [Keywords], [SKU]) VALUES (12, N'Europe, physical', N'Physical map of Europe without labels', CAST(N'2019-05-02T17:20:31.2595387' AS DateTime2), CAST(N'2019-05-02T17:20:31.2596204' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', 11, 2, 41, 2, 1, 11, 2, 4, 19, 17, N' Map Physical Europe Blank A3 Deluxe ', N'M-12')
INSERT [dbo].[Maps] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Quantity], [Sales], [Price], [DiscountId], [TaxId], [ImageId], [MapTypeId], [SizeId], [CountryId], [MaterialId], [Keywords], [SKU]) VALUES (13, N'USDA Plant Hardiness Zone Map', N'United States Department of Agriculture Plant Hardiness Zone Map', CAST(N'2019-05-02T19:45:57.6773800' AS DateTime2), CAST(N'2019-05-02T19:45:57.6773801' AS DateTime2), N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', 11, 4, 500, 2, 1, 165, 4, 1, 21, 17, N' Plant  Zone Map North America Thematic Paper A4 ', N'M-13')
INSERT [dbo].[Maps] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Quantity], [Sales], [Price], [DiscountId], [TaxId], [ImageId], [MapTypeId], [SizeId], [CountryId], [MaterialId], [Keywords], [SKU]) VALUES (14, N'Political world map', NULL, CAST(N'2019-05-02T19:58:13.3093707' AS DateTime2), CAST(N'2019-05-02T19:58:13.3094487' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df', 3, 1, 56, 3, 2, 36, 1, 5, 26, 16, N' Map Political World A2 ', N'M-14')
SET IDENTITY_INSERT [dbo].[Maps] OFF
SET IDENTITY_INSERT [dbo].[MapTypes] ON 

INSERT [dbo].[MapTypes] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById]) VALUES (1, N'Political', N'Depicts country borders', CAST(N'2019-04-15T16:06:31.4597611' AS DateTime2), CAST(N'2019-04-15T16:06:31.4598483' AS DateTime2), N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', N'b9fa6868-a92f-42f3-a86b-bbb995dca31d')
INSERT [dbo].[MapTypes] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById]) VALUES (2, N'Physical', N'Depicts physical terrestrial features', CAST(N'2019-04-16T15:49:17.0343004' AS DateTime2), CAST(N'2019-04-16T15:49:17.0343014' AS DateTime2), N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', N'b9fa6868-a92f-42f3-a86b-bbb995dca31d')
INSERT [dbo].[MapTypes] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById]) VALUES (3, N'Topographic', N'Depicts terrain features and elevation', CAST(N'2019-05-02T16:49:40.9856561' AS DateTime2), CAST(N'2019-05-02T16:49:40.9857341' AS DateTime2), N'6741c459-5c31-4fa8-8372-0543f3b905df', N'6741c459-5c31-4fa8-8372-0543f3b905df')
INSERT [dbo].[MapTypes] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById]) VALUES (4, N'Thematic', NULL, CAST(N'2019-05-02T19:42:12.9226708' AS DateTime2), CAST(N'2019-05-02T19:42:12.9226710' AS DateTime2), N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8')
SET IDENTITY_INSERT [dbo].[MapTypes] OFF
SET IDENTITY_INSERT [dbo].[Materials] ON 

INSERT [dbo].[Materials] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Type]) VALUES (1, N'Pine', N'A nice softwood, ideal for your house.', CAST(N'2019-04-14T18:28:25.1579285' AS DateTime2), CAST(N'2019-04-15T15:07:47.1501012' AS DateTime2), N'00000000-0000-0000-0000-000000000000', N'5b97d169-36c3-4a48-9e1d-8511a48a4f84', N'Wood')
INSERT [dbo].[Materials] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Type]) VALUES (2, N'Oak', N'A nice Oak hardwood, ideal for your house.', CAST(N'2019-04-14T18:28:25.1579285' AS DateTime2), CAST(N'2019-04-14T10:41:40.6103907' AS DateTime2), N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000', N'Wood')
INSERT [dbo].[Materials] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Type]) VALUES (3, N'Ash', N'A nice Ashhardwood, ideal for your house.', CAST(N'2019-04-14T18:28:25.1579285' AS DateTime2), CAST(N'2019-04-14T10:37:59.5566973' AS DateTime2), N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000', N'Wood')
INSERT [dbo].[Materials] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Type]) VALUES (5, N'Glass', N'A nice Bohemian glass, ideal for your house.', CAST(N'2019-04-14T18:28:25.1579285' AS DateTime2), CAST(N'2019-04-14T10:42:30.8593713' AS DateTime2), N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000', N'Glass')
INSERT [dbo].[Materials] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Type]) VALUES (16, N'Plain paper', N'Cheap paper', CAST(N'2019-04-15T18:28:25.1579285' AS DateTime2), CAST(N'2019-04-15T18:28:25.1579285' AS DateTime2), N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', N'Paper')
INSERT [dbo].[Materials] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Type]) VALUES (17, N'Deluxe paper', N'300 g/cm² weight for high quality prints', CAST(N'2019-04-15T18:28:25.1579285' AS DateTime2), CAST(N'2019-04-15T18:28:25.1579285' AS DateTime2), N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', N'Paper')
INSERT [dbo].[Materials] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Type]) VALUES (18, N'Plastic', N'Acrylic plastic  ', CAST(N'2019-05-02T17:15:43.8397786' AS DateTime2), CAST(N'2019-05-02T17:15:43.8397788' AS DateTime2), N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'Plastic')
INSERT [dbo].[Materials] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Type]) VALUES (19, N'Medium Carbon Steel', N'Medium Carbon Steels contain 0.4 of carbon%', CAST(N'2019-05-02T17:30:58.8212495' AS DateTime2), CAST(N'2019-05-02T17:30:58.8214131' AS DateTime2), N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'Metal')
SET IDENTITY_INSERT [dbo].[Materials] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [UserId], [TotalPrice], [StatusId], [Address], [PaymentType], [DiscountId], [AppUserId]) VALUES (82, N'Order Of 6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', NULL, CAST(N'2019-05-14T21:31:15.4908984' AS DateTime2), CAST(N'2019-05-14T21:31:15.4908987' AS DateTime2), N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', N'6279f9ee-ac5a-4f7d-9d70-4acc64d3ffd8', 0, 1, N'Syrou 20', N'On Delivery', 2, NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Sizes] ON 

INSERT [dbo].[Sizes] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Type]) VALUES (1, N'A4', N'297 × 210 mm', CAST(N'2019-04-09T13:54:20.8051231' AS DateTime2), CAST(N'2019-04-15T16:55:13.5564610' AS DateTime2), N'00000000-0000-0000-0000-000000000000', N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', N'Paper')
INSERT [dbo].[Sizes] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Type]) VALUES (2, N'Small', N'Ø 10 cm', CAST(N'2019-04-15T16:56:40.8014334' AS DateTime2), CAST(N'2019-04-15T16:56:40.8014341' AS DateTime2), N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', N'Diameter')
INSERT [dbo].[Sizes] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Type]) VALUES (3, N'Large', N'Ø 40 cm', CAST(N'2019-04-15T16:57:07.3427080' AS DateTime2), CAST(N'2019-04-15T16:57:07.3427087' AS DateTime2), N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', N'Diameter')
INSERT [dbo].[Sizes] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Type]) VALUES (4, N'A3', N'420 × 297 mm', CAST(N'2019-04-16T15:38:24.7532578' AS DateTime2), CAST(N'2019-04-16T15:38:24.7533505' AS DateTime2), N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', N'Paper')
INSERT [dbo].[Sizes] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Type]) VALUES (5, N'A2', N'594 × 420 mm', CAST(N'2019-04-16T15:38:50.2392836' AS DateTime2), CAST(N'2019-04-16T15:38:50.2392843' AS DateTime2), N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', N'Paper')
SET IDENTITY_INSERT [dbo].[Sizes] OFF
SET IDENTITY_INSERT [dbo].[Taxes] ON 

INSERT [dbo].[Taxes] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Percentage]) VALUES (1, N'VAT 24%', N'VAT applies to individual customers', CAST(N'2019-04-09T17:23:05.9941988' AS DateTime2), CAST(N'2019-04-15T17:01:46.1019791' AS DateTime2), N'00000000-0000-0000-0000-000000000000', N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', 0.24)
INSERT [dbo].[Taxes] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Percentage]) VALUES (2, N'VAT 14%', N'Reduced VAT for businesses', CAST(N'2019-04-09T17:24:52.2485897' AS DateTime2), CAST(N'2019-04-15T17:02:46.3416603' AS DateTime2), N'00000000-0000-0000-0000-000000000000', N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', 0.14)
INSERT [dbo].[Taxes] ([Id], [Name], [Description], [DateCreated], [DateUpdated], [CreatedById], [UpdatedById], [Percentage]) VALUES (3, N'5% import tax', N'Applies to foreign customers', CAST(N'2019-04-15T17:03:56.1808454' AS DateTime2), CAST(N'2019-04-15T17:03:56.1808461' AS DateTime2), N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', N'b9fa6868-a92f-42f3-a86b-bbb995dca31d', 0.05)
SET IDENTITY_INSERT [dbo].[Taxes] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 16/5/2019 1:58:00 πμ ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 16/5/2019 1:58:00 πμ ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 16/5/2019 1:58:00 πμ ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 16/5/2019 1:58:00 πμ ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 16/5/2019 1:58:00 πμ ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 16/5/2019 1:58:00 πμ ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 16/5/2019 1:58:00 πμ ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Carts_OrderId]    Script Date: 16/5/2019 1:58:00 πμ ******/
CREATE NONCLUSTERED INDEX [IX_Carts_OrderId] ON [dbo].[Carts]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Carts_UserId]    Script Date: 16/5/2019 1:58:00 πμ ******/
CREATE NONCLUSTERED INDEX [IX_Carts_UserId] ON [dbo].[Carts]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Globes_DiscountId]    Script Date: 16/5/2019 1:58:00 πμ ******/
CREATE NONCLUSTERED INDEX [IX_Globes_DiscountId] ON [dbo].[Globes]
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Globes_ImageId]    Script Date: 16/5/2019 1:58:00 πμ ******/
CREATE NONCLUSTERED INDEX [IX_Globes_ImageId] ON [dbo].[Globes]
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Globes_MaterialId]    Script Date: 16/5/2019 1:58:00 πμ ******/
CREATE NONCLUSTERED INDEX [IX_Globes_MaterialId] ON [dbo].[Globes]
(
	[MaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Globes_SizeId]    Script Date: 16/5/2019 1:58:00 πμ ******/
CREATE NONCLUSTERED INDEX [IX_Globes_SizeId] ON [dbo].[Globes]
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Globes_TaxId]    Script Date: 16/5/2019 1:58:00 πμ ******/
CREATE NONCLUSTERED INDEX [IX_Globes_TaxId] ON [dbo].[Globes]
(
	[TaxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Maps_CountryId]    Script Date: 16/5/2019 1:58:00 πμ ******/
CREATE NONCLUSTERED INDEX [IX_Maps_CountryId] ON [dbo].[Maps]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Maps_DiscountId]    Script Date: 16/5/2019 1:58:00 πμ ******/
CREATE NONCLUSTERED INDEX [IX_Maps_DiscountId] ON [dbo].[Maps]
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Maps_ImageId]    Script Date: 16/5/2019 1:58:00 πμ ******/
CREATE NONCLUSTERED INDEX [IX_Maps_ImageId] ON [dbo].[Maps]
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Maps_MapTypeId]    Script Date: 16/5/2019 1:58:00 πμ ******/
CREATE NONCLUSTERED INDEX [IX_Maps_MapTypeId] ON [dbo].[Maps]
(
	[MapTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Maps_MaterialId]    Script Date: 16/5/2019 1:58:00 πμ ******/
CREATE NONCLUSTERED INDEX [IX_Maps_MaterialId] ON [dbo].[Maps]
(
	[MaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Maps_SizeId]    Script Date: 16/5/2019 1:58:00 πμ ******/
CREATE NONCLUSTERED INDEX [IX_Maps_SizeId] ON [dbo].[Maps]
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Maps_TaxId]    Script Date: 16/5/2019 1:58:00 πμ ******/
CREATE NONCLUSTERED INDEX [IX_Maps_TaxId] ON [dbo].[Maps]
(
	[TaxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Orders_AppUserId]    Script Date: 16/5/2019 1:58:00 πμ ******/
CREATE NONCLUSTERED INDEX [IX_Orders_AppUserId] ON [dbo].[Orders]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_DiscountId]    Script Date: 16/5/2019 1:58:00 πμ ******/
CREATE NONCLUSTERED INDEX [IX_Orders_DiscountId] ON [dbo].[Orders]
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Carts] ADD  DEFAULT (N'') FOR [ProductSKU]
GO
ALTER TABLE [dbo].[Globes] ADD  DEFAULT (N'') FOR [Keywords]
GO
ALTER TABLE [dbo].[Globes] ADD  DEFAULT (N'') FOR [SKU]
GO
ALTER TABLE [dbo].[Maps] ADD  DEFAULT (N'') FOR [Keywords]
GO
ALTER TABLE [dbo].[Maps] ADD  DEFAULT (N'') FOR [SKU]
GO
ALTER TABLE [dbo].[Sizes] ADD  DEFAULT (N'') FOR [Type]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Orders_OrderId]
GO
ALTER TABLE [dbo].[Globes]  WITH CHECK ADD  CONSTRAINT [FK_Globes_Discounts_DiscountId] FOREIGN KEY([DiscountId])
REFERENCES [dbo].[Discounts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Globes] CHECK CONSTRAINT [FK_Globes_Discounts_DiscountId]
GO
ALTER TABLE [dbo].[Globes]  WITH CHECK ADD  CONSTRAINT [FK_Globes_Images_ImageId] FOREIGN KEY([ImageId])
REFERENCES [dbo].[Images] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Globes] CHECK CONSTRAINT [FK_Globes_Images_ImageId]
GO
ALTER TABLE [dbo].[Globes]  WITH CHECK ADD  CONSTRAINT [FK_Globes_Materials_MaterialId] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Materials] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Globes] CHECK CONSTRAINT [FK_Globes_Materials_MaterialId]
GO
ALTER TABLE [dbo].[Globes]  WITH CHECK ADD  CONSTRAINT [FK_Globes_Sizes_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Sizes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Globes] CHECK CONSTRAINT [FK_Globes_Sizes_SizeId]
GO
ALTER TABLE [dbo].[Globes]  WITH CHECK ADD  CONSTRAINT [FK_Globes_Taxes_TaxId] FOREIGN KEY([TaxId])
REFERENCES [dbo].[Taxes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Globes] CHECK CONSTRAINT [FK_Globes_Taxes_TaxId]
GO
ALTER TABLE [dbo].[Maps]  WITH CHECK ADD  CONSTRAINT [FK_Maps_Countries_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Maps] CHECK CONSTRAINT [FK_Maps_Countries_CountryId]
GO
ALTER TABLE [dbo].[Maps]  WITH CHECK ADD  CONSTRAINT [FK_Maps_Discounts_DiscountId] FOREIGN KEY([DiscountId])
REFERENCES [dbo].[Discounts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Maps] CHECK CONSTRAINT [FK_Maps_Discounts_DiscountId]
GO
ALTER TABLE [dbo].[Maps]  WITH CHECK ADD  CONSTRAINT [FK_Maps_Images_ImageId] FOREIGN KEY([ImageId])
REFERENCES [dbo].[Images] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Maps] CHECK CONSTRAINT [FK_Maps_Images_ImageId]
GO
ALTER TABLE [dbo].[Maps]  WITH CHECK ADD  CONSTRAINT [FK_Maps_MapTypes_MapTypeId] FOREIGN KEY([MapTypeId])
REFERENCES [dbo].[MapTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Maps] CHECK CONSTRAINT [FK_Maps_MapTypes_MapTypeId]
GO
ALTER TABLE [dbo].[Maps]  WITH CHECK ADD  CONSTRAINT [FK_Maps_Materials_MaterialId] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Materials] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Maps] CHECK CONSTRAINT [FK_Maps_Materials_MaterialId]
GO
ALTER TABLE [dbo].[Maps]  WITH CHECK ADD  CONSTRAINT [FK_Maps_Sizes_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Sizes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Maps] CHECK CONSTRAINT [FK_Maps_Sizes_SizeId]
GO
ALTER TABLE [dbo].[Maps]  WITH CHECK ADD  CONSTRAINT [FK_Maps_Taxes_TaxId] FOREIGN KEY([TaxId])
REFERENCES [dbo].[Taxes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Maps] CHECK CONSTRAINT [FK_Maps_Taxes_TaxId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_AspNetUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_AspNetUsers_AppUserId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Discounts_DiscountId] FOREIGN KEY([DiscountId])
REFERENCES [dbo].[Discounts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Discounts_DiscountId]
GO
USE [master]
GO
ALTER DATABASE [ImagoMundi] SET  READ_WRITE 
GO
