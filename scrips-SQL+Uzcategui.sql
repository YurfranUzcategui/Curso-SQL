create database tienda_de_abarrotes;

use tienda_de_abarrotes;

CREATE TABLE if not exists tiendas (
ID_Tienda int auto_increment not null primary key,
ID_Vendedor int,
Nombre varchar(24) NOT NULL,
Numero int not null,
Direccion varchar(40) NOT NULL
);

CREATE TABLE Proveedores_por_Tienda (
ID_PropTienda int auto_increment not null primary key,
ID_Tienda int,
ID_Proveedor int,
foreign key (ID_Tienda) references tiendas(ID_Tienda),
foreign key (ID_Proveedor) references proveedores(ID_Proveedor)
);

CREATE TABLE if not exists proveedores (
ID_Proveedor int auto_increment not null primary key,
Nombre varchar(24) NOT NULL,
Apellido varchar(24) NOT NULL,
DNI int NOT NULL unique,
Numero int not null
);

CREATE TABLE if not exists vendedores (
ID_Vendedor int auto_increment not null primary key,
ID_Tienda int,
Nombre varchar(24) NOT NULL,
Apellido varchar(24) NOT NULL,
DNI int NOT NULL unique,
Domicilio varchar(40) NOT NULL,
foreign key (ID_Tienda) references tiendas(ID_Tienda)
);

Create table if not exists productos (
ID_Producto int auto_increment not null primary key,
ID_Proveedor int,
Valor numeric,
Cantidad numeric,
Descripcion varchar (25),
foreign key (ID_Proveedor) references proveedores(ID_Proveedor)
);

Create table if not exists clientes (
ID_Cliente int auto_increment not null primary key,
Nombre varchar (24) NOT NULL,
Apellido varchar (24) NOT NULL,
DNI int NOT NULL unique
);

Create table facturacion (
ID_Facturacion int auto_increment not null primary key,
ID_Tienda int,
ID_Vendedor int,
ID_Cliente int,
ID_Producto int,
foreign key (ID_Tienda) references tiendas(ID_Tienda),
foreign key (ID_Vendedor) references vendedores(ID_Vendedor),
foreign key (ID_Cliente) references clientes(ID_Cliente),
foreign key (ID_Producto) references productos(ID_Producto)
);