IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'DBPrueba')
BEGIN
    CREATE DATABASE DBPrueba
END
USE [DBPrueba]
GO

IF NOT (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'Usuario'))
BEGIN

CREATE TABLE [dbo].[Usuario](
	[idusuario] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](200) NOT NULL,
	[apellidos] [varchar](200) NOT NULL,
	usuario varchar(50) NOT NULL,
	[email] [varchar](200) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[confirmacionPassword] [varchar](50) NOT NULL,
	[estado] varchar(15) NOT NULL,
	[fechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	usuario ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [DF_Usuario_fechaRegistro]  DEFAULT (getdate()) FOR [fechaRegistro]
CREATE INDEX indexUsuario on usuario(usuario)

END



IF NOT (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'Producto'))
BEGIN

CREATE TABLE [dbo].[Producto](
	[idproducto] [int] IDENTITY(1,1) NOT NULL,
	codigo varchar(50) NOT NULL,
	nombreProducto varchar(200) NOT NULL,
	estado char(10) NOT NULL,
	fechaRegistro datetime,
	precio decimal(18,4),
	costo decimal(18,4)
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	codigo ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]



ALTER TABLE [dbo].[Producto] ADD  CONSTRAINT [DF_Producto_fechaRegistro]  DEFAULT (getdate()) FOR [fechaRegistro]

CREATE INDEX indexCodigo on producto(codigo)
CREATE INDEX indexCodigoEstado on producto(codigo,estado)

END


IF NOT (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'Cliente'))
BEGIN

CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	nombre varchar(200) NOT NULL,
	identificacion varchar(20)	NOT NULL,
	direccion varchar(200) NOT NULL,
	telefono varchar(10) NOT NULL,
	email varchar(200) NOT NULL,
	fechaRegistro datetime,
	estado char(10)

 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	identificacion ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[Cliente] ADD  CONSTRAINT [DF_Cliente_fechaRegistro]  DEFAULT (getdate()) FOR [fechaRegistro]
ALTER TABLE [dbo].[Cliente] ADD  CONSTRAINT [DF_Cliente_estado]  DEFAULT ('ACTIVO') FOR [estado]

CREATE INDEX indexIdentificacion on cliente(identificacion)

END


IF NOT (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'Factura'))
BEGIN

CREATE TABLE [dbo].[Factura](
	[idfactura] [int] IDENTITY(1,1) NOT NULL,
	usernameVendedor varchar(200) NOT NULL,
	identificacion varchar(20)	NOT NULL,
	estado varchar(10),
	fechaRegistro datetime,
	total decimal(18,2)

 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	idfactura ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[Factura] ADD  CONSTRAINT [DF_Factura_fechaRegistro]  DEFAULT (getdate()) FOR [fechaRegistro]
ALTER TABLE [dbo].[Factura] ADD  CONSTRAINT [DF_Factura_estado]  DEFAULT ('ACTIVO') FOR [estado]

CREATE INDEX indexIdentificacion on Factura(identificacion)
CREATE INDEX indexUsername on Factura(usernameVendedor)

END


IF NOT (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'FacturaDet'))
BEGIN

CREATE TABLE [dbo].[FacturaDet](
	[idfacturaDet] [int] IDENTITY(1,1) NOT NULL,
	idfacturaCab int,
	codigo varchar(20),
	subtotal decimal(18,4),
	cantidad int,
	fechaRegistro datetime,
	estado varchar(10)

 CONSTRAINT [PK_FacturaDet] PRIMARY KEY CLUSTERED 
(
	idfacturaDet ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[FacturaDet] ADD  CONSTRAINT [DF_FacturaDet_fechaRegistro]  DEFAULT (getdate()) FOR [fechaRegistro]
ALTER TABLE [dbo].[FacturaDet] ADD  CONSTRAINT [DF_FacturaDet_estado]  DEFAULT ('ACTIVO') FOR [estado]

CREATE INDEX indexidfacturaDet on FacturaDet(idFacturaDet)

END
