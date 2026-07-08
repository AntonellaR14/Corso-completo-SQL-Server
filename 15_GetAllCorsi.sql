USE ScuolaDb;

CREATE PROCEDURE sp_GetAllCorsi
AS
BEGIN
    SELECT
        -- CORSI
        NomeCorso AS [Nome del Corso],
        Descrizione AS [descrizione del corso]
    FROM Corsi 
END
GO

-- ESECUZIONE DELLA PROCEDURE
EXECUTE sp_GetAllCorsi;