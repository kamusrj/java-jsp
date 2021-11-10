CREATE DATABASE  IF NOT EXISTS `bibliop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bibliop`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: bibliop
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `dbautor`
--

DROP TABLE IF EXISTS `dbautor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbautor` (
  `id_autor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `pseudonimo` varchar(60) NOT NULL,
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbautor`
--

LOCK TABLES `dbautor` WRITE;
/*!40000 ALTER TABLE `dbautor` DISABLE KEYS */;
INSERT INTO `dbautor` VALUES (1,'Randi','Hutter Epstein','Desconocido'),(2,'Stephen','Hawking','Desconocido'),(3,'Christophe','Galfard','Desconocido'),(4,'Lucia','Galan Bertrand','Desconocido'),(5,'Olga','Tokarczuk','Desconocido'),(8,'Olga','Tokarczuk','Desconocido');
/*!40000 ALTER TABLE `dbautor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbcompra`
--

DROP TABLE IF EXISTS `dbcompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbcompra` (
  `id_compra` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `id_libro` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_finalidad` int(11) NOT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `fk_lib_com` (`id_libro`),
  KEY `fk_fin_com` (`id_finalidad`),
  CONSTRAINT `fk_fin_com` FOREIGN KEY (`id_finalidad`) REFERENCES `dbfinalidad` (`id_finalidad`) ON UPDATE CASCADE,
  CONSTRAINT `fk_lib_com` FOREIGN KEY (`id_libro`) REFERENCES `dblibro` (`id_libro`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbcompra`
--

LOCK TABLES `dbcompra` WRITE;
/*!40000 ALTER TABLE `dbcompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbcompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbconceptosalquiler`
--

DROP TABLE IF EXISTS `dbconceptosalquiler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbconceptosalquiler` (
  `id_concepto` int(11) NOT NULL AUTO_INCREMENT,
  `concepto` varchar(60) NOT NULL,
  PRIMARY KEY (`id_concepto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbconceptosalquiler`
--

LOCK TABLES `dbconceptosalquiler` WRITE;
/*!40000 ALTER TABLE `dbconceptosalquiler` DISABLE KEYS */;
INSERT INTO `dbconceptosalquiler` VALUES (1,'Alquiler'),(2,'Mora');
/*!40000 ALTER TABLE `dbconceptosalquiler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbdetalle_facturaventa`
--

DROP TABLE IF EXISTS `dbdetalle_facturaventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbdetalle_facturaventa` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `num_doc` int(11) NOT NULL,
  `reg_libroVenta` int(11) NOT NULL,
  `cantidad` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `fk_enc_detalle` (`num_doc`),
  KEY `fk_libV_detalle` (`reg_libroVenta`),
  CONSTRAINT `fk_enc_detalle` FOREIGN KEY (`num_doc`) REFERENCES `dbenc_facturaventa` (`num_doc`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_libV_detalle` FOREIGN KEY (`reg_libroVenta`) REFERENCES `dblibroventa` (`reg_libroVenta`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbdetalle_facturaventa`
--

LOCK TABLES `dbdetalle_facturaventa` WRITE;
/*!40000 ALTER TABLE `dbdetalle_facturaventa` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbdetalle_facturaventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbeditorial`
--

DROP TABLE IF EXISTS `dbeditorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbeditorial` (
  `id_editorial` int(11) NOT NULL AUTO_INCREMENT,
  `editorial` varchar(60) NOT NULL,
  PRIMARY KEY (`id_editorial`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbeditorial`
--

LOCK TABLES `dbeditorial` WRITE;
/*!40000 ALTER TABLE `dbeditorial` DISABLE KEYS */;
INSERT INTO `dbeditorial` VALUES (1,'Critica'),(2,'Blackie Books'),(3,'Planeta'),(4,'Anagrama'),(8,'Desperta Ferro Ediciones'),(9,'Anagrama');
/*!40000 ALTER TABLE `dbeditorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbenc_facturaventa`
--

DROP TABLE IF EXISTS `dbenc_facturaventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbenc_facturaventa` (
  `num_doc` int(11) NOT NULL AUTO_INCREMENT,
  `id_usr` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`num_doc`),
  KEY `fk_usr_facV` (`id_usr`),
  CONSTRAINT `fk_usr_facV` FOREIGN KEY (`id_usr`) REFERENCES `dbusuario` (`id_usr`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbenc_facturaventa`
--

LOCK TABLES `dbenc_facturaventa` WRITE;
/*!40000 ALTER TABLE `dbenc_facturaventa` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbenc_facturaventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbestante`
--

DROP TABLE IF EXISTS `dbestante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbestante` (
  `id_estante` int(11) NOT NULL AUTO_INCREMENT,
  `numero_estante` int(11) NOT NULL,
  `id_pasillo` char(1) NOT NULL,
  PRIMARY KEY (`id_estante`),
  KEY `fk_est_pasi` (`id_pasillo`),
  CONSTRAINT `fk_est_pasi` FOREIGN KEY (`id_pasillo`) REFERENCES `dbpasillo` (`id_pasillo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbestante`
--

LOCK TABLES `dbestante` WRITE;
/*!40000 ALTER TABLE `dbestante` DISABLE KEYS */;
INSERT INTO `dbestante` VALUES (1,1,'A'),(2,2,'A'),(3,3,'A'),(5,1,'B'),(6,2,'B'),(7,3,'B');
/*!40000 ALTER TABLE `dbestante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbfacturaalquiler`
--

DROP TABLE IF EXISTS `dbfacturaalquiler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbfacturaalquiler` (
  `num_doc` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `vencimiento` date NOT NULL,
  `reg_LibroAlquiler` int(11) NOT NULL,
  `id_concepto` int(11) NOT NULL,
  `id_usr` int(11) NOT NULL,
  `id_periodo` int(11) NOT NULL,
  `monto` decimal(7,2) NOT NULL,
  PRIMARY KEY (`num_doc`),
  KEY `fk_usr_facA` (`id_usr`),
  KEY `fk_la_facA` (`reg_LibroAlquiler`),
  KEY `fk_con_facA` (`id_concepto`),
  KEY `fk_per_facA` (`id_periodo`),
  CONSTRAINT `fk_con_facA` FOREIGN KEY (`id_concepto`) REFERENCES `dbconceptosalquiler` (`id_concepto`) ON UPDATE CASCADE,
  CONSTRAINT `fk_la_facA` FOREIGN KEY (`reg_LibroAlquiler`) REFERENCES `dblibroalquiler` (`reg_LibroAlquiler`) ON UPDATE CASCADE,
  CONSTRAINT `fk_per_facA` FOREIGN KEY (`id_periodo`) REFERENCES `dbperiodo` (`id_periodo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_usr_facA` FOREIGN KEY (`id_usr`) REFERENCES `dbusuario` (`id_usr`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbfacturaalquiler`
--

LOCK TABLES `dbfacturaalquiler` WRITE;
/*!40000 ALTER TABLE `dbfacturaalquiler` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbfacturaalquiler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbfinalidad`
--

DROP TABLE IF EXISTS `dbfinalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbfinalidad` (
  `id_finalidad` int(11) NOT NULL AUTO_INCREMENT,
  `finalidad` varchar(50) NOT NULL,
  PRIMARY KEY (`id_finalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbfinalidad`
--

LOCK TABLES `dbfinalidad` WRITE;
/*!40000 ALTER TABLE `dbfinalidad` DISABLE KEYS */;
INSERT INTO `dbfinalidad` VALUES (1,'Alquiler'),(2,'Venta');
/*!40000 ALTER TABLE `dbfinalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbgenero`
--

DROP TABLE IF EXISTS `dbgenero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbgenero` (
  `id_genero` int(11) NOT NULL AUTO_INCREMENT,
  `genero` varchar(60) NOT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbgenero`
--

LOCK TABLES `dbgenero` WRITE;
/*!40000 ALTER TABLE `dbgenero` DISABLE KEYS */;
INSERT INTO `dbgenero` VALUES (1,'Ciencia'),(2,'Medicina'),(3,'Narrativa'),(5,'Historia'),(6,'Narrativa');
/*!40000 ALTER TABLE `dbgenero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dblibro`
--

DROP TABLE IF EXISTS `dblibro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dblibro` (
  `id_libro` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) NOT NULL,
  `id_autor` int(11) NOT NULL,
  `id_editorial` int(11) NOT NULL,
  `id_genero` int(11) NOT NULL,
  `sinopsis` text NOT NULL,
  `portada` varchar(80) NOT NULL,
  `costo` decimal(7,2) DEFAULT NULL,
  `id_estante` int(11) NOT NULL,
  PRIMARY KEY (`id_libro`),
  KEY `fk_edi_lib` (`id_editorial`),
  KEY `fk_gen_lib` (`id_genero`),
  KEY `fk_est_lib` (`id_estante`),
  KEY `fk_aut_lib` (`id_autor`),
  CONSTRAINT `fk_aut_lib` FOREIGN KEY (`id_autor`) REFERENCES `dbautor` (`id_autor`) ON UPDATE CASCADE,
  CONSTRAINT `fk_edi_lib` FOREIGN KEY (`id_editorial`) REFERENCES `dbeditorial` (`id_editorial`) ON UPDATE CASCADE,
  CONSTRAINT `fk_est_lib` FOREIGN KEY (`id_estante`) REFERENCES `dbestante` (`id_estante`) ON UPDATE CASCADE,
  CONSTRAINT `fk_gen_lib` FOREIGN KEY (`id_genero`) REFERENCES `dbgenero` (`id_genero`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dblibro`
--

LOCK TABLES `dblibro` WRITE;
/*!40000 ALTER TABLE `dblibro` DISABLE KEYS */;
INSERT INTO `dblibro` VALUES (2,'El poder de las hormonas',1,1,1,'Esta es la historia de nuestra relación con las hormonas. Con nuestra sexualidad, nuestros deseos y nuestros cambios de humor. Es la historia de todo aquello que hace que nosotros seamos nosotros.\nUn recorrido a lo largo de la historia las hormonas lleno de personajes y escenas tan cinematográficos como la Novia Gorda de un circo, un sótano lleno de cerebros metidos en tarros y una pareja enamorada que fue pionera en el tratamiento de las personas intersexuales, pero también audaces investigadores y médicos.\n','resources/img/portadas/el_poder_de_las_hormonas.jpg',23.11,1),(3,'Breves respuestas a las grandes preguntas',2,1,1,'Las últimas reflexiones sobre las preguntas más importantes del universo se incluyen en este trabajo póstumo, brillante y revolucionario.<br> Stephen Hawking fue reconocido como una de las mentes más brillantes de nuestro tiempo y una figura de inspiración después de desafiar su diagnóstico de ELA a la edad de veintiún años.','resources/img/portadas/libro_stephen_hawking.jpg',35.20,2),(4,'El universo en tu mano',3,2,1,'Te guía en una odisea alucinante hasta los agujeros negros, las galaxias más lejanas y el inicio mismo del cosmos.\nAbandonas tu cuerpo y te desplazas a velocidades imposibles, te introduces en un núcleo atómico, viajas en el tiempo, entras en el Sol.','resources/img/portadas/el universo en tu mano.jpg',29.36,3),(5,'La agenda de mi bebe',4,3,2,'Personaliza la agenda de tu hijo y conviertela en un precioso recuerdo para el futuro. Incluye todos los consejos de Lucia, mi pediatra.','resources/img/portadas/la agenda de mi bebe.jpg',17.85,5),(11,'Los errantes',5,4,3,'Una novela unica, ligera y honda a la vez, que indaga en las posibilidades del genero para hablar sobre el cuerpo, el mundo y las estrategias siempre insuficientes con que intentamos cartografiarlos.','resources/img/portadas/los errantes.jpg',21.60,6);
/*!40000 ALTER TABLE `dblibro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dblibroalquiler`
--

DROP TABLE IF EXISTS `dblibroalquiler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dblibroalquiler` (
  `reg_LibroAlquiler` int(11) NOT NULL AUTO_INCREMENT,
  `id_libro` int(11) NOT NULL,
  `existencia` int(11) NOT NULL,
  PRIMARY KEY (`reg_LibroAlquiler`),
  KEY `fk_lib_libAl` (`id_libro`),
  CONSTRAINT `fk_lib_libAl` FOREIGN KEY (`id_libro`) REFERENCES `dblibro` (`id_libro`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dblibroalquiler`
--

LOCK TABLES `dblibroalquiler` WRITE;
/*!40000 ALTER TABLE `dblibroalquiler` DISABLE KEYS */;
INSERT INTO `dblibroalquiler` VALUES (1,2,10);
/*!40000 ALTER TABLE `dblibroalquiler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dblibroventa`
--

DROP TABLE IF EXISTS `dblibroventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dblibroventa` (
  `reg_libroVenta` int(11) NOT NULL AUTO_INCREMENT,
  `id_libro` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `existencia` int(11) NOT NULL,
  `precio_venta` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`reg_libroVenta`),
  KEY `fk_lib_libV` (`id_libro`),
  CONSTRAINT `fk_lib_libV` FOREIGN KEY (`id_libro`) REFERENCES `dblibro` (`id_libro`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dblibroventa`
--

LOCK TABLES `dblibroventa` WRITE;
/*!40000 ALTER TABLE `dblibroventa` DISABLE KEYS */;
INSERT INTO `dblibroventa` VALUES (1,3,15,25,41.50),(2,4,11,19,36.25),(3,5,30,61,23.65),(5,11,10,0,29.65);
/*!40000 ALTER TABLE `dblibroventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbpasillo`
--

DROP TABLE IF EXISTS `dbpasillo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbpasillo` (
  `id_pasillo` char(1) NOT NULL,
  `pasillo` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id_pasillo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbpasillo`
--

LOCK TABLES `dbpasillo` WRITE;
/*!40000 ALTER TABLE `dbpasillo` DISABLE KEYS */;
INSERT INTO `dbpasillo` VALUES ('A','Pasillo ciencias'),('B','Pasillo Novelas');
/*!40000 ALTER TABLE `dbpasillo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbperiodo`
--

DROP TABLE IF EXISTS `dbperiodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbperiodo` (
  `id_periodo` int(11) NOT NULL AUTO_INCREMENT,
  `duracion` int(4) NOT NULL,
  `factor` decimal(2,2) NOT NULL,
  `penalizacion` decimal(2,2) NOT NULL,
  PRIMARY KEY (`id_periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbperiodo`
--

LOCK TABLES `dbperiodo` WRITE;
/*!40000 ALTER TABLE `dbperiodo` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbperiodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbpersona`
--

DROP TABLE IF EXISTS `dbpersona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbpersona` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` char(9) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  PRIMARY KEY (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbpersona`
--

LOCK TABLES `dbpersona` WRITE;
/*!40000 ALTER TABLE `dbpersona` DISABLE KEYS */;
INSERT INTO `dbpersona` VALUES (1,'Gustavo','Villalobos','gust@bibliop.com','7709-4179','ejemplo de direccion ubicacion el salvador'),(3,'Ivan','Castillo','IvanCast@bibliop.com','7046-8169','calle racer,av. 5 de noviembre, Zacamil, San Salvador'),(4,'Rubidia','Alvares','RubiA@bibliop.com','7720-9168','Recidencial La esperanza, ciudad Delgado #4 pj #1 '),(9,'Sergio Antonio','Recinos Cardoza','sergiCar@gmail.com','7751-8892','Ejemplo de direccion sin motivo'),(11,'Alba','Marquez','marquez.alba02@gmail.com','7231-3325','Col. Purisima, Calle principal #34 San Antonio Abad'),(12,'Estiven','Mendoza','esst.mendoza@gmail.com','7545-8599','Condominio la alta departamento 12 3er piso'),(16,'Manuel Antonio','Rivera Salguero','manu.riv@gmail.com','7292-5481','lourdes colon, col. buenos aires casa #25'),(17,'Manuel Antonio','Rivera Salguero','manu.riv@gmail.com','7292-5481','Lourdes colon, col. la magnifica casa #25'),(18,'Maria ','Valencia','m.valen@hotmail.com','7121-5431','col. miramonte urb los santos psj 3 casa 6'),(19,'Elias ','Benites','elias.ben@gmail.com','7002-5121','Una direccion cualquiera'),(21,'Kelvin','Arias','ariask91@gmail.com','7121-8491','barrio el centro Guazapa calle los Santos #24 ');
/*!40000 ALTER TABLE `dbpersona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbrol`
--

DROP TABLE IF EXISTS `dbrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbrol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(60) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbrol`
--

LOCK TABLES `dbrol` WRITE;
/*!40000 ALTER TABLE `dbrol` DISABLE KEYS */;
INSERT INTO `dbrol` VALUES (1,'Propietario'),(2,'Empleado'),(3,'Cliente');
/*!40000 ALTER TABLE `dbrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbusuario`
--

DROP TABLE IF EXISTS `dbusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbusuario` (
  `id_usr` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(40) NOT NULL,
  `clave` varchar(20) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  PRIMARY KEY (`id_usr`),
  KEY `fk_rol_usr` (`id_rol`),
  KEY `fk_per_usr` (`id_persona`),
  CONSTRAINT `fk_per_usr` FOREIGN KEY (`id_persona`) REFERENCES `dbpersona` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rol_usr` FOREIGN KEY (`id_rol`) REFERENCES `dbrol` (`id_rol`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbusuario`
--

LOCK TABLES `dbusuario` WRITE;
/*!40000 ALTER TABLE `dbusuario` DISABLE KEYS */;
INSERT INTO `dbusuario` VALUES (1,'GustVillalobos','pass1234',1,1),(3,'mune.castillo','munepass321',3,1),(4,'RubyA','rual12345',4,1),(9,'SergiRecin','sergi123',9,3),(11,'Alba_m','alba1234',11,2),(12,'esst.men','est123',12,2),(16,'manu.rivera','man123',17,3),(17,'valenciaM','valen12',18,3),(18,'elias.master','ali123',19,3),(20,'killerarias','ka12345',21,3);
/*!40000 ALTER TABLE `dbusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bibliop'
--
/*!50003 DROP PROCEDURE IF EXISTS `actualizarPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarPersona`(
	in cod int,
    in nom varchar(60),
    in ape varchar(60),
    in mail varchar(100),
    in tel varchar(9),
    in direc varchar(200)
)
BEGIN
		update dbpersona set nombre = nom, apellido = ape, correo = mail, telefono = tel, direccion = direc where id_persona = cod;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarUsuario`(
    in cod int,
    in nic varchar(40),
    in pass varchar(20)
)
BEGIN
	update dbUsuario set nickname = nic, clave = pass where id_usr = cod;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crearUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crearUsuario`(
	in nom varchar(60),
    in ape varchar(60),
    in mail varchar(100),
    in tel varchar(9),
    in direc varchar(200),
    in nick varchar(40),
    in pass varchar(20)
)
BEGIN
	insert into dbpersona(nombre,apellido,correo,telefono,direccion) values (nom,ape,mail,tel,direc);
	set @per:= (select max(id_persona) as id_persona from dbpersona);
	set @roll:= 3;
	insert into dbusuario(nickname,clave,id_persona,id_rol) values (nick,pass,@per,@roll);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createUsuarioCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createUsuarioCliente`(
	in nom varchar(60),
    in ape varchar(60),
    in mail varchar(100),
    in tel varchar(9),
    in direc varchar(200),
    in nick varchar(40),
    in pass varchar(20),
    in tipo int
)
BEGIN
	insert into dbpersona(nombre,apellido,correo,telefono,direccion) values (nom,ape,mail,tel,direc);
	set @per:= (select max(id_persona) as id_persona from dbpersona);
	insert into dbusuario(nickname,clave,id_persona,id_rol) values (nick,pass,@per,tipo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarUsuario`(
in cod int
)
BEGIN
delete from dbpersona where id_persona = cod;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listaDisponiblesVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listaDisponiblesVenta`()
BEGIN
select lib.id_libro,lib.titulo
from dblibroventa libv right join dblibro lib on lib.id_libro = libv.id_libro 
where libv.stock is null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listaInventarioAlquiler` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listaInventarioAlquiler`()
BEGIN
select lib.id_libro,lib.titulo,lib.portada,lib.costo,liba.existencia
from dblibroalquiler liba
inner join dblibro lib on lib.id_libro = liba.id_libro order by liba.reg_LibroAlquiler desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listaInventarioVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listaInventarioVenta`()
BEGIN
select lib.id_libro,lib.titulo,lib.portada,libv.precio_venta,lib.costo,libv.stock,libv.existencia
from dblibroventa libv
inner join dblibro lib on lib.id_libro = libv.id_libro 
order by libv.reg_libroVenta desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `llenarSesion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `llenarSesion`(
	in usr varchar(30),
    in clv varchar(30)
)
BEGIN
	Select p.nombre, p.apellido, u.nickname, r.rol, p.correo, p.telefono, p.direccion
    from dbusuario u 
    inner join dbpersona p on u.id_persona = p.id_persona 
    inner join dbRol r on u.id_rol = r.id_rol 
    where u.nickname=usr and u.clave =clv;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `llenarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `llenarUsuario`()
BEGIN
	Select u.id_usr, p.nombre, p.apellido, u.nickname, r.rol, p.correo, p.telefono, p.direccion 
    from dbusuario u 
    inner join dbpersona p on u.id_persona = p.id_persona 
    inner join dbRol r on u.id_rol = r.id_rol order by u.id_usr;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `llenarUsuarioID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `llenarUsuarioID`(
in cod int
)
BEGIN
	Select u.id_usr, p.nombre, p.apellido, u.nickname, r.rol, p.correo, p.telefono, p.direccion, u.clave 
    from dbusuario u 
    inner join dbpersona p on u.id_persona = p.id_persona 
    inner join dbRol r on u.id_rol = r.id_rol 
    where id_usr = cod;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spActualizarLibro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarLibro`(
	in id_l int,
    in tit varchar(100),
    in id_aut int,
    in id_edi int,
    in id_gen int,
    in sinop text,
    in cost decimal(10,2),
    in id_est int
)
BEGIN
	update dblibro set titulo = tit, id_autor = id_aut, id_editorial=id_edi,id_genero=id_gen,sinopsis=sinop,costo=cost,id_estante=id_est where id_libro=id_l;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spEliminarLibro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spEliminarLibro`(
	in id int
)
BEGIN
	delete from dblibro where id_libro=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGuardarImagen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGuardarImagen`(
in id int,
in porta varchar(100)
)
BEGIN
	UPDATE dblibro set portada=porta where id_libro=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGuardarInfoLibro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGuardarInfoLibro`(
	in tit varchar(100),
    in id_aut int,
    in id_edi int,
    in id_gen int,
    in sinop text,
    in porta varchar(80),
    in cost decimal(10,2),
    in id_est int
)
BEGIN
	insert into dblibro(titulo,id_autor,id_editorial,id_genero, sinopsis, portada,costo,id_estante) 
    values (tit,id_aut,id_edi,id_gen,sinop,porta,cost,id_est);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spListaAutores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spListaAutores`()
BEGIN
	select * from dbautor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spListaEditorial` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spListaEditorial`()
BEGIN
	select * from dbEditorial;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spListaEstante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spListaEstante`()
BEGIN
select est.id_estante,pas.id_pasillo, est.numero_estante, pas.pasillo
from dbestante est
inner join dbpasillo pas on pas.id_pasillo = est.id_pasillo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spListaGenero` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spListaGenero`()
BEGIN
	select * from dbgenero;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spListaLibro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spListaLibro`()
BEGIN
select lib.id_libro,lib.titulo,lib.costo,lib.portada,lib.sinopsis,aut.nombre,aut.apellido,gen.genero,edi.editorial,pas.id_pasillo,est.numero_estante 
from dblibro lib
inner join dbautor aut on aut.id_autor = lib.id_autor
inner join dbgenero gen on gen.id_genero = lib.id_genero
inner join dbeditorial edi on edi.id_editorial = lib.id_editorial
inner join dbestante est on est.id_estante = lib.id_estante
inner join dbpasillo pas on pas.id_pasillo = est.id_pasillo order by lib.id_libro desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spRecuperarLibro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spRecuperarLibro`(
	in id int
)
BEGIN
	select * from dblibro where id_libro=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-07 23:09:14
