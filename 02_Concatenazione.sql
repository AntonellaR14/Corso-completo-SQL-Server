USE ScuolaDb;

select * from Studenti;

-- Restituisce uno studente con l'id passata nel parametro
SELECT *  FROM Studenti
WHERE StudenteId = 3;


--nome,Cognome, Telefono
SELECT 
Nome,
Cognome,
Telefono
*  FROM Studenti
WHERE  StudenteId=3;

-- l'istruzione WHERE filtra i dati basandosi sulle condizioni
/*
Es: Select
colonne
FROM tabella
WHERE condizione
*/
WHERE StudenteId = 3;



/*
	Gli operatori di confronto in SQL
	Servono per confrontare valori:
	| Operatore		| Significato   |
	|---------------|---------------|
	|		=		| Uguale	    |
	|		!=		| Diverso       |
	|		<>		| Diverso       |
	|		<		| Minore	    |
	|		>		| Maggiore	    |
	|		<=		| Minore uguale |
	|		>=		|Maggiore uguale|
*/

---------------------------------------------------------------------

	Operatori logici (booleano)
	| Operatore     | Significato   		|
	|---------------|-----------------------|
	|		AND		| tutte vere    		|
	|		OR		| almeno un vera        |
	|		NOT		| nega la condizione    |
	|   IS NULL		| Valore nullo  		|
*/


-- La concatenazione (+) semplice
SELECT 
Nome + ' - ' + Cognome,
Telefono
FROM Studenti
WHERE  StudenteId=3;

-- Alias con la concatenazione
SELECT 
Nome + ' - ' + Cognome AS Nome_Completo_dello_studente,
Telefono
FROM Studenti

SELECT 
Nome + ' - ' + Cognome AS 'Nome Completo dello studente',
Telefono
FROM Studenti;

SELECT 
Nome + ' - ' + Cognome AS [Nome Completo dello studente],
Telefono
FROM Studenti;

Select * FROM Studenti;

-- Restituisce la lista degli studenti che hanno inserito la data di nascita durante l'iscrizione
SELECT 
Nome + ' - ' + Cognome AS [Nome Completo dello studente],
CodiceFiscale
FROM Studenti
WHERE DataNascita IS NOT NULL;


SELECT 
Nome + ' - ' + Cognome AS [Nome Completo dello studente],
CodiceFiscale
FROM Studenti
WHERE DataNascita IS NOT NULL AND DataNascita >='2000';


-- TOP selezionare le prime righe di una tabella
SELECT 
	TOP 10 * 
FROM Corsi;


SELECT 
TOP 10
Nome + ' - ' + Cognome AS [Nome Completo dello studente],
CodiceFiscale
FROM Studenti
WHERE DataNascita IS NOT NULL AND DataNascita >='2000';

-- TOP selezionare le prime righe di una tabella
SELECT 
	TOP 10 * -- i primi 10 record
FROM Corsi;

SELECT
	TOP 10
	*
FROM Corsi
ORDER BY NomeCorso DESC; -- ordina in base al nome del corso  (ASC/ DESC)

-- ORDER BY (per ordinare colonne)

SELECT 
TOP 10
Nome + ' - ' + Cognome AS [Nome Completo dello studente],
CodiceFiscale
FROM Studenti
WHERE DataNascita IS NOT NULL AND DataNascita >='2000'
ORDER BY [Nome Completo dello studente] ASC;

SELECT
	TOP 10
	Nome + ' ' + Cognome AS [Nome Completo dello studente],
	CodiceFiscale,
	DataNascita as [Data Nascita]
FROM Studenti
WHERE DataNascita IS NOT NULL AND DataNascita >= '2000-01-01';


USE ScuolaDb
SELECT TOP 10 *
FROM Studenti
ORDER BY Cognome ASC;


