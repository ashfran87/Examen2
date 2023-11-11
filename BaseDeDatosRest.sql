
CREATE DATABASE chinamo
GO

USE chinamo
GO

CREATE TABLE Mesa
(
  codigo int identity(1,1) PRIMARY KEY,
  descripcion varchar(30) NOT NULL
)
GO

CREATE TABLE mesero
(
	codigo int identity(100,5) PRIMARY KEY,
	nombre varchar(50) NOT NULL
)
GO

CREATE TABLE Cliente
(
	codigo int identity(10,10) PRIMARY KEY,
	nombre varchar(50) NOT NULL
)
GO

CREATE TABLE mesamesero
( 
	codigo int identity(1,1),
	codigomesa int,
	codigomesero int,
	CONSTRAINT fk_codigomesa FOREIGN KEY(codigomesa) REFERENCES mesa(codigo),
	CONSTRAINT fk_codigomesero FOREIGN KEY(codigomesero) REFERENCES mesero(codigo),
	CONSTRAINT pk_codigo PRIMARY KEY(codigo)

 ) 
 GO

 CREATE TABLE pedido
 (
	codigo int,
	codigocliente int,
	codigomesero int,
	descripcion varchar(100),
	CONSTRAINT fk_codigocliente FOREIGN KEY(codigocliente) REFERENCES cliente(codigo),
	CONSTRAINT fk_codigomesero1 FOREIGN KEY(codigomesero) REFERENCES mesero(codigo),
	CONSTRAINT pk_codigopedido PRIMARY KEY(codigo)

 )
 GO

 CREATE TABLE factura
 (
    codigo int identity(1000,1),
	fecha datetime NOT NULL CONSTRAINT df_fecha DEFAULT GETDATE(),
	monto money CONSTRAINT df_monto DEFAULT 0,
	codigopedido int, 
	CONSTRAINT fk_codigopedido FOREIGN KEY(codigopedido) REFERENCES pedido(codigo),
	CONSTRAINT pk_codigofactura PRIMARY KEY(codigo)
 )