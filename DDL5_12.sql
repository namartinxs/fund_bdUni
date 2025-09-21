CREATE DATABASE DDL5_12;
USE DDL5_12; 

CREATE TABLE Cursos (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR(120) NOT NULL,
    carga_horaria INT NOT NULL,
    modalidade VARCHAR(30) NOT NULL,
    ativo BOOLEAN NOT NULL
);

CREATE TABLE Alunos (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    data_matricula DATETIME DEFAULT CURRENT_TIMESTAMP,
    curso_id INT,
    FOREIGN KEY (curso_id)
        REFERENCES Cursos (id)
); 

CREATE TABLE Notas (
id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
aluno_id INT,
disciplina VARCHAR(80) NOT NULL,
avaliacao VARCHAR(40) NOT NULL,
nota DECIMAL(4,2) NOT NULL,
FOREIGN KEY (aluno_id) REFERENCES Alunos(id)
);

CREATE TABLE Departamentos(
id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
codigo CHAR(5) UNIQUE NOT NULL,
nome VARCHAR(100) NOT NULL,
centro_custo VARCHAR(20) NOT NULL,
ativo BOOLEAN NOT NULL
);

CREATE TABLE Livros(
id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
isbn CHAR(13) UNIQUE UNIQUE NOT NULL,
titulo VARCHAR(150) NOT NULL,
autor VARCHAR(120) NOT NULL,
ano INT NOT NULL
);

CREATE TABLE Editoras(
id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
nome VARCHAR(150) NOT NULL,
cnpj CHAR(14) UNIQUE NOT NULL,
cidade VARCHAR(80) NOT NULL,
uf CHAR(2) NOT NULL
);

CREATE TABLE Autores(
id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
nome VARCHAR(120) NOT NULL,
nacionalidade VARCHAR(60) NOT NULL,
email VARCHAR(120) UNIQUE NOT NULL,
data_nascimento DATE NOT NULL
);

CREATE TABLE Emprestimos(
id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
aluno_id INT,
livro_id INT NOT NULL,
data_saida DATETIME DEFAULT CURRENT_TIMESTAMP,
data_devolucao DATE NOT NULL
);


INSERT INTO Cursos (nome, carga_horaria, modalidade, ativo) VALUES
('Engenharia de Software', 3600, 'Presencial', TRUE),
('Ciência de Dados', 1800, 'Online', TRUE),
('Administração', 3200, 'Presencial', TRUE),
('Design Gráfico', 2400, 'Híbrido', FALSE);


INSERT INTO Alunos (nome, email, curso_id) VALUES
('Ana Silva', 'ana.silva@email.com', 1),
('Carlos Souza', 'carlos.souza@email.com', 2),
('Mariana Costa', 'mariana.costa@email.com', 1),
('João Pereira', 'joao.pereira@email.com', 3);


INSERT INTO Notas (aluno_id, disciplina, avaliacao, nota) VALUES
(1, 'Banco de Dados', 'Prova 1', 8.5),
(1, 'Programação', 'Prova 2', 9.0),
(2, 'Estatística', 'Prova 1', 7.5),
(3, 'Engenharia de Software', 'Projeto Final', 9.5);


INSERT INTO Departamentos (codigo, nome, centro_custo, ativo) VALUES
('DEP01', 'Tecnologia da Informação', 'CC101', TRUE),
('DEP02', 'Recursos Humanos', 'CC202', TRUE),
('DEP03', 'Biblioteca Central', 'CC303', TRUE),
('DEP04', 'Financeiro', 'CC404', FALSE);


INSERT INTO Editoras (nome, cnpj, cidade, uf) VALUES
('Editora Ciência Viva', '12345678000199', 'São Paulo', 'SP'),
('Editora Alpha', '98765432000155', 'Rio de Janeiro', 'RJ');


INSERT INTO Autores (nome, nacionalidade, email, data_nascimento) VALUES
('Paulo Coelho', 'Brasileira', 'paulo.coelho@email.com', '1947-08-24'),
('Clarice Lispector', 'Brasileira', 'clarice.lispector@email.com', '1920-12-10'),
('George Orwell', 'Britânica', 'george.orwell@email.com', '1903-06-25');


INSERT INTO Livros (isbn, titulo, autor, ano) VALUES
('9788535902778', 'Dom Casmurro', 'Machado de Assis', 1899),
('9788525061643', 'O Alquimista', 'Paulo Coelho', 1988),
('9780451524935', '1984', 'George Orwell', 1949);


INSERT INTO Emprestimos (aluno_id, livro_id, data_devolucao) VALUES
(1, 1, '2025-09-30'),
(2, 2, '2025-09-25'),
(3, 3, '2025-10-05');










