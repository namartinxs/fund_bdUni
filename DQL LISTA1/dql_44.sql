USE DDL40_44;

SELECT 
    P.nome AS Produto,
    I.quantidade
FROM Itens_Pedido I
JOIN Produtos P ON I.produto_id = P.id
WHERE I.produto_id = 4

