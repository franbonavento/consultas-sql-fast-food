
-->>> AVANCE 3 (RESOLUCION DE CONSULTAS AVANZADAS):

--------------------------------------------------
-------- ACTIVIDADES>>>  Preguntas para consultas:
--------------------------------------------------

--1.(Total de ventas globales)_Pregunta: �Cu�l es el total de ventas (TotalCompra) a nivel global?
	
	SELECT SUM(TotalCompra) AS MontoTotalVentas
	FROM Ordenes;

--2.(Promedio de precios de productos por categor�a)_Pregunta: �Cu�l es el precio promedio de los productos dentro de cada categor�a?
	
	SELECT CategoriaID, 
			AVG(Precio) AS PrecioPromedio
	FROM Productos
	GROUP BY CategoriaID;


--3.(Orden m�nima y m�xima por sucursal)_Pregunta: �Cu�l es el valor de la orden m�nima y m�xima por cada sucursal?
	
	SELECT SucursalID,
			MIN(TotalCompra) AS ValorOrdenMinimo,
			MAX(TotalCompra) AS ValorOrdenMaximo
	FROM Ordenes
	GROUP BY SucursalID;

--4.(Mayor n�mero de kil�metros recorridos para entrega)_Pregunta: �Cu�l es el mayor n�mero de kil�metros recorridos para una entrega?
	
	SELECT MAX(KilometrosRecorrer) AS MaximoKilomentroRecorridoDeUnaEntrega
	FROM Ordenes;																				

--5.(Promedio de cantidad de productos por orden)_Pregunta: �Cu�l es la cantidad promedio de productos por orden?
	
	SELECT OrdenID, 
			AVG(Cantidad) AS CantidadPromedioProductos
	FROM DetalleOrdenes
	GROUP BY OrdenID;

--6.(Total de ventas por tipo de pago)_Pregunta: �C�mo se distribuye la Facturaci�n Total del Negocio de acuerdo a los m�todos de pago?
	
	SELECT  TipoPagoID AS MetodoDePago,
			SUM(TotalCompra) AS MontoTotalDeVentas
	FROM Ordenes
	GROUP BY TipoPagoID;

--7.(Sucursal con la venta promedio m�s alta)_Pregunta: �Cual Sucursal tiene el ingreso promedio m�s alto?
	
	SELECT TOP 1 SucursalID, AVG(TotalCompra) AS MontoPromedioCompra
	FROM Ordenes
	GROUP BY SucursalID
	ORDER BY MontoPromedioCompra DESC;

--8.(Sucursal con la mayor cantidad de ventas por encima de un umbral)_Pregunta: �Cu�les son las sucursales que han generado 
--ventas totales por encima de $ 1000?

	SELECT SucursalID, TotalCompra AS MontoVentasTotales
	FROM Ordenes
	WHERE TotalCompra > 1000;

--9.(Comparaci�n de ventas promedio antes y despu�s de una fecha espec�fica)_Pregunta: �C�mo se comparan las ventas promedio antes y 
--despu�s del 1 de julio de 2023?

	SELECT 
    (SELECT AVG(TotalCompra) FROM Ordenes 
		WHERE FechaEntrega < '2023-07-01') AS MontoPromedioVentasAntes1Jul2023,
    (SELECT AVG(TotalCompra) FROM Ordenes 
		WHERE FechaEntrega >= '2023-07-01') AS MontoPromedioVentasDespues1Jul2023;

--10.(An�lisis de actividad de ventas por horario)_--Pregunta: �Durante qu� horario del d�a (ma�ana, tarde, noche) se registra la 
--mayor cantidad de ventas, cu�l es el ingreso promedio de estas ventas, y cu�l ha sido el importe m�ximo alcanzado por una orden 
--en dicha jornada?
	
	SELECT TOP 1 HorarioVenta,
			COUNT(OrdenID) AS CantidadVentas,
			AVG(TotalCompra) AS PromedioCompra,
			MAX(TotalCompra) AS MontoMaximoDeUnaOrden
	FROM Ordenes
	GROUP BY HorarioVenta
	ORDER BY CantidadVentas DESC;

------------------------------------------------------------------------------------------------------------------------------------------