CREATE DATABASE DDL37_39;
USE DDL37_39;

CREATE TABLE Eventos (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR(120) NOT NULL,
    local_evento VARCHAR(120) NOT NULL,
    data_evento DATE NOT NULL,
    lotacao INT NOT NULL,
    status_evento VARCHAR(20)
);

CREATE TABLE Ingressos(
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
     evento_id INT,
     tipo VARCHAR(30) NOT NULL,
     preco DECIMAL(10,2) NOT NULL,
     lote INT NOT NULL,
     FOREIGN KEY (evento_id)  REFERENCES Eventos(id)
    );
    
CREATE TABLE Clientes (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR (100) NOT NULL,
    email VARCHAR(120)  NOT NULL UNIQUE,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    telefone  VARCHAR(20)  NOT NULL
);

CREATE TABLE Pag_Ingressos (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    ingresso_id INT,
    cliente_id INT,
    data_pagto DATE NOT NULL,
    valor DECIMAL(10 , 2 ) NOT NULL,
    status_pgto VARCHAR (20),
    FOREIGN KEY (ingresso_id)
        REFERENCES Ingressos (id),
    FOREIGN KEY (cliente_id)
        REFERENCES Clientes (id)
);