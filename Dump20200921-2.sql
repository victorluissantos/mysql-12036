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
-- Current Database: `eagendas`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `eagendas` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `eagendas`;

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
  `data_compromisso` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_ocorrencia` (`ocorrencia`),
  KEY `idx_alerta` (`alerta`),
  KEY `fk_compromissos_usuario_idx` (`usuario_id`),
  CONSTRAINT `fk_compromissos_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compromissos`
--

LOCK TABLES `compromissos` WRITE;
/*!40000 ALTER TABLE `compromissos` DISABLE KEYS */;
INSERT INTO `compromissos` VALUES (1,1002,NULL,'2020-09-10 22:30:55','mensal',NULL,NULL,'2020-11-11 19:03:55'),(2,1001,NULL,'2020-09-10 22:30:55','unica','mes',6,'2020-01-10 20:30:55'),(3,1001,NULL,'2020-09-10 22:30:55','diaria','dia',7,'2022-11-11 19:03:55'),(4,1002,NULL,'2020-09-10 22:30:55','unica','hora',2,'2020-07-10 12:30:55'),(5,1002,NULL,'2020-09-10 22:30:55','mensal','hora',5,'2020-01-10 14:53:55'),(6,1000,NULL,'2020-09-10 22:30:55','unica','dia',3,'2020-01-10 08:40:55'),(7,1004,NULL,'2020-09-10 22:30:55','unica','hora',1,'2020-07-14 09:33:55'),(8,1002,NULL,'2020-09-10 22:30:55','unica',NULL,NULL,'2020-12-10 07:30:55'),(9,1000,NULL,'2020-09-10 22:30:55','diaria',NULL,NULL,'2020-06-10 09:23:30'),(10,1004,NULL,'2020-09-10 22:30:55','diaria','hora',2,'2020-09-10 04:30:55'),(11,1002,NULL,'2020-09-10 22:30:55','diaria','mes',3,'2021-01-09 23:59:55'),(12,1003,NULL,'2020-09-10 22:30:55','anual','minuto',5,'2020-12-25 23:59:55'),(13,1000,NULL,'2020-09-10 22:30:55','unica','minuto',10,'2020-11-20 16:19:55'),(14,1004,NULL,'2020-09-10 22:30:55','unica','minuto',15,'2020-10-21 13:49:15'),(15,1004,NULL,'2020-09-10 22:30:55','mensal',NULL,NULL,'2020-09-03 17:19:55'),(16,1004,NULL,'2020-09-10 22:30:55','unica',NULL,NULL,'2020-09-23 17:19:55'),(17,1003,NULL,'2020-09-10 22:30:55','semanal','minuto',32,'2020-09-25 09:10:55'),(18,1000,NULL,'2020-09-10 22:30:55','semanal','minuto',30,'2020-09-13 18:10:55'),(19,1001,NULL,'2020-09-10 22:30:55','unica','dia',1,'2020-09-16 17:25:55'),(20,1004,NULL,'2020-09-10 22:30:55','semanal','hora',4,'2020-10-18 13:11:55'),(21,1001,NULL,'2020-09-10 22:37:15','mensal',NULL,NULL,'2020-10-19 15:12:55'),(22,1003,NULL,'2020-09-10 22:37:15','mensal',NULL,NULL,'2020-09-20 12:19:55'),(43,1002,NULL,'2020-09-15 21:45:11','unica',NULL,NULL,'2020-09-15 21:45:11'),(44,1002,NULL,'2020-09-15 21:45:11','unica',NULL,NULL,'2020-09-15 21:45:11'),(45,1005,NULL,'2020-09-15 21:45:11','unica',NULL,NULL,'2020-09-15 21:45:11'),(46,1003,NULL,'2020-09-15 21:45:11','unica',NULL,NULL,'2020-09-15 21:45:11'),(47,1004,NULL,'2020-09-15 21:45:11','unica',NULL,NULL,'2020-09-15 21:45:11'),(48,1002,NULL,'2020-09-15 21:45:11','unica',NULL,NULL,'2020-09-15 21:45:11'),(49,1005,NULL,'2020-09-15 21:45:11','unica',NULL,NULL,'2020-09-15 21:45:11'),(50,1004,NULL,'2020-09-15 21:45:11','unica',NULL,NULL,'2020-09-15 21:45:11'),(51,1001,NULL,'2020-09-15 21:45:11','unica',NULL,NULL,'2020-09-15 21:45:11'),(52,1000,NULL,'2020-09-15 21:45:11','unica',NULL,NULL,'2020-09-15 21:45:11');
/*!40000 ALTER TABLE `compromissos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `lista_usuario_compromissos`
--

