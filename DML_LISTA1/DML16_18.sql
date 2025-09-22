USE DDL16_18;

INSERT INTO Medicos(nome, crm,especialidade,telefone )
VALUES
('Auzio Varela','102345', 'clinico geral','519998887771'),
('Ivo Pitanguy','203876', 'clinico geral','514567654789'),
('Adolfo Bezerra de Menezes Cavalcanti','309451', 'clinico geral','534567619087');

UPDATE Medicos 
SET especialidade = 'cirurgião plastico'
WHERE nome = 'Ivo Pitanguy' ;

INSERT INTO Pacientes (nome,cpf,dataNascimento,telefone) VALUES
('nathalia','65089656980','2004-11-18','5199678907'),
('amanda','5609876990','2004-12-18','5196589901'),
('felipe','6969495607','2004-09-18','5156464787'),
('caio','60134567890','2004-11-15','5165669087');

UPDATE Pacientes
SET telefone = '5199459713'
WHERE nome = 'nathalia' ; 

INSERT INTO Consultas (medico_id, paciente_id, data_hora, status_consulta) VALUES
(2, 3, '2025-09-25 10:00:00', 'AGENDADO'), 
(2, 2, '2025-09-25 10:00:00', 'CANCELADO'),
(2, 4, '2025-09-25 14:00:00','AGENDADO'); 

DELETE FROM Medicos
WHERE id NOT IN (SELECT DISTINCT medico_id FROM Consultas);

DELETE FROM Pacientes
WHERE id NOT IN (SELECT DISTINCT paciente_id FROM Consultas); 

DELETE FROM Consultas
WHERE status_consulta = 'CANCELADO';
 