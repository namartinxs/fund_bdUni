CREATE DATABASE L9;
USE L9; 

CREATE TABLE Curso(
    cod_curso SMALLINT PRIMARY KEY NOT NULL,
    nome VARCHAR(100) NOT NULL,
    titulo VARCHAR(120) NOT NULL
);

CREATE TABLE Disciplina (
    cod_d INT PRIMARY KEY NOT NULL, 
    nome VARCHAR(100) NOT NULL,
    ch INT NOT NULL
); 


CREATE TABLE Curriculo (
    cod_curso SMALLINT NOT NULL,
    num_curriculo  INT PRIMARY KEY NOT NULL,
    data_inicio DATE,
    ch INT NOT NULL,
    CONSTRAINT FK_Cod_curso FOREIGN KEY(cod_curso) REFERENCES Curso(cod_curso)
);

CREATE TABLE Disciplina_Curriculo(
    cod_curso SMALLINT,
    num_curriculo INT,
    cod_d INT,
    CONSTRAINT FK_DC_Curso FOREIGN KEY (cod_curso) REFERENCES Curso(cod_curso),
    CONSTRAINT FK_DC_Curriculo FOREIGN KEY (cod_curso, num_curriculo) REFERENCES Curriculo(cod_curso, num_curriculo),
    CONSTRAINT FK_DC_Disciplina FOREIGN KEY (cod_d) REFERENCES Disciplina(cod_d)

);


-- Cursos
INSERT INTO Curso (cod_curso, nome, titulo) VALUES
(6074, 'Sistemas de Informação', 'Bacharel'),
(6110, 'Análise e Desenvolvimento de Sistemas', 'Tecnólogo'),
(6094, 'Ciência da Computação', 'Bacharel');

-- Disciplinas
INSERT INTO Disciplina (cod_d, nome, ch) VALUES
(60030, 'Banco de Dados I', 60),
(95234, 'Definição de Processos', 120);

-- Currículos
INSERT INTO Curriculo (cod_curso, num_curriculo, data_inicio, ch) VALUES
(6110, 2, '2020-03-01', 3300),
(6074, 4, '2022-01-01', 3060);

-- Disciplina_Curriculo
INSERT INTO Disciplina_Curriculo (cod_curso, num_curriculo, cod_d) VALUES
(6074, 4, 60030),
(6074, 4, 95234),
(6110, 2, 60030),
(6110, 2, 95234);

-- ========================================
-- 4) Consultar dados para teste
-- ========================================
SELECT * FROM Curso;
SELECT * FROM Disciplina;
SELECT * FROM Curriculo;
SELECT * FROM Disciplina_Curriculo;

-- 3.1. Qual o código dos cursos que têm carga horária superior 3.100 horas?
SELECT cod_curso FROM curriculo WHERE ch >  3.100;
-- 3.2. Quais as disciplinas, com carga horária superior a 60 horas, que estão presentes nos currículos de cursos
-- de tecnólogo?
SELECT d.cod_d, d.nome, d.ch, c.nome AS curso, c.titulo
FROM Disciplina d
JOIN Disciplina_Curriculo dc
    ON d.cod_d = dc.cod_d
JOIN Curriculo cu
    ON dc.cod_curso = cu.cod_curso 
   AND dc.num_curriculo = cu.num_curriculo
JOIN Curso c
    ON cu.cod_curso = c.cod_curso
WHERE d.ch > 60
  AND c.titulo = 'Tecnólogo';

-- 3.3. Qual a carga horária média das disciplinas dos cursos de tecnólogo (por currículo de curso)?
SELECT 
    c.cod_curso,
    c.nome AS curso,
    cu.num_curriculo,
    AVG(d.ch) AS carga_horaria_media
FROM Curso c
JOIN Curriculo cu
    ON c.cod_curso = cu.cod_curso
JOIN Disciplina_Curriculo dc
    ON cu.cod_curso = dc.cod_curso 
   AND cu.num_curriculo = dc.num_curriculo
JOIN Disciplina d
    ON dc.cod_d = d.cod_d
WHERE c.titulo = 'Tecnólogo'
GROUP BY c.cod_curso, cu.num_curriculo, c.nome;

-- 3.4. Quantas disciplinas (ao todo) são ministradas em cada currículo de cada curso?
SELECT 
    c.cod_curso,
    c.nome AS curso,
    cu.num_curriculo,
    COUNT(dc.cod_d) AS total_disciplinas
FROM Curso c
JOIN Curriculo cu
    ON c.cod_curso = cu.cod_curso
JOIN Disciplina_Curriculo dc
    ON cu.cod_curso = dc.cod_curso 
   AND cu.num_curriculo = dc.num_curriculo
GROUP BY c.cod_curso, cu.num_curriculo, c.nome;

-- 3.5. Quais disciplinas fazem parte de todos os cursos, ou seja, estão presentes em todos os cursos ao mesmo
-- tempo?
SELECT d.cod_d, d.nome
FROM Disciplina d
JOIN Disciplina_Curriculo dc
    ON d.cod_d = dc.cod_d
GROUP BY d.cod_d, d.nome
HAVING COUNT(DISTINCT dc.cod_curso) = (SELECT COUNT(*) FROM Curso);

-- 3.6. Quais disciplinas fazem parte de cursos de bacharelado e de tecnologia ao mesmo tempo? 

SELECT d.cod_d, d.nome
FROM Disciplina d
JOIN Disciplina_Curriculo dc
    ON d.cod_d = dc.cod_d
JOIN Curriculo cu
    ON dc.cod_curso = cu.cod_curso 
   AND dc.num_curriculo = cu.num_curriculo
JOIN Curso c
    ON cu.cod_curso = c.cod_curso
GROUP BY d.cod_d, d.nome
HAVING SUM(CASE WHEN c.titulo = 'Bacharel' THEN 1 ELSE 0 END) > 0
   AND SUM(CASE WHEN c.titulo = 'Tecnólogo' THEN 1 ELSE 0 END) > 0;
