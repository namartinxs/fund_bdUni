CREATE DATABASE DDL1_4;
USE DDL1_4;

CREATE TABLE Clientes (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR (100) NOT NULL,
    email VARCHAR(120)  NOT NULL UNIQUE,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    telefone  VARCHAR(20)  NOT NULL
); 


CREATE TABLE Produtos(
 id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
 nome VARCHAR(120) NOT NULL,
 preco DECIMAL(10,2) NOT NULL,
 categoria VARCHAR(60) NOT NULL,
 estoque INT NOT NULL
); 
  
CREATE TABLE Pedidos ( 
	id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    id_clientes INT,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(12,2) NOT NULL,
	status_pedido VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_clientes) REFERENCES Clientes(id)
);


CREATE TABLE Funcionarios (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    cargo VARCHAR(60) NOT NULL,
    salario DECIMAL(10 , 2 ) NOT NULL
);  

INSERT INTO Clientes (nome, email, telefone)
VALUES 
('Maria Silva', 'maria.silva@email.com', '11987654321'),
('João Santos', 'joao.santos@email.com', '11999887766'),
('Ana Costa', 'ana.costa@email.com', '21988776655'),
('Carlos Lima', 'carlos.lima@email.com', '31977665544');

INSERT INTO Produtos (nome, preco, categoria, estoque)
VALUES
('Notebook Dell Inspiron', 3500.00, 'Informática', 10),
('Mouse Gamer Redragon', 150.00, 'Acessórios', 50),
('Cadeira Ergonômica', 1200.00, 'Móveis', 8),
('Smartphone Samsung S23', 4500.00, 'Celulares', 15),
('Fone Bluetooth JBL', 400.00, 'Áudio', 30);

INSERT INTO Funcionarios (nome, cpf, cargo, salario)
VALUES
('Fernanda Souza', '12345678901', 'Atendente', 2500.00),
('Rafael Oliveira', '98765432100', 'Vendedor', 2800.00),
('Bruna Carvalho', '11122233344', 'Gerente', 5500.00); 

INSERT INTO Pedidos (id_clientes, valor_total, status_pedido)
VALUES
(1, 3650.00, 'Finalizado'),   -- Maria
(2, 4500.00, 'Em andamento'), -- João
(3, 1200.00, 'Cancelado'),    -- Ana
(4, 150.00, 'Finalizado');    -- Carlos