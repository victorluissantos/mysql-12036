CREATE DATABASE  IF NOT EXISTS `barbearia` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `barbearia`;
-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: barbearia
-- ------------------------------------------------------
-- Server version	5.6.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) COLLATE utf8_bin NOT NULL,
  `email` varchar(80) COLLATE utf8_bin NOT NULL,
  `uf` enum('PR','SP','MS','PI','RS','SC') CHARACTER SET utf8 NOT NULL DEFAULT 'SC',
  `cidade` varchar(85) COLLATE utf8_bin DEFAULT NULL,
  `status` enum('Ativo','Inativo','Excluido','Suspenso') COLLATE utf8_bin NOT NULL DEFAULT 'Ativo',
  `data_nascimento` date DEFAULT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Victor Luis','victorluissantos@live.com','PR','Curitiba','Ativo','1993-01-10','2001-09-03 12:22:10'),(2,'Maria Fernanda','maria.fernando@clansoftware.com.br','SP','Ourinhos','Ativo','1964-02-23','2012-02-13 09:22:10'),(3,'Joao Pessoa','jose@reciclagemead.com.br','SP','Bauru','Ativo','1982-07-12','2010-03-23 10:12:10'),(4,'Helena Debiasi','helena@reciclagemead.com.br','PR','Andira','Ativo','1987-01-10','2020-02-03 22:22:10'),(5,'Santos Luis','santos.luis@reciclagemead.com.br','PR','Curitiba','Ativo','1991-01-17','2020-02-17 10:20:10'),(6,'Heitor Cordeiro','heitor.cordeiro@reciclagemead.com.br','PR','Curitiba','Ativo','2019-08-05','2009-01-20 20:30:10'),(7,'Rafael Guiamaraes','rafael.guiamaraes@reciclagemead.com.br','SC','Florianopolis','Ativo','1994-08-26','2019-08-26 12:38:19'),(8,'Clementina Santos','tininha@pesquisatudo.com.br','SC','Florianopolis','Ativo','1952-11-22','2018-01-23 22:22:10'),(10,'Caroline Rosi','rosi.carol@reciclagemead.com.br','PR','Cambe','Ativo','2005-12-26','2018-12-26 09:52:40');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprovante_servicos`
--

DROP TABLE IF EXISTS `comprovante_servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comprovante_servicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comprovante_id` int(11) NOT NULL,
  `servico_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comprovante_servico_idx` (`servico_id`),
  KEY `fk_comprovante_comprovante_idx` (`comprovante_id`),
  CONSTRAINT `fk_comprovante_comprovante` FOREIGN KEY (`comprovante_id`) REFERENCES `comprovantes` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_comprovante_servico` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprovante_servicos`
--

LOCK TABLES `comprovante_servicos` WRITE;
/*!40000 ALTER TABLE `comprovante_servicos` DISABLE KEYS */;
INSERT INTO `comprovante_servicos` VALUES (21,1,1),(22,13,1),(23,3,3),(24,1,2),(25,4,4),(26,1,5),(27,10,2),(28,7,1),(29,8,1),(30,9,4),(31,11,5),(32,12,1),(33,6,7),(34,6,8);
/*!40000 ALTER TABLE `comprovante_servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprovantes`
--

DROP TABLE IF EXISTS `comprovantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comprovantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL,
  `data_transacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `forma` enum('Cartao','Dinheiro','Boleto') CHARACTER SET utf8 NOT NULL DEFAULT 'Dinheiro',
  `valor` decimal(5,2) NOT NULL,
  `data_captura` datetime DEFAULT NULL,
  `aprovado` enum('Sim','Nao') COLLATE utf8_bin NOT NULL DEFAULT 'Sim',
  PRIMARY KEY (`id`),
  KEY `fk_comprovantes_cliente_idx` (`cliente_id`),
  CONSTRAINT `fk_comprovantes_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprovantes`
--

LOCK TABLES `comprovantes` WRITE;
/*!40000 ALTER TABLE `comprovantes` DISABLE KEYS */;
INSERT INTO `comprovantes` VALUES (1,2,'2020-09-01 23:31:15','Cartao',32.90,'2020-09-01 23:31:15','Sim'),(3,1,'2020-09-01 23:47:23','Cartao',15.90,'2020-09-01 23:45:00','Sim'),(4,2,'2020-09-01 23:47:34','Cartao',25.90,'2020-09-01 23:45:00','Sim'),(5,1,'2020-09-01 23:47:49','Cartao',35.90,'0000-00-00 00:00:00','Nao'),(6,4,'2020-09-01 23:48:13','Cartao',55.90,'2020-09-01 22:45:00','Nao'),(7,8,'2020-09-01 23:48:43','Dinheiro',32.90,NULL,'Nao'),(8,10,'2020-09-01 23:49:01','Cartao',42.90,NULL,'Sim'),(9,5,'2020-09-01 23:49:34','Dinheiro',81.25,'2020-09-01 23:59:00','Sim'),(10,6,'2020-09-01 23:49:47','Dinheiro',81.25,'2020-09-01 23:59:00','Sim'),(11,7,'2020-09-01 23:50:02','Dinheiro',81.25,'2020-08-29 21:59:00','Sim'),(12,8,'2020-09-01 23:50:23','Dinheiro',81.25,NULL,'Nao'),(13,10,'2020-09-01 23:51:38','Cartao',81.25,NULL,'Nao'),(14,8,'2020-09-03 00:00:20','Dinheiro',32.74,'2020-09-03 00:00:20','Sim'),(15,4,'2020-09-03 00:00:20','Boleto',0.00,NULL,'Nao'),(16,6,'2020-09-03 23:56:51','Boleto',0.00,NULL,'Nao'),(17,7,'2020-09-01 23:50:23','Boleto',0.00,NULL,'Nao'),(18,8,'2020-08-29 23:50:23','Boleto',0.00,NULL,'Nao');
/*!40000 ALTER TABLE `comprovantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicos`
--

DROP TABLE IF EXISTS `servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8_bin NOT NULL,
  `valor` decimal(5,2) NOT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicos`
--

LOCK TABLES `servicos` WRITE;
/*!40000 ALTER TABLE `servicos` DISABLE KEYS */;
INSERT INTO `servicos` VALUES (1,'Corte Cabelo Masculino',30.00,'2020-09-02 23:04:02'),(2,'Corte Cabelo Feminino',89.99,'2020-09-02 23:04:02'),(3,'Barba',15.00,'2020-09-02 23:04:02'),(4,'Bigote',9.99,'2020-09-02 23:04:02'),(5,'Unha Masculina',19.90,'2020-09-02 23:04:02'),(6,'Unha Feminina',30.00,'2020-09-02 23:04:02'),(7,'Progressiva',190.00,'2020-09-02 23:04:02'),(8,'Corte Cabelo Masculino',22.90,'2019-01-02 18:04:02');
/*!40000 ALTER TABLE `servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'barbearia'
--

--
-- Dumping routines for database 'barbearia'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-09 19:05:45
