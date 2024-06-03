USE [master]
GO
/****** Object:  Database [WorkyDB]    Script Date: 20/5/2024 11:40:24 ******/
CREATE DATABASE [WorkyDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WorkyDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\WorkyDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WorkyDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\WorkyDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [WorkyDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WorkyDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WorkyDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WorkyDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WorkyDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WorkyDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WorkyDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [WorkyDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WorkyDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WorkyDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WorkyDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WorkyDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WorkyDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WorkyDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WorkyDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WorkyDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WorkyDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WorkyDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WorkyDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WorkyDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WorkyDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WorkyDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WorkyDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WorkyDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WorkyDB] SET RECOVERY FULL 
GO
ALTER DATABASE [WorkyDB] SET  MULTI_USER 
GO
ALTER DATABASE [WorkyDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WorkyDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WorkyDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WorkyDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WorkyDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WorkyDB', N'ON'
GO
ALTER DATABASE [WorkyDB] SET QUERY_STORE = OFF
GO
USE [WorkyDB]
GO
/****** Object:  User [alumno]    Script Date: 20/5/2024 11:40:24 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 20/5/2024 11:40:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Popularidad] [int] NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chat]    Script Date: 20/5/2024 11:40:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Chat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Disponibilidad]    Script Date: 20/5/2024 11:40:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disponibilidad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Dia] [smallint] NOT NULL,
	[HoraDesde] [date] NOT NULL,
	[HoraHasta] [date] NOT NULL,
	[idServicio] [int] NOT NULL,
 CONSTRAINT [PK_Disponibilidad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Etiquetas]    Script Date: 20/5/2024 11:40:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etiquetas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Etiquetas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EtiquetasPorServicio]    Script Date: 20/5/2024 11:40:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EtiquetasPorServicio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idServicio] [int] NOT NULL,
	[idEtiqueta] [int] NOT NULL,
 CONSTRAINT [PK_EtiquetasPorServicio] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mensaje]    Script Date: 20/5/2024 11:40:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mensaje](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idEmisor] [int] NOT NULL,
	[idReceptor] [int] NOT NULL,
	[Mensaje] [text] NOT NULL,
 CONSTRAINT [PK_Mensaje] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MensajesPorChat]    Script Date: 20/5/2024 11:40:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MensajesPorChat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idMensaje] [int] NOT NULL,
	[idChat] [int] NOT NULL,
 CONSTRAINT [PK_MensajesPorChat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicios]    Script Date: 20/5/2024 11:40:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCreador] [int] NOT NULL,
	[idCategoria] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [text] NOT NULL,
	[Foto] [image] NULL,
	[Precio] [money] NOT NULL,
 CONSTRAINT [PK_Servicios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiciosContratados]    Script Date: 20/5/2024 11:40:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiciosContratados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[idServicio] [int] NOT NULL,
	[HorarioReunion] [date] NOT NULL,
	[Estado] [smallint] NOT NULL,
	[DescripcionProblema] [text] NOT NULL,
	[FotoProblema] [image] NULL,
 CONSTRAINT [PK_ServiciosContratados] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 20/5/2024 11:40:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[verificadoPrestador] [bit] NOT NULL,
	[verificadoContratador] [bit] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[password] [nchar](10) NOT NULL,
	[mail] [varchar](50) NOT NULL,
	[telefono] [varchar](22) NOT NULL,
	[fotoPerfil] [image] NULL,
	[fechaNacimiento] [date] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Chat]  WITH CHECK ADD  CONSTRAINT [FK_Chat_Usuarios] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([id])
GO
ALTER TABLE [dbo].[Chat] CHECK CONSTRAINT [FK_Chat_Usuarios]
GO
ALTER TABLE [dbo].[Disponibilidad]  WITH CHECK ADD  CONSTRAINT [FK_Disponibilidad_Servicios] FOREIGN KEY([idServicio])
REFERENCES [dbo].[Servicios] ([id])
GO
ALTER TABLE [dbo].[Disponibilidad] CHECK CONSTRAINT [FK_Disponibilidad_Servicios]
GO
ALTER TABLE [dbo].[EtiquetasPorServicio]  WITH CHECK ADD  CONSTRAINT [FK_EtiquetasPorServicio_Etiquetas] FOREIGN KEY([idEtiqueta])
REFERENCES [dbo].[Etiquetas] ([id])
GO
ALTER TABLE [dbo].[EtiquetasPorServicio] CHECK CONSTRAINT [FK_EtiquetasPorServicio_Etiquetas]
GO
ALTER TABLE [dbo].[EtiquetasPorServicio]  WITH CHECK ADD  CONSTRAINT [FK_EtiquetasPorServicio_Servicios] FOREIGN KEY([idServicio])
REFERENCES [dbo].[Servicios] ([id])
GO
ALTER TABLE [dbo].[EtiquetasPorServicio] CHECK CONSTRAINT [FK_EtiquetasPorServicio_Servicios]
GO
ALTER TABLE [dbo].[Mensaje]  WITH CHECK ADD  CONSTRAINT [FK_Mensaje_Usuarios] FOREIGN KEY([idEmisor])
REFERENCES [dbo].[Usuarios] ([id])
GO
ALTER TABLE [dbo].[Mensaje] CHECK CONSTRAINT [FK_Mensaje_Usuarios]
GO
ALTER TABLE [dbo].[Mensaje]  WITH CHECK ADD  CONSTRAINT [FK_Mensaje_Usuarios1] FOREIGN KEY([idReceptor])
REFERENCES [dbo].[Usuarios] ([id])
GO
ALTER TABLE [dbo].[Mensaje] CHECK CONSTRAINT [FK_Mensaje_Usuarios1]
GO
ALTER TABLE [dbo].[MensajesPorChat]  WITH CHECK ADD  CONSTRAINT [FK_MensajesPorChat_Chat] FOREIGN KEY([idChat])
REFERENCES [dbo].[Chat] ([id])
GO
ALTER TABLE [dbo].[MensajesPorChat] CHECK CONSTRAINT [FK_MensajesPorChat_Chat]
GO
ALTER TABLE [dbo].[MensajesPorChat]  WITH CHECK ADD  CONSTRAINT [FK_MensajesPorChat_Mensaje] FOREIGN KEY([idMensaje])
REFERENCES [dbo].[Mensaje] ([id])
GO
ALTER TABLE [dbo].[MensajesPorChat] CHECK CONSTRAINT [FK_MensajesPorChat_Mensaje]
GO
ALTER TABLE [dbo].[Servicios]  WITH CHECK ADD  CONSTRAINT [FK_Servicios_Categorias] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categorias] ([id])
GO
ALTER TABLE [dbo].[Servicios] CHECK CONSTRAINT [FK_Servicios_Categorias]
GO
ALTER TABLE [dbo].[Servicios]  WITH CHECK ADD  CONSTRAINT [FK_Servicios_Usuarios] FOREIGN KEY([idCreador])
REFERENCES [dbo].[Usuarios] ([id])
GO
ALTER TABLE [dbo].[Servicios] CHECK CONSTRAINT [FK_Servicios_Usuarios]
GO
ALTER TABLE [dbo].[ServiciosContratados]  WITH CHECK ADD  CONSTRAINT [FK_ServiciosContratados_Servicios] FOREIGN KEY([idServicio])
REFERENCES [dbo].[Servicios] ([id])
GO
ALTER TABLE [dbo].[ServiciosContratados] CHECK CONSTRAINT [FK_ServiciosContratados_Servicios]
GO
ALTER TABLE [dbo].[ServiciosContratados]  WITH CHECK ADD  CONSTRAINT [FK_ServiciosContratados_Usuarios] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([id])
GO
ALTER TABLE [dbo].[ServiciosContratados] CHECK CONSTRAINT [FK_ServiciosContratados_Usuarios]
GO
USE [master]
GO
ALTER DATABASE [WorkyDB] SET  READ_WRITE 
GO
