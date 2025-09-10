CREATE database aula;
USE aula;
CREATE TABLE Agendavel (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(12) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    fone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL
); 
    
                 
ALTER TABLE Agendavel
		ADD endereco varchar (255); 
        
CREATE TABLE Pessoa (
	matricula INT PRIMARY KEY,
    nome VARCHAR (35) NOT NULL DEFAULT 'Maria',
    cpf VARCHAR (11) UNIQUE
    );
    
DESC Pessoa; 
DESC Agendavel;
INSERT INTO  Agendavel (nome, sobrenome, fone, email, endereco) 
VALUES ('nath','martins','519999999', 'nath@gmail.com', 'rua sensei,333'); 
SELECT * FROM Agendavel
