USE achados_e_perdidos_Uni_ddl_GB;

INSERT INTO Usuario (id, nome, email, status) VALUES
(1, 'Maria Silva', 'maria.silva@uni.edu', 'ativo'),
(2, 'João Santos', 'joao.santos@uni.edu', 'ativo'),
(3, 'Carlos Oliveira', 'carlos.oliveira@uni.edu', 'inativo'),
(4, 'Ana Costa', 'ana.costa@uni.edu', 'ativo'),
(5, 'Steven Seagal', 'steven.seagal@uni.edu', 'inativo'),
(6, 'Tania Maria', 'tania.maria@uni.edu', 'ativo'),
(7, 'Nathalia Martins', 'nathalia.martins@uni.edu', 'ativo'),
(8, 'Arthur Tutur', 'arthur.tutur@uni.edu', 'ativo'),
(9, 'Polyana Santos', 'polyana.santos@uni.edu', 'ativo'),
(10, 'Amanda Matos', 'amanda.matos@uni.edu', 'inativo'),
(11, 'Ricardo Lima', 'ricardo.lima@uni.edu', 'ativo'),
(12, 'Fernanda Torres', 'fernanda.torres@uni.edu', 'ativo'),
(13, 'Luiz Carvalho', 'luiz.carvalho@uni.edu', 'ativo'),
(14, 'Juliana Rocha', 'juliana.rocha@uni.edu', 'ativo'),
(15, 'Pedro Almeida', 'pedro.almeida@uni.edu', 'ativo'),
(16, 'Sofia Melo', 'sofia.melo@uni.edu', 'ativo'),
(17, 'Bruno Castro', 'bruno.castro@uni.edu', 'ativo'),
(18, 'Clara Nunes', 'clara.nunes@uni.edu', 'ativo'),
(19, 'Diego Barbosa', 'diego.barbosa@uni.edu', 'ativo'),
(20, 'Larissa Prado', 'larissa.prado@uni.edu', 'ativo'),
(21, 'Rafael Teixeira', 'rafael.teixeira@uni.edu', 'ativo'),
(22, 'Beatriz Souza', 'beatriz.souza@uni.edu', 'ativo'),
(23, 'Gabriel Ferreira', 'gabriel.ferreira@uni.edu', 'ativo'),
(24, 'Camila Duarte', 'camila.duarte@uni.edu', 'ativo'),
(25, 'Vinícius Nogueira', 'vinicius.nogueira@uni.edu', 'ativo'),
(26, 'Patrícia Moraes', 'patricia.moraes@uni.edu', 'ativo'),
(27, 'Felipe Ramos', 'felipe.ramos@uni.edu', 'ativo'),
(28, 'Helena Pires', 'helena.pires@uni.edu', 'ativo'),
(29, 'Rodrigo Monteiro', 'rodrigo.monteiro@uni.edu', 'ativo'),
(30, 'Mariana Faria', 'mariana.faria@uni.edu', 'ativo');


INSERT INTO Administrador (id, id_usuario, cargo) VALUES
(1, 1, 'Coordenador do Setor de Achados e Perdidos'),
(2, 4, 'Assistente Administrativo'),
(3, 6, 'Analista de Suporte'),
(4, 8, 'Gerente de Operações'),
(5, 10, 'Secretária Acadêmica'),
(6, 11, 'Supervisor de Atendimento'),
(7, 12, 'Analista de Processos'),
(8, 13, 'Gestor de TI'),
(9, 14, 'Chefe de Departamento'),
(10, 15, 'Coordenador de Curso'),
(11, 16, 'Analista Financeiro'),
(12, 17, 'Administrador do Sistema');


INSERT INTO Aluno (id_usuario, matricula, curso) VALUES
(2, 20231001, 'Engenharia de Software'),
(3, 20231002, 'Administração'),
(5, 20231003, 'Design Gráfico'),
(7, 20231004, 'Arquitetura e Urbanismo'),
(9, 20231005, 'Psicologia'),
(18, 20231006, 'Ciência da Computação'),
(19, 20231007, 'Direito'),
(20, 20231008, 'Engenharia Civil'),
(21, 20231009, 'Jornalismo'),
(22, 20231010, 'Medicina'),
(23, 20231011, 'Física'),
(24, 20231012, 'Educação Física'),
(25, 20231013, 'Biomedicina'),
(26, 20231014, 'Engenharia Elétrica'),
(27, 20231015, 'Publicidade e Propaganda'),
(28, 20231016, 'Sistemas de Informação'),
(29, 20231017, 'História'),
(30, 20231018, 'Matemática');


INSERT INTO Localizacao (id, nome, descricao) VALUES
(1, 'Biblioteca', 'Área de empréstimos e leitura'),
(2, 'Bloco A', 'Corredor próximo às salas de aula'),
(3, 'Portaria', 'Entrada principal da universidade'),
(4, 'Cantina', 'Espaço para alimentação e convivência'),
(5, 'Sala 101', 'Sala de aula do Bloco A - equipada com projetor'),
(6, 'Sala 102', 'Sala de aula do Bloco A - próxima ao laboratório'),
(7, 'Sala 201', 'Sala de aula do Bloco B - usada para aulas de cálculo'),
(8, 'Sala 202', 'Sala de aula do Bloco B - usada para apresentações'),
(9, 'Sala 301', 'Sala de aula do Bloco C - com ar condicionado'),
(10, 'Sala 302', 'Sala de aula do Bloco C - destinada a aulas de informática');


