use [DP_Titans]
---------------------------------------------------------------------------------------------------------
create table EmployeeInfo
(
 EmpId int primary Key,
 EmpFname varchar (20),
 EmpLname varchar (20),
 Department varchar(20),
 Project varchar (10),
 Address varchar(20),
 DOB date ,
 Gender varchar(10)
)
insert into EmployeeInfo(EmpId,EmpFname,EmpLname,Department,Project,Address,DOB,Gender)
            Values(1,'Rohit','Gupta','Admin','P1','Delhi','12/02/1979','Male'),
			       (2,'Rahul','Mahajan','Admin','P2','Mumbai','10/10/1986','Male'),
				   (3,'Soniya','Banerjee','HR','P3','Pune','06/05/1983','Female'),
				   (4,'Ankita','Kpoor','HR','P4','Chennai','11/28/1983','Female'),
				   (5,'Swati','Garg','HR','P5','Delhi','04/06/1991','Female')

				   select * from EmployeeInfo
---------------------------------------------------------------------------------------------------------
create table EmployeePosition
(
 EmpId int,
 EmpPosition varchar(20),
 DateOfJoining date,
 Salary int
)

insert into EmployeePosition values(1,'Executive','2020/4/1',75000)
insert into EmployeePosition values(2,'Manager','2020/4/3',50000)
insert into EmployeePosition values(3,'Manager','2020/4/2',150000)
insert into EmployeePosition values(2,'Officer','2020/4/2',90000)
insert into EmployeePosition values(1,'Manager','2020/4/3',300000)

--------------------------------------------------------------------------------------------------------
select * from EmployeePosition

--1. Create a query to generate the first records from the EmployeeInfo table.
 select top 1 * from EmployeeInfo order by EmpId
-------------------------------------------------------------------------------------------------------
--2. Create a query to generate the last records from the EmployeeInfo table.
   
   select top 1 * from EmployeeInfo order by EmpId desc
-------------------------------------------------------------------------------------------------------
--3. Create a query to fetch the third-highest salary from the EmpPosition table.

select e1.*,p1.Salary
from EmployeeInfo e1
inner join EmployeePosition p1 on p1.EmpId=e1.EmpId
order by p1.Salary desc
offset 2 rows 
fetch next 1 rows only

-------------------------------------------------------------------------------------------------------
--4. Write a query to find duplicate records from a table.

select EmpId,count(empid) as 'count' from EmployeePosition
	 group by EmpId
	 having count(empid)>1

------------------------------------------------------------------------------------------------------

--5. Create an SQL query to fetch EmpPostion and the total salary paid for each employee position.

 select empPosition,sum(salary) from EmployeePosition
	 group by empPosition 
-----------------------------------------------------------------------------------------------------
--6. find the employee who has max salary
select top 1 e1.*, p1.salary from EmployeeInfo e1
	   inner join EmployeePosition p1 on p1.empId=e1.empId
	   order by p1.salary desc

------------------------------------------------------------------------------------------------------
--7 find the employee who has max salary from Admin department
select top 1 e1.*, p1.salary from EmployeeInfo e1
	   inner join EmployeePosition p1 on p1.empId=e1.empId
	   where e1.department='Admin'
	   order by p1.salary desc
-----------------------------------------------------------------------------------------------------
	 
--8 find the age of each employee
 select *, year(cast(GETDATE() as date))-year(cast(dob as date)) as 'Age' from EmployeeInfo

-----------------------------------------------------------------------------------------------------

--9 display only female employee details
select * from EmployeeInfo where gender='Female'
-----------------------------------------------------------------------------------------------------
--10 display employee whos position is executive
select  e1.*, p1.salary,p1.empPosition from EmployeeInfo e1
	   inner join EmployeePosition p1 on p1.empId=e1.empId
	   where p1.empPosition='Executive'

-----------------------------------------------------------------------------------------------------
--11 display count of employee in each city

 select address,count(empid)as 'count' from EmployeeInfo
 group by address

 ----------------------------------------------------------------------------------------------------
