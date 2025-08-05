
-->>> AVANCE 4 (UTILIZACION DE MULTIPLES CONJUNTOS DE DATOS):

--------------------------------------------------
-------- ACTIVIDADES>>>  Preguntas para consultas:
--------------------------------------------------

--1.(Listar todos los productos y sus categorías)_Pregunta: ¿Cómo puedo obtener una lista de todos los productos junto con sus categorías?

	SELECT 
		p.Nombre AS NombreProducto, 
		c.Nombre AS Categoria
	FROM 
		 Productos AS p
	INNER JOIN 
		Categorias AS c
	ON 
		 p.CategoriaID = c.CategoriaID;


--2.(Obtener empleados y su sucursal asignada)_Pregunta: ¿Cómo puedo saber a qué sucursal está asignado cada empleado?

	SELECT 
		e.Nombre AS NombreDelEmpleado,
		s.Nombre AS NombreSucursal
	FROM 
		  Empleados AS e
	INNER JOIN 
		Sucursales AS s
	ON 
		 s.SucursalID = e.SucursalID;


--3.(Identificar productos sin categoría asignada)_Pregunta: ¿Existen productos que no tienen una categoría asignada?
	
	--Se declara la variable:
	DECLARE @ProductosSinCategoria INT;

	-- Se verifica si hay productos sin categoría con NULL:
	SELECT 
	 @ProductosSinCategoria = COUNT(*)
	FROM 
		Productos AS p
	LEFT JOIN 
		 Categorias AS c ON p.CategoriaID = c.CategoriaID
	WHERE 
		 c.CategoriaID IS NULL;

	-- Se muestra mensaje basado en el resultado, si es 0:
	IF @ProductosSinCategoria = 0
	BEGIN
		PRINT 'No existen productos sin categoría asignada';
	END
	ELSE
	BEGIN
    -- Se muestra la lista de productos sin categoría, si existen:
    SELECT 
        p.Nombre AS NombreProducto, 
        c.CategoriaID AS Categoria
    FROM 
        Productos AS p
    LEFT JOIN 
        Categorias AS c
    ON 
        p.CategoriaID = c.CategoriaID
    WHERE 
        c.CategoriaID IS NULL;
	END


--4.(Detalle completo de órdenes)_Pregunta: ¿Cómo puedo obtener un detalle completo de las órdenes, incluyendo 
--el Nombre del cliente, Nombre del empleado que tomó la orden, y Nombre del mensajero que la entregó?

	SELECT
		 o.OrdenID AS DetalleOrden,
		 c.Nombre AS NombreCliente,
		 e.Nombre AS NombreEmpleado,
		 m.Nombre AS NombreMensajero
		
	FROM 
	   	 Ordenes AS o
	LEFT JOIN Clientes AS c ON o.ClienteID = c.ClienteID
	LEFT JOIN Empleados AS e ON o.EmpleadoID = e.EmpleadoID
	LEFT JOIN Mensajeros AS m ON o.MensajeroID = m.MensajeroID
	LEFT JOIN DetalleOrdenes AS do ON o.OrdenID = do.OrdenID;


--5.(Productos vendidos por sucursal)_Pregunta: ¿Cuántos artículos correspondientes a cada Categoría de Productos se han vendido en 
--cada sucursal?

	SELECT s.Nombre as sucursal, p.Nombre AS Categorias, SUM(do.Cantidad) AS Ventas
	FROM Ordenes AS o
	INNER JOIN DetalleOrdenes AS do
		ON  o.OrdenID = do.OrdenID
	INNER JOIN Sucursales AS s
		ON o.SucursalID = s.SucursalID
	INNER JOIN Productos AS p
		ON do.ProductoID = p.ProductoID
	INNER JOIN Categorias AS c
		ON p.CategoriaID = c.CategoriaID
	GROUP BY s.Nombre, p.Nombre;

------------------------------------------------------------------------------------------------------------------------------------------	