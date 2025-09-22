USE DDL13_15;

INSERT INTO Fornecedores (razao_social,cnpj,telefone,email)
VALUES
('Margaridas do Sol',12345678000190, 5199427613, 'margaridas@gmail.com'),
('Docinhos da Nath', 98765432000180, 519998099913, 'nathDocinhos@gmail.com'),
('Teleceva da Amanda',11222333000144, 51991245679, 'amandacevas@gmail.com');

UPDATE Fornecedores 
SET telefone = 529998099913
WHERE razao_social = 'Docinhos da Nath';  

DELETE FROM Fornecedores
WHERE id NOT IN (SELECT DISTINCT id_fornecedor FROM Pedidos);


INSERT INTO Clientes_Regras (nome,idade,email 
) VALUES
('Nathalia',21,'nathalia@gmail.com'),
('Amanda',21,'amanda@gmail.com'),
('Felipe',45,'feipe@gmail.com'),
('Benjamin',12, 'min@gmail.com');

UPDATE Clientes_Regras
SET email = 'spec@gmail.com'
WHERE nome = 'Felipe';

DELETE FROM Clientes_Regras
WHERE idade <18;

INSERT INTO Pedidos (id_clientes,id_fornecedor,valor_total,status_pedido) VALUES
(2,1,1200.00, 'EM ANDAMENTO'),
(1,2,5000.00,'EM ANDAMENTO'),
(2,2,600.00,'EM ANDAMENTO');

INSERT INTO Vendas (pedido_id,valor,metodo_pagamento) VALUES
(1,1200.00,'Cartão'),
(2,5000.00,'DOC');

UPDATE Vendas
SET metodo_pagamento = 'PIX'
WHERE id =2;

DELETE FROM Vendas
WHERE valor = 0
