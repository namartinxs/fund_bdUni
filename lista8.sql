
CREATE DATABASE  L8;
USE L8;

CREATE TABLE Peca (
  id_peca INT PRIMARY KEY AUTO_INCREMENT,
  codigo VARCHAR(10),
  nome VARCHAR(120) NOT NULL,
  cor VARCHAR(120) NOT NULL,
  peso VARCHAR(100) NOT NULL,
  cidade VARCHAR(100) NOT NULL
);

CREATE TABLE Fornecedores (
  id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
  codigo VARCHAR(10),
  nome VARCHAR(100) NOT NULL,
  status_fornecedor INT NOT NULL,
  cidade VARCHAR(100) NOT NULL
);

CREATE TABLE Embalagens (
  Cod_Peca INT NOT NULL,
  Cod_Fornecedor INT NOT NULL,
  qtd_embalagem INT NOT NULL,
  CONSTRAINT FK_Cod_Peca FOREIGN KEY (Cod_Peca) REFERENCES Peca(id_peca),
  CONSTRAINT FK_Cod_Fornec FOREIGN KEY (Cod_Fornecedor) REFERENCES Fornecedores(id_fornecedor)
);

-- DDL
INSERT INTO Peca (nome, cor, peso, cidade)
VALUES
('Eixo', 'Cinza', 10, 'Recife'),
('Rolamento', 'Preto', 16, 'Campinas'),
('Mancal', 'Verde', 30, 'Maceió');

INSERT INTO Fornecedores (nome, status_fornecedor, cidade)
VALUES
('Silva', 5, 'São Paulo'),
('Souza', 10, 'Rio de Janeiro'),
('Alves', 5, 'São Paulo'),
('Tavares', 8, 'Rio de Janeiro');

INSERT INTO Embalagens (Cod_Peca, Cod_Fornecedor, qtd_embalagem)
VALUES
(1,1,300),
(1,2,400),
(1,3,200),
(2,1,300),
(2,4,350);

SET SQL_SAFE_UPDATES = 0;
UPDATE Peca
SET codigo = CONCAT('P', id_peca);

UPDATE Fornecedores
SET codigo = CONCAT('F', id_fornecedor);


-- 1. Mostre as peças com o código P1
SELECT * FROM Peca WHERE codigo = 'P1';
-- 2. Mostre os dados de todos os fornecedores que tenham status
-- maior que 5 e que sejam do Rio de Janeiro
SELECT * FROM Fornecedores WHERE status_fornecedor > 5 AND cidade = 'Rio de Janeiro';
-- 3. Apresente o códigos e os nomes de todas as peças
SELECT nome, codigo FROM Peca;
-- 4. Mostre as cidades dos fornecedores 
-- DISTINCT mostra sem repetir
SELECT DISTINCT cidade FROM Fornecedores;
-- 5. Mostre o código de fornecedor e quantidade embarcada para
-- cada embarque da peça de código P1
SELECT f.codigo AS codigo_fornecedor, e.qtd_embalagem
FROM Embalagens e 
JOIN Fornecedores f ON e.cod_fornecedor = f.id_fornecedor
JOIN Peca p ON e.Cod_Peca = p.id_peca
WHERE p.codigo = 'P1';
-- 6. Obtenha os códigos de todos os fornecedores que tem
-- embarques e que tem status maior que 5 
SELECT DISTINCT f.codigo AS cod_fornecedor
FROM Fornecedores f 
JOIN Embalagens e ON f.id_fornecedor = e.Cod_Fornecedor
WHERE status_fornecedor > 5 ;
-- 7. Obtenha os nomes de todas as peças para as quais há
-- embarques

SELECT DISTINCT p.nome AS nome_peca
FROM Peca p
JOIN Embalagens e ON p.id_peca = e.Cod_Peca;
