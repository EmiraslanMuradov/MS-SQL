CREATE DATABASE CompanyDB

USE CompanyDB

CREATE TABLE Workers(
Id int,
Name nvarchar(100),
Surname nvarchar(100),
Position nvarchar(100),
Salary int
)

INSERT INTO Workers
VALUES(1, 'Aslan', 'Muradov', 'Programmer', 5000),
(2, 'Ehmed', 'Qasimov', 'Designer', 3000),
(3, 'Asif', 'Veliyev', 'Manager', 8000),
(4, 'Nihad', 'Elesgerli', 'Programmer', 4000),
(5, 'Vusal', 'Seyidzade', 'Designer', 3500)

SELECT AVG(Salary) 'Average Salary' FROM Workers

SELECT CONCAT(Name, ' ', Surname) 'Worker', Salary FROM Workers
WHERE Salary > (SELECT AVG(Salary) FROM Workers)

SELECT MAX(Salary) 'Max Salary', MIN(Salary) 'Min Salary' FROM Workers


