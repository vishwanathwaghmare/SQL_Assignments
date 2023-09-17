use[DP_Titans]
create table product
(Pid int primary key,
 Pname varchar(25),
 Price numeric(10,2),
 Company varchar(20)
)
select * from product

insert into product(Pid,Pname,Price,Company)
values(101,'Laptop',15000,'Dell'),
      (102,'Mobile',20000,'samaung'),
	  (103,'Tab',25000,'Hp'),
	  (104,'Pc',40000,'Dell'),
	  (105,'Smart_Board',70000,'Hp'),
	  (106,'Mouse',1000,'Dell'),
	  (107,'Mobile',20000,'Vivo'),
	  (108,'Laptop',40000,'HP'),
	  (109,'RAM',2000,'4GB'),
	  (110,'PC',50000,'HP')

	  select * from product

	  select * from product where Price<2000                -- show the price <2000
	  select * from product where Company='HP'              -- show company name is HP
	  select * from product where Price between 2000 and 20000 -- show price between 2000 and 20000
	  select Distinct Company from product                     --show unique company name fro tabe 
	  select * from product where Company in('Dell','HP')   --show company name of dell and hp
	  select * from product
	  select*from product where Pid not in(102,105,109)    --product not in given range
	  select*from product where Pid  in(103,106,110)      -- product in given range
	  select*from product where Pid not in(102,105,109)
	  insert into product values(111,'mobile',23000,'LG') --new  product inserted
	  select * from product
	 ---------------------------------------------------------------------------------------------
	  -- 10) Use the MIN function to select the record with the smallest value of the Price column.
	  select * from product where Price=(select min(Price)from product)
	  ----------------------------------------------------------------------------------------------
	  --11)Use an SQL function to select the record with the highest value of the Price column.
	  select * from product where Price=(select max(Price)from product)
	  -----------------------------------------------------------------------------------------------
	  --12) Use the correct function to return the number of records that have the Price value set to 20
	  select count(*) from product where Price=20
	  ------------------------------------------------------------------------------------------------
	  --13) Use an SQL function to calculate the average price of all products.
	  select avg(Price)from product
	  ------------------------------------------------------------------------------------------------
	  --14) Use an SQL function to calculate the sum of all the Price column values in the Products table
	  select sum(Price)from product
	  -------------------------------------------------------------------------------------------------
	  --15)Use the BETWEEN operator to select all the records where the value of the Price column is between 1000 and 5000
	  select * from product where Price between 1000 and 5000
	  ----------------------------------------------------------------------------------------------------
	  --16)Use the BETWEEN operator to select all the records where the value of the Price column is NOT between 1000 and 5000.
	  select * from product where price not between 1000 and 5000
	  --------------------------------------------------------------------------------------------------------
	  --17) Use the BETWEEN operator to select all the records where the value of the ProductName column is alphabetically between "laptop "and  "mobile".
	  select * from product where Pname between 'laptop' and 'mobile'
	  --------------------------------------------------------------------------------------------
