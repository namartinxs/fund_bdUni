CREATE DATABASE DDL16_18;
USE DDL16_18; 

CREATE TABLE Medicos (
 id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
 nome VARCHAR (120) NOT NULL,
 crm VARCHAR(20) NOT NULL UNIQUE,
 especialidade VARCHAR(80) NOT NULL,
 telefone VARCHAR(20) NOT NULL UNIQUE
); 
17) Criar tabela Pacientes com campos: id INT PK, nome VARCHAR(120), cpf CHAR(11)
UNIQUE, data_nascimento DATE, telefone VARCHAR(20). 

CREATE TABLE Medicos (
 id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
 nome VARCHAR (120) NOT NULL,
 crm VARCHAR(20) NOT NULL UNIQUE,
 especialidade VARCHAR(80) NOT NULL,
 telefone VARCHAR(20) NOT NULL UNIQUE
); 
18) Criar tabela Consultas com campos: id INT PK, medico_id INT, paciente_id INT, data_hora
TIMESTAMP, status VARCHAR(20)