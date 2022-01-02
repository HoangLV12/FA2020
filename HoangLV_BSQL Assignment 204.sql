--BSQL Assignment 204

CREATE DATABASE MVIE
GO

USE MVIE
--Q1
--1.create table movie
CREATE TABLE [Movie](
	[id] INT IDENTITY(1,1) PRIMARY KEY,
	[name] NVARCHAR(50) NOT NULL,
	[duration] FLOAT CHECK([duration]>=1),
	[genre] INT CHECK([genre]>=1 AND [genre]<=8),
	[director] NVARCHAR(50),
	[profit] MONEY,
	[comments] NVARCHAR(MAX)
)
GO

--2.create table Actor
CREATE TABLE [Actor](
	[id] INT PRIMARY KEY,
	[name] NVARCHAR(50) NOT NULL,
	[age] INT,
	[salary] MONEY,
	[nationality] NVARCHAR(MAX)
)
GO

--3.create table ActedIn
CREATE TABLE [ActedIn](
	[actor_id] INT FOREIGN KEY REFERENCES [Actor]([id]),
	[movie_id] INT FOREIGN KEY REFERENCES [Movie]([id]),
	[role_name] NVARCHAR(50) NOT NULL
)
GO

--Q2
--1.add image link field
ALTER TABLE [Movie]
ADD [image_link] NVARCHAR(200) NOT NULL;
GO
--add constraint
ALTER TABLE [Movie]
ADD CONSTRAINT UC_movieLink UNIQUE ([image_link]);
GO

--2 poulate data
USE [MVIE]
GO

INSERT INTO [dbo].[Movie] ([name],[duration],[genre],[director] ,[profit] ,[comments],[image_link])
VALUES('Iron Man 1',2.1,1,'Jon Favreau',356789,'good','https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.j%2Ftag%2Firon2F&psig=AOvVaw3izifCNH45iB6BOLr&ust=1640859093487000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCOiWzs3iiPUCFQAAAAAdAAAAABAJ');
INSERT INTO [dbo].[Movie] ([name],[duration],[genre],[director] ,[profit] ,[comments],[image_link])
VALUES('Iron Man 2',1.2,2,'Jon Favreau',456789,'good','https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.joblon%2Fposters%2F&psiifkaAjsCNH45iB6BOLr&ust=1640859093487000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCOiWzs3iiPUCFQAAAAAdAAAAABAJ');
INSERT INTO [dbo].[Movie] ([name],[duration],[genre],[director] ,[profit] ,[comments],[image_link])
VALUES('Iron Man 3',2,3,'Jon Favreau',2345789,'good','https://www.google.com/url?s-man%2Fposters%2F&psig=AOvVaw3i093487000&source=images&jRxqFwoTCOiWzs3iiPUCFQAAAAAdAAAAABAJ');
INSERT INTO [dbo].[Movie] ([name],[duration],[genre],[director] ,[profit] ,[comments],[image_link])
VALUES('Kings Man',2.6,4,'Matthew Vaughn',3456789,'good','https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.joblo.com%2Ftag%2Fir=AOvVaw3izifkaAjsCNH45iB6BOLr&ust=1640859093487000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCOiWzs3iiPUCFQAAAAAdAAAAABAJ')
INSERT INTO [dbo].[Movie] ([name],[duration],[genre],[director] ,[profit] ,[comments],[image_link])
VALUES('Captain Marvel',3,1,'Joe Johnston',236789,'good','https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.n-man%2Fposters%2F&psig=AOkaAjsCNH45iB6BOLr&ust=1640859093487000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCOiWzs3iiPUCFQAAAAAdAAAAABAJ');
GO

USE [MVIE]
GO

INSERT INTO [dbo].[Actor] ([id],[name],[age],[salary],[nationality])
VALUES (1,'Scarlett Johansson',62,50000,'Ameriaca')
INSERT INTO [dbo].[Actor] ([id],[name],[age],[salary],[nationality])
VALUES (2,'Robert Downey Jr.',55,50000,'UK')
INSERT INTO [dbo].[Actor] ([id],[name],[age],[salary],[nationality])
VALUES (3,'Chris Hemsworth',50,500000,'Vietnam')
INSERT INTO [dbo].[Actor] ([id],[name],[age],[salary],[nationality])
VALUES (4,'Chris Evans',45,15000,'China')
INSERT INTO [dbo].[Actor] ([id],[name],[age],[salary],[nationality])
VALUES (5,'Tom Hiddleston',35,51000,'Japan')
INSERT INTO [dbo].[Actor] ([id],[name],[age],[salary],[nationality])
VALUES (6,'Samuel L. Jackson',30,50000,'Ameriaca')
INSERT INTO [dbo].[Actor] ([id],[name],[age],[salary],[nationality])
VALUES (7,'Stan Lee sin',96,50000,'Ameriaca')
GO

USE [MVIE]
GO

INSERT INTO [dbo].[ActedIn]([actor_id],[movie_id],[role_name])
VALUES(1,2,'Black Widow')
INSERT INTO [dbo].[ActedIn]([actor_id],[movie_id],[role_name])
VALUES(1,3,'CEO')
INSERT INTO [dbo].[ActedIn]([actor_id],[movie_id],[role_name])
VALUES(4,2,'Captain')
INSERT INTO [dbo].[ActedIn]([actor_id],[movie_id],[role_name])
VALUES(2,2,'Iron man')
INSERT INTO [dbo].[ActedIn]([actor_id],[movie_id],[role_name])
VALUES(3,3,'role 2')
INSERT INTO [dbo].[ActedIn]([actor_id],[movie_id],[role_name])
VALUES(5,2,'role 1')
INSERT INTO [dbo].[ActedIn]([actor_id],[movie_id],[role_name])
VALUES(1,4,'Black Widow1')
INSERT INTO [dbo].[ActedIn]([actor_id],[movie_id],[role_name])
VALUES(1,5,'CEO1')
GO

--update data actor table
UPDATE Actor
SET [name] = 'Stan Lee'
WHERE [id]=7
GO

--Q3
--1
SELECT * 
FROM [actor] a 
WHERE a.[age] >=50;
GO

--2
SELECT a.[name],a.[salary]
FROM [actor] a 
ORDER BY a.[salary]
GO

--3
SELECT m.[name]
FROM [ActedIn] ai LEFT JOIN [Movie] m on ai.[movie_id] = m.[id] 
WHERE ai.[actor_id] in
	(
	SELECT a.[id] 
	FROM [Actor]a 
	WHERE a.[name] = 'Scarlett Johansson'
	) --get id of actor mentioned
GO

--4
SELECT m.[name], COUNT(*) as Number_Actor
FROM [ActedIn] ai LEFT JOIN [Movie] m on ai.[movie_id] = m.[id]
GROUP BY m.[name]
HAVING COUNT(*) >= 3
