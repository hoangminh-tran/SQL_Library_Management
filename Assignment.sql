CREATE DATABASE DB_Library_Management

USE DB_Library_Management
-- create table Managers
create table [Managers](
	[ManagerID] char(50) NOT NULL PRIMARY KEY CHECK([ManagerID] like 'MA[0-9][0-9][0-9][0-9][0-9][0-9]'), 
	[Name] nvarchar(100) NOT NULL,
	[DateOfBirth] date NOT NULL check([DateOfBirth] < getDate()),
	[Gender] bit NOT NULL check([Gender] like 1 or [Gender] like 0),
	[Email] char(100) NOT NULL,
	[Phone] char(50), 
	[Password] char (50) NOT NULL
)

--Insert input to Managers
INSERT INTO dbo.Managers(ManagerID, Name, DateOfBirth, Gender, Email, Phone, Password)
VALUES
('MA102819', N'Nguyễn Thanh Tùng', '1990-02-10', 1, 'thanhtung@fpt.edu.com', 1526612771, 'thanhtung123'),
('MA291672', N'Trần Thị Yến ', '1992-12-12', 0, 'yenthi@fpt.edu.com', 18729266621, 'thiyen321'),
('MA145261', N'Hoàng Đức', '1987-05-9', 1, 'hoangduc@fpt.edu.com', 9876251311, 'duc@gmail'),
('MA776622', N'Nguyễn Linh Chi', '1994-4-30', 0, 'linhchi@fpt.edu.com', 88771572991, 'linhchi@hcm123'),
('MA442661', N'Nguyễn Võ Tòng', '1997-07-16', 1, 'tongvonguyen@fpt.edu.com', 17829072612, 'votong9876'),
('MA101982', N'Hoàng Thị Lan', '1998-12-02', 0, 'htlan@fpt.edu.com', 7224612771, 'htlan1998')

--The display infor of table manager
SELECT * FROM dbo.Managers

--create table Students

create table [Students](
	[StudentID] char(50) NOT NULL PRIMARY KEY CHECK([StudentID] like 'FU[0-9][0-9][0-9][0-9][0-9][0-9]'), 
	[Name] nvarchar(100) NOT NULL,
	[DateOfBirth] date NOT NULL check([DateOfBirth] < getDate()),
	[Gender] bit NOT NULL check([Gender] like 1 or [Gender] like 0),
	[Email] char(100) NOT NULL,
	[Phone] char(50), 
	[Password] char (50) NOT NULL
)

--Insert input to Students 
INSERT INTO dbo.Students(StudentID, Name, DateOfBirth, Gender, Email, Phone, Password) 
VALUES
('FU161334', N'Lê Văn Luyện', '2002-04-10', 1, 'lvluyen@fpt.edu.com', 1698212771, '00998877'),
('FU161442', N'Hoàng Văn Bách', '2000-02-22', 1, 'hvbach@fpt.edu.com', 54312632621, 'bachvh111'),
('FU161586', N'Lâm Đức', '1999-05-09', 1, 'duc@fpt.edu.com', 8877651891, 'duc_12300'),
('FU151678', N'Nguyễn Mỹ Anh', '2001-05-20', 0, 'myanh@fpt.edu.com', 4453781211, 'MyAnh321123'),
('FU152588', N'Trần Minh Anh', '2000-03-26', 0, 'minhanhtran@fpt.edu.com', 8800212277, 'minhanh999'),
('FU146882', N'Hoàng Lê Linh', '1999-11-22', 0, 'htlinh@fpt.edu.com', 4784612371, '11221999'),
('FU173852', N'Phát Huy', '2003-01-22', 1, 'huyphat@fpt.edu.com', 665182371, 'huy01222003'),
('FU171835', N'Nhật Hà', '2003-01-22', 0, 'ha@fpt.edu.com', 009911223, 'nhatha2003')

--The display infor of table Students
SELECT * FROM dbo.Students

--create table Book
CREATE TABLE [Book]
(
	[BookID] CHAR(50) PRIMARY KEY NOT NULL,
	[Title] NVARCHAR(100) NOT NULL,
	[Author] NVARCHAR(100) NOT NULL,
	[publication_date] date NOT NULL,
	[Quantity] INT CHECK([Quantity] > 0 AND [Quantity] < 200),
	[Website] CHAR(100),
	[RateOfBook] INT CHECK([RateOfBook] >= 0 AND [RateOfBook] <= 5)
)

