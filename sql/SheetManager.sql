--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Sheet_Material
CREATE TABLE Sheet_Material (Id INTEGER PRIMARY KEY, DIN VARCHAR (32), CSN VARCHAR (32));

-- Table: Sheet_Shape
CREATE TABLE Sheet_Shape (Id INTEGER PRIMARY KEY ASC ON CONFLICT ROLLBACK AUTOINCREMENT, Name VARCHAR (32), Dimenses INTEGER);

-- Table: Sheet_Types
CREATE TABLE Sheet_Types (Id INTEGER PRIMARY KEY, Name VARCHAR (32), Material REFERENCES Sheet_Material (Id) ON DELETE RESTRICT ON UPDATE RESTRICT, Thickness DOUBLE (11), Surface VARCHAR (32));

-- Table: Sheets
CREATE TABLE Sheets (UID INTEGER PRIMARY KEY, Type REFERENCES Sheet_Types (Id) ON DELETE RESTRICT ON UPDATE RESTRICT, Shape REFERENCES Sheet_Shape (Id) ON DELETE RESTRICT ON UPDATE RESTRICT, A INTEGER, B INTEGER, C INTEGER, D INTEGER, E INTEGER, R INTEGER, HU VARCHAR (32), Drawing VARCHAR (64), Flags INTEGER);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
