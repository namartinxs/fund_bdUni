USE DDL22_24;

INSERT INTO Hoteis (nome, cnpj, cidade, uf) 
VALUES
('Hotel Copacabana Palace', '12345678000195', 'Rio de Janeiro', 'RJ'),
('Hotel Fasano São Paulo', '98765432000188', 'São Paulo', 'SP');

UPDATE Hoteis 
SET cidade = 'Adamantina'
WHERE nome = 'Hotel Fasano São Paulo';

INSERT INTO Quartos (hotel_id,numero,capacidade,preco_diaria) 
VALUES
(1,204,2,25.90),
(1,240,1,20.00),
(1,24,4,50.00),
(1,4,1,20.00); 

DELETE FROM Hoteis
WHERE id NOT IN (SELECT hotel_id FROM Quartos);

DELETE FROM Quartos 
WHERE numero = 24;

INSERT INTO Clientes(nome,email,telefone)
 VALUES 
('nathalia', 'nathalia@gmail.com','5199459812'),
('felipe', 'felipe@gmail.com','5199459812'),
('amanda', 'amanda@gmail.com','5199459812'),
('arthur', 'arthur@gmail.com','5199459812');


INSERT INTO Reservas_Quarto (quarto_id,cliente_id,checkin,checkout,status_reserva) 
VALUES
(1,2,CURDATE(),'2025-09-23','CANCELADA'),
(1,4,CURDATE(),'2025-09-23', 'EM USO'); 

DELETE FROM Reservas_Quarto
WHERE status_reserva = 'CANCELADA';