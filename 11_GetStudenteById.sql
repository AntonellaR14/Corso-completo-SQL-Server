USE ScuolaDb;


-- Author:		Antonella
-- Create date: 07/07/2026
-- Description:	Restituisce uno studente in base all'id passata nel parmentro
-- =============================================
CREATE PROCEDURE GetStudenteById
    -- Add the parameters for the stored procedure here
    @studenteId INT
AS
BEGIN
    SELECT
        StudenteId as [Matricola],
        Nome + ' ' + Cognome as [Nome Completo dello studente],
        ISNULL(Email, 'Non definita') AS Email,
        CodiceFiscale,
        ISNULL(CONVERT(NVARCHAR, DataNascita, 109), 'N/D') as [Data di Nascita],
        ISNULL(Telefono, 0) as Telefono
    FROM Studenti
    WHERE StudenteId = @studenteId
END
GO

EXEC GetStudenteById 5;
EXEC GetStudenteById @studenteId = 5;