use[DP_Titans]
create table Customer(
C_id int primary key,
C_city varchar(20),
C_country varchar(20),
postalCode varchar(30) not null
)

insert into Customer(C_id,C_city,C_country,postalCode )
            values(101,'New York','USA','100001'),
			       (102,'London','UK','12345'),
				   (103,'Berlin','Germany','233455'),
				   (104,'Paris','France','56789'),
				   (105,'Tokoyo','UK','100-00'),
				   (106,'Sydny','Austriliya','100666'),
				   (107,'oslo','Norvey','56a678'),
				   (108,'Amsterdam','netherland','1076788'),
				   (109,'Pune','INDIA','910000'),
				   (110,'Karachi','Pakisthan','1004431')
				   select * from Customer
-----------------------------------------------------------------------------------------------
--1) write a statement that will select city column from customer table
select C_city from Customer
-----------------------------------------------------------------------------------------------
-- 2) select all the different values from the country column in the customer table
select distinct C_country from Customer
select C_country from Customer
------------------------------------------------------------------------------------------------
--3) select all records where city column has value "London"
select * from Customer where C_city='London'
------------------------------------------------------------------------------------------------
--4) use the not keyword to select all records where city is not "berlin"
select * from Customer where C_city<>'Berlin'
------------------------------------------------------------------------------------------------
--5) Select all records where the CustomerID column has the value 105.
select * from Customer where C_id=105
------------------------------------------------------------------------------------------------
--6) Select all records where the City column has the value "Berlin" and the PostalCode column has the value 233455.
select * from Customer where C_city='Berlin' AND postalcode=233455
------------------------------------------------------------------------------------------------
--7) Select all records where the City column has the value "Berlin" or "London".
    select * from Customer where C_city in('Berlin','London')
------------------------------------------------------------------------------------------------
--8) Select all records from the Customers table, sort the result alphabetically by the column City.
 select * from Customer order  by C_city 
 ----------------------------------------------------------------------------------------------------
 --9) Select all records from the Customers table, sort the result reversed alphabetically by the column City.
 select * from Customer order by C_city Desc
 ------------------------------------------------------------------------------------------------------
 --10) Select all records from the Customers table, sort the result alphabetically, first by the column Country, then, by the column City
 select * from Customer order by C_Country asc,C_city asc
 ---------------------------------------------------------------------------------------------------------
 --11) Select all records from the Customers where the PostalCode column is empty.
 select * from Customer where postalcode is null
 ---------------------------------------------------------------------------------------------------------
 --12) Select all records from the Customers where the PostalCode column is NOT empty.
 select * from Customer where postalcode is not null
 ----------------------------------------------------------------------------------------------------------
 --13) Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value 'Norway'.
 update Customer set C_city='oslo' where C_country='Norvey'
 select * from Customer
 -------------------------------------------------------------------------------------------------------------
 --14) Delete all the records from the Customers table where the Country value is Norway.
 delete from Customer where C_country='Norvey'
 select * from Customer
 ---------------------------------------------------------------------------------------------------------------
 --15)Select all records where the value of the City column starts with the letter  "a".
 select * from Customer where C_city like 'a%'
 ---------------------------------------------------------------------------------------------------------------
 --16)Select all records where the value of the City column ends with the letter "a".
 select *from Customer where C_city like'%a'
 ---------------------------------------------------------------------------------------------------------------
 --17)Select all records where the value of the City column contains the letter "a".
 select * from Customer where C_city like  '%a%'
 ---------------------------------------------------------------------------------------------------------------
 --18) Select all records where the value of the City column starts with letter "a" and ends with the letter "b".

 select * from Customer where C_city like  'a%b'
 ----------------------------------------------------------------------------------------------------------------
 --19) Select all records where the value of the City column does NOT start with the letter "a".
 select * from Customer where C_city not like 'a%'
 ----------------------------------------------------------------------------------------------------------------
 --20) Select all records where the second letter of the City is an "a".
 select * from Customer where C_city like '_a%'
 ----------------------------------------------------------------------------------------------------------------
 --21) Select all records where the first letter of the City is an "a" or a or "c" or an "s".
 select * from Customer where C_city like'[acs]%'
 ----------------------------------------------------------------------------------------------------------------
 --22) Select all records where the first letter of the City starts with anything from an "a" to an "f".
 select * from Customer where C_city like '[a-f]%'
 -----------------------------------------------------------------------------------------------------------------
 --23) Select all records where the first letter of the City is NOT an "a"or a "c" or an "f".
 select * from Customer where C_city not like '[acf]%'
 ------------------------------------------------------------------------------------------------------------------
 --24) Use the IN operator to select all the records where the Country is either "Norway" or "France".
 select * from Customer where C_country in('Norvey','France')
 ------------------------------------------------------------------------------------------------------------------
--25)  Use the IN operator to select all the records where Country is NOT "Norway" and NOT "France".
select * from Customer where C_country not in ('Norvey','France')
-------------------------------------------------------------------------------------------------------------------
--26)When displaying the Customers table, make an ALIAS of the PostalCode column, the column should be called Pno instead.
select postalcode AS Pno from Customer
---------------------------------------------------------------------------------------------------------------------
--28) When displaying the Customers table, refer to the table as Consumers instead of Customers.
select * from Customer as Consumers
-----------------------------------------------------------------------------------------------------------------------
--29) List the number of customers in each country.
select C_country,count(*)as numOfcust from Customer group by C_country order by numOfcust desc
-----------------------------------------------------------------------------------------------------------------------
--30)List the number of customers in each country, ordered by the country with the most customers first.
select C_country,count(*)as numOfcust from Customer group by C_country order by numOfcust asc
----------------------------------------------------------------------------------------------------------------------
--==============================================================================================
 
--==============================================================================================