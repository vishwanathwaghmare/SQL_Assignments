create table Movie
(
movie_id int primary key,
movie_name varchar(40)not null,
release_year int,
box_office_collection DECIMAL(10,2)
)


insert into Movie(movie_id,movie_name,release_year,box_office_collection)
            VALUES(101,'DDLJ',1995,53.31),
			       (102,'DANGAL',2016,20.24),
				   (103,'RRR',2022,13.6),
				   (104,'GADAR-2',2023,630.30),
				   (105,'PATHAAN',2023,500.4)

				   select*from Movie

create table Role
(
 role_id int primary key,
 role_name varchar(50)
)

insert into Role(role_id,role_name)
            VALUES(201,'Director'),
			      (202,'Producer'),
				  (203,'Hero'),
				  (204,'Heroien'),
				  (205,'Villain')

				  select * from Role

create table Celebrity
(
celebraty_id int primary key,
celebrity_name varchar(40) not null,
birthdate DATE,
phone_no varchar(15),
email varchar(50)
)

insert into Celebrity( celebraty_id,celebrity_name,birthdate,phone_no,email)
            VALUES(301,'Saif Ali khan','16 AUG 1970','97655677291','saifalikhan@gmail.com'),
			       (302,'Ranveer singh','6 JUL 1985','75758949303','ranveersingh@gmail.com'),
				   (303,'Anil Kapoor','24 DEC 1956','6782889122','anilkapoor@gmail.com'),
				   (304,'John Abraham','17 Dec 1972','6737282991','john@gmail.com'),
				   (305,'Amitabh Bacchan','11 Oct 1942','92872673721','amitabh@gmail.com')

				   select * from Celebrity

create table BollywoodData
(
 b_id int primary key,
 celebraty_id int,
 movie_id int,
 role_id int,
 foreign key(celebraty_id) references Celebrity(celebraty_id),
  foreign key(movie_id) references Movie(movie_id),
   foreign key(role_id) references Role(role_id)

)

insert into BollywoodData(b_id,celebraty_id,movie_id,role_id)
            values(401,301,101,201),
				   (402,302,102,202),
				   (403,303,103,203),
				   (404,304,104,204),
				   (405,305,105,205)
				   --(406,306,106,206)
select*from BollywoodData