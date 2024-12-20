USE [DBPrueba]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 5/11/2024 2:34:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](200) NOT NULL,
	[identificacion] [varchar](20) NOT NULL,
	[direccion] [varchar](200) NOT NULL,
	[telefono] [varchar](10) NOT NULL,
	[email] [varchar](200) NOT NULL,
	[fechaRegistro] [datetime] NULL,
	[estado] [char](10) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 5/11/2024 2:34:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[idfactura] [int] IDENTITY(1,1) NOT NULL,
	[usernameVendedor] [varchar](200) NOT NULL,
	[identificacion] [varchar](20) NOT NULL,
	[estado] [varchar](10) NULL,
	[fechaRegistro] [datetime] NULL,
	[total] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[idfactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacturaDet]    Script Date: 5/11/2024 2:34:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturaDet](
	[idfacturaDet] [int] IDENTITY(1,1) NOT NULL,
	[idfacturaCab] [int] NULL,
	[codigo] [varchar](20) NULL,
	[subtotal] [decimal](18, 4) NULL,
	[cantidad] [int] NULL,
	[fechaRegistro] [datetime] NULL,
	[estado] [varchar](10) NULL,
 CONSTRAINT [PK_FacturaDet] PRIMARY KEY CLUSTERED 
(
	[idfacturaDet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 5/11/2024 2:34:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[idproducto] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NOT NULL,
	[nombreProducto] [varchar](200) NOT NULL,
	[estado] [char](10) NOT NULL,
	[fechaRegistro] [datetime] NULL,
	[precio] [decimal](18, 4) NULL,
	[costo] [decimal](18, 4) NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 5/11/2024 2:34:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idusuario] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](200) NOT NULL,
	[apellidos] [varchar](200) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[email] [varchar](200) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[confirmacionPassword] [varchar](50) NOT NULL,
	[estado] [varchar](15) NOT NULL,
	[fechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([idCliente], [nombre], [identificacion], [direccion], [telefono], [email], [fechaRegistro], [estado]) VALUES (3, N'leo', N'0745612398          ', N'mila', N'0978461254', N'leo@gmail.com', CAST(N'2024-11-03T11:16:24.337' AS DateTime), N'Inactivo  ')
INSERT [dbo].[Cliente] ([idCliente], [nombre], [identificacion], [direccion], [telefono], [email], [fechaRegistro], [estado]) VALUES (2, N'leo', N'0927854755          ', N'Milagro', N'0978461254', N'leo@gmail.com', CAST(N'2024-11-03T11:06:36.923' AS DateTime), N'Inactivo  ')
INSERT [dbo].[Cliente] ([idCliente], [nombre], [identificacion], [direccion], [telefono], [email], [fechaRegistro], [estado]) VALUES (1, N'Leo Mancero', N'0927957498          ', N'Milagro', N'0000000000', N'leo@gmail.com', CAST(N'2024-10-30T13:58:06.607' AS DateTime), N'Inactivo  ')
INSERT [dbo].[Cliente] ([idCliente], [nombre], [identificacion], [direccion], [telefono], [email], [fechaRegistro], [estado]) VALUES (4, N'karen Soriano', N'0978745612          ', N'Milagro', N'0978461254', N'leo@gmail.com', CAST(N'2024-11-03T11:17:35.057' AS DateTime), N'ACTIVO    ')
INSERT [dbo].[Cliente] ([idCliente], [nombre], [identificacion], [direccion], [telefono], [email], [fechaRegistro], [estado]) VALUES (5, N'leo', N'123456789           ', N'Milagro', N'0978461254', N'leo@gmail.com', CAST(N'2024-11-03T12:56:06.710' AS DateTime), N'ACTIVO    ')
INSERT [dbo].[Cliente] ([idCliente], [nombre], [identificacion], [direccion], [telefono], [email], [fechaRegistro], [estado]) VALUES (6, N'karen', N'1234567890          ', N'Milagro', N'0978461254', N'leo@gmail.com', CAST(N'2024-11-03T13:32:53.980' AS DateTime), N'ACTIVO    ')
INSERT [dbo].[Cliente] ([idCliente], [nombre], [identificacion], [direccion], [telefono], [email], [fechaRegistro], [estado]) VALUES (7, N'asdasdsa', N'1234567891          ', N'Milagro', N'0978461254', N'leo@gmail.com', CAST(N'2024-11-03T14:11:22.903' AS DateTime), N'ACTIVO    ')
INSERT [dbo].[Cliente] ([idCliente], [nombre], [identificacion], [direccion], [telefono], [email], [fechaRegistro], [estado]) VALUES (8, N'leo', N'1234567892          ', N'Milagro', N'0000000000', N'leo@gmail.com', CAST(N'2024-11-03T14:12:55.290' AS DateTime), N'ACTIVO    ')
INSERT [dbo].[Cliente] ([idCliente], [nombre], [identificacion], [direccion], [telefono], [email], [fechaRegistro], [estado]) VALUES (9, N'leo', N'1234567893          ', N'Milagro', N'0978461254', N'leo@gmail.com', CAST(N'2024-11-03T14:13:47.823' AS DateTime), N'ACTIVO    ')
INSERT [dbo].[Cliente] ([idCliente], [nombre], [identificacion], [direccion], [telefono], [email], [fechaRegistro], [estado]) VALUES (10, N'leo', N'1234567894          ', N'Milagro', N'0978461254', N'leo@gmail.com', CAST(N'2024-11-03T14:14:40.807' AS DateTime), N'ACTIVO    ')
INSERT [dbo].[Cliente] ([idCliente], [nombre], [identificacion], [direccion], [telefono], [email], [fechaRegistro], [estado]) VALUES (11, N'leo', N'1234567896          ', N'Milagro', N'0978461254', N'leo@gmail.com', CAST(N'2024-11-03T14:15:17.487' AS DateTime), N'ACTIVO    ')
INSERT [dbo].[Cliente] ([idCliente], [nombre], [identificacion], [direccion], [telefono], [email], [fechaRegistro], [estado]) VALUES (12, N'leo', N'1234567897          ', N'Milagro', N'0978461254', N'leo@gmail.com', CAST(N'2024-11-03T14:31:25.137' AS DateTime), N'ACTIVO    ')
INSERT [dbo].[Cliente] ([idCliente], [nombre], [identificacion], [direccion], [telefono], [email], [fechaRegistro], [estado]) VALUES (13, N'leo', N'1234567898          ', N'Milagro', N'0978461254', N'leo@gmail.com', CAST(N'2024-11-03T14:32:37.413' AS DateTime), N'ACTIVO    ')
INSERT [dbo].[Cliente] ([idCliente], [nombre], [identificacion], [direccion], [telefono], [email], [fechaRegistro], [estado]) VALUES (14, N'string', N'string              ', N'string', N'string', N'string', CAST(N'2024-11-04T21:51:41.460' AS DateTime), N'ACTIVO    ')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Factura] ON 

INSERT [dbo].[Factura] ([idfactura], [usernameVendedor], [identificacion], [estado], [fechaRegistro], [total]) VALUES (1, N'LMANCERO', N'0745612398', N'ACTIVO', CAST(N'2024-11-05T00:11:33.537' AS DateTime), CAST(4.55 AS Decimal(18, 2)))
INSERT [dbo].[Factura] ([idfactura], [usernameVendedor], [identificacion], [estado], [fechaRegistro], [total]) VALUES (2, N'LMANCERO', N'0745612398', N'ACTIVO', CAST(N'2024-11-05T00:16:02.253' AS DateTime), CAST(7.05 AS Decimal(18, 2)))
INSERT [dbo].[Factura] ([idfactura], [usernameVendedor], [identificacion], [estado], [fechaRegistro], [total]) VALUES (3, N'LMANCERO', N'0745612398', N'ACTIVO', CAST(N'2024-11-05T00:19:17.310' AS DateTime), CAST(7.05 AS Decimal(18, 2)))
INSERT [dbo].[Factura] ([idfactura], [usernameVendedor], [identificacion], [estado], [fechaRegistro], [total]) VALUES (4, N'LMANCERO', N'0745612398', N'ACTIVO', CAST(N'2024-11-05T00:20:45.430' AS DateTime), CAST(7.05 AS Decimal(18, 2)))
INSERT [dbo].[Factura] ([idfactura], [usernameVendedor], [identificacion], [estado], [fechaRegistro], [total]) VALUES (5, N'LMANCERO', N'0745612398', N'ACTIVO', CAST(N'2024-11-05T00:22:08.740' AS DateTime), CAST(7.05 AS Decimal(18, 2)))
INSERT [dbo].[Factura] ([idfactura], [usernameVendedor], [identificacion], [estado], [fechaRegistro], [total]) VALUES (6, N'LMANCERO', N'0745612398', N'ACTIVO', CAST(N'2024-11-05T00:22:28.283' AS DateTime), CAST(4.55 AS Decimal(18, 2)))
INSERT [dbo].[Factura] ([idfactura], [usernameVendedor], [identificacion], [estado], [fechaRegistro], [total]) VALUES (7, N'LMANCERO', N'0745612398', N'ACTIVO', CAST(N'2024-11-05T00:22:46.227' AS DateTime), CAST(2.25 AS Decimal(18, 2)))
INSERT [dbo].[Factura] ([idfactura], [usernameVendedor], [identificacion], [estado], [fechaRegistro], [total]) VALUES (8, N'LMANCERO', N'0927854755', N'ACTIVO', CAST(N'2024-11-05T00:23:55.853' AS DateTime), CAST(2.30 AS Decimal(18, 2)))
INSERT [dbo].[Factura] ([idfactura], [usernameVendedor], [identificacion], [estado], [fechaRegistro], [total]) VALUES (9, N'LMANCERO', N'0745612398', N'ACTIVO', CAST(N'2024-11-05T00:25:21.593' AS DateTime), CAST(4.55 AS Decimal(18, 2)))
INSERT [dbo].[Factura] ([idfactura], [usernameVendedor], [identificacion], [estado], [fechaRegistro], [total]) VALUES (10, N'LMANCERO', N'0745612398', N'ACTIVO', CAST(N'2024-11-05T00:26:19.503' AS DateTime), CAST(4.80 AS Decimal(18, 2)))
INSERT [dbo].[Factura] ([idfactura], [usernameVendedor], [identificacion], [estado], [fechaRegistro], [total]) VALUES (11, N'LMANCERO', N'0745612398', N'ACTIVO', CAST(N'2024-11-05T00:27:08.943' AS DateTime), CAST(2.25 AS Decimal(18, 2)))
INSERT [dbo].[Factura] ([idfactura], [usernameVendedor], [identificacion], [estado], [fechaRegistro], [total]) VALUES (12, N'LMANCERO', N'0745612398', N'ACTIVO', CAST(N'2024-11-05T01:55:36.513' AS DateTime), CAST(7.05 AS Decimal(18, 2)))
INSERT [dbo].[Factura] ([idfactura], [usernameVendedor], [identificacion], [estado], [fechaRegistro], [total]) VALUES (13, N'LMANCERO', N'0745612398', N'ACTIVO', CAST(N'2024-11-05T01:57:05.947' AS DateTime), CAST(4.55 AS Decimal(18, 2)))
INSERT [dbo].[Factura] ([idfactura], [usernameVendedor], [identificacion], [estado], [fechaRegistro], [total]) VALUES (14, N'LMANCERO', N'0745612398', N'ACTIVO', CAST(N'2024-11-05T01:57:30.177' AS DateTime), CAST(2.25 AS Decimal(18, 2)))
INSERT [dbo].[Factura] ([idfactura], [usernameVendedor], [identificacion], [estado], [fechaRegistro], [total]) VALUES (15, N'LMANCERO', N'0745612398', N'ACTIVO', CAST(N'2024-11-05T01:59:15.110' AS DateTime), CAST(2.25 AS Decimal(18, 2)))
INSERT [dbo].[Factura] ([idfactura], [usernameVendedor], [identificacion], [estado], [fechaRegistro], [total]) VALUES (16, N'LMANCERO', N'0745612398', N'ACTIVO', CAST(N'2024-11-05T02:01:55.480' AS DateTime), CAST(2.25 AS Decimal(18, 2)))
INSERT [dbo].[Factura] ([idfactura], [usernameVendedor], [identificacion], [estado], [fechaRegistro], [total]) VALUES (17, N'LMANCERO', N'0745612398', N'ACTIVO', CAST(N'2024-11-05T02:03:06.850' AS DateTime), CAST(2.25 AS Decimal(18, 2)))
INSERT [dbo].[Factura] ([idfactura], [usernameVendedor], [identificacion], [estado], [fechaRegistro], [total]) VALUES (18, N'LMANCERO', N'0745612398', N'ACTIVO', CAST(N'2024-11-05T02:04:21.867' AS DateTime), CAST(2.25 AS Decimal(18, 2)))
INSERT [dbo].[Factura] ([idfactura], [usernameVendedor], [identificacion], [estado], [fechaRegistro], [total]) VALUES (19, N'LMANCERO', N'0745612398', N'ACTIVO', CAST(N'2024-11-05T02:05:31.893' AS DateTime), CAST(2.25 AS Decimal(18, 2)))
INSERT [dbo].[Factura] ([idfactura], [usernameVendedor], [identificacion], [estado], [fechaRegistro], [total]) VALUES (20, N'LMANCERO', N'0745612398', N'ACTIVO', CAST(N'2024-11-05T02:06:33.777' AS DateTime), CAST(2.25 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Factura] OFF
GO
SET IDENTITY_INSERT [dbo].[FacturaDet] ON 

INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (1, 1, N'00000000004', CAST(2.2500 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T00:11:33.550' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (2, 1, N'0000000002', CAST(2.3000 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T00:11:33.553' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (3, 2, N'00000000004', CAST(2.2500 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T00:16:02.257' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (4, 2, N'0000000002', CAST(2.3000 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T00:16:02.260' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (5, 2, N'0000000003', CAST(2.5000 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T00:16:02.260' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (6, 3, N'00000000004', CAST(2.2500 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T00:19:17.313' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (7, 3, N'0000000002', CAST(2.3000 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T00:19:17.320' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (8, 3, N'0000000003', CAST(2.5000 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T00:19:17.320' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (9, 4, N'00000000004', CAST(2.2500 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T00:20:45.437' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (10, 4, N'0000000002', CAST(2.3000 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T00:20:45.440' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (11, 4, N'0000000003', CAST(2.5000 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T00:20:45.440' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (12, 5, N'00000000004', CAST(2.2500 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T00:22:08.757' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (13, 5, N'0000000002', CAST(2.3000 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T00:22:08.760' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (14, 5, N'0000000003', CAST(2.5000 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T00:22:08.760' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (15, 6, N'00000000004', CAST(2.2500 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T00:22:28.297' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (16, 6, N'0000000002', CAST(2.3000 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T00:22:28.297' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (17, 7, N'00000000004', CAST(2.2500 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T00:22:46.230' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (18, 8, N'0000000002', CAST(2.3000 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T00:23:55.857' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (19, 9, N'00000000004', CAST(2.2500 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T00:25:21.597' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (20, 9, N'0000000002', CAST(2.3000 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T00:25:21.600' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (21, 10, N'0000000002', CAST(2.3000 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T00:26:19.520' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (22, 10, N'0000000003', CAST(2.5000 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T00:26:19.523' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (23, 11, N'00000000004', CAST(2.2500 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T00:27:08.947' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (24, 12, N'00000000004', CAST(2.2500 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T01:55:36.523' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (25, 12, N'0000000002', CAST(2.3000 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T01:55:36.527' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (26, 12, N'0000000003', CAST(2.5000 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T01:55:36.527' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (27, 13, N'00000000004', CAST(2.2500 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T01:57:05.960' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (28, 13, N'0000000002', CAST(2.3000 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T01:57:05.963' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (29, 14, N'00000000004', CAST(2.2500 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T01:57:30.190' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (30, 15, N'00000000004', CAST(2.2500 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T01:59:15.123' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (31, 16, N'00000000004', CAST(2.2500 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T02:01:55.493' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (32, 17, N'00000000004', CAST(2.2500 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T02:03:06.853' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (33, 18, N'00000000004', CAST(2.2500 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T02:04:21.880' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (34, 19, N'00000000004', CAST(2.2500 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T02:05:31.907' AS DateTime), N'ACTIVO')
INSERT [dbo].[FacturaDet] ([idfacturaDet], [idfacturaCab], [codigo], [subtotal], [cantidad], [fechaRegistro], [estado]) VALUES (35, 20, N'00000000004', CAST(2.2500 AS Decimal(18, 4)), 1, CAST(N'2024-11-05T02:06:33.790' AS DateTime), N'ACTIVO')
SET IDENTITY_INSERT [dbo].[FacturaDet] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([idproducto], [codigo], [nombreProducto], [estado], [fechaRegistro], [precio], [costo]) VALUES (4, N'00000000004', N'Producto D', N'Activo    ', CAST(N'2024-11-04T19:01:11.357' AS DateTime), CAST(2.2500 AS Decimal(18, 4)), CAST(1.2500 AS Decimal(18, 4)))
INSERT [dbo].[Producto] ([idproducto], [codigo], [nombreProducto], [estado], [fechaRegistro], [precio], [costo]) VALUES (1, N'0000000001', N'pruducto AB1', N'Inactivo  ', CAST(N'2024-10-30T15:03:39.237' AS DateTime), CAST(3.0000 AS Decimal(18, 4)), CAST(2.0000 AS Decimal(18, 4)))
INSERT [dbo].[Producto] ([idproducto], [codigo], [nombreProducto], [estado], [fechaRegistro], [precio], [costo]) VALUES (2, N'0000000002', N'producto B', N'Activo    ', CAST(N'2024-10-30T15:04:31.827' AS DateTime), CAST(2.3000 AS Decimal(18, 4)), CAST(1.3000 AS Decimal(18, 4)))
INSERT [dbo].[Producto] ([idproducto], [codigo], [nombreProducto], [estado], [fechaRegistro], [precio], [costo]) VALUES (3, N'0000000003', N'Producto C', N'Activo    ', CAST(N'2024-11-04T10:20:58.807' AS DateTime), CAST(2.5000 AS Decimal(18, 4)), CAST(2.2000 AS Decimal(18, 4)))
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idusuario], [nombres], [apellidos], [usuario], [email], [password], [confirmacionPassword], [estado], [fechaRegistro]) VALUES (2, N'leonardo', N'mancero', N'lm', N'leo@gmail.com', N'123', N'123', N'Activo         ', CAST(N'2024-11-04T12:22:05.713' AS DateTime))
INSERT [dbo].[Usuario] ([idusuario], [nombres], [apellidos], [usuario], [email], [password], [confirmacionPassword], [estado], [fechaRegistro]) VALUES (1, N'Leonardo', N'Mancero', N'Lmancero', N'leonardo@gmail.com', N'123456', N'123456', N'Activo         ', CAST(N'2024-10-30T10:06:05.223' AS DateTime))
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Cliente] ADD  CONSTRAINT [DF_Cliente_fechaRegistro]  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Cliente] ADD  CONSTRAINT [DF_Cliente_estado]  DEFAULT ('ACTIVO') FOR [estado]
GO
ALTER TABLE [dbo].[Factura] ADD  CONSTRAINT [DF_Factura_estado]  DEFAULT ('ACTIVO') FOR [estado]
GO
ALTER TABLE [dbo].[Factura] ADD  CONSTRAINT [DF_Factura_fechaRegistro]  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[FacturaDet] ADD  CONSTRAINT [DF_FacturaDet_fechaRegistro]  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[FacturaDet] ADD  CONSTRAINT [DF_FacturaDet_estado]  DEFAULT ('ACTIVO') FOR [estado]
GO
ALTER TABLE [dbo].[Producto] ADD  CONSTRAINT [DF_Producto_fechaRegistro]  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [DF_Usuario_fechaRegistro]  DEFAULT (getdate()) FOR [fechaRegistro]
GO
/****** Object:  StoredProcedure [dbo].[sp_Cliente]    Script Date: 5/11/2024 2:34:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Cliente]
@accion					char(5) ,
@nombre					varchar(200)	= NULL,
@identificacion			char(20)		= NULL,
@direccion				varchar(200)	= NULL,
@telefono				varchar(10)		= NULL,
@email					varchar(200)	= NULL,
@estado					varchar(10)		= NULL

as
BEGIN

DECLARE @mensaje varchar(max),
		@statusCode int,
		@statusOk int=200,
		@statusError int=500

IF @accion ='I'
	BEGIN

	BEGIN TRY
	BEGIN TRANSACTION insertCliente

	IF @identificacion IS NOT NULL
	BEGIN

		IF (SELECT count(1) FROM Cliente WHERE identificacion = @identificacion) = 0
		BEGIN
				INSERT INTO Cliente(nombre,identificacion,direccion,telefono,email)
							Values(@nombre,@identificacion,@direccion,@telefono,@email)

				SET @mensaje ='La Información fue Almacenada Correctamente'
				SET @statusCode= @statusOk
		END
		ELSE
		BEGIN
				SET @mensaje ='Ya existe un Cliente con ese Número de Identificación'
				SET @statusCode= @statusError
		END
	END
	ELSE
	BEGIN
		SET @mensaje ='Error Debe de Ingresar el Número de Identificación'
		SET @statusCode= @statusError
	END

	COMMIT TRANSACTION insertCliente
	END TRY
	BEGIN CATCH
		IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION insertProductos	
		  SET @mensaje = ERROR_MESSAGE()
		  SET @statusCode= @statusError
	   END 
	END CATCH
	END
END

IF @accion ='AC'
BEGIN

	SELECT idCliente,nombre,LTRIM(RTRIM(identificacion)) AS identificacion,direccion,telefono,email,fechaRegistro,LTRIM(RTRIM(estado)) AS estado
	FROM Cliente
END

IF @accion ='C'
BEGIN

	SELECT idCliente,nombre,LTRIM(RTRIM(identificacion)) AS identificacion,direccion,telefono,email,fechaRegistro,LTRIM(RTRIM(estado)) AS estado
	FROM Cliente 
	WHERE identificacion = @identificacion
END

IF @accion = 'U'
BEGIN
	IF @identificacion is not null
	BEGIN

		UPDATE Cliente SET nombre=@nombre,identificacion=@identificacion,direccion=@direccion,telefono=@telefono,email=@email,estado=@estado
		WHERE identificacion=@identificacion
		
		SET @mensaje='La Información del Cliente ha sido Actualizada Correctamente'
		SET @statusCode= @statusOk
	END
	ELSE
	BEGIN
		SET @mensaje='El Número de Identificación es Nulo'
		SET @statusCode= @statusError
	END

END

IF @accion = 'D'
BEGIN
	IF @identificacion is not null
	begin
		UPDATE Cliente 
		SET estado=@estado
		WHERE identificacion = @identificacion

		SET @mensaje='La Información del Cliente ha sido Eliminada Correctamente'
		SET @statusCode= @statusOk
	END
	ELSE
	BEGIN
		SET @mensaje='El Numero de Identificacion es Nulo y No te permite Eliminar'
	END

END

SELECT @mensaje,@statusCode
GO
/****** Object:  StoredProcedure [dbo].[sp_Factura]    Script Date: 5/11/2024 2:34:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Factura]
@accion char(5),
@username varchar(200)			= NULL,
@identificacion varchar(20)		= NULL,
@idCabecera int					= NULL,
@codigo varchar(20)				= NULL,
@subtotal decimal(18,2)			= NULL,
@cantidad int					= NULL
AS
BEGIN

	Declare @idCab int, @tot decimal(18,4),@idDet int

	IF @accion = 'I'
	BEGIN
		BEGIN TRY
		BEGIN TRANSACTION insertCabecera

		INSERT INTO Factura(usernameVendedor,identificacion)
			VALUES(@username,@identificacion)

		SET @idCab = SCOPE_IDENTITY()

		SELECT @idCab

		COMMIT TRANSACTION insertCliente
	END TRY
	BEGIN CATCH
		IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION insertCabecera	
	   END 
	END CATCH
	END

	IF @accion = 'ID'
	BEGIN
		BEGIN TRY
		BEGIN TRANSACTION insertDetalle
 
		select 1
		INSERT INTO FacturaDet(idfacturaCab,codigo,subtotal,cantidad)
			VALUES(@idCabecera,@codigo,@subtotal,@cantidad)

		SELECT @tot = SUM(subtotal) FROM FacturaDet WHERE idfacturaCab = @idCabecera

		update Factura set total = @tot where idfactura=@idCabecera

		set @idDet=SCOPE_IDENTITY()

		select @idDet

		COMMIT TRANSACTION insertDetalle
	END TRY
	BEGIN CATCH
		IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION insertCabecera		  
		  DELETE FROM Factura WHERE idfactura=@idCabecera
	   END 
	END CATCH
	END

	IF @accion ='C'
	BEGIN
		Select a.idfactura,usernameVendedor as username,a.identificacion,b.nombre,a.fechaRegistro,a.total 
		from Factura a 
		inner join Cliente b on a.identificacion=b.identificacion
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Producto]    Script Date: 5/11/2024 2:34:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Producto]
@accion					char(2),
@codigo					varchar(50)			=NULL,
@nombreProducto			varchar(200)		=NULL,
@estado					char(10)			=NULL,
@precio					decimal(18,4)		=NULL,
@costo					decimal(18,4)		=NULL

as
BEGIN

DECLARE @mensaje varchar(max),
		@statusCode int,
		@statusOK int = 200,
		@statusError int = 500

IF @accion ='I'
	BEGIN

	BEGIN TRY
	BEGIN TRANSACTION insertProductos

	IF @precio > @costo
	BEGIN
		IF (SELECT COUNT(1) FROM Producto WHERE codigo = @codigo) = 0
		BEGIN
				INSERT INTO Producto(codigo, nombreProducto,estado,precio,costo)
						Values(@codigo,@nombreProducto,@estado,@precio,@costo)

				SET @mensaje ='La Información fue Almacenada Correctamente'
				SET @statusCode =@statusOK
		END
		ELSE
		BEGIN
				SET @mensaje ='Ya existe un Producto registrado con ese Código'
				SET @statusCode = @statusError
		END
	END
	ELSE
	BEGIN
		SET @mensaje ='Error el Costo es Mayor al Precio.'
		SET @statusCode =@statusError
	END

	COMMIT TRANSACTION insertProductos
	END TRY
	BEGIN CATCH
		IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION insertProductos	
		  SET @mensaje = ERROR_MESSAGE()
	   END 
	END CATCH
	END
END

IF @accion ='C'
BEGIN

	SELECT idproducto,codigo,nombreProducto,RTRIM(LTRIM(estado)) as estado,precio,costo,fechaRegistro
	FROM Producto
	WHERE codigo = @codigo
END

IF @accion ='AC'
BEGIN

	SELECT idproducto,codigo,nombreProducto,RTRIM(LTRIM(estado)) as estado,precio,costo,fechaRegistro
	FROM Producto
	
END

IF @accion = 'U'
BEGIN
	IF @codigo is not null
	BEGIN
		IF (SELECT COUNT(1) FROM Producto WHERE codigo=@codigo) > 0
		BEGIN
			IF @precio > @costo
			BEGIN
				UPDATE Producto SET nombreProducto = @nombreProducto,estado=@estado,precio=@precio,costo = @costo
				WHERE codigo=@codigo

				SET @mensaje ='El Producto fue Actualizado Correctamente.'
				SET @statusCode=@statusOK
			END
			ELSE
			BEGIN
				SET @mensaje ='Error al Actualizar el Costo es Mayor al Precio.'
				SET @statusCode=@statusError
			END
		END
		ELSE
		BEGIN
			SET @mensaje='No exite Producto con ese Código'
			SET @statusCode=@statusOK
		END
	END
	ELSE
	BEGIN
		SET @mensaje='El Codigo del Producto es Nulo y No te permite Actualizar'
		SET @statusCode=@statusError
	END

END

IF @accion = 'D'
BEGIN
	IF @codigo is not null
	BEGIN
		IF (SELECT COUNT(1) FROM Producto WHERE codigo=@codigo) > 0
		BEGIN
			UPDATE Producto 
			SET estado=@estado
			WHERE codigo = @codigo

			SET @mensaje='El Producto ha sido Desactivado Correctamente'
			SET @statusCode=@statusOK
		END
		ELSE
		BEGIN
			SET @mensaje='No exite Producto con ese Código'
			SET @statusCode=@statusOK
		END
	END
	ELSE
	BEGIN
		SET @mensaje='El Codigo de Usuario es Nulo y No te permite Eliminar'
		SET @statusCode=@statusError
	END

END

SELECT @mensaje,@statusCode
GO
/****** Object:  StoredProcedure [dbo].[sp_usuarios]    Script Date: 5/11/2024 2:34:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_usuarios]
@accion					char(2),
@nombre					varchar(200)	= NULL,
@apellidos				varchar(200)	= NULL,
@email					varchar(200)	= NULL,
@password				varchar(50)		= NULL,
@confirmacionPassword	varchar(50)		= NULL,
@idUsuario				int				= NULL,
@estado					char(15)		= NULL,
@usuario				varchar(50)		= NULL
as
BEGIN

DECLARE @mensaje varchar(max),
		@statusCode int,
		@statusOK int = 200,
		@statusError int = 500
		
		

IF @accion ='I'
	BEGIN

	BEGIN TRY
	BEGIN TRANSACTION insertUsuarios

		IF(SELECT count(1) FROM Usuario where Usuario=@usuario) = 0
		BEGIN
			IF(@password = @confirmacionPassword)
			BEGIN
					INSERT INTO Usuario(nombres,apellidos,email,[password],confirmacionPassword,estado,usuario)
							Values(@nombre,@apellidos,@email,@password,@confirmacionPassword,@estado,@usuario)

					SET @mensaje ='La Informacion fue Insertada Correctamente'
					SET @statusCode = @statusOK
			END
			ELSE
			BEGIN
				SET @mensaje ='El Password y la Confirmacion Password No Coinciden'
				SET @statusCode = @statusError
			END			
		END
		ELSE
		BEGIN
				set @mensaje ='Ya existe un Usuario con ese UserName Registrado'
				set @statusCode = @statusError
		END


	COMMIT TRANSACTION insertUsuarios
	END TRY
	BEGIN CATCH
		IF (@@TRANCOUNT > 0)
		BEGIN
		  ROLLBACK TRANSACTION insertUsuarios	
		  SET @mensaje = ERROR_MESSAGE()	
		  set @statusCode = @statusError
	   END 
	END CATCH
	END
END

IF @accion ='C'
BEGIN

	SELECT nombres,apellidos,email,usuario,[password],confirmacionPassword,RTRIM(LTRIM(estado)) AS estado,fechaRegistro 
	FROM Usuario
	WHERE usuario =@usuario
END

IF @accion ='AC'
BEGIN

	SELECT nombres,apellidos,email,usuario,[password],confirmacionPassword,RTRIM(LTRIM(estado)) AS estado,fechaRegistro 
	FROM Usuario
END

IF @accion ='CL'
BEGIN
		IF(SELECT count(1) FROM usuario WHERE usuario=@usuario and [password] = @password) = 0
		BEGIN
			SET @mensaje ='Favor Validar el UserName y Password sean los Correctos.'
			set @statusCode=@statusError
		END
		ELSE
		BEGIN
			SET @mensaje ='login Correcto.'
			set @statusCode=@statusOK
		END 
END

IF @accion = 'UP'
BEGIN
		IF(@password = @confirmacionPassword)
		BEGIN
			UPDATE Usuario SET password=@password,confirmacionPassword=@confirmacionPassword
			WHERE usuario=@usuario

			set @mensaje ='La Informacion fue Actualizada correctamente del Usuario: ' + UPPER(@usuario)
			set @statusCode=@statusOK
		END
		ELSE
		BEGIN
			SET @mensaje ='El Password y la Confirmacion Password No Coinciden'
			SET @statusCode = @statusError
		END
END

IF @accion = 'D'
BEGIN
	IF @usuario is not null
	begin
		UPDATE Usuario 
		SET estado=@estado
		WHERE usuario = @usuario

		SET @mensaje='El Usuario: ' + LTRIM(RTRIM(UPPER(@usuario))) +', se encuentra ' + LTRIM(RTRIM(UPPER(@estado)))
		SET @statusCode=@statusError

	END
	ELSE
	BEGIN
		SET @mensaje='El Codigo de Usuario es Nulo y No te permite Eliminar'
		set @statusCode=@statusError
	END

END


IF @accion = 'U'
BEGIN
	IF (SELECT COUNT(1) FROM Usuario WHERE usuario = RTRIM(LTRIM(@usuario))) > 0
	BEGIN
	IF @email is not null
	BEGIN
		IF (SELECT COUNT(1) FROM Usuario WHERE email = @email AND nombres=@nombre AND apellidos=@apellidos AND estado=@estado) = 0
		BEGIN		
				UPDATE Usuario SET nombres=@nombre, apellidos = @apellidos,email=@email,estado=@estado
				WHERE usuario=@usuario

				set @mensaje ='La Informacion fue Actualizada correctamente del Usuario: ' + UPPER(@usuario)
				set @statusCode=@statusOK		
								
		END
		ELSE
		BEGIN
			SET @mensaje='Ya existe una Cuenta Asociada con ese Usuario e Email.'
			set @statusCode=@statusError
		END
	END
	ELSE
	BEGIN
		SET @mensaje='El Email es Nulo y No te permite Actualizar'
		set @statusCode=@statusError
	END
	END
	ELSE
	BEGIN
		SET @mensaje='No existe ese Usuario: ' + UPPER(@usuario)
		set @statusCode=@statusError
	END

END



select @mensaje AS mensaje,@statusCode AS statusCode

GO
