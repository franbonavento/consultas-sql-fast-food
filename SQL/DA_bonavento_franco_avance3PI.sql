
-->>> AVANCE 3 (RESOLUCION DE CONSULTAS AVANZADAS):

--------------------------------------------------
-------- ACTIVIDADES>>>  Preguntas para consultas:
--------------------------------------------------

--1.(Total de ventas globales)_Pregunta: ¿Cuál es el total de ventas (TotalCompra) a nivel global?
	
	SELECT SUM(TotalCompra) AS MontoTotalVentas
	FROM Ordenes;

--2.(Promedio de precios de productos por categoría)_Pregunta: ¿Cuál es el precio promedio de los productos dentro de cada categoría?
	
	SELECT CategoriaID, 
			AVG(Precio) AS PrecioPromedio
	FROM Productos
	GROUP BY CategoriaID;


--3.(Orden mínima y máxima por sucursal)_Pregunta: ¿Cuál es el valor de la orden mínima y máxima por cada sucursal?
	
	SELECT SucursalID,
			MIN(TotalCompra) AS ValorOrdenMinimo,
			MAX(TotalCompra) AS ValorOrdenMaximo
	FROM Ordenes
	GROUP BY SucursalID;

--4.(Mayor número de kilómetros recorridos para entrega)_Pregunta: ¿Cuál es el mayor número de kilómetros recorridos para una entrega?
	
	SELECT MAX(KilometrosRecorrer) AS MaximoKilomentroRecorridoDeUnaEntrega
	FROM Ordenes;																				

--5.(Promedio de cantidad de productos por orden)_Pregunta: ¿Cuál es la cantidad promedio de productos por orden?
	
	SELECT OrdenID, 
			AVG(Cantidad) AS CantidadPromedioProductos
	FROM DetalleOrdenes
	GROUP BY OrdenID;

--6.(Total de ventas por tipo de pago)_Pregunta: ¿Cómo se distribuye la Facturación Total del Negocio de acuerdo a los métodos de pago?
	
	SELECT  TipoPagoID AS MetodoDePago,
			SUM(TotalCompra) AS MontoTotalDeVentas
	FROM Ordenes
	GROUP BY TipoPagoID;

--7.(Sucursal con la venta promedio más alta)_Pregunta: ¿Cual Sucursal tiene el ingreso promedio más alto?
	
	SELECT TOP 1 SucursalID, AVG(TotalCompra) AS MontoPromedioCompra
	FROM Ordenes
	GROUP BY SucursalID
	ORDER BY MontoPromedioCompra DESC;

--8.(Sucursal con la mayor cantidad de ventas por encima de un umbral)_Pregunta: ¿Cuáles son las sucursales que han generado 
--ventas totales por encima de $ 1000?

	SELECT SucursalID, TotalCompra AS MontoVentasTotales
	FROM Ordenes
	WHERE TotalCompra > 1000;

--9.(Comparación de ventas promedio antes y después de una fecha específica)_Pregunta: ¿Cómo se comparan las ventas promedio antes y 
--después del 1 de julio de 2023?

	SELECT 
    (SELECT AVG(TotalCompra) FROM Ordenes 
		WHERE FechaEntrega < '2023-07-01') AS MontoPromedioVentasAntes1Jul2023,
    (SELECT AVG(TotalCompra) FROM Ordenes 
		WHERE FechaEntrega >= '2023-07-01') AS MontoPromedioVentasDespues1Jul2023;

--10.(Análisis de actividad de ventas por horario)_--Pregunta: ¿Durante qué horario del día (mañana, tarde, noche) se registra la 
--mayor cantidad de ventas, cuál es el ingreso promedio de estas ventas, y cuál ha sido el importe máximo alcanzado por una orden 
--en dicha jornada?
	
	SELECT TOP 1 HorarioVenta,
			COUNT(OrdenID) AS CantidadVentas,
			AVG(TotalCompra) AS PromedioCompra,
			MAX(TotalCompra) AS MontoMaximoDeUnaOrden
	FROM Ordenes
	GROUP BY HorarioVenta
	ORDER BY CantidadVentas DESC;

------------------------------------------------------------------------------------------------------------------------------------------