USE [master]
GO
/****** Object:  Database [GifTest]    Script Date: 02-06-2023 23:27:11 ******/
CREATE DATABASE [GifTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GifTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS02\MSSQL\DATA\GifTest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GifTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS02\MSSQL\DATA\GifTest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GifTest] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GifTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GifTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GifTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GifTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GifTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GifTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [GifTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GifTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GifTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GifTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GifTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GifTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GifTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GifTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GifTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GifTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GifTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GifTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GifTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GifTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GifTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GifTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GifTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GifTest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GifTest] SET  MULTI_USER 
GO
ALTER DATABASE [GifTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GifTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GifTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GifTest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GifTest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GifTest] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GifTest] SET QUERY_STORE = OFF
GO
USE [GifTest]
GO
/****** Object:  Table [dbo].[tblParentStudent]    Script Date: 02-06-2023 23:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblParentStudent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
 CONSTRAINT [PK_tblParentStudent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSchoolClass]    Script Date: 02-06-2023 23:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSchoolClass](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblSchoolClass] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStudentClass]    Script Date: 02-06-2023 23:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStudentClass](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [nvarchar](50) NOT NULL,
	[ClassId] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblStudentClass] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 02-06-2023 23:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[UserType] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblParentStudent] ON 

INSERT [dbo].[tblParentStudent] ([Id], [ParentId], [StudentId]) VALUES (1, 1, 2)
INSERT [dbo].[tblParentStudent] ([Id], [ParentId], [StudentId]) VALUES (2, 4, 3)
INSERT [dbo].[tblParentStudent] ([Id], [ParentId], [StudentId]) VALUES (3, 6, 5)
SET IDENTITY_INSERT [dbo].[tblParentStudent] OFF
GO
SET IDENTITY_INSERT [dbo].[tblSchoolClass] ON 

INSERT [dbo].[tblSchoolClass] ([Id], [Name]) VALUES (1, N'Primary')
INSERT [dbo].[tblSchoolClass] ([Id], [Name]) VALUES (2, N'Secondary')
SET IDENTITY_INSERT [dbo].[tblSchoolClass] OFF
GO
SET IDENTITY_INSERT [dbo].[tblStudentClass] ON 

INSERT [dbo].[tblStudentClass] ([Id], [StudentId], [ClassId]) VALUES (1, N'2', N'Primary')
INSERT [dbo].[tblStudentClass] ([Id], [StudentId], [ClassId]) VALUES (2, N'4', N'2')
SET IDENTITY_INSERT [dbo].[tblStudentClass] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([Id], [FirstName], [LastName], [UserType], [Email], [Phone], [Active]) VALUES (1, N'Dilip', N'Gode', 1, N'Prajwal@7gode@gmail.com', N'9146534755', 1)
INSERT [dbo].[tblUser] ([Id], [FirstName], [LastName], [UserType], [Email], [Phone], [Active]) VALUES (2, N'Prajwal', N'Gode', 2, N'Prajwal27gode@gmail.com', N'9146534722', 1)
INSERT [dbo].[tblUser] ([Id], [FirstName], [LastName], [UserType], [Email], [Phone], [Active]) VALUES (3, N'Atharva', N'Suryawanshi', 2, N'Atharva@gmail.com', N'9797979797', 1)
INSERT [dbo].[tblUser] ([Id], [FirstName], [LastName], [UserType], [Email], [Phone], [Active]) VALUES (4, N'Jitendra', N'Suryawanshi', 1, N'Atharva@gmail.com', N'9797979797', 1)
INSERT [dbo].[tblUser] ([Id], [FirstName], [LastName], [UserType], [Email], [Phone], [Active]) VALUES (5, N'Somu', N'Kokate', 2, N'Somu@gmail.com', N'9797979797', 1)
INSERT [dbo].[tblUser] ([Id], [FirstName], [LastName], [UserType], [Email], [Phone], [Active]) VALUES (6, N'Sharad', N'Kokate', 1, N'Somu@gmail.com', N'9797979797', 1)
SET IDENTITY_INSERT [dbo].[tblUser] OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_GetStudentList]    Script Date: 02-06-2023 23:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[usp_GetStudentList]
 as 
 Begin
SELECT 
		PS.StudentId As 'Id',
		m1.FirstName + m1.LastName AS 'StudentName', 
		m2.FirstName + m2.LastName AS 'ParentName',
		ISNULL(s.Name, 'Not Assignes') AS 'ClassName',
		m2.Email AS 'ParentEmail',
		m2.Phone AS 'ParentMobile',
		m1.Active AS 'Active'
		FROM tblParentStudent AS PS
		INNER JOIN 
		tblUser AS m1 ON PS.StudentId = m1.Id 
		INNER JOIN
		tblUser AS m2 ON PS.ParentId = m2.Id
		INNER JOIN
		tblStudentClass AS sc ON PS.Id = sc.Id
		left JOIN
		tblSchoolClass AS s ON sc.ClassId = s.Name
End  
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateStudent]    Script Date: 02-06-2023 23:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE Procedure  [dbo].[usp_UpdateStudent]  
(    
@Id int=0,    
@StudentName nvarchar(50)='', 
@ParentEmail nvarchar(50)='',    
@ParentMobile nvarchar(50)='',    
@Active bit=0,
@ClassName nvarchar(50)='',
@ParentName nvarchar(50)='',
@Action nvarchar(50)=''
)    
As        
Begin 
	if @Action = 'Update'
	begin
		declare @studFirstName  nvarchar(50)
		SET @studFirstName = (SELECT top 1 value FROM STRING_SPLIT(@StudentName, ' '))
		declare @studLastName  nvarchar(50)
		SET @studLastName = (SELECT value FROM (SELECT value, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) idx FROM STRING_SPLIT(@StudentName, ' ') ) t WHERE idx=2)
		 Update tblUser set FirstName=@studFirstName, LastName=@studLastName,Email=@ParentEmail,Phone=@ParentMobile,Active=@Active  where Id=@Id;  
		 update tblStudentClass set ClassId=@ClassName  where StudentId=@Id;
		  --update tblParentStudent set ParentId=@ParentName  where StudentId=@Id;   
		SELECT top 1 value FROM STRING_SPLIT('gg hh', ' ')

		SELECT value FROM (SELECT value, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) idx FROM STRING_SPLIT('hh jj', ' ') ) t WHERE idx=2
	end
	else
	begin
	 Update tblUser set Active = @Active where id=@Id
	end
end

GO
USE [master]
GO
ALTER DATABASE [GifTest] SET  READ_WRITE 
GO
