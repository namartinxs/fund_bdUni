CREATE DATABASE DDL31_33;
USE DDL31_33;

CREATE TABLE Seguradoras (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR(150) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    cidade VARCHAR (120) NOT NULL
);

CREATE TABLE Segurados (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    telefone VARCHAR(20) NOT NULL
);

CREATE TABLE Apolices (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    segurado_id INT,
    seguradora_id INT,
    premio DECIMAL(12 , 2 ) NOT NULL,
    validade DATE NOT NULL,
    FOREIGN KEY (segurado_id)
        REFERENCES Segurados (id),
    FOREIGN KEY (seguradora_id)
        REFERENCES Seguradoras (id)
);


CREATE TABLE Sinistros (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    apolice_id INT NOT NULL,
    data_ocorrencia DATE NOT NULL,
    descricao TEXT NOT NULL,
    valor DECIMAL(12 , 2 ) NOT NULL,
    status_sinistro VARCHAR(20),
    FOREIGN KEY (apolice_id)
        REFERENCES Apolices (id)
);


