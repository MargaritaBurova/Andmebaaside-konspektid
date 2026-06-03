## Trigger - triger -päästik
- Andmebaasi objekt, mis automaatselt käivitud tabeli sündmused (INSERT, UPDATE, DELETE).

```sql
create database trigertitpv24;

use trigertitpv24;

--
Create table linnad(
linnID int PRIMARY KEY IDENTITY (1,1),
linnanimi varchar(15) NOT NULL,
rahvaarv int);

 --tabel mis täidab triger
Create table logi(
id int PRIMARY KEY IDENTITY (1,1),
kasutaja varchar (25),
aeg DATETIME,
toiming  varchar(100),
andmed TEXT --triger automatselt lisad mida sekretaar lisas/kustutas tabelisse linnad
)
select * from linnad;
select * from logi;


--Trigger lisatud kirjeid jälgimiseks tabelis “linnad” – INSERT
--Jälgib andmete sisestamine tabelis linnad ja teeb vastava kirje tabelis logi


CREATE TRIGGER linnaLisamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR INSERT
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
SYSTEM_USER,
GETDATE(),  --aeg
'on tehtud INSERT käsk',  --toiming
inserted.linnanimi  --andmed
FROM inserted;

--kontrollimiseks insert into linnad
insert into linnad(linnanimi, rahvaarv)
values('Tartu', 250000);

select * from linnad;
select * from logi;

--trigeri muutmine
alter TRIGGER linnaLisamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR INSERT
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
SYSTEM_USER,
GETDATE(),  --aeg
'on tehtud INSERT käsk',  --toiming
CONCAT('linn: ', inserted.linnanimi, 'rahvaarv', inserted.rahvaarv)  --andmed
FROM inserted;


insert into linnad(linnanimi, rahvaarv)
values('Pärnu', 150000);

select * from linnad;
select * from logi;

```

<img width="626" height="373" alt="{8984065C-74EC-44FB-8B97-06848F1882F5}" src="https://github.com/user-attachments/assets/240b2ecc-e2c1-4c93-8ce4-7397ceb2d300" />

```sql
create TRIGGER linnaKustutamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR delete
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
SYSTEM_USER,
GETDATE(),  --aeg
'on tehtud DELETE käsk',  --toiming
CONCAT('linn: ', deleted.linnanimi, 'rahvaarv', deleted.rahvaarv)  --andmed
FROM deleted;

--kontroll--kustuta tabelist linnad
delete from linnad where linnID=1

select * from linnad;
select * from logi;
```
<img width="722" height="420" alt="{C27F7EE0-6EC7-4544-8985-FCC236E02F46}" src="https://github.com/user-attachments/assets/549f3a1d-0d49-43d7-b50c-819cfc60560f" />

```sql
-- update triger
create TRIGGER linnaUuendamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR update
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
SYSTEM_USER,
GETDATE(),  --aeg
'on tehtud UPDATE käsk',  --toiming
CONCAT('VANAD: linn: ', deleted.linnanimi, 'rahvaarv', deleted.rahvaarv,  --andmed
'||| UUED: linn: ', inserted.linnanimi, 'rahvaarv', inserted.rahvaarv)  --andmed'
FROM deleted INNER JOIN inserted
on deleted.linnID=inserted.linnID;

--kontrollimiseks tuleb uuendada tabeli linn

update linnad SET linnanimi='Pärnu-väike', rahvaarv=500 where linnID=2;

select * from linnad;
select * from logi;
```
<img width="904" height="339" alt="{5ACFC440-AC97-475C-B6BE-C9EFD9F33314}" src="https://github.com/user-attachments/assets/e33bccf8-ae64-466e-b224-288d65b2c414" />

```sql
create TRIGGER linnaLisaKustuta
ON linnad --tabelinimi, mis on vaja jälgida
FOR delete, insert
AS
begin
	INSERT INTO logi(kasutaja, aeg, toiming, andmed)
	SELECT
	SYSTEM_USER,
	GETDATE(),  --aeg
	'on tehtud DELETE käsk',  --toiming
	CONCAT('linn: ', deleted.linnanimi, 'rahvaarv', deleted.rahvaarv)  --andmed
	FROM deleted

	UNION ALL

	SELECT
	SYSTEM_USER,
	GETDATE(),  --aeg
	'on tehtud INSERT käsk',  --toiming
	CONCAT('linn: ', inserted.linnanimi, 'rahvaarv', inserted.rahvaarv)  --andmed
	FROM inserted;

end;

insert into linnad(linnanimi, rahvaarv)
values('Tallinn', 650000);



--kontroll--kustuta tabelist linnad
delete from linnad where linnID=2;

select * from linnad;
select * from logi;

-- kasutaja sekretaarMargarita õigused - lisamine, kustutamine
--ja uuendamine tabelis linnad, ei näe tabeli logi ja ei saa muuta trigerid

grant select, insert, update, delete on linnad to sekretarMargarita;
deny select on logi to sekretarMargarita;

deny alter any database ddl trigger to sekretarMargarita;
```
## XAMPP
<img width="987" height="420" alt="{6578B65B-0334-4B9A-B3FE-C124AC246A2B}" src="https://github.com/user-attachments/assets/bccd8f48-3dd9-43d2-8b53-33f7b41f0aae" />
