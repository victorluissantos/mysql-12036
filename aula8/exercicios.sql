/*
 -- 1 Qual o usuario que mais leu compromisso e nao justificou
 -- 2 Qual o usuario que mais leu compromisso e faltou
 -- 3 Qual o tempo media em horas de cada usuario, entre a marcacao e alguma acao na marcaco
 -- 6 Qual o compromisso com maior quantidade de recorrencia
*/

 -- 1 Qual o usuario que mais leu compromisso e nao justificou
CREATE FUNCTION `n_justificados`(usuario INTEGER) RETURNS int(11)
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
END

 -- 2 Qual o usuario que mais leu compromisso e faltou
CREATE FUNCTION `faltas` (usuario Integer)
RETURNS INTEGER
BEGIN
	RETURN (SELECT 
				count(m.id)
			FROM
				marcacoes m
			WHERE
				m.situacao in ('Lido', 'Falta')
                AND
                m.usuario_id = usuario);
END

 -- 3 Qual o tempo media em horas de cada usuario, entre a marcacao e alguma acao na marcaco
CREATE FUNCTION `media_acao`(usuario INTEGER) RETURNS varchar(30)
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
		SET retorno = CONCAT('aproximadamente ', retorno, ' minutos');
	END IF;
    
	RETURN retorno;


 -- 4 Qual a quantidade de compromissos por mes no ano de 2020 para cada usuario
DELIMITER $$
CREATE FUNCTION `countEventos`(usuario INTEGER, mes INTEGER) 
RETURNS int(11)
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
END$$
DELIMITER ;

SELECT 
    u.nome AS `Usuario`,
    COUNTEVENTOS(u.id, 1) AS `Janeiro`,
    COUNTEVENTOS(u.id, 2) AS `Fevereiro`,
    COUNTEVENTOS(u.id, 3) AS `Marco`,
    COUNTEVENTOS(u.id, 4) AS `Abril`,
    COUNTEVENTOS(u.id, 5) AS `Maio`,
    COUNTEVENTOS(u.id, 6) AS `Junho`,
    COUNTEVENTOS(u.id, 7) AS `Julho`,
    COUNTEVENTOS(u.id, 8) AS `Agosto`,
    COUNTEVENTOS(u.id, 9) AS `Setembro`,
    COUNTEVENTOS(u.id, 10) AS `Outubro`,
    COUNTEVENTOS(u.id, 11) AS `Novembro`,
    COUNTEVENTOS(u.id, 12) AS `Dezembro`
FROM
    usuarios u;


 -- 5 Qual o compromisso de maior perioro
DELIMITER $$
CREATE FUNCTION `ocorrencias`(compromisso INTEGER) RETURNS int(11)
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
END$$
DELIMITER ;

SELECT 
    c.id as `compromisso`,
    ocorrencias(c.id) as `ocorrencias`
FROM
    compromissos c
ORDER BY 2 DESC LIMIT 1;