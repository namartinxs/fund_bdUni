-- Script02 convertido para MySQL 8
-- Observação: execute este script após o Script 1 (criação das tabelas).

USE Exemple; -- ou o nome do DB criado no Script 1
-- Não há GO no MySQL

/***********************
 P_GeraDadosFuncionario
 Vamos inserir vários funcionários. Usamos STR_TO_DATE para interpretar dd/mm/yy.
************************/
DROP PROCEDURE IF EXISTS P_GeraDadosFuncionario;
DELIMITER $$
CREATE PROCEDURE P_GeraDadosFuncionario()
BEGIN
  INSERT INTO Funcionario (Nome_Func, Data_CadFunc, Sexo_Func, Sal_Func, End_Func)
  VALUES
    ('Antonio Antonino Antones', STR_TO_DATE('01/02/00','%d/%m/%y'), 'M', 1500.00, 'Rua A'),
    ('Amaro Merico Vespucio', STR_TO_DATE('02/02/00','%d/%m/%y'), 'M', 2500.00, 'Rua B'),
    ('Abílio Abel Garcia', STR_TO_DATE('03/02/01','%d/%m/%y'), 'M', 1000.00, 'Rua C'),
    ('Bia Bianca Bones', STR_TO_DATE('04/03/01','%d/%m/%y'), 'F', 5000.25, 'Rua D'),
    ('Beatriz Bertioga', STR_TO_DATE('05/05/01','%d/%m/%y'), 'F', 300.00, 'Rua E'),
    ('Caio Cesar Cearez', STR_TO_DATE('06/05/01','%d/%m/%y'), 'M', 250.00, 'Rua F'),
    ('Celso Cesare', STR_TO_DATE('07/06/01','%d/%m/%y'), 'M', 1542.36, 'Rua J'),
    ('Danilo Douglas', STR_TO_DATE('08/06/01','%d/%m/%y'), 'M', 1524.56, 'Rua K'),
    ('Denis Denilo', STR_TO_DATE('09/07/01','%d/%m/%y'), 'M', 5235.56, 'Rua L'),
    ('Everton Evaristo', STR_TO_DATE('10/07/01','%d/%m/%y'), 'M', 2542.25, 'Rua M'),
    ('Evanir Eva', STR_TO_DATE('11/08/01','%d/%m/%y'), 'M', 4523.54, 'Rua N'),
    ('Fabio Fabricio', STR_TO_DATE('12/08/01','%d/%m/%y'), 'M', 1524.25, 'Rua O'),
    ('Fabiola Fabiolo', STR_TO_DATE('02/01/02','%d/%m/%y'), 'F', 2554.25, 'Rua P'),
    ('Geraldo Gomes', STR_TO_DATE('03/10/02','%d/%m/%y'), 'M', 1542.25, 'Rua Q'),
    ('Helio Heliópolis', STR_TO_DATE('04/01/02','%d/%m/%y'), 'M', 1542.23, 'Rua R'),
    ('Irineu Irene', STR_TO_DATE('05/02/02','%d/%m/%y'), 'M', 2523.00, 'Rua S'),
    ('Jonas jackes', STR_TO_DATE('05/02/02','%d/%m/%y'), 'M', 2500.00, 'Rua T'),
    ('Leandro Lago', STR_TO_DATE('06/02/02','%d/%m/%y'), 'M', 1500.00, 'Rua U'),
    ('Lucio Lacio', STR_TO_DATE('07/03/02','%d/%m/%y'), 'M', 2500.00, 'Rua V'),
    ('Lecio Licio', STR_TO_DATE('08/04/02','%d/%m/%y'), 'M', 1420.00, 'Rua X'),
    ('Mario Mendes', STR_TO_DATE('06/02/02','%d/%m/%y'), 'M', 1262.00, 'Rua W'),
    ('Olavo Odavlas', STR_TO_DATE('07/07/02','%d/%m/%y'), 'M', 1540.00, 'Rua Y');
END$$
DELIMITER ;

/*******************************
 P_GeraDadosBonus(@Val_Bonus)
 Implementação set-based: insere um bônus para cada funcionário.
********************************/
DROP PROCEDURE IF EXISTS P_GeraDadosBonus;
DELIMITER $$
CREATE PROCEDURE P_GeraDadosBonus(IN p_Val_Bonus DECIMAL(10,2))
BEGIN
  INSERT INTO Bonus (Cod_Func, Data_Bonus, Val_Bonus)
  SELECT Cod_Func, DATE_SUB(NOW(), INTERVAL 30 DAY), p_Val_Bonus
  FROM Funcionario;
END$$
DELIMITER ;

/********************************
 P_GeraDadosPontuacao(@Val_Pontos,@Cod_Func1,@Cod_Func2)
 Set-based: pontua funcionários dentro do intervalo de códigos.
*********************************/
DROP PROCEDURE IF EXISTS P_GeraDadosPontuacao;
DELIMITER $$
CREATE PROCEDURE P_GeraDadosPontuacao(
  IN p_Val_Pontos DECIMAL(10,2),
  IN p_Cod_Func1 INT,
  IN p_Cod_Func2 INT
)
BEGIN
  INSERT INTO Pontuacao (Cod_Func, Data_Pto, Pto_Func)
  SELECT Cod_Func, DATE_SUB(NOW(), INTERVAL 30 DAY), p_Val_Pontos
  FROM Funcionario
  WHERE Cod_Func BETWEEN p_Cod_Func1 AND p_Cod_Func2;
