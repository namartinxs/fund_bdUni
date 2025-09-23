CREATE DATABASE DDL45_50;
USE DDL45_50;

CREATE TABLE Estados (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    sigla CHAR(2) UNIQUE NOT NULL,
    nome VARCHAR(60) NOT NULL,
    regiao VARCHAR(20) NOT NULL,
    ibge_codigo VARCHAR(10) NOT NULL
);
    
CREATE TABLE Cidades (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR(100) NOT NULL,
    estado_id INT,
    ibge_codigo VARCHAR(10) NOT NULL,
    populacao INT NOT NULL,
    FOREIGN KEY (estado_id)
        REFERENCES Estados (id)
);

CREATE TABLE Paises (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR(100) NOT NULL,
    iso2 CHAR(2) UNIQUE NOT NULL,
    iso3 CHAR(3) UNIQUE NOT NULL,
    ddi VARCHAR(5) NOT NULL
);

CREATE TABLE Aeroportos (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR(120) NOT NULL,
    iata CHAR(3) UNIQUE NOT NULL,
    cidade VARCHAR(80) NOT NULL,
    pais_id INT,
    FOREIGN KEY (pais_id)
        REFERENCES Paises (id)
);


CREATE TABLE Voos (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    origem_id INT,
    destino_id INT,
    cia VARCHAR(60) NOT NULL,
    partida TIMESTAMP,
    FOREIGN KEY (origem_id) REFERENCES Aeroportos(id),
    FOREIGN KEY (destino_id) REFERENCES Aeroportos(id)
);

CREATE TABLE Passageiros (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    id_voo INT,
    nome VARCHAR(120) NOT NULL,
    documento VARCHAR(20) NOT NULL,
    nascimento DATE NOT NULL,
    nacionalidade VARCHAR(60) NOT NULL,
    FOREIGN KEY(id_voo) REFERENCES Voos(id)
    
);
