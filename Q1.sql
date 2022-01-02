--a Employee tbl
create table Employee(
	EmpNo int NOT NULL primary key
,	EmpName nvarchar(30)
,	BirthDay datetime NOT NULL
,	DeptNo int NOT NULL
, 	MgrNo int NOT NULL
,	StartDate datetime NOT NULL
,	Salary money NOT NULL
,	Level int NOT NULL check((Level=(7) OR Level=(6) OR Level=(5) OR Level=(4) OR Level=(3) OR Level=(2) OR Level=(1)))
,	Status int NOT NULL check((Status=(2) OR Status=(1) OR Status=(0)))
,	Note nchar(100)
)

--b Skill tbl
create table Skill(
	SkillNo int identity(1,1) NOT NULL primary key
,	SkillName nchar(30) NOT NULL
,	Note nchar(100) 
)

--c Department tbl
create table Department(
	DeptNo int identity(1,1) NOT NULL primary key
,	DeptName nchar(30)
,	Note nchar(100)
)

--d EMP_SKILL tbl
create table Emp_Skill(
	SkillNo int NOT NULL
,	EmpNo int NOT NULL
,	SkillLevel int NOT NULL check((SkillLevel=(1) OR SkillLevel=(2) OR SkillLevel=(3)))
,	RegDate datetime NOT NULL
,	Description nchar(100)
)