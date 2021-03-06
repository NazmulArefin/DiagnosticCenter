USE [master]
GO
/****** Object:  Database [DiagnosticBillManagementDB]    Script Date: 04-Nov-16 6:48:43 PM ******/
CREATE DATABASE [DiagnosticBillManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DiagnosticBillManagementDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DiagnosticBillManagementDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DiagnosticBillManagementDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DiagnosticBillManagementDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DiagnosticBillManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DiagnosticBillManagementDB]
GO
/****** Object:  StoredProcedure [dbo].[getPatientTest]    Script Date: 04-Nov-16 6:48:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPatientTest]
@patientId int
AS
SELECT p.Name,t.TestName, t.Fee FROM PatientTable p
JOIN TestPatient pt
ON p.Id = pt.Patient
JOIN TestTable t
ON pt.Test = t.Id
WHERE p.Id = @patientId

GO
/****** Object:  StoredProcedure [dbo].[getTest]    Script Date: 04-Nov-16 6:48:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[getTest]
as
Begin
	select Id, TestName, Fee from TestTable
End
GO
/****** Object:  StoredProcedure [dbo].[getTestName]    Script Date: 04-Nov-16 6:48:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[getTestName]
as
Begin
	select TestName, Fee from TestTable
End
GO
/****** Object:  Table [dbo].[PatientTable]    Script Date: 04-Nov-16 6:48:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PatientTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[DateOfBirth] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
 CONSTRAINT [PK_ParientTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestPatient]    Script Date: 04-Nov-16 6:48:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestPatient](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Patient] [int] NULL,
	[BillNo] [varchar](50) NULL,
	[Test] [int] NULL,
	[TotalFee] [float] NULL,
	[Date] [date] NULL,
	[Payment] [varchar](50) NULL,
 CONSTRAINT [PK_TestPatient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestTable]    Script Date: 04-Nov-16 6:48:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TestName] [varchar](50) NULL,
	[Fee] [float] NULL,
	[TypeId] [int] NULL,
 CONSTRAINT [PK_TestSetupTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TypeTable]    Script Date: 04-Nov-16 6:48:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TypeTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NULL,
 CONSTRAINT [PK_TypeTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[CountTest]    Script Date: 04-Nov-16 6:48:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[CountTest]
AS 
select Test, count(*) TotalTest from TestPatient 
where Test is not null 
group by Test

GO
/****** Object:  View [dbo].[patientTestBill]    Script Date: 04-Nov-16 6:48:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[patientTestBill]
As
SELECT p.Name, p.DateOfBirth, p.Mobile,  t.TestName Test, t.Fee From PatientTable p
JOIN TestPatient Tp
ON p.Id = Tp.Patient
Join TestTable t
On Tp.Test = t.Id
GO
/****** Object:  View [dbo].[TestType]    Script Date: 04-Nov-16 6:48:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[TestType]
AS
SELECT test.Id, test.TestName, test.Fee, type.TypeName FROM TestTable test
JOIN TypeTable type
ON test.TypeId = type.Id

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ParientTable]    Script Date: 04-Nov-16 6:48:43 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ParientTable] ON [dbo].[PatientTable]
(
	[Mobile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_TestPatient]    Script Date: 04-Nov-16 6:48:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_TestPatient] ON [dbo].[TestPatient]
(
	[BillNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_TestSetupTable]    Script Date: 04-Nov-16 6:48:43 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TestSetupTable] ON [dbo].[TestTable]
(
	[TestName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_TypeTable]    Script Date: 04-Nov-16 6:48:43 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TypeTable] ON [dbo].[TypeTable]
(
	[TypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TestPatient]  WITH CHECK ADD  CONSTRAINT [FK_TestPatient_PatientTable] FOREIGN KEY([Patient])
REFERENCES [dbo].[PatientTable] ([Id])
GO
ALTER TABLE [dbo].[TestPatient] CHECK CONSTRAINT [FK_TestPatient_PatientTable]
GO
ALTER TABLE [dbo].[TestPatient]  WITH CHECK ADD  CONSTRAINT [FK_TestPatient_TestTable] FOREIGN KEY([Test])
REFERENCES [dbo].[TestTable] ([Id])
GO
ALTER TABLE [dbo].[TestPatient] CHECK CONSTRAINT [FK_TestPatient_TestTable]
GO
ALTER TABLE [dbo].[TestTable]  WITH CHECK ADD  CONSTRAINT [FK_TestTable_TypeTable] FOREIGN KEY([TypeId])
REFERENCES [dbo].[TypeTable] ([Id])
GO
ALTER TABLE [dbo].[TestTable] CHECK CONSTRAINT [FK_TestTable_TypeTable]
GO
ALTER TABLE [dbo].[TypeTable]  WITH CHECK ADD  CONSTRAINT [FK_TypeTable_TypeTable] FOREIGN KEY([Id])
REFERENCES [dbo].[TypeTable] ([Id])
GO
ALTER TABLE [dbo].[TypeTable] CHECK CONSTRAINT [FK_TypeTable_TypeTable]
GO
USE [master]
GO
ALTER DATABASE [DiagnosticBillManagementDB] SET  READ_WRITE 
GO
