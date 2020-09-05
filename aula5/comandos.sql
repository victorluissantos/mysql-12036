SELECT DISTINCT
    *
FROM
    clientes cl
        INNER JOIN
    comprovantes co ON cl.id = co.cliente_id
WHERE
    cl.id IN (SELECT 
            cliente_id
        FROM
            comprovantes co
        WHERE
            forma = 'Boleto');


SELECT 
    cl.*
FROM
    clientes cl
WHERE
	cl.data_cadastro >= '2000-01-01 00:00:00'
    AND
    cl.data_cadastro <= '2018-12-31 23:59:59';


SELECT 
    cl.*
FROM
    clientes cl
WHERE
	cl.data_cadastro BETWEEN '2000-01-01 00:00:00' AND '2018-12-31 23:59:59';