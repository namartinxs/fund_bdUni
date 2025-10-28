-- 1.	Escreva um comando que apresente quantos clientes são casados e quantos clientes são solteiros. 
SELECT Estado_Civil, COUNT(*) AS Quantidade
FROM Cliente
GROUP BY Estado_Civil;
-- 2.	Escreve um comando que exiba quantos e-mails cada cliente tem. 
SELECT Cod_Cli, COUNT(*) AS Qtd_Emails
FROM EmailCliente
GROUP BY Cod_Cli;
-- 3.	Escreva um comando que exiba quantos clientes você tem de cada tipo. 
SELECT Cod_Tipo, COUNT(*) AS Qtd_Clientes
FROM Cliente
GROUP BY Cod_Tipo;
-- 4.	Escreva um comando que exiba a quantidade de parcelas de que é composto cada pedido. 
SELECT Num_Ped, COUNT(*) AS Qtd_Parcelas
FROM Parcela
GROUP BY Num_Ped;
-- 5.	Escreva um comando que exiba a quantidade de dependentes que cada funcionário tem. 
SELECT Cod_Func, COUNT(*) AS Qtd_Dependentes
FROM Dependente
GROUP BY Cod_Func;
-- 6.	Escreva um comando que mostre quantos produtos você tem de cada tipo. 
SELECT Cod_Tipo, COUNT(*) AS Qtd_Produtos
FROM Produto
GROUP BY Cod_Tipo;
-- 7.	Escreva um comando que mostre o quanto cada cliente gastou em pedidos.
SELECT Cod_Cli, SUM(Val_Ped) AS Total_Gasto
FROM Pedido
GROUP BY Cod_Cli; 
-- 8.	Escreva um comando que mostre quantos clientes você tem em cada cidade. 
SELECT Cod_Cidade, COUNT(*) AS Qtd_Clientes
FROM Cliente
GROUP BY Cod_Cidade;
-- 9.	Escreva um comando que mostre quantas cidades você tem em cada estado. 
SELECT Cod_Estado, COUNT(*) AS Qtd_Cidades
FROM Cidade
GROUP BY Cod_Estado;
-- 10.	Escreva um comando que exiba o total de bônus que cada funcionário recebeu. 
SELECT Cod_Func, SUM(Val_Bonus) AS Total_Bonus
FROM BonusFuncionario
GROUP BY Cod_Func;
-- 11.	Escreva um comando que mostre o total de salários pagos para os funcionários do sexo masculino e para os do sexo feminino. 
SELECT Sexo, SUM(Salario) AS Total_Salarios
FROM Funcionario
GROUP BY Sexo;
-- 12.	Escreva um comando que mostre quantos pedidos você tem de cada status. 
SELECT Cod_Sta, COUNT(*) AS Qtd_Pedidos
FROM Pedido
GROUP BY Cod_Sta;
-- 13.	Escreva um comando que exiba a quantidade de endereços que cada cliente tem. 
SELECT Cod_Cli, COUNT(*) AS Qtd_Enderecos
FROM Endereco
GROUP BY Cod_Cli;
-- 14.	Escreva um comando que exiba o total de pontos que cada funcionário fez por mês. 
SELECT Cod_Func, MONTH(Data_Ponto) AS Mes, SUM(Pontos) AS Total_Pontos
FROM PontoFuncionario
GROUP BY Cod_Func, MONTH(Data_Ponto);
-- 15.	Escreva um comando que mostre quantos pedidos cada funcionário atendeu. 
SELECT Cod_Func, COUNT(*) AS Qtd_Pedidos
FROM Pedido
GROUP BY Cod_Func;
-- 16.	Escreva um comando que mostre quantos pedidos de cada cliente cada funcionário atendeu. 
SELECT Cod_Func, Cod_Cli, COUNT(*) AS Qtd_Pedidos
FROM Pedido
GROUP BY Cod_Func, Cod_Cli;
-- 17.	Escreva um comando que exiba quantos endereços cada cliente tem de cada tipo. 
SELECT Cod_Cli, Cod_Tipo_End, COUNT(*) AS Qtd_Enderecos
FROM Endereco
GROUP BY Cod_Cli, Cod_Tipo_End;
-- 18.	Escreva um comando que mostre o total de salários pagos aos funcionários. 
SELECT SUM(Salario) AS Total_Salarios
FROM Funcionario;
-- 19.	Escreva um comando que apresente quantos clientes você tem de cada estado civil, apresentando o nome completo de cada estado civil. 
SELECT ec.Nome_Estado_Civil, COUNT(*) AS Qtd_Clientes
FROM Cliente c
JOIN EstadoCivil ec ON c.Estado_Civil = ec.Cod_Estado_Civil
GROUP BY ec.Nome_Estado_Civil;
-- 20.	Escreve um comando que exiba quantos e-mails cada cliente tem, apresentando o nome de cada cliente. 
SELECT c.Nome_Cli, COUNT(e.Email) AS Qtd_Emails
FROM Cliente c
LEFT JOIN EmailCliente e ON c.Cod_Cli = e.Cod_Cli
GROUP BY c.Nome_Cli;
-- 21.	Escreva um comando que exiba quantos clientes você tem de cada tipo, apresentando o nome de cada tipo 
SELECT t.Nome_Tipo, COUNT(c.Cod_Cli) AS Qtd_Clientes
FROM Cliente c
JOIN TipoCli t ON c.Cod_Tipo = t.Cod_Tipo
GROUP BY t.Nome_Tipo;
-- 22.	Escreva um comando que exiba a quantidade de parcelas que compõem cada pedido, exibindo todos os dados dos pedidos. 
SELECT p.Num_Ped, COUNT(par.Num_Par) AS Qtd_Parcelas
FROM Pedido p
LEFT JOIN Parcela par ON p.Num_Ped = par.Num_Ped
GROUP BY p.Num_Ped;
-- 23.	Escreva um comando que exiba a quantidade de dependentes que cada funcionário tem, mostrando o nome de cada funcionário. 
SELECT f.Nome_Func, COUNT(d.Cod_Dep) AS Qtd_Dependentes
FROM Funcionario f
LEFT JOIN Dependente d ON f.Cod_Func = d.Cod_Func
GROUP BY f.Nome_Func;
-- 24.	Escreva um comando que mostre quantos produtos você tem de cada tipo, mostrando o nome do tipo. 
SELECT t.Nome_Tipo, COUNT(p.Cod_Prod) AS Qtd_Produtos
FROM Produto p
JOIN TipoProd t ON p.Cod_Tipo = t.Cod_Tipo
GROUP BY t.Nome_Tipo;
-- 25.	Escreva um comando que mostre o quanto cada cliente gastou em pedidos, mostrando o nome do cliente. 
SELECT c.Nome_Cli, SUM(p.Val_Ped) AS Total_Gasto
FROM Cliente c
JOIN Pedido p ON c.Cod_Cli = p.Cod_Cli
GROUP BY c.Nome_Cli;
-- 26.	Escreva um comando que mostre quantos clientes você tem em cada cidade, mostrando o nome de cada cidade. 
SELECT ci.Nome_Cidade, COUNT(c.Cod_Cli) AS Qtd_Clientes
FROM Cliente c
JOIN Cidade ci ON c.Cod_Cidade = ci.Cod_Cidade
GROUP BY ci.Nome_Cidade;
-- 27.	Escreva um comando que mostre quantas cidades você tem em cada estado, mostrando o nome do estado. 
SELECT e.Nome_Estado, COUNT(ci.Cod_Cidade) AS Qtd_Cidades
FROM Estado e
JOIN Cidade ci ON e.Cod_Estado = ci.Cod_Estado
GROUP BY e.Nome_Estado;
-- 28.	Escreva um comando que exiba o total de bônus que cada funcionário recebeu, mostrando o nome de cada funcionário. 
SELECT f.Nome_Func, SUM(b.Val_Bonus) AS Total_Bonus
FROM Funcionario f
LEFT JOIN BonusFuncionario b ON f.Cod_Func = b.Cod_Func
GROUP BY f.Nome_Func;
-- 29.	Escreva um comando que exiba a quantidade de endereços que cada cliente tem, mostrando o nome de cada cliente. 
SELECT c.Nome_Cli, COUNT(e.Cod_End) AS Qtd_Enderecos
FROM Cliente c
LEFT JOIN Endereco e ON c.Cod_Cli = e.Cod_Cli
GROUP BY c.Nome_Cli;
-- 30.	Escreva um comando que exiba o total de pontos que cada funcionário fez por mês, mostrando o nome do funcionário. 
SELECT f.Nome_Func, MONTH(p.Data_Ponto) AS Mes, SUM(p.Pontos) AS Total_Pontos
FROM PontoFuncionario p
JOIN Funcionario f ON p.Cod_Func = f.Cod_Func
GROUP BY f.Nome_Func, MONTH(p.Data_Ponto);

