-- 1 Qual o total de clientes por UF, exemplo:
/*
| SP  |   PR  | RS  | SC  |
  10	 12		19		9
*/
SELECT 
    SUM(IF(cl.uf = 'PR', 1, 0)) AS `PR`,
    SUM(IF(cl.uf = 'RS', 1, 0)) AS `RS`,
    SUM(IF(cl.uf = 'SP', 1, 0)) AS `SP`,
    SUM(IF(cl.uf = 'SC', 1, 0)) AS `SC`
FROM
    clientes cl;
    
-- 2 Qual a porctagem de cada forma de pagamento
/*
| Cartao | Boleto | Dinheiro |
	10%		30%		  60%
*/
SELECT 
    CONCAT(ROUND((SUM(IF(co.forma = 'Cartao', 1, 0)) * 100) / (SELECT 
                            COUNT(com.id) AS `total`
                        FROM
                            comprovantes com),
                    2),
            '%') AS `Cartao`,
    CONCAT(ROUND((SUM(IF(co.forma = 'Boleto', 1, 0)) * 100) / (SELECT 
                            COUNT(co.id) AS `total`
                        FROM
                            comprovantes co),
                    2),
            '%') AS `Boleto`,
    CONCAT(ROUND((SUM(IF(co.forma = 'Dinheiro', 1, 0)) * 100) / (SELECT 
                            COUNT(co.id) AS `total`
                        FROM
                            comprovantes co),
                    2),
            '%') AS `Dinheiro`
FROM
    comprovantes co;

-- 3 Qual o genero mais comum de se utilizar a barbaria, divido por %, exemplo
/*
| Indefinido | Masculino | Feminino |
	20%		     30%		50%
*/
SELECT 
    SUM(IF(UPPER(se.nome) LIKE UPPER('%FEMININ%'),
        1,
        0)) AS `Feminino`,
    SUM(IF(UPPER(se.nome) LIKE UPPER('%MASCULIN%'),
        1,
        0)) AS `Masculino`,
    SUM(IF(UPPER(se.nome) NOT LIKE UPPER('%MASCULIN%')
            AND UPPER(se.nome) NOT LIKE UPPER('%FEMININ%'),
        1,
        0)) AS `Indefinido`
FROM
    clientes cl
        INNER JOIN
    comprovantes co ON cl.id = co.cliente_id
        INNER JOIN
    comprovante_servicos cs ON co.id = cs.comprovante_id
        INNER JOIN
    servicos se ON cs.servico_id = se.id


-- 4 Qual foi o servico mais vendido em cada ano de operacao da barbearia
SELECT 
    YEAR(c.data_transacao) as `ano`,
    s.nome,
    count(c.id) as `total`
FROM
    comprovantes c
    INNER JOIN
    comprovante_servicos cs ON c.id = cs.comprovante_id
    INNER JOIN
    servicos s ON cs.servico_id = s.id
GROUP BY 1, 2
ORDER BY 3 DESC;

-- 5 Qual o maior furo de caixa, ou seja, a maior diferenca entre o valor pago em comprovante e o valor real do servico(s)


-- 6 Qual o servico mais comprado em combro, ou seja, quando um comprovante tem dois servicos, qual a combinacao que mais aparece