--insert input to Book
INSERT INTO dbo.Book(BookID, Title, Author, publication_date, Quantity, Website, RateOfBook) 
VALUES
('BS2008', N'Batman vs Superman', N'Peter', '2008-12-25', 130, 'amazon.com', 4),
('EH1122', N'The Economics of the World', N'Robert Sirico', '2005-12-11', 30, 'amazon.com', 3),
('HA0907', N'Harry Potter', N'J.K.Rowling', '2007-07-14', 22, 'harrypotter.com', 5),
('HM1961', N'Sapiens: A brief History of Humankind', N'Noah Harari', '2015-02-10', 21, 'history.com', 4),
('JM0722', N'Journey into Mystery', N'Patsy Walker', '1961-07-22', 5, 'marvelcomic.com', 4),
('HY2012', N'A Little Life', N'Hanya Yanagihara', '2016-01-26', 15, 'alibaba.com', 4),
('PA7762', N'To Paradise', N'Hanya Yanagihara', '2022-01-11', 10, 'shopee.com', 3),
('IA1616', N'Cambridge Ielts 16 Academic', N'Cambrigde', '2021-09-07', 180, 'ieltsgroup.com', 5)

--The displayment of table Book
SELECT * FROM dbo.Book

-- CREATE TABLE Borrow_Book
CREATE TABLE [Borrow_Book]
(
	[BorrowCode] CHAR(50) NOT NULL PRIMARY KEY CHECK([BorrowCode] like 'BC[0-9][0-9][0-9][0-9][0-9][0-9]'),
	[ManagerID] char(50) NOT NULL CHECK([ManagerID] like 'MA[0-9][0-9][0-9][0-9][0-9][0-9]'), 
	CONSTRAINT FK_Manager_ID FOREIGN KEY([ManagerID]) REFERENCES dbo.Managers([ManagerID]),
	[StudentID] char(50) NOT NULL CHECK([StudentID] like 'FU[0-9][0-9][0-9][0-9][0-9][0-9]'),
	CONSTRAINT FK_Student_ID FOREIGN KEY([StudentID]) REFERENCES dbo.Students([StudentID]),
	date_start DATE NOT NULL
)

--insert input to Borrow_Book
INSERT INTO dbo.Borrow_Book(BorrowCode,  ManagerID,  StudentID,    date_start)
VALUES
('BC000001', 'MA101982', 'FU146882', '2021-05-29'), 
('BC000002', 'MA101982', 'FU151678', '2021-12-20'), 
('BC000003', 'MA102819', 'FU152588', '2022-01-21'), 
('BC000004', 'MA102819', 'FU161334', '2022-01-01'), 
('BC000005', 'MA102819', 'FU161442', '2022-02-26'), 
('BC000006', 'MA291672', 'FU161334', '2020-12-30'), 
('BC000007', 'MA442661', 'FU161442', '2021-04-29'), 
('BC000008', 'MA442661', 'FU171835', '2021-11-30'), 
('BC000009', 'MA291672', 'FU151678', '2021-11-30'), 
('BC000010', 'MA776622', 'FU173852', '2021-11-30') 

--the displayment of table Borrow_Book
SELECT * FROM dbo.Borrow_Book

-- create table Borrow_Book_details

CREATE TABLE [Borrow_Book_details]
(
	[BorrowCode] CHAR(50) NOT NULL CHECK([BorrowCode] like 'BC[0-9][0-9][0-9][0-9][0-9][0-9]'),
	CONSTRAINT FK_BorrowCode FOREIGN KEY([BorrowCode]) REFERENCES dbo.[Borrow_Book]([BorrowCode]),
	[BookID] CHAR(50) NOT NULL,
	CONSTRAINT FK_Book_ID FOREIGN KEY([BookID]) REFERENCES dbo.Book([BookID]),
	[Quantity] INT NOT NULL,
	[Date_end] DATE NOT NULL,
	PRIMARY KEY([BorrowCode], [BookID])
)

--insert input to Borrow_Book_details
INSERT INTO dbo.Borrow_Book_details(BorrowCode,  BookID, Quantity,  Date_end)
VALUES 
('BC000001', 'BS2008', 30, '2021-12-30'),
('BC000001', 'EH1122', 3, '2021-12-30'),
('BC000001', 'HA0907', 1, '2021-12-30'),
('BC000002', 'HM1961', 4, '2022-03-20'),
('BC000003', 'HA0907', 12, '2022-05-11'),
('BC000004', 'PA7762', 9, '2022-04-12'),
('BC000005', 'HM1961', 7, '2022-05-11'),
('BC000005', 'JM0722', 5, '2022-05-11'),
('BC000006', 'IA1616', 12, '2022-06-22'),
('BC000007', 'HY2012', 12, '2022-07-01'),
('BC000007', 'HA0907', 2, '2022-07-01'),
('BC000008', 'EH1122', 3, '2022-08-01'),
('BC000008', 'HM1961', 7, '2022-06-11'),
('BC000010', 'BS2008', 11, '2022-04-24')

