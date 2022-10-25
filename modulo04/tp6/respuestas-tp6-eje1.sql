--Resolver las siguientes consultas utilizando la sintaxis SQL
/*1. Agregar las entidades paises (id, nombre), provincias (id, nombre, idpais) y localidades (id,nombre, cp,id_provincia). Tener en cuenta que:
    ● En un país hay muchas provincias.
    ● En una provincia hay muchas localidades.*/
CREATE TABLE `paises` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
)

CREATE TABLE `provincias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `paises_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_provincias_paises1_idx` (`paises_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_provincias_paises1_idx` FOREIGN KEY (`paises_id`) REFERENCES `paises` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
)

CREATE TABLE `localidades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `cp` int DEFAULT NULL,
  `id_provincia` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_localidades_provincias1_idx` (`id_provincia`),
  CONSTRAINT `fk_localidades_provincias1` FOREIGN KEY (`id_provincia`) REFERENCES `provincias` (`id`)
) 

/*2. Modificar la tabla empleados usando ALTER TABLE y agregar los campos:
    ● direccion (varchar)
    ● id_localidad (pk localidad) –Esta es un relación con la tabla localidades -- relacionar
    ● email
    ● telefono
    ● fecha_ingreso
    ● tms (timestamp)*/

ALTER TABLE `elsistema`.`empleados` 
ADD COLUMN `direccion` VARCHAR(45) NULL AFTER `estado`,
ADD COLUMN `email` VARCHAR(45) NULL AFTER `direccion`,
ADD COLUMN `telefono` VARCHAR(45) NULL AFTER `email`,
ADD COLUMN `fecha_ingreso` DATE NULL AFTER `telefono`,
ADD COLUMN `tms` TIMESTAMP NULL AFTER `fecha_ingreso`;

/*3. Modificar la tabla de departamentos usando ALTER TABLE y agregar los campos:
    ● gasto (double)
    ● tms (timestamp)*/
ALTER TABLE `elsistema`.`departamentos` 
ADD COLUMN `gasto` DOUBLE NULL AFTER `estado`,
ADD COLUMN `tms` TIMESTAMP NULL AFTER `gasto`;
--4. Insertar 5 registros en cada tabla de: paises, provincias, localidades, departamentos, empleados.
--Paises
INSERT INTO `paises` VALUES (1,'Argentina'),(2,'Brasil'),(3,'Paraguay'),(4,'Uruguay'),(5,'Chile'),(6,'España'),(7,'Estados Unidos');
--Provincias
INSERT INTO `provincias` VALUES (1,'Ciudad Autónoma de Buenos Aires',1),(2,'Buenos Aires',1),(3,'Misiones',1),(4,'Rosario',1),(5,'Córdoba',1),(6,'Chaco',1),(7,'Corrientes',1),(8,'Formosa',1),(9,'Neuquén',1),(11,'Tucumán',1),(12,'Mendoza',1);
--Localidades
INSERT INTO `localidades` VALUES (1,'Posadas',3300,3),(2,'Apostoles',NULL,3),(3,'Oberá',3360,3),(4,'Puerto Iguazú',NULL,3),(5,'Eldorado',NULL,3),(6,'Wanda',NULL,3),(7,'Puerto Rico',NULL,3),(8,'Guarani',3361,3),(9,'Panambi',3361,3),(10,'Candelaria',3308,3),(11,'Capiovi',3332,3);
--Departamentos
INSERT INTO `departamentos` VALUES (9,'Diseño',100000,1,98000,NULL),(10,'Tester',150000,1,130000,NULL),(11,'Dirección',70000,0,60000,NULL),(12,'Analista',50000,1,NULL,NULL),(13,'Implementador',200000,0,110000,NULL),(14,'Marketing',150000,0,130000,NULL),(15,'Ventas',80000,1,70000,NULL),(16,'Atención',40000,1,35000,NULL);
--Empleados
INSERT INTO `empleados` VALUES (1,'24-45123544-4','Juan','Rodriguez',9,0,'Lopez 12','juan@hotmail.com','3766547','2022-01-01',NULL,1),(2,'28-48121581-4','Lucas','Lopez',10,1,'Yerbal 14','lucas@hotmail.com','37654874','2022-02-01',NULL,2),(3,'26-45452158-5','Ramón','Rivarola',11,0,'Corrientes 14','ramon@hotmail.com','3762244','2022-02-01',NULL,3),(4,'26-21581265-5','Roman','Toledo',12,1,'Lavalle 15','roman@hotmail.com','3765458','2020-04-01',NULL,4),(5,'27-21555581-4','Ignacio','Ramirez',13,0,'Costanera 15','ignacio@hotmail.com','37555458','2020-05-01',NULL,5),(6,'25-21222281-5','Agustín','Lopez',14,1,'Maipú 78','agustin@gmail.com','37554874','2022-06-01',NULL,1),(7,'26-21583331-6','Lucio','Ramirez',15,1,'Trinchera 484','Lucio@hotmail.com','3755458','2021-07-01',NULL,2),(8,'27-21581774-4','José','Rivaldi',16,1,'Avellaneda 45','Jose@gmail.com','37555458','2022-08-01',NULL,6),(9,'26-21581884-6','Pedro','Reinaldi',9,1,'Brasil 78','Pedro@gmail.com','3514874','2021-08-01',NULL,7),(10,'27-21581488-4','Pablo','Rodriguez',10,1,'Uruguay 784','Pablo@gmail.com','37552244','2022-09-01',NULL,8),(11,'26-21581444-6','Hugo','Perez',11,1,'Av. Alem 654','Hugo@gmail.com','3714874','2021-10-01',NULL,9),(12,'26-21581888-6','Tomas','Gomez',12,1,'Bolivar 784','tomas@gmail.com','2512244','2021-11-01',NULL,1);

--5. Modificar el nombre de la tabla “pedidos” por “movimientos”. RENAME TABLE
ALTER TABLE `elsistema`.`pedidos` 
RENAME TO  `elsistema`.`movimientos` ;
--6. Agregar las entidades:
--  ● Productos (id, nombre, descripcion, id_marca fk, stock, precio, estado, tms)-- relacionar
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `id_marca` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_productos_marcas1_idx` (`id_marca`),
  CONSTRAINT `fk_productos_marcas1` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id`)
)

--  ● Marcas (id, nombre, descripción, imagen, id_proveedor, estado, tms)-- relacionar
CREATE TABLE `marcas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripción` varchar(45) DEFAULT NULL,
  `imagen` blob,
  `id_proveedor` int DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proveedorFK_idx` (`id_proveedor`),
  CONSTRAINT `proveedorFK` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id`)
)
--  ● Proveedores (id, razon_social, nombre, apellido, naturaleza (fisica o juridica), cuit,id_localidad fk, estado,tms)-- relacionar
CREATE TABLE `proveedores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `naturaleza` varchar(45) DEFAULT NULL,
  `cuit` varchar(45) DEFAULT NULL,
  `id_localidades` int DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proveedores_localidades1_idx` (`id_localidades`),
  CONSTRAINT `fk_proveedores_localidades1` FOREIGN KEY (`id_localidades`) REFERENCES `localidades` (`id`)
)
--  ● Cajas (id,horainicio(datatime),horacierre(datatime), estado, tms)
CREATE TABLE `cajas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `horainicio` datetime DEFAULT NULL,
  `horacierre` datetime DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
)
--  Notas: Muchos productos tienen una sola marca, o una marca tiene uno o muchos productos. Un proveedor está en una localidad. -- relacionar

