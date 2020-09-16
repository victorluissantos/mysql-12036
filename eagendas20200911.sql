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
  `data_compromisso` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_ocorrencia` (`ocorrencia`),
  KEY `idx_alerta` (`alerta`),
  KEY `fk_compromissos_usuario_idx` (`usuario_id`),
  CONSTRAINT `fk_compromissos_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compromissos`
--

LOCK TABLES `compromissos` WRITE;
/*!40000 ALTER TABLE `compromissos` DISABLE KEYS */;
INSERT INTO `compromissos` VALUES (1,1002,NULL,'2020-09-10 22:30:55','mensal',NULL,NULL,'2020-11-11 19:03:55'),(2,1001,NULL,'2020-09-10 22:30:55','unica','mes',6,'2020-01-10 20:30:55'),(3,1001,NULL,'2020-09-10 22:30:55','diaria','dia',7,'2020-11-11 19:03:55'),(4,1002,NULL,'2020-09-10 22:30:55','unica','hora',2,'2020-07-10 12:30:55'),(5,1002,NULL,'2020-09-10 22:30:55','mensal','hora',5,'2020-01-10 14:53:55'),(6,1000,NULL,'2020-09-10 22:30:55','unica','dia',3,'2020-01-10 08:40:55'),(7,1004,NULL,'2020-09-10 22:30:55','unica','hora',1,'2020-07-14 09:33:55'),(8,1002,NULL,'2020-09-10 22:30:55','unica',NULL,NULL,'2020-12-10 07:30:55'),(9,1000,NULL,'2020-09-10 22:30:55','diaria',NULL,NULL,'2020-06-10 09:23:30'),(10,1004,NULL,'2020-09-10 22:30:55','diaria','hora',2,'2020-09-10 04:30:55'),(11,1002,NULL,'2020-09-10 22:30:55','diaria','mes',3,'2021-01-09 23:59:55'),(12,1003,NULL,'2020-09-10 22:30:55','anual','minuto',5,'2020-12-25 23:59:55'),(13,1000,NULL,'2020-09-10 22:30:55','unica','minuto',10,'2020-11-20 16:19:55'),(14,1004,NULL,'2020-09-10 22:30:55','unica','minuto',15,'2020-10-21 13:49:15'),(15,1004,NULL,'2020-09-10 22:30:55','mensal',NULL,NULL,'2020-09-03 17:19:55'),(16,1004,NULL,'2020-09-10 22:30:55','unica',NULL,NULL,'2020-09-23 17:19:55'),(17,1003,NULL,'2020-09-10 22:30:55','semanal','minuto',32,'2020-09-25 09:10:55'),(18,1000,NULL,'2020-09-10 22:30:55','semanal','minuto',30,'2020-09-13 18:10:55'),(19,1001,NULL,'2020-09-10 22:30:55','unica','dia',1,'2020-09-16 17:25:55'),(20,1004,NULL,'2020-09-10 22:30:55','semanal','hora',4,'2020-10-18 13:11:55'),(21,1001,NULL,'2020-09-10 22:37:15','mensal',NULL,NULL,'2020-10-19 15:12:55'),(22,1003,NULL,'2020-09-10 22:37:15','mensal',NULL,NULL,'2020-09-20 12:19:55');
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
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8 COLLATE=utf8_bin DELAY_KEY_WRITE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1000,'Diego','diego.garcia@clansoftware.com.br',NULL,NULL,'202cb962ac59075b964b07152d234b70','Ativo'),(1001,'Maicon','maicon.pasin@clansoftware.com.br',NULL,NULL,'caf1a3dfb505ffed0d024130f58c5cfa','Ativo'),(1002,'Miakele','mika.silva@clansoftware.com.br',NULL,NULL,'250cf8b51c773f3f8dc8b4be867a9a02','Ativo'),(1003,'Sabrine','sabrine.santos@clansoftware.com.br',NULL,NULL,'ab233b682ec355648e7891e66c54191b','Ativo'),(1004,'Heitor','heitor.cordeito@clansoftware.com.br',NULL,NULL,'68053af2923e00204c3ca7c6a3150cf7','Ativo'),(1005,'Julio','julio.brito@reciclagemead.com.br',NULL,NULL,'julio123','Ativo');
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-11 21:41:15
