create database tienda_de_abarrotes;
drop schema tienda_de_abarrotes;
use tienda_de_abarrotes;

CREATE TABLE if not exists tiendas (
ID_Tienda int auto_increment not null primary key,
Nombre varchar(24) NOT NULL,
Numero int not null,
Direccion varchar(40) NOT NULL
);

CREATE TABLE if not exists proveedores (
ID_Proveedor int auto_increment not null primary key,
ID_Tienda int,
Nombre varchar(24) NOT NULL,
Apellido varchar(24) NOT NULL,
DNI int NOT NULL unique,
Numero int not null,
foreign key (ID_Tienda) references tiendas(ID_Tienda)on delete cascade on update cascade
);

CREATE TABLE if not exists vendedores (
ID_Vendedor int auto_increment not null primary key,
ID_Tienda int,
Nombre varchar(24) NOT NULL,
Apellido varchar(24) NOT NULL,
DNI int NOT NULL unique,
Domicilio varchar(40) NOT NULL,
foreign key (ID_Tienda) references tiendas(ID_Tienda)on delete cascade on update cascade
);

Create table if not exists productos (
ID_Producto int auto_increment not null primary key,
ID_Proveedor int,
Valor numeric,
Cantidad int,
Descripcion varchar (25),
foreign key (ID_Proveedor) references proveedores(ID_Proveedor)on delete cascade on update cascade
);

Create table if not exists clientes (
ID_Cliente int auto_increment not null primary key,
Nombre varchar (24) NOT NULL,
Apellido varchar (24) NOT NULL,
DNI int NOT NULL unique
);

Create table Ventas (
ID_Venta int auto_increment not null primary key,
ID_Tienda int,
ID_Vendedor int,
ID_Cliente int,
ID_Producto int,
foreign key (ID_Tienda) references tiendas(ID_Tienda)on delete cascade on update cascade, 
foreign key (ID_Vendedor) references vendedores(ID_Vendedor)on delete cascade on update cascade, 
foreign key (ID_Cliente) references clientes(ID_Cliente)on delete cascade on update cascade, 
foreign key (ID_Producto) references productos(ID_Producto)on delete cascade on update cascade
);

insert into tiendas (Nombre, numero, direccion) values 
("Micromarquet", "967649115", "Santiago Centro"),
("Micromarquet", "964279551", "Ñuñoa"),
("Micromarquet", "978565948", "Peñalolen");

insert into proveedores (ID_Tienda, Nombre, Apellido, DNI, Numero) values 
("3","Theodora", "Dresse", "1894664", "964804202"),
("1","Talyah", "Patriskson", "1748378", "943835491"),
("3","Abadía", "Libra", "11452528", "934350670"),
("1","Sally", "Szwarc", "18135080", "922153760"),
("1","Cassandra", "Dymocke", "13637212", "911533000"),
("2","Blayne", "Girodier", "15963928", "996627442"),
("2","Maison", "Magson", "16762883", "993722785"),
("2","Tansy", "Glackin", "20392394", "968240971"),
("3","Laura", "Foad", "23038145", "992916229");

insert into vendedores (ID_Tienda, Nombre , Apellido, DNI, Domicilio) values
("1", "Berte", "Byham", "20619482", "17 Orin Street"),
("1", "Melina", "Edghinn", "13695474", "23 Kensington Crossing"),
("3", "Libbi", "Giampietro", "28834008", "95973 Hooker Way"),
("3", "Liv", "Abadía", "20384339", "01381 Haas Plaza"),
("2", "Jo", "Laurence", "26391717", "6739 Oak Valley Pointt"),
("2","Nealy", "Errington", "29100655", "888 Terraza Summit"),
("1", "Evangelia", "McAne", "24555019", "6 Waywood Circle"),
("2", "San Valentín", "MacKettrick", "25322247", "34546 Parque con vista al lago"),
("3", "Mick", "Gerriet", "16931228", "71 Fallview Parkway"),
("1", "Joey", "Doumenc", "24726836", "464 Oakridge Road"),
("3", "Loreen", "Fice", "20941295", "803 Bartillon Way"),
("1", "orie", "Baulk", "26969598", "888 Centro de gravámenes"),
("3", "Westleigh", "McEwan", "16089723", "2 Fulton Lane"),
("1", "Sastre", "Lamport", "16411884", "368 Centro Mallard"),
("1", "Claire", "Buffery", "15463134", "5782 Glacier Hill Plaza"),
("3", "Ingmar", "Vase", "16005867", "575 Anhalt Lane"),
("2", "Janenna", "Bowskill", "13436741", "38924 Parque Novick"),
("1", "Alicea", "Lambertini", "24627437", "98639 Parque Waywood"),
("1", "Roxine", "Fosten", "24678850", "29 Marcy Street"),
("2", "Murial", "Boarder", "10594406", "59810 Stang Plaza"),
("2", "Piotr", "Leidecker", "22366841", "088 Clemons Hill"),
("1", "Bernadene", "Parram", "28358201", "5 Fair Oaks Lane"),
("3", "Carita", "Maddy", "15253694", "30 Punto de la mañana"),
("2", "Cull", "Corps","16744801", "2793 6th Avenue");