INSERT INTO Item (id, id_local, nome, descricao, data_encontrado, status, foto) VALUES
(1, 1, 'Mochila preta', 'Com chaveiro vermelho', '2025-09-20 10:30:00', 'encontrado', NULL),
(2, 3, 'Carteira marrom', 'Com documentos e dinheiro', '2025-09-21 14:15:00', 'entregue', NULL),
(3, 4, 'Celular Samsung', 'Capa azul', '2025-09-22 12:00:00', 'devolvido', NULL),
(4, 2, 'Chave de carro', 'Com chaveiro do Batman', '2025-09-25 09:20:00', 'encontrado', NULL),
(5, 1, 'Livro', 'Título: Introdução à Programação', '2025-09-27 13:45:00', 'encontrado', NULL),
(6, 3, 'Óculos de sol', 'Lente escura, armação dourada', '2025-09-28 10:10:00', 'entregue', NULL),
(7, 4, 'Garrafa térmica', 'Cor prata com adesivo da UNI', '2025-09-30 08:30:00', 'devolvido', NULL),
(8, 2, 'Pendrive', '16GB, marca Kingston', '2025-10-02 15:40:00', 'encontrado', NULL),
(9, 1, 'Calculadora', 'HP 12C, com riscos na tampa', '2025-10-03 11:00:00', 'encontrado', NULL),
(10, 3, 'Relógio digital', 'Pulseira preta', '2025-10-04 16:00:00', 'encontrado', NULL),
(11, 5, 'Caderno azul', 'Contém anotações de Cálculo I', '2025-10-05 09:20:00', 'encontrado', NULL),
(12, 6, 'Estojo escolar', 'Com canetas e lápis coloridos', '2025-10-06 10:15:00', 'encontrado', NULL),
(13, 7, 'Casaco cinza', 'Tamanho M, deixado na cadeira', '2025-10-07 11:45:00', 'entregue', NULL),
(14, 8, 'Livro de Física', 'Capa rasgada, autor Halliday', '2025-10-08 08:40:00', 'encontrado', NULL),
(15, 9, 'Carregador de notebook', 'Marca Dell', '2025-10-09 15:30:00', 'devolvido', NULL),
(16, 10, 'Fones de ouvido', 'Sem fio, marca JBL', '2025-10-10 17:00:00', 'encontrado', NULL);


INSERT INTO Reivindicacao (id, id_item, id_reivindicador, analisado_por, data_reivindicacao, justificativa, status, data_analise) VALUES
(1, 1, 2, 1, '2025-09-21 09:00:00', 'Perdi minha mochila na biblioteca', 'aprovada', '2025-09-21 10:00:00'),
(2, 2, 3, 2, '2025-09-22 15:00:00', 'Minha carteira sumiu na portaria', 'pendente', NULL),
(3, 5, 9, 3, '2025-09-28 14:00:00', 'Esqueci meu livro na biblioteca', 'aprovada', '2025-09-28 15:00:00'),
(4, 6, 22, 4, '2025-09-29 09:30:00', 'Deixei meus óculos na portaria', 'recusada', '2025-09-30 10:00:00'),
(5, 9, 27, 6, '2025-10-05 11:15:00', 'Perdi minha calculadora na biblioteca', 'pendente', NULL),
(6, 11, 18, 7, '2025-10-06 13:40:00', 'Deixei meu caderno na sala 101', 'aprovada', '2025-10-06 15:00:00'),
(7, 12, 19, 8, '2025-10-07 09:50:00', 'Perdi meu estojo durante a aula', 'pendente', NULL),
(8, 13, 20, 9, '2025-10-08 10:30:00', 'Esqueci meu casaco na sala 201', 'aprovada', '2025-10-08 11:00:00'),
(9, 15, 23, 10, '2025-10-09 17:00:00', 'Deixei meu carregador na sala 301', 'aprovada', '2025-10-09 18:30:00'),
(10, 16, 24, 11, '2025-10-10 18:00:00', 'Perdi meus fones na sala 302', 'pendente', NULL);


INSERT INTO Registro (id, id_item, id_encontrado_por, id_entregue_por, id_recebido_por, id_retirado_por, data_entrega, data_retirada) VALUES
(1, 1, 4, 4, 1, 2, '2025-09-20 11:00:00', '2025-09-21 10:30:00'),
(2, 2, 4, 4, 2, 3, '2025-09-21 14:30:00', NULL),
(3, 3, 6, 6, 1, 2, '2025-09-22 12:30:00', '2025-09-22 13:00:00'),
(4, 5, 8, 8, 4, 9, '2025-09-27 14:00:00', '2025-09-28 09:00:00'),
(5, 9, 15, 15, 1, 27, '2025-10-03 12:00:00', NULL),
(6, 11, 18, 18, 1, 18, '2025-10-06 09:30:00', '2025-10-06 15:30:00'),
(7, 12, 19, 19, 2, 19, '2025-10-07 10:00:00', NULL),
(8, 13, 20, 20, 3, 20, '2025-10-08 11:00:00', '2025-10-08 11:30:00'),
(9, 15, 23, 23, 1, 23, '2025-10-09 15:30:00', '2025-10-09 18:00:00'),
(10, 16, 24, 24, 4, 24, '2025-10-10 17:30:00', NULL);
