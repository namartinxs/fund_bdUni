USE DDL13_15;

SELECT F.razao_social AS fornecedor, P.valor_total
FROM Pedidos P
JOIN Fornecedores F ON P.id_fornecedor = F.id
WHERE P.valor_total > 1000;
