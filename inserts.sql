USE Inventario;

/*	Ciudad  */
	INSERT INTO Ciudad VALUES 
		('Tegucigalpa'),
		('San Pedro Sula'),
		('La Ceiba'),
		('Choloma'),
		('Santa Barbara'),
		('Nacahome');

	SELECT * FROM Ciudad;


/*	Categoria  */
	INSERT INTO Categoria VALUES
		('Lacteos'),
		('Electronica'),
		('Abarrotes'),
		('Limpieza'),
		('Especias'),
		('Carnes');

	SELECT * FROM Categoria;


/*	Proveedor  */
	INSERT INTO Proveedor VALUES 
		('Don Julio', 2, 5),
		('Dove', 1,4),
		('Quesitos', 3,1),
		('LG', 5,2),
		('Dinant', 4,3),
		('ProgCarne', 6,6);

	SELECT * FROM Proveedor;


/*	Producto  */
	INSERT INTO Producto VALUES
		('Queso - Lb', 3, 80.00),
		('Quesillo - Lb', 3, 78.50),
		('Jabon Liquido', 1, 129.50),
		('Shampoo', 1, 200.99),
		('Comino', 2, 50.50),
		('Ajo en polvo', 2, 187.95),
		('Televisor Smart 32"', 5, 8500.00),
		('Celular K20', 5, 5199.99),
		('Arroz - Lb', 4, 10.99),
		('Azucar - Lb', 4, 12.80),
		('Chuleta de Cerdo - Kg', 6, 300.95),
		('Pollo - Lb', 6, 35.00);

	SELECT * FROM Producto;
	UPDATE Producto SET precio = 5000.00 WHERE id_articulo = 4;

/*	Cliente  */
	INSERT INTO Cliente VALUES
		('Juan Carlos Padilla', 1),
		('Arnodl Vladimir Amador', 1),
		('Emmanuel Figueroa', 2),
		('Fanny Gomez', 2),
		('Ana Binia Barahona', 3),
		('Queren Amador', 4),
		('Maria Cristina Gomez', 5),
		('Jorge Calix', 6),
		('Ana de Garcia', 5),
		('Elisa Garcia', 6);

	SELECT * FROM Cliente;


/*	Pedido  */
	INSERT INTO Pedido VALUES
		(1, 1, 3, '20210305', 3, 240.00),
		(2, 1, 3, '20220105', 2, 157.00),
		(4, 2, 2, '20220209', 1, 129.50),
		(11, 3, 6, '20220505', 1, 300.95),
		(5, 4, 1, '20220219', 2, 101.00),
		(6, 5, 1, '20220321', 1, 187.95),
		(7, 5, 4, '20220101', 1, 8500.00),
		(8, 3, 4, '20221015', 3, 15599.97),
		(9, 8, 5, '20211231', 5, 54.95),
		(12, 6, 6, '20220605', 5, 175.00);

	DELETE FROM Pedido WHERE id_proveedor = 5; 
	SELECT * FROM Pedido;

/*	Inventario  */
	INSERT INTO Inventario VALUES 
		(1, '20210101', 25),
		(2, '20210101', 25),
		(3, '20210101', 15),
		(4, '20210101', 15),
		(5, '20210101', 50),
		(6, '20210101', 20),
		(7, '20210101', 18),
		(8, '20210101', 25),
		(9, '20210101', 100),
		(10, '20210101', 100),
		(11, '20210101', 25),
		(12, '20210101', 50);

	SELECT * FROM Inventario;