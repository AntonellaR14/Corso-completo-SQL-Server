USE ScuolaDb

--Iscrizione di uno studente ad un corso

SELECT * FROM Corsi;
SELECT * FROM Studenti;
SELECT * FROM Iscrizioni;

insert into Studenti
(Nome, Cognome, Email, CodiceFiscale, DataNascita, Telefono)
values
	('Nathaly', 'Ornella', 'n.ornella@gmail.com', 'NTOL136569OPE0P', '1988/05/05', '+39325698741')

	-- Iscrizione di uno studente ad un corso
insert into Iscrizioni
(StudenteId, CorsoId, DAtaIscrizione)
values
(42, (1), GETDATE () ),
(42, (2), GETDATE () );

SELECT * FROM Studenti s
INNER JOIN Iscrizioni as i
		ON s.StudenteId =i.StudenteId
INNER JOIN Corsi as c
		ON i.CorsoId =c.CorsoID
WHERE s.StudenteId = 42;


SELECT * from Studenti WHERE Nome = 'Nathaly'; -- sarà il numero 43;

SELECT 
	s.StudenteId,
	s.Nome,
	s.Cognome,
	s.CodiceFiscale,
	c.NomeCorso,
	c.Descrizione
FROM Studenti as s
INNER JOIN Iscrizioni as i
	ON s.StudenteId = i.StudenteId
INNER JOIN Corsi as c
	ON i.CorsoId = c.CorsoId
where s.StudenteId = 42;



SELECT 
	s.StudenteId,
	s.Nome,
	s.Cognome,
	s.CodiceFiscale,
	ISNULL (CONVERT(NVARCHAR,s.DataNascita,103), 'N/D') AS DataNascita,
	ISNULL (c.NomeCorso, 'N/S') AS NomeCorso,
	ISNULL (c.Descrizione, 'N/S') AS Descrizione,
	c.Descrizione
FROM Studenti as s
LEFT JOIN Iscrizioni as i
	ON s.StudenteId = i.StudenteId
LEFT JOIN Corsi as c
	ON i.CorsoId = c.CorsoId
where c.NomeCorso is null




SELECT 
	s.StudenteId,
	s.Nome,
	s.Cognome,
	s.CodiceFiscale,
	ISNULL (CONVERT(NVARCHAR,s.DataNascita,103), 'N/D') AS DataNascita,
	ISNULL (CONVERT(NVARCHAR,YEAR(s.DataNascita),103), 'N/D') AS Anno,
	ISNULL (CONVERT(NVARCHAR,MONTH(s.DataNascita),103), 'N/D') AS Mese,
	ISNULL (CONVERT(NVARCHAR,DAY(s.DataNascita),103), 'N/D') AS Giorno,
	ISNULL (c.NomeCorso, 'N/S') AS NomeCorso,
	ISNULL (c.Descrizione, 'N/S') AS Descrizione,
	c.Descrizione
FROM Studenti as s
LEFT JOIN Iscrizioni as i
	ON s.StudenteId = i.StudenteId
LEFT JOIN Corsi as c
	ON i.CorsoId = c.CorsoId
ORDER BY s.Nome ASC;



__ DISTINCT serve per rimuovere duplicati


SELECT DISTINCT
	s.StudenteId,
	c.CorsoId,
	s.Nome,
	s.Cognome
FROM Studenti as s
LEFT JOIN Iscrizioni as i
	ON s.StudenteId = i.StudenteId
LEFT JOIN Corsi as c
	ON i.CorsoId = c.CorsoId
WHERE c.corsoId is not null
ORDER BY s.Nome ASC;



SELECT DISTINCT -- CorsoId,
	NomeCorso,
	Descrizione,
	Crediti,
	Durata
FROM Corsi;

INSERT INTO Corsi
	(NomeCorso, Descrizione, Crediti, Durata)
VALUES
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120),	
	('SQL Server Base', 'Introduzione ai database e SQL', 9, 120);


-- UPDATE per modificare
/*
	update tabella
	set colonna = nuovo valore
	where condizione
*/

SELECT * FROM Corsi;

update Corsi
	set NomeCorso = 'Corso BASE R',
		Descrizione = 'Corso programmazione in ML'
	where CorsoID = 32;

	update Corsi
	set NomeCorso = 'Corso Informatico di base',
		Descrizione = 'Installazione e configurazione del sistema opertativo"'
	where CorsoID = 34;


-- Esercizio 1:
-- Modificare la durata del corso "Corso informatico di base" dove l'id = 47

update Corsi
	set NomeCorso = 'Corso Informatico di base',
		Durata = 63
	where CorsoID = 47;


-- Esercizio 2:Modificare un corso in base all'Id es: 50

update Corsi
	set NomeCorso = 'Corso Informatico di base',
		Descrizione = 'Test esercizio 2"'
	where CorsoID = 50;


	-- Delete per eliminare un record in base ad una condizione

	/*
	Esempio:
		DELETE FROM tabella
		WHERE Condizioni di ricerca
	*/

	DELETE FROM Corsi
		WHERE CorsoId=56;




-- Store procedure

