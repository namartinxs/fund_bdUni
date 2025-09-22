USE DDL5_12; 

INSERT INTO Cursos (nome, carga_horaria, modalidade, ativo)
VALUES
('Banco de dados', 720, 'EAD', TRUE),
('Hacker do zero ao avançado', 20, 'EAD', TRUE),
('Injeções SQL', 200, 'Presencial', FALSE);


UPDATE Cursos
SET carga_horaria = 2000
WHERE nome = 'Banco de dados';


INSERT INTO Alunos (nome, email, curso_id)
VALUES
('Ana Silva', 'ana.silva@email.com', 1),
('Carlos Souza', 'carlos.souza@email.com', 2),
('Mariana Costa', 'mariana.costa@email.com', 1),
('João Pereira', 'joao.pereira@email.com', 2),
('Joana', 'joana.@email.com', 2),
('Linda Maria de Assis', 'lindinha@email.com', 1),
('Felipe Spec', 'felipinho@email.com', 2);



UPDATE Alunos
SET email = 'felipinhoSpec@gmail.com'
WHERE id = 7;


UPDATE Cursos
SET ativo = FALSE
WHERE id = 1;

DELETE FROM Alunos
WHERE curso_id IN (SELECT id FROM (SELECT id FROM Cursos WHERE ativo = FALSE) AS temp);

DELETE FROM Cursos
WHERE ativo = FALSE;

INSERT INTO Notas (aluno_id, disciplina, avaliacao, nota) VALUES
(2, 'Banco de Dados', 'Prova1', 8.5),
(4, 'Banco de Dados', 'Prova2', 9.0),
(5, 'Banco de Dados', 'Prova1', 7.5),
(7, 'Banco de Dados', 'Projeto Final', 9.5);


UPDATE Notas 
SET nota = 2.0
WHERE avaliacao = 'Prova2'; 

DELETE FROM Notas
WHERE nota < 3;

INSERT INTO Departamentos (codigo, nome, centro_custo, ativo) VALUES
('DEP01', 'TI', 'CC101', TRUE),
('DEP02', 'RH', 'CC202', TRUE),
('DEP03', 'FIN', 'CC303', TRUE),
('DEP04', 'Financeiro', 'CC404', FALSE);

UPDATE Departamentos 
SET nome = 'Financeiro Geral'
WHERE nome = 'FIN';

DELETE FROM Departamentos 
WHERE ativo = FALSE;

INSERT INTO Editoras (nome, cnpj, cidade, uf) VALUES
('Editora Ciência Viva', '12345678000199', 'São Paulo', 'SP'),
('Editora Alpha', '98765432000155', 'Rio de Janeiro', 'RJ');

INSERT INTO Livros (id_editora,isbn, titulo, autor, ano) VALUES
(2,'9494359320494', 'Dom Casmurro', 'Machado de Assis', 2025),
(2,'9788525061643', 'O Alquimista', 'Paulo Coelho', 1988),
(2,'9780451524935', '1984', 'George Orwell', 1949),
(2,'9404208450820', 'Lisístrata', 'Lisístrata', 411),
(2,'9780550603358', 'Verity', 'Colleen Hoover', 2018);

UPDATE Livros
SET ano = 1899
WHERE isbn = '9788535902778';

DELETE FROM Livros
WHERE isbn = '9780451524935'; 

DELETE FROM Editoras
WHERE id NOT IN (
    SELECT id_editora FROM (SELECT id_editora FROM Livros) AS temp
);

INSERT INTO Autores (nome, nacionalidade, email, data_nascimento) 
VALUES
('Machado de Assis', 'Brasileiro', 'machado@gmail.com', '1839-06-21'),
('Colleen Hoover', 'Estados Unidos', 'colleen@gmail.com', '1979-12-11'),
('Thalita Rebouças', 'Brasileira', 'thalita@gmail.com', '1974-11-10');

DELETE FROM Autores
WHERE nome NOT IN (
    SELECT autor FROM (SELECT autor FROM Livros) AS temp
);

INSERT INTO Emprestimos (aluno_id, livro_id, data_saida, data_devolucao)
VALUES
(1, 1, '2025-09-21 10:00:00', '2025-10-01'),
(2, 2, '2025-09-22 15:30:00', '2025-01-05'); 


UPDATE Emprestimos
SET data_devolucao = '2025-10-10'
WHERE id = 1;

DELETE FROM Emprestimos
WHERE data_devolucao < CURDATE();