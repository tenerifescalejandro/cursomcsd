USE [carrental]
GO
/****** Object:  Table [dbo].[coches]    Script Date: 31/05/2017 19:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[coches](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[matricula] [nchar](10) NOT NULL,
	[idMarca] [bigint] NOT NULL,
	[idTipoCOmbustible] [bigint] NOT NULL,
	[color] [nchar](20) NULL,
	[cilindrada] [decimal](4, 2) NULL,
	[nPlazas] [smallint] NOT NULL,
	[fechaMatriculacion] [date] NULL,
 CONSTRAINT [PK_coches] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Marcas]    Script Date: 31/05/2017 19:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marcas](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[denominacion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Marcas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TiposCombustible]    Script Date: 31/05/2017 19:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposCombustible](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[denominacion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TiposCombustible] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[V_N_COCHES_POR_MARCA]    Script Date: 31/05/2017 19:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_N_COCHES_POR_MARCA] AS
SELECT M.denominacion as Marca, count(C.id) as nCoches
FROM Marcas M
        LEFT JOIN Coches C on M.id = C.idMarca
GROUP BY M.denominacion
GO
SET IDENTITY_INSERT [dbo].[coches] ON 

INSERT [dbo].[coches] ([id], [matricula], [idMarca], [idTipoCOmbustible], [color], [cilindrada], [nPlazas], [fechaMatriculacion]) VALUES (1, N'TF-1000-BG', 1, 1, N'NEGRO               ', CAST(1.00 AS Decimal(4, 2)), 5, CAST(N'1996-10-12' AS Date))
INSERT [dbo].[coches] ([id], [matricula], [idMarca], [idTipoCOmbustible], [color], [cilindrada], [nPlazas], [fechaMatriculacion]) VALUES (2, N'GC-4587-CC', 1, 2, N'ROJO                ', CAST(20.00 AS Decimal(4, 2)), 2, CAST(N'2011-01-23' AS Date))
INSERT [dbo].[coches] ([id], [matricula], [idMarca], [idTipoCOmbustible], [color], [cilindrada], [nPlazas], [fechaMatriculacion]) VALUES (3, N'BBD6998   ', 2, 2, N'AMARILLO            ', CAST(1.50 AS Decimal(4, 2)), 4, CAST(N'2003-05-14' AS Date))
SET IDENTITY_INSERT [dbo].[coches] OFF
SET IDENTITY_INSERT [dbo].[Marcas] ON 

INSERT [dbo].[Marcas] ([id], [denominacion]) VALUES (1, N'SEAT')
INSERT [dbo].[Marcas] ([id], [denominacion]) VALUES (2, N'TOYOTA')
INSERT [dbo].[Marcas] ([id], [denominacion]) VALUES (3, N'FERRARI')
INSERT [dbo].[Marcas] ([id], [denominacion]) VALUES (4, N'MERCEDES-BENZ')
SET IDENTITY_INSERT [dbo].[Marcas] OFF
SET IDENTITY_INSERT [dbo].[TiposCombustible] ON 

INSERT [dbo].[TiposCombustible] ([id], [denominacion]) VALUES (1, N'gasolina')
INSERT [dbo].[TiposCombustible] ([id], [denominacion]) VALUES (2, N'diesel')
INSERT [dbo].[TiposCombustible] ([id], [denominacion]) VALUES (3, N'hibrido')
INSERT [dbo].[TiposCombustible] ([id], [denominacion]) VALUES (4, N'electrico')
INSERT [dbo].[TiposCombustible] ([id], [denominacion]) VALUES (5, N'hidrogeno')
SET IDENTITY_INSERT [dbo].[TiposCombustible] OFF
ALTER TABLE [dbo].[coches] ADD  DEFAULT ((5)) FOR [nPlazas]
GO
ALTER TABLE [dbo].[coches]  WITH CHECK ADD  CONSTRAINT [FK_coches_Marcas] FOREIGN KEY([idMarca])
REFERENCES [dbo].[Marcas] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[coches] CHECK CONSTRAINT [FK_coches_Marcas]
GO
ALTER TABLE [dbo].[coches]  WITH CHECK ADD  CONSTRAINT [FK_coches_TiposCombustible] FOREIGN KEY([idTipoCOmbustible])
REFERENCES [dbo].[TiposCombustible] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[coches] CHECK CONSTRAINT [FK_coches_TiposCombustible]
GO
