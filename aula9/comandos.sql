SELECT NOW();
SELECT @@global.time_zone;

SET @@global.time_zone = '-3:00';
SET time_zone = 'America/Sao_Paulo';

SELECT * FROM mysql.time_zone_name where Name like 'America%'

DELIMITER $$
CREATE FUNCTION `getMes` (mes INTEGER)
RETURNS VARCHAR(10)
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
END$$
DELIMITER ;

/*
	Imagina que a gente tem um sistema que ira exibir estes registros usando paginacao, com paginas de 10 em 10 registro
    o primeiro valor de um limit determina o rimeiro a ser exibido,
    o segundo valor do limit determina o limit a partir do primeiro informado
*/
SELECT 
    CONCAT('registro: ', c.id) AS `registro`
FROM
    compromissos c
ORDER BY c.id ASC
LIMIT 30,10



SELECT 
	@x:=@x+1,
    CONCAT('registro: ', @x-1) AS `registro`
FROM
    compromissos c
ORDER BY c.id ASC;

-- trava a memoria, e separa
SELECT 
    u.nome,
    @x = 1001
FROM
    usuarios u
WHERE
	u.id = @x;
-- destrava
/* 
	Retorno da query 
	[ x ] Nada	[ ] Erro de execucao	[ ] usuario de id 1001
*/
