USE ScuolaDb;


/*
    =====================================================
        FUNZIONI DI AGGREGAZIONE
    =====================================================

    Le funzioni di aggreazione servono per:
        - contare i dati       (COUNT)
        - calcolare la media   (AVG)
        - sommare il numero    (SUM)
        - trovare il minimo    (MIN)
        - trovare il massimo  (MAX)
*/

SELECT 
    *
FROM Studenti;

SELECT 
    COUNT (*) FROM Student as [Totale Studenti];

    SELECT 
    AVG(*) FROM Studenti;

    SELECT 
    AVG(Crediti) AS Media) FROM Corsi;



    -- Numero totale degli studenti 
SELECT
    COUNT(*) as [Totale Studenti]
FROM Studenti;


-- Media dei crediti
SELECT 
    AVG(Crediti) AS Media
FROM Corsi;


-- Somma totale dei crediti della tabella Corsi
SELECT
    -- COUNT(*) no
    SUM(Crediti) as [Totale dei crediti]
FROM Corsi;

-- La durata minima dei corsi
SELECT
    MIN(Durata) as [Durata minima dei corsi]
FROM Corsi;

SELECT
    MAX(Durata) as [Durata massima dei corsi]
FROM Corsi;



-- Report del corso

SELECT
    COUNT(*) AS [TOTALE CORSI],
    SUM(Crediti) AS [TOTALE CREDITI],
    AVG (Crediti) AS [MEDIA DEI CREDITI],
    MIN (Crediti) AS [CREDITO MINIMO],
    MAX (Crediti) AS [CREDITO MASSIMO],
    AVG (Durata) AS [DURATA MEDIA],
    SUM (Durata) AS [TOTALE DURATA]
FROM Corsi;