SELECT 
    nome,
    descricao,
    data_encontrado,
    status
FROM Item
ORDER BY data_encontrado DESC;

SELECT 
u.id as usuario,
u.nome as nome,
a.curso 
FROM usuario u 
INNER JOIN aluno a  
ON u.id = a.id_usuario;


SELECT 
    nome,
    descricao,
    data_encontrado,
    status
FROM Item
WHERE data_encontrado BETWEEN '2025-09-20' AND '2025-10-05'
ORDER BY data_encontrado;

SELECT 
u.id as usuario,
u.nome as nome,
a.curso 
FROM usuario u 
INNER JOIN aluno a  
ON u.id = a.id_usuario 
WHERE u.nome like '%a';

SELECT 
    status,
    COUNT(*) AS total_itens
FROM Item
GROUP BY status;

-- mostra o curso so se for aluno se nao null
SELECT 
    u.id AS id_usuario,
    u.nome AS nome_usuario,
    a.curso
FROM Usuario u
LEFT OUTER JOIN Aluno a
    ON u.id = a.id_usuario;

-- elimina vlrs duplicados

SELECT DISTINCT curso
FROM Aluno;

SELECT 
    id_local,
    COUNT(*) AS total_itens
FROM Item
GROUP BY id_local
HAVING COUNT(*) > 2;

