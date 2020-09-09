ALTER TABLE `barbearia`.`clientes` 
ADD COLUMN `data_nascimento` DATE NULL AFTER `status`,
ADD COLUMN `data_cadastro` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `data_nascimento`;


-- Inserindo as datas de nascimento
UPDATE `barbearia`.`clientes` SET `data_nascimento`='1993-01-10' WHERE `id`='1';
UPDATE `barbearia`.`clientes` SET `data_nascimento`='1987-01-10' WHERE `id`='4';
UPDATE `barbearia`.`clientes` SET `data_nascimento`='1964-02-23' WHERE `id`='2';
UPDATE `barbearia`.`clientes` SET `data_nascimento`='1982-07-12' WHERE `id`='3';
UPDATE `barbearia`.`clientes` SET `data_nascimento`='2019-08-05' WHERE `id`='6';
UPDATE `barbearia`.`clientes` SET `data_nascimento`='1991-01-17' WHERE `id`='5';
UPDATE `barbearia`.`clientes` SET `data_nascimento`='1994-08-26' WHERE `id`='7';
UPDATE `barbearia`.`clientes` SET `data_nascimento`='1952-11-22' WHERE `id`='8';
UPDATE `barbearia`.`clientes` SET `data_nascimento`='2005-12-26' WHERE `id`='10';

-- curdate
NOW();
CURDATE();
DATE_FORMAT("2017-06-15", "%Y");

SELECT 
    cl.nome,
    cl.email,
    cl.uf,
    DATE_FORMAT(cl.data_nascimento, '%d/%m/%Y') as `data_aniversario`,
    DAY(cl.data_nascimento) as `dia_aniversario`
FROM
    clientes cl;

-- weekday()
SELECT DISTINCT
    cl.nome,
    IF(co.cliente_id is Null, 'nunca', 'ja') as `ja_usou_servicos`
FROM
    clientes cl
    LEFT JOIN
    comprovantes co on cl.id = co.cliente_id

 /* Explicacao 1 */
SELECT 
    DATE_ADD(data_transacao, INTERVAL 20 DAY) as `vencimento`,
    data_transacao
FROM
    comprovantes;

/* Explicacao 2 */
SELECT DISTINCT
    cl.nome,
    IF(co.cliente_id is Null, 'nunca', 'ja') as `ja_usou_servicos`
FROM
    clientes cl
    LEFT JOIN
    comprovantes co on cl.id = co.cliente_id

SELECT 
    cl.nome,
    IF(TIMESTAMPDIFF(YEAR,
            cl.data_nascimento,
            CURDATE()) >= 18 and  cl.uf = 'PR',
        'Maior',
        'Menor') AS `idade`
FROM
    clientes cl