--7. Insertar 5 registros en cada tabla del punto 6. Tener en cuenta que el script debe ejecutarse secuencialmente y no fallar.
INSERT INTO `productos` VALUES (1,'Software','windows 10',NULL,4,10000,'1',NULL),(2,'Teclado','Mx300',NULL,1,1000,'0',NULL),(3,'Mouse','LG302',NULL,2,1000,'1',NULL),(4,'Monitor','Samsung 19\"',NULL,5,28000,'0',NULL),(5,'Auricular','BGH',NULL,1,2000,'1',NULL);
INSERT INTO `marcas` VALUES (1,'Samsung','Productos de calidad',NULL,NULL,'0',NULL),(2,'Logitech','Los mejores perifericos',NULL,NULL,'1',NULL),(3,'Noga','Segunda Marca',NULL,3,'0',NULL),(4,'Noganet','No se Fabrica más',NULL,4,'0',NULL),(5,'Cougar','Mejores gabinetes',NULL,9,'1',NULL),(6,'Sentey','Mejores precios',NULL,8,'0',NULL),(7,'Microsoft','Sistemas Operativos',NULL,7,'1',NULL);
INSERT INTO `proveedores` VALUES (1,'Sentey SA','Sentey',NULL,'jurídica','24-32225432-5',1,NULL,NULL),(2,'Logitech SA','Logitech',NULL,'jurídica','24-32222432-8',2,NULL,NULL),(3,'Noga SA','Noga',NULL,'jurídica','25-22452332-8',3,NULL,NULL),(4,'Noganet SA','Noganet',NULL,'jurídica','26-32223242-4',4,NULL,NULL),(5,'Cougar SRL','Cougar',NULL,'jurídica','25-78452148-8',3,NULL,NULL),(6,'Sony','Sony',NULL,'jurídica','29-32243332-6',1,NULL,NULL),(7,NULL,'Lucas','Almirón','física','20-32444432-1',2,NULL,NULL),(8,NULL,'Juan','Ramirez','física','21-32985432-2',3,NULL,NULL),(9,NULL,'Ramón','Perez','física','22-35432242-1',2,NULL,NULL);
INSERT INTO `cajas` VALUES (1,'2022-10-23 07:00:00','2022-10-23 21:00:00','1',NULL),(2,'2022-10-23 08:00:00','2022-10-23 20:30:00','1',NULL),(3,'2022-10-23 07:00:00','2022-10-23 19:30:00','1',NULL),(4,'2022-10-23 09:00:00','2022-10-23 20:00:00','1',NULL),(5,'2022-10-23 08:00:00','2022-10-23 22:00:00','1',NULL),(6,'2022-10-23 09:30:00','2022-10-23 22:00:00','1',NULL);

