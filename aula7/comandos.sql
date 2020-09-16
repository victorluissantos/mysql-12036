CREATE TABLE `marcacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compromisso_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `situacao` enum('Convidado','Lido','Confirmado','Justificado','Falta') COLLATE utf8_bin NOT NULL DEFAULT 'Convidado' COMMENT 'Convidado => quando o usuario criador do compromisso criou a marcacao\nLido => Quando o usuario marcado, visualizar a marcacao\nConfirmado => Quando o usuario marcado ao compromisso, confirmar presenca\nJustificado => Quando o usuario marcado ao compromisso, informa que nao ira e justifica sua falta\nFalta => Quando o usuario marcado ao compromisso, confirma ou nao le o compromisso e nao comparece',
  `data_criacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_atualizacao` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_situacao` (`situacao`),
  KEY `fk_marcacoes_compromisso_idx` (`compromisso_id`),
  KEY `fk_marcacoes_usuario_idx` (`usuario_id`),
  CONSTRAINT `fk_marcacoes_compromisso` FOREIGN KEY (`compromisso_id`) REFERENCES `compromissos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_marcacoes_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


EXPLAIN SELECT 
    u.nome, COUNT(c.id) AS `total`
FROM
    usuarios u
        LEFT JOIN
    compromissos c ON u.id = c.usuario_id
GROUP BY u.id;

-- outra opcao
EXPLAIN SELECT 
    u.nome,
    (SELECT 
            COUNT(c.id)
        FROM
            compromissos c
        WHERE
            c.usuario_id = u.id) AS `total`
FROM
    usuarios u;