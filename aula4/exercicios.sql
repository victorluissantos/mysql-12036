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


/** SEGUNDA LEVA DE EXERCICIOS */
-- 1 uma tabela onde eu consiga ver a lista de clientes e uma coluna informando se o cliente ja fez aniversario este ano
/*
| nome 		| aniversario |
fulano 		|   ja fez	  |
beltrano	|   ainda nao |
*/
SELECT 
    cl.nome,
    IF(
		DAY(cl.data_nascimento) >= DAY(CURDATE())
        AND
        MONTH(cl.data_nascimento) >= MONTH(CURDATE()), 'ja fez', 'ainda nao'
    ) as `aniversario`
FROM
    clientes cl;

/*Solucao Willian*/
SELECT 
	IF( MONTH(cl.data_nascimento) < MONTH(CURDATE()), 'fez', 
		IF (MONTH(cl.data_nascimento) = MONTH(CURDATE()) 
			AND DAY(cl.data_nascimento) <= DAY(CURDATE()), 'fez', 'nao fez')) as `aniversario`
FROM
    clientes cl;
-- 2 uma query que me retorna todos os pagamentos em boleto, com uma coluna informando se ja venceu
/*
| cliente 		| data_servico 	| data_vencimento   | Situacao
fulano 			|   20/08/2020	| 22/08/2020  		| Vencido
beltrano		|   02/09/2020  | 04/09/2020        | A Vencer
*/
SELECT 
    cl.nome AS `cliente`,
    DATE_FORMAT(co.data_transacao, '%d/%m/%Y') AS `data_servico`,
    DATE_FORMAT(DATE_ADD(co.data_transacao,
                INTERVAL 2 DAY),
            '%d/%m/%Y') AS `data_vencimento`,
    IF(DATE_ADD(co.data_transacao,
            INTERVAL 2 DAY) > NOW(),
        'Vencido',
        'A Vencer') AS `vencimento`
FROM
    comprovantes co
        INNER JOIN
    clientes cl ON co.cliente_id = cl.id
WHERE
    co.forma = 'Boleto';

-- 3 querouma query que me retorne a soma de cada forma de pagamento nos comprovantes, exemplo:
/*
| Boleto | Cartao | Dinheiro |
	3		12			27
*/
SELECT 
    SUM(IF(co.forma='Boleto',1,0)) as `Boleto`,
    SUM(IF(co.forma='Cartao',1,0)) as `Cartao`,
    SUM(IF(co.forma='Dinheiro',1,0)) as `Dinheiro`
FROM
    comprovantes co;

-- 4 Query com uma lista de clientes, verificando o possivel genero deste atravez do servico que o cliente ja realizou
/*
| cliente	|	Genero	     |
| victor	|	Indefido     |
| helena	| 	Feminino(a)  |
| Joao		| 	Masculino(a) |
*/
SELECT DISTINCT
    cl.nome,
    IF(UPPER(se.nome) LIKE UPPER('%FEMININ%'),
        'Feminino(a)',
        IF(UPPER(se.nome) LIKE UPPER('%MASCULIN%'),
            'Masculino(a)',
            'Indefinido')) AS `Genero`
FROM
    clientes cl
        INNER JOIN
    comprovantes co ON cl.id = co.cliente_id
        INNER JOIN
    comprovante_servicos cs ON cs.comprovante_id = co.id
        INNER JOIN
    servicos se ON cs.servico_id = se.id