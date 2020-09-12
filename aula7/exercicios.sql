/*
1. lista de usuarios que possuem compromisso do tipo diario
2. lista de usuarios que nao possuem compromisso do tipo mensal
3. lista de usuarios que nao possuem compromisso nenhum
4. lista de usuarios que possuem compromisso somente do tipo anual
5. lista de usuarios que possuem compromisso, mas nao possuem dados telefonicos/celulares
*/

-- 1. lista de usuarios que possuem compromisso do tipo diario
SELECT DISTINCT
    u.*
FROM
    usuarios u
        INNER JOIN
    compromissos c ON u.id = c.usuario_id
WHERE
    c.ocorrencia = 'diaria'


-- 2. lista de usuarios que nao possuem compromisso do tipo mensal
SELECT DISTINCT
    u.*
FROM
    usuarios u
        LEFT JOIN
    compromissos c ON u.id = c.usuario_id
WHERE
    c.ocorrencia <> 'mensal';

-- 3. lista de usuarios que nao possuem compromisso nenhum
SELECT
    u.*
FROM
    usuarios u
        LEFT JOIN
    compromissos c ON u.id = c.usuario_id
WHERE
    c.id IS NULL;


-- 4. lista de usuarios que possuem compromisso somente do tipo anual
SELECT
	u.*
FROM
	usuarios u
    INNER JOIN
    compromissos c ON u.id = c.usuario_id
WHERE
	c.ocorrencia = 'anual';

-- 5. lista de usuarios que possuem compromisso, mas nao possuem dados telefonicos/celulares
SELECT DISTINCT
    u.*
FROM
    usuarios u
        INNER JOIN
    compromissos c ON u.id = c.usuario_id
WHERE
    u.telefone IS NULL OR u.celular IS NULL


/** CRIANDO VIEWS */
-- 1 - Qual o usuario que mais cria eventos ?
SELECT 
    u.*,
    (SELECT 
            COUNT(c.id)
        FROM
            compromissos c
        WHERE
            c.usuario_id = u.id) AS `total_evento`
FROM
    usuarios u
ORDER BY 8 DESC
LIMIT 1;

-- 2 - crear uma view `usuario_compromissos` que retorne lista de usuario com sua lista de compromissos
--| usuario | compromissos |
--  Heitor  |  1, 2, 4, 5  |
CREATE VIEW usuario_compromissos AS
    (SELECT 
        u.nome AS `usuario`,
        (SELECT 
                GROUP_CONCAT(c.id)
            FROM
                compromissos c
            WHERE
                c.usuario_id = u.id) AS `compromissos`
    FROM
        usuarios u);

-- 3 - Criar uma view `ranking_compromissos` que retorne um ranking de usuarios por compromissos
--|	nome	| total |
--|   Julio	| 12	|
--|   Diego	| 8		|
CREATE VIEW ranking_compromissos AS
    (SELECT 
        u.nome, COUNT(c.id) AS `total`
    FROM
        usuarios u
            LEFT JOIN
        compromissos c ON u.id = c.usuario_id
    GROUP BY u.id);

-- 4 - Criar uma view `ranking_marcado` que retorne um ranking de usuarios por marcaoes em compromissos
--|	nome	| marcacoes |
--|   Victor	| 3			|
--|   Miake	| 2			|
CREATE VIEW ranking_marcado AS
    (SELECT 
        u.nome, COUNT(m.id) AS `marcacoes`
    FROM
        usuarios u
            LEFT JOIN
        marcacoes m ON u.id = m.usuario_id
    GROUP BY u.id);

-- 5 - Criar uma view `ranking_marcacoes` que retorne um ranking de usuarios por compromissos com marcacoes
--|	nome	| marcacoes |
--|   Maicon	| 3			|
--|   Miake	| 2			|
CREATE VIEW ranking_marcacoes AS
    (SELECT 
        u.nome, COUNT(m.id) AS `marcacoes`
    FROM
        usuarios u
            LEFT JOIN
        compromissos c ON u.id = c.usuario_id
            LEFT JOIN
        marcacoes m ON c.id = m.compromisso_id
    GROUP BY u.id);

