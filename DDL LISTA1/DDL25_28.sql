CREATE DATABASE DDL25_28;
USE DDL25_28;


CREATE TABLE Professores (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR(120) NOT NULL,
    titulacao VARCHAR(60) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    telefone VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE Disciplinas (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR(120) NOT NULL,
    carga_horaria INT NOT NULL,
    ementa TEXT NOT NULL,
    periodo VARCHAR(20) NOT NULL
);

CREATE TABLE Turmas (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    disciplina_id INT,
    professor_id INT,
    semestre VARCHAR(10) NOT NULL,
    turno VARCHAR(15) NOT NULL,
    FOREIGN KEY (disciplina_id)
        REFERENCES Disciplinas (id),
    FOREIGN KEY (professor_id)
        REFERENCES Professores (id)
);
CREATE TABLE Alunos (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE
); 

CREATE TABLE Matriculas (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    aluno_id INT,
    turma_id INT,
    data_matricula DATETIME DEFAULT CURRENT_TIMESTAMP,
    status_matricula VARCHAR(20) NOT NULL,
    FOREIGN KEY (aluno_id)
        REFERENCES Alunos (id),
    FOREIGN KEY (turma_id)
        REFERENCES Turmas (id)
);