END$$
DELIMITER ;

/********************************
 P_GeraDadosHistorico
*********************************/
DROP PROCEDURE IF EXISTS P_GeraDadosHistorico;
DELIMITER $$
CREATE PROCEDURE P_GeraDadosHistorico()
BEGIN
  INSERT INTO Historico (Cod_Func, Data_Hist, Sal_Ant, Sal_Atual)
  SELECT Cod_Func, DATE_SUB(NOW(), INTERVAL 30 DAY), ROUND(Sal_Func/2,2), Sal_Func
  FROM Funcionario;
END$$
DELIMITER ;

/********************************
 P_GeraDadosPedido
 Refatorado para MySQL: insere pedidos em loops aninhados semelhantes ao original.
 Não desabilitamos constraints; assumimos que Cliente, Funcionario e StatusPedido já têm dados válidos.
*********************************/
DROP PROCEDURE IF EXISTS P_GeraDadosPedido;
DELIMITER $$

CREATE PROCEDURE P_GeraDadosPedido()
proc_end: BEGIN
  DECLARE v_Cod_Func INT DEFAULT 1;
  DECLARE v_Cod_Cli INT DEFAULT 1;
  DECLARE v_Cod_Sta INT DEFAULT 1;
  DECLARE v_Cod_FuncLim INT;
  DECLARE v_Cod_CliLim INT;
  DECLARE v_Cod_StaLim INT;

  SELECT COALESCE(MAX(Cod_Func),0) INTO v_Cod_FuncLim FROM Funcionario;
  SELECT COALESCE(MAX(Cod_Cli),0) INTO v_Cod_CliLim FROM Cliente;
  SELECT COALESCE(MAX(Cod_Sta),0) INTO v_Cod_StaLim FROM StatusPedido;

  IF v_Cod_FuncLim = 0 OR v_Cod_CliLim = 0 OR v_Cod_StaLim = 0 THEN
    LEAVE proc_end;
  END IF;

  label_outer: WHILE v_Cod_Func <= v_Cod_FuncLim DO
    SET v_Cod_Cli = 1;

    WHILE v_Cod_Cli <= v_Cod_CliLim DO
      SET v_Cod_Sta = 1;

      WHILE v_Cod_Sta <= v_Cod_StaLim DO
        INSERT INTO Pedido (Cod_Cli, Cod_Func, Cod_Sta, Data_Ped, Val_Ped)
        VALUES (
          v_Cod_Cli,
          v_Cod_Func,
          v_Cod_Sta,
          DATE_SUB(NOW(), INTERVAL (v_Cod_Sta * 3) DAY),
          100 * v_Cod_Cli
        );

        SET v_Cod_Sta = v_Cod_Sta + 1;
      END WHILE;

      SET v_Cod_Cli = v_Cod_Cli + 1;
    END WHILE;

    SET v_Cod_Func = v_Cod_Func + 1;
  END WHILE label_outer;

END proc_end$$

DELIMITER ;

/********************************
 P_Parcelas(@Val_Lim1,@Val_Lim2,@NumPar)
 Refatorado: para cada pedido com Val_Ped entre limites, cria NumPar parcelas.
 Data de vencimento = Data_Ped + i DAYS (simples e previsível).
*********************************/
DROP PROCEDURE IF EXISTS P_Parcelas;

DELIMITER $$

CREATE PROCEDURE P_Parcelas(
  IN p_Val_Lim1 DECIMAL(10,2),
  IN p_Val_Lim2 DECIMAL(10,2),
  IN p_NumPar INT
)
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE v_Num_Ped INT;
  DECLARE v_Data_Ped DATETIME;
  DECLARE v_Val_Ped DECIMAL(10,2);

  DECLARE i INT DEFAULT 1;
  DECLARE v_Val_Par DECIMAL(10,2);

  DECLARE cur CURSOR FOR
    SELECT Num_Ped, Data_Ped, Val_Ped FROM Pedido
    WHERE Val_Ped BETWEEN p_Val_Lim1 AND p_Val_Lim2;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  OPEN cur;

  read_loop: LOOP
    FETCH cur INTO v_Num_Ped, v_Data_Ped, v_Val_Ped;
    IF done = 1 THEN
      LEAVE read_loop;
    END IF;

    -- calcular valor da parcela (divisão simples)
    IF p_NumPar > 0 THEN
      SET v_Val_Par = ROUND(v_Val_Ped / p_NumPar, 2);
      SET i = 1;

      parcel_loop: WHILE i <= p_NumPar DO
        INSERT INTO Parcela (Num_Par, Num_Ped, Data_Venc, Val_Venc, Data_Pgto)
        VALUES (
          i,
          v_Num_Ped,
          DATE_ADD(v_Data_Ped, INTERVAL i DAY),
          v_Val_Par,
          NULL
        );
        SET i = i + 1;
      END WHILE parcel_loop;

    END IF;

  END LOOP read_loop;

  CLOSE cur;
