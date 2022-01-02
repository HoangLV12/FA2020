--a
-- insert Skill tbl
insert into Skill values('Skill Q', 'abc')
insert into Skill values('Skill W', 'def')
insert into Skill values('Skill E', 'ghi')
insert into Skill values('Skill R', 'jkl')
insert into Skill values('Skill D', 'mno')

--insert Department tbl
insert into Department values('Dept1', 'abc')
insert into Department values('Dept2', 'def')
insert into Department values('Dept3', 'ghi')
insert into Department values('Dept4', 'jkl')
insert into Department values('Dept5', 'mno')

--insert Employee tbl
insert into Employee values(1,'A', CAST('1999-07-07' AS DateTime), 1, 0, CAST('2021-12-28' AS DateTime), 1000, 1, 0, N'abc', 'abc@gmail.com')
insert into Employee values(2,'B', CAST('1999-07-07' AS DateTime), 1, 0, CAST('2021-12-28' AS DateTime), 1000, 2, 1, N'abc', 'bcd@gmail.com')
insert into Employee values(3,'C', CAST('1999-07-07' AS DateTime), 1, 0, CAST('2021-12-28' AS DateTime), 1000, 3, 2, N'abc', 'efg@gmail.com')
insert into Employee values(4,'D', CAST('1999-07-07' AS DateTime), 1, 0, CAST('2021-12-28' AS DateTime), 1000, 4, 0, N'abc', 'ijk@gmail.com')
insert into Employee values(5,'E', CAST('1999-07-07' AS DateTime), 1, 0, CAST('2021-12-28' AS DateTime), 1000, 7, 0, N'abc', 'oop@gmail.com')

--insert Emp_Skill
insert into Emp_Skill values(1,1,1,CAST('2021-12-28' AS DateTime))
insert into Emp_Skill values(1,2,2,CAST('2021-12-28' AS DateTime))
insert into Emp_Skill values(3,1,3,CAST('2021-12-28' AS DateTime))
insert into Emp_Skill values(3,5,1,CAST('2021-12-28' AS DateTime))
insert into Emp_Skill values(2,1,2,CAST('2021-12-28' AS DateTime))

--b 
create view EMPLOYEE_TRACKING as
SELECT EmpNo, EmpName, Level
FROM Employee
WHERE Level >=3 and Level <= 5
