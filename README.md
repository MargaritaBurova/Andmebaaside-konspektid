# Andmebaasid
andmebaasidega seotud SQL kood ja konspektid
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
  ```
  ```
