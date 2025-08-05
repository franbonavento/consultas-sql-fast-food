
-->>> AVANCE 1 (CREACION DE LA BASE DE DATOS Y SUS TABLAS RELACIONADAS):

------------------------------------------------------------------------------
-- Se crea la base de datos con nombre distintivo y representativo "BD_FastFood". 
-- Se almacena localmente. 
------------------------------------------------------------------------------
	CREATE DATABASE BD_FastFood;										

-- Se activa la base de datos anteriormente creada:
	USE BD_FastFood;

----------------------------------------------------------------------------------------------
-- Se crean las 10 tablas que componen la base de datos según el modelo semántico proporcionado
-- (buenas practicas a considerar: notacion, manejo nulos, integridad, comentarios).
----------------------------------------------------------------------------------------------

--1. Se crea la tabla "Categorias":

	CREATE TABLE Categorias(
		CategoriaID INT PRIMARY KEY IDENTITY,
		Nombre VARCHAR(225) NOT NULL);

--2. Se crea la tabla "Productos":

	CREATE TABLE Productos(
		ProductoID INT PRIMARY KEY IDENTITY,
		Nombre VARCHAR(255) NOT NULL,
		CategoriaID INT,
		Precio DECIMAL(10,2) NOT NULL);
	
--3. Se crea la tabla "Clientes":

	CREATE TABLE Clientes(
		ClienteID INT PRIMARY KEY IDENTITY,
		Nombre VARCHAR(255) NOT NULL,
		Direccion VARCHAR(255));

--4. Se crea la tabla "Empleados":

	CREATE TABLE Empleados(
		EmpleadoID INT PRIMARY KEY IDENTITY,
		Nombre VARCHAR(255) NOT NULL,
		Posicion VARCHAR(255),
		Departamento VARCHAR(255),
		SucursalID INT,
		Rol VARCHAR(255)); --Roles Posibles: vendedor, mensajero

--5. Se crea la tabla "Sucursales":

	CREATE TABLE Sucursales(
		SucursalID INT PRIMARY KEY IDENTITY,
		Nombre VARCHAR(255) NOT NULL,
		Direccion VARCHAR(255));

--6. Se crea la tabla "OrigenesOrden":

	CREATE TABLE OrigenesOrden(
		OrigenID INT PRIMARY KEY IDENTITY,
		Descripcion VARCHAR(255) NOT NULL); --Tipos Posibles: online, presencial, telefonico, drive thru. 

--7. Se crea la tabla "TiposPago":

	CREATE TABLE TiposPago(
		TipoPagoID INT PRIMARY KEY IDENTITY,
		Descripcion VARCHAR(255) NOT NULL);

--8. Se crea la tabla "Mensajeros":

	CREATE TABLE Mensajeros(
		MensajeroID INT PRIMARY KEY IDENTITY,
		Nombre VARCHAR(255) NOT NULL,
		EsExterno BIT NOT NULL); --los mensajeros pueden ser empleados de la sucursal con el rol de mensajero o externos

--9. Se crea la tabla "Ordenes":

	CREATE TABLE Ordenes(
		OrdenID INT PRIMARY KEY IDENTITY,
		ClienteID INT,
		EmpleadoID INT,
		SucursalID INT,
		MensajeroID INT,
		TipoPagoID INT,
		OrigenID INT,
		HorarioVenta VARCHAR(255), --mañana, tarde, noche. 
		TotalCompra DECIMAL(10,2),
		KilometrosRecorrer DECIMAL(10,2), --en caso que haya entega a domicilio.
		FechaDespacho DATETIME, --hora y fecha de entrega al repartidor.
		FechaEntrega DATETIME, --entregado al cliente.
		FechaOrdenTomada DATETIME, --fecha y hora que se genera la orden en caso de presencial o drive thru.
		FechaOrdenLista DATETIME); --fecha y hora cuando estuvo lista en la cocina la orden.

--10. Se crea la tabla "DetalleOrdenes":

	CREATE TABLE DetalleOrdenes(
		OrdenID INT,
		ProductoID INT,
		Cantidad INT, 
		Precio DECIMAL(10,2),
		PRIMARY KEY (OrdenID,ProductoID)); --clave Primaria Compuesta.


-----------------------------------------------------------------------------
-- Se generan las relaciones entre las tablas que componen la base de datos 
-----------------------------------------------------------------------------

-- Se genera la relacion entre tabla Productos y Categorias:

	ALTER TABLE Productos
		ADD CONSTRAINT Fk_Productos_Categorias
		FOREIGN KEY(CategoriaID) REFERENCES Categorias(CategoriaID);

-- Se genera la relacion entre tabla Sucursales y Empleados:

	ALTER TABLE Empleados
		ADD CONSTRAINT Fk_Empleados_Sucursales
		FOREIGN KEY(EmpleadoID) REFERENCES Sucursales(SucursalID);

-- Se generan las relaciones con la tabla Ordenes (tabla de hechos):

	ALTER TABLE Ordenes
		ADD CONSTRAINT Fk_Ordenes_Clientes
		FOREIGN KEY(ClienteID) REFERENCES Clientes(ClienteID);

	ALTER TABLE Ordenes
		ADD CONSTRAINT Fk_Ordenes_Empleados
		FOREIGN KEY(EmpleadoID) REFERENCES Empleados(EmpleadoID);

	ALTER TABLE Ordenes
		ADD CONSTRAINT Fk_Ordenes_Sucursal
		FOREIGN KEY(SucursalID) REFERENCES Sucursales(SucursalID);


	ALTER TABLE Ordenes
		ADD CONSTRAINT Fk_Ordenes_Mensajeros
		FOREIGN KEY(MensajeroID) REFERENCES Mensajeros(MensajeroID);


	ALTER TABLE Ordenes
		ADD CONSTRAINT Fk_Ordenes_TiposPago
		FOREIGN KEY(TipoPagoID) REFERENCES TiposPago(TipoPagoID);


	ALTER TABLE Ordenes
		ADD CONSTRAINT Fk_Ordenes_Origenes
		FOREIGN KEY(OrigenID) REFERENCES OrigenesOrden(OrigenID);

-- Se genera la conexion con la tabla de DetalleOrdenes (tabla de hechos):

	ALTER TABLE DetalleOrdenes
		ADD CONSTRAINT Fk_Detalle_Orden
		FOREIGN KEY(OrdenID) REFERENCES Ordenes(OrdenID);

	ALTER TABLE DetalleOrdenes
		ADD CONSTRAINT Fk_Detalle_Productos
		FOREIGN KEY(ProductoID) REFERENCES Productos(ProductoID);

------------------------------------------------------------------------------------------------------------------------------------------