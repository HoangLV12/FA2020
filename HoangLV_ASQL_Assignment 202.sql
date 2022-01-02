Use MASTER
GO

-- SQL Server Syntax
DROP DATABASE IF EXISTS [EMS];
GO

CREATE DATABASE [EMS]
GO

USE [EMS]
GO
-- Create table Employee, Status = 1: are working
CREATE TABLE [dbo].[Employee]
(
	[EmpNo] [int] NOT NULL
,
	[EmpName] [nchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
,
	[BirthDay] [datetime] NOT NULL
,
	[DeptNo] [int] NOT NULL
,
	[MgrNo] [int]
,
	[StartDate] [datetime] NOT NULL
,
	[Salary] [money] NOT NULL
,
	[Status] [int] NOT NULL
,
	[Note] [nchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
,
	[Level] [int] NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE Employee 
ADD CONSTRAINT PK_Emp PRIMARY KEY (EmpNo)
GO

ALTER TABLE [dbo].[Employee]  
ADD  CONSTRAINT [chk_Level] 
	CHECK  (([Level]=(7) OR [Level]=(6) OR [Level]=(5) OR [Level]=(4) OR [Level]=(3) OR [Level]=(2) OR [Level]=(1)))
GO
ALTER TABLE [dbo].[Employee]  
ADD  CONSTRAINT [chk_Status] 
	CHECK  (([Status]=(2) OR [Status]=(1) OR [Status]=(0)))

GO
ALTER TABLE [dbo].[Employee]
ADD Email NCHAR(30) 
GO

ALTER TABLE [dbo].[Employee]
ADD CONSTRAINT chk_Email CHECK (Email IS NOT NULL)
GO

ALTER TABLE [dbo].[Employee] 
ADD CONSTRAINT chk_Email1 UNIQUE(Email)

GO
ALTER TABLE Employee
ADD CONSTRAINT DF_EmpNo DEFAULT 0 FOR EmpNo

GO
ALTER TABLE Employee
ADD CONSTRAINT DF_Status DEFAULT 0 FOR Status

GO
CREATE TABLE [dbo].[Skill]
(
	[SkillNo] [int] IDENTITY(1,1) NOT NULL
,
	[SkillName] [nchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
,
	[Note] [nchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
ALTER TABLE Skill
ADD CONSTRAINT PK_Skill PRIMARY KEY (SkillNo)

GO
CREATE TABLE [dbo].[Department]
(
	[DeptNo] [int] IDENTITY(1,1) NOT NULL
,
	[DeptName] [nchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
,
	[Note] [nchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
ALTER TABLE Department
ADD CONSTRAINT PK_Dept PRIMARY KEY (DeptNo)

GO
CREATE TABLE [dbo].[Emp_Skill]
(
	[SkillNo] [int] NOT NULL
,
	[EmpNo] [int] NOT NULL
,
	[SkillLevel] [int] NOT NULL
,
	[RegDate] [datetime] NOT NULL
,
	[Description] [nchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
ALTER TABLE Emp_Skill
ADD CONSTRAINT PK_Emp_Skill PRIMARY KEY (SkillNo, EmpNo)
GO

ALTER TABLE Employee  
ADD  CONSTRAINT [FK_1] FOREIGN KEY([DeptNo])
REFERENCES Department (DeptNo)

GO
ALTER TABLE Emp_Skill
ADD CONSTRAINT [FK_2] FOREIGN KEY ([EmpNo])
REFERENCES Employee([EmpNo])

GO
ALTER TABLE Emp_Skill
ADD CONSTRAINT [FK_3] FOREIGN KEY ([SkillNo])
REFERENCES Skill([SkillNo])

GO

--2 Add at least 8 records into each created tables.
USE [EMS]
GO

INSERT INTO [dbo].[Skill]
	([SkillName],[Note])
VALUES
	('C#', 'Microsoft'),
	('Java', 'Sun'),
	('Python', 'abcdefgh'),
	('Visual Basic', 'Microsoft'),
	('Ruby', 'Microsoft'),
	('Kotlin', 'Microsoft'),
	('Javascript', 'Microsoft'),
	('.NET', 'Microsoft'),
	('C++', 'Microsoft')
GO

INSERT INTO [dbo].[Department]
	([DeptName]
	,[Note])
VALUES
	('IT Support', 'something'),
	('Security', 'something'),
	('Marketing', 'something'),
	('Human resource', 'something'),
	('Clown God', 'something'),
	('Super idol', 'something'),
	('Yasuo 15GG', 'something'),
	('7 Ngoai binh', 'something')
GO

INSERT INTO [dbo].[Employee]
	([EmpNo],[EmpName],[BirthDay],[DeptNo],[MgrNo],[StartDate],[Salary],[Status],[Note],[Level],[Email])
VALUES
	(1, 'Nguyen Van A', CAST('1999-07-07' AS DateTime), 1, 200, CAST('2021-12-28' AS DateTime), 2000, 0, 'abc', 1, 'oop@gmail.com'),
	(200, 'Nguyen Van N', CAST('1999-07-07' AS DateTime), 1, 200, CAST('2021-2-28' AS DateTime), 500, 0, 'abc', 1, 'kdd@gmail.com'),
	(2, 'Nguyen Van B', CAST('1999-07-07' AS DateTime), 1, 200, CAST('2021-5-28' AS DateTime), 4000, 0, 'abc', 1, 'bcd@gmail.com'),
	(3, 'Nguyen Thi C', CAST('1999-07-07' AS DateTime), 2, 4, CAST('2018-12-28' AS DateTime), 5000, 0, 'abc', 1, 'vcl@gmail.com'),
	(4, 'Le Van E', CAST('1999-07-07' AS DateTime), 2, 4, CAST('2018-12-28' AS DateTime), 100000, 0, 'abc', 1, 'abc@gmail.com'),
	(5, 'Tran Van G', CAST('1999-07-07' AS DateTime), 3, 6, CAST('2017-12-28' AS DateTime), 600, 0, 'abc', 1, '15gg@gmail.com'),
	(6, 'Phan Van A', CAST('1999-07-07' AS DateTime), 3, 6, CAST('2016-12-28' AS DateTime), 7000, 0, 'abc', 1, 'yasuo@gmail.com'),
	(7, 'Dinh Thi A', CAST('1999-07-07' AS DateTime), 4, 9, CAST('2021-12-28' AS DateTime), 11000, 0, 'abc', 1, 'aaa@gmail.com'),
	(9, 'Bui Dinh Z', CAST('1999-07-07' AS DateTime), 4, 9, CAST('2020-12-28' AS DateTime), 12000, 0, 'abc', 1, 'zzz@gmail.com'),
	(18, 'Nguyen Van D', CAST('1999-07-07' AS DateTime), 4, 9, CAST('2018-12-28' AS DateTime), 65000, 0, 'abc', 1, 'ccc@gmail.com'),
	(100, 'Nguyen Van K', CAST('1999-07-07' AS DateTime), 5, 100, CAST('2020-12-28' AS DateTime), 100000, 0, 'abc', 1, 'ffff@gmail.com')
GO


INSERT INTO [dbo].[Emp_Skill]
	([SkillNo],[EmpNo],[SkillLevel],[RegDate])
VALUES
	(1, 2, 1, CAST('2021-12-28' AS DateTime)),
	(1, 3, 1, CAST('2020-12-28' AS DateTime)),
	(9, 4, 1, CAST('2017-12-28' AS DateTime)),
	(2, 1, 1, CAST('2018-12-28' AS DateTime)),
	(2, 2, 1, CAST('2019-12-28' AS DateTime)),
	(2, 18, 1, CAST('2020-12-28' AS DateTime)),
	(8, 7, 1, CAST('2019-12-28' AS DateTime)),
	(4, 1, 1, CAST('2018-12-28' AS DateTime)),
	(8, 6, 1, CAST('2017-12-28' AS DateTime)),
	(9, 6, 1, CAST('2016-12-28' AS DateTime))
GO
/*
Write a stored procedure (without parameter) to update employee level to 2 of the employees 
that has employee level = 1 and has been working at least three year ago (from starting date). 
Print out the number updated records.
*/
CREATE PROCEDURE LevelUp
AS
-- SET ROWCOUNT 2
UPDATE Employee
SET [Level] = 2
WHERE [Level] = 1 AND DATEDIFF(YEAR,StartDate,GETDATE())>=3
GO

EXEC LevelUp
GO
/*
Write a stored procedure (with EmpNo parameter) to print out employee’s name, employee’s email address 
and department’s name of employee that has been out.
*/
IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE 
	SPECIFIC_NAME = N'Employee_Info'
)
DROP PROCEDURE Employee_Info
GO

CREATE PROCEDURE Employee_Info
	@empNo int
AS
-- body of the stored procedure
DECLARE @EmpName NVARCHAR(50)
DECLARE @Email NVARCHAR(50)
DECLARE @DeptName NVARCHAR(50)
SELECT @EmpName = e.EmpName, @Email = e.Email, @DeptName = d.DeptName
FROM Employee e LEFT JOIN Department d on e.DeptNo = d.DeptNo
WHERE e.EmpNo = @empNo

PRINT 'Name: '+ @EmpName + CHAR(13)+CHAR(10)+
		  'Email: '+ @Email + CHAR(13)+CHAR(10)+
		  'Department: '+ @DeptName
GO


--  execute 
EXECUTE Employee_Info 1
GO


/*
Write a user function named Emp_Tracking (with EmpNo parameter) 
that return the salary of the employee has been working.
*/
CREATE FUNCTION Emp_Tracking ( @EmpNo INT)
RETURNS MONEY
AS
BEGIN
	DECLARE @salary as MONEY
	SELECT @salary = Salary
	FROM Employee
	WHERE EmpNo = @EmpNo
	RETURN @salary

END	
GO


SELECT *
from Employee
GO
PRINT dbo.Emp_Tracking(2)
GO

/*
Write the trigger(s) to prevent the case that the end user to input 
invalid employees information (level = 1 and salary >10.000.000).
*/

CREATE TRIGGER [Insert_Invalid]
ON [Employee]
FOR INSERT
AS
BEGIN
	DECLARE @level INT
	DECLARE @salary MONEY
	SELECT @level = [Level], @salary=[Salary]
	FROM INSERTED
	IF (@level = 1 AND @salary >100000000)
		BEGIN
			PRINT 'Invalid value'
			ROLLBACK
		END
END
GO

USE EMS
GO

INSERT INTO [dbo].[Employee]
	([EmpNo],[EmpName],[BirthDay],[DeptNo],[MgrNo],[StartDate],[Salary],[Status],[Note],[Level],[Email])
VALUES
	(1002, 'Nguyen Van A', CAST('1999-07-07' AS DateTime), 1, 200, CAST('2021-12-28' AS DateTime), 100000011, 0, 'abc', 1, 'bapaa@gmail.com')
GO

SELECT * FROM Employee