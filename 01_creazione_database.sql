CREATE DATABASE ScuolaDb;
Go

-- chiamata(uso) del database ScuolaDb
use ScuolaDb;

-- Creazione della tabella
Create table Studenti(
--rappresenta una colonna con il tipo intero, chiave primaria non vuoto(obbligatorio) univoco
StudenteId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
Nome NVARCHAR(50) NOT NULL,
Cognome NVARCHAR(50) NOT NULL,
Email NVARCHAR(150) UNIQUE NULL,
CodiceFiscale CHAR(16) UNIQUE NOT NULL,
DataNascita DATE NULL,
Telefono NVARCHAR(20) UNIQUE NULL
);

-- select per visualizzare il record di una tabella

-- voglio selezionare tutte le colonne della tabella studenti
SELECT * FROM Studenti;

/*
Creare tabella Corsi con le colonne:
CorsoID chiave primaria not null
NomeCorso testo lunghezza 100 non nullo unico
Descrizione testo (256 caratteri)
Crediti intero nullabile 
Durata intero nullabile

*/

Create table Corsi(
	CorsoID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	NomeCorso NVARCHAR(100) UNIQUE NOT NULL,
	Descrizione NVARCHAR(256),
	Crediti INT,
	Durata INT,
);


SELECT * FROM Corsi;




 -- Creazione della tabella dei Docenti
 CREATE TABLE Docenti(
	DocentiId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Nome NVARCHAR(50) NOT NULL,
	Cognome NVARCHAR(50) NOT NULL,
	Email NVARCHAR(50) UNIQUE NULL,
	Specializzazione NVARCHAR(50) NOT NULL
 );

 -- Modifica del nome della colonna DocentiId
 EXEC sp_rename 'Docenti.DocentiId', 'DocenteId';



 SELECT * FROM Docenti;

 --Creazione della tabella Aule
 CREATE TABLE Aule(
	AulaId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	NomeAula NVARCHAR(150) NOT NULL,
	Capacita INT NOT NULL,
 );

 SELECT * FROM Aule;

 -- Inserimento dei dati
 -- Inserisco nella tabella Studenti

 SELECT * FROM Studenti;
 
 -- Rappresentano i valori da inserire
INSERT INTO Studenti
	(Nome, Cognome, Email, CodiceFiscale, DataNascita, Telefono)
VALUES
	-- ('Marialourdes', 'Messa', 'm.messa@gmail.com', 'MSSML964125PAI5P', '1978/03/29', '+393475397216'),
	 ('Antonella', 'Risi', 'risi.antonella@gmail.com', 'ANTONELLA012365', '1982/11/09', '+391234569870'),
     ('Lucia', 'Cicala', 'cicala.l@gmail.com', 'LUCIACICALA01225', '2000/02/06', '+390321455697');



	 -- Foreign key
	- Creazione della tabella Iscrizione -> Corsi e studenti
	CREATE TABLE Iscrizioni(
    IscrizioneId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    StudenteId INT NOT NULL,
	CorsoId INT NOT NULL,
	DataIscrizione Date NOT NULL,

	-- Vincoli di relazione (Foreign Key)
	FOREIGN KEY(StudenteId) REFERENCES Studenti(StudenteId),
	FOREIGN KEY(CorsoId) REFERENCES Corsi(CorsoId),
);


SELECT * FROM Iscrizioni;


-- Creazione della tabella Lezioni-> Corsi e Aule

CREATE TABLE Lezioni(
    LezioniId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	CorsoId INT NOT NULL,
	AulaId INT NOT NULL,

	DataLezione Date NOT NULL,
	OraInizio TIME,
	OraFine TIME,


	-- Vincoli di relazione (Foreign Key)
	FOREIGN KEY(CorsoId) REFERENCES Corsi(CorsoId),
	FOREIGN KEY(AulaId) REFERENCES Aule(AulaId)
);


-- Docenti _ DocentiCorso

CREATE TABLE DocentiCorso(
  DocenteCorsoId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	DocentiId INT NOT NULL,
	CorsoId INT NOT NULL,
	

	FOREIGN KEY (CorsoId) REFERENCES Corsi(CorsoId),
    FOREIGN KEY (DocentiId) REFERENCES Docenti(DocenteId)
);

Exec sp_rename 'DocentiCorso.DocentiId', 'DocenteId';

SELECT * FROM DocentiCorso;