USE DDL25_28;

INSERT INTO Professores (nome, titulacao, email, telefone) 
VALUES
('Carlos Henrique Silva', 'Doutor', 'carlos.silva@universidade.com', '51998765432'),
('Mariana Souza', 'Mestre', 'mariana.souza@universidade.com', '51991234567'),
('João Pereira', 'Especialista', 'joao.pereira@universidade.com', '51993456789'),
('Fernanda Oliveira', 'Doutora', 'fernanda.oliveira@universidade.com', '51992345678');

UPDATE Professores 
SET titulacao = 'Doutor'
WHERE nome = 'João Pereira' ; 

INSERT INTO Disciplinas (nome, carga_horaria, ementa, periodo)
VALUES
('Banco de Dados', 80, 'Modelagem de dados, SQL, normalização e administração de bancos relacionais.', '2025/1'),
('Estruturas de Dados', 60, 'Listas, pilhas, filas, árvores, grafos e análise de algoritmos.', '2025/2'),
('Engenharia de Software', 70, 'Ciclo de vida do software, requisitos, UML, testes e metodologias ágeis.', '2025/4'),
('Redes de Computadores', 60, 'Protocolos de comunicação, TCP/IP, roteamento, segurança e redes sem fio.', '2025/5');

UPDATE Disciplinas  
SET carga_horaria = 80
WHERE nome = 'Estruturas de Dados' ; 

INSERT INTO Turmas (disciplina_id, professor_id, semestre, turno)
VALUES
(1, 1, '2025/1', 'Matutino'),
(2, 2, '2025/1', 'Noturno'),
(3, 3, '2025/2', 'Vespertino');

UPDATE Turmas  
SET turno = 'Noturno'
WHERE professor_id = 2 ;

DELETE FROM Professores
WHERE id NOT IN (SELECT DISTINCT professor_id FROM Turmas);

DELETE FROM Disciplinas
WHERE id NOT IN (SELECT DISTINCT disciplina_id FROM Turmas);

INSERT INTO Alunos (nome, email) VALUES
('Nathalia Martins', 'nathalia.martins@email.com'),
('Felipe Speck', 'felipe.souza@email.com'),
('Amanda Costa', 'amanda.silva@email.com'),
('Arthur Souza', 'arthur.pereira@email.com'),
('Joana Costa', 'joana.costa@email.com'); 

INSERT INTO Matriculas (aluno_id,turma_id,status_matricula) VALUES 
(1,1,'ATIVA'),
(2,1,'ATIVA'),
(3,1,'ATIVA'),
(4,2,'ATIVA'),
(5,2,'ATIVA');

DELETE FROM Turmas WHERE id NOT IN (SELECT DISTINCT turma_id FROM Matriculas);

UPDATE Matriculas
SET status_matricula = 'TRANCADA'
WHERE aluno_id = 4; 

DELETE FROM Matriculas WHERE status_matricula = 'TRANCADA';