--create database DPtitans
--use[DPtitans]

--------------------------------

-----04/09/2023--------------

use[DP_Titans]
------create table--------
CREATE TABLE Student(
rollno int,
name Varchar(20),
percentage numeric(6,2),
dob date
)

-----add column to existing table-----
alter table Student add country varchar(20)

-----remove column from existing table-----
--alter table Students drop column country

------rename column name-----
--exec sp_rename 'Students.name','StudentName'

-----new database Employee---------
create database Employee
use[Employee]
create table emp(empid int,empname varchar,empsal int , empdob date,empadd varchar)
alter table emp add country varchar(20)
alter table emp drop column country
exec sp_rename 'emp.empname','Name'

