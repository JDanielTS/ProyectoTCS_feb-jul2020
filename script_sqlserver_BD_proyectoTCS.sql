USE [master]
GO
/****** Object:  Database [BDproyectoTCS]    Script Date: 30/05/2020 11:29:27 a. m. ******/
CREATE DATABASE [BDproyectoTCS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDproyectoTCS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BDproyectoTCS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDproyectoTCS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BDproyectoTCS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BDproyectoTCS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDproyectoTCS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDproyectoTCS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDproyectoTCS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDproyectoTCS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDproyectoTCS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDproyectoTCS] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDproyectoTCS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDproyectoTCS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDproyectoTCS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDproyectoTCS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDproyectoTCS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDproyectoTCS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDproyectoTCS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDproyectoTCS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDproyectoTCS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDproyectoTCS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BDproyectoTCS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDproyectoTCS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDproyectoTCS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDproyectoTCS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDproyectoTCS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDproyectoTCS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDproyectoTCS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDproyectoTCS] SET RECOVERY FULL 
GO
ALTER DATABASE [BDproyectoTCS] SET  MULTI_USER 
GO
ALTER DATABASE [BDproyectoTCS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDproyectoTCS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDproyectoTCS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDproyectoTCS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDproyectoTCS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BDproyectoTCS', N'ON'
GO
ALTER DATABASE [BDproyectoTCS] SET QUERY_STORE = OFF
GO
USE [BDproyectoTCS]
GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 30/05/2020 11:29:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargo](
	[nom_cargo] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nom_cargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conductor]    Script Date: 30/05/2020 11:29:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conductor](
	[num_licencia] [varchar](15) NOT NULL,
	[nom_conductor] [varchar](30) NOT NULL,
	[ap_paterno] [varchar](20) NOT NULL,
	[ap_materno] [varchar](20) NULL,
	[fecha_nacim] [date] NOT NULL,
	[num_celular] [varchar](12) NULL,
	[contrasena_conduct] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[num_licencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delegacion]    Script Date: 30/05/2020 11:29:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delegacion](
	[nom_deleg] [varchar](45) NOT NULL,
	[calle_deleg] [varchar](45) NOT NULL,
	[num_deleg] [int] NOT NULL,
	[colonia_deleg] [varchar](45) NOT NULL,
	[codpostal] [varchar](10) NOT NULL,
	[municipio_deleg] [varchar](45) NOT NULL,
	[tel_deleg] [varchar](12) NULL,
	[correo_deleg] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[nom_deleg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dictamen]    Script Date: 30/05/2020 11:29:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dictamen](
	[folio] [int] NOT NULL,
	[descrip_dict] [varchar](250) NULL,
	[Siniestro_idSiniestro] [int] NOT NULL,
	[fechahora_dict] [datetime2](7) NULL,
	[usuario_perito] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[folio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Foto]    Script Date: 30/05/2020 11:29:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foto](
	[idFoto] [int] IDENTITY(1,1) NOT NULL,
	[dir_foto] [varchar](100) NULL,
	[Siniestro_idSiniestro] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idFoto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Participante]    Script Date: 30/05/2020 11:29:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Participante](
	[Vehiculo_num_placa] [varchar](20) NOT NULL,
	[Siniestro_idSiniestro] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Siniestro]    Script Date: 30/05/2020 11:29:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siniestro](
	[idSiniestro] [int] IDENTITY(1,1) NOT NULL,
	[direccion] [varchar](100) NULL,
	[estado] [varchar](12) NULL,
	[Usuario_nombre_usuario] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idSiniestro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 30/05/2020 11:29:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[nombre_usuario] [varchar](20) NOT NULL,
	[contrasena] [varchar](20) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[ap_paterno] [varchar](20) NOT NULL,
	[ap_materno] [varchar](20) NULL,
	[cargo] [varchar](20) NOT NULL,
	[Delegacion_nom_deleg] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nombre_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehiculo]    Script Date: 30/05/2020 11:29:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehiculo](
	[num_placa] [varchar](20) NOT NULL,
	[marca] [varchar](45) NULL,
	[modelo] [varchar](45) NULL,
	[anio] [int] NULL,
	[color] [varchar](15) NULL,
	[nom_aseguradora] [varchar](45) NULL,
	[num_poliza_seguro] [varchar](20) NULL,
	[Conductor_num_licencia] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[num_placa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Dictamen]  WITH CHECK ADD  CONSTRAINT [FK_Dictamen_Siniestro] FOREIGN KEY([Siniestro_idSiniestro])
REFERENCES [dbo].[Siniestro] ([idSiniestro])
GO
ALTER TABLE [dbo].[Dictamen] CHECK CONSTRAINT [FK_Dictamen_Siniestro]
GO
ALTER TABLE [dbo].[Dictamen]  WITH CHECK ADD  CONSTRAINT [FK_Dictamen_Usuario] FOREIGN KEY([usuario_perito])
REFERENCES [dbo].[Usuario] ([nombre_usuario])
GO
ALTER TABLE [dbo].[Dictamen] CHECK CONSTRAINT [FK_Dictamen_Usuario]
GO
ALTER TABLE [dbo].[Foto]  WITH CHECK ADD  CONSTRAINT [FK_Foto_Siniestro] FOREIGN KEY([Siniestro_idSiniestro])
REFERENCES [dbo].[Siniestro] ([idSiniestro])
GO
ALTER TABLE [dbo].[Foto] CHECK CONSTRAINT [FK_Foto_Siniestro]
GO
ALTER TABLE [dbo].[Participante]  WITH CHECK ADD  CONSTRAINT [FK_Participante_Siniestro] FOREIGN KEY([Siniestro_idSiniestro])
REFERENCES [dbo].[Siniestro] ([idSiniestro])
GO
ALTER TABLE [dbo].[Participante] CHECK CONSTRAINT [FK_Participante_Siniestro]
GO
ALTER TABLE [dbo].[Participante]  WITH CHECK ADD  CONSTRAINT [FK_Participante_Vehiculo] FOREIGN KEY([Vehiculo_num_placa])
REFERENCES [dbo].[Vehiculo] ([num_placa])
GO
ALTER TABLE [dbo].[Participante] CHECK CONSTRAINT [FK_Participante_Vehiculo]
GO
ALTER TABLE [dbo].[Siniestro]  WITH CHECK ADD  CONSTRAINT [FK_Siniestro_Usuario] FOREIGN KEY([Usuario_nombre_usuario])
REFERENCES [dbo].[Usuario] ([nombre_usuario])
GO
ALTER TABLE [dbo].[Siniestro] CHECK CONSTRAINT [FK_Siniestro_Usuario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Cargo] FOREIGN KEY([cargo])
REFERENCES [dbo].[Cargo] ([nom_cargo])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Cargo]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Delegacion] FOREIGN KEY([Delegacion_nom_deleg])
REFERENCES [dbo].[Delegacion] ([nom_deleg])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Delegacion]
GO
ALTER TABLE [dbo].[Vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_Vehiculo_Conductor] FOREIGN KEY([Conductor_num_licencia])
REFERENCES [dbo].[Conductor] ([num_licencia])
GO
ALTER TABLE [dbo].[Vehiculo] CHECK CONSTRAINT [FK_Vehiculo_Conductor]
GO
USE [master]
GO
ALTER DATABASE [BDproyectoTCS] SET  READ_WRITE 
GO
