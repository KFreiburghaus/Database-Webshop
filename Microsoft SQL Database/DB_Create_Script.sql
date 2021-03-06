USE [master]
GO

/****** Object:  Database [Webshop]    Script Date: 20.01.2020 08:22:22 ******/
CREATE DATABASE [Webshop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Webshop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Webshop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Webshop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Webshop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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

ALTER DATABASE [Webshop] SET QUERY_STORE = OFF
GO

ALTER DATABASE [Webshop] SET  READ_WRITE 
GO


