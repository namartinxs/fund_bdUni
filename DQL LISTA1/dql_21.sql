USE DDL19_21;

SELECT 
C.modelo AS Carro,
CL.nome AS Cliente,
R.data_inicio
FROM Reservas_Carro R 
JOIN Carros C ON R.carro_id = C.id 
JOIN Clientes CL ON R.cliente_id = CL.id
WHERE YEAR(R.data_inicio) = 2025;
