[hotellburova.sql](https://github.com/user-attachments/files/27234925/hotellburova.sql)## Andmebaas Hotelliruumi reserverimine
CTRL + E
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

```sql
--2 reservation
CREATE TABLE reservation(
reservationID int PRIMARY KEY identity(1,1),
date_in DATE,
date_out DATE,
made_by varchar(20),
guestID int, 
FOREIGN KEY (guestID) REFERENCES guest(guestID));

SELECT * FROM reservation;

INSERT INTO reservation
```
<img width="373" height="92" alt="{877E7461-32F8-4823-A126-D0C1E25120ED}" src="https://github.com/user-attachments/assets/1d1e2b3f-2e8c-4a1a-931b-63d82974dc48" />

```sql
--3 room type
CREATE TABLE room_type(
room_typeID int primary key identity(1,1),
description varchar(80),
max_capacity int
);

SELECT * FROM room_type;

INSERT INTO room_type
```
<img width="270" height="103" alt="{D87CA787-AE4B-4FE7-9ED7-86D6069A579A}" src="https://github.com/user-attachments/assets/e231ddb0-f82c-4974-9d9c-f48349d1b626" />


```sql
--4 room
CREATE TABLE room(
roomID int primary key identity (1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke bit,
room_typeID int,
FOREIGN KEY (room_typeID) REFERENCES room_type(room_typeID)
);

SELECT * FROM room;

INSERT INTO room
```
<img width="364" height="83" alt="{E1F31767-FE17-4350-8D43-E76C48049457}" src="https://github.com/user-attachments/assets/84fe7e60-b765-4d1e-8b75-3e2e4a732db7" />

```sql
--5 reserved room
CREATE TABLE reserved_room(
reserved_roomID int primary key identity(1,1),
number_of_rooms int,
room_typeID int,
foreign key (room_typeID) references room_type(room_typeID),
reservationID int,
foreign key (reservationID) references reservation(reservationID),
status varchar(20)
);

SELECT * FROM reserved_room;
SELECT * FROM room_type;
SELECT * FROM reservation;

INSERT INTO reserved_room
```
<img width="444" height="103" alt="{B5EA28E6-5A1C-45FE-A078-D29C40C16BFE}" src="https://github.com/user-attachments/assets/06363e76-6811-4a87-98ee-9557e300470d" />

```sql
--6 occuped room
CREATE TABLE occupied_room(
occupied_roomID int primary key identity(1,1),
check_in date,
check_out date,
roomID int,
foreign key (roomID) references room(roomID),
reservationID int
foreign key (reservationID) references reservation(reservationID)
);

SELECT * FROM occupied_room;
SELECT * FROM reservation;
SELECT * FROM room;

INSERT INTO occupied_room
```
<img width="420" height="101" alt="{C093DEA9-FD42-4F7B-954F-7963D9D9DAF1}" src="https://github.com/user-attachments/assets/8995d094-613f-4174-9dce-d70772aaad47" />

```sql
-- 7 hosted_at

CREATE TABLE hosted_at(
hosted_atID int primary key identity(1,1),
guestID int,
foreign key (guestID) references guest(guestID),
occupied_roomID int,
foreign key (occupied_roomID) references occupied_room(occupied_roomID)
);

SELECT * FROM hosted_at;
SELECT * FROM guest;
SELECT * FROM occupied_room;
```
<img width="267" height="95" alt="{69027649-6833-4B2B-B9B4-D470CB2917D8}" src="https://github.com/user-attachments/assets/5828c0d1-729a-4d99-8e81-e8f975e470bf" />


