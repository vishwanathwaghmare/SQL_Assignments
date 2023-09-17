--JOINS use to combine two or more tables
use[DP_Titans]

------ table name:Dept1--------
drop table Dept1

create table Dept1(did1 int primary key,dname varchar(20))
insert into Dept1(did1,dname)values(101,'HR'),(102,'Admin'),(103,'Development'),(104,'Testing'),(105,'')
--update Dept1 set dname= 'management'
select* from Dept1

---table name: employee----
drop table Employee
create table Employee
(
id int primary key,
name varchar(20) not null,
email varchar(40) unique,
age int check(age>=18),
salary numeric(12,2)
)

select * from Employee  



insert into Employee(id,name,email,age,salary) values(1,'Suraj','suraj@gmail.com',22,25000.45),
                           (2,'Rohan','rohan@gmail.com',23,23400),
						   (3,'','sagar@gmail.com',38,23400),
						   (4,'riya','riya@gmail.com',25,23400),
						   (5,'arya','arya@gmail.com',27,23400),
						   (6,'tanvi','tanvi@gmail.com',30,23400),
						   (7,'soham','soham@gmail.com',35,23400),
						   (8,'shubham','shubhamn@gmail.com',28,23400),
						   (9,'rushi','rushi@gmail.com',40,23400),
						   (10,'vishwa','vish@gmail.com',20,23400),
						    (11,'sandhya','sandhy@gmail.com',40,23400),
							 (12,'aranav','aranav@gmail.com',28,23400),
							  (13,'Divya','divya@gmail.com',29,28400),
							   (14,'sonal','sonal@gmail.com',23,232400),
							    (15,'vrushali','vrushali@gmail.com',21,22400)

select * from Employee



alter table Employee add did1 int
alter table Employee add constraint pk_fk_dept_emp 
foreign key(did1) references Dept1(did1)

update Employee set did1=101 where id in (1,10)
update Employee set did1=102 where id in (2,12)
update Employee set did1=103 where id in (3,4,5,6,7)
update Employee set did1=104 where id in (8,9)
update Employee set did1=105 where id in (10,15)
update Employee set did1=null where id in (1)
--update Employee set did1=null
select * from Employee

-- Inner Join => use to combine 2 or more tables to get matched data from both table
select emp.*,dep.dname 
from Employee emp
inner join Dept1 dep on dep.did1=emp.did1


--Left Join=> display all records from left table and match data from data from right table
select emp.*,dep.dname 
from Employee emp
left join Dept1 dep on dep.did1=emp.did1

-- right joins
select emp.*,dep.dname 
from Employee emp
right join Dept1 dep on dep.did1=emp.did1

--full joins
select emp.*,dep.dname 
from Employee emp
full join Dept1 dep on dep.did1=emp.did1


----------------------------------------------------------------------------------------------

select * from product
create table users
(
 UserId int primary key,
 Uname varchar(20),
 email varchar(25)
)

insert into users(UserId,Uname,email)
            Values(1,'vishwanath','vishwa@gmail.com'),
			       (2,'vihan','vihan@gmail.com'),
				   (3,'pratik','pratik@gmail.com'),
				   (4,'pradnya','pradnya @gmail.com'),
				   (5,'aayush','ayush@gmail.com')
				   select * from users

create table orders
(
 Oid int primary key,
 qty int ,
 UserId int,
 Pid int
 foreign key(Pid)references product(Pid),
 foreign key (UserId) references users(UserId)

)
insert into orders (Oid,qty,UserId,Pid)
            Values(201,10,1,101),
			      (202,5,2,102),
				  (203,15,3,103),
				  (204,12,4,104),
				  (205,8,5,105)
select * from orders


select o.Oid,o.Pid,p.Pname,p.Price,p.Company,u.Uname
from orders o
inner join product p on p.Pid=o.Pid
inner join users u on u.UserId=o.UserId

select o.Oid,o.Pid,p.Pname,p.Price,p.Company,u.Uname
from orders o
left join product p on p.Pid=o.Pid
left join users u on u.UserId=o.UserId

select o.Oid,o.Pid,p.Pname,p.Price,p.Company,u.Uname
from orders o
full join product p on p.Pid=o.Pid
full join users u on u.UserId=o.UserId


--------------------------------- 

--Cross Joins---
------------------------------
drop table Color
create table Color
( Colr_id int primary key,
  Colr_name varchar(20)
)

insert into Color (Colr_id,Colr_name) values(101,'Blue'),
                                            (102,'Red'),
											(103,'Green'),
											(104,'Yellow'),
											(105,'Pink'),
											(106,'Purple')
											select * from Color
 create table Size
 (
  Size_id int primary key,
  Size_name varchar (10),
  --foreign key (Colr_id)references Color(Colr_id)
 )

 insert into Size(Size_id,Size_name) values(1,'S'),
                                            (2,'M'),
											   (3,'L'),
											      (4,'XL'),
												     (5,'XXL'),
													    (6,'XXXL')

select * from Color cross join Size

---------------------------------------------------------------
--Self Join
---------------------------------------------------------------
select * from Employee

select e1.name as'earn high',e1.salary, e2.name as 'earn less',e2.salary
from Employee e1,Employee e2
where e1.salary> e2.salary


select e1.name as'age greater',e1.age, e2.name as 'Less age',e2.age
from Employee e1,Employee e2
where e1.age> e2.age


-- manager id add-->
alter table Employee add manager_id int

update Employee set manager_id=4 where id in (1,2,5,6)

select e1.name 'Employee', e2.name as 'Manager'
from Employee e1, Employee e2
where e1.manager_id=e2.id


update Employee set manager_id=15 where id in (11,12,13,14)
select e1.name 'Employee',e2.name as 'Manager'
from Employee e1,Employee e2
where e1.manager_id=e2.id

update Employee set manager_id=10 where id in (4,7,8,9,15)
select e1.name 'Employee',e2.name as 'Manager'
from Employee e1,Employee e2
where e1.manager_id=e2.id


