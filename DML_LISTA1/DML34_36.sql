USE DDL34_36;

INSERT INTO Usuarios (login, senha_hash, email, ativo) VALUES
('nathalia', 'hash123', 'nathalia@email.com', TRUE),
('felipe', 'hash456', 'felipe@email.com', TRUE),
('amanda', 'hash789', 'amanda@email.com', FALSE);


UPDATE Usuarios
SET senha_hash = 'novoHash456'
WHERE login = 'felipe';

DELETE FROM Usuarios
WHERE ativo = FALSE;


INSERT INTO Perfis (nome, usuario_id, descricao, nivel, ativo) VALUES
('Administrador', 1, 'Acesso total ao sistema', 5, TRUE),
('Usuário', 3, 'Acesso limitado', 1, TRUE);


DELETE FROM Perfis
WHERE usuario_id IN (
    SELECT id FROM Usuarios
    WHERE ativo = FALSE
);


UPDATE Perfis
SET nivel = 2
WHERE nome = 'Usuário';


INSERT INTO Logs_Acesso (usuario_id, ip, acao) VALUES
(1, '192.168.0.1', 'Login realizado'),
(2, '192.168.0.2', 'Logout realizado'),
(1, '192.168.0.1', 'Alteração de senha');


UPDATE Logs_Acesso
SET acao = 'Login falhou'
WHERE id = 2;


DELETE FROM Logs_Acesso
WHERE data_hora < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
