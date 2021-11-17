CREATE DATABASE SinemaDB

USE SinemaDB

CREATE TABLE Film(
Id int primary key identity,
Name nvarchar(50)
)

CREATE TABLE Janr(
Id int primary key identity,
Janr nvarchar(50)
)

CREATE TABLE Aktor(
Id int primary key identity,
FullName nvarchar(50)
)

CREATE TABLE Zal(
Id int primary key identity,
ZalNo nvarchar(10)
)

CREATE TABLE Seans(
Id int primary key identity,
Seans nvarchar(50)
)

CREATE TABLE Bilet(
Id int primary key identity,
BiletNo int,
FilmId int foreign key references Film(Id),
SeansId int foreign key references Seans(Id),
ZalId int foreign key references Zal(Id)
)

CREATE TABLE Mushteri(
Id int primary key identity,
FullName nvarchar(50),
BiletId int foreign key references Bilet(Id)
)

CREATE TABLE FilmJanr(
Id int primary key identity,
FilmId int foreign key references Film(Id),
JanrId int foreign key references Janr(Id)
)
CREATE TABLE FilmAktor(
Id int primary key identity,
FilmId int foreign key references Film(Id),
AktorId int foreign key references Aktor(Id)
)
CREATE TABLE FilmZal(
Id int primary key identity,
FilmId int foreign key references Film(Id),
ZalId int foreign key references Zal(Id)
)
CREATE TABLE FilmSeans(
Id int primary key identity,
FilmId int foreign key references Film(Id),
SeansId int foreign key references Seans(Id)
)

CREATE VIEW v_BILET
AS
SELECT m.FullName, b.BiletNo, f.Name, s.Seans, z.ZalNo FROM Mushteri m
INNER JOIN Bilet b ON m.BiletId = b.Id
INNER JOIN Film f ON b.FilmId = f.Id
INNER JOIN Seans s ON b.SeansId = s.Id
INNER JOIN Zal z ON b.ZalId = z.Id

SELECT * FROM v_BILET