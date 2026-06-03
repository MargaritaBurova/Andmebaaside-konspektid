## Primary Key
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
Relatsioonandmemudelis üks relatsiooni kandidaatvõtmetest , mis on valitud primaarvõtmeks (või vaikevõtmeks). 
Kui relatsioonil on ainult üks kandidaatvõti, on see ka primaarvõti. Kui kandidaatvõtit on mitu, valitakse üks primaarvõtmeks ja teisi nimetatakse "alternatiivvõtmeteks".

<img width="323" height="107" alt="{5E64F4ED-FDAC-439D-A56F-882E455E2E49}" src="https://github.com/user-attachments/assets/db212108-72d2-43a5-9ce4-de5c4694cf04" />

## Foreign Key

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

Võõrvõtmed võimaldavad teil luua tabelite vahel seoseid. Võõrvõti luuakse sõltuva, alamtabeli veergude jaoks ja see osutab ühele primaartabeli veergudest. 
Tavaliselt osutab võõrvõti seotud primaartabeli primaarvõtmele.

<img width="408" height="371" alt="{6701E13A-A178-452C-92B3-348B98991908}" src="https://github.com/user-attachments/assets/fcf7e052-d05e-453f-967f-4923d333152c" />


## Unique Key

Relatsioonilistes andmebaasisüsteemides  on unikaalne võti kandidaatvõti , mis ei ole relatsiooni primaarvõti. 
Kõik relatsiooni kandidaatvõtmed saavad relatsiooni kirjeid unikaalselt identifitseerida, kuid ainult ühte neist kasutatakse relatsiooni primaarvõtmena. 
Ülejäänud kandidaatvõtmeid nimetatakse unikaalseteks võtmeteks, kuna need saavad relatsioonis kirje unikaalselt identifitseerida. 
Unikaalsed võtmed võivad koosneda mitmest veerust. Unikaalseid võtmeid nimetatakse ka alternatiivvõtmeteks. 
Unikaalsed võtmed on alternatiiv relatsiooni primaarvõtmele. 
Tavaliselt on unikaalsetel võtmetel UNIQUE piirang.



## Allikad
1. <https://ru.wikipedia.org/wiki/%D0%9F%D0%B5%D1%80%D0%B2%D0%B8%D1%87%D0%BD%D1%8B%D0%B9_%D0%BA%D0%BB%D1%8E%D1%87>
2. <https://metanit.com/sql/mysql/2.5.php>
3. <https://ru.wikipedia.org/wiki/%D0%A3%D0%BD%D0%B8%D0%BA%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9_%D0%BA%D0%BB%D1%8E%D1%87> 
