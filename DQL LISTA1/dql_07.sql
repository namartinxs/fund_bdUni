USE DDL5_12;

SELECT Alunos.nome, Notas.nota
FROM Notas
JOIN Alunos ON Notas.aluno_id = Alunos.id
WHERE Notas.nota > 7;
