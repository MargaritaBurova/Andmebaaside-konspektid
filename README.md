# Andmebaaside konspektid | Margarita

[Põhimõisted](README.md) | [Protseduurid](protseduur.md) | [Protseduurid2](XAMPPprotseduur.md) | [Trigerid](triger.md) | [Keys](KEYS.md) | [HotelliRoom](hotelliRoom.md)

andmebaasidega seotud SQL kood ja konspektid
## SISUKORD 
- [Põhimõisted](#põhimõisted)
- [Andmetüübid](#andmetüübid)
- [PIIRANGUD](#PIIRANGUD)
- [# SQL - Strukture Query Language](#SQL-Strukture-Query-Language)
- [ALTER TABLE](#ALTER-TABLE)
- [tund 23.04](#tund-23.04)

## Põhimõisted 
- andmebaas - struktureeritud andmete kogum
- tabel = olem -сущность -entity
- veerg = väli - поле *столбец
- rida = kirje - записи
- andmebaasi haldusüsteem - tarkvara, millega abil saab luua andmebaas: mariaDB / XAMPP, SQL SERVER management Studio.
 <img width="235" height="300" alt="{C8FC6299-14ED-4A1F-9551-51E8D4058678}" src="https://github.com/user-attachments/assets/98d4d88c-b167-4686-9132-629c3988ddce" />

- primaarne võti -PRIMARY KEY - veerg(tavaliselt id nimega), unikaalne identifikaator, mis eristab iga kirje.
- välisvõti - FORIGN KEY -FK- veerg, mis loob seos teise tabeli primaarvõtmega.
- päring - QUERY - запрос
<img width="618" height="444" alt="{E3DE3D8C-1BB2-4CF1-B694-15B198599FFE}" src="https://github.com/user-attachments/assets/22bdd10c-1675-4cc6-8e1f-099250d05f04" />


## Andmetüübid
```
1. Numbrilised: INT, SmallINT, float, decimal(5,2)
2. Tekst/sümboolised: varchar(255), char(5), TEXT
3. Loogilised: boolean, true/false, bit, bool
4. Kuupäeva: date, time, datetime
```
## SQL - Strukture Query Language - struktureeritud päringu keel
- Tabeli loomine
```sql
CREATE DATABASE BurovaBaas;


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
```
- Andmete sisetamine tabelisse
```sql
  --tabeli täitmine 
INSERT INTO opilane
VALUES ('Matrgaret','Mironova', '2000-08-21' ,1,'+37256819158','Tallinn', 4.5);

INSERT INTO opilane(perenimi, eesnimi, keskmineHinne)
VALUES ('Uljanova', 'Uljana', 4.2),
('Ljubimtsev', 'Maksim', 4.2),
('Avik', 'Katrina', 5.0);
```
##Seosed (tabelivahelised seosed)
-üks-ühele (nt mees-naine)
-üks-mitmele (nt ema-lapsed)

-mitu-mitmele (nt õpilased - õpetajat)

## PIIRANG 
constraint- ограничения (5)
1. PRIMARY KEY
2. FOREIGN KEI
3. CHECK
4. NOT NULL
5. UNIQUE

```sql
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

```
<img width="841" height="417" alt="{68882913-8511-4C4A-9AA0-575A3A28AAA9}" src="https://github.com/user-attachments/assets/760b05fb-9ca9-4c89-8c17-a86b4c09867c" />





## ALTER TABLE
- tabeli struktuuri muutmine (struktuur: veerudenimed, andmetüübid, piirangud)


```sql
--uue veeru lisamine
ALTER TABLE opilane ADD isikukood varchar(11);

--veeru kustutamine
ALTER TABLE opilane DROP COLUMN isikukood;

--andmetüübid muutmine varchar(11)-->char(11)
ALTER TABLE opilane ALTER COLUMN isikukood char(11);

--sisseehitatud protseduur, mis näitab tabeli struktuur
sp_help opilane;
```

## tund 23.04
```sql
CREATE DATABASE TITpv24Burova;

USE TITpv24Burova;
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

--uue veeru lisamine
ALTER TABLE opilane ADD isikukood varchar(11);

--veeru kustutamine
ALTER TABLE opilane DROP COLUMN isikukood;

--andmetüübid muutmine varchar(11)-->char(11)
ALTER TABLE opilane ALTER COLUMN isikukood char(11);

--sisseehitatud protseduur, mis näitab tabeli struktuur
sp_help opilane;

--piirangud lisamine
CREATE TABLE ryhm(
ryhmId int not null,
ryhmNimi char(10));
drop table ryhm;

sp_help ryhm;

--PK lisamine
ALTER TABLE ryhm ADD CONSTRAINT pk_ryhm PRIMARY KEY (ryhmId);
--UNIQUE lisamine
ALTER TABLE ryhm ADD CONSTRAINT un_ryhm UNIQUE (ryhmNimi);

--kontrollimiseks täidame tabelit ryhm
SELECT * FROM ryhm;
INSERT INTO ryhm (ryhmId, ryhmNimi)
VALUES (2, 'TITpv24');

--lisame Foreign ´Key - võõrvõti-välisvõti
ALTER TABLE opilane ADD ryhmId int;
SELECT * FROM opilane;
SELECT * FROM ryhm;
ALTER TABLE opilane ADD CONSTRAINT fk_ryhm
FOREIGN KEY (ryhmId) REFERENCES ryhm(ryhmId);

--kontrollimiseks - täidame tabeli opilane 
INSERT INTO opilane 
VALUES ('Leena','Burova', '2000-08-21' ,1,'+37256819158','Tallinn', 4.3, '5667897', 2);
```
