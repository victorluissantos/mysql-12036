-- 1. Uma query que traga todos os clientes  do PR com as transacoes
SELECT
	cl.*
FROM
	comprovantes co
	INNER JOIN
	clientes cl ON co.cliente_id = cl.id
WHERE
	cl.uf = 'PR';

-- 2. Uma query que traga somente a cidade das transacoes nao provadas
SELECT 
    cl.cidade
FROM
    comprovantes co
        INNER JOIN
    clientes cl ON co.cliente_id = cl.id
WHERE
    co.aprovado = 'Nao';

-- 3. uma query que os nomes de clientes das transacoes que foram aprovada (=sim) e que nao possuem data_captura
SELECT
	cl.nome
FROM
	comprovantes co
	INNER JOIN
	clientes cl ON co.cliente_id = cl.id
WHERE
	co.aprovado = 'Sim'
	AND
	co.data_captura = '';

-- ou

SELECT
	cl.nome
FROM
	comprovantes co
	INNER JOIN
	clientes cl ON co.cliente_id = cl.id
WHERE
	co.aprovado = 'Sim'
	AND
	co.data_captura = null;

-- ou [Melhor maneira]

SELECT
	cl.nome
FROM
	comprovantes co
	INNER JOIN
	clientes cl ON co.cliente_id = cl.id
WHERE
	co.aprovado = 'Sim'
	AND
	co.data_captura is NULL;