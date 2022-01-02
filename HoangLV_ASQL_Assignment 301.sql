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
CREATE TABLE [dbo].[Employee](
	[EmpNo] [int] NOT NULL
,	[EmpName] [nchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
,	[BirthDay] [datetime] NOT NULL
,	[DeptNo] [int] NOT NULL
, 	[MgrNo] [int]
,	[StartDate] [datetime] NOT NULL
,	[Salary] [money] NOT NULL
,	[Status] [int] NOT NULL
,	[Note] [nchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
,	[Level] [int] NOT NULL
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
CREATE TABLE [dbo].[Skill](
	[SkillNo] [int] IDENTITY(1,1) NOT NULL
,	[SkillName] [nchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
,	[Note] [nchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
ALTER TABLE Skill
ADD CONSTRAINT PK_Skill PRIMARY KEY (SkillNo)

GO
CREATE TABLE [dbo].[Department](
	[DeptNo] [int] IDENTITY(1,1) NOT NULL
,	[DeptName] [nchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
,	[Note] [nchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
ALTER TABLE Department
ADD CONSTRAINT PK_Dept PRIMARY KEY (DeptNo)

GO
CREATE TABLE [dbo].[Emp_Skill](
	[SkillNo] [int] NOT NULL
,	[EmpNo] [int] NOT NULL
,	[SkillLevel] [int] NOT NULL
,	[RegDate] [datetime] NOT NULL
,	[Description] [nchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
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

--1 Add at least 8 records into each created tables.
USE [EMS]
GO

INSERT INTO [dbo].[Skill] ([SkillName],[Note])
     VALUES
           ('C#','Microsoft'),
		   ('Java','Sun'),
		   ('Python','abcdefgh'),
		   ('Visual Basic','Microsoft'),
		   ('Ruby','Microsoft'),
		   ('Kotlin','Microsoft'),
		   ('Javascript','Microsoft'),
		   ('.NET','Microsoft'),
		   ('C++','Microsoft')
GO

INSERT INTO [dbo].[Department]
           ([DeptName]
           ,[Note])
     VALUES
           ('IT Support','something'),
		   ('Security','something'),
		   ('Marketing','something'),
		   ('Human resource','something'),
		   ('Clown God','something'),
		   ('Super idol','something'),
		   ('Yasuo 15GG','something'),
		   ('7 Ngoai binh','something')
GO

INSERT INTO [dbo].[Employee] ([EmpNo],[EmpName],[BirthDay],[DeptNo],[MgrNo],[StartDate],[Salary],[Status],[Note],[Level],[Email])
     VALUES
		   (1,'Nguyen Van A', CAST('1999-07-07' AS DateTime), 1, 200, CAST('2021-12-28' AS DateTime), 1000, 0,'abc', 1,'oop@gmail.com'),
           (200,'Nguyen Van N', CAST('1999-07-07' AS DateTime), 1, 200, CAST('2021-2-28' AS DateTime), 1000, 0,'abc', 1,'kdd@gmail.com'),
		   (2,'Nguyen Van B', CAST('1999-07-07' AS DateTime), 1, 200, CAST('2021-5-28' AS DateTime), 1000, 0,'abc', 1,'bcd@gmail.com'),
		   (3,'Nguyen Thi C', CAST('1999-07-07' AS DateTime), 2, 4, CAST('2018-12-28' AS DateTime), 1000, 0,'abc', 1,'vcl@gmail.com'),
		   (4,'Le Van E', CAST('1999-07-07' AS DateTime), 2, 4, CAST('2018-12-28' AS DateTime), 1000, 0,'abc', 1,'abc@gmail.com'),
		   (5,'Tran Van G', CAST('1999-07-07' AS DateTime), 3, 6, CAST('2017-12-28' AS DateTime), 1000, 0,'abc', 1,'15gg@gmail.com'),
		   (6,'Phan Van A', CAST('1999-07-07' AS DateTime), 3, 6, CAST('2016-12-28' AS DateTime), 1000, 0,'abc', 1,'yasuo@gmail.com'),
		   (7,'Dinh Thi A', CAST('1999-07-07' AS DateTime), 4, 9, CAST('2021-12-28' AS DateTime), 1000, 0,'abc', 1,'aaa@gmail.com'),
		   (9,'Bui Dinh Z', CAST('1999-07-07' AS DateTime), 4, 9, CAST('2020-12-28' AS DateTime), 1000, 0,'abc', 1,'zzz@gmail.com'),
		   (18,'Nguyen Van D', CAST('1999-07-07' AS DateTime), 4, 9, CAST('2018-12-28' AS DateTime), 1000, 0,'abc', 1,'ccc@gmail.com'),
		   (100,'Nguyen Van K', CAST('1999-07-07' AS DateTime), 5, 100, CAST('2020-12-28' AS DateTime), 1000, 0,'abc', 1,'ffff@gmail.com')
GO


INSERT INTO [dbo].[Emp_Skill] ([SkillNo],[EmpNo],[SkillLevel],[RegDate])
     VALUES
           (1,2,1,CAST('2021-12-28' AS DateTime)),
		   (1,3,1,CAST('2020-12-28' AS DateTime)),
		   (9,4,1,CAST('2017-12-28' AS DateTime)),
		   (2,1,1,CAST('2018-12-28' AS DateTime)),
		   (2,2,1,CAST('2019-12-28' AS DateTime)),
		   (2,18,1,CAST('2020-12-28' AS DateTime)),
		   (8,7,1,CAST('2019-12-28' AS DateTime)),
		   (4,1,1,CAST('2018-12-28' AS DateTime)),
		   (8,6,1,CAST('2017-12-28' AS DateTime)),
		   (9,6,1,CAST('2016-12-28' AS DateTime))
GO

--2 Specify the name, email and department name of the employees that have been working at least six months.
SELECT e.[EmpName],e.[Email],d.[DeptName]
FROM [Employee] e RIGHT JOIN [Department] d on e.DeptNo = d.DeptNo
WHERE DATEDIFF(month, [StartDate] , GETDATE()) >= 6
GO

--3 Specify the names of the employees who have either ‘C++’ or ‘.NET’ skills.
SELECT [EmpName]
FROM Employee
WHERE [EmpNo] IN (
	SELECT es.[EmpNo]
	FROM [Emp_Skill] es LEFT JOIN [Skill] s on es.[SkillNo] = s.[SkillNo]
	WHERE s.[SkillName] = 'C++' or s.[SkillName] = '.NET'
	GROUP BY es.[EmpNo]
)

--4 List all employee names, manager names, manager emails of those employees.
SELECT e1.[EmpName],e2.[EmpName] as manager_name, e2.[Email] as manager_email
FROM [Employee] e1 INNER JOIN [Employee] e2 on e1.[MgrNo] = e2.[EmpNo] 
ORDER BY e1.[MgrNo]
GO

--5 Specify the departments which have >=2 employees, print out the list of departments’ employees right after each department.
SELECT d.[DeptName], COUNT(*) as Number_Emp
FROM [Department] d LEFT JOIN [Employee] e on d.[DeptNo] = e.[DeptNo]
GROUP BY d.[DeptName]
HAVING COUNT(*)>=2
GO

--6 List all name, email and number of skills of the employees and sort ascending order by employee’s name.
SELECT e.EmpName,e.Email,COUNT(*) as NumSkills
FROM Employee e LEFT JOIN Emp_Skill es on e.EmpNo = es.EmpNo
GROUP BY e.EmpNo,e.EmpName,e.Email
ORDER BY e.EmpName
GO

--7 Use SUB-QUERY technique to list out the different employees (include name, email, birthday) who are working and have multiple skills.

SELECT EmpName,Email,BirthDay
FROM Employee
WHERE EmpNo in (
	SELECT EmpNo
	FROM Emp_Skill
	GROUP BY Emp_Skill.EmpNo
	HAVING COUNT(*)>1
) AND [Status] = 0
GO

--8 Create a view to list all employees are working (include: name of employee and skill name, department name).
CREATE VIEW ALL_EMP_WORKING
AS
SELECT EmpName, SkillName, DeptName
FROM Employee e INNER JOIN Emp_Skill es ON e.EmpNo = es.EmpNo
				INNER JOIN Skill s ON s.SkillNo = es.SkillNo
				INNER JOIN Department d on e.DeptNo = d.DeptNo
WHERE [Status] = 0








