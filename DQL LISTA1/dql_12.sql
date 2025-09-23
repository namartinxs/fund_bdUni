USE DDL5_12;
SELECT 
    A.nome AS aluno,
    L.titulo AS livro,
    E.data_saida,
    E.data_devolucao
FROM Emprestimos E
JOIN Alunos A ON E.aluno_id = A.id
JOIN Livros L ON E.livro_id = L.id
WHERE E.data_devolucao < CURDATE();