DROP TABLE IF EXISTS `lista_usuario_compromissos`;
/*!50001 DROP VIEW IF EXISTS `lista_usuario_compromissos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `lista_usuario_compromissos` AS SELECT 
 1 AS `compromisso`,
 1 AS `data_compromisso`,
 1 AS `Convidado`,
 1 AS `situacao`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `marcacoes`
--

DROP TABLE IF EXISTS `marcacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marcacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compromisso_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `situacao` enum('Convidado','Lido','Confirmado','Justificado','Falta') COLLATE utf8_bin NOT NULL DEFAULT 'Convidado' COMMENT 'Convidado => quando o usuario criador do compromisso criou a marcacao\nLido => Quando o usuario marcado, visualizar a marcacao\nConfirmado => Quando o usuario marcado ao compromisso, confirmar presenca\nJustificado => Quando o usuario marcado ao compromisso, informa que nao ira e justifica sua falta\nFalta => Quando o usuario marcado ao compromisso, confirma ou nao le o compromisso e nao comparece',
  `data_criacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_atualizacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_situacao` (`situacao`),
  KEY `fk_marcacoes_compromisso_idx` (`compromisso_id`),
  KEY `fk_marcacoes_usuario_idx` (`usuario_id`),
  CONSTRAINT `fk_marcacoes_compromisso` FOREIGN KEY (`compromisso_id`) REFERENCES `compromissos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_marcacoes_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcacoes`
--

LOCK TABLES `marcacoes` WRITE;
/*!40000 ALTER TABLE `marcacoes` DISABLE KEYS */;
INSERT INTO `marcacoes` VALUES (23,1,1000,'Convidado','2020-09-10 23:49:54',NULL),(24,2,1005,'Lido','2020-09-10 13:49:54','2020-09-10 11:20:00'),(25,3,1001,'Convidado','2020-09-10 23:49:54',NULL),(26,4,1004,'Lido','2020-09-10 23:49:54','2020-09-05 11:35:07'),(27,5,1002,'Lido','2020-09-10 23:49:54','2020-08-14 19:35:07'),(28,6,1002,'Lido','2020-09-10 23:49:54','2020-08-12 09:35:07'),(29,7,1001,'Convidado','2020-09-10 23:49:54',NULL),(30,8,1000,'Confirmado','2020-09-10 23:49:54','2020-08-12 09:35:07'),(31,9,1000,'Confirmado','2020-09-10 23:49:54','2020-10-05 12:23:07'),(32,10,1004,'Confirmado','2020-09-10 23:49:54','2020-10-05 08:23:07'),(33,11,1005,'Convidado','2020-09-10 23:49:54',NULL),(34,11,1001,'Justificado','2020-09-10 23:49:54','2020-07-08 08:23:07'),(35,12,1002,'Justificado','2020-09-10 23:49:54','2020-09-08 18:23:07'),(36,13,1002,'Lido','2020-09-10 23:49:54','2020-09-10 08:23:07'),(37,14,1003,'Convidado','2020-09-10 23:49:54',NULL),(38,15,1003,'Convidado','2020-09-10 23:49:54',NULL),(39,16,1002,'Falta','2020-09-10 23:49:54','2020-09-23 00:00:00'),(40,21,1001,'Convidado','2020-09-10 23:49:54',NULL),(41,22,1000,'Falta','2020-09-10 23:49:54','2020-09-20 00:00:00'),(42,21,1000,'Falta','2020-09-10 23:49:54','2020-10-19 00:00:00'),(43,13,1004,'Convidado','2020-09-10 23:49:54',NULL),(44,2,1005,'Lido','2020-09-10 23:49:54','2020-08-02 15:25:07');
/*!40000 ALTER TABLE `marcacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `ranking_marcacoes`
--

DROP TABLE IF EXISTS `ranking_marcacoes`;
/*!50001 DROP VIEW IF EXISTS `ranking_marcacoes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ranking_marcacoes` AS SELECT 
 1 AS `nome`,
 1 AS `marcacoes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ranking_marcado`
--

DROP TABLE IF EXISTS `ranking_marcado`;
/*!50001 DROP VIEW IF EXISTS `ranking_marcado`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ranking_marcado` AS SELECT 
 1 AS `nome`,
 1 AS `marcacoes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `relatorio_geral`
--

DROP TABLE IF EXISTS `relatorio_geral`;
/*!50001 DROP VIEW IF EXISTS `relatorio_geral`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `relatorio_geral` AS SELECT 
 1 AS `usuario`,
 1 AS `nome`,
 1 AS `data`,
 1 AS `marcacoes`,
 1 AS `qtd_convidados`,
 1 AS `lido`,
 1 AS `confirmado`,
 1 AS `justificado`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tabela_a`
--

DROP TABLE IF EXISTS `tabela_a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tabela_a` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registroa` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabela_a`
--

LOCK TABLES `tabela_a` WRITE;
/*!40000 ALTER TABLE `tabela_a` DISABLE KEYS */;
INSERT INTO `tabela_a` VALUES (1,'Julio'),(2,'Heitor'),(3,'Victor');
/*!40000 ALTER TABLE `tabela_a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabela_b`
--

DROP TABLE IF EXISTS `tabela_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tabela_b` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tabela_a_id` int(11) NOT NULL,
  `registrob` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabela_b`
--

LOCK TABLES `tabela_b` WRITE;
/*!40000 ALTER TABLE `tabela_b` DISABLE KEYS */;
INSERT INTO `tabela_b` VALUES (1,1,'Banana'),(2,1,'Maca'),(3,2,'Pera'),(4,1,'Uva'),(5,2,'Melancia'),(6,4,'Acai');
/*!40000 ALTER TABLE `tabela_b` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=1007 DEFAULT CHARSET=utf8 COLLATE=utf8_bin DELAY_KEY_WRITE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1000,'Diego','diego.garcia@clansoftware.com.br',NULL,NULL,'202cb962ac59075b964b07152d234b70','Ativo'),(1001,'Maicon','maicon.pasin@clansoftware.com.br',NULL,NULL,'caf1a3dfb505ffed0d024130f58c5cfa','Ativo'),(1002,'Miakele','mika.silva@clansoftware.com.br',NULL,NULL,'250cf8b51c773f3f8dc8b4be867a9a02','Ativo'),(1003,'Sabrine','sabrine.santos@clansoftware.com.br',NULL,NULL,'ab233b682ec355648e7891e66c54191b','Ativo'),(1004,'Heitor','heitor.cordeito@clansoftware.com.br',NULL,NULL,'68053af2923e00204c3ca7c6a3150cf7','Ativo'),(1005,'Julio','julio.brito@reciclagemead.com.br',NULL,NULL,'julio123','Ativo'),(1006,'Dayane','dayane@clansoftware.com.br',NULL,NULL,'clan','Ativo');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `usuarios_compromissos_qtd`
--

DROP TABLE IF EXISTS `usuarios_compromissos_qtd`;
/*!50001 DROP VIEW IF EXISTS `usuarios_compromissos_qtd`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `usuarios_compromissos_qtd` AS SELECT 
 1 AS `usuario`,
 1 AS `nome`,
 1 AS `data`,
 1 AS `marcacoes`,
 1 AS `qtd_convidados`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `usuarios_compromisss_marcacoes`
--

DROP TABLE IF EXISTS `usuarios_compromisss_marcacoes`;
/*!50001 DROP VIEW IF EXISTS `usuarios_compromisss_marcacoes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `usuarios_compromisss_marcacoes` AS SELECT 
 1 AS `usuario`,
 1 AS `nome`,
 1 AS `data`,
 1 AS `macacoes`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'eagendas'
--

--
-- Dumping routines for database 'eagendas'
--
/*!50003 DROP FUNCTION IF EXISTS `countEventos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `countEventos`(usuario INTEGER, mes INTEGER) RETURNS int(11)
BEGIN
	DECLARE total_compromissos INTEGER;
    DECLARE total_marcacoes INTEGER;
    
    SET total_compromissos = (
				SELECT 
					count(c.id)
				FROM
					compromissos c
				WHERE
					c.usuario_id = usuario
                    AND
                    MONTH(c.data_compromisso) = mes
            );
	
    SET total_marcacoes = (
				SELECT
					count(m.id)
				FROM
					marcacoes m
                    INNER JOIN
                    compromissos c ON m.compromisso_id = c.id
				WHERE
					m.usuario_id = usuario
                    AND
                    MONTH(c.data_compromisso) = mes
            );
    
	RETURN total_compromissos+total_marcacoes;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `faltas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `faltas`(usuario Integer) RETURNS int(11)
BEGIN
	RETURN (SELECT 
				count(m.id)
			FROM
				marcacoes m
			WHERE
				m.situacao in ('Lido', 'Falta')
                AND
                m.usuario_id = usuario);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getMes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `getMes`(mes INTEGER) RETURNS varchar(10) CHARSET utf8 COLLATE utf8_bin
BEGIN

	DECLARE letreiro VARCHAR(10);
    
    IF mes = 1 THEN
		SET letreiro = 'Janeiro';
	ELSEIF mes = 2 THEN
		SET letreiro = 'Fevereiro';
	ELSEIF mes = 3 THEN
		SET letreiro = 'Março';
    ELSEIF mes = 4 THEN
		SET letreiro = 'Abril';
	ELSEIF mes = 5 THEN
		SET letreiro = 'Maio';
	ELSEIF mes = 6 THEN
		SET letreiro = 'Junho';
	ELSEIF mes = 7 THEN
		SET letreiro = 'Julho';
	ELSEIF mes = 8 THEN
		SET letreiro = 'Agosto';
	ELSEIF mes = 9 THEN
		SET letreiro = 'Setembro';
	ELSEIF mes = 10 THEN
		SET letreiro = 'Outubro';
	ELSEIF mes = 11 THEN
		SET letreiro = 'Novembro';
	ELSE
		SET letreiro = 'Dezembro';
    END IF;
	RETURN letreiro;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `media_acao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `media_acao`(usuario INTEGER) RETURNS varchar(30) CHARSET utf8 COLLATE utf8_bin
BEGIN
	DECLARE qt_marcacoes INTEGER;
    DECLARE total_tempo INTEGER; -- soma de tempo que o usuario levou para responde
	DECLARE retorno VARCHAR(30);
    
    SET qt_marcacoes = (SELECT 
							COUNT(m.id) 
						FROM 
							marcacoes m 
						WHERE 
							m.usuario_id = usuario);
    
    SET total_tempo = (SELECT 
							SUM(TIMESTAMPDIFF(MINUTE, m.data_criacao, m.data_atualizacao)) 
						FROM 
							marcacoes m 
                        WHERE 
							m.data_atualizacao is not null
                            AND
							m.usuario_id = usuario);
    
	SET retorno = LTRIM(total_tempo/qt_marcacoes);
    
    IF retorno > 60 then
		SET retorno = 'mais de 1 hora';
	ELSE
		SET retorno = concat('aproximadamente ', retorno, ' minutos');
	END IF;
    
	RETURN retorno;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `n_justificados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `n_justificados`(usuario INTEGER) RETURNS int(11)
BEGIN
	DECLARE faltas INTEGER;
    SET faltas = (SELECT 
						count(m.id) as `total`
					FROM
						marcacoes m
						LEFT JOIN
						usuarios u ON m.usuario_id = u.id
						LEFT JOIN
						compromissos c ON m.compromisso_id = c.id
					WHERE
						c.data_compromisso < now()
						AND
						m.situacao = 'Lido'
                        AND
                        u.id = usuario);
    
	RETURN faltas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ocorrencias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `ocorrencias`(compromisso INTEGER) RETURNS int(11)
BEGIN
	DECLARE repeticao ENUM('diaria', 'semanal', 'mensal', 'anual', 'unica');
    DECLARE qtd_ocorrencia INTEGER;
    
	SET repeticao = (
			select c.ocorrencia FROM compromissos c WHERE c.id = compromisso
        );
	
	IF repeticao = 'diaria' THEN
		SET qtd_ocorrencia = (SELECT 
									TIMESTAMPDIFF(DAY,
										NOW(),
										c.data_compromisso)
								FROM
									compromissos c
								WHERE
									c.id = compromisso);
	ELSEIF repeticao = 'mensal' THEN
		SET qtd_ocorrencia = (SELECT 
									TIMESTAMPDIFF(MONTH,
										NOW(),
										c.data_compromisso)
								FROM
									compromissos c
								WHERE
									c.id = compromisso);
	ELSEIF repeticao = 'anual' THEN
		SET qtd_ocorrencia = (SELECT 
							TIMESTAMPDIFF(MONTH,
								NOW(),
								c.data_compromisso)
						FROM
							compromissos c
						WHERE
							c.id = compromisso);
	ELSEIF repeticao = 'semanal' THEN
		SET qtd_ocorrencia = (SELECT 
							TIMESTAMPDIFF(MONTH,
								NOW(),
								c.data_compromisso)
						FROM
							compromissos c
						WHERE
							c.id = compromisso)*4;
    ELSE
		SET qtd_ocorrencia = 1;
    END IF;
	
	RETURN qtd_ocorrencia;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `soma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `soma`(x INTEGER, y INTEGER) RETURNS int(11)
BEGIN

RETURN x+y;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `tratofeito`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `tratofeito` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `tratofeito`;

--
-- Table structure for table `colaboradores`
--

DROP TABLE IF EXISTS `colaboradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colaboradores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(15) NOT NULL,
  `senha` varchar(250) NOT NULL,
  `email` varchar(240) DEFAULT NULL,
  `telefone` varchar(14) DEFAULT NULL,
  `rua` varchar(70) DEFAULT NULL,
  `numero` varchar(12) DEFAULT NULL,
  `bairro` varchar(40) DEFAULT NULL,
  `cidade` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaboradores`
--

LOCK TABLES `colaboradores` WRITE;
/*!40000 ALTER TABLE `colaboradores` DISABLE KEYS */;
INSERT INTO `colaboradores` VALUES (1,'333.149.078-42','123','pr.victorluissantos@gmail.com','41998500511','Rua das palmeiras','617','Centro','Curitiba'),(2,'000.123.456-78','321','ATERFDSREASRE@DSSWAD.COM',NULL,'Av Salagado Filho','476','Centro','Curitiba'),(3,'123.456.987-90','311','Rodrigo@MODELO.COM',NULL,'Rua das palmeiras','12','Centro','Curitiba'),(4,'123.456.987-91','311','maicon@MODELO.COM',NULL,'Rua das palmeiras','158','Vila Isabel','Curitiba'),(5,'123.456.987-80','311','dayane@MODELO.COM',NULL,'Rua das palmeiras','155','Centro','Jakarezinho'),(6,'123.456.987-89','311','victor@MODELO.COM',NULL,'Av Salagado Filho','167','Centro','Curitiba'),(7,'123.456.987-24','311','julio@MODELO.COM',NULL,'Rua das palmeiras','157','Centro','Ourinhos'),(8,'123.456.987-78','311','heitor@MODELO.COM',NULL,'Rua das palmeiras','132','Vila Isabel','Ourinhos'),(9,'123.456.987-83','311','jaine@MODELO.COM',NULL,'Jornalista Heron','32','Centro','Curitiba'),(10,'554.726.782-99','546','cida@MODELO.COM',NULL,'Av Salagado Filho','37','Centro','Ourinhos'),(11,'554.726.782-90','546','camila@MODELO.COM',NULL,'Rua das palmeiras','190','Centro','Canitar'),(12,'554.726.782-17','546','jose@MODELO.COM',NULL,'Rua das palmeiras','196','Vila Isabel','Canitar'),(13,'554.726.782-87','546','rafael@MODELO.COM',NULL,'Jornalista Heron','1562','Centro','Curitiba'),(14,'554.726.782-67','546','orlandini@MODELO.COM',NULL,'Jornalista Heron','612','Centro','Ourinhos'),(15,'554.726.782-12','546','cesar@MODELO.COM',NULL,'Av Salagado Filho','615','Centro','Curitiba'),(16,'554.726.782-89','546','danilo@modelo.com',NULL,'Rua das palmeiras','718','Vila Isabel','Canitar'),(17,'554.726.782-23','546','cris@MODELO.COM',NULL,'Rua das palmeiras','1204','Centro','Curitiba'),(18,'726.061.246-72','6731','CORLEONE@MODELO.COM',NULL,'Rua das palmeiras','672','Vila Isabel','Canitar'),(19,'726.061.246-71','6731','CARUSO@HOTMAIL.COM',NULL,'Rua das palmeiras','109','Vila Isabel','Curitiba'),(20,'726.061.246-74','6731','BROKLYN@HOTMAIL.COM',NULL,'Av Salagado Filho','123','Vila Isabel','Curitiba'),(21,'726.061.246-90','6731','JOY@LIVE.COM',NULL,'Rua das palmeiras','256','Formosa','Curitiba'),(22,'726.061.246-80','6731','CHAVES@VILA.COM',NULL,'Rua das palmeiras','789','Centro','Jacarecinho'),(23,'726.061.246-70','6731','JULIUS@HOTMAIL.COM',NULL,'Av Salagado Filho','972','Centro','Jacarecinho'),(24,'726.061.246-60','6731','GREGORY@HOTMAIL.COM',NULL,'Rua das palmeiras','83','Formosa','Curitiba'),(25,'726.061.246-50','6731','TAXA@MODELO.COM',NULL,'Rua das palmeiras','678','Vila Isabel','Curitiba');
/*!40000 ALTER TABLE `colaboradores` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `tratofeito`.`colaboradores_BEFORE_INSERT` 
BEFORE INSERT ON `colaboradores` 
FOR EACH ROW
BEGIN
	SET NEW.email = UPPER(NEW.email);

	SET NEW.telefone = REPLACE(
					REPLACE(
						REPLACE(
							REPLACE(NEW.telefone, '(', '')
                            , ')', '')
					,'-','')
				, ' ','');
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_fantasia` varchar(80) DEFAULT NULL,
  `cnpj` varchar(25) NOT NULL,
  `senha` varchar(250) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `telefone` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,NULL,'23.476.467/0001-23','123456','teste@empresa.com','321324321'),(2,'Google Imagens SA','10.234.561/0001-24','987231','reciclagem@live.com','4145679010');
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `tratofeito`.`empresas_BEFORE_INSERT` BEFORE INSERT ON `empresas` FOR EACH ROW
BEGIN
	DECLARE hostname VARCHAR(25);

	SET NEW.telefone = REPLACE(
					REPLACE(
						REPLACE(
							REPLACE(NEW.telefone, '(', '')
                            , ')', '')
					,'-','')
				, ' ','');
    
    SET hostname = (substring_index(
							substring_index(NEW.email, '@', -1), '.', 1)
						);
                        
	IF hostname in ('live', 'hotmail', 'gmail', 'yahoo') THEN
		IF NEW.nome_fantasia IS NOT NULL THEN
			SET NEW.email = (lower(substring_index(NEW.nome_fantasia, ' ', 1)));
		END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `vagas`
--

DROP TABLE IF EXISTS `vagas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vagas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresas_id` int(11) NOT NULL,
  `titulo` varchar(60) NOT NULL,
  `descritivo` varchar(450) DEFAULT NULL,
  `situacao` enum('Ativo','Inativo','Excluido') NOT NULL DEFAULT 'Ativo',
  PRIMARY KEY (`id`),
  KEY `fk_vagas_empresas_idx` (`empresas_id`),
  CONSTRAINT `fk_vagas_empresas` FOREIGN KEY (`empresas_id`) REFERENCES `empresas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vagas`
--

LOCK TABLES `vagas` WRITE;
/*!40000 ALTER TABLE `vagas` DISABLE KEYS */;
INSERT INTO `vagas` VALUES (1,1,'aaa','bbb','Excluido'),(8,1,'aaa','bbb','Excluido'),(9,1,'bbb','bbcc','Excluido'),(10,1,'ccc','ccbb','Excluido'),(11,2,'r4fvvfr4','freres','Excluido'),(12,2,'y6hnhn6y','32r23','Excluido'),(13,1,'dsads','dsadsa','Excluido'),(14,2,'rehgefyuds','asddgfasty','Ativo'),(15,2,'khgjhf','yiotr','Ativo'),(16,1,'tierhutheru','rtner','Excluido');
/*!40000 ALTER TABLE `vagas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `tratofeito`.`vagas_BEFORE_INSERT` BEFORE INSERT ON `vagas` FOR EACH ROW
BEGIN

	DECLARE vaga_id INTEGER;
    SET vaga_id = null;
    SET vaga_id = (SELECT 
						v.id 
					FROM 
						vagas v
					WHERE
						v.empresas_id = NEW.empresas_id
							AND
						UPPER(v.titulo) = UPPER(NEW.titulo)
							AND
						UPPER(v.descritivo) = UPPER(NEW.descritivo)
					);
	
    IF vaga_id is not null then
		SET NEW.situacao = 'Excluido';
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `vagas_has_colaboradores`
--

DROP TABLE IF EXISTS `vagas_has_colaboradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vagas_has_colaboradores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vagas_id` int(11) NOT NULL,
  `colaboradores_id` int(11) NOT NULL,
  `situacao` enum('Ativo','Inativo','Excluido') NOT NULL DEFAULT 'Ativo',
  PRIMARY KEY (`id`,`vagas_id`,`colaboradores_id`),
  KEY `fk_vagas_has_colaboradores_colaboradores1_idx` (`colaboradores_id`),
  KEY `fk_vagas_has_colaboradores_vagas1_idx` (`vagas_id`),
  CONSTRAINT `fk_vagas_has_colaboradores_colaboradores1` FOREIGN KEY (`colaboradores_id`) REFERENCES `colaboradores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_vagas_has_colaboradores_vagas1` FOREIGN KEY (`vagas_id`) REFERENCES `vagas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vagas_has_colaboradores`
--

LOCK TABLES `vagas_has_colaboradores` WRITE;
/*!40000 ALTER TABLE `vagas_has_colaboradores` DISABLE KEYS */;
INSERT INTO `vagas_has_colaboradores` VALUES (1,1,1,'Ativo'),(2,1,1,'Excluido'),(3,1,2,'Ativo'),(4,1,4,'Ativo'),(5,8,4,'Ativo'),(6,9,4,'Ativo'),(7,10,4,'Ativo');
/*!40000 ALTER TABLE `vagas_has_colaboradores` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `tratofeito`.`vagas_has_colaboradores_BEFORE_INSERT` BEFORE INSERT ON `vagas_has_colaboradores` FOR EACH ROW
BEGIN
	DECLARE vagahascolborador INTEGER;
    SET vagahascolborador = (
			SELECT 
				id 
			FROM 
				vagas_has_colaboradores
			WHERE
				vagas_id = NEW.vagas_id
                AND
                colaboradores_id = NEW.colaboradores_id
        );
	IF vagahascolborador IS NOT NULL THEN
		SET NEW.situacao = 'Excluido';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'tratofeito'
--

--
-- Dumping routines for database 'tratofeito'
--
/*!50003 DROP PROCEDURE IF EXISTS `allEmailAndNames` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `allEmailAndNames`(allSchemes VARCHAR(250))
BEGIN 
	DECLARE qtd INT; 
    DECLARE i INT DEFAULT 0;
    
    SET qtd = (SELECT length(allSchemes) - length(REPLACE(allSchemes, ',', ''))); 
    
    WHILE i <= qtd DO 
		IF (SELECT LOCATE("barbearia", AllSchemes)) > 0 then 
			select
				bc.email
			from 
				barbearia.clientes bc 
			UNION 
				SELECT
				tc.email
			FROM 
				tratofeito.colaboradores tc;
        END IF; 
        SET i = i+1;
	end while; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `applyAllUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `applyAllUser`(usuario INT)
BEGIN
	DECLARE vaga INT;
    DECLARE qtd_vaga INT;
    DECLARE i INT DEFAULT 0;
    
    SET qtd_vaga = (SELECT count(id) FROM vagas);
    
    WHILE i < qtd_vaga DO
		
        SET vaga = (SELECT id FROm vagas LIMIT i,1);
		
        INSERT INTO `vagas_has_colaboradores` (`vagas_id`, `colaboradores_id`) VALUES (vaga, usuario);
        
        SET i = i+1;
    
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `disableAllVagas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `disableAllVagas`(empresa INT)
BEGIN
	DECLARE qtd_vagas INT;
    DECLARE i INT DEFAULT 0;
    DECLARE vaga int;
    
    SET qtd_vagas = (SELECT count(id) FROM vagas WHERE empresas_id = empresa);
    
    WHILE i < qtd_vagas DO
		
        SET vaga = (SELECT id FROM vagas WHERE empresas_id = empresa LIMIT i,1);
    
		UPDATE `vagas` SET `situacao`='Excluido' WHERE `id`=vaga;
		
        SET i = i + 1;
    END WHILE;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `geolocate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `geolocate`(idp INT, ids INT)
BEGIN
	DECLARE bairrop VARCHAR(60);
    DECLARE bairros VARCHAR(60);
    DECLARE cidadep VARCHAR(60);
    DECLARE cidades VARCHAR(60);
    DECLARE ruap VARCHAR(60);
    DECLARE ruas VARCHAR(60);
    DECLARE parp INT;
    DECLARE pars INT;
    DECLARE distancia INT;
    
    SET bairrop = (SELECT bairro FROM colaboradores WHERE id = idp);
    SET bairros = (SELECT bairro FROM colaboradores WHERE id = ids);

    SET cidadep = (SELECT cidade FROM colaboradores WHERE id = idp);
    SET cidades = (SELECT cidade FROM colaboradores WHERE id = ids);

    SET ruap = (SELECT rua FROM colaboradores WHERE id = idp);
    SET ruas = (SELECT rua FROM colaboradores WHERE id = ids);
    
    SELECT "calcula distancia" as `msg`;
    
    IF cidadep = cidades THEN
		IF bairrop = bairros THEN
			IF ruap = ruas THEN
            
				SET parp= (SELECT numero FROM colaboradores WHERE id = idp);
				SET pars= (SELECT numero FROM colaboradores WHERE id = ids);
				IF parp>pars THEN
					SET distancia = (parp-pars)*10;
				ELSE
					SET distancia = (pars-parp)*10;
				END IF;
            
				SET parp= (SELECT MOD(numero,2) FROM colaboradores WHERE id = idp);
                SET pars= (SELECT MOD(numero,2) FROM colaboradores WHERE id = ids);
                
                IF parp<>pars THEN
					SET distancia = distancia+5;
                END IF;
                
                SELECT CONCAT("O coalborador ",idp," mora a aproximadamente ",distancia,"metros do colaborador:",ids);
            ELSE
				SELECT "Colaboradores moram em ruas distintas" as `msg`;
            END IF;
		ELSE
			SELECT "Colaboradores moram em bairros distintos" as `msg`;
        END IF;
	ELSE
		SELECT "Colaboradores moram em cidades distintas" as `msg`;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `showall` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `showall`()
BEGIN
	SELECT * from colaboradores;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `simpleApply` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `simpleApply`(colaborador_id INT)
BEGIN
	INSERT INTO `tratofeito`.`vagas_has_colaboradores` (`vagas_id`, `colaboradores_id`) VALUES ('1', colaborador_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `barbearia`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `barbearia` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `barbearia`;

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
INSERT INTO `comprovantes` VALUES (1,2,'2020-09-01 23:31:15','Cartao',32.90,'2020-09-01 23:31:15','Sim'),(3,1,'2020-09-01 23:47:23','Cartao',15.90,'2020-09-01 23:45:00','Sim'),(4,2,'2020-09-01 23:47:34','Cartao',25.90,'2020-09-01 23:45:00','Sim'),(5,1,'2020-09-01 23:47:49','Cartao',35.90,'0000-00-00 00:00:00','Nao'),(6,4,'2020-09-01 23:48:13','Cartao',55.90,'2020-09-01 22:45:00','Nao'),(7,8,'2020-09-01 23:48:43','Dinheiro',32.90,NULL,'Nao'),(8,10,'2018-09-01 23:49:01','Cartao',42.90,NULL,'Sim'),(9,5,'2020-09-01 23:49:34','Dinheiro',81.25,'2020-09-01 23:59:00','Sim'),(10,6,'2020-09-01 23:49:47','Dinheiro',81.25,'2020-09-01 23:59:00','Sim'),(11,7,'2020-09-01 23:50:02','Dinheiro',81.25,'2020-08-29 21:59:00','Sim'),(12,8,'2020-09-01 23:50:23','Dinheiro',81.25,NULL,'Nao'),(13,10,'2019-09-01 23:51:38','Cartao',81.25,NULL,'Nao'),(14,8,'2018-09-03 00:00:20','Dinheiro',32.74,'2020-09-03 00:00:20','Sim'),(15,4,'2020-09-03 00:00:20','Boleto',0.00,NULL,'Nao'),(16,6,'2019-09-03 23:56:51','Boleto',0.00,NULL,'Nao'),(17,7,'2019-09-01 23:50:23','Boleto',0.00,NULL,'Nao'),(18,8,'2020-08-29 23:50:23','Boleto',0.00,NULL,'Nao');
/*!40000 ALTER TABLE `comprovantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `grupo_servicos`
--

DROP TABLE IF EXISTS `grupo_servicos`;
/*!50001 DROP VIEW IF EXISTS `grupo_servicos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `grupo_servicos` AS SELECT 
 1 AS `total`,
 1 AS `id`*/;
