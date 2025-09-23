USE DDL40_44;
SELECT 
    P.nome AS Produto,
    E.quantidade,
    E.minimo,
    E.localizacao
FROM Estoque E
JOIN Produtos P ON E.produto_id = P.id
WHERE E.quantidade < E.minimo;