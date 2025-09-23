USE DDL5_12;

SELECT nome, email
FROM Alunos
WHERE YEAR(data_matricula) = 2025;
