USE [master]
GO
/****** Object:  Database [WorkyDB]    Script Date: 29/7/2024 10:28:36 ******/
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
/****** Object:  User [alumno]    Script Date: 29/7/2024 10:28:36 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 29/7/2024 10:28:36 ******/
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
/****** Object:  Table [dbo].[Chat]    Script Date: 29/7/2024 10:28:36 ******/
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
/****** Object:  Table [dbo].[Disponibilidad]    Script Date: 29/7/2024 10:28:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disponibilidad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Dia] [smallint] NOT NULL,
	[HoraDesde] [time](7) NOT NULL,
	[HoraHasta] [time](7) NOT NULL,
	[DuracionTurno] [time](7) NOT NULL,
	[Descanso] [time](7) NOT NULL,
	[idServicio] [int] NOT NULL,
 CONSTRAINT [PK_Disponibilidad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Etiquetas]    Script Date: 29/7/2024 10:28:36 ******/
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
/****** Object:  Table [dbo].[EtiquetasPorServicio]    Script Date: 29/7/2024 10:28:36 ******/
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
/****** Object:  Table [dbo].[Mensaje]    Script Date: 29/7/2024 10:28:36 ******/
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
/****** Object:  Table [dbo].[MensajesPorChat]    Script Date: 29/7/2024 10:28:36 ******/
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
/****** Object:  Table [dbo].[Servicios]    Script Date: 29/7/2024 10:28:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCreador] [int] NOT NULL,
	[idCategoria] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
	[Precio] [money] NOT NULL,
	[Foto] [varchar](max) NULL,
 CONSTRAINT [PK_Servicios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiciosContratados]    Script Date: 29/7/2024 10:28:36 ******/
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
	[DescripcionProblema] [varchar](max) NOT NULL,
	[FotoProblema] [varchar](max) NULL,
 CONSTRAINT [PK_ServiciosContratados] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 29/7/2024 10:28:36 ******/
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
	[fechaNacimiento] [date] NOT NULL,
	[fotoPerfil] [varchar](max) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 
