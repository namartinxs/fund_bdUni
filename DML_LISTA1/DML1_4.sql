USE DDL1_4;

INSERT INTO Clientes (nome, email, telefone)
VALUES 
('Ana Souza', 'ana.souza@email.com', '11988887777'),
('Carlos Pereira', 'carlos.pereira@email.com', '21999996666'),
('Mariana Lima', 'mariana.lima@email.com', '11911112222');

UPDATE Clientes
SET telefone = 21999999999
WHERE id = 2;

DELETE FROM Clientes
WHERE id = 3;


INSERT INTO Produtos(nome,preco,categoria,estoque)
VALUES 
('banana',2.90,'frutas',12),
('maçã',5.00,'frutas',1),
('corrente dourada',0.90,'Acessórios',120),
('berinjela',6.00,'verduras',2),
('tomate',20,'frutas',0);

UPDATE Produtos 
SET preco = 1.200
WHERE categoria = 'Acessórios';

DELETE FROM Produtos 
WHERE estoque = 0;



INSERT INTO Pedidos (id_clientes, valor_total, status_pedido)
VALUES
(1, 150.50, 'CANCELADO'),
(2, 299.90, 'PENDENTE'); 

UPDATE Pedidos
SET status_pedido = 'ENVIADO'
WHERE status_pedido = 'PENDENTE';

DELETE FROM Pedidos
WHERE status_pedido = 'CANCELADO';

INSERT INTO Funcionarios (nome, cpf, cargo, salario) VALUES
('Carlos Silva', '11111111111', 'Analista', 3500.00),
('Fernanda Souza', '22222222222', 'Gerente', 6000.00),
('João Pereira', '33333333333', 'Analista', 3700.00),
('Maria Oliveira', '44444444444', 'Assistente', 2200.00);


UPDATE Funcionarios
SET salario = salario * 1.10
WHERE cargo = 'Analista';


DELETE FROM Funcionarios
WHERE id = 10;