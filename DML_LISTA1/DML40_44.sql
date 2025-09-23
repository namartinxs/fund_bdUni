USE DDL40_40;

UPDATE Entregas 
SET status_entrega = 'Entregue'
WHERE id = 2;

UPDATE Entregas
SET data_entrega = CURDATE() + INTERVAL 15 DAY
WHERE status_entrega = 'Entregue';


DELETE FROM Transportadoras 
WHERE id NOT IN (SELECT DISTINCT transportadora_id FROM Entregas);

DELETE FROM Entregas 
WHERE status_entrega = 'Cancelada';


UPDATE Pedidos_Compras 
SET status_pedido = 'Rejeitado'
WHERE id = 2;


DELETE FROM Entregas
WHERE pedido_id IN (SELECT id FROM Pedidos_Compras WHERE status_pedido = 'Rejeitado');


DELETE FROM Pedidos_Compras
WHERE status_pedido = 'Rejeitado';


UPDATE Estoque 
SET quantidade = 4
WHERE produto_id = 4;


INSERT INTO Itens_Pedido (pedido_id, produto_id, quantidade, preco_unit) 
VALUES
(1,4,1,0.50),
(1,4,1,0.50),
(1,4,1,0.50),
(1,4,1,0.50),
(1,4,1,0.50);


UPDATE Itens_Pedido
SET preco_unit = 0.60
WHERE produto_id = 4;

DELETE FROM Itens_Pedido
WHERE preco_unit <= 0 OR quantidade <= 0;
