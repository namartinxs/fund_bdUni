USE DDL40_44;

SELECT 
T.nome as Transportadora,
E.pedido_id,
E.data_prevista,
E.data_entrega,
E.status_entrega
FROM Entregas E
JOIN Transportadoras T ON E.transportadora_id = T.id
WHERE status_entrega= 'CANCELADA';