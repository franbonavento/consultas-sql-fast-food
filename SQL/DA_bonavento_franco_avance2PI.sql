﻿
-->>> AVANCE 2 (INSERTAR DATA Y RESOLUCION DE CONSULTAS BASICAS):

--------------------
-- Se puebla la base:
--------------------
													
-- Se insertan los datos en tabla "Categorias":

INSERT INTO Categorias (Nombre) VALUES
('Comida Rápida'), ('Postres'), ('Bebidas'), ('Ensaladas'), ('Desayunos'),
('Cafetería'), ('Helados'), ('Comida Vegana'), ('Carnes'), ('Pizzas');


-- Se insertan los datos en tabla "Productos":

INSERT INTO Productos (Nombre, CategoriaID, Precio) VALUES
('Hamburguesa Deluxe', 1, 9.99), ('Cheeseburger', 1, 7.99), ('Pizza Margarita', 10, 11.99), ('Pizza Pepperoni', 10, 12.99), ('Helado de Chocolate', 7, 2.99),
('Helado de Vainilla', 7, 2.99), ('Ensalada César', 4, 5.99), ('Ensalada Griega', 4, 6.99), ('Pastel de Zanahoria', 2, 3.99), ('Brownie', 2, 2.99);


-- Se insertan los datos en tabla "Sucursales":

INSERT INTO Sucursales (Nombre, Direccion) VALUES
('Sucursal Central', '1234 Main St'), ('Sucursal Norte', '5678 North St'), ('Sucursal Este', '9101 East St'), ('Sucursal Oeste', '1121 West St'), ('Sucursal Sur', '3141 South St'),
('Sucursal Playa', '1516 Beach St'), ('Sucursal Montaña', '1718 Mountain St'), ('Sucursal Valle', '1920 Valley St'), ('Sucursal Lago', '2122 Lake St'), ('Sucursal Bosque', '2324 Forest St');


-- Se insertan los datos en tabla "Empleados":

INSERT INTO Empleados (Nombre, Posicion, Departamento, SucursalID, Rol) VALUES
('John Doe', 'Gerente', 'Administración', 1, 'Vendedor'), ('Jane Smith', 'Subgerente', 'Ventas', 1, 'Vendedor'), ('Bill Jones', 'Cajero', 'Ventas', 1, 'Vendedor'), ('Alice Johnson', 'Cocinero', 'Cocina', 1, 'Vendedor'), ('Tom Brown', 'Barista', 'Cafetería', 1, 'Vendedor'),
('Emma Davis', 'Repartidor', 'Logística', 1, 'Mensajero'), ('Lucas Miller', 'Atención al Cliente', 'Servicio', 1, 'Vendedor'), ('Olivia García', 'Encargado de Turno', 'Administración', 1, 'Vendedor'), ('Ethan Martinez', 'Mesero', 'Restaurante', 1, 'Vendedor'), ('Sophia Rodriguez', 'Auxiliar de Limpieza', 'Mantenimiento', 1, 'Vendedor');


-- Se insertan los datos en tabla "Clientes":

INSERT INTO Clientes (Nombre, Direccion) VALUES
('Cliente Uno', '1000 A Street'), ('Cliente Dos', '1001 B Street'), ('Cliente Tres', '1002 C Street'), ('Cliente Cuatro', '1003 D Street'), ('Cliente Cinco', '1004 E Street'),
('Cliente Seis', '1005 F Street'), ('Cliente Siete', '1006 G Street'), ('Cliente Ocho', '1007 H Street'), ('Cliente Nueve', '1008 I Street'), ('Cliente Diez', '1009 J Street');


-- Se insertan los datos en tabla "OrigenesOrden":

INSERT INTO OrigenesOrden (Descripcion) VALUES
('En línea'), ('Presencial'), ('Teléfono'), ('Drive Thru'), ('App Móvil'),
('Redes Sociales'), ('Correo Electrónico'), ('Publicidad'), ('Recomendación'), ('Evento');


-- Se insertan los datos en tabla "TiposPago":

INSERT INTO TiposPago (Descripcion) VALUES
('Efectivo'), ('Tarjeta de Crédito'), ('Tarjeta de Débito'), ('PayPal'), ('Transferencia Bancaria'),
('Criptomonedas'), ('Cheque'), ('Vale de Comida'), ('Cupón de Descuento'), ('Pago Móvil');


