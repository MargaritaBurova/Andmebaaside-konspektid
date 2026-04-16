CREATE DATABASE TITpv24;

use TITpv24;

--tabel opitaja
CREATE TABLE opetaja(
opetajaID int Primary Key identity(1,1), --automaatselt täitab nubritega
nimi varchar(25),
epost varchar(40) NOT NULL,
ruum varchar(13) )

--lisame tabel tund 
CREATE TABLE tund(
tundID int PRIMARY KEY IDENTITY(1,1),
kuupaev DATE, 
tundinimi varchar(30),
opetajaID int
  
SELECT * FROM opetaja

  ----------------------------------------

  CREATE DATABASE BurovaBaas;

--ab kustutamine
DROP DATABASE Melikovbaas;

use BurovaBaas;
--tabeli loomine 
CREATE TABLE opilane(
opilaneID int Primary Key identity(1,1), --automaatselt täitab nubritega
eesnimi varchar(25),
perenimi varchar(30) NOT NULL,
synniaeg DATE, 
stip bit,
mobiil varchar(13),
aadress TEXT,
keskmineHinne decimal(2,1) ) --(2--kokku,1-- peale komat nt 4.5)

SELECT * FROM opilane;

--tabeli täitmine 
INSERT INTO opilane
VALUES ('Matrgaret','Mironova', '2000-08-21' ,1,'+37256819158','Tallinn', 4.5);

INSERT INTO opilane(perenimi, eesnimi, keskmineHinne)
VALUES ('Uljanova', 'Uljana', 4.2),
('Ljubimtsev', 'Maksim', 4.2),
('Avik', 'Katrina', 5.0);

--andmete uuendamine tabelis
UPDATE opilane SET stip=1, aadress='Tallinn';

UPDATE opilane SET stip=1, aadress='Tartu' WHERE opilaneID=5;

--kustutamine
--tabeli kustutamine
DROP TABLE opilane;
--andmete kustutamine tabelis
DELETE FROM opilane WHERE opilaneID=2;
Select * from opilane; 

--FOREIGN KEY
CREATE TABLE opetamine(
opetamineId int PRIMARY KEY identity(1,1),
kuupaev DATE,
oppeaine varchar(30),
opilaneID int, FOREIGN KEY (opilaneID) REFERENCES opilane(opilaneID),
hinne int CHECK(hinne<=5));

SELECT * FROM opetamine;
SELECT * FROM opilane;
--täidame tabeli
INSERT INTO opetamine
VALUES ('2026-04-16', 'andmebaasid', 5, 4)
