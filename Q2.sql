--a
alter table Employee
add Email nchar(30) 

alter table Employee
add constraint chk_Email unique(Email)

--b
alter table Employee
add constraint MgrNo default 0 for MgrNo

alter table Employee
add constraint Df_Status default 0 for Status
