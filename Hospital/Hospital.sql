CREATE DATABASE HospitalDB

USE HospitalDB

CREATE TABLE RoomTypes(
	Id int primary key identity,
	Type nvarchar(100)
)

CREATE TABLE Departments(
	Id int primary key identity,
	Name nvarchar(100)
)

CREATE TABLE Rooms(
	Id int primary key identity,
	RoomNo int,
	RoomTypeId int references RoomTypes(Id),
	DepartmentId int references Departments(Id)
)

CREATE TABLE Doctors(
	Id int primary key identity,
	FullName nvarchar(100),
	Age int,
	RoomId int references Rooms(Id)
)

CREATE TABLE Speciallities(
	Id int primary key identity,
	Name nvarchar(100)
)

CREATE TABLE DoctorSpeciallity(
	Id int primary key identity,
	DoctorId int references Doctors(Id),
	SpeciallityId int references Speciallities(Id)
)

CREATE TABLE Insurances(
	Id int primary key identity,
	Name nvarchar(100)
)

CREATE TABLE Pacients(
	Id int primary key identity,
	FullName nvarchar(100),
	RoomId int references Rooms(Id),
	InsuranceId int references Insurances(Id)
)

INSERT INTO RoomTypes VALUES
('A'),('B'),('C'),('D'),('E')

INSERT INTO Departments VALUES
('D001'),('D002'),('D101'),('D102'),('D201'),('D202')

INSERT INTO Rooms VALUES
('101', '1', '2'),('102', '2', '3'),('201', '4', '4'),('202', '3', '2'),('203', '3', '5')

INSERT INTO Speciallities VALUES
('urek'),('beyin'),('burun bogaz'),('dish')

INSERT INTO Insurances VALUES
('X'),('Y'),('Z')

INSERT INTO Doctors VALUES
('Aslan', '26', '1'),('Mubariz', '42', '4'),('Ilkan', '33', '2'),('Fuad', '55', '3')

INSERT INTO DoctorSpeciallity VALUES
('1', '1'),('2', '3'),('3', '4'),('4', '4')

INSERT INTO Pacients VALUES
('Hikmet', '1', '1'),('Akif', '2', '1'),('Hesen', '3', '3'),('Murad', '4', '2')

CREATE VIEW v_PacientInfos
AS
SELECT p.FullName 'Pacient Name', r.RoomNo 'Room No', rt.Type 'Room Type', dp.Name 'Department', d.FullName 'Doctor', s.Name 'Doctor Speciallities', i.Name 'Insurance'
FROM Pacients p
JOIN Rooms r ON p.RoomId = r.Id
JOIN RoomTypes rt ON r.RoomTypeId = rt.Id
JOIN Departments dp ON r.DepartmentId = dp.Id
JOIN Doctors d ON d.RoomId = r.Id
JOIN DoctorSpeciallity ds ON ds.DoctorId = d.Id
JOIN Speciallities s ON ds.SpeciallityId = s.Id
JOIN Insurances i ON p.InsuranceId = i.Id

SELECT * FROM v_PacientInfos