END$$

DELIMITER ;


/********************************
 P_GeraDadosItens(@Cod1,@Cod2,@Qtd)
 Insere linhas em Itens para pedidos entre códigos.
*********************************/
DROP PROCEDURE IF EXISTS P_GeraDadosItens;
DELIMITER $$
CREATE PROCEDURE P_GeraDadosItens(
  IN p_Cod1 INT,
  IN p_Cod2 INT,
  IN p_Qtd INT
)
BEGIN
  INSERT INTO Itens (Num_Ped, Cod_Prod, Qtd_Vend, Val_Vend)
  SELECT p.Num_Ped, pr.Cod_Prod, p_Qtd, pr.Val_UnitProd
  FROM Pedido p
  CROSS JOIN Produto pr
  WHERE p.Num_Ped BETWEEN p_Cod1 AND p_Cod2;
END$$
DELIMITER ;

/*******************************************************************
 Agora os INSERTs "fixos" (dados estáticos do script original).
 Observação: onde havia GETDATE()-N, usamos DATE_SUB(NOW(), INTERVAL N DAY).
 Datas em formato dd/mm/aaaa ou dd/mm/yy são convertidas com STR_TO_DATE.
********************************************************************/

-- TipoEnd
INSERT INTO TipoEnd (Nome_TipoEnd) VALUES
('Entrega'),('Faturamento'),('Correspondência'),('Cobrança'),
('Residential'),('Comercial');

-- Estado (algumas strings com acento mantidas)
INSERT INTO Estado (Sigla_Est, Nome_Est) VALUES
('AC','Acre'),('AL','Alagoas'),('AM','Amazonas'),('AP','Amapa'),
('BA','Bahia'),('CE','Ceará'),('DF','Destrito Federal'),('ES','Espirito Santo'),
('GO','Goias'),('MA','Maranhão'),('MG','Minas Gerais'),('MS','Mato Grosso do Sul'),
('MT','Mato Grosso do Norte'),('PB','Paraíba'),('PE','Pernambuco'),('PI','Piauí'),
('PR','Paraná'),('RJ','Rio de Janeiro'),('RN','Rio Grande do Norte'),
('RO','Rondônia'),('RR','Roraima'),('RS','Rio Grande do Sul'),
('SC','Santa Catarina'),('SE','Sergipe'),('SP','São Paulo'),('TO','Tocantins');

-- Cidade (exemplos)
INSERT INTO Cidade (Sigla_Est, Nome_Cid) VALUES
('SP','Araraquara'),('SP','Americana'),('SP','Araçatuba'),
('SP','Fernandópolis'),('SP','Jundiaí'),('SP','Sorocaba'),
('SP','São José do Rio Preto');

-- TipoCli
INSERT INTO TipoCli (Nome_TipoCli) VALUES
('Diamante'),('Ouro'),('Prata'),('Bronze'),('Cobre'),('Zinco');

