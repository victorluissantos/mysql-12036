CREATE DATABASE  IF NOT EXISTS `eagendas` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `eagendas`;
-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: eagendas
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
-- Table structure for table `compromissos`
--

DROP TABLE IF EXISTS `compromissos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compromissos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `anotacao` varchar(320) COLLATE utf8_bin DEFAULT NULL,
  `data_criacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ocorrencia` enum('diaria','semanal','mensal','anual','unica') COLLATE utf8_bin NOT NULL DEFAULT 'unica',
  `alerta` enum('mes','dia','hora','minuto') COLLATE utf8_bin DEFAULT NULL,
  `alerta_valor` int(11) DEFAULT NULL,
  `data_compromisso` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ocorrencia` (`ocorrencia`),
  KEY `idx_alerta` (`alerta`),
  KEY `fk_compromissos_usuario_idx` (`usuario_id`),
  CONSTRAINT `fk_compromissos_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compromissos`
--

LOCK TABLES `compromissos` WRITE;
/*!40000 ALTER TABLE `compromissos` DISABLE KEYS */;
/*!40000 ALTER TABLE `compromissos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) COLLATE utf8_bin NOT NULL,
  `email` varchar(80) COLLATE utf8_bin NOT NULL,
  `telefone` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `celular` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `senha` varchar(250) COLLATE utf8_bin NOT NULL,
  `status` enum('Ativo','Inativo') COLLATE utf8_bin NOT NULL DEFAULT 'Ativo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8 COLLATE=utf8_bin DELAY_KEY_WRITE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1000,'Diego','diego.garcia@clansoftware.com.br',NULL,NULL,'202cb962ac59075b964b07152d234b70','Ativo'),(1001,'Maicon','maicon.pasin@clansoftware.com.br',NULL,NULL,'caf1a3dfb505ffed0d024130f58c5cfa','Ativo'),(1002,'Miakele','mika.silva@clansoftware.com.br',NULL,NULL,'250cf8b51c773f3f8dc8b4be867a9a02','Ativo'),(1003,'Sabrine','sabrine.santos@clansoftware.com.br',NULL,NULL,'ab233b682ec355648e7891e66c54191b','Ativo'),(1004,'Heitor','heitor.cordeito@clansoftware.com.br',NULL,NULL,'68053af2923e00204c3ca7c6a3150cf7','Ativo');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'eagendas'
--

--
-- Dumping routines for database 'eagendas'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-09 21:52:44
