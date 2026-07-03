USE ScuolaDb;


/*
    BETWEEN
    Serve per filtrare tra valori 
    Compresi in un intervallo

    Es;
        SELECT 
            colonne
        FROM tabella
        where colonna BETWEEN valore1 AND valore2
*/


SELECT
*
FROM Corsi
WHERE Crediti BETWEEN

SELECT
*
FROM Corsi
WHERE Crediti=7 or Crediti=10 or Crediti=30;

OPPURE SCRIVIAMO

SELECT
*
FROM Corsi
WHERE Crediti BETWEEN 7 AND 30;




