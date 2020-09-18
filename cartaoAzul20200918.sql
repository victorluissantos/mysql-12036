CREATE DATABASE  IF NOT EXISTS `cartao_azul` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `cartao_azul`;
-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: cartao_azul
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
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identificador` varchar(14) COLLATE utf8_bin NOT NULL,
  `senha` varchar(150) COLLATE utf8_bin NOT NULL,
  `nome` varchar(42) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `celular` varchar(14) COLLATE utf8_bin DEFAULT NULL,
  `telefone` varchar(14) COLLATE utf8_bin DEFAULT NULL,
  `uf` enum('PR','SP','SC','RS','SE') COLLATE utf8_bin NOT NULL DEFAULT 'PR',
  `cidade` varchar(65) COLLATE utf8_bin DEFAULT NULL,
  `tipo` enum('CPF','CNPJ') COLLATE utf8_bin NOT NULL DEFAULT 'CPF',
  `situacao` enum('Ativo','Inativo','Bloqueado','Suspenso','Excluído') COLLATE utf8_bin DEFAULT 'Ativo',
  PRIMARY KEY (`id`),
  KEY `idx_situacao` (`situacao`),
  KEY `idx_uf` (`uf`),
  KEY `idx_cidade` (`cidade`),
  KEY `idx_tipo` (`tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'33314907841','e10adc3949ba59abbe56e057f20f883e','vicTOR Luis dOS SANTOS XAVIER DA SILVA con',NULL,NULL,NULL,'PR',NULL,'CPF','Ativo'),(2,'12398754309','123','AAA',NULL,NULL,NULL,'PR',NULL,'CPF','Ativo'),(3,'12398754309','123','Victor L. Con',NULL,NULL,NULL,'PR',NULL,'CPF','Ativo'),(4,'12398754309','123','Victor L. Santos',NULL,NULL,NULL,'PR',NULL,'CPF','Ativo'),(5,'12398754309','123','22',NULL,NULL,NULL,'PR',NULL,'CPF','Ativo'),(6,'12398754309','123','42',NULL,NULL,NULL,'PR',NULL,'CPF','Ativo'),(7,'12398754309','123','Victor L. Dev',NULL,NULL,NULL,'PR',NULL,'CPF','Ativo'),(8,'12398754309','123','Victor L. Dev',NULL,NULL,NULL,'PR',NULL,'CPF','Ativo'),(9,'12398754309','123','Victor L. Dev',NULL,NULL,NULL,'PR',NULL,'CPF','Ativo'),(10,'12398754309','123','vicTOR Luis dOS SANTOS XAVIER DA SILVA dev',NULL,NULL,NULL,'PR',NULL,'CPF','Ativo'),(11,'12398754309','123','vicTOR Luis dOS SANTOS XAVIER DA SILVA dev',NULL,NULL,NULL,'PR',NULL,'CPF','Ativo'),(12,'12398754309','123','vicTOR Luis dOS SANTOS XAVIER DA SILVA dev',NULL,NULL,NULL,'PR',NULL,'CPF','Ativo'),(13,'12398754309','123','42',NULL,NULL,NULL,'PR',NULL,'CPF','Ativo'),(14,'12398754309','123','vicTOR Luis dOS SANTOS XAVIER DA SILVA dev',NULL,NULL,NULL,'PR',NULL,'CPF','Ativo'),(15,'12398754309','123','Victor L. Dev',NULL,NULL,NULL,'PR',NULL,'CPF','Ativo');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cartao_azul`.`usuarios_BEFORE_INSERT` BEFORE INSERT ON `usuarios` FOR EACH ROW
BEGIN
	IF LENGTH(NEW.identificador) > 11 THEN
		SET NEW.tipo = 'CNPJ';
	ELSE
		SET NEW.tipo = 'CPF';
	END IF;
    
    IF LENGTH(NEW.nome) = 42 THEN
		SET NEW.nome = CREATE_NICK_NAME(NEw.nome);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cartao_azul`.`usuarios_BEFORE_UPDATE` BEFORE UPDATE ON `usuarios` FOR EACH ROW
BEGIN
    IF LENGTH(NEW.nome) = 42 THEN
		SET NEW.nome = CREATE_NICK_NAME(NEw.nome);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'cartao_azul'
--

--
-- Dumping routines for database 'cartao_azul'
--
/*!50003 DROP FUNCTION IF EXISTS `create_nick_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `create_nick_name`(nome VARCHAR(250)) RETURNS varchar(42) CHARSET utf8 COLLATE utf8_bin
BEGIN
	DECLARE nickname VARCHAR(42);
    DECLARE primeiro_letra VARCHAR(1);
    DECLARE primeiro_restante VARCHAR(29);
    DECLARE primeiro_nome VARCHAR(30);
    DECLARE fatia_meio VARCHAR(220);
    DECLARE letra_meio VARCHAR(2);
	DECLARE ultimo_letra VARCHAR(1);
    DECLARE ultimo_restante VARCHAR(29);
    DECLARE ultimo_nome VARCHAR(30);
    
    SET primeiro_letra = (SELECT UPPER(SUBSTR(TRIM(nome), 1, 1)));
    
    SET primeiro_restante = (SELECT 
								LOWER(
									SUBSTR(TRIM(nome),
											2,
										LENGTH(
											SUBSTRING_INDEX(TRIM(nome), 
                                            ' ', 
                                            1)
										)-1
									)
								)
							);
    
    SET primeiro_nome = (SELECT CONCAT(primeiro_letra,primeiro_restante));
    
    SET ultimo_letra = (SELECT UPPER(SUBSTR(SUBSTRING_INDEX(TRIM(nome), ' ', -1), 1,1)));
    
    SET ultimo_restante = (SELECT 
								LOWER(
									SUBSTR(
										SUBSTRING_INDEX(
											TRIM(nome), 
                                            ' ', -1)
									, 2,
                                    LENGTH(
											SUBSTRING_INDEX(TRIM(nome), 
                                            ' ', 
                                            -1)
										)
                                    )));
    
    SET ultimo_nome = (SELECT CONCAT(ultimo_letra, ultimo_restante));
    
    SET fatia_meio = (SELECT SUBSTR(nome, 
								LENGTH(primeiro_nome)+2,
                                (LENGTH(primeiro_nome)+LENGTH(ultimo_nome))
                                )
    
						);
    
    SET letra_meio = (SELECT CONCAT(UPPER(SUBSTR(fatia_meio, 1,1)),'.'));
    
	SET nickname = (SELECT CONCAT(primeiro_nome,' ',letra_meio,' ', ultimo_nome));

	RETURN nickname;
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

-- Dump completed on 2020-09-18 19:02:25
