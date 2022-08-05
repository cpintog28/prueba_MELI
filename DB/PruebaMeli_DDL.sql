CREATE DATABASE ItemsDB;
GO
USE ItemsDB;
GO

CREATE TABLE Color (
    IdColor int NOT NULL IDENTITY(1,1),
    Nombre varchar(255) NOT NULL,
    Descripcion varchar(255),    
	PRIMARY KEY (IdColor)
);
GO

CREATE TABLE Categoria (
    IdCategoria int NOT NULL IDENTITY(1,1),
    Nombre varchar(255) NOT NULL,
    Descripcion varchar(255),    
	PRIMARY KEY (IdCategoria)
);
GO

CREATE TABLE Cliente (
    IdCliente int NOT NULL IDENTITY(1,1),
	NIT_CC int NOT NULL,
    Nombre varchar(255) NOT NULL,
    Descripcion varchar(255),    
	Direccion varchar(255),    
	Celular bigint,  
	Calificacion float,  
	PRIMARY KEY (IdCliente)
);
GO

CREATE TABLE Producto (
    IdProduct int NOT NULL IDENTITY(1,1),
    Nombre varchar(255) NOT NULL,
    Descripcion varchar(255),
    ValorUnit int,
    IdColor int NOT NULL,
	IdCategoria int NOT NULL,	
	IdCliente int NOT NULL,
	PRIMARY KEY (IdProduct),
	FOREIGN KEY (IdColor) REFERENCES Color(IdColor),
	FOREIGN KEY (IdCategoria) REFERENCES Categoria(IdCategoria),	
	FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente)	
);
GO

----------------------------
/*Consultar productos*/
CREATE PROCEDURE meli_GetAllProducts
AS
BEGIN
	SELECT * FROM dbo.Producto;
END

GO

CREATE PROCEDURE meli_GetProduct @IdProduct int
AS
BEGIN
	SELECT * FROM dbo.Producto where IdProduct = @IdProduct;
END
GO

/*Consultar productos*/
ALTER PROCEDURE dbo.meli_GetAllProducts
AS
BEGIN
	SELECT P.IdProduct, P.Nombre, P.Descripcion, ValorUnit, P.IdCategoria, P.IdColor, P.IdCliente, C.Nombre AS Color, CA.Nombre AS Categoria, CI.Nombre AS Cliente FROM dbo.Producto P 
	INNER JOIN Color C ON P.IdColor = C.IdColor
	INNER JOIN Categoria CA ON P.IdCategoria = CA.IdCategoria
	INNER JOIN Cliente CI ON P.IdCliente = CI.IdCliente;
END
GO

ALTER TABLE Producto ADD Imagen varbinary(max)  NULL
GO

ALTER TABLE Producto ALTER COLUMN Imagen varchar(max);
GO
/*Agregar producto*/
CREATE PROCEDURE meli_AddProduct
@nombre varchar(255),
@desc varchar(255),
@valorUnit int,
@color int,
@categoria int,
@cliente int,
@foto varbinary(max)  
	 
AS
BEGIN
INSERT INTO dbo.Producto (Nombre, Descripcion, ValorUnit, IdColor, IdCategoria, IdCliente, Imagen)
	VALUES (@nombre, @desc, @valorUnit, @color, @categoria, @cliente, @foto);
 
END
GO

ALTER PROCEDURE [dbo].[meli_GetAllProducts]
AS
BEGIN
	SELECT P.IdProduct, P.Nombre, P.Descripcion, ValorUnit, P.IdCategoria, P.IdColor, P.IdCliente, C.Nombre AS Color, CA.Nombre AS Categoria, CI.Nombre AS Cliente, P.Imagen FROM dbo.Producto P 
	INNER JOIN Color C ON P.IdColor = C.IdColor
	INNER JOIN Categoria CA ON P.IdCategoria = CA.IdCategoria
	INNER JOIN Cliente CI ON P.IdCliente = CI.IdCliente;
END
GO

ALTER PROCEDURE [dbo].[meli_GetAllProducts]
AS
BEGIN
	SELECT P.IdProduct, P.Nombre, P.Descripcion, ValorUnit, P.IdCategoria, P.IdColor, P.IdCliente, C.Nombre AS Color, CA.Nombre AS Categoria, CI.Nombre AS Cliente, CONVERT(VARCHAR(255), P.Imagen , 1) as Imagen FROM dbo.Producto P 
	INNER JOIN Color C ON P.IdColor = C.IdColor
	INNER JOIN Categoria CA ON P.IdCategoria = CA.IdCategoria
	INNER JOIN Cliente CI ON P.IdCliente = CI.IdCliente;
END
GO

ALTER PROCEDURE [dbo].[meli_AddProduct]
@nombre varchar(255),
@desc varchar(255),
@valorUnit int,
@color int,
@categoria int,
@cliente int,
@foto varchar(max)  
	 
AS
BEGIN
INSERT INTO dbo.Producto (Nombre, Descripcion, ValorUnit, IdColor, IdCategoria, IdCliente, Imagen)
	VALUES (@nombre, @desc, @valorUnit, @color, @categoria, @cliente, @foto);
 
END
GO

CREATE PROCEDURE meli_DeleteProduct @idProduct int
AS
BEGIN
	DELETE FROM dbo.Producto WHERE IdProduct = @idProduct;
END