-- Se insertan los datos en tabla "Mensajeros":

INSERT INTO Mensajeros (Nombre, EsExterno) VALUES
('Mensajero Uno', 0), ('Mensajero Dos', 1), ('Mensajero Tres', 0), ('Mensajero Cuatro', 1), ('Mensajero Cinco', 0),
('Mensajero Seis', 1), ('Mensajero Siete', 0), ('Mensajero Ocho', 1), ('Mensajero Nueve', 0), ('Mensajero Diez', 1);


-- Se insertan los datos en tabla "Ordenes":

INSERT INTO Ordenes (ClienteID, EmpleadoID, SucursalID, MensajeroID, TipoPagoID, OrigenID, HorarioVenta, TotalCompra, KilometrosRecorrer, FechaDespacho, FechaEntrega, FechaOrdenTomada, FechaOrdenLista) VALUES
(1, 1, 1, 1, 1, 1, 'Mañana', 1053.51, 5.5, '2023-01-10 08:30:00', '2023-01-10 09:00:00', '2023-01-10 08:00:00', '2023-01-10 08:15:00'),
(2, 2, 2, 2, 2, 2, 'Tarde', 1075.00, 10.0, '2023-02-15 14:30:00', '2023-02-15 15:00:00', '2023-02-15 13:30:00', '2023-02-15 14:00:00'),
(3, 3, 3, 3, 3, 3, 'Noche', 920.00, 2.0, '2023-03-20 19:30:00', '2023-03-20 20:00:00', '2023-03-20 19:00:00', '2023-03-20 19:15:00'),
(4, 4, 4, 4, 4, 4, 'Mañana', 930.00, 0.5, '2023-04-25 09:30:00', '2023-04-25 10:00:00', '2023-04-25 09:00:00', '2023-04-25 09:15:00'),
(5, 5, 5, 5, 5, 5, 'Tarde', 955.00, 8.0, '2023-05-30 15:30:00', '2023-05-30 16:00:00', '2023-05-30 15:00:00', '2023-05-30 15:15:00'),
(6, 6, 6, 6, 6, 1, 'Noche', 945.00, 12.5, '2023-06-05 20:30:00', '2023-06-05 21:00:00', '2023-06-05 20:00:00', '2023-06-05 20:15:00'),
(7, 7, 7, 7, 7, 2, 'Mañana', 1065.00, 7.5, '2023-07-10 08:30:00', '2023-07-10 09:00:00', '2023-07-10 08:00:00', '2023-07-10 08:15:00'),
(8, 8, 8, 8, 8, 3, 'Tarde', 1085.00, 9.5, '2023-08-15 14:30:00', '2023-08-15 15:00:00', '2023-08-15 14:00:00', '2023-08-15 14:15:00'),
(9, 9, 9, 9, 9, 4, 'Noche', 1095.00, 3.0, '2023-09-20 19:30:00', '2023-09-20 20:00:00', '2023-09-20 19:00:00', '2023-09-20 19:15:00'),
(10, 10, 10, 10, 10, 5, 'Mañana', 900.00, 15.0, '2023-10-25 09:30:00', '2023-10-25 10:00:00', '2023-10-25 09:00:00', '2023-10-25 09:15:00');


-- Se insertan los datos en tabla "DetalleOrdenes":

INSERT INTO DetalleOrdenes (OrdenID, ProductoID, Cantidad, Precio) VALUES
(1, 1, 3, 23.44),
(1, 2, 5, 45.14),
(1, 3, 4, 46.37),
(1, 4, 4, 42.34),
(1, 5, 1, 18.25),
(1, 6, 4, 20.08),
(1, 7, 2, 13.31),
(1, 8, 2, 20.96),
(1, 9, 4, 30.13),
(1, 10, 3, 38.34);



--------------------------------------------------------------------------------------------------------------
-------- ACTIVIDADES>>>   Utilizar sentencias UPDATE y DELETE para la actualización y eliminación de registros:
---------------------------------------------------------------------------------------------------------------

-- Primero nos aseguramos de estar trabajando con la base de datos correcta:
	
	USE BD_FastFood;  