-- 6 - Criar uma view que retorne
--|usuario	|	nome	|	data				|	marcacoes		|
--|	1002	|	Diego	|	20/03/2020 23:12	|	Heitor, Mikaele	|
--|	1004	|	Maicon	|	23/03/2020 23:12	|	Camila			|
--OBS: deve ser ordenada pela data, e a data estara em padrao pt_bt sem o segundos
CREATE VIEW usuarios_compromisss_marcacoes AS
    (SELECT 
        u.id AS `usuario`,
        u.nome,
        DATE_FORMAT(c.data_criacao, '%d/%m/%Y %H:%i') AS `data`,
        (SELECT 
                GROUP_CONCAT(u.nome)
            FROM
                marcacoes m
                    INNER JOIN
                usuarios u ON m.usuario_id = u.id
            WHERE
                m.compromisso_id = c.id) AS `macacoes`
    FROM
        usuarios u
            INNER JOIN
        compromissos c ON u.id = c.usuario_id);

-- 7 - Criar uma view que retorne
--|usuario	|	nome	|	data				|	marcacoes		| qtd_convidados |
--|	1002	|	Diego	|	20/03/2020 23:12	|	Heitor, Mikaele	|		2		 |
--|	1004	|	Maicon	|	23/03/2020 23:12	|	Camila			|		1		 |
--OBS: deve ser ordenada pela qt_convidados, e a data estara em padrao pt_bt sem o segundos
CREATE VIEW usuarios_compromissos_qtd AS (
    SELECT 
        u.id AS `usuario`,
        u.nome,
        DATE_FORMAT(c.data_criacao, '%d/%m/%Y %H:%i') AS `data`,
        (SELECT 
                GROUP_CONCAT(us.nome)
            FROM
                marcacoes m
                    INNER JOIN
                usuarios us ON m.usuario_id = us.id
            WHERE
                m.usuario_id = u.id) AS `marcacoes`,
        (SELECT 
                COUNT(m.id)
            FROM
                marcacoes m
            WHERE
                m.compromisso_id = c.id) AS `qtd_convidados`
    FROM
        usuarios u
            INNER JOIN
        compromissos c ON u.id = c.usuario_id
    ORDER BY 5 DESC;
);
-- 8 - Criar uma view que retorne
--|usuario	|	nome	|	data				|	marcacoes		| qtd_convidados | lidos 	| confirmados 	| justificado
--|	1002	|	Diego	|	20/03/2020 23:12	|	Heitor, Mikaele	|		2		 |	2		|	  1			|   1
--|	1004	|	Maicon	|	23/03/2020 23:12	|	Camila			|		1		 |	1		|		0		|
--OBS: deve ser ordenada pela qt_convidados, e a data estara em padrao pt_bt sem o segundos, se o compromisso estiver como confirmado ele tambem soma no lido
CREATE VIEW relatorio_geral AS (
    SELECT 
        u.id AS `usuario`,
        u.nome,
        DATE_FORMAT(c.data_criacao, '%d/%m/%Y %H:%i') AS `data`,
        (SELECT 
                GROUP_CONCAT(us.nome)
            FROM
                marcacoes m
                    INNER JOIN
                usuarios us ON m.usuario_id = us.id
            WHERE
                m.compromisso_id = c.id) AS `marcacoes`,
        (SELECT 
                COUNT(m.id)
            FROM
                marcacoes m
            WHERE
                m.compromisso_id = c.id) AS `qtd_convidados`,
        (SELECT 
                COUNT(m.id)
            FROM
                marcacoes m
            WHERE
                m.situacao IN ('Lido' , 'Confirmado', 'Justificado')
                    AND m.compromisso_id = c.id) AS `lido`,
        (SELECT 
                COUNT(m.id)
            FROM
                marcacoes m
            WHERE
                m.situacao = 'Confirmado'
                    AND m.compromisso_id = c.id) AS `confirmado`,
        (SELECT 
                COUNT(m.id)
            FROM
                marcacoes m
            WHERE
                m.situacao = 'Justificado'
                    AND m.compromisso_id = c.id) AS `justificado`
    FROM
        usuarios u
            INNER JOIN
        compromissos c ON u.id = c.usuario_id);