-- Cliente: usamos STR_TO_DATE para interpretar dd/mm/yyyy ou dd/mm/yy.
-- Observe: alguns valores originais tinham months > 12 ou formato estranho; presumi dd/mm/yyyy ou dd/mm/yy.
INSERT INTO Cliente (Cod_TipoCli, Nome_Cli, Data_CadCli, Renda_Cli, Sexo_Cli) VALUES
(1,'João Carlos', STR_TO_DATE('01/01/1999','%d/%m/%Y'),10000,'M'),
(1,'Daniel Souza', STR_TO_DATE('02/02/1999','%d/%m/%Y'),10000,'M'),
(1,'Helena Oliveira', STR_TO_DATE('03/03/1999','%d/%m/%Y'),9000,'F'),
(1,'Roberta Oliveira', STR_TO_DATE('04/04/1999','%d/%m/%Y'),8000,'F'),
(2,'Renata Leão', STR_TO_DATE('05/05/1999','%d/%m/%Y'),5000,'F'),
(2,'Jairo Gato', STR_TO_DATE('06/06/1999','%d/%m/%Y'),4000,'M'),
(3,'Fernando Gato', STR_TO_DATE('07/07/1999','%d/%m/%Y'),3000,'M'),
(3,'Giovanna Silva Leão', STR_TO_DATE('08/08/1999','%d/%m/%Y'),3000,'F'),
(4,'Lucas Ribeiro', STR_TO_DATE('09/09/1999','%d/%m/%Y'),2000,'M'),
(3,'Helder Leão', STR_TO_DATE('10/10/1999','%d/%m/%Y'),2000,'M'),
(2,'Olga Cristina Bonfiglioli', STR_TO_DATE('11/11/1999','%d/%m/%Y'),8000,'F'),
(1,'Maria Cristina Bonfiglioli Martins de Souza Santos', STR_TO_DATE('12/12/1999','%d/%m/%Y'),5000,'F'),
(1,'Salvador Eneas Feredico', STR_TO_DATE('13/01/1999','%d/%m/%Y'),9000,'M'),
(1,'Dolores Gerreiro Martins', STR_TO_DATE('14/02/2000','%d/%m/%Y'),8000,'F'),
(1,'Fabiana Bataglin', STR_TO_DATE('15/03/2000','%d/%m/%Y'),5000,'F'),
(2,'Aparecida Ribeiro', STR_TO_DATE('16/04/2000','%d/%m/%Y'),3000,'F'),
(3,'Reginaldo Ribeiro', STR_TO_DATE('17/05/2000','%d/%m/%Y'),4000,'M'),
(4,'Suellen M Nunes', STR_TO_DATE('18/06/2000','%d/%m/%Y'),3000,'F'),
(1,'Carlos Alberto', STR_TO_DATE('19/07/2000','%d/%m/%Y'),2000,'M'),
(2,'Roberto Arruda', STR_TO_DATE('20/08/2000','%d/%m/%Y'),1000,'M'),
(3,'Sandra Medeiros', STR_TO_DATE('21/09/2000','%d/%m/%Y'),1500,'F'),
(4,'Alice Santos', STR_TO_DATE('22/10/2001','%d/%m/%Y'),2500,'F'),
(5,'Valter Sanches', STR_TO_DATE('23/11/2001','%d/%m/%Y'),3500,'M'),
(6,'Pascoal Babiera', STR_TO_DATE('24/12/2001','%d/%m/%Y'),1525,'M'),
(1,'Lucia Bacalla', STR_TO_DATE('25/01/2001','%d/%m/%Y'),6321,'F'),
(3,'Maria Belido', STR_TO_DATE('26/02/2001','%d/%m/%Y'),5412,'F'),
(4,'Hamilton Belico', STR_TO_DATE('26/03/2001','%d/%m/%Y'),2563,'M'),
(5,'Alberto Belli', STR_TO_DATE('27/04/2001','%d/%m/%Y'),2412,'M'),
(6,'Marcia Bueno', STR_TO_DATE('28/05/2001','%d/%m/%Y'),1235,'F'),
(1,'Maria Catta', STR_TO_DATE('29/06/2001','%d/%m/%Y'),1236,'F'),
(2,'Carlos Cattaneo', STR_TO_DATE('30/07/2001','%d/%m/%Y'),1253,'M'),
(3,'Andre Caula', STR_TO_DATE('31/08/2001','%d/%m/%Y'),1524,'M'),
(4,'Fabia Dávello', STR_TO_DATE('01/09/2001','%d/%m/%Y'),1236,'F'),
(5,'Afonso Ferraro', STR_TO_DATE('02/10/2001','%d/%m/%Y'),1256,'M'),
(6,'Akemi Fukamizu', STR_TO_DATE('03/11/2001','%d/%m/%Y'),1452,'F'),
(1,'Bernadino Gomes', STR_TO_DATE('04/12/2001','%d/%m/%Y'),11785,'M'),
(2,'Regiani Hoki', STR_TO_DATE('05/01/2001','%d/%m/%Y'),1524,'F'),
(3,'Valter Koszura', STR_TO_DATE('06/02/2001','%d/%m/%Y'),1256,'M'),
(4,'Alexandre Kozeki', STR_TO_DATE('07/03/2001','%d/%m/%Y'),1225,'M'),
(5,'Vittorio Lannocca', STR_TO_DATE('08/04/2001','%d/%m/%Y'),1253,'M'),
(6,'Domingos Lanini', STR_TO_DATE('09/05/2002','%d/%m/%Y'),1253,'M'),
(1,'Paulo Mello', STR_TO_DATE('10/06/2001','%d/%m/%Y'),10000,'M'),
(2,'Zilda Mellone', STR_TO_DATE('11/07/2001','%d/%m/%Y'),8000,'F'),
(3,'Marlene Moura', STR_TO_DATE('12/08/2001','%d/%m/%Y'),3000,'F'),
(4,'Francisca Oliveira', STR_TO_DATE('13/09/2001','%d/%m/%Y'),2300,'F'),
(5,'Marlene Pereira', STR_TO_DATE('14/10/2001','%d/%m/%Y'),2562,'F'),
(6,'Milton Pereira', STR_TO_DATE('15/11/2001','%d/%m/%Y'),2563,'M'),
(1,'Ligia Ramos', STR_TO_DATE('16/12/2001','%d/%m/%Y'),9200,'F'),
(2,'Mariangela Ramos', STR_TO_DATE('17/01/2001','%d/%m/%Y'),7000,'F'),
(3,'Dora Romariz', STR_TO_DATE('18/02/2001','%d/%m/%Y'),5263,'F'),
(4,'Paulino Romelli', STR_TO_DATE('19/03/2001','%d/%m/%Y'),5428,'M'),
(5,'Fernando Sampaio', STR_TO_DATE('20/04/2001','%d/%m/%Y'),2023,'M'),
(6,'José Sampaio', STR_TO_DATE('21/05/2001','%d/%m/%Y'),2235,'M'),
(1,'Vicenzo Senatori', STR_TO_DATE('22/06/2001','%d/%m/%Y'),7000,'M'),
(2,'Geraldo Senedeze', STR_TO_DATE('23/07/2001','%d/%m/%Y'),2531,'M'),
(3,'Mauro Soares', STR_TO_DATE('24/08/2001','%d/%m/%Y'),2532,'M'),
(4,'Paulo Souza', STR_TO_DATE('25/09/2001','%d/%m/%Y'),2542,'M'),
(5,'Emidio Trifoni', STR_TO_DATE('26/10/2001','%d/%m/%Y'),2563,'M'),
(6,'Heitor Vernile', STR_TO_DATE('27/11/2001','%d/%m/%Y'),2542,'M'),
(1,'Carlos Saura', STR_TO_DATE('28/12/2001','%d/%m/%Y'),6000,'M'),
(2,'Angelino Saullo', STR_TO_DATE('29/01/2001','%d/%m/%Y'),5000,'M'),
(3,'Aldo Savazzoni', STR_TO_DATE('28/02/2001','%d/%m/%Y'),4000,'M');

