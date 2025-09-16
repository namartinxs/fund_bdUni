CREATE DATABASE Hospital;
USE Hospital;
CREATE TABLE convenio(
	id SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50)
); 

CREATE TABLE medicos (
    id SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50)
);

CREATE TABLE paciente(
	id SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    dt_nascimento DATE,
    nome VARCHAR(50),
    diversor VARCHAR (50),
    id_convenio SMALLINT UNSIGNED,
    FOREIGN KEY(id_convenio) REFERENCES convenio(id)
);

CREATE TABLE consulta(
 id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
 data_consulta DATE,
 diagnostico VARCHAR(100),
 id_paciente SMALLINT UNSIGNED,
 id_medico SMALLINT UNSIGNED, 
 FOREIGN KEY (id_paciente) REFERENCES paciente(id),
 FOREIGN KEY (id_medico) REFERENCES medicos(id)
); 

CREATE TABLE exame ( 
 id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
 id_consulta TINYINT UNSIGNED,
 data_exame DATE,
 resultado VARCHAR(100),
 FOREIGN KEY (id_consulta) REFERENCES consulta(id)
 ); 
 
 ALTER TABLE medicos
 ADD COLUMN endereco VARCHAR(100);

ALTER TABLE exame
ADD COLUMN nome VARCHAR(100);

 ALTER TABLE medicos
 MODIFY COLUMN nome VARCHAR(100);
 
 ALTER TABLE paciente
 DROP COLUMN diversor; 
 
 DROP TABLE convenio;