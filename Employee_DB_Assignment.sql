drop database Employee
create database Employee		
use[Employee]
----------------------------------------------------------------
-- Table name:Region
----------------------------------------------------------------
create table region
(
 Region_id int primary key,
 Region_Name varchar(25)
)

insert into region (Region_id,Region_Name)
            values(1,'india'),(2,'Iraq'),(3,'pakistan'),(4,'France'),(5,'Japan'),(6,'Kazakisthan'),(7,'Kambodia'),(8,'Shrilanka'),(9,'Nigeria'),(10,'Nepal')
			select * from region

----------------------------------------------------------------------
--table name : Countries
----------------------------------------------------------------------
create table Countries
(
 C_id char(2) primary key,
 C_name varchar(40),
 Region_id int ,
 foreign key(Region_id)references region(Region_id)
)
 drop table Countries
insert into Countries (C_id,C_name,Region_id)
            values(00,'India1',1),
			      (01,'Erbil',2),
				  (02,'Karachi',3),
				  (03,'Nice',4),
				  (04,'Kyoto',5),
				  (05,'Astana',6),
				  (06,'Siem Reap',7),
				  (07,'Kandy',8),
				  (08,'Abuja',9),
				  (09,'Pokhara',10)
				  select * from Countries

----------------------------------------------------------------------
--Table name :Location
-----------------------------------------------------------------------
create table Locations
(
 Loc_id int primary key,
 Street_add varchar(25),
 Postal_code varchar(20),
 City varchar(30),
 State_provience varchar(30),
 C_id char(2),
 foreign key (C_id) references Countries (C_id)
)
drop table Locations
select * from Locations

insert into Locations(Loc_id,Street_add,Postal_code,City,State_provience,C_id)
             values(101,'Rk chowk','411027','Pimple nilakh','Maharashtra',00),
			        (102,'east ','42344','Arbela','muhafazah',01),
					(103,'123 main st','98543','humnabad','lahore',02),
					(104,'556 main st','41187','shihan','islamabad',03),
					(105,'ky 123','849493','uji','Kyoto_fu',04),
					(106,'bihar 342','81110','nalanda','bihar',05),
					(107,'Rk chowk','411027','Pimple nilakh','Maharashtra',06),
					(108,'Rk chowk','411027','Pimple nilakh','Maharashtra',07),
					(109,'Rk chowk','411027','Pimple nilakh','Maharashtra',08),
					(110,'Rk chowk','411027','Pimple nilakh','Maharashtra',09)
					