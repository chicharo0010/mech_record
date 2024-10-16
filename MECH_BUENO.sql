create database if not exists mech;
use mech;
CREATE TABLE `persona` (
  `id_persona` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(30) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  PRIMARY KEY (`id_persona`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `vehiculo` (
  `id_vehiculo` int NOT NULL AUTO_INCREMENT,
  `id_persona` int NOT NULL,
  `nom_c` varchar(50) NOT NULL,
  `marca` varchar(40) NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `placa` varchar(10) NOT NULL,
	año varchar(4) not null,
    motivo varchar(50) not null,
    estado varchar(30) ,
    gastos varchar(100),
  PRIMARY KEY (`id_vehiculo`),
  KEY `id_persona` (`id_persona`),
  CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `cliente` (
  `id_vehiculo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `gastos` int NOT NULL,
  `saldo_D` int NOT NULL,
  `estatus` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_vehiculo`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id_vehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE marcas (
  idmar int NOT NULL AUTO_INCREMENT,
  nombre varchar(50) NOT NULL,
  PRIMARY KEY (idmar)
);
CREATE TABLE modelos(
  ModeloID int  auto_increment,
  NombreModelo varchar(50) DEFAULT NULL,
  MarcaID int DEFAULT NULL,
  PRIMARY KEY (ModeloID),
	FOREIGN KEY (MarcaID) REFERENCES marcas (idmar)
);
/*drop table modelos; 
drop table marcas; 
*/

insert into marcas (nombre) values
('Audi'),
('BMW'),
('Chrysler'),
('Ford'),
('General_Motors (Chevrolet, GMC)'),
('Honda'),
('Kia'),
('Mazda'),
('Nissan'),
('Toyota'),
('Volkswagen');

INSERT INTO Modelos (NombreModelo, MarcaID) VALUES
('Q5', 1), ('A6', 1), ('Q7', 1), ('A3', 1), ('Q3', 1), -- Audi

('5 Series', 2), ('X5', 2), ('X3', 2), ('7 Series', 2), ('X1', 2), -- BMW

('Pacifica', 3), ('Voyager', 3), ('PT Cruiser', 3), ('300M', 3), ('Sebring', 3), -- Chrysler

('Mustang', 4), ('Explorer', 4), ('Escape', 4), ('Focus', 4), ('Fusion', 4), -- Ford

('Camaro', 5), ('Malibu', 5), ('Equinox', 5), ('Traverse', 5), ('Colorado', 5), -- General Motors (Chevrolet, GMC)

('Civic', 6), ('CR-V', 6), ('Accord', 6), ('Pilot', 6), ('Fit', 6), -- Honda

('Sportage', 7), ('Soul', 7), ('Forte', 7), ('Seltos', 7), ('Rio', 7), -- Kia

('CX-9', 8), ('MX-5 Miata', 8), ('Mazda3', 8), ('Mazda6', 8), ('CX-30', 8), -- Mazda

('Sentra', 9), ('Rogue', 9), ('Altima', 9), ('Maxima', 9), ('Versa', 9), -- Nissan

('Camry', 10), ('Corolla', 10), ('RAV4', 10), ('Highlander', 10), ('Prius', 10), -- Toyota

('Jetta', 11), ('Passat', 11), ('Tiguan', 11), ('Atlas', 11), ('Arteon', 11); -- Volkswagen
/*
drop table modelos; 
drop table marcas; 
*/
select * from modelos; 
select * from marcas; 


create table pzsmotor(
id int auto_increment primary key,
nombre varchar(40) not null,
precio varchar(10) not null
);
create table pzscarroceria(
id int auto_increment primary key,
nombre varchar(40) not null,
precio varchar(10) not null
);
create table pzsmecanicas(
id int auto_increment primary key,
nompz varchar(40) not null,
precio varchar(10) not null
);
insert into pzsmotor(nombre, precio) values
('Piston','380'),
('Biela','380'),
('Arbol de Levas','550'),
('Cabeza Motor','4500'),
('Ventilador','390'),
('Bomba Gasolina','350'),
('Alternador','1500'),
('Marcha','300'),
('Bomba de Agua','300'),
('Radiador','1000');

insert into pzscarroceria(nombre, precio) values
('Manilla','150'),
('Parabrisas','5000'),
('Toma de Aire','2000'),
('Defensa T.','700'),
('Facia','4650'),
('Espejo Retrovisor','200'),
('Defenda F.','4000'),
('Faros','7500'),
('Tablero','3000'),
('Cristal Ventana','500');

insert into pzsmecanicas(nompz, precio) values
('Bateria','2399'),
('Carter','500'),
('Bujias','100'),
('Filtro de Aceite','100'),
('Sensor cigueñal','1100'),
('Aceite','350'),
('Filtro Aire','208'),
('Bobinas','60'),
('Sensor de Aceite','230'),
('Anticongelante','230');


create table carrito1(
id_pieza int not null,
cantidad int not null,
total int not null,
foreign key (id_pieza) references pzsmotor (id)
);
create table carrito2(
id_pieza int not null,
cantidad int not null,
total int not null,
foreign key (id_pieza) references pzscarroceria (id)
);
create table carrito3(
id_pieza int not null,
cantidad int not null,
total int not null,
foreign key (id_pieza) references pzsmecanicas (id)
);

/*
drop table carrito1;
drop table carrito2;
drop table carrito3;
*/

create table registro(
id_persona int not null,
id_vehiculo int not null ,
bitacora varchar(200) not null,
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
foreign key (id_persona) references persona(id_persona),
foreign key (id_vehiculo) references vehiculo(id_vehiculo)
);

create table gastos(
id_vehiculo int not null,
gastos int not null,
foreign key (id_vehiculo) references vehiculo(id_vehiculo)
);
create table estatus(
id_vehiculo int not null,
estatus varchar(70) not null,
foreign key (id_vehiculo) references vehiculo(id_vehiculo)
);

