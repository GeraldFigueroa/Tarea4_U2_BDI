/* 1.- Encontrar el id y nombre del proveedor que proveen el producto con  id=1 */
    SELECT Proveedor.id_proveedor, Proveedor.nombre 
    FROM Proveedor, Pedido 
    WHERE (Pedido.id_articulo = 1) AND (Pedido.id_proveedor = Proveedor.id_proveedor)
    ;

/* 2.- Encontrar los clientes (nombre cliente) que realizaron pedidos de los productos proveídos por el proveedor con id=1*/
    SELECT DISTINCT Cliente.nombre 
    FROM Cliente
    WHERE Cliente.id_cliente in (
        SELECT Pedido.id_cliente
        FROM Pedido
        WHERE Pedido.id_proveedor = 1
    )
    ;

/* 3.- Encontrar los proveedores que suministran todos los productos cuyo precio es mayor al precio promedio de los productos. */
    SELECT DISTINCT Proveedor.nombre
    FROM Proveedor
    WHERE Proveedor.id_proveedor IN (
        SELECT Pedido.id_proveedor
        FROM Pedido
        WHERE Pedido.id_articulo IN (
            SELECT Producto.id_articulo
            FROM Producto
            WHERE Producto.precio > (
                SELECT AVG(Producto.precio) FROM Producto
			)
        )
    )
	;

/* 4.- Listar los proveedores a los cuales no se les haya solicitado ningún producto*/
    SELECT id_proveedor, nombre
    FROM Proveedor
    WHERE Proveedor.id_proveedor NOT IN (
        SELECT Pedido.id_proveedor FROM Pedido
    )
	;

/* 5.- Listar los nombres de los clientes que hayan pedido más de un producto y que el precio sea mayor a 100*/
    SELECT DISTINCT Cliente.id_cliente, Cliente.nombre
    FROM Cliente
    WHERE Cliente.id_cliente IN (
        SELECT Pedido.id_cliente
        FROM Pedido
        WHERE (
			SELECT COUNT(Pedido.id_cliente) FROM Pedido WHERE Cliente.id_cliente = Pedido.id_cliente
		) > 1 AND Pedido.id_articulo IN (
			SELECT Producto.id_articulo 
			FROM Producto
			WHERE Producto.precio > 100
		)
	)
	;

/* 6.-Listar la cantidad y el precio de cada producto que hayan sido pedido por los clientes entre las fechas 01-01-2022 
   y 20-03-2022, se requiere visualizar el nombre del cliente, el nombre del producto, nombre del proveedor , cantidad y 
   precio del producto.*/
    SELECT Cliente.nombre, 
		Producto.descripcion, 
		Proveedor.nombre, 
		Producto.precio, 
		Pedido.cantidad,
		Pedido.fecha_pedido
	FROM Cliente, Producto, Proveedor, Pedido
	WHERE (Pedido.fecha_pedido BETWEEN '20220101' AND '20220320') AND 
		(Pedido.id_articulo = Producto.id_articulo) AND
		(Pedido.id_cliente = Cliente.id_cliente) AND
		(Pedido.id_proveedor = Proveedor.id_proveedor)
	;


/* 7.- Listar los nombres de los clientes que hayan solicitado más de un producto.*/
    SELECT Cliente.nombre
    FROM Cliente
    WHERE Cliente.id_cliente IN (
        SELECT Pedido.id_cliente
        FROM Pedido
        WHERE (
            SELECT COUNT(Pedido.id_cliente) FROM Pedido WHERE Pedido.id_cliente = Cliente.id_cliente
        ) > 1
    )
	;
