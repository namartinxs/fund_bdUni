USE DDL45_50;

INSERT INTO Estados (sigla, nome, regiao, ibge_codigo)
VALUES
('SP','São Paulo','Sudeste','35'),
('RJ','Rio de Janeiro','Sudeste','33');

UPDATE Estados 
SET regiao = 'Sul'
WHERE sigla = 'RJ';

INSERT INTO Cidades (nome, estado_id, ibge_codigo, populacao)
 VALUES
('RIO',2,'3550308',12300000),
('Rio de Janeiro',2,'3304557',6748000),
('Janeiro de Rio',2,'3509502',1210000);

UPDATE Cidades 
SET populacao = 600
WHERE nome = 'Janeiro de Rio';

DELETE FROM Estados
WHERE id NOT IN (SELECT DISTINCT estado_id FROM Cidades);


INSERT INTO Paises (nome, iso2, iso3, ddi) VALUES
('Brasil','BR','BRA','55'),
('Argentina','AR','ARG','54');

UPDATE Paises
SET iso3 = 'BRL'
WHERE nome = 'Brasil';

INSERT INTO Aeroportos (nome, iata, cidade, pais_id) VALUES
('Aeroporto de Guarulhos','GRU','São Paulo',1),
('Aeroporto Santos Dumont','SDU','Rio de Janeiro',1),
('Aeroporto SALGADO FILO','EZE','POA',1);


INSERT INTO Voos (origem_id, destino_id, cia, partida) VALUES
(1,2,'LATAM','2025-10-01 10:00:00'),
(2,3,'GOL','2025-10-02 15:30:00'),
(3,1,'AZUL','2025-10-03 08:45:00');

INSERT INTO Passageiros (id_voo,nome, documento, nascimento, nacionalidade) VALUES
(1,'João Silva','12345678900','1990-05-10','Brasileiro'),
(2,'Maria Souza','98765432100','1985-11-20','Brasileira'),
(3,'Pedro Gomes','11223344556','1992-07-15','Brasileiro');

DELETE FROM Paises
WHERE id NOT IN (SELECT DISTINCT pais_id FROM Aeroportos);

DELETE FROM Cidades
WHERE id NOT IN (SELECT DISTINCT origem_id FROM Voos)
  AND id NOT IN (SELECT DISTINCT destino_id FROM Voos);
  

UPDATE Aeroportos
SET cidade = 'São Paulo/SP'
WHERE iata = 'GRU';


DELETE FROM Aeroportos
WHERE id NOT IN (SELECT DISTINCT origem_id FROM Voos)
   AND id NOT IN (SELECT DISTINCT destino_id FROM Voos);
   
UPDATE Voos
SET partida = '2025-10-01 12:00:00'
WHERE id = 1;

UPDATE Voos
SET partida = '2025-10-01 12:00:00'
WHERE id = 1;

UPDATE Passageiros
SET nacionalidade = 'Argentina'
WHERE nome = 'Pedro Gomes';

DELETE FROM Passageiros
WHERE id_voo IS NULL;