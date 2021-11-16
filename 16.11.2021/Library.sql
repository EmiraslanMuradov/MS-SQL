CREATE DATABASE LibraryDB

USE LibraryDB

CREATE TABLE Authors (
Id int PRIMARY KEY IDENTITY,
Name nvarchar(100),
Surname nvarchar(100),
Nickname nvarchar(100)
)

CREATE TABLE Books (
Id int PRIMARY KEY IDENTITY,
Name nvarchar(100),
PublicationYear nvarchar(10),
EditionNumber nvarchar(20),
BookAuthorId int FOREIGN KEY REFERENCES Authors(Id)
)

CREATE TABLE Types (
Id int PRIMARY KEY IDENTITY,
Type nvarchar(100)
)

CREATE TABLE BookType (
Id int PRIMARY KEY IDENTITY,
BookId int FOREIGN KEY REFERENCES Types(Id),
TypeId int FOREIGN KEY REFERENCES Books(Id)
)

INSERT INTO Authors  VALUES 
('aslan', 'aslan', 'aslan'),
('ehmed', 'ehmed', 'ehmed'),
('vaqif', 'vaqif', 'vaqif'),
('vusal', 'vusal', 'vusal'),
('samir', 'samir', 'samir')

INSERT INTO Books VALUES
('Agac', '2000', '1326', '1'),
('Qasiq', '2010', '5668', '4'),
('Masa', '1998', '15', '2'),
('Telefon', '2018', '3916', '3'),
('Stekan', '2020', '589', '5')

INSERT INTO Types VALUES
('Qorxu'),
('Romantik'),
('Dedektif'),
('Bilim Kurgu'),
('Komedi')

INSERT INTO BookType VALUES
('1', '1'),
('1', '2'),
('2', '1'),
('3', '3'),
('4', '4'),
('5', '5')


SELECT * FROM Authors
SELECT * FROM Books
SELECT * FROM Types
SELECT * FROM BookType

SELECT b.Name 'Book Name',b.PublicationYear 'Publication Year', b.EditionNumber 'Edition Number', a.Name+' '+ a.Surname+' '+ a.Nickname 'Full Name', t.Type 
FROM Books b 
LEFT JOIN Authors a ON b.BookAuthorId = a.Id 
INNER JOIN BookType bt ON bt.BookId = b.Id 
LEFT JOIN Types t ON t.Id = bt.TypeId 


