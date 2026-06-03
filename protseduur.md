## SQL Protseduurid 
- store procedure - salvestatud protseduurid - хранимые процедуры
- sama nagu funktsioonid programmeerimises - mingid tegevused mis käivitakse automaatselt protseduuri kasutamisel.

```sql
--protseduur, mis lisab uus guest ja kuvab tabeli
CREATE PROCEDURE lisaGuest
--@parameetrid
@uusNimi varchar(25),
@uusPerenimi varchar(30),
@kuupaev date
AS 
BEGIN
--protseduuri sisu
	INSERT INTO guest(firstname, lastname, memberSinace)
	VALUES (@uusNimi, @uusPerenimi, @kuupaev);
	SELECT * FROM guest;
END
```
<img width="146" height="141" alt="{B2621A8F-EF6A-44B3-80DB-C7093E8DBF1B}" src="https://github.com/user-attachments/assets/95c0b31f-5ae1-467b-bdb8-450c11fd4f63" />


<img width="702" height="494" alt="{3B8E59F2-5D05-4884-8033-E1305ACECFD2}" src="https://github.com/user-attachments/assets/e2b6049a-9f7d-4821-84e1-135e2940fd13" />

<img width="554" height="472" alt="{FF61BEA7-7417-4E77-B628-EA38D9CE8EBD}" src="https://github.com/user-attachments/assets/c6179d0b-13ad-45de-bd7e-74793e837c45" />

```sql
--protseduur, mis kustutab guest id järgi
CREATE PROCEDURE kustutaGuest
@kustutaId int 
AS
BEGIN
	SELECT * FROM guest;
	DELETE FROM guest WHERE guestID=@kustutaId;
	SELECT * FROM guest;
END 

EXEC kustutaGuest 1;
```

```sql
--otsing esimese tähe järgi
CREATE PROCEDURE otsing1taht
@taht char(1)
AS 
BEGIN 
	SELECT * FROM guest WHERE firstname LIKE @taht + '%'; --% - teised sümboolid
END

EXEC otsing1taht 'S';
```

<img width="900" height="469" alt="{E7F9D05A-4A5D-48A1-BCA2-B6821250935D}" src="https://github.com/user-attachments/assets/0de46a05-1164-4959-8d7a-6a78fc5be7e3" />



```sql
ALTER TABLE guest ADD arveSumma money;
SELECT * FROM guest 

Update guest set arveSumma=2000 WHERE guestId=2

```
<img width="552" height="440" alt="{57603696-69BC-4B27-944C-CBF95B0F25CE}" src="https://github.com/user-attachments/assets/fa817b7f-1777-4078-a9a3-b8bf02338be1" />

```sql
CREATE PROCEDURE minmaxArve
    @minArve MONEY OUTPUT,
    @maxArve MONEY OUTPUT
AS
BEGIN
    SELECT 
        @minArve = MIN(arveSumma),
        @maxArve = MAX(arveSumma)
    FROM guest;
END;

DECLARE @minArve MONEY, @maxArve MONEY;

EXEC minmaxArve @minArve OUTPUT, @maxArve OUTPUT;

PRINT 'Min arve = ' + CONVERT(varchar, @minArve);
PRINT 'Max arve = ' + CONVERT(varchar, @maxArve);


CREATE PROCEDURE muudatus
    @tegevus varchar(10),
    @tabelinimi varchar(25),
    @veerunimi varchar(25),
    @tyyp varchar(25) = NULL
AS
BEGIN
    DECLARE @sqltegevus varchar(max);

    SET @sqltegevus = CASE 
        WHEN @tegevus = 'add' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' ADD ', @veerunimi, ' ', @tyyp)

        WHEN @tegevus = 'drop' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' DROP COLUMN ', @veerunimi)
    END;

    PRINT @sqltegevus;
    EXEC (@sqltegevus);
END;

--kutse 
EXEC muudatus 'add', 'guest', 'testVeerg', int
SELECT * FROM guest
EXEC muudatus 'drop', 'guest', 'testVeerg'

```
