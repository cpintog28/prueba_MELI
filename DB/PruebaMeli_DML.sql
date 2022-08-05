USE ItemsDB;

SET IDENTITY_INSERT Color ON 
GO
INSERT Color (IdColor, Nombre, Descripcion) VALUES (1, 'Sin Color', 'Productos que no requieren color')
GO
INSERT Color (IdColor, Nombre, Descripcion) VALUES (2, 'Blanco', NULL)
GO
INSERT Color (IdColor, Nombre, Descripcion) VALUES (3, 'Azul', NULL)
GO
INSERT Color (IdColor, Nombre, Descripcion) VALUES (4, 'Morado', NULL)
GO
INSERT Color (IdColor, Nombre, Descripcion) VALUES (5, 'Negro', NULL)
GO
INSERT Color (IdColor, Nombre, Descripcion) VALUES (6, 'Amarillo', NULL)
GO
INSERT Color (IdColor, Nombre, Descripcion) VALUES (7, 'Rojo', NULL)
GO
SET IDENTITY_INSERT Color OFF
GO
SET IDENTITY_INSERT Categoria ON 
GO
INSERT Categoria (IdCategoria, Nombre, Descripcion) VALUES (1, 'Celulares', 'Smartphones')
GO
INSERT Categoria (IdCategoria, Nombre, Descripcion) VALUES (2, 'Ropa', 'Ropas y accesorios')
GO
INSERT Categoria (IdCategoria, Nombre, Descripcion) VALUES (3, 'Television', 'Televisión y audio')
GO
INSERT Categoria (IdCategoria, Nombre, Descripcion) VALUES (4, 'Hogar', 'Hogar y muebles')
GO
INSERT Categoria (IdCategoria, Nombre, Descripcion) VALUES (5, 'Vehiculos', 'Accesorios para vehículos')
GO
INSERT Categoria (IdCategoria, Nombre, Descripcion) VALUES (6, 'Calzado', 'Zapatos, zapatillas')
GO
SET IDENTITY_INSERT Categoria OFF
GO
SET IDENTITY_INSERT Cliente ON 
GO
INSERT Cliente (IdCliente, NIT_CC, Nombre, Descripcion, Direccion, Celular, Calificacion) VALUES (1, 1454666, 'VentasTV', 'Ventas de electrodomésticos', 'Calle 60 # 13-23', 3216549877, 4.6)
GO
INSERT Cliente (IdCliente, NIT_CC, Nombre, Descripcion, Direccion, Celular, Calificacion) VALUES (2, 4566545, 'VentasPet', 'Articulos para mascotas', 'Calle 80 # 94 -55', 3214567894, 4.9)
GO
SET IDENTITY_INSERT Cliente OFF
GO
SET IDENTITY_INSERT Producto ON 
GO
INSERT Producto (IdProduct, Nombre, Descripcion, ValorUnit, IdColor, IdCategoria, IdCliente) VALUES (1, 'TV 22 Pulgadas', 'Televisor grande', 1000000, 1, 4, 1)
GO
INSERT Producto (IdProduct, Nombre, Descripcion, ValorUnit, IdColor, IdCategoria, IdCliente) VALUES (2, 'Tennis', 'Marca adidas', 400000, 5, 6, 2)
GO
SET IDENTITY_INSERT Producto OFF
GO