--8. Listar el nombre, presupuesto, gastos y diferencia(presupuesto-gasto) de todos los departamentos con estado activo o 1.
SELECT nombre, presupuesto, gasto, (presupuesto-gasto) as diferencia 
FROM elsistema.departamentos 
where estado=1;
--9. Listar todas todas las localidades agrupadas por pais. En la vista se deberia ver el nombre del pais y el nombre de la localidad
SELECT paises.nombre as País, localidades.nombre as Localidad
FROM elsistema.provincias
inner join elsistema.paises on paises_id=paises.id
inner join elsistema.localidades on id_provincia=provincias.id
group by paises.id
--10. Modificar (UPADTE):
--  ● el telefono de un empleado cuando el id es igual a uno que hayan declarado.
UPDATE `elsistema`.`empleados` SET `telefono` = '37665477' WHERE (`idempleado` = '1');
--  ● el fecha_ingreso y la localidad de otro empleado.
UPDATE `elsistema`.`empleados` SET `telefono` = '37665477' WHERE (`idempleado` = '1');
UPDATE `elsistema`.`empleados` SET `fecha_ingreso` = '2020-05-02', `id_localidad` = '6' WHERE (`idempleado` = '5');
--11. Insertar 5 vendedores.
INSERT INTO `vendedores` VALUES (1,'Juan','López','24-48435484-8',5),(2,'Lucas','Ramirez','25-78451254-7',5),(3,'Tomás','Perez','25-78462145-9',5),(4,'José','Rodriguez','29-45874548-8',5),(5,'Joaquín','Ramirez','25-78451232-8',5),(6,'Ignacio','Toledo','28-98765421-9',3),(7,'Facundo','Araujo','22-78965432-1',3);

--12. Modificar la tabla movimientos y agregar los campos: id_producto fk, estado, tms(timestamp), tipo_movimiento (ingreso, egreso, pedido)
ALTER TABLE `elsistema1`.`movimientos` 
ADD COLUMN `id_producto` INT NULL AFTER `id_vendedor`,
ADD COLUMN `estado` VARCHAR(45) NULL AFTER `id_producto`,
ADD COLUMN `tms` TIMESTAMP NULL AFTER `estado`,
ADD COLUMN `tipo_movimiento` VARCHAR(45) NULL AFTER `tms`;

ALTER TABLE `elsistema1`.`movimientos` 
ADD INDEX `movimiento_ibfk_3` (`id_producto` ASC) VISIBLE;
;
ALTER TABLE `elsistema1`.`movimientos` 
ADD CONSTRAINT `movimiento_ibfk_3`
  FOREIGN KEY (`id_producto`)
  REFERENCES `elsistema1`.`productos` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


