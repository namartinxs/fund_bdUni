USE DDL40_44;

SELECT 
    F.razao_social AS Fornecedor,
    P.valor_total,
    P.data_emissao,
    P.status_pedido
FROM Pedidos_Compras P
JOIN Fornecedores F ON P.fornecedor_id = F.id
WHERE P.status_pedido = 'APROVADO';
