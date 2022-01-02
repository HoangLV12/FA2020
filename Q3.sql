--a
alter table Emp_Skill
add constraint FK_Emp_Skill1 foreign key (EmpNo) references Employee(EmpNo)

alter table Emp_Skill
add constraint FK_Emp_Skill2 foreign key (SkillNo) references Skill(SkillNo)

alter table Employee  
add constraint FK_Employee1 foreign key(DeptNo) references Department(DeptNo)

--b
alter table Emp_Skill
drop column Description