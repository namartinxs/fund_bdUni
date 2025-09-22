USE DDL31_33;

INSERT INTO Seguradoras (nome,cnpj,telefone,email)
VALUES
('Seguradora Poly',12345678000190, 5199427613, 'poly@gmail.com'),
('Seguradora Nath', 98765432000180, 519998099913, 'nathDocinhos@gmail.com');

UPDATE Seguradoras
SET email = 'polyAna@gmail.com'
WHERE cnpj = 12345678000190;      

INSERT INTO Segurados (nome, email, telefone) VALUES
('Nathalia Martins', 'nathalia.martins@email.com', '51999990001'),
('Felipe Souza', 'felipe.souza@email.com', '51999990002'),
('Amanda Silva', 'amanda.silva@email.com', '51999990003');

INSERT INTO Apolices (segurado_id,seguradora_id,premio,validade) 
VALUES 
(1,2,10,'2025-11-18'),
(2,2,100,'2025-11-18'),
(3,2,1000,'2024-11-18');

DELETE FROM Seguradoras WHERE id NOT IN (SELECT DISTINCT seguradora_id FROM Apolices);

UPDATE Apolices
SET premio = 100000
WHERE segurado_id = 1; 

DELETE FROM Apolices
WHERE validade < CURDATE();

INSERT INTO Sinistros (apolice_id, data_ocorrencia, descricao, valor, status_sinistro) VALUES
(2, '2025-01-15', 'Acidente de carro leve, com danos no para-choque.', 1500.00,'ATIVO'),
(2, '2025-03-10', 'Roubo de bicicleta estacionada na garagem.', 800.00,'ATIVO'),
(2, '2025-06-05', 'Danos em residência devido a vazamento de água.', 2500.00,'CANCELADO');

UPDATE Sinistros
SET valor = 100000
WHERE id = 1; 

DELETE FROM Sinistros 
WHERE status_sinistro = 'CANCELADO';