GO
INSERT [dbo].[Categorias] ([id], [Nombre], [Popularidad]) VALUES (1, N'Categoria1', 10)
GO
INSERT [dbo].[Categorias] ([id], [Nombre], [Popularidad]) VALUES (2, N'Categoria2', 20)
GO
INSERT [dbo].[Categorias] ([id], [Nombre], [Popularidad]) VALUES (3, N'Categoria3', 30)
GO
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Chat] ON 
GO
INSERT [dbo].[Chat] ([id], [idUsuario]) VALUES (1, 1)
GO
INSERT [dbo].[Chat] ([id], [idUsuario]) VALUES (2, 2)
GO
INSERT [dbo].[Chat] ([id], [idUsuario]) VALUES (3, 3)
GO
SET IDENTITY_INSERT [dbo].[Chat] OFF
GO
SET IDENTITY_INSERT [dbo].[Disponibilidad] ON 
GO
INSERT [dbo].[Disponibilidad] ([id], [Dia], [HoraDesde], [HoraHasta], [DuracionTurno], [Descanso], [idServicio]) VALUES (2, 3, CAST(N'12:00:00' AS Time), CAST(N'20:00:00' AS Time), CAST(N'02:00:00' AS Time), CAST(N'00:30:00' AS Time), 14)
GO
INSERT [dbo].[Disponibilidad] ([id], [Dia], [HoraDesde], [HoraHasta], [DuracionTurno], [Descanso], [idServicio]) VALUES (3, 2, CAST(N'13:30:00' AS Time), CAST(N'17:45:00' AS Time), CAST(N'02:05:00' AS Time), CAST(N'00:30:00' AS Time), 15)
GO
SET IDENTITY_INSERT [dbo].[Disponibilidad] OFF
GO
SET IDENTITY_INSERT [dbo].[Etiquetas] ON 
GO
INSERT [dbo].[Etiquetas] ([id], [Nombre]) VALUES (1, N'Etiqueta1')
GO
INSERT [dbo].[Etiquetas] ([id], [Nombre]) VALUES (2, N'Etiqueta2')
GO
INSERT [dbo].[Etiquetas] ([id], [Nombre]) VALUES (3, N'Etiqueta3')
GO
SET IDENTITY_INSERT [dbo].[Etiquetas] OFF
GO
SET IDENTITY_INSERT [dbo].[EtiquetasPorServicio] ON 
GO
INSERT [dbo].[EtiquetasPorServicio] ([id], [idServicio], [idEtiqueta]) VALUES (1, 1, 1)
GO
INSERT [dbo].[EtiquetasPorServicio] ([id], [idServicio], [idEtiqueta]) VALUES (2, 2, 2)
GO
INSERT [dbo].[EtiquetasPorServicio] ([id], [idServicio], [idEtiqueta]) VALUES (3, 3, 3)
GO
SET IDENTITY_INSERT [dbo].[EtiquetasPorServicio] OFF
GO
SET IDENTITY_INSERT [dbo].[Mensaje] ON 
GO
INSERT [dbo].[Mensaje] ([id], [idEmisor], [idReceptor], [Mensaje]) VALUES (1, 1, 2, N'Mensaje de Usuario1 a Usuario2')
GO
INSERT [dbo].[Mensaje] ([id], [idEmisor], [idReceptor], [Mensaje]) VALUES (2, 2, 3, N'Mensaje de Usuario2 a Usuario3')
GO
INSERT [dbo].[Mensaje] ([id], [idEmisor], [idReceptor], [Mensaje]) VALUES (3, 3, 1, N'Mensaje de Usuario3 a Usuario1')
GO
SET IDENTITY_INSERT [dbo].[Mensaje] OFF
GO
SET IDENTITY_INSERT [dbo].[MensajesPorChat] ON 
GO
INSERT [dbo].[MensajesPorChat] ([id], [idMensaje], [idChat]) VALUES (1, 1, 1)
GO
INSERT [dbo].[MensajesPorChat] ([id], [idMensaje], [idChat]) VALUES (2, 2, 2)
GO
INSERT [dbo].[MensajesPorChat] ([id], [idMensaje], [idChat]) VALUES (3, 3, 3)
GO
SET IDENTITY_INSERT [dbo].[MensajesPorChat] OFF
GO
SET IDENTITY_INSERT [dbo].[Servicios] ON 
GO
INSERT [dbo].[Servicios] ([id], [idCreador], [idCategoria], [Nombre], [Descripcion], [Precio], [Foto]) VALUES (1, 1, 1, N'Servicio1', N'Descripcion1', 100.0000, NULL)
GO
INSERT [dbo].[Servicios] ([id], [idCreador], [idCategoria], [Nombre], [Descripcion], [Precio], [Foto]) VALUES (2, 2, 2, N'Servicio actualizado', N'Descripción del nuevo servicio', 150.0000, NULL)
GO
INSERT [dbo].[Servicios] ([id], [idCreador], [idCategoria], [Nombre], [Descripcion], [Precio], [Foto]) VALUES (3, 3, 3, N'Servicio3', N'Descripcion3', 300.0000, NULL)
GO
INSERT [dbo].[Servicios] ([id], [idCreador], [idCategoria], [Nombre], [Descripcion], [Precio], [Foto]) VALUES (4, 1, 1, N'Nuevo Servicio', N'Descripción del nuevo servicio', 150.0000, NULL)
GO
INSERT [dbo].[Servicios] ([id], [idCreador], [idCategoria], [Nombre], [Descripcion], [Precio], [Foto]) VALUES (5, 1, 1, N'a', N'a', 200.0000, NULL)
GO
INSERT [dbo].[Servicios] ([id], [idCreador], [idCategoria], [Nombre], [Descripcion], [Precio], [Foto]) VALUES (6, 1, 1, N'Nuevo Servicio', N'Descripción del nuevo servicio', 150.0000, NULL)
GO
INSERT [dbo].[Servicios] ([id], [idCreador], [idCategoria], [Nombre], [Descripcion], [Precio], [Foto]) VALUES (7, 1, 1, N'Nuevo Servicio', N'Descripción del nuevo servicio', 150.0000, NULL)
GO
INSERT [dbo].[Servicios] ([id], [idCreador], [idCategoria], [Nombre], [Descripcion], [Precio], [Foto]) VALUES (8, 1, 1, N'Nuevo Servicio', N'Descripción del nuevo servicio', 150.0000, NULL)
GO
INSERT [dbo].[Servicios] ([id], [idCreador], [idCategoria], [Nombre], [Descripcion], [Precio], [Foto]) VALUES (9, 1, 1, N'Nuevo Servicio', N'Descripción del nuevo servicio', 150.0000, NULL)
GO
INSERT [dbo].[Servicios] ([id], [idCreador], [idCategoria], [Nombre], [Descripcion], [Precio], [Foto]) VALUES (10, 1, 1, N'Nuevo Servicio', N'Descripción del nuevo servicio', 150.0000, NULL)
GO
INSERT [dbo].[Servicios] ([id], [idCreador], [idCategoria], [Nombre], [Descripcion], [Precio], [Foto]) VALUES (11, 1, 1, N'Nuevo Servicio', N'Descripción del nuevo servicio', 150.0000, NULL)
GO
INSERT [dbo].[Servicios] ([id], [idCreador], [idCategoria], [Nombre], [Descripcion], [Precio], [Foto]) VALUES (12, 1, 1, N'Servicio Ejemplo', N'Descripcion del servicio ejemplo', 100.0000, NULL)
GO
INSERT [dbo].[Servicios] ([id], [idCreador], [idCategoria], [Nombre], [Descripcion], [Precio], [Foto]) VALUES (14, 1, 1, N'URIAS', N'WHAT THE HEEEELL OOOOMAAAGAAAD WOooOOooOOOO', 10.0000, NULL)
GO
INSERT [dbo].[Servicios] ([id], [idCreador], [idCategoria], [Nombre], [Descripcion], [Precio], [Foto]) VALUES (15, 1, 1, N'Servicio expertos bob', N'POLIMARDO PEZZUTI BUENARDOPOLIS', 120.0000, NULL)
GO
SET IDENTITY_INSERT [dbo].[Servicios] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiciosContratados] ON 
GO
INSERT [dbo].[ServiciosContratados] ([id], [idUsuario], [idServicio], [HorarioReunion], [Estado], [DescripcionProblema], [FotoProblema]) VALUES (1, 1, 1, CAST(N'2024-06-24' AS Date), 1, N'Descripcion del problema 1', NULL)
GO
INSERT [dbo].[ServiciosContratados] ([id], [idUsuario], [idServicio], [HorarioReunion], [Estado], [DescripcionProblema], [FotoProblema]) VALUES (2, 2, 2, CAST(N'2024-06-25' AS Date), 0, N'Descripcion del problema 2', NULL)
GO
INSERT [dbo].[ServiciosContratados] ([id], [idUsuario], [idServicio], [HorarioReunion], [Estado], [DescripcionProblema], [FotoProblema]) VALUES (3, 3, 3, CAST(N'2024-06-26' AS Date), 1, N'Descripcion del problema 3', NULL)
GO
SET IDENTITY_INSERT [dbo].[ServiciosContratados] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 
GO
INSERT [dbo].[Usuarios] ([id], [verificadoPrestador], [verificadoContratador], [Nombre], [password], [mail], [telefono], [fechaNacimiento], [fotoPerfil]) VALUES (1, 1, 1, N'Usuario1', N'password1 ', N'usuario1@mail.com', N'1234567890', CAST(N'1980-01-01' AS Date), NULL)
GO
INSERT [dbo].[Usuarios] ([id], [verificadoPrestador], [verificadoContratador], [Nombre], [password], [mail], [telefono], [fechaNacimiento], [fotoPerfil]) VALUES (2, 0, 1, N'Usuario2', N'password2 ', N'usuario2@mail.com', N'0987654321', CAST(N'1990-02-02' AS Date), NULL)
GO
INSERT [dbo].[Usuarios] ([id], [verificadoPrestador], [verificadoContratador], [Nombre], [password], [mail], [telefono], [fechaNacimiento], [fotoPerfil]) VALUES (3, 1, 0, N'Usuario3', N'password3 ', N'usuario3@mail.com', N'1122334455', CAST(N'2000-03-03' AS Date), NULL)
GO
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
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
