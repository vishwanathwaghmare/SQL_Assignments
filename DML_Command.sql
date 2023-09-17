select * from Students
drop table Students
create table Students
(
 RollNo int primary key,
 name varchar(20)not null,
 email varchar(40) unique,
 marks int check(marks>=35),


)
----------------------------------------------------
--DML=> insert,delete,update

----------------------------------------------------
--select and insert command
select * from Students
insert into Students values(1,'Vishwanath','vishwanath@123',80)
insert into Students values(2,'Sagar','sagar123@gmail.com',50)
insert into Students values(3,'suraj','suraj3@gmail.com',80)
insert into Students values(4,'Vaibhav','vaibhav@gmail.com',60)
insert into Students values(5,'riya','riya@123',70)
insert into Students values(6,'payal','payal2@gmail.com',60)
insert into Students values(7,'ganesh','ganesh@123.com',45)
insert into Students values(8,'vishal','vishal@123gmail.com',68)
insert into Students values(9,'sonam','sonam2@gmail.com',80)
insert into Students values(10,'naresh','naresh45@gmail.com',90)
insert into Students values(11,'sahil','sahil45@gmail.com',90)
insert into Students values(12,'subhash','subhash44@gmail.com',90)
insert into Students values(13,'megha','megha67gmail.com',90)
insert into Students values(14,'aarya','aarya555@gmail.com',90)
insert into Students values(15,'sandhya','sandhya@gmail.com',90)
select * from Students

--update command=> to modify the data

update Students set marks=95 where RollNo=2

select * from Students

update Students set email='sandhya123@gmail.com',marks=70 where RollNo=15
select * from Students

alter table Students add city varchar(20)
select * from Students

update Students set city='Pune'where RollNo in(1,4,5,7)
select * from Students
update Students set city='mumbai'where RollNo in(2,6,8,10,15)
update Students set city='Pune'where RollNo in(3,9,11,12,13,14)
select * from Students

--delete command
delete from Students where RollNo=14
--delete from Students where city='pune'

--------------------------------------------------------
--*****DQL (data query language)=> select/get/fetch*****----
--------------------------------------------------------
select * from Students
--* indicates all column
--select query use to fetch data

--to show perticular column we can use below query
select name,marks from Students

--Alias to the colums => as
select name as 'Students Name' from  Students
select * from Students

--select with where =>use to filter the data,or match data
select *from Students where RollNo=1
select *from Students where city='pune'
select *from Students where city='mumbai'


--fetch data of students whose marks is <,>,<>,=,
select *from Students where marks<60
select *from Students where marks>60
select *from Students where marks=90
select *from Students where marks<>90 and marks<>60

insert into Students values(16,'Nisha','nisha@123.com',75,'delhi')
select * from Students
insert into Students values(14,'mahesh','mahesh@gmail.com',55,'delhi')

--Distinct -->use to get unique record

select distinct city from Students
select distinct marks from Students
select distinct name from Students

-- and --> all the condition should be true
select * from Students where marks<60 and city='pune'

-- or--> either one is true
select *from Students where city='pune' or city='solapur'
select *from Students where city='pune' or city='delhi'

--between and -->range - when you want to fetch records between range
select * from Students where marks between 60 and 90
select * from Students where RollNo between 10 and 15

--in clouse--> match the multiple selection
select *from Students where RollNo in(10,12,14,16)
select *from Students where city in('mumbai','delhi')

--not in clouse--> skip the records
select *from Students where city not in('mumbai','delhi')
select *from Students where RollNo not in(10,12,14,16)

-- null and not null


select * from Students
select * from Students where city is null
select * from Students where city is not null

-- LIKE clause=> use to search letter in string
select * from Students where name like 'v%' -- start with v
select * from Students where name like '%a' --end with a
select * from Students where name like '%i%' --i present in word
select * from Students where name like'%[inl]%'
select * from Students where name like '[v-w]%'-- letter start with v and w
select * from Students where name like 'v_____'
select * from Students where name like '____w_____'-- middle letter 
select * from Students where city like '__n_'
select * from Students where city like '%i'
select * from Students where city like '%[ma]%'
select * from Students where email like '%[12]%'
select * from Students where email like '%v%'

--NOT LIKE
select * from Students where name not like 'v%' -- start with v
select * from Students where name not like '%a' --end with a
select * from Students where name not like '%i%' --i present in word
select * from Students where name not like'%[inl]%'
select * from Students where name not like '[v-w]%'-- letter start with v and w
select * from Students where name not like 'v_____'
select * from Students where name not like '____w_____'-- middle letter 
select * from Students where city not like '__n_'
select * from Students where city not like '%i'
select * from Students where city not like '%[ma]%'
select * from Students where email not like '%[12]%'
select * from Students where email not like '%v%'

-- order by --> to sort data based on col specied
select * from Students order by name -- asc name
select * from Students order by name  desc-- desc name
select * from Students order by marks     -- asc marks
select * from Students order by marks desc
select * from Students order by marks,name,email -- multiple column with asc

-----------------------------------------------------------------
--Limiting the records in sql using TOP , offset and fetch 
-- desplay student who have highest to lowest marks
-----------------------------------------------------------------
select top 5 * from Students --- first 5 records 
select top 1* from Students order by marks desc-- top 1 marks
select top 3 * from Students order by marks desc
select top 1* from Students order by marks --- lowest marks

select top 5 *from Students order by RollNo desc -- last 5 records
select top 50 percent * from Students -- use of percent 

-- ties -- match data based on column that we specify in order
insert into Students values(17,'diksha','dk12@gmail.com',55,'solapur')
select top 3 with ties  * from Students order by marks 
select top 5 with ties  * from Students order by name desc

-- fetch --> select the records
-- offset --> skip records
-- ex display student who have 3rd highest marks
select * from Students order by marks desc offset 2 rows fetch next 1 rows only
select * from Students
select * from Students order by marks desc offset 8 rows fetch next 1 rows only-- 8th highest marks
select * from Students order by marks desc offset 2 rows fetch next 2 rows only -- 3rd and 4th highest marks
select * from Students order by marks  offset 2 rows fetch next 1 rows only --- 3rd lowest marks

--------------------------------------------------------
--AGGREGATE FUNCTION IN SQL=> max, min
-------------------------------------------------------

select max(marks)as 'max marks'from Students -- max marks
select min(marks)as 'min marks'from Students -- min marks
select avg(marks)as 'avg marks'from Students -- avg marks
select sum(marks)as 'sum marks'from Students -- sum of marks
select count(RollNo)as 'Total Count'from Students
select count(distinct city)as 'city'from Students