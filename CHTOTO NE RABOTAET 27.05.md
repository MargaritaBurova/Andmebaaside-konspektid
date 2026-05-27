```sql 
create database retseptiRaamatmargo;

use retseptiRaamatmargo;
-- kasutaja
create table kasutaja(
kasutajaID int Primary key identity(1,1),
eesnimi varchar(50),
perenimi varchar(50) not null,
email varchar(150));

insert into kasutaja(eesnimi,perenimi,email)
values('Andrey','Mets','mets@tink.ee');

select * from kasutaja;
-- kategooria
create table kategooria(
kategooriaID int Primary key identity(1,1),
kategooriaNimi varchar(50));

insert into kategooria(kategooriaNimi)
values('Magustoit');
select * from kategooria;

-- toiduaine
create table toiduaine(
toiduaineID int Primary key identity(1,1),
toiduaineNimi varchar(100));

insert into toiduaine(toiduaineNimi)
values('Punane Sametkook');
select * from toiduaine;

-- ühik
create table yhik(
yhikID int Primary key identity(1,1),
yhikNimi varchar(100));

insert into yhik(yhikNimi)
values('l');
select * from yhik;

-- retsept
create table retsept(
retseptID int Primary key identity(1,1),
retseptiNimi varchar(100),
kirjeldus varchar(200),
juhend varchar(500),
sisestatudKP date,

kasutajaID int,
kategooriaID int,

foreign key (kasutajaID)
references kasutaja(kasutajaID),

foreign key (kategooriaID)
references kategooria(kategooriaID));

insert into retsept(retseptiNimi,kirjeldus,juhend,sisestatudKP,kasutajaID,kategooriaID)
values('Punane Sametkook','Magus kook','Võta kefiir, kakao, koor ja punane toiduvärv','2026-05-27',5,5);
select * from retsept;

-- tehtud
create table tehtud(
tehtudID int Primary key identity(1,1),
tehtudKP date,
retseptID int,


foreign key (retseptID)
references retsept(retseptID));

insert into tehtud(tehtudKP,retseptID)
values('2026-05-29',6);
select * from tehtud;

-- hinnang
create table Hinnang(
HinnangID int Primary key identity(1,1),
hinnang int,
komentaar varchar(200),
retseptID int,

foreign key (retseptID)
references retsept(retseptID));

insert into Hinnang(hinnang,komentaar,retseptID)
values(5,'See oli väga maitsev',7);

select * from Hinnang;



-- protsedurid 

-- lisakasutaja

create procedure lisakasutajaa
    @eesnimi varchar(50),
    @perenimi varchar(50),
    @email varchar(150)
as
begin
    insert into kasutaja (eesnimi, perenimi, email)
    values(@eesnimi, @perenimi, @email)
end;
exec lisakasutajaa 'Roman','Kask','roman@mail.ee';

select * from kasutaja;

-- lisahinnang
create procedure lisahinnang
    @hinnangName int,
    @komentaar varchar(200),
    @retseptID int
as
begin
    insert into hinnang (hinnang, komentaar, retseptID)
    values(@hinnangName, @komentaar, @retseptID)
end;
exec lisahinnang 1,'Väga maitsev',7;

select * from Hinnang;
```
