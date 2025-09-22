USE DDL29_30;

INSERT INTO Clientes (nome, email, telefone) VALUES
('Nathalia Martins', 'nathalia@email.com', '51999990001'),
('Felipe Souza', 'felipe@email.com', '51999990002'),
('Amanda Silva', 'amanda@email.com', '51999990003');


INSERT INTO Pagamentos (cliente_id, valor, metodo) VALUES
(1, 150.00, 'Cartão'),
(2, 250.00, 'Boleto'),
(3, 300.00, 'Pix');


UPDATE Pagamentos
SET metodo = 'PIX'
WHERE metodo = 'Boleto';


DELETE FROM Pagamentos
WHERE valor = 0;


INSERT INTO Boletos (numero, emissao, vencimento, valor) VALUES
('BLT001', '2025-09-01', '2025-09-30', 200.00),
('BLT002', '2025-09-05', '2025-10-05', 300.00),
('BLT003', '2025-09-10', '2025-10-10', 400.00);


UPDATE Boletos
SET vencimento = DATE_ADD(vencimento, INTERVAL 10 DAY)
WHERE numero = 'BLT002';


DELETE FROM Boletos
WHERE valor = 0;