-- Conjuge
INSERT INTO Conjuge (Cod_Cli, Nome_Conj, Renda_Conj, Sexo_Conj) VALUES
(1,'Renata',3000.00,'F'),
(2,'Helena',5000.00,'F'),
(3,'Daniel',6000.00,'M'),
(4,'Tarcisio',1000.00,'M'),
(5,'João Carlos',7000.00,'M'),
(6,'Carla',9000.00,'M'),
(7,'Ana Lucia',3000.00,'F');

-- Endereco (alguns inserts adaptados: a ordem de colunas do script 1 era Cod_TipoEnd, Cod_Cid, Cod_Cli, Nome_Rua, Nome_Bairro, Compl_End)
INSERT INTO Endereco (Cod_TipoEnd, Cod_Cid, Cod_Cli, Nome_Rua, Nome_Bairro, Compl_End) VALUES
(1,1,1,'Rua Soraia - 29','Vila Santana',NULL),
(2,1,1,'Rua Macunaima - 192','Jd.Europa',NULL),
(1,2,1,'Rua Mariá - 342','Jd. Araguaia','Apto. 23'),
(2,2,2,'Rua Juca - 542','Vila Catarina','Apto. 2'),
(2,3,2,'Pça Marcondes - 542','Vila Tereza',NULL),
(3,1,4,'Rua Santa Catarina - 1342','Vila Osvaldo Cruz',NULL),
(1,1,1,'Av. Imirim, 325','Vila Vilma',NULL),
(1,1,2,'Rua Clélia, 456','Vila Zoraide',NULL),
(1,1,3,'Rua Pio XI, 938','Jd. América',NULL),
(2,1,4,'Travessa 15, 1200','Vila Sonia',NULL),
(2,2,5,'Av. Sodré, 392','Jd. Carnaúba',NULL),
(2,3,6,'Av Mutinga, 200','Parque das Flores',NULL),
(3,2,7,'Rua Cons. Ribas 594','Parque Municipal',NULL),
(3,2,8,'Rua Maria Belido','Parque Industrial',NULL),
(3,2,9,'Rua Avai 164','Vila Maria',NULL),
(4,2,10,'Rua Bororós, 67','Vila Santa Terezinha',NULL),
(4,2,11,'Rua Jose Pereira, 340','Zona da Mata',NULL),
(4,3,12,'Av. Casa Verde, 450','Jd. Botucatu',NULL),
(4,4,13,'Av Dr Gouveia, 392','Jd. Moricatupotá',NULL),
(5,3,14,'Rua Lucena 184','Jd. Canhem BaBa',NULL),
(5,3,15,'Av. Indianópolis 593','Vila Angela',NULL),
(5,3,16,'Rua Alexandre Duma 486','Parque Piributa',NULL),
(6,3,17,'Rua Maria Júlia 1207','Jd. Americanópolis',NULL),
(6,3,18,'Rua Afonso Meira, 948','Parque Cruzeiro do Sul',NULL),
(6,3,19,'Rua Bela Cintra 392','Vila Saturno',NULL),
(6,4,20,'Rua Basilio 199','Jardim Jupter',NULL),
(1,4,21,'Rua Doce 32','Praça Marte',NULL),
(1,4,22,'Rua Grumix 114','Largo de Netuno',NULL),
(1,4,23,'Rua Emilia 32','Area de Plutão',NULL),
(1,4,24,'Al Jurupis 900','Vila Lua Branca',NULL),
(1,4,25,'Av. Guedes 653','Parque Urano',NULL),
(2,5,26,'Rua Neves 430','Jd. Paraiso',NULL),
(2,5,27,'Av. Mario Zonta, 180','Terra Prometida',NULL),
(2,5,28,'Rua Florida, 430','Jd. das Flores',NULL),
(3,5,29,'Av. Jose Barroso, 305','Praça das Margaridas',NULL),
(3,5,30,'Rua Mirina, 38','Zona Franca',NULL),
(4,5,31,'Rua Iagaraí, 46','Jd. Brasileiro',NULL),
(4,5,32,'Rua Paulista, 251','Jd. MMDC',NULL),
(4,2,33,'Rua Salete, 320','Jd. Sales Garcia',NULL),
(5,1,34,'Rua Souza, 115','Vila Sonia',NULL),
(5,1,35,'Rua Alcion, 604','Parque Piraque',NULL),
(5,1,36,'Av. Sabará, 987','Parque Piqueri',NULL),
(6,2,37,'Rua Oscar Freire, 453','Parque Infantil',NULL),
(6,2,38,'Av. Amaral Gama, 58','Jardim Judas',NULL),
(6,2,39,'Rua Iru, 23','Jd. São Salvador',NULL),
(1,2,40,'Rua Silvia, 560','Vila Pau Brasil',NULL),
(1,2,41,'Rua Moura, 147','Vila Viela',NULL),
(1,3,42,'Rua Aroeir, 954','Vila Amarela',NULL),
(1,3,43,'Rua Pereira, 394','Vila Verde',NULL),
(2,3,44,'Rua Galeão, 54','Vila Branca',NULL);

