USE DDL19_21;

INSERT INTO Carros (placa, modelo, marca, ano) 
VALUES
('ABC1D23','Onix','Chevrolet',2020),
('XYZ9K88','Corolla','Toyota',2019),
('JKL4M56','Civic','Honda',2021),
('MNO7P22','Gol','Volkswagen',2018);

UPDATE Carros
SET ano = 2004
WHERE placa = 'MNO7P22';

DELETE FROM Carros WHERE placa = 'XYZ9K88';

INSERT INTO Marcas (nome, pais_origem, descricao, site) VALUES
('Toyota', 'Japão', 'Fabricante japonesa conhecida pela confiabilidade e inovação.', 'https://www.toyota.com'),
('Volkswagen', 'Alemanha', 'Montadora alemã, famosa pelo modelo Fusca e inovação tecnológica.', 'https://www.vw.com');

UPDATE Marcas
SET pais_origem = 'EUA'
WHERE nome = 'Toyota';

DELETE FROM Marcas WHERE nome NOT IN ( SELECT DISTINCT marca FROM Carros);

INSERT INTO Clientes(nome,email,telefone)
 VALUES 
('nathalia', 'nathalia@gmail.com','5199459812');


INSERT INTO Reservas_Carro (carro_id,cliente_id,data_fim) 
VALUES 
(1,1,'2026-04-02'),
(3,1,'2025-05-02');

UPDATE Reservas_Carro 
SET data_fim = '2027-04-02'
WHERE id = 1; 

DELETE FROM Reservas_Carro WHERE data_fim > CURDATE()