insert into productos (ID_Proveedor, Valor, Cantidad, Descripcion) values
(3, 1095, 27, 'Cookies'),
(9, 2567, 3, 'Tamarillo'),
(4, 2315, 15, 'Nut'),
(5, 7897, 25, 'Pan'),
(7, 6310, 17, 'Cerveza'),
(9, 9453, 10, 'Mantel'),
(4, 1372, 17, 'Nescafé'),
(8, 3868, 20, 'Easy Off Oven Cleaner'),
(4, 9895, 4, 'Sachet'),
(7, 8955, 27, 'Salchicha'),
(7, 3863, 22, 'Agua'),
(1, 5190, 12, 'Cebollas granuladas'),
(5, 4029, 1, 'Ice Cream Bar'),
(3, 5793, 12, 'Crush'),
(7, 6881, 21, 'Mantequilla'),
(5, 7163, 30, 'Concentrado de té helado'),
(8, 3144, 9, 'Peas Snow'),
(4, 1651, 11, 'Champiñón'),
(4, 9367, 12, 'Shopper Bag'),
(7, 1712, 7, 'Mejorana'),
(3, 1528, 17, 'Vino'),
(1, 5743, 7, 'Camarones'),
(4, 9360, 22, 'Té - Menta'),
(8, 9183, 26, 'Pan'),
(6, 2362, 10, 'Tart Shells'),
(7, 2804, 19, 'Jarabe'),
(5, 9067, 19, 'Tray'),
(1, 8909, 1, 'Halibut'),
(3, 9613, 9, 'Soup'),
(6, 6666, 10, 'Pan'),
(1, 7492, 3, 'Juice'),
(6, 9246, 2, 'Sole'),
(4, 2670, 4, 'Beef'),
(1, 9332, 2, 'Aceite'),
(3, 8494, 19, 'Shrimp'),
(8, 6690, 25, 'Spice'),
(9, 8795, 4, 'Aroma'),
(1, 9064, 16, 'Bread Base'),
(1, 6255, 11, 'Coffee Swiss Choc Almond'),
(9, 5828, 23, 'Seabream Whole Farmed'),
(1, 6622, 20, 'Cerdo'),
(2, 7318, 18, 'Cerveza'),
(1, 1437, 14, 'Tart Shells'),
(8, 5029, 15, 'Brandy'),
(3, 7451, 19, 'Muffin Batt'),
(4, 9020, 12, 'Squash'),
(8, 9749, 29, 'Mostaza'),
(4, 6721, 22, 'Sword Pick Asst'),
(6, 9947, 28, "tela de queso"),
(3, 8163, 26, 'Ternera'); 

insert into clientes (Nombre, Apellido, DNI) values 
('Ivette', 'Bardill', 17508336),
('Darcee', 'Andrault', 19832392),
('Barb', 'Dumbare', 21812912),
('Rollo', 'Cawood', 24352827),
('Teddy', 'Chatteris', 18108135),
('Vittoria', 'Pheby', 21667953),
('Faustina', 'Giovannacci', 23145154),
('Tudor', 'Arne', 17472915),
('Karlotta', 'Da Costa', 22950229),
('Waring', 'Labarre', 16258090),
('Hyacinth', 'Croci', 23089458),
('Tine', 'Rosgen', 21301399),
('Catrina', 'Shales', 24262789),
('Judon', 'Kuhn', 21828820),
('Kristine', 'Trever', 22652435);

insert into ventas (ID_Tienda, ID_Vendedor, ID_Cliente, ID_Producto) values 
(3, 6, 3, 38),
(2, 4, 5, 30),
(3, 2, 13, 31),
 (2, 7, 1, 44),
(1, 1, 4, 9),
(1, 7, 7, 1),
(2, 3, 2, 40),
(1, 4, 15, 31),
(3, 1, 13, 18),
(3, 1, 10, 11),
(1, 8, 15, 31),
(2, 14, 11, 10),
(3, 13, 5, 44),
(2, 10, 10, 42),
(1, 14, 3, 38),
(2, 14, 12, 50),
 (2, 10, 11, 30),
(3, 16, 10, 48),
(1, 19, 5, 30),
(2, 1, 1, 4);

select * from ventas

