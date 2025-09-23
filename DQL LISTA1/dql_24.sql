USE DDL22_24;
SELECT 
    R.id AS Reserva,
    Q.numero AS NumeroQuarto,
    R.checkin,
    R.checkout,
    R.status_reserva,
    CL.nome AS Cliente
FROM Reservas_Quarto R
JOIN Clientes CL ON R.cliente_id = CL.id
JOIN Quartos Q ON R.quarto_id = Q.id
WHERE MONTH(R.checkout) = 12;
