-- SQL for en-til-mange-eksemplet gjennomgått i timen tirsdag 31. mars 2020 

DROP SCHEMA IF EXISTS forelesning3 CASCADE;
CREATE SCHEMA forelesning3;
SET search_path TO forelesning3;
    
CREATE TABLE Vitnemal
(
	StudNr INTEGER,
	Studiestart DATE NOT NULL,
	Studieslutt DATE,
	CONSTRAINT VitnemalPK PRIMARY KEY (StudNr)
);

CREATE TABLE Karakter
(
	KarNr SERIAL,
	Emnekode CHAR(6) NOT NULL,
	EksDato DATE NOT NULL,
	Bokstav CHAR(1),
	StudNr INTEGER NOT NULL,
	CONSTRAINT KarakterPK PRIMARY KEY (KarNr),
	CONSTRAINT KarUnique UNIQUE (Emnekode, StudNr),
	CONSTRAINT VitnemalFK FOREIGN KEY (StudNr) 
		REFERENCES Vitnemal(StudNr)
);

INSERT INTO
  Vitnemal(StudNr, Studiestart, Studieslutt)
VALUES
    (123456, '2017-08-14', '2020-08-14'),
    (234567, '2017-08-14', '2020-08-14'),
    (345678, '2017-08-14', '2020-08-14');

-- NB! Databasen genererer selv primærnøkler. De skal ikke oppgis ved INSERT.    
INSERT INTO
  Karakter(Emnekode, EksDato, Bokstav, StudNr)
VALUES
    ('DAT107', '2018-05-30', 'A', 123456),
    ('DAT102', '2018-05-31', 'A', 123456),
    ('DAT107', '2018-05-30', 'B', 234567);
    