SELECT * FROM dbo.Borrow_Book_details
-- create table Book_return

CREATE TABLE [Book_return](
	[BorrowCode]  CHAR(50) NOT NULL CHECK([BorrowCode] like 'BC[0-9][0-9][0-9][0-9][0-9][0-9]')
	CONSTRAINT FK_BorrowCode_BookReturn FOREIGN KEY([BorrowCode]) REFERENCES dbo.[Borrow_Book]([BorrowCode]),
	[return_date] DATE NOT NULL,
	PRIMARY KEY([BorrowCode])
)
--insert input to Book_return

INSERT INTO dbo.Book_return(BorrowCode, return_date)
VALUES
('BC000001',  '2022-02-17'),
('BC000002',  '2022-02-27'),
('BC000003',  '2022-04-22'),
('BC000004',  '2022-04-17'),
('BC000005',  '2022-05-13'),
('BC000006',  '2022-06-06'),
('BC000007',  '2022-02-17'),
('BC000008',  '2022-07-30'),
('BC000009',  '2022-03-17'),
('BC000010',  '2022-03-28')

SELECT * FROM dbo.Book_return

-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
--SQL COMMAND
--A/ SQL ORDER BY Keyword
SELECT * FROM dbo.Students
ORDER BY [StudentID] ASC

--B/ SQL LEFT JOIN Keyword
SELECT BB.BorrowCode, BB.ManagerID, BB.StudentID, BB.date_start, BBd.Date_end, BBd.Quantity
FROM
dbo.Borrow_Book BB LEFT JOIN dbo.Borrow_Book_details BBd ON BBd.BorrowCode = BB.BorrowCode


--C/ QUERY USING AGGREGATE FUNCTIONS
SELECT Br.BorrowCode, COUNT(Br.return_date) AS NumberOfBorrowBookIn2002
FROM dbo.Book_return Br
WHERE YEAR(Br.return_date) = 2022 AND MONTH(Br.return_date) = 5
GROUP BY Br.BorrowCode

--D/ QUERY USING THE GROUP BY AND HAVING CLAUSES 
SELECT bb.StudentID, s.Name AS StudentName, COUNT(bb.BorrowCode) AS StudentBorrowBook
FROM dbo.Borrow_Book  bb JOIN dbo.Students s ON s.StudentID = bb.StudentID
GROUP BY bb.StudentID, s.Name
HAVING COUNT(bb.BorrowCode) = (
		SELECT MAX(B.StudentBorrowBook) FROM(SELECT COUNT(bb.BorrowCode) AS StudentBorrowBook
						FROM dbo.Borrow_Book  bb JOIN dbo.Students s ON s.StudentID = bb.StudentID
						GROUP BY bb.StudentID, s.Name) AS B
)


--E/ QUERY THAT USES A SUB-QUERY AS A RELATION
SELECT b.BookID, b.Title, COUNT(*) AS NumberOfBorrowBook
FROM dbo.Book b JOIN dbo.Borrow_Book_details BBd ON BBd.BookID = b.BookID
GROUP BY b.BookID, b.Title
HAVING COUNT(*) >= 3
ORDER BY b.BookID ASC

--F/ QUERY THAT FIND APPROXIMATE MATCHING IN THE WHERE CLAUSE
SELECT * 
FROM dbo.Students S
WHERE S.Name LIKE 'T%' OR S.Name LIKE 'N%'

--G/STORE PROCEDURE 
--DROP PROC count_Book
CREATE PROC count_Book @BorrowCode CHAR(50), @NumberOfBook int OUTPUT
AS 
BEGIN
	SET @NumberOfBook = (
	SELECT COUNT(*)
	FROM dbo.Borrow_Book_details
	WHERE BorrowCode = @BorrowCode
	GROUP BY BorrowCode
	)
END

DECLARE @x INT
EXEC count_Book 'BC000001', @x OUTPUT
SELECT @x AS totalOfBook

--H/ TRIGGER PROCEDURE
--DROP TRIGGER tr_insert_quantity
CREATE TRIGGER tr_insert_quantity ON Borrow_Book_details  INSTEAD of insert
AS
BEGIN	
		SELECT i.BorrowCode, i.BookID, b.Title, b.Author, i.Quantity, i.Date_end
        FROM inserted i JOIN dbo.Book b ON i.BookID = b.BookID
END

INSERT INTO dbo.Borrow_Book_details(BorrowCode, BookID, Quantity, Date_end)
VALUES ('BC000009','IA1616', 2, '2020-08-01')