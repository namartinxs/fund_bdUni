USE DDL16_18;

SELECT * FROM Consultas WHERE status_consulta = 'AGENDADO';
SELECT 
M.id AS Medico,
P.id AS Paciente,
C.data_hora,
C.status_consulta
FROM Consultas C
JOIN Medicos M ON C.medicos_id = M.id
JOIN Pacientes P ON C.paciente_id = P.id
WHERE C.status_consulta = 'AGENDADO';