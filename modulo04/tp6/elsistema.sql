-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: elsistema
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cajas`
--

DROP TABLE IF EXISTS `cajas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cajas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `horainicio` datetime DEFAULT NULL,
  `horacierre` datetime DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cajas`
--

LOCK TABLES `cajas` WRITE;
/*!40000 ALTER TABLE `cajas` DISABLE KEYS */;
INSERT INTO `cajas` VALUES (1,'2022-10-23 07:00:00','2022-10-23 21:00:00','1',NULL),(2,'2022-10-23 08:00:00','2022-10-23 20:30:00','1',NULL),(3,'2022-10-23 07:00:00','2022-10-23 19:30:00','1',NULL),(4,'2022-10-23 09:00:00','2022-10-23 20:00:00','1',NULL),(5,'2022-10-23 08:00:00','2022-10-23 22:00:00','1',NULL),(6,'2022-10-23 09:30:00','2022-10-23 22:00:00','1',NULL);
/*!40000 ALTER TABLE `cajas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `cuitcuil` varchar(20) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `categoría` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Juan','Lopez','25-45897456-9','1',1),(2,'Lucas','Rodriguez','26-46697456-1','1',1),(3,'Oscar','Ramirez','23-45897666-2','2',1),(4,'Pedro','Perez','21-45866456-3','3',1),(5,'Pablo','Rivarola','20-66897456-4','4',2),(6,'Hugo','Perez','25-45855456-5','5',1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `iddepartamento` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `presupuesto` double unsigned NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `gasto` double DEFAULT NULL,
  `tms` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`iddepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (9,'Diseño',100000,1,98000,NULL),(10,'Tester',150000,1,130000,NULL),(11,'Dirección',70000,0,60000,NULL),(12,'Analista',50000,1,NULL,NULL),(13,'Implementador',200000,0,110000,NULL),(14,'Marketing',150000,0,130000,NULL),(15,'Ventas',80000,1,70000,NULL),(16,'Atención',40000,1,35000,NULL);
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `idempleado` int unsigned NOT NULL AUTO_INCREMENT,
  `cuil_cuit` varchar(15) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `id_departamento` int unsigned DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `tms` timestamp NULL DEFAULT NULL,
  `id_localidad` int DEFAULT NULL,
  PRIMARY KEY (`idempleado`),
  UNIQUE KEY `cuil_cuit` (`cuil_cuit`),
  KEY `id_localidadFK` (`id_localidad`) /*!80000 INVISIBLE */,
  KEY `departamentosFK` (`id_departamento`),
  CONSTRAINT `departamentosFK` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`iddepartamento`),
  CONSTRAINT `localidadesFK` FOREIGN KEY (`id_localidad`) REFERENCES `localidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'24-45123544-4','Juan','Rodriguez',9,0,'Lopez 12','juan@hotmail.com','3766547','2022-01-01',NULL,1),(2,'28-48121581-4','Lucas','Lopez',10,1,'Yerbal 14','lucas@hotmail.com','37654874','2022-02-01',NULL,2),(3,'26-45452158-5','Ramón','Rivarola',11,0,'Corrientes 14','ramon@hotmail.com','3762244','2022-02-01',NULL,3),(4,'26-21581265-5','Roman','Toledo',12,1,'Lavalle 15','roman@hotmail.com','3765458','2020-04-01',NULL,4),(5,'27-21555581-4','Ignacio','Ramirez',13,0,'Costanera 15','ignacio@hotmail.com','37555458','2020-05-01',NULL,5),(6,'25-21222281-5','Agustín','Lopez',14,1,'Maipú 78','agustin@gmail.com','37554874','2022-06-01',NULL,1),(7,'26-21583331-6','Lucio','Ramirez',15,1,'Trinchera 484','Lucio@hotmail.com','3755458','2021-07-01',NULL,2),(8,'27-21581774-4','José','Rivaldi',16,1,'Avellaneda 45','Jose@gmail.com','37555458','2022-08-01',NULL,6),(9,'26-21581884-6','Pedro','Reinaldi',9,1,'Brasil 78','Pedro@gmail.com','3514874','2021-08-01',NULL,7),(10,'27-21581488-4','Pablo','Rodriguez',10,1,'Uruguay 784','Pablo@gmail.com','37552244','2022-09-01',NULL,8),(11,'26-21581444-6','Hugo','Perez',11,1,'Av. Alem 654','Hugo@gmail.com','3714874','2021-10-01',NULL,9),(12,'26-21581888-6','Tomas','Gomez',12,1,'Bolivar 784','tomas@gmail.com','2512244','2021-11-01',NULL,1);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidades`
--

DROP TABLE IF EXISTS `localidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `cp` int DEFAULT NULL,
  `id_provincia` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_localidades_provincias1_idx` (`id_provincia`),
  CONSTRAINT `fk_localidades_provincias1` FOREIGN KEY (`id_provincia`) REFERENCES `provincias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidades`
--

LOCK TABLES `localidades` WRITE;
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
INSERT INTO `localidades` VALUES (1,'Posadas',3300,3),(2,'Apostoles',NULL,3),(3,'Oberá',3360,3),(4,'Puerto Iguazú',NULL,3),(5,'Eldorado',NULL,3),(6,'Wanda',NULL,3),(7,'Puerto Rico',NULL,3),(8,'Guarani',3361,3),(9,'Panambi',3361,3),(10,'Candelaria',3308,3),(11,'Capiovi',3332,3),(12,'Cuiabá',NULL,15),(13,'Araruna',NULL,14),(14,'Miami',NULL,16);
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'Samsung','Productos de calidad',NULL,NULL,'0',NULL),(2,'Logitech','Los mejores perifericos',NULL,NULL,'1',NULL),(3,'Noga','Segunda Marca',NULL,3,'0',NULL),(4,'Noganet','No se Fabrica más',NULL,4,'0',NULL),(5,'Cougar','Mejores gabinetes',NULL,9,'1',NULL),(6,'Sentey','Mejores precios',NULL,8,'0',NULL),(7,'Microsoft','Sistemas Operativos',NULL,7,'1',NULL);
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cantidad` double DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_cliente` int unsigned DEFAULT NULL,
  `id_vendedor` int unsigned DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT NULL,
  `tipo_movimiento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movimiento_ibfk_1` (`id_cliente`),
  KEY `movimiento_ibfk_2` (`id_vendedor`),
  KEY `movimiento_ibfk_3` (`id_producto`),
  CONSTRAINT `movimiento_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`),
  CONSTRAINT `movimiento_ibfk_2` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedores` (`id`),
  CONSTRAINT `movimiento_ibfk_3` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos`
--

LOCK TABLES `movimientos` WRITE;
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
INSERT INTO `movimientos` VALUES (16,10,'2022-09-01',1,2,1,'1',NULL,'ingreso'),(26,5,'2022-09-01',1,1,2,'1',NULL,'egreso'),(27,3,'2022-09-03',3,3,4,'0',NULL,'ingreso'),(28,4,'2022-09-04',4,4,5,'1',NULL,'egreso'),(29,5,'2022-09-06',5,3,2,'1',NULL,'pedido');
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES (1,'Argentina'),(2,'Brasil'),(3,'Paraguay'),(4,'Uruguay'),(5,'Chile'),(6,'España'),(7,'Estados Unidos');
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametros`
--

