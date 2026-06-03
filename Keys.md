## 1. Primary Key

- Relatsioonandmemudelis üks relatsiooni kandidaatvõtmetest , mis on valitud primaarvõtmeks (või vaikevõtmeks). 
- Kui relatsioonil on ainult üks kandidaatvõti, on see ka primaarvõti. Kui kandidaatvõtit on mitu, valitakse üks primaarvõtmeks ja teisi nimetatakse "alternatiivvõtmeteks".

```sql
--1 guest
CREATE TABLE guest(
guestID int Primary key identity(1,1),
firstname varchar(80),
lastname varchar(80)not null,
memberSinace DATE);

SELECT * FROM guest;

INSERT INTO guest
```

<img width="323" height="107" alt="{5E64F4ED-FDAC-439D-A56F-882E455E2E49}" src="https://github.com/user-attachments/assets/db212108-72d2-43a5-9ce4-de5c4694cf04" />

## 2. Foreign Key

```sql
CREATE TABLE hosted_at(
hosted_atID int primary key identity(1,1),
guestID int,
foreign key (guestID) references guest(guestID),
occupied_roomID int,
foreign key (occupied_roomID) references occupied_room(occupied_roomID)
);

SELECT * FROM hosted_at;
SELECT * FROM guest;
SELECT * FROM occupied_room
```

- Võõrvõtmed võimaldavad teil luua tabelite vahel seoseid. Võõrvõti luuakse sõltuva, alamtabeli veergude jaoks ja see osutab ühele primaartabeli veergudest. 
- Tavaliselt osutab võõrvõti seotud primaartabeli primaarvõtmele.

<img width="408" height="371" alt="{6701E13A-A178-452C-92B3-348B98991908}" src="https://github.com/user-attachments/assets/fcf7e052-d05e-453f-967f-4923d333152c" />


## 3. Unique Key

- Relatsioonilistes andmebaasisüsteemides  on unikaalne võti kandidaatvõti , mis ei ole relatsiooni primaarvõti. 
- Kõik relatsiooni kandidaatvõtmed saavad relatsiooni kirjeid unikaalselt identifitseerida, kuid ainult ühte neist kasutatakse relatsiooni primaarvõtmena. 
- Ülejäänud kandidaatvõtmeid nimetatakse unikaalseteks võtmeteks, kuna need saavad relatsioonis kirje unikaalselt identifitseerida. 
- Unikaalsed võtmed võivad koosneda mitmest veerust. Unikaalseid võtmeid nimetatakse ka alternatiivvõtmeteks. 
- Unikaalsed võtmed on alternatiiv relatsiooni primaarvõtmele. 
- Tavaliselt on unikaalsetel võtmetel UNIQUE piirang.

```sql
CREATE TABLE Auto (
    id INT PRIMARY KEY,
    kood VARCHAR(20),
    mudel VARCHAR(100),
    kiirus INT,
    valjalaskeKuupaev DATE,
    CONSTRAINT uk_auto_kood UNIQUE (kood)
);

SELECT * FROM Auto;
```

<img width="449" height="294" alt="{EDE87376-BE82-455E-8AB5-6689C3108EF0}" src="https://github.com/user-attachments/assets/6b43975a-a46e-47fe-93a1-951bfa6fe82f" />


## 4. Simple Key

- Lihtvõti on unikaalne identifikaator, mis sisaldab ainult ühte välja (atribuuti). See on kõige levinum.
- Liitprimaarvõti on identifikaator, mis koosneb kahest või enamast atribuudist. Mõnikord nimetatakse seda liitvõtmeks. See on *id*

```sql
CREATE TABLE Loomad (
    id INT PRIMARY KEY,
    nimi VARCHAR(50),
    liik VARCHAR(50)
);
INSERT INTO Loomad (id, nimi, liik)
VALUES (1,'Muri', 'Koer'),
(2, 'Miisu', 'Kass'),
(3, 'Pontu', 'Koer');
```
<img width="421" height="356" alt="{A4446E35-771F-43A6-A191-AA86E6B95FFE}" src="https://github.com/user-attachments/assets/a97f7aa7-7737-4f31-8902-0b004bc3e8b2" />

## 5. Composite Key

- Liitvõti on primaarvõti, mis koosneb kahest või enamast veerust, mis koos identifitseerivad unikaalselt iga tabeli kirjet. 
- Need veerud ei pruugi eraldi olla unikaalsed, kuid nende kombineeritud väärtused tagavad unikaalsuse.

