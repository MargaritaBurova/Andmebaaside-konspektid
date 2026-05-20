create database uusProtsedur;

use uusProtsedur;

CREATE TABLE room(
    roomID INT PRIMARY KEY IDENTITY(1,1),
    room_name VARCHAR(30),
    status VARCHAR(20),
    roomType VARCHAR(30)
);



INSERT INTO room(room_name, status, roomType)
VALUES('Blue Room', 'Free', 'Standard'),
('VIP Room', 'Occupied', 'VIP');

SELECT * FROM room;


CREATE PROCEDURE lisaRoom
@uusRoom VARCHAR(30),
@staatus VARCHAR(20),
@type VARCHAR(30)
AS
BEGIN

    INSERT INTO room(room_name, status, roomType)
    VALUES (@uusRoom, @staatus, @type);

    SELECT * FROM room;

END

-- kutse
EXEC lisaRoom 'Green Room', 'Free', 'Standard';
EXEC lisaRoom 'VIP2 room ','Free', 'VIP';


create procedure kustutaRoom
@kustutaID int
AS
BEGIN
	SELECT * FROM room;
	delete from room WHERE roomID=@kustutaID;
	SELECT * FROM room;
END

--kutse

EXEC kustutaRoom 3

CREATE PROCEDURE otsingRoom
@taht char(1)
AS
BEGIN
	SELECT * FROM room WHERE room_name LIKE @taht + '%'; --% -teised sümboolid

END

--kutse
EXEC otsingRoom 'V';


ALTER TABLE room ADD praisRoom MONEY;
SELECT * FROM room;

update room set praisRoom=100 WHERE roomID=1
update room set praisRoom=600 WHERE roomID=2
update room set praisRoom=1200 WHERE roomID=4

SELECT * FROM room;


CREATE PROCEDURE minmaxpriceRoom
    @minPrice MONEY OUTPUT,
    @maxPrice MONEY OUTPUT
AS
BEGIN

    SELECT
        @minPrice = MIN(praisRoom),
        @maxPrice = MAX(praisRoom)
    FROM room;

END;

-- kutse
DECLARE @minPrice MONEY, @maxPrice MONEY;

EXEC minmaxpriceRoom @minPrice OUTPUT, @maxPrice OUTPUT;

PRINT 'Min hind = ' + CONVERT(VARCHAR, @minPrice);
PRINT 'Max hind = ' + CONVERT(VARCHAR, @maxPrice);


CREATE PROCEDURE muudatusRoom
    @tegevus VARCHAR(10),
    @tabelinimi VARCHAR(25),
    @veerunimi VARCHAR(25),
    @tyyp VARCHAR(25)=NULL
AS
BEGIN

    DECLARE @sqltegevus VARCHAR(MAX);

    SET @sqltegevus = CASE
        WHEN @tegevus='add' THEN
            CONCAT('ALTER TABLE ', @tabelinimi,
            ' ADD ', @veerunimi, ' ', @tyyp)

        WHEN @tegevus='drop' THEN
            CONCAT('ALTER TABLE ', @tabelinimi,
            ' DROP COLUMN ', @veerunimi)
END;

    PRINT @sqltegevus;
    EXEC(@sqltegevus);

END;

-- kutse
EXEC muudatusRoom 'add', 'room', 'testVeerg', 'INT';
SELECT * FROM room;

EXEC muudatusRoom 'drop', 'room', 'testVeerg';
SELECT * FROM room;


CREATE PROCEDURE kuvaRoomHinnang
AS
BEGIN
    SELECT 
        room_name,
        praisRoom,
        CASE 
            WHEN praisRoom <=150 THEN 'madal hind'
            ELSE 'kõrge hind'
        END AS hinnang
    FROM room
END;

-- KUTSE
EXEC kuvaRoomHinnang
