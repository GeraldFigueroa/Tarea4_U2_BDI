DROP DATABASE IF EXISTS Inventario;

CREATE DATABASE Inventario;

USE Inventario;

CREATE TABLE Ciudad (
	id_ciudad SMALLINT PRIMARY KEY IDENTITY(1,1),
	nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Categoria (
	id_categoria TINYINT PRIMARY KEY IDENTITY(1,1),
	descripcion VARCHAR(100) NOT NULL
);

CREATE TABLE Proveedor (
    id_proveedor SMALLINT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    id_ciudad SMALLINT NOT NULL FOREIGN KEY REFERENCES Ciudad(id_ciudad), 
    id_categoria TINYINT NOT NULL FOREIGN KEY REFERENCES Categoria(id_categoria)
);

CREATE TABLE Producto (
    id_articulo INT PRIMARY KEY IDENTITY(1,1),
    descripcion TEXT NOT NULL,
    id_ciudad SMALLINT NOT NULL FOREIGN KEY REFERENCES Ciudad(id_ciudad), 
    precio SMALLMONEY NOT NULL
);

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    id_ciudad SMALLINT NOT NULL FOREIGN KEY REFERENCES Ciudad(id_ciudad), 
);

CREATE TABLE Pedido(
    id_pedido INT PRIMARY KEY IDENTITY(1,1),
    id_articulo INT NOT NULL FOREIGN KEY REFERENCES Producto(id_articulo),
    id_cliente INT NOT NULL FOREIGN KEY REFERENCES Cliente(id_cliente),
    id_proveedor SMALLINT NOT NULL FOREIGN KEY REFERENCES Proveedor(id_proveedor),
    fecha_pedido DATE NOT NULL,
    cantidad SMALLINT NOT NULL, 
    precio_total MONEY NOT NULL
);

CREATE TABLE Inventario (
    id_inventario INT PRIMARY KEY IDENTITY(1,1),
    id_articulo INT NOT NULL FOREIGN KEY REFERENCES Producto(id_articulo),
    fecha DATE NOT NULL,
    cantidad SMALLINT NOT NULL
);