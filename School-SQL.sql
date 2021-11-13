CREATE DATABASE SchoolDB

USE SchoolDB

CREATE TABLE Students(
	Id int primary key identity,
	Name nvarchar(100) NOT NULL,
	Surname nvarchar(100),
	Phone nvarchar(50) unique,
	Score int default 50,
	Comment nvarchar(140),
	IsGraduated bit default 0
)

INSERT INTO Students (Name, Surname, Phone)
VALUES('Aslan', 'Muradov', '123456789'),
('Mubariz', 'Muradov', '54556516')
INSERT INTO Students (Name, Surname, Phone, Score)
VALUES('Ehmed', 'Mikayiloglu', '4564653', 100),
('Akif', 'Qasimov', '56123', 80),
('Hesen', 'Rzayev', '54654564', 75),
('Aysel', 'Agazade', 'atasi qoymur', 45),
('Hikmet', 'Demirli', '66465', 30)

UPDATE Students SET Comment = 'Congratulations'
UPDATE Students SET IsGraduated = 1
WHERE Score >= (SELECT AVG(Score) FROM Students)

UPDATE Students SET Comment = 'So Bad'
WHERE Score < (SELECT AVG(Score) FROM Students)

CREATE TABLE GraduatedStudents(
	Id int,
	Name nvarchar(100) NOT NULL,
	Surname nvarchar(100),
	Phone nvarchar(50) unique,
	Score int,
	Comment nvarchar(140) default 'Congratulations',
	IsGraduated bit default 1
)

INSERT INTO GraduatedStudents
SELECT * FROM Students
WHERE IsGraduated = 1

DELETE FROM Students WHERE IsGraduated = 1

SELECT * FROM Students
SELECT * FROM GraduatedStudents
