USE DDL40_44;


INSERT INTO Transportadoras (nome, cnpj, telefone, email,regiao) VALUES
('SEDEX', '12345678000190', '5199427613', 'SEDEX@gmail.com','SUL'),
('Tele Shoppe', '98765432000180', '519998099913', 'Shoppe@gmail.com','SUL');


UPDATE Transportadoras 
SET telefone = '5100000000'
WHERE nome = 'SEDEX';


INSERT INTO Fornecedores (razao_social, cnpj, telefone, email) VALUES
('Margaridas do Sol', '12345678000190', '5199427613', 'margaridas@gmail.com'),
('Docinhos da Nath', '98765432000180', '519998099913', 'nathDocinhos@gmail.com'),
('Teleceva da Amanda', '11222333000144', '51991245679', 'amandacevas@gmail.com');


INSERT INTO Pedidos_Compras (fornecedor_id, data_emissao, valor_total, status_pedido) VALUES
(1, CURDATE(), 1110, 'ACEITO'),
(2, CURDATE(), 100, 'ACEITO'),
(3, CURDATE(), 6000, 'ACEITO');


UPDATE Pedidos_Compras
SET status_pedido = 'Rejeitado'
WHERE id = 2;

DELETE FROM Pedidos_Compras
WHERE status_pedido = 'Rejeitado';


INSERT INTO Produtos (nome, preco, categoria, estoque) VALUES
('Brigadeiro', 2.50, 'Doces', 100),
('Beijinho', 2.00, 'Doces', 80),
('Pé de Moleque', 3.00, 'Doces', 50),
('Trufa de Chocolate', 5.00, 'Doces', 40);


INSERT INTO Estoque (produto_id, quantidade, localizacao, minimo) VALUES
(1, 50, 'Armazém A', 10),
(2, 30, 'Armazém B', 5),
(3, 100, 'Armazém C', 20),
(4, 25, 'Armazém A', 5);


UPDATE Estoque
SET quantidade = 4
WHERE produto_id = 4;


INSERT INTO Itens_Pedido (pedido_id, produto_id, quantidade, preco_unit) VALUES
(1, 4, 1, 0.50),
(1, 4, 1, 0.50),
(1, 4, 1, 0.50),
(1, 4, 1, 0.50),
(1, 4, 1, 0.50);

UPDATE Itens_Pedido
SET preco_unit = 0.60
WHERE produto_id = 4;


DELETE FROM Itens_Pedido
WHERE preco_unit <= 0 OR quantidade <= 0;

INSERT INTO Entregas (pedido_id, transportadora_id, data_prevista, status_entrega) VALUES
(1, 1, CURDATE() + INTERVAL 15 DAY, 'Pendente'),
(2, 1, CURDATE() + INTERVAL 15 DAY, 'Pendente'),
(3, 1, CURDATE() + INTERVAL 15 DAY, 'Cancelada');
UPDATE Entregas
SET status_entrega = 'Entregue'
WHERE id = 2;
UPDATE Entregas
SET data_entrega = CURDATE() + INTERVAL 15 DAY
WHERE status_entrega = 'Entregue';
DELETE FROM Entregas
WHERE status_entrega = 'Cancelada';

DELETE FROM Entregas
WHERE pedido_id IN (SELECT id FROM Pedidos_Compras WHERE status_pedido = 'Rejeitado');

DELETE FROM Transportadoras 
WHERE id NOT IN (SELECT DISTINCT transportadora_id FROM Entregas);