-- Credito (usando DATE_SUB)
INSERT INTO Credito (Cod_Cli, Cred_Cli, Data_CredCli) VALUES
(1,1000.00, DATE_SUB(NOW(), INTERVAL 30 DAY)),
(1,2000.00, DATE_SUB(NOW(), INTERVAL 29 DAY)),
(1,3000.00, DATE_SUB(NOW(), INTERVAL 28 DAY)),
(2,1000.00, DATE_SUB(NOW(), INTERVAL 27 DAY)),
(3,1000.00, DATE_SUB(NOW(), INTERVAL 26 DAY)),
(4,1000.00, DATE_SUB(NOW(), INTERVAL 25 DAY)),
(5,1000.00, DATE_SUB(NOW(), INTERVAL 24 DAY)),
(6,1000.00, DATE_SUB(NOW(), INTERVAL 23 DAY)),
(7,1000.00, DATE_SUB(NOW(), INTERVAL 22 DAY)),
(8,1000.00, DATE_SUB(NOW(), INTERVAL 21 DAY)),
(9,1000.00, DATE_SUB(NOW(), INTERVAL 20 DAY)),
(10,1000.00, DATE_SUB(NOW(), INTERVAL 19 DAY)),
(11,1000.00, DATE_SUB(NOW(), INTERVAL 18 DAY)),
(12,1000.00, DATE_SUB(NOW(), INTERVAL 17 DAY)),
(13,1000.00, DATE_SUB(NOW(), INTERVAL 16 DAY)),
(14,1000.00, DATE_SUB(NOW(), INTERVAL 15 DAY)),
(15,1000.00, DATE_SUB(NOW(), INTERVAL 14 DAY)),
(16,1000.00, DATE_SUB(NOW(), INTERVAL 13 DAY)),
(17,1000.00, DATE_SUB(NOW(), INTERVAL 12 DAY)),
(18,1000.00, DATE_SUB(NOW(), INTERVAL 11 DAY)),
(19,1000.00, DATE_SUB(NOW(), INTERVAL 10 DAY)),
(20,1000.00, DATE_SUB(NOW(), INTERVAL 9 DAY)),
(21,1000.00, DATE_SUB(NOW(), INTERVAL 8 DAY)),
(22,1000.00, DATE_SUB(NOW(), INTERVAL 7 DAY)),
(23,1000.00, DATE_SUB(NOW(), INTERVAL 6 DAY)),
(24,1000.00, DATE_SUB(NOW(), INTERVAL 5 DAY)),
(25,1000.00, DATE_SUB(NOW(), INTERVAL 4 DAY)),
(26,1000.00, DATE_SUB(NOW(), INTERVAL 3 DAY)),
(27,1000.00, DATE_SUB(NOW(), INTERVAL 2 DAY)),
(28,1000.00, DATE_SUB(NOW(), INTERVAL 1 DAY)),
(29,1000.00, DATE_SUB(NOW(), INTERVAL 30 DAY)),
(30,1000.00, DATE_SUB(NOW(), INTERVAL 29 DAY)),
(31,1000.00, DATE_SUB(NOW(), INTERVAL 28 DAY)),
(32,1000.00, DATE_SUB(NOW(), INTERVAL 27 DAY)),
(33,1000.00, DATE_SUB(NOW(), INTERVAL 26 DAY)),
(34,1000.00, DATE_SUB(NOW(), INTERVAL 25 DAY)),
(35,1000.00, DATE_SUB(NOW(), INTERVAL 24 DAY)),
(36,1000.00, DATE_SUB(NOW(), INTERVAL 23 DAY)),
(37,1000.00, DATE_SUB(NOW(), INTERVAL 22 DAY)),
(38,1000.00, DATE_SUB(NOW(), INTERVAL 21 DAY)),
(39,1000.00, DATE_SUB(NOW(), INTERVAL 20 DAY)),
(40,1000.00, DATE_SUB(NOW(), INTERVAL 19 DAY)),
(41,1000.00, DATE_SUB(NOW(), INTERVAL 18 DAY)),
(42,1000.00, DATE_SUB(NOW(), INTERVAL 17 DAY)),
(43,1000.00, DATE_SUB(NOW(), INTERVAL 16 DAY)),
(44,1000.00, DATE_SUB(NOW(), INTERVAL 15 DAY)),
(45,1000.00, DATE_SUB(NOW(), INTERVAL 14 DAY)),
(46,1000.00, DATE_SUB(NOW(), INTERVAL 13 DAY)),
(47,1000.00, DATE_SUB(NOW(), INTERVAL 12 DAY)),
(48,1000.00, DATE_SUB(NOW(), INTERVAL 11 DAY)),
(49,1000.00, DATE_SUB(NOW(), INTERVAL 10 DAY)),
(50,1000.00, DATE_SUB(NOW(), INTERVAL 9 DAY)),
(51,1000.00, DATE_SUB(NOW(), INTERVAL 8 DAY)),
(52,1000.00, DATE_SUB(NOW(), INTERVAL 7 DAY)),
(53,1000.00, DATE_SUB(NOW(), INTERVAL 6 DAY)),
(54,1000.00, DATE_SUB(NOW(), INTERVAL 5 DAY)),
(55,1000.00, DATE_SUB(NOW(), INTERVAL 4 DAY)),
(56,1000.00, DATE_SUB(NOW(), INTERVAL 3 DAY)),
(57,1000.00, DATE_SUB(NOW(), INTERVAL 2 DAY)),
(58,1000.00, DATE_SUB(NOW(), INTERVAL 1 DAY)),
(59,1000.00, DATE_SUB(NOW(), INTERVAL 1 DAY)),
(60,1000.00, DATE_SUB(NOW(), INTERVAL 2 DAY)),
(61,1000.00, DATE_SUB(NOW(), INTERVAL 3 DAY));