```sql
CREATE TABLE TellimuseRead (
    Tellimus_ID INT,
    Toode_ID INT,
    Kogus INT,
    PRIMARY KEY (Tellimus_ID, Toode_ID) 
);

INSERT INTO TellimuseRead (Tellimus_ID, Toode_ID, Kogus)
VALUES
(1, 10, 11),
(2, 152, 7),
(2, 201, 4);
```
<img width="588" height="491" alt="{34B744D0-F7C1-4C0D-9070-50C273375E67}" src="https://github.com/user-attachments/assets/2b6fd58b-0ec5-465e-8277-76e8fa51eb3b" />


## 6. Superkey

- Relatsioonandmemudelis on supervõti mis tahes atribuutide kogum , mis identifitseerib unikaalselt relatsiooni iga tuupli.
- Kuna supervõtme väärtused on unikaalsed, peavad sama supervõtme väärtusega tuuplitel olema ka samad mitte-võtme atribuudi väärtused. 
- See tähendab, et mitte-võtme atribuudid sõltuvad funktsionaalselt supervõtmest .

```sql
CREATE TABLE Tooted (
    Toode_ID INT,
    Nimi VARCHAR(50),
    Kood VARCHAR(20),
    Hind DECIMAL(10,2)
);

INSERT INTO Tooted (Toode_ID, Nimi, Kood, Hind)
VALUES
(1, 'Telefon', 'T100', 699.99),
(2, 'Tahvelarvuti', 'T200', 899.99),
(3, 'Sülearvuti', 'T300', 1299.99);
```
<img width="505" height="442" alt="{632FBCD7-C2FF-41E2-AD05-35BD664A4E99}" src="https://github.com/user-attachments/assets/f57f1f30-374c-4ed3-a698-b38b6ae30f83" />

## 7. Alternate Key 

- Alternatiivvõti on kandidaatvõti, mida ei valita primaarvõtmeks, kuid mis suudab siiski tabeli kirjet unikaalselt tuvastada.

```sql
CREATE TABLE Kliendid (
    Kliendi_ID INT,
    Isikukood VARCHAR(20),
    Nimi VARCHAR(50),
    Telefon VARCHAR(20),
    PRIMARY KEY (Kliendi_ID),
    UNIQUE (Isikukood)
);

INSERT INTO Kliendid (Kliendi_ID, Isikukood, Nimi, Telefon)
VALUES
(1, '39101010001', 'Mari Maasikas', '55512345'),
(2, '38805050002', 'Jaan Tamm', '55567890'),
(3, '39912120003', 'Kati Kask', '55511122');
```
<img width="612" height="454" alt="{2CFC5DC2-C652-4D4C-8F49-D0524E6916C6}" src="https://github.com/user-attachments/assets/4e4c3e02-cde2-44d0-a7ff-b5064e9156cf" />


## Allikad
1. <https://ru.wikipedia.org/wiki/%D0%9F%D0%B5%D1%80%D0%B2%D0%B8%D1%87%D0%BD%D1%8B%D0%B9_%D0%BA%D0%BB%D1%8E%D1%87>
2. <https://metanit.com/sql/mysql/2.5.php>
3. <https://ru.wikipedia.org/wiki/%D0%A3%D0%BD%D0%B8%D0%BA%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9_%D0%BA%D0%BB%D1%8E%D1%87>
4. <https://otus.ru/journal/kljuchi-v-sql-tablicah/#:~:text=%D0%9F%D1%80%D0%BE%D1%81%D1%82%D0%BE%D0%B9%20%D0%BA%D0%BB%D1%8E%D1%87%20%E2%80%93%20%D1%8D%D1%82%D0%BE%20%D1%83%D0%BD%D0%B8%D0%BA%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D0%B8%D0%B4%D0%B5%D0%BD%D1%82%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%82%D0%BE%D1%80,%D0%BD%D0%B0%D0%B7%D1%8B%D0%B2%D0%B0%D0%B5%D1%82%D1%81%D1%8F%20%D0%BA%D0%BE%D0%BC%D0%BF%D0%BE%D0%B7%D0%B8%D1%82%D0%BD%D1%8B%D0%BC%20(composite%20key).>
5. <https://www.geeksforgeeks.org/sql/composite-key-in-sql/>
6. <https://en.wikipedia.org/wiki/Superkey>
7. <https://www.geeksforgeeks.org/sql/sql-alternate-key/>
