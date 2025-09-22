CREATE DATABASE DDL13_15;
USE DDL13_15;

CREATE TABLE Fornecedores (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    razao_social VARCHAR(150) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL
);

CREATE TABLE Clientes_Regras (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Pedidos ( 
	id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    id_clientes INT,
    id_fornecedor INT,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(12,2) NOT NULL,
	status_pedido VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_clientes) REFERENCES Clientes_Regras(id),
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id)
);
CREATE TABLE Vendas (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    pedido_id INT,
    data_venda DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor DECIMAL(12 , 2 ),
    metodo_pagamento VARCHAR(30),
     FOREIGN KEY (pedido_id) REFERENCES Pedidos(id)
);