-- Fone
INSERT INTO Fone (Cod_Cli, Num_Fone, Num_DDD) VALUES
(1,'434-2356','011'),(1,'256-4578','011'),(1,'256-5623','011'),
(2,'242-9865','011'),(2,'323-8945','011'),(2,'232-7845','011'),
(3,'565-2365','011'),(3,'454-1254','011'),(3,'898-2345','011'),
(4,'454-1223','011'),(4,'787-4512','011'),(5,'525-4578','011'),
(5,'252-9887','011'),(6,'578-6521','011'),(6,'568-5421','011'),
(7,'536-3254','011'),(8,'568-2154','011'),(9,'587-3221','011'),
(10,'863-6598','011'),(11,'138-8754','011'),(12,'123-6598','011'),
(13,'321-6357','011'),(14,'301-1232','011'),(15,'321-4512','011'),
(16,'333-3221','011'),(17,'555-4578','011'),(18,'666-1245','011'),
(19,'777-3265','011'),(20,'888-2154','011'),(21,'999-1111','015'),
(21,'202-1222','015'),(22,'254-3333','015'),(23,'458-4444','015'),
(23,'874-5555','015'),(24,'313-6666','015'),(24,'587-7777','015'),
(25,'589-8888','015'),(26,'999-9999','015'),(27,'999-1010','015'),
(27,'111-1111','015'),(28,'222-1212','015'),(28,'333-1313','015'),
(28,'444-1414','015'),(29,'555-1515','015'),(29,'666-1616','015'),
(30,'777-1717','015'),(31,'888-1818','015'),(32,'999-1919','015'),
(33,'101-2020','015'),(34,'555-2121','021'),(35,'333-2222','021'),
(36,'717-2323','021'),(37,'656-2424','021'),(38,'374-2525','021'),
(39,'859-2626','021'),(40,'222-2727','021'),(41,'256-2828','021'),
(42,'542-2929','021'),(43,'578-3030','021'),(44,'896-4041','021'),
(45,'369-5050','021'),(46,'132-5151','021'),(47,'321-6161','021'),
(48,'542-7171','011'),(49,'201-8181','011'),(50,'301-9191','011'),
(50,'401-1919','011'),(50,'501-1818','011'),(51,'601-1212','011'),
(52,'701-1313','011'),(53,'801-1414','011'),(54,'901-1515','011'),
(56,'222-1616','011'),(56,'333-1714','011'),(57,'111-1818','011'),
(58,'444-1919','011'),(59,'222-2020','011'),(62,'333-2121','011');