SET character_set_client = @saved_cs_client;

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

--
-- Current Database: `cartao_azul`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cartao_azul` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `cartao_azul`;

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
  `celular` varchar(18) CHARACTER SET utf8 DEFAULT NULL,
  `telefone` varchar(18) CHARACTER SET utf8 DEFAULT NULL,
  `uf` enum('PR','SP','SC','RS','SE','pr','sp','sc','rs','se') CHARACTER SET utf8 NOT NULL DEFAULT 'PR',
  `cidade` varchar(65) COLLATE utf8_bin DEFAULT NULL,
  `tipo` enum('CPF','CNPJ') COLLATE utf8_bin NOT NULL DEFAULT 'CPF',
  `situacao` enum('Ativo','Inativo','Bloqueado','Suspenso','Excluído') COLLATE utf8_bin DEFAULT 'Ativo',
  PRIMARY KEY (`id`),
  KEY `idx_situacao` (`situacao`),
  KEY `idx_uf` (`uf`),
  KEY `idx_cidade` (`cidade`),
  KEY `idx_tipo` (`tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'33314907842','123','teste123','teste@teste.com','5541998500111',NULL,'PR','Sao Jose Dos Pinhais','CPF','Ativo'),(2,'321321312','423','rerw','rewrwe','4324432143',NULL,'','Sao Paulo','CPF','Ativo'),(3,'412341234','542454','dsadas','321312',NULL,NULL,'SC','Tes Silva','CPF','Ativo');
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
    IF LENGTH(NEW.nome) = 42 THEN
        SET NEW.nome = CREATE_NICK_NAME(NEw.nome);
    END IF;
    
    SET NEW.cidade = checknoriz(NEW.cidade);
    
    SET NEW.uf = UPPER(NEW.uf);
    
    SET NEW.celular = STR_REPLACE(NEW.celular, '+()-[]{} .', '');
    
    SET NEW.telefone = STR_REPLACE(NEW.telefone, '+()-[]{} .', '');
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
    
    SET NEW.cidade = checknoriz(NEW.cidade);
    
    SET NEW.uf = UPPER(NEW.uf);

    SET NEW.celular = STR_REPLACE(NEW.celular, '+()-[]{} .', '');
    
    SET NEW.telefone = STR_REPLACE(NEW.telefone, '+()-[]{} .', '');
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
/*!50003 DROP FUNCTION IF EXISTS `checknoriz` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `checknoriz`(nome VARCHAR(42)) RETURNS varchar(42) CHARSET utf8 COLLATE utf8_bin
BEGIN
    DECLARE qtd_palavras INT;
    DECLARE palavra VARCHAR(25);
    DECLARE frase VARCHAR(42) DEFAULT '';
    DECLARE ind INT DEFAULT 1;
    
    SET qtd_palavras = (
                            SELECT 
                                LENGTH(nome) 
                                    - LENGTH(REPLACE(nome, ' ', ''))+1
                                    );

    WHILE ind <= qtd_palavras DO
        IF ind = 1 THEN
            SET palavra = (SELECT SUBSTRING_INDEX(nome, ' ', 1));
            SET frase = upFirst(palavra);
        ELSE
            SET palavra = (SELECT substr(nome,
                                    length(SUBSTRING_INDEX(nome, 
                                    ' ', 
                                    ind-1))+2,
                                    length(SUBSTRING_INDEX(nome, 
                                    ' ', 
                                    ind))-(length(SUBSTRING_INDEX(nome, 
                                    ' ', ind-1))+1)
                            ));
			SET frase = CONCAT(frase,' ',upFirst(palavra));
        END IF;
        
        SET ind = ind + 1;
    END WHILE;

    RETURN frase;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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
/*!50003 DROP FUNCTION IF EXISTS `STR_REPLACE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `STR_REPLACE`(lstring VARCHAR(250), lplace VARCHAR(250), lsub VARCHAR(250)) RETURNS varchar(250) CHARSET utf8 COLLATE utf8_bin
BEGIN

	DECLARE qtd_caracteres INT;
    DECLARE i INT DEFAULT 1;
    DECLARE retorno VARCHAR(250) DEFAULT lstring;
    DECLARE item VARCHAR(1);
    
    SET qtd_caracteres = (SELECT LENGTH(lplace));
    
    WHILE i <= qtd_caracteres DO
		SET item = (SELECT substr(lplace, i, 1));
		SET retorno = (SELECT REPLACE(retorno, item, lsub));
        SET i = i+1;
    END WHILE;

	RETURN retorno;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `upFirst` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `upFirst`(palavra VARCHAR(40)) RETURNS varchar(40) CHARSET utf8 COLLATE utf8_bin
BEGIN
	DECLARE primeira_letra VARCHAR(1);
    DECLARE restante_palavra VARCHAR(39);
    
    SET primeira_letra = (SELECT UPPER(SUBSTR(palavra, 1,1)));
    SET restante_palavra = (SELECT LOWER(SUBSTR(palavra, 2, LENGTH(palavra))));
    
RETURN CONCAT(primeira_letra,restante_palavra);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `eagendas`
--

USE `eagendas`;

--
-- Final view structure for view `lista_usuario_compromissos`
--

/*!50001 DROP VIEW IF EXISTS `lista_usuario_compromissos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `lista_usuario_compromissos` AS (select `m`.`compromisso_id` AS `compromisso`,date_format(`m`.`data_criacao`,'%d/%m/%Y %H:%i:%s') AS `data_compromisso`,`u`.`nome` AS `Convidado`,`m`.`situacao` AS `situacao` from (`marcacoes` `m` join `usuarios` `u` on((`m`.`usuario_id` = `u`.`id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ranking_marcacoes`
--

/*!50001 DROP VIEW IF EXISTS `ranking_marcacoes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ranking_marcacoes` AS (select `u`.`nome` AS `nome`,count(`m`.`id`) AS `marcacoes` from ((`usuarios` `u` left join `compromissos` `c` on((`u`.`id` = `c`.`usuario_id`))) left join `marcacoes` `m` on((`c`.`id` = `m`.`compromisso_id`))) group by `u`.`id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ranking_marcado`
--

/*!50001 DROP VIEW IF EXISTS `ranking_marcado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ranking_marcado` AS (select `u`.`nome` AS `nome`,count(`m`.`id`) AS `marcacoes` from (`usuarios` `u` left join `marcacoes` `m` on((`u`.`id` = `m`.`usuario_id`))) group by `u`.`id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `relatorio_geral`
--

/*!50001 DROP VIEW IF EXISTS `relatorio_geral`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `relatorio_geral` AS (select `u`.`id` AS `usuario`,`u`.`nome` AS `nome`,date_format(`c`.`data_criacao`,'%d/%m/%Y %H:%i') AS `data`,(select group_concat(`us`.`nome` separator ',') from (`marcacoes` `m` join `usuarios` `us` on((`m`.`usuario_id` = `us`.`id`))) where (`m`.`compromisso_id` = `c`.`id`)) AS `marcacoes`,(select count(`m`.`id`) from `marcacoes` `m` where (`m`.`compromisso_id` = `c`.`id`)) AS `qtd_convidados`,(select count(`m`.`id`) from `marcacoes` `m` where ((`m`.`situacao` in ('Lido','Confirmado','Justificado')) and (`m`.`compromisso_id` = `c`.`id`))) AS `lido`,(select count(`m`.`id`) from `marcacoes` `m` where ((`m`.`situacao` = 'Confirmado') and (`m`.`compromisso_id` = `c`.`id`))) AS `confirmado`,(select count(`m`.`id`) from `marcacoes` `m` where ((`m`.`situacao` = 'Justificado') and (`m`.`compromisso_id` = `c`.`id`))) AS `justificado` from (`usuarios` `u` join `compromissos` `c` on((`u`.`id` = `c`.`usuario_id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `usuarios_compromissos_qtd`
--

/*!50001 DROP VIEW IF EXISTS `usuarios_compromissos_qtd`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `usuarios_compromissos_qtd` AS (select `u`.`id` AS `usuario`,`u`.`nome` AS `nome`,date_format(`c`.`data_criacao`,'%d/%m/%Y %H:%i') AS `data`,(select group_concat(`us`.`nome` separator ',') from (`marcacoes` `m` join `usuarios` `us` on((`m`.`usuario_id` = `us`.`id`))) where (`m`.`usuario_id` = `u`.`id`)) AS `marcacoes`,(select count(`m`.`id`) from `marcacoes` `m` where (`m`.`compromisso_id` = `c`.`id`)) AS `qtd_convidados` from (`usuarios` `u` join `compromissos` `c` on((`u`.`id` = `c`.`usuario_id`))) order by 5 desc) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `usuarios_compromisss_marcacoes`
--

/*!50001 DROP VIEW IF EXISTS `usuarios_compromisss_marcacoes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `usuarios_compromisss_marcacoes` AS (select `u`.`id` AS `usuario`,`u`.`nome` AS `nome`,date_format(`c`.`data_criacao`,'%d/%m/%Y %H:%i') AS `data`,(select group_concat(`u`.`nome` separator ',') from (`marcacoes` `m` join `usuarios` `u` on((`m`.`usuario_id` = `u`.`id`))) where (`m`.`compromisso_id` = `c`.`id`)) AS `macacoes` from (`usuarios` `u` join `compromissos` `c` on((`u`.`id` = `c`.`usuario_id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Current Database: `tratofeito`
--

USE `tratofeito`;

--
-- Current Database: `barbearia`
--

USE `barbearia`;

--
-- Final view structure for view `grupo_servicos`
--

/*!50001 DROP VIEW IF EXISTS `grupo_servicos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `grupo_servicos` AS (select count(`c`.`id`) AS `total`,`c`.`id` AS `id` from (`comprovantes` `c` join `comprovante_servicos` `cs` on((`c`.`id` = `cs`.`comprovante_id`))) group by `c`.`id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Current Database: `cartao_azul`
--

USE `cartao_azul`;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-21 21:59:24
