use[DP_Titans]

--set primary key
create table Employee
(id int,
name varchar(20)not null,
constraint pk_emp primary key(id)

)
drop table Employee-- Employee table is deleted

--Foregin key constraints


--drop table Dept
create table Dept
(
did int,
dname varchar(10),
constraint pk_dept primary key(did)
)


create table Employee
(
 id int,
 name varchar(20),
 did int,
 constraint pk_emp primary key(id),
 constraint fk_dept foreign key(did)references Dept(did)
 
)

--Check Constraint
alter table Employee add age int

alter table Employee add constraint ch_age  check(age>=18)
alter table Employee drop constraint ch_age

--to check all table constraint
 exec sp_help Employee

 -- to add in existing table =>Default Constraints

 alter table Employee add addr varchar(20)

 alter table Employee add constraint addr_emp default 'Pune' for addr

 -- index constraint

 create index in_emp on Employee(id)  -- cluster index apply on unique key

 create index in_emp2 on Employee(name)  -- non cluster index

 

