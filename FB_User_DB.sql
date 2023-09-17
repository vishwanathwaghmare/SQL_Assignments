create database FBUsers
use[FBUsers]

create table FbUser
(
 U_id int primary key,
 UserName varchar(25),
 Email varchar(25),
 Phone varchar(25),
 TotalPost int

)
insert into FbUser(U_id,UserName,Email,Phone,TotalPost)
            Values(101,'Vishwanath','vishwa@gmail.com','7875090559',10),
			       (102,'Sagar','sagar@gmail.com','9875234559',15),
				   (103,'Vishnavi','vishnavi@gmail.com','8765362219',20),
				   (104,'Suraj','suraj@gmail.com','9863590559',12),
				   (105,'Neha','Neha@gmail.com','7646748329',21)

				   select * from FbUser

create table Post
(
Post_id int primary key,
U_id int,
PostCount int,
PostImage varchar(40),
postVideo varchar(40)
foreign key (U_id) references FbUser(U_id)
)

insert into Post(Post_id,U_id,PostCount,PostImage,postVideo)
            Values(201,102,15,'Photos.jpg',null),
			       (202,101,20,'Pic.jpg','funnyVideo.mp4'),
				   (203,103,12,'Family.img','cartoons.mp4'),
				   (204,104,60,'group.jpg','eventVideo.mp4'),
				   (205,105,40,'vaction.jpg','DanceVideo.mp4')

				   select * from Post

create table FriendshipStatus
(
 Status_code int primary key,
 Statuss varchar(50)
)

insert into FriendshipStatus
             values(1,'Family'),
			        (2,'Friend'),
					(3,'Colleague'),
					(4,'Classmate')

					select* from FriendshipStatus

create table Friendship
(
 U_id int,
 Friend_id int primary key,
 Statuss varchar(50)
 foreign key (U_id)references FbUser(U_id)
)


insert into Friendship(U_id,Friend_id,Statuss) 
               values(101,111,'Family'),
			          (102,112,'Friend'),
					  (103,113,'Colleague'),
					  (104,114,'Classmate'),
					  (105,115,'Family')
			          
					  select* from Friendship