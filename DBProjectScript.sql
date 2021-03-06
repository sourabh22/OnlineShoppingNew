USE [master]
GO
/****** Object:  Database [OnlineShoppingDb]    Script Date: 11/15/2018 12:34:48 PM ******/
CREATE DATABASE [OnlineShoppingDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'onlinedb_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\onlinedb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'onlinedb_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\onlinedb.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OnlineShoppingDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineShoppingDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineShoppingDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineShoppingDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineShoppingDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineShoppingDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineShoppingDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineShoppingDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineShoppingDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineShoppingDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineShoppingDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineShoppingDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineShoppingDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineShoppingDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineShoppingDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineShoppingDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineShoppingDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineShoppingDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineShoppingDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineShoppingDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineShoppingDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineShoppingDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineShoppingDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineShoppingDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineShoppingDb] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlineShoppingDb] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineShoppingDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineShoppingDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineShoppingDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineShoppingDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineShoppingDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlineShoppingDb', N'ON'
GO
ALTER DATABASE [OnlineShoppingDb] SET QUERY_STORE = OFF
GO
USE [OnlineShoppingDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [OnlineShoppingDb]
GO
/****** Object:  User [sourabh]    Script Date: 11/15/2018 12:34:49 PM ******/
CREATE USER [sourabh] FOR LOGIN [sourabh] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [sourabh]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [sourabh]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [sourabh]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [sourabh]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [sourabh]
GO
ALTER ROLE [db_datareader] ADD MEMBER [sourabh]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [sourabh]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [sourabh]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [sourabh]
GO
/****** Object:  Table [dbo].[category]    Script Date: 11/15/2018 12:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[CategoryId] [int] IDENTITY(100,1) NOT NULL,
	[CategoryName] [varchar](40) NULL,
 CONSTRAINT [PK__category__23CDE5909DC6E7DB] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 11/15/2018 12:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NULL,
	[EMail] [nvarchar](20) NULL,
	[Password] [varchar](30) NULL,
	[Phone] [varchar](20) NULL,
	[Address] [varchar](max) NULL,
 CONSTRAINT [PK__customer__A4AE64D8DBDE5CCE] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderdetails]    Script Date: 11/15/2018 12:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderdetails](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_orderdetails_1] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ordertable]    Script Date: 11/15/2018 12:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ordertable](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[OrderDate] [date] NULL,
	[TotalAmount] [float] NULL,
	[CustomerId] [int] NULL,
 CONSTRAINT [PK__ordertab__C2FFCF1350B39F69] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment]    Script Date: 11/15/2018 12:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[InvoiceId] [int] IDENTITY(6500,1) NOT NULL,
	[OrderId] [int] NULL,
	[Mode] [varchar](20) NULL,
	[Amount] [money] NULL,
	[PaymentDate] [date] NULL,
 CONSTRAINT [PK__payment__9B556A38C586C1EE] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 11/15/2018 12:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](20) NULL,
	[CategoryId] [int] NULL,
	[SubCategoryId] [int] NULL,
	[Price] [money] NULL,
	[Quantity] [int] NULL,
	[ReorderLevel] [int] NULL,
	[Image] [varchar](1000) NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subcategory]    Script Date: 11/15/2018 12:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subcategory](
	[SubCategoryId] [int] IDENTITY(100,5) NOT NULL,
	[CategoryId] [int] NULL,
	[SubCategoryName] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([CategoryId], [CategoryName]) VALUES (100, N'Men')
INSERT [dbo].[category] ([CategoryId], [CategoryName]) VALUES (101, N'Women')
INSERT [dbo].[category] ([CategoryId], [CategoryName]) VALUES (102, N'Electronics')
INSERT [dbo].[category] ([CategoryId], [CategoryName]) VALUES (103, N'TVs and Appliances')
INSERT [dbo].[category] ([CategoryId], [CategoryName]) VALUES (104, N'Baby & KIds')
INSERT [dbo].[category] ([CategoryId], [CategoryName]) VALUES (105, N'HOME & Furniture')
INSERT [dbo].[category] ([CategoryId], [CategoryName]) VALUES (106, N'SPORTS,Books & More')
INSERT [dbo].[category] ([CategoryId], [CategoryName]) VALUES (107, N'Grocery')
INSERT [dbo].[category] ([CategoryId], [CategoryName]) VALUES (108, N'SportsWear')
SET IDENTITY_INSERT [dbo].[category] OFF
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([CustomerId], [Name], [EMail], [Password], [Phone], [Address]) VALUES (1, N'neha', N'abc@gmail.com', N'neha', N'9124121522', N'Noida')
INSERT [dbo].[customer] ([CustomerId], [Name], [EMail], [Password], [Phone], [Address]) VALUES (2, N'Devangana', N'zyz@gmail.com', N'Debu', N'925674848', N'Delhi')
INSERT [dbo].[customer] ([CustomerId], [Name], [EMail], [Password], [Phone], [Address]) VALUES (3, N'Noopur', N'abc@gmail.com', N'noop', N'7500807469', N'noida')
INSERT [dbo].[customer] ([CustomerId], [Name], [EMail], [Password], [Phone], [Address]) VALUES (4, N'saurabia', N'saubs2gmail.com', N'saubs', N'78945612', N'Agra')
INSERT [dbo].[customer] ([CustomerId], [Name], [EMail], [Password], [Phone], [Address]) VALUES (1008, N'Book', N'book@book.com', N'123', N'88898', N'noida')
INSERT [dbo].[customer] ([CustomerId], [Name], [EMail], [Password], [Phone], [Address]) VALUES (1009, N'new', N'new@gmail.com', N'123', N'788954655', N'noida')
INSERT [dbo].[customer] ([CustomerId], [Name], [EMail], [Password], [Phone], [Address]) VALUES (1010, N'hi', N'hi@gmail.com', N'123', N'1234567890', N'delhi-23')
INSERT [dbo].[customer] ([CustomerId], [Name], [EMail], [Password], [Phone], [Address]) VALUES (1011, N'sourabh', N'so@123.com', N'123', N'45845', N'delhi-23')
INSERT [dbo].[customer] ([CustomerId], [Name], [EMail], [Password], [Phone], [Address]) VALUES (1012, N'a', N's@123.com', N'1234', N'1234', N'delhi-23')
INSERT [dbo].[customer] ([CustomerId], [Name], [EMail], [Password], [Phone], [Address]) VALUES (1013, N'q', N'new@gmail.com', N'1234', N'21213', N'delhi-23')
INSERT [dbo].[customer] ([CustomerId], [Name], [EMail], [Password], [Phone], [Address]) VALUES (1014, N'w', N'book@book.com', N'123', N'123', N'delhi-23')
INSERT [dbo].[customer] ([CustomerId], [Name], [EMail], [Password], [Phone], [Address]) VALUES (1015, N'e', N'book@book.com', N'123', N'1234', N'delhi-23')
INSERT [dbo].[customer] ([CustomerId], [Name], [EMail], [Password], [Phone], [Address]) VALUES (1016, N'sourabh', N'book@book.com', N'123', N'21213', N'delhi-23')
INSERT [dbo].[customer] ([CustomerId], [Name], [EMail], [Password], [Phone], [Address]) VALUES (1017, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer] ([CustomerId], [Name], [EMail], [Password], [Phone], [Address]) VALUES (1018, N'Book1', N'book@book.com', N'123', N'1223', N'delhi-23')
INSERT [dbo].[customer] ([CustomerId], [Name], [EMail], [Password], [Phone], [Address]) VALUES (1019, N'Book', N'book@book.com', N'123', N'123', N'123')
INSERT [dbo].[customer] ([CustomerId], [Name], [EMail], [Password], [Phone], [Address]) VALUES (1020, N'sourabh', N'abc@gmail.com', N'123', N'6766736747', N'Delhi')
INSERT [dbo].[customer] ([CustomerId], [Name], [EMail], [Password], [Phone], [Address]) VALUES (1028, N'sourabh', N'abc@gmail.com', N'123', N'6766736747', N'Delhi')
INSERT [dbo].[customer] ([CustomerId], [Name], [EMail], [Password], [Phone], [Address]) VALUES (1044, N'Sourabh Raghuwanshi', N'Sourabh@gmail.com', N'123', N'24525', N'Railvihar')
INSERT [dbo].[customer] ([CustomerId], [Name], [EMail], [Password], [Phone], [Address]) VALUES (1045, N'sdfs', N'sdfsd@gmail.com', N'23442', N'2342', N'23523')
INSERT [dbo].[customer] ([CustomerId], [Name], [EMail], [Password], [Phone], [Address]) VALUES (1047, N'werew', N'werew@gmail.com', N'1231', N'123123', N'xgsdde')
INSERT [dbo].[customer] ([CustomerId], [Name], [EMail], [Password], [Phone], [Address]) VALUES (1050, N'Sourabh', N'Sourabh123@gmail.com', N'123', N'8889470449', N'Indirapuram, RailVihar T-Point')
INSERT [dbo].[customer] ([CustomerId], [Name], [EMail], [Password], [Phone], [Address]) VALUES (1051, N'nikks', N'njim21@gmail.com', N'123', N'7500807469', N'25, noida')
INSERT [dbo].[customer] ([CustomerId], [Name], [EMail], [Password], [Phone], [Address]) VALUES (1052, N'nikks', N'book@book.com', N'123', N'7500807469', N'block E sector 41 noida')
INSERT [dbo].[customer] ([CustomerId], [Name], [EMail], [Password], [Phone], [Address]) VALUES (1053, N'nikks', N'book@book.com', N'123', N'7500807469', N'block E sector 41 noida')
INSERT [dbo].[customer] ([CustomerId], [Name], [EMail], [Password], [Phone], [Address]) VALUES (1054, N'Noopur Sharma', N'noopur123@gmail.com', N'123', N'8889470449', N'E-167,Block-E,Sector 41')
SET IDENTITY_INSERT [dbo].[customer] OFF
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (4, 1, 2, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (4, 2, 3, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (5, 1, 4, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (5, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (6, 1, 4, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (6, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (7, 1011, 4, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (7, 1012, 2, 1265.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (10, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (12, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (12, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (12, 3, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (13, 1, 2, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (13, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (14, 1, 2, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (14, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (14, 1011, 1, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (14, 1012, 1, 1265.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (15, 1, 4, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (15, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (16, 1, 2, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (16, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (17, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (17, 2, 2, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (18, 1011, 1, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (18, 1012, 1, 1265.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (19, 1011, 1, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (19, 1012, 1, 1265.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (19, 1024, 1, 25000.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (20, 1012, 2, 1265.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (21, 1012, 2, 1265.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (22, 1, 2, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (22, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (23, 1, 2, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (24, 1, 2, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (25, 1, 2, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (25, 1011, 1, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (25, 1017, 1, 1000.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (27, 1011, 2, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (27, 1017, 2, 1000.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (28, 1011, 2, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (28, 1017, 2, 1000.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (29, 1011, 2, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (29, 1017, 2, 1000.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (30, 1011, 1, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (31, 1011, 1, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (32, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (33, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (34, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (35, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (36, 1, 3, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (36, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (36, 3, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (37, 1, 2, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (37, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (38, 1, 4, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (38, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (39, 1, 4, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (39, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (40, 1, 4, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (40, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (41, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (42, 1, 2, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (42, 2, 3, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (43, 1, 2, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (44, 1, 2, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (45, 1, 2, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (46, 1, 2, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (57, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (57, 4, 1, 400.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (58, 1005, 1, 2500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (58, 1006, 1, 3000.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (59, 1, 3, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (59, 2, 4, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (63, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (73, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (73, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (74, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (74, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (74, 1005, 1, 2500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (78, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (79, 1011, 1, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (80, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (80, 1011, 1, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (81, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (82, 1, 2, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (83, 1, 2, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (84, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (84, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (85, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (85, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (86, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (86, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (87, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (87, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (88, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (88, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (89, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (89, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (90, 1, 1, 500.0000)
GO
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (90, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (91, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (91, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (92, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (92, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (93, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (93, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (94, 1030, 1, 76000.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (95, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (96, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (97, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (98, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (99, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (100, 1020, 5, 321.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (101, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (102, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (103, 1011, 1, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (103, 1012, 1, 1265.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (104, 1011, 1, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (104, 1012, 1, 1265.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (105, 1011, 1, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (105, 1012, 1, 1265.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (106, 1011, 1, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (106, 1012, 1, 1265.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (107, 1011, 1, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (107, 1012, 1, 1265.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (108, 1011, 1, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (108, 1012, 1, 1265.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (109, 1011, 1, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (109, 1012, 1, 1265.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (110, 1011, 1, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (110, 1012, 1, 1265.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (111, 1011, 1, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (111, 1012, 1, 1265.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (112, 1011, 1, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (112, 1012, 1, 1265.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (113, 1011, 1, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (113, 1012, 1, 1265.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (114, 1011, 1, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (114, 1012, 1, 1265.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (115, 1011, 1, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (115, 1012, 1, 1265.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (116, 1011, 1, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (116, 1012, 1, 1265.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (117, 1011, 1, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (117, 1012, 1, 1265.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (118, 1011, 1, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (118, 1012, 1, 1265.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (119, 1011, 1, 1500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (119, 1012, 1, 1265.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (120, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (121, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (122, 1, 2, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (123, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (124, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (124, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (125, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (125, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (126, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (126, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (127, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (127, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (128, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (128, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (129, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (129, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (130, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (130, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (131, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (131, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (132, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (132, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (133, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (133, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (134, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (134, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (135, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (135, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (136, 1, 1, 500.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (136, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (137, 2, 1, 600.0000)
INSERT [dbo].[orderdetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (138, 1, 2, 500.0000)
SET IDENTITY_INSERT [dbo].[ordertable] ON 

INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (4, 100, CAST(N'2018-11-13' AS Date), 2800, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (5, 100, CAST(N'2018-11-13' AS Date), 2600, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (6, 100, CAST(N'2018-11-13' AS Date), 2600, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (7, 101, CAST(N'2018-11-13' AS Date), 8530, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (8, 0, CAST(N'2018-11-13' AS Date), 1100, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (9, 0, CAST(N'2018-11-13' AS Date), 1100, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (10, 100, CAST(N'2018-11-13' AS Date), 600, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (12, 100, CAST(N'2018-11-13' AS Date), 1700, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (13, 100, CAST(N'2018-11-13' AS Date), 1600, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (14, 100, CAST(N'2018-11-13' AS Date), 4365, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (15, 100, CAST(N'2018-11-13' AS Date), 2600, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (16, 100, CAST(N'2018-11-13' AS Date), 1600, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (17, 100, CAST(N'2018-11-13' AS Date), 1700, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (18, 101, CAST(N'2018-11-14' AS Date), 2765, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (19, 101, CAST(N'2018-11-14' AS Date), 27765, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (20, 101, CAST(N'2018-11-14' AS Date), 2530, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (21, 101, CAST(N'2018-11-14' AS Date), 2530, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (22, 100, CAST(N'2018-11-14' AS Date), 1600, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (23, 100, CAST(N'2018-11-14' AS Date), 1000, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (24, 100, CAST(N'2018-11-14' AS Date), 1000, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (25, 100, CAST(N'2018-11-14' AS Date), 3500, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (26, 100, CAST(N'2018-11-14' AS Date), 5700, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (27, 101, CAST(N'2018-11-14' AS Date), 5000, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (28, 101, CAST(N'2018-11-14' AS Date), 5000, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (29, 101, CAST(N'2018-11-14' AS Date), 5000, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (30, 101, CAST(N'2018-11-14' AS Date), 1500, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (31, 101, CAST(N'2018-11-14' AS Date), 1500, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (32, 100, CAST(N'2018-11-14' AS Date), 500, 1)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (33, 100, CAST(N'2018-11-14' AS Date), 500, 1)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (34, 100, CAST(N'2018-11-14' AS Date), 500, 1)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (35, 100, CAST(N'2018-11-14' AS Date), 500, 1)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (36, 100, CAST(N'2018-11-14' AS Date), 2700, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (37, 100, CAST(N'2018-11-14' AS Date), 1600, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (38, 100, CAST(N'2018-11-14' AS Date), 2600, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (39, 100, CAST(N'2018-11-14' AS Date), 2600, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (40, 100, CAST(N'2018-11-14' AS Date), 2600, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (41, 100, CAST(N'2018-11-14' AS Date), 500, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (42, 100, CAST(N'2018-11-14' AS Date), 2800, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (43, 100, CAST(N'2018-11-14' AS Date), 1000, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (44, 100, CAST(N'2018-11-14' AS Date), 1000, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (45, 100, CAST(N'2018-11-14' AS Date), 1000, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (46, 100, CAST(N'2018-11-14' AS Date), 1000, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (47, 0, CAST(N'2018-11-14' AS Date), 1600, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (48, 0, CAST(N'2018-11-14' AS Date), 1600, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (49, 0, CAST(N'2018-11-14' AS Date), 2100, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (50, 0, CAST(N'2018-11-14' AS Date), 321, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (51, 0, CAST(N'2018-11-14' AS Date), 2100, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (52, 0, CAST(N'2018-11-14' AS Date), 2100, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (53, 0, CAST(N'2018-11-14' AS Date), 2600, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (54, 0, CAST(N'2018-11-14' AS Date), 3200, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (55, 0, CAST(N'2018-11-14' AS Date), 3700, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (56, 0, CAST(N'2018-11-14' AS Date), 4200, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (57, 100, CAST(N'2018-11-14' AS Date), 900, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (58, 100, CAST(N'2018-11-14' AS Date), 5500, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (59, 100, CAST(N'2018-11-14' AS Date), 3900, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (60, 0, CAST(N'2018-11-14' AS Date), 500, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (61, 0, CAST(N'2018-11-14' AS Date), 1000, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (62, 0, CAST(N'2018-11-14' AS Date), 1500, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (63, 100, CAST(N'2018-11-14' AS Date), 500, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (64, 0, CAST(N'2018-11-14' AS Date), 500, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (65, 0, CAST(N'2018-11-14' AS Date), 1100, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (66, 0, CAST(N'2018-11-14' AS Date), 1100, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (67, 0, CAST(N'2018-11-14' AS Date), 1100, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (68, 0, CAST(N'2018-11-14' AS Date), 1600, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (69, 0, CAST(N'2018-11-14' AS Date), 1600, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (70, 0, CAST(N'2018-11-14' AS Date), 2100, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (71, 0, CAST(N'2018-11-14' AS Date), 2100, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (72, 0, CAST(N'2018-11-14' AS Date), 2600, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (73, 100, CAST(N'2018-11-14' AS Date), 1100, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (74, 100, CAST(N'2018-11-14' AS Date), 3600, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (75, 100, CAST(N'2018-11-14' AS Date), 6100, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (76, 100, CAST(N'2018-11-14' AS Date), 6600, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (77, 100, CAST(N'2018-11-14' AS Date), 9100, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (78, 100, CAST(N'2018-11-14' AS Date), 500, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (79, 101, CAST(N'2018-11-14' AS Date), 1500, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (80, 101, CAST(N'2018-11-14' AS Date), 2100, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (81, 100, CAST(N'2018-11-14' AS Date), 500, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (82, 100, CAST(N'2018-11-15' AS Date), 1000, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (83, 100, CAST(N'2018-11-15' AS Date), 1000, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (84, 100, CAST(N'2018-11-15' AS Date), 1100, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (85, 100, CAST(N'2018-11-15' AS Date), 1100, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (86, 100, CAST(N'2018-11-15' AS Date), 1100, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (87, 100, CAST(N'2018-11-15' AS Date), 1100, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (88, 100, CAST(N'2018-11-15' AS Date), 1100, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (89, 100, CAST(N'2018-11-15' AS Date), 1100, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (90, 100, CAST(N'2018-11-15' AS Date), 1100, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (91, 100, CAST(N'2018-11-15' AS Date), 1100, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (92, 100, CAST(N'2018-11-15' AS Date), 1100, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (93, 100, CAST(N'2018-11-15' AS Date), 1100, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (94, 102, CAST(N'2018-11-15' AS Date), 76000, 1008)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (95, 100, CAST(N'2018-11-15' AS Date), 500, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (96, 100, CAST(N'2018-11-15' AS Date), 500, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (97, 100, CAST(N'2018-11-15' AS Date), 500, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (98, 100, CAST(N'2018-11-15' AS Date), 500, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (99, 100, CAST(N'2018-11-15' AS Date), 500, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (100, 101, CAST(N'2018-11-15' AS Date), 1605, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (101, 100, CAST(N'2018-11-15' AS Date), 500, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (102, 100, CAST(N'2018-11-15' AS Date), 500, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (103, 101, CAST(N'2018-11-15' AS Date), 2765, 1050)
GO
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (104, 101, CAST(N'2018-11-15' AS Date), 2765, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (105, 101, CAST(N'2018-11-15' AS Date), 2765, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (106, 101, CAST(N'2018-11-15' AS Date), 2765, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (107, 101, CAST(N'2018-11-15' AS Date), 2765, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (108, 101, CAST(N'2018-11-15' AS Date), 2765, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (109, 101, CAST(N'2018-11-15' AS Date), 2765, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (110, 101, CAST(N'2018-11-15' AS Date), 2765, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (111, 101, CAST(N'2018-11-15' AS Date), 2765, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (112, 101, CAST(N'2018-11-15' AS Date), 2765, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (113, 101, CAST(N'2018-11-15' AS Date), 2765, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (114, 101, CAST(N'2018-11-15' AS Date), 2765, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (115, 101, CAST(N'2018-11-15' AS Date), 2765, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (116, 101, CAST(N'2018-11-15' AS Date), 2765, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (117, 101, CAST(N'2018-11-15' AS Date), 2765, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (118, 101, CAST(N'2018-11-15' AS Date), 2765, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (119, 101, CAST(N'2018-11-15' AS Date), 2765, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (120, 100, CAST(N'2018-11-15' AS Date), 500, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (121, 100, CAST(N'2018-11-15' AS Date), 500, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (122, 100, CAST(N'2018-11-15' AS Date), 1000, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (123, 100, CAST(N'2018-11-15' AS Date), 500, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (124, 100, CAST(N'2018-11-15' AS Date), 1100, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (125, 100, CAST(N'2018-11-15' AS Date), 1100, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (126, 100, CAST(N'2018-11-15' AS Date), 1100, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (127, 100, CAST(N'2018-11-15' AS Date), 1100, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (128, 100, CAST(N'2018-11-15' AS Date), 1100, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (129, 100, CAST(N'2018-11-15' AS Date), 1100, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (130, 100, CAST(N'2018-11-15' AS Date), 1100, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (131, 100, CAST(N'2018-11-15' AS Date), 1100, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (132, 100, CAST(N'2018-11-15' AS Date), 1100, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (133, 100, CAST(N'2018-11-15' AS Date), 1100, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (134, 100, CAST(N'2018-11-15' AS Date), 1100, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (135, 100, CAST(N'2018-11-15' AS Date), 1100, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (136, 100, CAST(N'2018-11-15' AS Date), 1100, 1050)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (137, 100, CAST(N'2018-11-15' AS Date), 600, 1054)
INSERT [dbo].[ordertable] ([OrderId], [CategoryId], [OrderDate], [TotalAmount], [CustomerId]) VALUES (138, 100, CAST(N'2018-11-15' AS Date), 1000, 1054)
SET IDENTITY_INSERT [dbo].[ordertable] OFF
SET IDENTITY_INSERT [dbo].[payment] ON 

INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6500, 4, N'COD', 2800.0000, CAST(N'2018-11-13' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6501, 5, N'COD', 2600.0000, CAST(N'2018-11-13' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6502, 6, N'COD', 2600.0000, CAST(N'2018-11-13' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6503, 7, N'COD', 8530.0000, CAST(N'2018-11-13' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6504, 10, N'COD', 600.0000, CAST(N'2018-11-13' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6505, 12, N'COD', 1700.0000, CAST(N'2018-11-13' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6506, 13, N'COD', 1600.0000, CAST(N'2018-11-13' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6507, 14, N'COD', 4365.0000, CAST(N'2018-11-13' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6508, 15, N'COD', 2600.0000, CAST(N'2018-11-13' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6509, 16, N'COD', 1600.0000, CAST(N'2018-11-13' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6510, 17, N'COD', 1700.0000, CAST(N'2018-11-13' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6511, 18, N'COD', 2765.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6512, 19, N'COD', 27765.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6513, 20, N'COD', 2530.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6514, 21, N'COD', 2530.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6515, 22, N'COD', 1600.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6516, 23, N'COD', 1000.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6517, 24, N'COD', 1000.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6518, 25, N'COD', 3500.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6519, 27, N'COD', 5000.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6520, 28, N'COD', 5000.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6521, 29, N'COD', 5000.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6522, 30, N'COD', 1500.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6523, 31, N'COD', 1500.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6524, 32, N'COD', 500.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6525, 33, N'COD', 500.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6526, 34, N'COD', 500.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6527, 35, N'COD', 500.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6528, 36, N'COD', 2700.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6529, 37, N'COD', 1600.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6530, 38, N'COD', 2600.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6531, 39, N'COD', 2600.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6532, 40, N'COD', 2600.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6533, 41, N'COD', 500.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6534, 42, N'COD', 2800.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6535, 43, N'COD', 1000.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6536, 44, N'COD', 1000.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6537, 45, N'COD', 1000.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6538, 46, N'COD', 1000.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6539, 57, N'COD', 900.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6540, 58, N'COD', 5500.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6541, 59, N'COD', 3900.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6542, 63, N'COD', 500.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6543, 73, N'COD', 1100.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6544, 74, N'COD', 3600.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6545, 78, N'COD', 500.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6546, 79, N'COD', 1500.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6547, 80, N'COD', 2100.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6548, 81, N'COD', 500.0000, CAST(N'2018-11-14' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6549, 82, N'COD', 1000.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6550, 83, N'COD', 1000.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6551, 84, N'COD', 1100.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6552, 85, N'COD', 1100.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6553, 86, N'COD', 1100.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6554, 87, N'COD', 1100.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6555, 88, N'COD', 1100.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6556, 89, N'COD', 1100.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6557, 90, N'COD', 1100.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6558, 91, N'COD', 1100.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6559, 92, N'COD', 1100.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6560, 93, N'COD', 1100.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6561, 94, N'COD', 76000.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6562, 95, N'COD', 500.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6563, 96, N'COD', 500.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6564, 97, N'COD', 500.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6565, 98, N'COD', 500.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6566, 99, N'COD', 500.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6567, 100, N'COD', 1605.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6568, 101, N'COD', 500.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6569, 102, N'COD', 500.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6570, 103, N'COD', 2765.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6571, 104, N'COD', 2765.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6572, 105, N'COD', 2765.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6573, 106, N'COD', 2765.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6574, 107, N'COD', 2765.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6575, 108, N'COD', 2765.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6576, 109, N'COD', 2765.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6577, 110, N'COD', 2765.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6578, 111, N'COD', 2765.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6579, 112, N'COD', 2765.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6580, 113, N'COD', 2765.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6581, 114, N'COD', 2765.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6582, 115, N'COD', 2765.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6583, 116, N'COD', 2765.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6584, 117, N'COD', 2765.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6585, 118, N'COD', 2765.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6586, 119, N'COD', 2765.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6587, 120, N'COD', 500.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6588, 121, N'COD', 500.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6589, 122, N'COD', 1000.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6590, 123, N'COD', 500.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6591, 124, N'COD', 1100.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6592, 125, N'COD', 1100.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6593, 126, N'COD', 1100.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6594, 127, N'COD', 1100.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6595, 128, N'COD', 1100.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6596, 129, N'COD', 1100.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6597, 130, N'COD', 1100.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6598, 131, N'COD', 1100.0000, CAST(N'2018-11-15' AS Date))
GO
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6599, 132, N'COD', 1100.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6600, 133, N'COD', 1100.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6601, 134, N'COD', 1100.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6602, 135, N'COD', 1100.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6603, 136, N'COD', 1100.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6604, 137, N'COD', 600.0000, CAST(N'2018-11-15' AS Date))
INSERT [dbo].[payment] ([InvoiceId], [OrderId], [Mode], [Amount], [PaymentDate]) VALUES (6605, 138, N'COD', 1000.0000, CAST(N'2018-11-15' AS Date))
SET IDENTITY_INSERT [dbo].[payment] OFF
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1, N'Nike Tshirts', 100, 100, 500.0000, 151, 50, N'https://assets.ajio.com/medias/sys_master/root/hd1/h63/11479174742046/-473Wx593H-460218332-blue-MODEL.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (2, N'Casual Shirt', 100, 100, 600.0000, 269, 60, N'https://images-na.ssl-images-amazon.com/images/I/81s22pZ6-XL._UL1500_.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (3, N'Formal Shirt', 100, 100, 600.0000, 5, 40, N'https://images-na.ssl-images-amazon.com/images/I/81Z74H6xbPL._UY500_.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (4, N'Jeans', 100, 100, 400.0000, 10, 40, N'https://assets.ajio.com/medias/sys_master/root/h39/h90/11446426927134/-473Wx593H-460065922-blue-MODEL.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (5, N'Ethnicc', 100, 100, 300.0000, 3, 37, N'https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/m/g/mgv140.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (6, N'Wedding Wear', 100, 100, 2200.0000, 6, 54, N'https://media.gqindia.com/wp-content/uploads/2017/10/wedding-outfits-top-image-866x487.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1005, N'Formal Shoes', 100, 105, 2500.0000, 3, 43, N'https://images-cdn.azureedge.net/azure/in-resources/9d695974-9771-4356-8ec8-ed1c5dc8f290/Images/ProductImages/Source/VNGS-112%20(01).JPG;width=900')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1006, N'Sports', 100, 105, 3000.0000, 3, 34, N'https://3.imimg.com/data3/PD/JQ/MY-978554/men-s-performance-polo-sportswear-500x500.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1007, N'Casual Shoes', 100, 105, 1900.0000, 2, 25, N'https://ae01.alicdn.com/kf/HTB13PRKRXXXXXcOXVXXq6xXFXXXH/Men-Casual-Shoes-Breathable-Black-Men-Shoes-Casual-Footwear-Loafers-Zapatos-Hombre-Casual-Shoes-Men-Trainers.jpg_640x640.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1008, N'Deodrants', 100, 110, 400.0000, 4, 45, N'https://www.superdrug.com/medias/sys_master/front-prd/front-prd/8920728010782/Nivea-for-Men-Black-White-Deodorant-35-ml-449305.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1009, N'PERFUMS', 100, 110, 900.0000, 2, 33, N'https://n2.sdlcdn.com/imgs/b/s/6/1017559_1-98b36.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1010, N'Track Pants', 100, 125, 1200.0000, 3, 32, N'https://5.imimg.com/data5/TK/CY/MY-15262658/men-track-pants-500x500.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1011, N'Sarees', 101, 130, 1500.0000, -17, 22, N'https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/s/y/syc6347.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1012, N'Top', 101, 130, 1265.0000, -14, 22, N'https://i.ytimg.com/vi/3d2oeIv51x0/maxresdefault.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1017, N'Kurtis', 101, 130, 1000.0000, 2, 22, N'https://i.pinimg.com/236x/7c/30/12/7c3012cd54040a9a18b2251963ff3820--designer-kurtis-designer-sarees.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1020, N'Slippers', 101, 135, 321.0000, 231, 23, N'https://www.ebhfashion.com/wp-content/uploads/2017/08/0092-3TC-08.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1021, N'Skin care', 101, 5130, 2233.0000, 32, 43, N'https://keikolynn.com/wp-content/uploads/2018/03/skin-care-all.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1022, N'Makeup', 101, 5130, 4000.0000, 525, 22, N'https://cdn2.stylecraze.com/wp-content/uploads/2017/01/525-445895788.jpg-Crpd.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1023, N'AIrtficial', 101, 5135, 10000.0000, 20, 25, N'https://cdn.strandofsilk.com/styles/blogx500/s3/rising_demand_for_artificial_jewellery_in_india_2.jpg?itok=25KW6BGM')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1024, N'Lava', 102, 5140, 25000.0000, 2, 2, N'https://static.toiimg.com/photo/63095478/Lava-Z50.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1025, N'Oppo', 102, 5140, 20000.0000, 23, 21, N'https://images-na.ssl-images-amazon.com/images/I/51kC6kkKUeL._SX569_.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1026, N'Nokia', 102, 5140, 15000.0000, 22, 33, N'https://cdn57.androidauthority.net/wp-content/uploads/2018/02/nokia-8-sirocco-840x500.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1027, N'HP', 102, 5145, 40000.0000, 22, 33, N'https://ssl-product-images.www8-hp.com/digmedialib/prodimg/lowres/c05962448.png')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1028, N'Dell', 102, 5145, 45000.0000, 22, 33, N'https://brain-images-ssl.cdn.dixons.com/2/9/10166092/u_10166092.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1029, N'MAC', 102, 5145, 89000.0000, 22, 33, N'https://cdn2.macworld.co.uk/cmsdata/features/3632335/which-mac-to-buy_thumb800.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1030, N'Nikon', 102, 5150, 76000.0000, 21, 33, N'https://cdn.thewirecutter.com/wp-content/uploads/2017/01/entry-level-dslr-nikon-d3400-lowres-4553-570x380.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1031, N'Samsung', 103, 5155, 30000.0000, 22, 33, N'https://rukminim1.flixcart.com/image/832/832/air-conditioner-new/z/c/d/1-5-o-general-split-asga18ftta-original-imadw65fs8pbze7r.jpeg?q=70')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1032, N'Vedicon', 103, 5155, 36000.0000, 22, 33, N'https://i5.walmartimages.ca/images/Large/048/6_1/999999-53818340486_1.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1033, N'Samsung', 103, 5160, 25000.0000, 22, 33, N'https://i5.walmartimages.ca/images/Large/048/6_1/999999-53818340486_1.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1034, N'UltraHD', 103, 5160, 60000.0000, 22, 33, N'https://i5.walmartimages.ca/images/Large/048/6_1/999999-53818340486_1.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1035, N'Usha', 103, 5170, 5000.0000, 22, 33, N'https://www.usha.com/sites/default/files/Product/Decorative/Striker%20Galaxy%20Bright%20Gold/striker-galaxy-bright-gold.png')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1036, N'Samsung', 103, 5175, 30000.0000, 22, 43, N'https://www.ikea.com/ie/en/images/products/avkyld-integrated-fridge-a-white__0280272_pe419220_s5.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1037, N'Top', 104, 5180, 800.0000, 22, 33, N'https://www.dhresource.com/0x0s/f2-albu-g3-M01-93-03-rBVaHVVsazuAUZbIAAFQWBoVuQI684.jpg/new-fashion-girls-t-shirt-kids-tops-short.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1038, N'Bottom', 104, 5180, 2000.0000, 22, 33, N'https://i.pinimg.com/originals/9b/b4/85/9bb485052f338707b9fc417f06e67a85.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1039, N'Romantic', 106, 5195, 900.0000, 22, 33, N'https://www.booktopia.com.au/blog/wp-content/uploads/2017/05/Escaping-Mr-Right.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1040, N'Horro', 106, 5195, 678.0000, 22, 33, N'https://images.gr-assets.com/books/1328815916l/10644822.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1041, N'Inspirational', 106, 5195, 564.0000, 22, 33, N'https://rukminim1.flixcart.com/image/612/612/jbdys280/book/7/4/3/life-without-limits-inspiration-for-a-ridiculously-good-life-original-imafyhh28gghzgd8.jpeg?q=70')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1042, N'Novel', 106, 5195, 999.0000, 22, 33, N'https://images-na.ssl-images-amazon.com/images/I/51OleTwuSIL._SX325_BO1,204,203,200_.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1043, N'Mixer grinder', 105, 5190, 12000.0000, 3, 4, N'https://images-na.ssl-images-amazon.com/images/I/618MpZPlbnL._SL1500_.jpg')
INSERT [dbo].[product] ([ProductId], [Title], [CategoryId], [SubCategoryId], [Price], [Quantity], [ReorderLevel], [Image]) VALUES (1044, N'Cadbury', 107, 5205, 250.0000, 32, 32, N'https://images-na.ssl-images-amazon.com/images/I/71AclTBSD-L._SL1500_.jpg')
SET IDENTITY_INSERT [dbo].[product] OFF
SET IDENTITY_INSERT [dbo].[subcategory] ON 

INSERT [dbo].[subcategory] ([SubCategoryId], [CategoryId], [SubCategoryName]) VALUES (100, 100, N'Clothings')
INSERT [dbo].[subcategory] ([SubCategoryId], [CategoryId], [SubCategoryName]) VALUES (105, 100, N'Footwear')
INSERT [dbo].[subcategory] ([SubCategoryId], [CategoryId], [SubCategoryName]) VALUES (110, 100, N'Men''s Grooming')
INSERT [dbo].[subcategory] ([SubCategoryId], [CategoryId], [SubCategoryName]) VALUES (125, 100, N'Sport''s Wear')
INSERT [dbo].[subcategory] ([SubCategoryId], [CategoryId], [SubCategoryName]) VALUES (130, 101, N'W Clothing')
INSERT [dbo].[subcategory] ([SubCategoryId], [CategoryId], [SubCategoryName]) VALUES (135, 101, N'FootWear')
INSERT [dbo].[subcategory] ([SubCategoryId], [CategoryId], [SubCategoryName]) VALUES (5130, 101, N'Beauty & Grooming')
INSERT [dbo].[subcategory] ([SubCategoryId], [CategoryId], [SubCategoryName]) VALUES (5135, 101, N'Jewellary')
INSERT [dbo].[subcategory] ([SubCategoryId], [CategoryId], [SubCategoryName]) VALUES (5140, 102, N'Mobiles')
INSERT [dbo].[subcategory] ([SubCategoryId], [CategoryId], [SubCategoryName]) VALUES (5145, 102, N'Laptops')
INSERT [dbo].[subcategory] ([SubCategoryId], [CategoryId], [SubCategoryName]) VALUES (5150, 102, N'Camera')
INSERT [dbo].[subcategory] ([SubCategoryId], [CategoryId], [SubCategoryName]) VALUES (5155, 103, N'AC')
INSERT [dbo].[subcategory] ([SubCategoryId], [CategoryId], [SubCategoryName]) VALUES (5160, 103, N'Tv HD')
INSERT [dbo].[subcategory] ([SubCategoryId], [CategoryId], [SubCategoryName]) VALUES (5170, 103, N'Fan')
INSERT [dbo].[subcategory] ([SubCategoryId], [CategoryId], [SubCategoryName]) VALUES (5175, 103, N'Refrigerator')
INSERT [dbo].[subcategory] ([SubCategoryId], [CategoryId], [SubCategoryName]) VALUES (5180, 104, N'Kids Clothing')
INSERT [dbo].[subcategory] ([SubCategoryId], [CategoryId], [SubCategoryName]) VALUES (5185, 104, N'Toys')
INSERT [dbo].[subcategory] ([SubCategoryId], [CategoryId], [SubCategoryName]) VALUES (5190, 105, N'KItchen & Dinning')
INSERT [dbo].[subcategory] ([SubCategoryId], [CategoryId], [SubCategoryName]) VALUES (5195, 106, N'Books')
INSERT [dbo].[subcategory] ([SubCategoryId], [CategoryId], [SubCategoryName]) VALUES (5205, 107, N'Cadbury')
SET IDENTITY_INSERT [dbo].[subcategory] OFF
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [FK__orderdetail__oid__75A278F5] FOREIGN KEY([OrderId])
REFERENCES [dbo].[ordertable] ([OrderId])
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [FK__orderdetail__oid__75A278F5]
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [FK_orderdetails_product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[product] ([ProductId])
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [FK_orderdetails_product]
GO
ALTER TABLE [dbo].[ordertable]  WITH CHECK ADD  CONSTRAINT [FK_ordertable_customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[customer] ([CustomerId])
GO
ALTER TABLE [dbo].[ordertable] CHECK CONSTRAINT [FK_ordertable_customer]
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD  CONSTRAINT [FK__payment__oid__797309D9] FOREIGN KEY([OrderId])
REFERENCES [dbo].[ordertable] ([OrderId])
GO
ALTER TABLE [dbo].[payment] CHECK CONSTRAINT [FK__payment__oid__797309D9]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK__product__categor__3D5E1FD2] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[category] ([CategoryId])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK__product__categor__3D5E1FD2]
GO
ALTER TABLE [dbo].[subcategory]  WITH CHECK ADD  CONSTRAINT [FK_subcategory_category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[category] ([CategoryId])
GO
ALTER TABLE [dbo].[subcategory] CHECK CONSTRAINT [FK_subcategory_category]
GO
USE [master]
GO
ALTER DATABASE [OnlineShoppingDb] SET  READ_WRITE 
GO
