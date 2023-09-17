CREATE TABLE Author (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(255),
    ph_no VARCHAR(20),
    email VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(100)
)
select * from Author

insert into Author (author_id,author_name,ph_no,email, address, city)VALUES(101,'Lewis Wallace','7875090559','benhur@gmail.com','Shivaji Chowk','pune'),
                          (102,'R.K Narayan','7585749990','rknar@gmail.com','near relvey st','Mumbai'),
						  (103,'Rohinton Mistry','90126374889','rohint@gmail.com','ganesh nagar','Thane'),
						  (104,'Vikram Sheth','7875647889','viksheth@gmail.com','sai chowk','solapur'),
						  (105,'amitav ghosh','46765857899','amitghosg@gmail.com','Western mall','Aurangabad')


CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    book_name VARCHAR(255),
    author_id INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
)
 insert into Book(book_id,book_name,author_id,price)
                   VALUES (201,'Ben Hur',101,850),
                          (202,'The Guide',102,900),
						  (203,'A Fine Balance',103,640),
						  (204,'A suitable Boy',104,550),
						  (205,'The glass palace',105,630)
						  select * from Book
CREATE TABLE AwardType (
    award_type_id INT PRIMARY KEY,
    award_name VARCHAR(255),
    award_price DECIMAL(10, 2)
)
insert into AwardType(award_type_id,award_name,award_price)
            VALUES(301,'Best Author of the year',50000),
			      (302,'Famous Book of the year',30000),
				  (303,'Author of the year',40000),
				  (304,'National book',60000),
				  (305,'NewBery Medal',70000)
				  select * from AwardType

CREATE TABLE Award (
    award_id INT PRIMARY KEY,
    award_type_id INT,
    author_id INT,
    book_id INT,
    year INT,
    FOREIGN KEY (award_type_id) REFERENCES AwardType(award_type_id),
    FOREIGN KEY (author_id) REFERENCES Author(author_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
)

insert into Award(award_id,award_type_id,author_id,book_id,year)
            VALUES(401,301,101,201,2023),
			      (402,302,102,202,2022),
				  (403,303,103,203,2021),
				  (404,304,104,204,2020),
				  (405,305,105,205,2019)
				  select*from Award
				 


 