USE DDL37_39; 
INSERT INTO Eventos( nome,local_evento,data_evento,lotacao,status_evento) VALUES 
('Numa Nice', 'POA', '2025-09-30',2000,'ENCERRADO'),
('Meu aniversario', 'POA', '2025-11-18',10,'ATIVO');

UPDATE Eventos 
SET local_evento = 'Cachoeirinha'
WHERE nome = 'Meu aniversario';

DELETE FROM Eventos WHERE status_evento = 'ENCERRADO';

INSERT INTO Ingressos (evento_id, tipo, preco, lote) VALUES
(2, 'Pista', 120.00, 1),
(2, 'Camarote', 250.00, 1),
(2, 'VIP', 500.00, 1),
(2, 'Meia Entrada', 60.00, 2);

UPDATE Ingressos 
SET preco = 5000
WHERE tipo =  'Camarote'; 

INSERT INTO Clientes (nome, email, telefone) VALUES
('Nathalia Martins', 'nathalia.martins@email.com', '51999990001'),
('Felipe Souza', 'felipe.souza@email.com', '51999990002');

INSERT INTO Pag_Ingressos (ingresso_id,cliente_id,data_pagto,valor,status_pgto) 
VALUES
(1,1,CURDATE(),120.00, 'CONCLUIDO'),
(2,2,CURDATE(), 250.00,'CANCELADO');

DELETE FROM Ingressos WHERE id NOT IN (SELECT DISTINCT ingresso_id FROM Pag_Ingressos);
DELETE FROM Pag_Ingressos WHERE status_pgto = 'CANCELADO'
