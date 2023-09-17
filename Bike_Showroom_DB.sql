create database BikeShowroom
use[BikeShowroom]


create table Model
(
 Model_id int primary key,
 Model_name varchar(20),
 Cost numeric (15,2)
)

-------------------------------------------------------------------------------------------
--Table Name: Customer
-------------------------------------------------------------------------------------------
create table Customer 
(
Cust_id int primary key,
First_name varchar(25) not null,
Last_name varchar(25) not null,
mobile_num varchar(15),
gender char(1) not null,
email varchar(20)
)


--------------------------------------------------------------------------------------------------
--Table Name:Payment

create table Payment
(
Payment_id int primary key,
Payment_type varchar(25)not null
)
--------------------------------------------------------------------------------------------------

-- Table Name : Feedback_rating

create table Feedback_rating
(
 Rating_id int primary key,
 Rating varchar(20) not null
)










-------------------------------------------------------------------------------------------
--Table name:Purchase

create table Purchase
(
 Purchase_id int primary key,
 Cust_id int,
 Model_id int,
 Book_amount numeric(10,2),
 Payment_id int,
 Purchase_date date,
 rating int,

 foreign key (Cust_id)references Customer(Cust_id),
 foreign key(Model_id)references Model(Model_id),
 foreign key(Payment_id) references Payment(Payment_id)

)