-- Email (algumas entradas podem conter textos não-e-mail do original; mantive literal)
INSERT INTO Email (Cod_Cli, EMail_Cli) VALUES
(1,'Joaobrasao@Hotmail.com'),(1,'Joaobrasao@bbb.com.br'),(1,'Joaobrasao@xxx.com.br'),
(1,'JoaoCarloss@Globo.com.br'),(2,'DanielLeao@uol.com.br'),(3,'HOL@Hotmail.com'),
(4,'ROL@Hotmail.com'),(5,'RenataLeao01@Hotmail.com'),(5,'Renata.Leao@Globo.com'),
(6,'JairoGato@Bol.com.br'),(7,'FernandoLeao@Hotmil.com'),(8,'GiGi_Leao@Hotmial.com'),
(9,'Lucas_Leao@Hotmail.com'),(10,'HelderLeão@Hotmail.com'),(11,'OlgaCBonfiglioli@Hotmail.com'),
(12,'MCBMSS@Hotmail.com'),(13,'SEFeredico@Hotmail.com'),(14,'DoloresGMartins@Hotmail.com'),
(15,'Fabiana_Bataglin@Hotmail.com'),(28,'Alberto_Belli@Hotmail.com'),(29,'Marcia_Bueno@Hotmail.com'),
(30,'MariaCatta@Hotmail.com'),(38,'ValterKoszura@Hotmail.com'),(51,'PaulinoRomelli@Hotmail.com'),
(52,'Fernando Sampaio'),(53,'JoséSampaio@uol.com.br'),(54,'VicenzoSenatori@uol.com.br'),
(55,'GeraldoSenedeze@uol.com.br'),(61,'AngelinoSaullo@uol.com.br'),(62,'AldoSavazzoni@uol.com.br');

-- StatusPedido
INSERT INTO StatusPedido (Sta_Ped) VALUES ('Aberto'),('Pendente'),('Fechado'),('Cancelado');

-- Chamar procedures de geração de dados
CALL P_GeraDadosFuncionario();
CALL P_GeraDadosBonus(100.00);
CALL P_GeraDadosBonus(300.00);
CALL P_GeraDadosPontuacao(10.00,1,10);
CALL P_GeraDadosPontuacao(70.00,11,22);
CALL P_GeraDadosHistorico();

-- Dependente (usando STR_TO_DATE)
INSERT INTO Dependente (Cod_Func, Nome_Dep, Data_NascDep, Sexo_Dep) VALUES
(3,'Sebastiana Maria', STR_TO_DATE('01/02/64','%d/%m/%y'),'F'),
(3,'Sebastião Mario', STR_TO_DATE('01/02/64','%d/%m/%y'),'M'),
(4,'Aurea Virtude', STR_TO_DATE('01/02/64','%d/%m/%y'),'F'),
(4,'Aureo Visture', STR_TO_DATE('01/02/64','%d/%m/%y'),'M'),
(7,'Pedro da Silva', STR_TO_DATE('01/02/64','%d/%m/%y'),'F'),
(7,'Alvares da Silva', STR_TO_DATE('01/02/64','%d/%m/%y'),'M'),
(7,'Cabral da Silva', STR_TO_DATE('01/02/64','%d/%m/%y'),'M');

-- Gerar pedidos (procedure)
CALL P_GeraDadosPedido();

-- Gerar parcelas para faixas (ex.: 0-300 em 3 parcelas, etc.)
CALL P_Parcelas(0,300,3);
CALL P_Parcelas(301,400,4);
CALL P_Parcelas(401,500,5);
CALL P_Parcelas(501,600,6);
CALL P_Parcelas(601,700,7);
CALL P_Parcelas(701,800,8);
CALL P_Parcelas(801,900,9);
CALL P_Parcelas(901,10000,10);

-- TipoProd
INSERT INTO TipoProd (Nome_TipoProd) VALUES
('Primeira Linha'),('Segunda Linha'),('Terceira Linha'),('Quarta Linha'),('Quinta Linha');

-- Produto (atenção: ordem de colunas assumida: Cod_TipoProd, Nome_Prod, Qtd_EstqProd, Val_UnitProd)
INSERT INTO Produto (Cod_TipoProd, Nome_Prod, Qtd_EstqProd, Val_UnitProd) VALUES
(1,'Armário Inox',1000,1200),(1,'Armário Madeira',1000,2200),(2,'Armário Metal',1000,200),
(1,'Mesa Vidro',100,1500),(3,'Mesa Fórmica',1000,200),(2,'Mesa Madeira',1000,800),
(1,'Sofa Couro',500,2200),(2,'Sofa Napa',500,200),(1,'Estante Madeira',500,12200),
(1,'Cama',500,1200),(1,'Geladeira',500,3200),(1,'Fogão',500,700);

-- Gerar Itens em blocos (procedures)
CALL P_GeraDadosItens(1,100,1);
CALL P_GeraDadosItens(101,200,2);
CALL P_GeraDadosItens(201,300,2);
CALL P_GeraDadosItens(301,400,2);
CALL P_GeraDadosItens(401,10000,3);
-- Observação: último CALL do original (10001,10000,4) tem intervalo invertido; pulamos para evitar erro.
-- Se realmente precisar criar esse lote, podemos ajustar manualmente.

-- Consultas de verificação (opcionais)
-- SELECT COUNT(*) FROM Bonus;
-- SELECT COUNT(*) FROM Cidade;
-- ... (demais selects podem ser executados conforme necessário)

-- Fim do Script02 convertido
