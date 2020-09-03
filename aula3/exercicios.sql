-- 1 Lista de todos os servicos femininos
SELECT
	*
FROM
	servicos
WHERE
	upper(nome) like upper('%feminino%')

-- 2 lista de todos os clientes com sobre nome santos
SELECT
	*
FROM
	clientes
WHERE
	upper(nome) like upper('%santos')

-- 3 lista de todos os clientes com emails/dominios que contenha .br
SELECT 
    *
FROM
    clientes
WHERE
	upper(email) like upper('%.br%')


/* Segunda leva de exerciciso, com Count e Groyp BY */
-- 1 Lisa de forma de pagamento em comprovantes, com uma coluna mostrando e ordenando a quantidade do maior para o menor. Resumo: qual a forma de pagamento mais usada?
SELECT 
    co.forma,
    COUNT(co.id) as `total`
FROM
    barbearia.comprovantes co
GROUP BY co.forma
ORDER BY 2 DESC;

-- 2 qual o cliente que mais possui comprovantes com aprovacao = Sim
SELECT 
    cl.nome,
    COUNT(cl.id) as `total`
FROM
    clientes cl
    INNER JOIN
    comprovantes co ON cl.id = co.cliente_id
WHERE
	co.aprovado = 'Sim'
GROUP BY cl.nome
ORDER BY 2 DESC

-- 3 qual o cliente que possui o maior numero de comprovantes sem aprovacao = Nao

-- 4 qual o Estado (UF) que possui a maior quantidade de clientes

-- 5 Qual a cidade que possui a maior quantidade de clientes

-- 6 qual o host de email (@blabla) que mais tenho cadastrado em clientes [dica: use o like]
SELECT
	SUBSTRING_INDEX(cl.email, '@', -1) as `host`,
	COUNT(cl.id) `total`
FROM
	clientes cl
GROUP BY 1
ORDER BY 2 DESC