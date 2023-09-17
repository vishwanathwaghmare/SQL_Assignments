------------------------------------------------------------------------------------------------
-- Assignment:2   Company: DataScan Information Pvt Ltd    
-- 
-----------------------------------------------------------------------------------------------



-------------------------------------------
--Database Name: Student
-------------------------------------------

create database Student
use [Student]

---------------------------------------------
--Table 1:Student                           
---------------------------------------------
create table student
(
S_id int primary key,
S_name varchar (40),
S_city varchar(20)
)

insert into student(S_id,S_name,S_city)
            values(1,'Ram','Pune'),
			      (2,'Sham','Mumbai'),
			      (3,'Sita','Pune'),
			      (4,'Gita','Nashik')
	select * from student	
	

-------------------------------------------------
--Table 2: Subjects
-------------------------------------------------

create table Subjects
(
 SubId int primary key,
 SubName varchar (25),
 MaxMarks int,
 Passing int
)
drop table Subjects
insert into Subjects(SubId,SubName,MaxMarks,Passing)
             Values(1,'Maths',100,40),
			        (2,'English',100,40),
					(3,'Marathi',50,15),
					(4,'Hindi',50,15)

					select * from Subjects
------------------------------------------------------
--Table 3:Exam
------------------------------------------------------

create table Exam
(
 S_id int,
 SubId int,
 Marks int,
 foreign key(S_id) references student (S_id),
 foreign key(SubId) references Subjects(SubId)
)
drop table Exam

insert into Exam(S_id,SubId,Marks)
            Values(1,1,100),
			       (1,2,85),
				   (1,3,40),
				   (1,4,45),
				   (2,1,35),
				   (2,2,55),
				   (2,3,25),
				   (3,1,95),
				   (3,2,87),
				   (3,3,45),
				   (3,4,42)
select * from Exam
-----------------------------------------------------------
-- primary Key in above table ==> S_id,SubId
-- Foreign Key in Above Table==>  S_id,SubId
-----------------------------------------------------------


--Assignment -1
---------------------------------------------------------------------------------
--a)  insert new Student (sid=5,sname= ramesh, city=hydrabad) into the student table

insert into student(S_id,S_name,S_city)values(5,'Ramesh','Hydrabad')
select * from student

----------------------------------------------------------------------------
--b) Change city of Sid=4(gita) to sangali

update Student set S_city='Sangali' where S_id=4
select * from student

---------------------------------------------------------------------------
--c) return list of all Students with column sid,name and city

select * from student

---------------------------------------------------------------------------
--d) return list containing column Sid,name,subName,Marks,MaxMarks,Percentage
select stud.*,sub.SubName
from student stud
inner join Subjects sub on sub.SubId=stud.S_id

select SubId,SubName,passing,MaxMarks,(passing*100/MaxMarks) as percentage 
from Subjects
select stud.*,sub.SubName
from student stud
inner join Subjects sub on sub.SubId=stud.S_id

SELECT
    s.S_id,
    s.S_name,
    sub.SubName AS SubName,
    sm.passing AS passing,
    sub.MaxMarks AS MaxMarks,
    (sm.passing * 100 / sub.MaxMarks) AS Percentage
FROM student s
JOIN (
    SELECT
        s.S_id,
        SubId,
        passing
    FROM student s
   CROSS JOIN subjects sub
) sm ON s.S_id = sm.S_id
JOIN subjects sub ON sm.SubId = sub.SubId



----------------------------------------------------------------------------- 
