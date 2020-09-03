-- 1 qual o mes que mais tem aniversariante no meu sistema
SELECT 
    MONTH(cl.data_nascimento) as `mes`,
    count(cl.id) as `total`
FROM
    clientes cl
GROUP BY 1
ORDER BY 2 DESC;

-- 2 qual o cliente mais jovem da babearia
SELECT 
    nome,
    YEAR(data_nascimento) AS `ano_nascimento`,
    YEAR(CURDATE()) AS `ano_corrente`,
    YEAR(CURDATE()) - YEAR(data_nascimento) AS `idade`
FROM
    clientes
ORDER BY 4 ASC;

-- 2 qual o cliente mais jovem da babearia []
SELECT 
	CURDATE(),
    DATE_FORMAT(CURDATE(),'%Y%m%d') as `timestamp-data_atual`,
    cl.data_nascimento,
    DATE_FORMAT(cl.data_nascimento,'%Y%m%d') as `timestamp-data_nascimento`,
    DATE_FORMAT(CURDATE(),'%Y%m%d') - DATE_FORMAT(cl.data_nascimento,'%Y%m%d') as `diferenca-timestamp`,
    DATE_FORMAT(CURDATE(),'%Y%m%d') - DATE_FORMAT(cl.data_nascimento,'%Y%m%d') as `timestamp`,
    TIMESTAMPDIFF(YEAR, cl.data_nascimento, CURDATE()) as `idade`
FROM
    clientes cl

-- 2 qual o cliente mais jovem da babearia
SELECT 
	cl.nome,
    TIMESTAMPDIFF(YEAR, cl.data_nascimento, CURDATE()) as `idade`
FROM
    clientes cl
ORDER BY 2 ASC

-- 3 qual o cliente mais idoso da barbearia
SELECT
	nome,
	timestampdiff(YEAR, data_nascimento, curdate()) as `idade`
FROM
	clientes
ORDER BY 2 DESC
LIMIT 1;

-- 3 qual o cliente mais idoso da barbearia
SELECT
	timestampdiff(YEAR, data_nascimento, curdate()) as `idade`,
    count(id) as `total`,
    GROUP_CONCAT(email) as `nome(s)`
FROM
	clientes
GROUP BY 1
ORDER BY 1 DESC
LIMIT 1;

-- 4 qual o hora em que eu tenho o maior numero de clientes cadastrados
SELECT 
    HOUR(cl.data_cadastro) as `Hora`,
    count(cl.id) as `Total`,
    group_concat(DATE_FORMAT(cl.data_cadastro, '%d/%m/%Y') ) as `datas`
FROM
    clientes cl
GROUP BY 1 DESC
ORDER BY 2 DESC
limit 1;