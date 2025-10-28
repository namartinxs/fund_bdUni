-- 1.	Escreva um comando que exiba todas as colunas e todas as linhas de dados da tabela TipoEnd.
SELECT * FROM TipoEnd; 
-- 2.	Escreva um comando que exiba todas as colunas e todas as linhas de dados da tabela TipoProd.
SELECT * FROM TipoProd;  
-- 3.	Escreva um comando que exiba todas as colunas e todas as linhas de dados da tabela TipoCli.
SELECT * FROM TipoCli; 
-- 4.	Escreva um comando que exiba todas as colunas e todas as linhas de dados da tabela Estado. 
SELECT * FROM Estado;
-- 5.	Escreva um comando que exiba a sigla do estado e o nome das cidades que você possui em cada estado no seu sistema.
SELECT e.Sigla_Estado, c.Nome_Cidade
FROM Cidade c
JOIN Estado e ON c.Cod_Estado = e.Cod_Estado; 
-- 6.	Escreva um comando que exiba o nome dos clientes do seu cadastro de clientes, a data de cadastro desse cliente no sistema e o valor da renda que cada cliente possui. 
SELECT Nome_Cli, Data_Cad, Renda
FROM Cliente;
-- 7.	Escreva um comando que exiba o nome de todos os funcionários do seu cadastro de funcionários, a data de nascimento, o sexo e o salário de um dos funcionários do seu sistema. 
SELECT Nome_Func, Data_Nasc, Sexo, Salario
FROM Funcionario;
-- 8.	Escreva um comando que exiba todos os dados da tabela Histórico do funcionário de código 1. 
SELECT *
FROM Historico
WHERE Cod_Func = 1;
-- 9.	Escreva um comando que exiba o nome, o tipo, a quantidade e o valor unitário dos produtos em estoque. 
SELECT p.Nome_Prod, t.Nome_Tipo, p.Qtd_Estoque, p.Val_Unit
FROM Produto p
JOIN TipoProd t ON p.Cod_Tipo = t.Cod_Tipo;
-- 10.	Escreva um comando que exiba o nome do cliente, o valor da sua renda e apresente também essa mesma renda com um acréscimo de 10%, para todos os clientes do seu database. 
SELECT Nome_Cli, Renda, Renda * 1.10 AS Renda_Acrescida
FROM Cliente;
-- 11.	Escreva um comando que exiba o nome do cliente, o valor da sua renda e apresente também essa mesma renda com um acréscimo de 10%, apenas para os clientes com renda inferior a 1000.00. 
SELECT Nome_Cli, Renda, Renda * 1.10 AS Renda_Acrescida
FROM Cliente
WHERE Renda < 1000.00;
-- 12.	Escreva um comando que aplique 20% de aumento salarial para todos os funcionários do sexo feminino e que ganhem um salário inferior a 1000.00. 
UPDATE Funcionario
SET Salario = Salario * 1.20
WHERE Sexo = 'F' AND Salario < 1000.00;
-- 13.	Escreva um comando que aplique um aumento de 10% ao valor dos produtos do tipo 1. 
UPDATE Produto
SET Val_Unit = Val_Unit * 1.10
WHERE Cod_Tipo = 1;
-- 14.	Escreva um comando que aplique um aumento de 5% ao valor dos produtos do tipo 2. 
UPDATE Produto
SET Val_Unit = Val_Unit * 1.05
WHERE Cod_Tipo = 2;
-- 15.	Escreva um comando que aplique uma redução de 20% ao valor dos produtos do tipo 3. 
UPDATE Produto
SET Val_Unit = Val_Unit * 0.80
WHERE Cod_Tipo = 3;
-- 16.	Escreva um comando que elimina todos os itens vendidos no pedido 10. 
DELETE FROM ItensPedido
WHERE Num_Ped = 10;

--17 a 32 são iguais do 1 a 16 

 
-- 33.	Escreva um comando que exiba todas as colunas e todas as linhas de dados da tabela TipoEnd, ordenando os dados de forma crescente pela coluna Nome_Tipo. 
SELECT *
FROM TipoEnd
ORDER BY Nome_Tipo ASC;
-- 34.	Escreva um comando que apresente os dados dos clientes ordenados de forma decrescente pela coluna Nome_Cli. 
SELECT *
FROM Cliente
ORDER BY Nome_Cli DESC;