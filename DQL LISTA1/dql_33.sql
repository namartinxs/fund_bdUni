USE DDL31_33;

SELECT apolice_id, descricao 
FROM Sinistros
WHERE YEAR(data_ocorrencia) = 2025;