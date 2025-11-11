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
