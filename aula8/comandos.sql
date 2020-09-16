/* Exemplo pratico de utilizacao do UNION */
SELECT DISTINCT
    *
FROM
    (SELECT 
        nome, email
    FROM
        barbearia.clientes UNION SELECT 
        nome, email
    FROM
        eagendas.usuarios) AS geral

CREATE TABLE `tabela_a` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registroa` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `tabela_b` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tabela_a_id` int(11) NOT NULL,
  `registrob` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


/* Exemplo de Join */

SELECT 
    *
FROM
    tabela_a a
        LEFT JOIN
    tabela_b b ON a.id = b.tabela_a_id;

SELECT 
    *
FROM
    tabela_a a
        RIGHT JOIN
    tabela_b b ON a.id = b.tabela_a_id;

SELECT 
    *
FROM
    tabela_a a
        INNER JOIN
    tabela_b b ON a.id = b.tabela_a_id;