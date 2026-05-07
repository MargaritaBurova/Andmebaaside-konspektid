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