--(Sentencia UPDATE):
--1. Aumentar el precio de todos los productos en la categoría 1:
	
	UPDATE Productos 
		SET Precio = Precio + 1 
		WHERE CategoriaID = 1;
									

--2. Cambiar la posición de todos los empleados del departamento 'Cocina' a 'Chef':
	
	UPDATE Empleados 
		SET Posicion = 'Chef' 
		WHERE Departamento = 'Cocina';
									

--3. Actualizar la dirección de una sucursal específica:
	
	UPDATE Sucursales 
		SET Direccion = '1234 New Address St' 
		WHERE SucursalID = 1;
										

--(Sentencia DELETE):
/*1. Eliminar una orden específica:
Imaginemos que quieres eliminar una orden específica, 
por ejemplo, la orden con OrdenID = 10. 
Esta operación eliminaría la orden junto con sus detalles asociados 
(deberías asegurarte de eliminar o actualizar cualquier dato relacionado 
para mantener la integridad referencial).*/

	DELETE FROM DetalleOrdenes --en este caso: para la OrdenID=10, no hay datos. Por lo tanto esta instruccion no genera cambios.
	WHERE OrdenID = 10;			
	
	DELETE FROM Ordenes 
	WHERE OrdenID = 10;		

/*2. Eliminar todos los productos de una categoría específica:
Si decides dejar de ofrecer todos los "Postres" 
(supongamos que Categorias.CategoriaID = 2 para "Postres"), 
podrías querer eliminar todos los productos asociados a esa categoría.
Antes de ejecutar este comando, deberías considerar si hay órdenes que incluyen estos productos y decidir cómo manejar esas referencias.*/

	DELETE FROM Productos		--(esta sentencia dará error al ejecutarla, por estar vinculada mediante PK con otra tabla)
	WHERE CategoriaID = 2;


/*3. Eliminar empleados de una sucursal que cerró
Si una sucursal cierra, por ejemplo, 
SucursalID = 10 (Sucursal Bosque), 
podrías necesitar eliminar a todos los empleados asociados con esa sucursal.*/

	DELETE FROM Empleados	--(al ejecutar esta sentencia, muestra mensaje "0 row affected", porque no hay empleados en esa sucursal)
	WHERE SucursalID = 10;

--------------------------------------------------
-------- ACTIVIDADES>>>  Preguntas para consultas:
--------------------------------------------------

--1.(Registros únicos)_Pregunta: ¿Cuál es la cantidad total de registros únicos en la tabla de órdenes?
	
	SELECT COUNT(OrdenID) AS CantidadRegistrosUnicos
	FROM Ordenes;

--2.(Empleados por departamento)_Pregunta: ¿Cuántos empleados existen en cada departamento?
	
	SELECT Departamento, 
			COUNT(EmpleadoID) AS CantidadEmpleados 
	FROM Empleados
	GROUP BY Departamento; 

--3.(Productos por categoría)_Pregunta: ¿Cuántos productos hay por código de categoría?

	SELECT CategoriaID, 
			COUNT(ProductoID) AS TotalProductos
	FROM Productos
	GROUP BY CategoriaID; 

--4.(importación de clientes)_Pregunta: ¿Cuántos clientes se han importado a la tabla de clientes?

	SELECT COUNT(ClienteID) AS TotalClientes
	FROM Clientes;

--5.(Análisis de desempeño de sucursales)_Pregunta: ¿Cuales son las sucursales con un promedio de Facturación/Ingresos superior a
--1000.00 y que minimizan sus costos en base al promedio de kilómetros recorridos de todas de sus entregas gestionadas? 
--Para un mejor relevamiento, ordene el listado por el Promedio Km Recorridos.

	SELECT SucursalID,
			AVG(TotalCompra) AS PromedioCompra,
			AVG(KilometrosRecorrer) AS PromedioKM  --muestra las 3 columnas con sus alias.
	FROM Ordenes
	GROUP BY SucursalID						
	HAVING AVG(TotalCompra) > 1000.00		--filtra las sucursales que tengan compras mayor a mil pesos.
	ORDER BY PromedioKM DESC;				--las muestra de mayor a menor, en base al promedio de km.
	
------------------------------------------------------------------------------------------------------------------------------------------