--13. Insertar 5 movimientos distintos.
INSERT INTO `movimientos` VALUES (16,10,'2022-09-01',1,2,1,'1','ingreso'),(26,5,'2022-09-01',1,1,2,'1','egreso'),(27,3,'2022-09-03',3,3,4,'0','ingreso'),(28,4,'2022-09-04',4,4,5,'1','egreso'),(29,5,'2022-09-06',5,3,2,'1','pedido');

--14. Borrar lógicamente (UPDATE de la columna estado):
--  ● 2 movimientos que fueron cargados mal
DELETE FROM `elsistema`.`movimientos` WHERE (`id` = '28');
DELETE FROM `elsistema`.`movimientos` WHERE (`id` = '29');
--  ● un pais que tenga al menos 3 localidades
DELETE FROM `elsistema`.`paises` WHERE (`id` = '1');
--15. Modificar el campo stock de la tabla productos teniendo en cuenta la cantidad de la tabla de movimientos. Sumar el stock si es un ingreso, restar si es un egreso. Esto hacerlo de manera manual en base los 5 movimientos insertados en el punto 13. Es decir deben haber 5 updates de la tabla producto.
-- script para listar el ingreso
SELECT * FROM elsistema.movimientos, elsistema.productos
WHERE (elsistema.movimientos.id_producto=elsistema.productos.id and tipo_movimiento="ingreso");
-- script para sumar stock en caso de ingreso
UPDATE `elsistema`.`productos`, `elsistema`.`movimientos` SET `stock` = stock+1 
WHERE elsistema.movimientos.id_producto=elsistema.productos.id and elsistema.movimientos.tipo_movimiento="ingreso";
-- script para listar el egreso
SELECT * FROM elsistema.movimientos, elsistema.productos
WHERE (elsistema.movimientos.id_producto=elsistema.productos.id and tipo_movimiento="egreso");
-- script para restar stock en caso de ingreso
UPDATE `elsistema`.`productos`, `elsistema`.`movimientos` SET `stock` = stock-1 
WHERE elsistema.movimientos.id_producto=elsistema.productos.id and elsistema.movimientos.tipo_movimiento="egreso";

--16. Cear la tabla parametros (id, tms,cosas(json), id_usuario)-- relacionar
CREATE TABLE `parametros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT NULL,
  `cosas` json DEFAULT NULL,
  `id_usuario` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
)
/*17. Insertar en la tabla parametros teniendo en cuenta la columna cosas:
    ● {"idDeLaCosa": 101, "permisos": "PUT, GET"}
    ● {"vistasPermitidas":"menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente", “grupo": "ventas"}
    ● {"zonaHoraria": "America/Argentina/BuenosAires"}
    ● {"fechaInicioActividades": 01/01/2019, "mesAperturaCaja": "Enero", "mesCierreCaja": "Diciembre"}
    ● {"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93","egreso": "3732538,75"},"2020":{"ingreso": "27442665,12","egreso": "8522331,82"},"2021": {"ingreso": "31634912,57","egreso": "9757142,66"}}}*/
--Nota: Rellenar a criterio los campos id, tms,id_usuario
INSERT INTO `parametros` VALUES (4,'2022-10-23 03:00:00','{\"permisos\": \"PUT, GET\", \"idDeLaCosa\": 101}',1),(5,'2022-10-23 03:00:00','{\"zonaHoraria\": \"America/Argentina/BuenosAires\"}',2),(6,'2022-10-23 03:00:00','{\"grupo\": \"ventas\", \"vistasPermitidas\": \"menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente\"}',3),(7,'2022-10-23 03:00:00','{\"mesCierreCaja\": \"Diciembre\", \"mesAperturaCaja\": \"Enero\", \"fechaInicioActividades\": \"01-01-2019\"}',1),(8,'2022-10-23 03:00:00','{\"balancesAniosAnteriores\": {\"2019\": {\"egreso\": \"3732538,75\", \"ingreso\": \"7374901.93\"}, \"2020\": {\"egreso\": \"8522331,82\", \"ingreso\": \"27442665,12\"}, \"2021\": {\"egreso\": \"9757142,66\", \"ingreso\": \"31634912,57\"}}}',2);

