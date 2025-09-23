USE DDL25_28;

SELECT 
A.nome AS Aluno, 
T.id AS TurmaNumero,
M.status_matricula,
M.data_matricula  
FROM Matriculas M
JOIN Alunos A ON M.aluno_id = A.id
JOIN Turmas T ON M.turma_id  = T.id
WHERE status_matricula = 'ATIVA'
