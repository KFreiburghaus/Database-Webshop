USE [master]
GO
/****** Object:  Database [Webshop]    Script Date: 18.01.2020 17:45:55 ******/
CREATE DATABASE [Webshop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Webshop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Webshop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Webshop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Webshop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Webshop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Webshop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Webshop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Webshop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Webshop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Webshop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Webshop] SET ARITHABORT OFF 
GO
ALTER DATABASE [Webshop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Webshop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Webshop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Webshop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Webshop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Webshop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Webshop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Webshop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Webshop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Webshop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Webshop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Webshop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Webshop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Webshop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Webshop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Webshop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Webshop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Webshop] SET RECOVERY FULL 
GO
ALTER DATABASE [Webshop] SET  MULTI_USER 
GO
ALTER DATABASE [Webshop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Webshop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Webshop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Webshop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Webshop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Webshop', N'ON'
GO
ALTER DATABASE [Webshop] SET QUERY_STORE = OFF
GO
USE [Webshop]
GO
/****** Object:  Table [dbo].[Artikel]    Script Date: 18.01.2020 17:45:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artikel](
	[ArtikelID] [bigint] IDENTITY(1,1) NOT NULL,
	[ArtikelBeschreibung] [nvarchar](50) NULL,
	[ArtikelBild] [ntext] NULL,
	[UnterkategorieID] [bigint] NULL,
	[Einkaufspreis] [float] NULL,
	[Verkaufspreis] [float] NULL,
 CONSTRAINT [PK_Artikel] PRIMARY KEY CLUSTERED 
(
	[ArtikelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bestellstatus]    Script Date: 18.01.2020 17:45:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bestellstatus](
	[BestellstatusID] [bigint] IDENTITY(1,1) NOT NULL,
	[Bestellstatus] [nvarchar](50) NULL,
 CONSTRAINT [PK_Bestellstatus] PRIMARY KEY CLUSTERED 
(
	[BestellstatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bestellungen]    Script Date: 18.01.2020 17:45:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bestellungen](
	[BestellID] [bigint] IDENTITY(1,1) NOT NULL,
	[Auftragsnummer] [bigint] NULL,
	[ArtikelID] [bigint] NULL,
	[KundenID] [bigint] NULL,
	[BestellstatusID] [bigint] NULL,
	[BestellZeitpunkt] [datetime2](7) NULL,
	[Bewertung] [int] NULL,
 CONSTRAINT [PK_Bestellungen] PRIMARY KEY CLUSTERED 
(
	[BestellID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kunde]    Script Date: 18.01.2020 17:45:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kunde](
	[KundenID] [bigint] IDENTITY(1,1) NOT NULL,
	[Anrede] [nvarchar](50) NULL,
	[Vorname] [nvarchar](50) NULL,
	[Nachname] [nvarchar](50) NULL,
	[Adresse] [nvarchar](50) NULL,
	[PLZ] [bigint] NULL,
	[Wohnort] [nvarchar](50) NULL,
	[Telefon] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Geburtsdatum] [date] NULL,
	[PreisgruppenID] [bigint] NULL,
 CONSTRAINT [PK_Kunde] PRIMARY KEY CLUSTERED 
(
	[KundenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oberkategorie]    Script Date: 18.01.2020 17:45:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oberkategorie](
	[OberkategorieID] [bigint] IDENTITY(1,1) NOT NULL,
	[OberkategorieBeschreibung] [nvarchar](50) NULL,
 CONSTRAINT [PK_Oberkategorie] PRIMARY KEY CLUSTERED 
(
	[OberkategorieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preisgruppen]    Script Date: 18.01.2020 17:45:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preisgruppen](
	[PreisgruppenID] [bigint] IDENTITY(1,1) NOT NULL,
	[PreisgruppenName] [nvarchar](50) NULL,
	[PreisReduktion] [float] NULL,
 CONSTRAINT [PK_Preisgruppen] PRIMARY KEY CLUSTERED 
(
	[PreisgruppenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unterkategorie]    Script Date: 18.01.2020 17:45:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unterkategorie](
	[UnterkategorieID] [bigint] IDENTITY(1,1) NOT NULL,
	[UnterkategorieBeschreibung] [nvarchar](50) NULL,
	[OberkategorieID] [bigint] NULL,
 CONSTRAINT [PK_Unterkategorie] PRIMARY KEY CLUSTERED 
(
	[UnterkategorieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Artikel]  WITH CHECK ADD  CONSTRAINT [FK_Artikel_Unterkategorie] FOREIGN KEY([UnterkategorieID])
REFERENCES [dbo].[Unterkategorie] ([UnterkategorieID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Artikel] CHECK CONSTRAINT [FK_Artikel_Unterkategorie]
GO
ALTER TABLE [dbo].[Bestellungen]  WITH CHECK ADD  CONSTRAINT [FK_Bestellungen_Artikel] FOREIGN KEY([ArtikelID])
REFERENCES [dbo].[Artikel] ([ArtikelID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bestellungen] CHECK CONSTRAINT [FK_Bestellungen_Artikel]
GO
ALTER TABLE [dbo].[Bestellungen]  WITH CHECK ADD  CONSTRAINT [FK_Bestellungen_Bestellstatus] FOREIGN KEY([BestellstatusID])
REFERENCES [dbo].[Bestellstatus] ([BestellstatusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bestellungen] CHECK CONSTRAINT [FK_Bestellungen_Bestellstatus]
GO
ALTER TABLE [dbo].[Bestellungen]  WITH CHECK ADD  CONSTRAINT [FK_Bestellungen_Kunde] FOREIGN KEY([KundenID])
REFERENCES [dbo].[Kunde] ([KundenID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bestellungen] CHECK CONSTRAINT [FK_Bestellungen_Kunde]
GO
ALTER TABLE [dbo].[Kunde]  WITH CHECK ADD  CONSTRAINT [FK_Kunde_Preisgruppen] FOREIGN KEY([PreisgruppenID])
REFERENCES [dbo].[Preisgruppen] ([PreisgruppenID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Kunde] CHECK CONSTRAINT [FK_Kunde_Preisgruppen]
GO
ALTER TABLE [dbo].[Unterkategorie]  WITH CHECK ADD  CONSTRAINT [FK_Unterkategorie_Oberkategorie] FOREIGN KEY([OberkategorieID])
REFERENCES [dbo].[Oberkategorie] ([OberkategorieID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Unterkategorie] CHECK CONSTRAINT [FK_Unterkategorie_Oberkategorie]
GO
USE [master]
GO
ALTER DATABASE [Webshop] SET  READ_WRITE 
GO