DROP TABLE IF EXISTS `parametros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parametros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT NULL,
  `cosas` json DEFAULT NULL,
  `id_usuario` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametros`
--

LOCK TABLES `parametros` WRITE;
/*!40000 ALTER TABLE `parametros` DISABLE KEYS */;
INSERT INTO `parametros` VALUES (4,'2022-10-23 03:00:00','{\"permisos\": \"PUT, GET\", \"idDeLaCosa\": 101}',1),(5,'2022-10-23 03:00:00','{\"zonaHoraria\": \"America/Argentina/BuenosAires\"}',2),(6,'2022-10-23 03:00:00','{\"grupo\": \"ventas\", \"vistasPermitidas\": \"menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente\"}',3),(7,'2022-10-23 03:00:00','{\"mesCierreCaja\": \"Diciembre\", \"mesAperturaCaja\": \"Enero\", \"fechaInicioActividades\": \"01-01-2019\"}',1),(8,'2022-10-23 03:00:00','{\"balancesAniosAnteriores\": {\"2019\": {\"egreso\": \"3732538,75\", \"ingreso\": \"7374901.93\"}, \"2020\": {\"egreso\": \"8522331,82\", \"ingreso\": \"27442665,12\"}, \"2021\": {\"egreso\": \"9757142,66\", \"ingreso\": \"31634912,57\"}}}',2);
/*!40000 ALTER TABLE `parametros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Software','windows 10',NULL,5,10000,'1',NULL),(2,'Teclado','Mx300',NULL,1,1000,'0',NULL),(3,'Mouse','LG302',NULL,2,1000,'1',NULL),(4,'Monitor','Samsung 19\"',NULL,6,28000,'0',NULL),(5,'Auricular','BGH',NULL,3,2000,'1',NULL);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Sentey SA','Sentey',NULL,'jurídica','24-32225432-5',1,NULL,NULL),(2,'Logitech SA','Logitech',NULL,'jurídica','24-32222432-8',2,NULL,NULL),(3,'Noga SA','Noga',NULL,'jurídica','25-22452332-8',3,NULL,NULL),(4,'Noganet SA','Noganet',NULL,'jurídica','26-32223242-4',4,NULL,NULL),(5,'Cougar SRL','Cougar',NULL,'jurídica','25-78452148-8',3,NULL,NULL),(6,'Sony','Sony',NULL,'jurídica','29-32243332-6',1,NULL,NULL),(7,NULL,'Lucas','Almirón','física','20-32444432-1',2,NULL,NULL),(8,NULL,'Juan','Ramirez','física','21-32985432-2',3,NULL,NULL),(9,NULL,'Ramón','Perez','física','22-35432242-1',2,NULL,NULL);
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `paises_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_provincias_paises1_idx` (`paises_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_provincias_paises1_idx` FOREIGN KEY (`paises_id`) REFERENCES `paises` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (1,'Ciudad Autónoma de Buenos Aires',1),(2,'Buenos Aires',1),(3,'Misiones',1),(4,'Rosario',1),(5,'Córdoba',1),(6,'Chaco',1),(7,'Corrientes',1),(8,'Formosa',1),(9,'Neuquén',1),(11,'Tucumán',1),(12,'Mendoza',1),(13,'Santa Catarina',2),(14,'Paraná',2),(15,'Mato Grosso',2),(16,'Florida',7);
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `cuitcuil` varchar(20) DEFAULT NULL,
  `comisión` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` VALUES (1,'Juan','López','24-48435484-8',5),(2,'Lucas','Ramirez','25-78451254-7',5),(3,'Tomás','Perez','25-78462145-9',5),(4,'José','Rodriguez','29-45874548-8',5),(5,'Joaquín','Ramirez','25-78451232-8',5),(6,'Ignacio','Toledo','28-98765421-9',3),(7,'Facundo','Araujo','22-78965432-1',3);
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-25 10:24:20
