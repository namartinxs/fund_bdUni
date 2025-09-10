CREATE DATABASE espaco;
USE espaco ;

CREATE TABLE cliente (
	cd_cli INT PRIMARY KEY AUTO_INCREMENT,
    cd_city INT ,
    nome VARCHAR(100),
    FOREIGN KEY (cd_city) REFERENCES cidade (cd_city)
);

CREATE TABLE cidade(
	cd_city INT NOT NULL,
    descricao VARCHAR(255),
    estado char(2),
    PRIMARY KEY (cd_city)
    ); 
    
SELECT * FROM espaco ;

DESC cidade