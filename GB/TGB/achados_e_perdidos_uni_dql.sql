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
ON u.id = a.id_usuario
ORDER BY u.nome